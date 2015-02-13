fun inc_or_zero intoption =
    case intoption of
	NONE => 0
     | SOME i => i+1

(* no more hd, tl, null*)
(* [] = empty, :: = null *)
fun sum_list xs =
    case xs of
	[]=>0
     |  x::xs' => 
