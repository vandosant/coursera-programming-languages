val x = {bar=(1+2, true andalso true), foo=3+4 , baz=(false,9)}
val my_wife = {id=31111, name="Dana"}
val a_pair = (3+1, 4+2)
val another_pair = {2=5, 1=6}

(* data types *)
datatype mytype = TwoInts of int * int | Str of string | Pizza
val a = Str "hi"
val b = TwoInts(1+2,3+4)
val c = Pizza
val d = Str
val e = a

(* case expressions *)
fun f x =
    case x of
	Pizza => 3
      | Str s => String.size s
      | TwoInts(i1, i2) => i1 + i2

fun e x =
    case x of
	Constant i => i
     | Negate e2 => ~ (eval e2)
     | Add(e1,e2) => (eval e1) + (eval e2)
     | Multiply(e1,e2) => (eval e1) * (eval e2)

datatype suit = Club | Diamond
datatype rank = Jack | Queen
type card = suit * rank
type name_record = {student_num : int option,
		    first:string,
		    middle:string option}

fun is_Queen_of_Diamond(c:card)=
    #1 c = Diamond andalso #2 c = Queen

val c1 : card = (Diamond, Jack)
val c2 : suit * rank = (Diamond, Jack)
val c3 = (Diamond, Jack)
