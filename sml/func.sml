fun pow(x : int, y : int) = 
    if y = 0
    then 1
    else x * pow(x, y - 1)

fun cube(x : int) =
    pow(x, 3)

val sixtyfour = cube(4);

fun find_max (xs : int list) =
    if null xs
    then NONE
    else let
	fun max_nonempty (xs: int list) =
	    if null (tl xs)
	    then hd xs
	    else let val tl_ans = max_nonempty(tl xs)
		 in
		     if hd xs > tl_ans
		     then hd xs
		     else tl_ans
		 end
    in
	SOME (max_nonempty xs)
    end

fun countdown(from : int, to : int) =
    if from=to
    then to::[]
    else from::countdown(from-1, to)

fun countup(from : int, to : int) =
    if from=to
    then to::[]
    else from::countup(from+1, to)

val x = true andalso true;

fun sort_pair (pr : int * int) =
