#lang racket
;Alan Murphy
;Theory of Algorithms assingment

; list of the numbers that can be used in the show for the numbers game
(define gameNumbers(list 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 25 50 75 100))

; defines a function that generates the 6 random numbers that will be used to achieve the target number
(define (randGameNumbers lst n)
  (take (shuffle lst) n))

; Outputs the numbers for the game
(define perm (remove-duplicates(permutations (randGameNumbers gameNumbers 6))))

(define operators (list '+ '- '* '/ ))



