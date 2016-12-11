#lang racket

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

; in an applicative-order interpreter, the arguments are evaluated before the function executes
; this means that the (p) function will be called, which causes the program to enter a recursive infinite loop
; in a normal-order interpreter, y would not need to be evaluated, and the function would exit immediately
; racket appears to be applicative-order

