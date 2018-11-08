#lang racket

(provide treesort)
(provide treeitem)
(provide insert)
(provide insertlist)
(provide sortedtreelist)


(define (treesort tree)
 (cond [(not (null? (car tree))) (treesort (car tree))])
         (printf "~a\n" (cadr tree))
         (cond [(not (empty? (caddr tree))) (treesort (caddr tree))]))



(define (treeitem el tree)
  (cond
    [(null? tree) #f]
    [(equal? el (cadr tree))#t]
    [(< el (cadr tree)) (treeitem el (car tree))];if element is less than node traverse left
      [(> el (cadr tree)) (treeitem el (caddr tree))];if element is more than node traverse right
      )
  )



(define (insert el tree)
  (cond
    [(null? tree) (= tree el)]
    [(< el (cadr tree)) (insert el (car tree))]
    [(> el (cadr tree)) (insert el (caddr tree))]
    )
  )

(define (insertlist lst tree)
  (cond
    [(insert (car lst) tree)]
    [insertlist (cdr lst) tree]
    )
  )


(define (sortedtreelist lst tree)
  (cond
    [insertlist lst tree]
    [treesort tree]
    )
  )
