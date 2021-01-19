<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ders extends Model
{
    //
	protected $fillable = ['dersid', 'dersadi', 'aciklama', 'kursid'];
	protected $primaryKey = 'dersid';
	public $timestamps = false;
}
?>