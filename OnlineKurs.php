<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OnlineKurs extends Model
{
    //
		protected $fillable = ['kursid', 'kursadi', 'aciklama', 'egitmenid', 'kategoriid', 'fiyat'];
		protected $primaryKey = 'kursid';
		public $timestamps = false;
}
