fun fold (f,acc,xs) =
    case xs of
	[] => acc
     |  x::xs => fold(f, f(acc,x), xs)

val x1 = fold ((fn (x,y) => x + y), 0, [1,3,5,7,9])
