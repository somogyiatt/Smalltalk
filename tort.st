Object subclass: Tort [
	|szamlalo nevezo|
	init: szam init: nev [
		szamlalo := szam.
		nevezo := nev.
	]
	
	szamlalo [
		^szamlalo.
	]
	
	nevezo [
		^nevezo.
	]
	
	printNl [
	szamlalo print.
	$/ display.
	nevezo printNl.
	]
	
	+ other [
		|res szam nev lnko|
		szam := (szamlalo * other nevezo) + (other szamlalo * nevezo).
		nev := nevezo * other nevezo.
		lnko := szam gcd: nev.
		szam := szam // lnko.
		nev := nev // lnko.
		res := Tort new: szam new: nev.
		^res.
		
	]
	
	* other [
		|res szam nev lnko|
		szam := szamlalo * other szamlalo.
		nev := nevezo * other nevezo.
		lnko := szam gcd: nev.
		szam := szam // lnko.
		nev := nev // lnko.
		res := Tort new: szam new: nev.
		^res.
	]
		
]
	
Tort class extend [
	new: szam new: nev [
		|uj|
		uj := super new.
		uj init: szam init: nev.
		^uj.
	]
]

'Adja meg a tortek szamat:' displayNl.

Smalltalk at: #n put: (stdin nextLine asInteger) .
'A megadott n erteke: ' display.
n printNl.

|tomb elem x y|
tomb := Array new: n.

1 to: n do: [:i|
	'Adja meg az ' display.
	i display.
	'. tort szamlalojat:' displayNl.
	x := (stdin nextLine asInteger).
	'Adja meg az ' display.
	i display.
	'. tort nevezojet:' displayNl.
	y := (stdin nextLine asInteger).
	elem := Tort new: x new: y.
	tomb at: i put: elem.
	
].	

|megoldas legk osszeg masik|
megoldas := Array new: 3.
1 to: (n) do: [:z | 
	(z==1) 
	ifTrue: [
		osszeg := (tomb at: z).
		legk := (tomb at: z).
		megoldas at: 1 put: osszeg.
		megoldas at: 2 put: legk.
		megoldas at: 3 put: z.
		
	]
	ifFalse: [
		masik := (tomb at: z).
		osszeg := (osszeg + masik).
		megoldas at: 1 put: osszeg.
		((legk szamlalo / legk nevezo)>(masik szamlalo / masik nevezo)) ifTrue: [
			legk := masik.
			megoldas at: 2 put: legk.
			megoldas at: 3 put: z.
		]
	]


]


'A megadott tortek erteke: ' display.
(megoldas at: 1) printNl.

'A legkisebb erteku tort: ' display.
(megoldas at: 2) printNl.

'A legkisebb erteku tort: ' display.
(megoldas at:3) display.
'. megadott ertek volt' displayNl.

	
