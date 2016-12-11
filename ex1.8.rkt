#lang racket

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (cube x)
  (* x x x))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))

(define (improve guess x)
  (/ (+ (* 2 guess) (/ x (* guess guess))) 3))

(define (average x y)
  (/ (+ x y) 2))

(define (cube-root-iter guess x)
  (if (good-enough? guess x)
          guess
          (cube-root-iter (improve guess x)
                          x)))

(define (cube-root x)
  (cube-root-iter 1.0 x))

(cube-root 7)

