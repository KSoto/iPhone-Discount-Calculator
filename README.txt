/*---------------------------------------------------------------------
-------------------------------KATIE SOTO------------------------------
--------------------------Discount Calculator--------------------------
---------------------------------------------------------------------*/

//What is it?
This discount calculator is used to calculate discounts on a purchase. Although
it uses the dollar sign ($) for US dollars, it can be applied to any currency.
The premise is this: an item is full priced (let's say, for $100), but there is
a discount (let's say, 10%) on that price, as well as an additional discount (let's
say, 5%). On top of those calculations, there is a sales tax that also needs to
be applied (let's say, 8.75%). This program is used to calculate the total price
after deducting all discounts, and added tax. It will also show you a comparison
of how much you saved. The user can choose to view a graphical representation
of how much they saved via a bar chart. Directions for how to read the bar chart
are below.

//How do I use it?
1) To use the program, you need to enter in the following information:
**Original Price - (Required), original price of the item. Example inputs: '100', '129.23', '34'
**Discount % - (Optional), the percentage of the discount. For 10%, enter '10' in the text box. For 20%, enter '20' in the text box, and so on.
**Additional Discount % - (Optional), the percentage of the additional discount. Format is the same as "Discount %".
**Tax % - (Optional), the percentage of the tax rate to be applied. For 9% taxes, type '9', for 5% taxes, type '5', and so on.
2) Before/After Switch - (Optional) You have the option to apply taxes before applying discounts, or after. If you want to apply taxes before the discounts have been applied, tap the "Before" segment. If you want to apply taxes after the discounts have been applied, tap the "After" segment.
3) Next, just tap the "Show Calculations" button and the results will be displayed.
4) If you'd like to view a graphical representation of your results, click the "Show Graph" button.

Here is how to read the graph:
The Graph Bars shown are proportional to the percentage of the discounts, tax etc.
 The first discount is shown at the top, to show how much money was removed from the
 original amount.
 The second discount is shown below to show how much money was removed based on that
 discount.
 The taxes are shown below to show how much of the price is for taxes.
 Example:
 
 _______      _______
 |     |      | d1  |
 |     |      |_____|
 |     |      | d2  |
 |     |      |-----|
 |     |      | tax |
 |     |      |-----|
 |     |      |     |
 |     |      |     |
 |     |      |     |
 |     |      |     |
 |     |      |     |
 |     |      |     |
 -------      -------
 Original     Discounted
 Price        Price
 


//Features Completed:
-Calculate discount
-Calculate discount on top of another discount
-Apply taxes before the discounts
-Apply taxes after the discounts
-Allow the user to choose before/after tax application
-Display discount amounts, tax amounts, total resulting price, and amount saved.
-Create a proportional graph


//Bugs:
-The information from the calculations page is not being transferred to the graph page. Error catching for this problem has been implemented, so if it happens, example values will be used to display the graph.


//Features Not Completed:
-All considered features have been implemented.


//External Dependancies:
-No external dependancies.


//About The Author:
Katie Soto
KReneSoto@gmail.com
714-213-2228
