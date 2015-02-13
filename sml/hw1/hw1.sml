fun is_older(d1 : int*int*int, d2 : int*int*int) =
    if #1(d1) < #1(d2)
    then true
    else if #1 d1 = #1 d2 andalso #2 d1 < #2 d2
    then true
    else if #1 d1 = #1 d2 andalso #2 d1 = #2 d2 andalso #3 d1 < #3 d2
    then true			     
    else false

fun number_in_month(ds : (int*int*int) list, m : int) =
    if null ds
    then 0
    else if (#2(hd ds)) = m
    then 1 + number_in_month(tl ds, m)
    else 0 + number_in_month(tl ds, m)

fun number_in_months(ds : (int*int*int) list, ms : int list) =
    if null ds
    then 0
    else if null ms
    then 0
    else if (#2(hd ds)) = hd ms
    then 1 + number_in_months(tl ds, ms)
    else 0 + number_in_months(ds, tl ms)

fun dates_in_month(ds : (int*int*int) list, m : int) =
    if null ds
    then []
    else if #2(hd ds) = m
    then hd ds :: dates_in_month(tl ds, m)
    else dates_in_month(tl ds, m)

fun dates_in_months(ds : (int*int*int) list, ms : int list) =
    if null ds
    then []
    else if null ms
    then []
    else if #2(hd ds) = hd ms
    then [hd ds] @ dates_in_months(tl ds, ms)
    else dates_in_months(ds, tl ms)

fun get_nth(ss : string list, n : int) =
    if n = 1
    then hd ss
    else get_nth(tl ss, n-1)

fun date_to_string(d : int*int*int) =
    let
	val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    in
	get_nth(months, #2 d) ^ " " ^ Int.toString (#3 d) ^ ", " ^ Int.toString(#1 d)
    end

fun number_before_reaching_sum(s : int, is : int list) =
    if null is
    then 0
    else if hd is < s
    then 1 + number_before_reaching_sum(s-(hd is), tl is)
    else 0

fun what_month(d : int) =
    let
	val months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in
	1 + number_before_reaching_sum(d, months)
    end

fun month_range(d1 : int, d2 : int) =
    if d1 > d2
    then []
    else what_month(d1) :: month_range(d1+1, d2)

fun oldest(ds : (int*int*int) list) =
    if null ds
    then NONE
    else let
	fun max_date (ds : (int*int*int) list) =
	    if null (tl ds)
	    then hd ds
	    else let val tl_ans = max_date(tl ds)
		 in
		     if is_older(hd ds, tl_ans)
		     then hd ds
		     else tl_ans
		 end
    in
	SOME (max_date ds)
    end
