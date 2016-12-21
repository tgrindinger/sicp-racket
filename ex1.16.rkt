#lang racket

(define (fast-expt b n)
  (if (>= n 0)
    (fast-expt-iter b (- n 1) b)
    (/ 1 (fast-expt-iter b (- (- n) 1) b))
  )
)

(define (fast-expt-iter b counter product)
  (cond ((= counter 0)    product)
        ((even? counter) (fast-expt-iter (* b b) (/ counter 2) product))
        (else            (fast-expt-iter b (- counter 1) (* b product)))
  )
)

(define (even? n)
  (= (remainder n 2) 0))

(define (read-loop continue)
  (if (string-prefix? (string-downcase (symbol->string continue)) "y")
    (begin
      (printf "Give me a number to exponentiate, now! ")
      (let ([b (read)])
        (printf "Now give me an exponent! ")
        (let ([n (read)])
          (printf "Raising ~a to the power of ~a with gives ~a!\n" b n (fast-expt b n))
        )
      )
      (printf "Can you handle another? ")
      (read-loop (read))
    )
    "Then go away!"
  )
)

(printf "Welcome to my blazingly fast exponentiator!\n")
(printf "~a\n" (read-loop 'y))

