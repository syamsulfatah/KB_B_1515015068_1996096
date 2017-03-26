trace
domains
  name,sex,occupation,object,vice,substance = symbol
  age=integer

predicates
  person(name,age,sex,occupation) - nondeterm (o,o,o,o), nondeterm (i,o,o,i), nondeterm (i,o,i,o)
  had_affair(name,name) - nondeterm (i,i), nondeterm (i,o)
  killed_with(name,object) - determ (i,o)
  killed(name) - procedure (o)
  killer(name) - nondeterm (o)
  motive(vice) - nondeterm (i)
  smeared_in(name,substance) - nondeterm (i,o), nondeterm (i,i)
  owns(name,object) - nondeterm (i,i)
  operates_identically(object,object) - nondeterm (o,i)
  owns_probably(name,object) - nondeterm (i,i)
  suspect(name) - nondeterm (i)

/* * * fakta mengenai pembunuhan * * */
clauses
  person(bert,55,m,carpenter).
  person(allan,25,m,football_player).
  person(allan,25,m,butcher).
  person(john,25,m,pickpocket).

  had_affair(barbara,john).
  had_affair(barbara,bert).
  had_affair(susan,john).

  killed_with(susan,club).
  killed(susan).

  motive(money).
  motive(jealousy).
  motive(righteousness).

  smeared_in(bert,blood).
  smeared_in(susan,blood).
  smeared_in(allan,mud).
  smeared_in(john,chocolate).
  smeared_in(barbara,chocolate).

  owns(bert,wooden_leg).
  owns(john,pistol).

/* * * Latar Belakang Pengetahuan atau Barang bukti yang di gunakan * * */

  operates_identically(wooden_leg, club).
  operates_identically(bar, club).
  operates_identically(pair_of_scissors, knife).
  operates_identically(football_boot, club).

  owns_probably(X,football_boot):-
	person(X,_,_,football_player).
  owns_probably(X,pair_of_scissors):-
	person(X,_,_,hairdresser).
  owns_probably(X,Object):-
	owns(X,Object).

/* * * * * * * * * * * * * * * * * * * * * * * *
 * Dicurigai semua orang yang memiliki senjata *
 *  yang kerjanya mirip dengan 
 *  senjata penyebab  susan terbunuh  	       *
 * * * * * * * * * * * * * * * * * * * * * *   * */

  suspect(X):-
	killed_with(susan,Weapon) ,
	operates_identically(Object,Weapon) ,
	owns_probably(X,Object).

/* * * * * * * * * * * * * * * * * * * * * * * * * *  *  *
 * Dugaan pria yang miliki urusan bertemu dengan susan   *
 * * * * * * * * * * * * * * * * * * * * * * * * * *  *  */

  suspect(X):-
	motive(jealousy),
	person(X,_,m,_),
	had_affair(susan,X).

/* * * * * * * * * * * * * * * * * * * * *
 * Dugaan Wanita yang memiliki urusan    *
 * dengan seseorang yang susan ketahui   *
 * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-
	motive(jealousy),
	person(X,_,f,_),
	had_affair(X,Man),
	had_affair(susan,Man).

/* * * * * * * * * * * * * * * * * * * * * * * * * *  * *
 * Dugaan pencopet dengan motiv mencuri menjadikan uang *
 * * * * * * * * * * * * * * * * * * * * * * * * * *  * */

  suspect(X):-
	motive(money),
	person(X,_,_,pickpocket).

  killer(Killer):-
	person(Killer,_,_,_),
	killed(Killed),
	Killed <> Killer, /* Bukan bunuh diri */
	suspect(Killer),
	smeared_in(Killer,Goo),
	smeared_in(Killed,Goo).

goal
  killer(X).
/*Bert sebagai pelaku bersalah karna ia memiliki motiv dan memiliki barang yang berlumuran sama seperti si korban */

/*penggunaan "<>" artinya tidak sama, pertama prolog akan coba membuktikan jika killed atau tidak killed gagal maka akan menccoba
untuk mencari alternatif yang lain sehingga sisa klausa yang tidak pernah ter eksekusi akan terpakai  */

/*Pembunuan susan ini terjadi karna motiv tidak memiki uang dan juga kecemburuan sehingga memunculkan dendam di hati 
yang berujung menjadi pembunuhan */
/*DUGAAN MOTIV PEMBUNUHAN */
% Tersangka bukanlah korban artinya korban tidak bunuh diri scara langsung
% pada saat pengecekan kecurigaan pertama setiap orang bisa menjadi tersangka
%saat di cek barang bukti ialah gagang kayu/pentungan yang memiliki bercak darah spt korban
%kemudian cek apakah ada bukti darah di tubuh nya, ternyata bert yaitu pentungan nya
%ternodai oleh darah susan, dari situlah terindikasi bahwa bert merupakan pembunuh nya