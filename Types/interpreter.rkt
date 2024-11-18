#lang plait
; (define-type Exp
;     [num (n : Number)]
;     [str (s : String)]
;     [plus (l : Exp) (r : Exp)]
;     [cat (l : Exp) (r : Exp)]
; )
; (define-type Value
;     (numV (n : Number))
;     (strV (s : String))
; )
(print-only-errors #true)
(define-type BinOP [plus])
(define-type Exp
    [binE (operator : BinOP)
         (left : Exp)
         (right : Exp) ]
    [numE (value : Number)]
)
(calc : (Exp -> Number))
(define (calc e)
    (type-case Exp e
    [(binE o l r)
        (type-case BinOP o
        [(plus) (+ (calc l) (calc r))] ) ]
    [(numE v) v]
    )
)
(test (calc (binE (plus) (numE 5) (numE 6)) ) 11)