#lang racket

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; the function is intended to return the sum of a and the abolute value of b
; the conditional returns a partial function that will be applied to (a b)
; when b is positive, it is already equal to the absolute value, so just add it
; when b is negative, subtracting b from a is the same as adding the absolute value of b to a

