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
  (define (repeat k fn)
    (if (> k 0)
        (begin (fn) (repeat (- k 1) fn))
        nil))
  (define (quad fn)
    (repeat 4 (lambda () (fn) (lt 90))))
  (define (sier d k)
    (quad (lambda ()
           (if (= k 1) (fd d) (leg d k)))))
  (define (leg d k)
    (sier (/ d 3) (- k 1))
    (penup)
    (fd (/ d 3))
    (pendown)
    (sier (/ d 3) (- k 1))
    (penup)
    (fd (/ d 3))
    (fd (/ d 3))
    (pendown)
    )
  (sier 400 6)
  (exitonclick))

; Please leave this last line alone. You may add additional procedures above
; this line.
(draw)
