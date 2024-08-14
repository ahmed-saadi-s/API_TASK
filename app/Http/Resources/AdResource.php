<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class AdResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  Request  $request
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        // بناء مصفوفة النتائج
        $attributes = [
            'title' => $this->title,
            'ad_type' => $this->ad_type,
            'residence_type' => $this->residence_type,
            'budget' => $this->budget,
            'availability_date' => $this->availability_date instanceof \Carbon\Carbon
                ? $this->availability_date->format('Y-m-d')
                : $this->availability_date,
            'location_description' => $this->location_description,
            'country_name' => $this->country ? $this->country->name : null,
            'city_name' => $this->city ? $this->city->name : null,
            'room_size' => $this->room_size,
            'number_of_rooms' => $this->number_of_rooms,
            'number_of_bathrooms' => $this->number_of_bathrooms,
            'furnished' => $this->furnished !== null ? (bool) $this->furnished : null,
            'smoking_allowed' => $this->smoking_allowed === 1 ? 'Allowed' : ($this->smoking_allowed === 0 ? 'Not Allowed' : null),
            'pets_allowed' => $this->pets_allowed === 1 ? 'Allowed' : ($this->pets_allowed === 0 ? 'Not Allowed' : null),
            'contact_email' => $this->contact_email,
            'notes' => $this->notes,
            'contact_phone' => $this->contact_phone,
            'status' => $this->status,
            'partner_age_min' => $this->partner_age_min,
            'partner_age_max' => $this->partner_age_max,
            'partner_gender' => $this->partner_gender,
            'created_at' => $this->created_at instanceof \Carbon\Carbon
                ? $this->created_at->toIso8601String()
                : $this->created_at,
            'updated_at' => $this->updated_at instanceof \Carbon\Carbon
                ? $this->updated_at->toIso8601String()
                : $this->updated_at,
            'image_path' => $this->image ? $this->image->image_path : null,
        ];

        // إضافة صور فقط إذا كانت موجودة
        if ($this->whenLoaded('images') && $this->images->isNotEmpty()) {
            $attributes['images'] = $this->images->map(function ($image) {
                return $image->image_path;
            });
        }

        // إزالة القيم null من المصفوفة
        $attributes = array_filter($attributes, function ($value) {
            return $value !== null;
        });

        return [
            'id' => (string) $this->id,
            'attributes' => $attributes,
            'relationships' => array_filter([
                'user' => [
                    'id' => (string) $this->user->id,
                    'name' => $this->user->first_name . ' ' . $this->user->last_name,
                    'email' => $this->user->email,
                    'profile_picture' => $this->user->profile_picture,
                ],
            ]),
        ];
    }
}
