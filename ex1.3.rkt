#lang racket

(define (sum-squares x y)
  (+ (* x x) (* y y))
)

(define (sum-squares-two-largest x y z)
  (cond ((and (< x y) (< x z))
          (sum-squares y z)
        )
        ((and (< y x) (< y z))
          (sum-squares x z)
        )
        (else
          (sum-squares x y)
        )
  )
)

