#lang racket

(define (pascal row col) (
  if (or (= row 1) (= col 1) (= row col))
    1
    (+ (pascal (- row 1) (- col 1)) (pascal (- row 1) col))
  )
)

