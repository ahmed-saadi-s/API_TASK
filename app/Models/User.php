<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Carbon; // تأكد من استيراد Carbon
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens,HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'profile_picture',
        'first_name',
        'last_name',
        'email',
        'email_verified_at',
        'password',
        'phone_number',
        'birthday',
        'gender',
        'nationality',
        'country_id',
        'city_id',
        'account_type',
        'job',
        'marital_status'
    ];
    public function country()
    {
        return $this->belongsTo(Country::class)->select('id', 'name');
    }

    public function city()
    {
        return $this->belongsTo(City::class)->select('id', 'name');
    }



    public function ads()
    {
        return $this->hasMany(Ad::class);
    }
    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
        'email_verified_at',

    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',

            'password' => 'hashed',
            'birthday' => 'date:Y-m-d',
        ];
    }
}
