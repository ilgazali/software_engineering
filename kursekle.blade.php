
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="onlinekurslarımız.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet"> 
        <title> Kurs Videolarını Ekle</title>
    </head>

    <body>
        <div class="cont active" id="cont">
            <header class="header">
                <div class="cont-logo">
                    <button id="boton-menu" class="boton-menu"><i class="fas fa-bars"></i></button>
                    <a href="/" class="logo"><i class="fas fa-palette"></i> <span>ArtHouseOnline</span></a>
                </div>
    
                <div class="arama-cubugu">
                    <input type="text" placeholder="Hangi dersi aramıştınız?">
                    <button type="submit"><i class="fas fa-search"></i></button>
                </div>
    
                <div class="baslık-butonu">
                    <button><i class="fas fa-upload"></i></button>
                    <button><i class="fas fa-heart"></i></button>
                    <button><i class="fas fa-bell"></i></button>
                    <a href="/profil" class="avatar"><img src="avatar.jpg" alt=""></a>
                </div>
            </header>
    
            <nav class="yan-menu">
                <a href="#" class="active"><i class="fas fa-home"></i> Ana Sayfa</a>
                <a href="#"><i class="fas fa-book-reader"></i> Verdiğin Kurslar</a>
                <a href="#"><i class="fas fa-heart"></i> Favoriler</a>
    
                <hr>
    
                <a href="#"><i class="fas fa-angle-double-right"></i> Resim Dersleri</a>
                <a href="#"><i class="fas fa-angle-double-right"></i> Dans Dersleri</a>
                <a href="#"><i class="fas fa-angle-double-right"></i> Müzik Dersleri</a>
    
                <hr>
    
    
            </nav>
            <main class="main">
			@if ($message = Session::get('success'))
				<div class="alert alert-success alert-block">
				<button type="button" class="close" data-dismiss="alert">×</button>
                <strong>{{ $message }}</strong>
				</div>
			@endif
  
			@if (count($errors) > 0)
				<div class="alert alert-danger">
					<strong>Whoops!</strong> There were some problems with your input.
					<ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
					</ul>
				</div>
			@endif
			{!!Form::open(['method'=>'POST','route' => 'kursekle','files'=>true])!!}
				{{ csrf_field() }}
				<h3 class=" baslik "> Kurs Kategorisi </h3>
                        <select name="kategori">
							@foreach(DB::table('kategoris')->get() as $value)
							<option value="{{$value->kategoriid}}">{{$value->kategoriadi}}</option>
							@endforeach
						</select>
                <br>
                <br>
                <h3 class="baslik">Tanıtım Videonu Ekle;</h3>
                <h5 class="baslik"> Tanıtım videonu herkes görebilir. Kendini ve kurs içeriğini güzelce tanıt. Hangi seviyede öğrencilere hitap ettiğini mutlaka belirt. Bol şans!</h5>
               <br>
               <br>
                <h3 class=" baslik "> Video Seç: </h3>
                        <input type="file" id="video" name="tanitim" accept=".mp4">
                        <br>
                        <br>
                        
                    
               
				<h3 class=" baslik "> Kurs Resmi </h3>
                        <input type="file" id="video" name="foto" accept=".png">
                <br>
                <br>
				<h3 class=" baslik "> Kurs Adı </h3>
                        <input type="text" name="kursadi">
                <br>
                <br>
                <h3 class=" baslik "> Şimdi biraz da yazılı olarak kurs açıklamanı yap :) </h3>
                        <textarea name="aciklama" cols="50" rows="5"></textarea>
                <br>
                <br>
                <h3 class="baslik"> Kursun için fiyat belirle! </h3>
                        <input type="number" name="fiyat" step="0.01"> TL 
						<input type="submit">
						{!!Form::close()!!}
            </main>

            <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
            <script src="js/main.js"></script>
    </body>
</html>