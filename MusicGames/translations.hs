module Translations where

import Euterpea

pitchToInt :: Pitch -> Int
pitchToInt (Cff, o) = 10 + (o-1)*12 
pitchToInt (Cf,  o) = 11 + (o-1)*12
pitchToInt (C,   o) = 0  + o * 12
pitchToInt (Dff, o) = 0  + o * 12
pitchToInt (Cs,  o) = 1  + o * 12
pitchToInt (Df,  o) = 1  + o * 12
pitchToInt (Css, o) = 2  + o * 12
pitchToInt (D,   o) = 2  + o * 12
pitchToInt (Eff, o) = 2  + o * 12
pitchToInt (Ds,  o) = 3  + o * 12
pitchToInt (Ef,  o) = 3  + o * 12
pitchToInt (Fff, o) = 3  + o * 12
pitchToInt (Dss, o) = 4  + o * 12
pitchToInt (E,   o) = 4  + o * 12
pitchToInt (Ff,  o) = 4  + o * 12
pitchToInt (Es,  o) = 5  + o * 12
pitchToInt (F,   o) = 5  + o * 12
pitchToInt (Gff, o) = 5  + o * 12
pitchToInt (Ess, o) = 6  + o * 12
pitchToInt (Fs,  o) = 6  + o * 12
pitchToInt (Gf,  o) = 6  + o * 12
pitchToInt (Fss, o) = 7  + o * 12
pitchToInt (G,   o) = 7  + o * 12
pitchToInt (Aff, o) = 7  + o * 12
pitchToInt (Gs,  o) = 8  + o * 12
pitchToInt (Af,  o) = 8  + o * 12
pitchToInt (Gss, o) = 9  + o * 12
pitchToInt (A,   o) = 9  + o * 12
pitchToInt (Bff, o) = 9  + o * 12
pitchToInt (As,  o) = 10 + o * 12
pitchToInt (Bf,  o) = 10 + o * 12
pitchToInt (Ass, o) = 11 + o * 12
pitchToInt (B,   o) = 11 + o * 12
pitchToInt (Bs,  o) = 12 + o * 12
pitchToInt (Bss, o) = 13 + o * 12

intToPitch :: Int -> Pitch
intToPitch i =
	case p of
	  	0  -> (C, o)
	  	1  -> (Cs,o)
	  	2  -> (D, o)
	  	3  -> (Ds,o)
	  	4  -> (E, o)
	  	5  -> (F, o)
	  	6  -> (Fs,o)
	  	7  -> (G, o)
	  	8  -> (Gs,o)
	  	9  -> (A, o)
	  	10 -> (As,o)
	  	11 -> (B, o)
	where 
		p = mod i 12
		o = quot i 12

shiftBy :: Pitch -> Int -> Pitch
shiftBy p i =
	if (x < 0) then error "pitch out of range"
	else
		intToPitch x
		where x = (i + pitchToInt p)

halfStepDown :: Pitch -> Pitch
halfStepDown p = shiftBy p (-1)
halfStepUp :: Pitch -> Pitch
halfStepUp   p = shiftBy p   1

interval :: Pitch -> Pitch -> Int
interval p1 p2 = (pitchToInt p2) - (pitchToInt p1)