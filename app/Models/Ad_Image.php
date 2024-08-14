<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ad_Image extends Model
{
    use HasFactory;
    protected $table = 'ad_images';

    protected $fillable = [
        'ad_id',
        'image_path',
    ];
    protected $hidden=[
        'created_at',
        'updated_at'
    ];
    public function ad()
    {
        return $this->belongsTo(Ad::class);
    }

}
