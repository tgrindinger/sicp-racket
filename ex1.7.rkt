#lang racket

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(good-enough? 10.00001 10.00002)
; false
; the difference is 0.00001, but good-enough? still returns false
; this is caused by floating point precision not being accurate enough to distinguish correctly between numbers with many significant digits

(* (sqrt 0.0001) (sqrt 0.0001))
; 0.0010438358335233748
; the answer given by sqrt is off because the tolerance of good-enough? is too high for the numbers given

(define (better-good-enough? guess last-guess)
  (< (abs (- guess last-guess)) (/ guess 1000)))

(define (better-sqrt-iter guess last-guess x)
  (if (better-good-enough? guess last-guess)
          guess
          (better-sqrt-iter (improve guess x) guess x)))

(define (better-sqrt x)
  (better-sqrt-iter 1.0 0.0 x))

(better-sqrt 10.00001)

(better-sqrt 0.0001)

