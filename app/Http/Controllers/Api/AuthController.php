<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\User;
use Illuminate\Support\Facades\Hash;
use App\Http\Requests\StoreUserRequest;
use App\Http\Requests\UserLoginRequest;
use App\Http\Requests\UserRequest;
use Illuminate\Support\Facades\Auth;

use App\Traits\HttpResponses;

class AuthController extends Controller
{
    use HttpResponses;

    public function login(UserLoginRequest $request)
    {
        $request->validated($request->all());

        if(!Auth::attempt($request->only(['email','password'])))
        return $this->error('','Credential do not match',401);

        $user=User::where('email',$request->email)->first()->load(['country', 'city'])->makeHidden(['country_id', 'city_id']);

        return $this->success([
            'user'=>$user,
            'token'=>$user->createToken('Api Token of ' .$user->name)->plainTextToken
        ]);
    }
    public function register(UserRequest $request)
    {
        $request->validated($request->all());
        $user = User::create([
            'first_name' => $request->first_name,
            'last_name' => $request->last_name,
            'email' => $request->email,
            'password' => bcrypt($request->password),
            'phone_number' => $request->phone_number,
            'nationality' => $request->nationality,
            'job' => $request->job,
            'account_type' => $request->account_type,
            'birthday' => $request->birthday,
            'country_id' => $request->country_id,
            'city_id' => $request->city_id,
            'marital_status' => $request->marital_status,
            'gender' => $request->gender,
        ]);
        $user->load(['country', 'city']);
        $user->makeHidden(['country_id', 'city_id']);

        return $this->success([
            'user'=>$user,
            'token'=>$user->createToken('API Token of ' .$user->id)->plainTextToken
        ]);
    }
    public function logout()
    {
        Auth::user()->currentAccessToken()->delete();
        return $this->success([
            'message'=>'you have seccessfully logged out and your token has been deleted'
        ]);
    }

}
