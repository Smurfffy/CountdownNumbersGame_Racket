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
;(define currentGameNumbers (randGameNumbers gameNumbers 6))

;Defines the last of operators to be used in the game
(define operators (list + - * /))

;I assume this will be need for output.
(define operatorOutput (list '+ '- '* '/))

;combines the gameNumbers list with the operators list to create every possible outcome.
(randGameNumbers (cartesian-product gameNumbers operatorOutput) 6)

;leaving the above commented out while I attempt to get this working with 2 arguments.
(define numbers(randGameNumbers gameNumbers 2))

;The sum function which gets the first number of the list and the 'rest' of the list
;Which in this case is just 50
;This wont work with 6 numbers however.
(define (sum2 lst)
  (+ (car lst)(car(cdr lst))))

;Subtract function like sum above. numbers taken in different order so answer is not negative.
(define (subtract lst)
  (- (car(cdr lst)) (car lst)))

;Multiply function similar to the two above functions. Number input order not important here
(define (multiply lst)
  (* (car(cdr lst)) (car lst)))

;Divide function similar to all other functions above.
(define (divide lst)
  (/ (car(cdr lst)) (car lst)))

;These results could be useful in a list for generating a target number
(define answers(list(sum2 numbers) (subtract numbers) (multiply numbers) (divide numbers)))

;Takes in the list of possible answers for the two numbers and outputs 1 answer.
;This will be the target number.
(define (randTargetNumber lst n)
  (take (shuffle lst) n))

;Output
"Game numbers are"
numbers
"Target number is"
(randTargetNumber answers 1)

;Below function was my attempt at recursion. else part left blank because it consistantly caused errors.
;function with recursion to output solutions?
;(define (equation randTargetNumber operators operatorOutput lst)
;  (if (null? operators)
;      1
;      '()))

;Need to try get what I currently have working with two numbers with the 6 randomly generated numbers.
;This is a recursive sum funcition. Taken from the examples given in class.
;(define (sum6 l)
;  (if (null? l)
;      0
;(+ (car l) (sum6 (cdr l)))))

;this is a recursive multiply function.
;(define (multiply6 l)
;  (if (null? l)
;      1
;'(* (car l) (multiply6 (cdr l)))))

;The two above functions add and multply the 6 random game numbers but it might not be usefull.
;Will keep them in code for reference later.

;Output.
;currentGameNumbers
;(sum6 currentGameNumbers)
;(multiply6 currentGameNumbers)


