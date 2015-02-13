fun filter(f,xs) =
    case xs of
	[] => []
      | x::xs' => if f x
		 then x::(filter (f,xs'))
		 else filter (f,xs')

fun is_even v =
    (v mod 2 = 0)

fun all_even xs = filter(is_even, xs)
fun all_true xs = filter((fn x => (x = true)), xs)

val x1 = all_even [2,3,6,7,9]
val x2 = all_true [false,true]
