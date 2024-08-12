#lang racket

;;;; LISTA 2

; q1
(define (concatenar l1 l2)
  (cond
    [(null? l2) l1]
    [(null? l1) l2]
    [else (cons (first l1) (concatenar (rest l1) l2))]))

; q2
(define (concatenarInv l1 l2)
  (cond
    [(null? l2) l1]
    [(null? l1) l2]
    [else (cons (first l2) (concatenarInv l1 (rest l2)))]))

; q3
(define (concatenar2 l)
  (cond
    [(null? l) '()]
    [else (concatenar (first l) (concatenar2 (rest l)))]))

; q3-v
(define (concatenar3 . l)
  (concatenar2 l))

; q4
(define (juntar l1 l2)
  (cond
    [(null? l1) l2]
    [(null? l2) l1]
    [else (cons (first l1) (juntar l2 (rest l1)))]))

; q5
(define (adicionarFinal e l)
  (cond
    [(null? l) (list e)]
    [else (cons (first l) (adicionarFinal e (rest l)))]))

; q6
(define (inverter l)
  (cond
    [(null? l) '()]
    [else (concatenar (inverter (rest l)) (list (first l)))]))

; q7
(define (intercala n x y)
  (if
   (eqv? n 0) '()
   (cons x (intercala (- n 1) y x))))

; q8
(define (intercala2-aux n l)
  (cond
    [(null? l) '()]
    [(eqv? n 0) '()]
    [else
     (cons
      (first l)
      (intercala2-aux (- n 1) (adicionarFinal (first l) (rest l))))
     ]))
 
(define (intercala2 n . l) (intercala2-aux n l))

; q9
(define (parear e l)
  (if
   (null? l) '()
   (cons (cons e (list (first l))) (parear e (rest l)))))

; q10
(define (pares l)
  (cond
    [(null? l) '()]
    [(null? (rest l)) '()]
    [else (concatenar (parear (first l) (rest l)) (pares (rest l)))]))