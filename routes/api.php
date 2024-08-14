<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\GuestController;
use App\Http\Controllers\Api\AdController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::controller(AuthController::class)->group(function () {
    Route::post('login', 'login');
    Route::post('register', 'register');
    Route::get('logout', 'logout')->middleware('auth:sanctum');
});

Route::controller(GuestController::class)->group(function () {
    Route::get('guest/home', 'home');
    Route::get('guest/ads', 'adsIndex');

});



Route::middleware('auth:sanctum')->prefix('user')->group(function () {
    Route::get('home', [UserController::class, 'home']);
    Route::get('profile', [UserController::class, 'getUserProfile']);
    Route::post('profile/edit', [UserController::class, 'editProfile']);

    Route::post('createAd', [AdController::class, 'createAd']);
    Route::get('ads', [AdController::class, 'index']);
    Route::get('ad/{id}', [AdController::class, 'adDetails']);

});
