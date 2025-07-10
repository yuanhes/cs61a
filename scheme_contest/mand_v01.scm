;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: <Your title here>
;;;
;;; Description:
;;;   <It's your masterpiece.
;;;    Use these three lines to describe
;;;    its inner meaning.>

(define (draw)
  ; YOUR CODE HERE
    (define (square_re x y)
        (- (* x x) (* y y))
    )
    (define (square_im x y)
        (* 2 (* x y))
    )
    (define (rsquare x y)
        (+ (* x x) (* y y))
    )
    (define (radius x y)
        (sqrt (rsquare x y))
    )
    (define (mand x0 y0 nmax)
        (define (mand_helper x y n)
            (cond 
                ((> n nmax) (list #t n x y))
                ((> (radius x y) 2) (list #f n x y))
                (else (mand_helper (+ (square_re x y) x0) (+ (square_im x y) y0) (+ n 1)))))
        (mand_helper x0 y0 0)
    )
    (define (color x y x0 y0 n nmax)
        (if (> n nmax)
            (rgb 1 1 1)
            (rgb (/ (radius x y) (* 8 (sqrt 2))) (/ (radius x0 y0) (* 2 (sqrt 2))) (/ n nmax))) 
    )
    (define (draw_mand nmax x y limit stepsize)
        (if (and (<= x limit) (<= y limit))
            (begin
                (define mandxy (mand x y nmax))
                (define n (car (cdr mandxy)))
                (define zx (car (cdr (cdr mandxy)))) 
                (define zy (car (cdr (cdr (cdr mandxy))))) 
                (pixel (* (screen_width) (/ x 2)) (* (screen_height) (/ y 2)) (color zx zy x y n nmax))
                (draw_mand nmax x (+ y stepsize) limit stepsize)
            )
            (if (and (<= x limit) (> y limit))
                (draw_mand nmax (+ x stepsize) (- 0 limit) limit stepsize)))
    )
    (draw_mand 500 -2 -2 2 0.01)
  (exitonclick))

; Please leave this last line alone. You may add additional procedures above
; this line.
(draw)
