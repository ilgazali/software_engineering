<html>
<head>
    <link rel="stylesheet" type="text/css" href="kurs.css">
    <link rel="shortcut icon" href="title.ico">
    <script>
		var count = 0;
function myfunction(x) {
	var x;
	
    	if(x == 1){
    		count = count+1;
    		console.log(count)
    	}

    	if(count == 1){
    		document.getElementById("change").style.background = 'red';
    	}
    	else if(count == 2){
    		document.getElementById("change").style.background = 'green';
    		count = 0;
    	}
  
}

</script>
	<title>ArtHouseOnline|Ders</title>
</head>
<body>
   
    <aside>
        <img src="logo.png" width="180px" height="120px"/>
      </aside>
<nav>
    <ul class="menu">
    <li>
        <a href="/onlinekurslarimiz"> ONLINE KURSLARIMIZ</a>
        <li>
            <a href="#"> EĞİTMENLERİMİZ </a>
          
        </li>
        <li>
            <a href="kayit"> AİLEMİZE KATILIN</a>
        </li>
        <li>
            <a href="egitmengiris"> EĞİTMEN GİRİŞİ</a>
        </li>
        <li>
            <a href="giris"> KURSİYER GİRİŞİ</a>
            </a>
        </li>
        <li>
            <nav class="cont active" id="cont">
                <header class="header">
                    <nav class="baslık-butonu">
                    <button><i class="fas fa-shopping-cart"></i></button>
                    <button><i class="fas fa-heart"></i></button>
                    <button><i class="fas fa-bell"></i></button>
                    <a href="/profil" class="avatar"><img src="avatar.jpg" alt=""></a>
                </nav>
                </header>
            </nav>
        </li>
    </ul>
</nav>

   <div>
   @if(\Session::get('success'))
			
			<script>alert('{{\Session::get('success')}}');</script>
			@endif
   	<table class="canvas">
   		<tr>
			
			@if(\Request::get('ders'))
   			<td class="video" rowspan="2"><iframe width="600" height="310" src="/kurslar/{{\Request::get('id')}}/dersler/{{\Request::get('ders')}}.mp4" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></td>
   			<td class="name">{{DB::table('ders')->where('dersid','=',\Request::get('ders'))->get()->first()->dersadi}} <br> <br>
   				<p><h5 class="category">{{DB::table('trainers')->where([['egitmenid', '=', DB::table('online_kurs')->where([['kursid','=',\Request::get('id')]])->get()->first()->egitmenid]])->get()->first()->kullaniciadi}} - {{DB::table('online_kurs')->where([['kursid','=',\Request::get('id')]])->get()->first()->kursadi}}</h5> <br><br> <h5 class="range">  09/10</h5></p>
   			</td>
			@else
			<td class="video" rowspan="2"><iframe width="600" height="310" src="/kurslar/{{\Request::get('id')}}/tanitim.mp4" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></td>
   			<td class="name">Tanıtım Videosu<br> <br>
   				<p><h5 class="category">{{DB::table('trainers')->where([['egitmenid', '=', DB::table('online_kurs')->where([['kursid','=',\Request::get('id')]])->get()->first()->egitmenid]])->get()->first()->kullaniciadi}} - {{DB::table('online_kurs')->where([['kursid','=',\Request::get('id')]])->get()->first()->kursadi}}</h5> <br><br> <h5 class="range">  09/10</h5></p>
   			</td>
			@endif
			
   		</tr>
   		<tr>
   			<td class="list" valign="middle">
   				<section class="list">
   				<p><a href="/kurs?id={{\Request::get('id')}}">Tanıtım Videosu</a></p><hr color="grey">
				@foreach(DB::table('ders')->where('kursid','=',\Request::get('id'))->get() as $ders)
   				@if(DB::table('satinalims')->where('kursiyerid','=',\Session::get('girenid'))->where('kursid','=',\Request::get('id'))->get()->count()>0 || (\Session::get('girenkisi')=='egitmen' && DB::table('online_kurs')->where('kursid','=',\Request::get('id'))->where('egitmenid','=',\Session::get('girenid'))->get()->count()))
				<p><a href="/kurs?id={{$ders->kursid}}&ders={{$ders->dersid}}">{{$ders->dersadi}} </a></p><hr color="grey">
				@else
				<p><a href="#" onClick="alert('Ders videolarını izleyebilmek için kursu satın alınız.')">{{$ders->dersadi}} </a></p><hr color="grey">
				@endif
				@endforeach
                </section>
   			</td>
   		</tr>
   	</table>
   	&nbsp<a href="">{{DB::table('trainers')->where([['egitmenid', '=', DB::table('online_kurs')->where([['kursid','=',\Request::get('id')]])->get()->first()->egitmenid]])->get()->first()->kullaniciadi}} - {{DB::table('online_kurs')->where([['kursid','=',\Request::get('id')]])->get()->first()->kursadi}} </a> <br>
   </div>
   <blockquote>
   <br>
    @if(\Session::get('girenkisi')=="kursiyer")
	<h3 style="color:white">Kurs Fiyatı: {{DB::table('online_kurs')->where('kursid','=',Request::get('id'))->get()[0]->fiyat}} TL</h3>
    <a href="/onlineodeme?id={{\Request::get('id')}}">Bu kursu satın al <button> <i class="far fa-credit-card"></i></button></a>
	{!!Form::open(['method'=>'POST','route' => 'favori'])!!} {{ csrf_field() }}<a>Bu kursu Favorilere ekle<button name="kursid" value="{{\Request::get('id')}}" type="submit"> <i class="fas fa-heart"></i></button></a>{!!Form::close()!!}
	@else	
	@endif
   </blockquote>
   <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
   <script src="js/main.js"></script>
</body>
</html>