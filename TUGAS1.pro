




predicates
	nondeterm
	siapa_yang_beli(symbol,symbol) - nondeterm (o,o)
	orang(symbol) - nondeterm (o)
	onderdil(symbol) - nondeterm (o)
	membeli(symbol,symbol) - nondeterm (i,i)
	makan(symbol) - nondeterm (i)
	

clauses
	siapa_yang_beli(X,Y):-
		orang(X),
		onderdil(Y),
		makan(Y),
		membeli(X,Y).

	orang(jhony).
	orang(sam).
	orang(jafar).
	orang(jalil).
	
	onderdil(tang).
	onderdil(sop).
	
	
	membeli(jhony, tang).
	membeli(sam, pecel).
	membeli(jafar, sop).
	membeli(jalil, sop).
	
	
	makan(pecel).
	makan(sop).
	makan(soto).
	
	
	

goal
	siapa_yang_beli(X,Y).
	
	%Program yang menceritakan kisah fajar dan jalil sebagai sahabat kecil yang berpisah kembali
	%di warung yang tak di kenal mereka memsan makanan yang sangat sama