#lang racket

(define (fr n)
  (if (< n 3)
    n
    (+ (fr (- n 1)) (* 2 (fr (- n 2))) (* 3 (fr (- n 3))))
  )
)

(define (fi n)
  (fi-iter 0 1 2 n)
)

(define (fi-iter a b c n)
  (cond ((= n 0) a)
        ((= n 1) b)
        ((= n 2) c)
        (else (fi-iter b c (+ (* 3 a) (* 2 b) c) (- n 1)))
  )
)

