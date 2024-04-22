<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubKriteria extends Model
{
    use HasFactory;
    protected $guarded = ['id'];

    public function getRouteKeyName()
    {
        return 'uuid';
    }
    public function getSub($kriteria_uuid)
    {
        return SubKriteria::where('kriteria_uuid', $kriteria_uuid)->get();
    }
}
