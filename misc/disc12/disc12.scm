(define (up n)
  (define (helper n result)
    (if (zero? n) result
        (helper (quotient n 10)
                (let ((first (remainder n 10)))
                  (cons first 
                        (if (< first (car result))
                            result
                            (list result)))))))
  `(quote ,(helper (quotient n 10) (list (remainder n 10)))))

(expect (up 314152667899) '(3 (1 4 (1 5 (2 6 (6 7 8 9 (9)))))))

