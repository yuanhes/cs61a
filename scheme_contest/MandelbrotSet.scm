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
    (define stepsize 0.01)
    ;(define (max a b) (if (> a b) a b))
    ;(define (min a b) (if (< a b) a b))
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
    (define (mand_color x y x0 y0 n nmax)
        (if (> n nmax)
            (rgb 0 0 0)
            (rgb (/ (radius x y) (* 8 (sqrt 2))) (/ (radius x0 y0) (* 2 (sqrt 2))) (/ n nmax))) 
    )
    (define (draw_mand nmax x y limit stepsize)
        (if (and (<= x limit) (<= y limit))
            (begin
                (define mandxy (mand x y nmax))
                (define n (car (cdr mandxy)))
                (define zx (car (cdr (cdr mandxy)))) 
                (define zy (car (cdr (cdr (cdr mandxy))))) 
                (define pix_x (/ (* x (screen_width) ) (* 2 limit)))
                (define pix_y (/ (* y (screen_height)) (* 2 limit))) 
                (pixel pix_x pix_y (mand_color zx zy x y n nmax))
                (penup)
                (define r (/ (* (screen_width) stepsize) 16))
                (goto (+ pix_x r) pix_y)
                (pendown)
                (begin_fill)
                (color (mand_color zx zy x y n nmax))
                (circle r)
                (end_fill)
                (draw_mand nmax x (+ y stepsize) limit stepsize)
            )
            (if (and (<= x limit) (> y limit))
                (draw_mand nmax (+ x stepsize) (- 0 limit) limit stepsize)))
    )
    (draw_mand 500 -2 -2 2 stepsize)
  (exitonclick))

; Please leave this last line alone. You may add additional procedures above
; this line.
(draw)
