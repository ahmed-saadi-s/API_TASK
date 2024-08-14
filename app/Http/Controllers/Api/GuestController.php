<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\AdResource;
use App\Traits\HttpResponses;
use App\Models\Ad;

class GuestController extends Controller
{
    use HttpResponses;

    public function home()
    {
        $roommateAds = Ad::select('id', 'title', 'ad_type', 'residence_type', 'availability_date', 'status', 'user_id')
            ->where('ad_type', 'roommate')
            ->latest()
            ->take(3)
            ->with('user', 'images')
            ->get()
            ->map(function ($ad) {
                $ad->image = $ad->getFirstImage();
                return new AdResource($ad);
            });

        $placeAds = Ad::select('id', 'title', 'ad_type', 'residence_type', 'availability_date', 'status', 'user_id')
            ->where('ad_type', 'place')
            ->latest()
            ->take(3)
            ->with('user', 'images')
            ->get()
            ->map(function ($ad) {
                $ad->image = $ad->getFirstImage();
                return new AdResource($ad);
            });

        $ads = $roommateAds->concat($placeAds);

        return $this->success([
            'ads' => $ads,
        ]);
    }

    public function adsIndex()
    {
        $roommateAds = Ad::select('id', 'title', 'ad_type', 'residence_type', 'availability_date', 'status', 'user_id')
        ->where('ad_type', 'roommate')
        ->latest()
        ->with('user', 'images')
        ->get()
        ->map(function ($ad) {
            $ad->image = $ad->getFirstImage();
            return new AdResource($ad);
        });

    $placeAds = Ad::select('id', 'title', 'ad_type', 'residence_type', 'availability_date', 'status', 'user_id')
        ->where('ad_type', 'place')
        ->latest()
        ->with('user', 'images')
        ->get()
        ->map(function ($ad) {
            $ad->image = $ad->getFirstImage();
            return new AdResource($ad);
        });

    $ads = $roommateAds->concat($placeAds);

    return $this->success([
        'ads' => $ads,
    ]);
    }
}

