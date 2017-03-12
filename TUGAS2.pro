predicates 
	nondeterm
	rabu(long,symbol)
	nondeterm
	kamis(long,symbol)
	nondeterm
	sabtu(long,symbol)
	nondeterm
	semua(long,symbol)
	nondeterm
	kecurigaan(symbol,symbol)
clauses
	rabu(08991234,ilham).
	rabu(08991235,indra).
	rabu(08991236,cahya).
	rabu(08991237,budi).
	rabu(08991238,kumala).
	
	kamis(08991239,ilpyo).
	kamis(08991230,daewhi).
	kamis(08991241,cahya).
	kamis(08991242,ilham).
	kamis(08991243,kumis).
	
	sabtu(08991344,subahan).
	sabtu(08991345,fredic).
	sabtu(08991246,ilham).
	sabtu(08291347,jason).
	sabtu(08991348,mitsuketa).
	

	semua(Nohp,Pelaku):-
	rabu(Nohp,Pelaku);
        kamis(Nohp,Pelaku);
	sabtu(Nohp,Pelaku).
	
	
	kecurigaan(spamming,teror).
	kecurigaan(iseng,virus).
	kecurigaan(penipuan,teror).
	kecurigaan(psikopat,salahsambung).	
goal
	sabtu(Nohp,Pelaku),
	Nohp=08991348,
	kecurigaan(Kasus,Bukti),
	Kasus=spamming,
	Bukti=teror.