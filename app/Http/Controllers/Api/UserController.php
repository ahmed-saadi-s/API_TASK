<?php

namespace App\Http\Controllers\Api;

use App\Http\Resources\AdResource;
use App\Models\Ad;
use Illuminate\Support\Facades\Auth;

use App\Models\User;
use App\Http\Controllers\Controller;
use App\Http\Requests\UpdateProfileRequest;
use Illuminate\Http\Request;
use App\Traits\HttpResponses;

class UserController extends Controller
{
    use HttpResponses;

    public function home()
    {
        $user = Auth::user();
        $userId = $user->id;
        $accountType = $user->account_type;

        if ($accountType === 'seeking_roommate') {
            $ads = Ad::select('id', 'title', 'ad_type', 'residence_type', 'availability_date', 'status', 'user_id')
                ->where('ad_type', 'place')
                ->where('user_id', '!=', $userId)
                ->latest()
                ->take(6)
                ->with('user', 'images')
                ->get()
                ->map(function ($ad) {
                    $ad->image = $ad->getFirstImage();
                    return new AdResource($ad);
                });
        } else {
            $ads = Ad::select('id', 'title', 'ad_type', 'residence_type', 'availability_date', 'status', 'user_id')
                ->where('ad_type', 'roommate')
                ->where('user_id', '!=', $userId)
                ->latest()
                ->take(6)
                ->with('user', 'images')
                ->get()
                ->map(function ($ad) {
                    $ad->image = $ad->getFirstImage();
                    return new AdResource($ad);
                });
        }

        return $this->success([
            'ads' => $ads,
        ]);
    }

    public function getUserProfile()
    {
        $user = Auth::user();
        $user->load(['country', 'city']);

        $user->makeHidden(['country_id', 'city_id']);

        return $this->success([
            'user'=>$user,
        ]);
    }
    public function editProfile(UpdateProfileRequest $request)
    {
        $user = Auth::user();
        $attributes = $request->only([
            'first_name',
            'last_name',
            'email',
            'phone_number',
            'nationality',
            'job',
            'account_type',
            'birthday',
            'country_id',
            'city_id',
            'marital_status',
            'gender',
        ]);
        $attributes = array_filter($attributes, function ($value) {
            return !is_null($value) && $value !== '';
        });
        $user->update($attributes);
        if ($request->hasFile('profile_picture')) {
            $profilePicture = time().'.'.$request->profile_picture->extension();
            $request->profile_picture->move(public_path('profile_pictures'), $profilePicture);
            $user->profile_picture ='profile_pictures/'.$profilePicture;
            $user->save();
        }
        $user->load(['country', 'city']);
        $user->makeHidden(['country_id', 'city_id']);
        return $this->success([
            'user' => $user,

        ],'User Updated Successfully');
    }
}
