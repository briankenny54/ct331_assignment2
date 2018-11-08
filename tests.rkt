#lang racket

(require (file "assignment_q2.rkt")
         (file "assignment_q3.rkt"))

;
;Don't worry about this file unless you are doing the extra credit tests. 
;

;This structure allows a single function call
;to run every test in sequence, rather than
;calling each function separately. 
(define (runTests)
  (begin
    (display "Running tests...\n")
    ;begin calling test functions
    (printf "a: ~a\n" (test_ins_beg1))
    (printf "b: ~a\n" (test_ins_end1))
    (printf "c: ~a\n" (test_ins_cout))
    (printf "d: ~a\n" (test_ins_cinst))
    (printf "e: ~a\n" (test_ins_ctail))
    (printf "f: ~a\n" (test_ins_cdeep))
    ;end calling test functions
    (display "\nTests complete!\n")))

;Begin test functions
(define (test_ins_beg1)
  (equal? (ins_beg 1 '(2 3 4)) '(1 2 3 4)))

(define (test_ins_end1)
  (equal? (ins_end 1 '(2 3 4)) '(2 3 4 1)))

(define (test_ins_cout)
  (eq? (cout_top_level '(1 5 4 '(2 3) '(2 3 4))) 5))

(define (test_ins_cinst)
  (eq? (count_instances 2 '(1 5 2 4 2 7 2)) 3))

(define (test_ins_ctail)
  (eq? (tail 2 '(1 5 2 4 2 7 2)) 3))

(define (test_ins_cdeep)
  (eq? (count_instances_deep 2 '(1 5 2 4 '(2 7) 2)) 3))


;End test functions

;Run the tests
(runTests)