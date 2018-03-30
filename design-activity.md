# Design Activity: Evaluating Responsibility

## Prompts
* What classes does each implementation include? Are the lists the same?
>The classes are the same in both implementations

  > Implementation A
  * CartEntry
  * ShoppingCart
  * Order

  > Implementation B
  * CartEntry
  * ShoppingCart
  * Order

* Write down a sentence to describe each class
> CartEntry: variables for unit price and quantity

  >ShoppingCart: initializes with an entries array

  >Order: initializes a ShoppingCart instance and handles total price and sales tax
* How do the classes relate to each other?
> Order creates a ShoppingCart instance and CartEntry instances probably go into ShoppingCart @entries array
* What data does each class store? How (if at all) does this differ between the two implementations?
> CartEntry stores unit_price and quantity

 > ShoppingCart stores entries array (also local variable sum in imp b)

 > Order stores sales_tax constant and sum local variable in imp a, subtotal local variable in imp b

* What methods does each class have? How (if at all) does this differ between the two implementations?
> CartEntry: initialize; price (b only)

 > ShoppingCart: initialize; price (b only)

 > Order: initialize; total_price

* Consider the Order#total_price method:
  * Is logic to compute the price delegated to "lower level" classes like ShoppingCart and CartEntry or is it retained in Order?
  > in imp b the price computation is delegated to the ShoppingCart class; imp a retains the computation in Order
  * Does total_price directly manipulate the instance variables of other classes?
  > Order#total_price in imp a does reference the ShoppingCart entries array in the total_price method and loop on it. Imp b has the looping on entries happen in ShoppingCart
* If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify?
> Imp b is easier to modify because you only need to make an update in the CartEntry#price method to implement bulk pricing based on quantity and the rest of the classes that reference price would continue to work. In Imp A the total_price method references unit_price and unit_quantity instance variables instead of calling a price method so you would need to add even more responsibilities to the Order class to implement bulk pricing
* Which implementation better adheres to the single responsibility principle?
> I think Imp B better adheres to single responsibility
* Bonus question after Metz ch. 3: Which implementation is more loosely coupled?
