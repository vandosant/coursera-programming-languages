fun map(f, xs) =
    case xs of
	[] => []
     | x::xs' => (f x)::map(f,xs')

val x1 = map((fn x => x + 1), [4,3,12,11])
val x2 = map(hd, [[1,2],[3,4],[5,6]])
