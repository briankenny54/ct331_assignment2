#lang racket

;This is an example implementation of ins_beg,
;It obviously doesn't do what it should, so you
;can edit this function to get started.
;
;Please note the provide function is necessary
;for the unit tests to work. Please include a
;(provide) for each function you write in your
;submitted assignment.
;
;You may delete these comments!

(provide ins_beg)
(provide ins_end)
(provide cout_top_level)
(provide count_instances)
(provide count_instances_tr)
(provide tail)
(provide count_instances_deep)

(define (ins_beg el lst)
  (append (list el) lst )
)

(define (ins_end el lst)
  (append lst (list el))
)

(define (cout_top_level lst)
   (length lst))

(define (count_instances el lst)
(cond
        [(null? lst) 0]
	[ ( eq? el (car lst)) (+ 1 (count_instances el (cdr lst)))]
        [else (count_instances el (cdr lst)) ]
        )
)


(define (tail el lst)
  (count_instances_tr el lst 0))

(define (count_instances_tr el lst num)
 (cond
        [(null? lst) num]
	[ ( eq? el (car lst)) (count_instances_tr el (cdr lst) (+ 1 num))]
        [else (count_instances_tr el (cdr lst) num) ]
        )
 
  )


(define (count_instances_deep el lst)
  (cond
        [(null? lst) 0]
	[ ( eq? el (car lst)) (+ 1 (count_instances_deep el (cdr lst)))]
        [(list? (car lst))
         (+ 0 (count_instances_deep el (cdr lst))
            (count_instances_deep el (car lst)))]
        [else (count_instances_deep el (cdr lst)) ]
        )
  )
