# CountdownNumbersGame_Racket
## Alan Murphy - G00312295
This is the reposity for my fourth year project in Theory of Algorithms in which I have to make the numbers game from the TV gameshow Countdown. I will be doing so by using the programming language Racket 

### Objective
In the Countdown Numbers game contestants are given six random numbers
and a target number. The target number is a randomly generated three digit
integer between 101 and 999 inclusive. The six random numbers are selected
from the following list of numbers:

[1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 25, 50, 75, 100]

Contestants must use the four basic operations – add, subtract, multiply
and divide – with the six random numbers to calculate the target number
(if possible).

To create this I need a function which takes two arguments, the target number and the list of numbers and the function, and returns the solution if it can. such and example would be...

``` Racket
> (solvecount 424 (list 100 25 10 2 2 1))
'(- (+ (* 100 (+ 2 2)) 25) 1) 
```

### Project Planning
To keep on top of things while working on this project I kept a list of Todos using github issues which can be seen in this repositroy. I created milestones to organise the different objectives I felt I needed to reach. I also commited as often as I felt appropriate to avoid losing large amounts of work

## How I planned to make this work in Theory
For this countdown game to work i need to get 6 numbers, a target number and then output all possible solutions. First with advice from my lectuerer Ian I went about trying to solve the problem with 2 numbers instead of one.

First I'd need to get two random numbers from the game list. then I'd need to get all possible answers for all combinations of equations, store them in a list and output one of them. This will then give the user the 2 random numbers and the target number. Next I need to output the answer equation.

To output the equation i felt I would need to define a function whcih calulated every possible solution to the two numbers. To do this I thought using a function with recursion would be the best method. My research into my theory is documented below.

### Research
#### 1.Getting the 6 numbers needed for the numbers game
The first thing I wanted to do for this project was generate the 6 numbers we would be using to achive the target number for our numbers game. I was farmiler with lists from class so creating the list of numbers to chose from was simple and I gave the list a name to be reffered to later on.

```Racket
(define gameNumbers(list 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 25 50 75 100))
```
From here I wanted to find a way to get 6 random numbers from this list. With some research I found the function in Racket called take. In Rackets offical documentation take is described 

```Racket
(take lst pos) → list?

  lst : any/c
  pos : exact-nonnegative-integer?
```

> Returns a fresh list whose elements are the first pos elements of lst. If lst has fewer than pos elements, the exn:fail:contract exception is raised.

So for my game numbers list I wanted 6 items from it. Take would get 6 items from the list but it would only be the first 6 

```Racket
'(1 1 2 2 3 3)
```
For the Numbers game I need to get 6 *Random* numbers from the gameNumbers list. Upon more research I found the shuffle function which is quite simply described from the racket documentation below.

```Racket
(shuffle lst)
```
>Returns a list with all elements from lst, randomly shuffled.

In my case lst will be my gameNumbers list. 

After finding the take and shuffle functions I could now get the randomly generated numbers I needed to create a target number for the game using the following code.

```Racket
(define (randGameNumbers lst n)
  (take (shuffle lst) n))

(randGameNumbers gameNumbers 6)
```
#### 2.Getting A list for the Operators and combining them with the numbers list.
Now that I have the 6 random numbers being generated I need to to create a list of operators to use with those numbers. Just like before I created a simple list contating all the opperators

```Racket
(define operators (list '+ '- '* '/ ))
```
Next I wanted to be able to pair our list of numbers with these operators so I could, in thoery, start created equations. From class and from research on the racket documentation I came accross the cartesian-product fuction which could help me achieve this.

From the Racket documentation.
```Racket
  (cartesian-product lst ...) → (listof list?)

  lst : list?
```
>Computes the n-ary cartesian product of the given lists.

Now after finding this function i can create every outcome of our game numbers list combined with an operator.

```Racket
(cartesian-product gameNumbers operators)
```

#### 3.Getting the countdown game to work with two numbers.
While doing this project I was advised by the lectuer and other students to attampt to get the countdown numbers game working with just two numers first instead of diving in to the more complex option of 6 numbers. I thought this might be a good way of getting my head around the idea of the game so I decided to go for it.

First I made a simple list with two numbers 
```Racket
(define numbers(list 5 50))
```
Next I created some functions for adding, subtracting, multiplying and dividing the two numbers in the list.
>Addition
```Racket
(define (sum lst)
  (+ (car lst)(car(cdr lst))))
```
>Subtraction
```Racket
(define (subtract lst)
  (- (car(cdr lst)) (car lst)))
```
>Multiplication
```Racket
(define (multiply lst)
  (* (car(cdr lst)) (car lst)))
```
>Division
```Racket
(define (divide lst)
  (/ (car(cdr lst)) (car lst)))
```
This way I could get all possible answers for the 2 numbers. Next I decided I'd store all the possible answers in a list. This way I can generate a random target number for the user.
>list of ansers
```Racket
(define answers(list(sum numbers) (subtract numbers) (multiply numbers) (divide numbers)))
```
>Target number generation
```Racket
(define (randTargetNumber lst n)
  (take (shuffle lst) n))
```
Now the output is the two numbers and the target number. Next I needed the program to output the equation for reaching the target number but this is currently proving difficult.

#### 4. Recurssion
A definition of recursion I found on the stack exchange is "A mathematical function that calls itself to compute a value corresponding to an n-th element and which defines some boundaries". With this in mind I thought I could use this to output the equation to acheive the target number. Perhaps with two numbers recursion might make it a bit simpilier but with 6 this could be difficult. Reverse Polish Notation should be researched when solving this problem with 6 numbers.

## How To Run the Project.
To run this project you must first install Dr.Racket on your machine. This can be done [here](https://racket-lang.org/)

Then clone down this project and open the racket script. Run the script and you'll see the following output.

```Racket
'((6 *) (5 -) (75 /) (100 +) (6 +) (7 /))
"Game numbers are"
'(100 8)
"Target number is"
'(108)
```

Unfortinuatly this currently doesnt output the equation like I want it to. More research needs to be done to figure out this problem.