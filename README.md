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

### Research
#### 1.Getting the 6 numbers needed for the numbers game
The first thing I wanted to do for this project was generate the 6 numbers we would be using to achive the target number for our numbers game. I was farmiler with lists from class so creating the list of numbers to chose from was simple and I gave the list a name to be reffered to later on.

```
(define gameNumbers(list 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 25 50 75 100))
```
From here I wanted to find a way to get 6 random numbers from this list. With some research I found the function in Racket called take. In Rackets offical documentation take is described 

```
(take lst pos) → list?

  lst : any/c
  pos : exact-nonnegative-integer?
```

> Returns a fresh list whose elements are the first pos elements of lst. If lst has fewer than pos elements, the exn:fail:contract exception is raised.

So for my game numbers list I wanted 6 items from it. Take would get 6 items from the list but it would only be the first 6 

```
'(1 1 2 2 3 3)
```
For the Numbers game I need to get 6 *Random* numbers from the gameNumbers list. Upon more research I found the shuffle function which is quite simply described from the racket documentation below.

```
(shuffle lst)
```
>Returns a list with all elements from lst, randomly shuffled.

In my case lst will be my gameNumbers list. 

After finding the take and shuffle functions I could now get the randomly generated numbers I needed to create a target number for the game using the following code.

```
(define (randGameNumbers lst n)
  (take (shuffle lst) n))

(randGameNumbers gameNumbers 6)
```