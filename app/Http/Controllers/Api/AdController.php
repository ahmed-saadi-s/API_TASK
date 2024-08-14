<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\AdRequest;
use App\Http\Resources\AdResource;
use App\Models\Ad;
use App\Models\Ad_Image;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Traits\HttpResponses;
class AdController extends Controller
{
    use HttpResponses;
    public function index()
    {
        $user = Auth::user();
        if ($user->account_type == 'seeking_roommate') {
            $ads = Ad::select('id', 'title', 'ad_type', 'residence_type', 'availability_date', 'status', 'user_id')
            ->where('ad_type', 'place')
            ->where('user_id', '!=', $user->id)
            ->get()->map(function ($ad) {
                $ad->image = $ad->getFirstImage();
                return new AdResource($ad);
            });
        }
         else {
            $ads = Ad::select('id', 'title', 'ad_type', 'residence_type', 'availability_date', 'status', 'user_id')
            ->where('ad_type', 'roommate')
            ->where('user_id', '!=', $user->id)
            ->get()->map(function ($ad) {
                $ad->image = $ad->getFirstImage();

                return new AdResource($ad);
            });
        }

        return $this->success([
            'ads' => $ads,
        ]);
    }
    public function createAd(AdRequest $request)
    {
        $user = Auth::user();
        $validated = $request->validated();
        $ad = new Ad($validated);
        $ad->user_id = $user->id;
        if($user->account_type=='seeking_roommate')
        $ad->ad_type = 'roommate';
        else
        $ad->ad_type = 'place';
        $ad->save();

        // حفظ الصور
        if ($request->hasFile('images')) {
            foreach ($request->file('images') as $image) {
                $imageName = time().'_'.$image->getClientOriginalName();
                $image->move(public_path('ads_images'), $imageName);
                $adImage = new Ad_Image();
                $adImage->ad_id = $ad->id;
                $adImage->image_path = 'ads_images/' . $imageName;
                $adImage->save();
            }

        }
        return $this->success([],'Ad has been successfully saved') ;

    }

    public function adDetails($id)
    {
        $ad = Ad::with('images', 'country', 'city', 'user')->find($id);

        if ($ad) {

            $adResource = new AdResource($ad);

            return $this->success([
                'ad' => $adResource, // إرسال الـ AdResource بدلاً من الـ Ad مباشرة
            ]);
        }

        return $this->error([], 'The requested ad was not found', 404);
    }
}
