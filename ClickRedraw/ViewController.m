//
//  ViewController.m
//
//  Author: Katie Soto
//  Project: iPhone Discount Calculator
//  Author's Email: KReneSoto@gmail.com
//  Author's Phone: (714) 213-2228
//  Date Created: 9/2012
//  Class: CSUF CPSC 491T - iPhone Mobile App Development
//  Professor: Michael Shafae
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//  Problem Statement: Write an iPhone Application that is used to calculate
//      discounts. A user inputs the original price, a discount percentage,
//      an additional discount percentage, and a tax rate. Once they press
//      "calculate", the amount they saved from the first discount, the
//      amount they saved from the second discount, the amount of taxes
//      generated, the total price, and the total amount saved is displayed.
//      Also, after the calculations have been shown, a user can view a
//      graphical representation of how the money has been allocated through
//      a bar graph.
//  File Description: This file does all calculations and displays. All
//      discounts, taxes, and other calculations are made in "calculateDiscount",
//      as well as changing the visual elements. The "taxChange" function
//      monitors the segment element so that the tax rate will be calculated
//      correctly. All variables and functions were declared in the interface.

#import "ViewController.h"

@interface ViewController ()

@end


@implementation ViewController

@synthesize myView = _myView;
@synthesize priceTextField = _priceTextField;
@synthesize discountTextField = _discountTextField;
@synthesize addlDiscountTextField = _addlDiscountTextField;
@synthesize taxTextField = _taxTextField;
@synthesize taxSwitch = _taxSwitch;
@synthesize originalPriceLabel = _originalPriceLabel;
@synthesize firstDiscountPriceLabel = _firstDiscountPriceLabel;
@synthesize secondDiscountPriceLabel = _secondDiscountPriceLabel;
@synthesize taxPriceLabel = _taxPriceLabel;
@synthesize totalPriceLabel = _totalPriceLabel;
@synthesize totalSavedLabel = _totalSavedLabel;
@synthesize taxStatus = _taxStatus;
@synthesize showGraphButton = _showGraphButton;

-(MyView*) myView
{
    if(_myView == nil) //if myView hasn't been initialized yet, initialize it!
    {
        _myView = [[MyView alloc] init];
    }
    return _myView;
}


//Calculate Discount does all calculations and changes the appropriate labels.
- (IBAction)calculateDiscount:(UIButton *)sender
{
    
    //when they press "calculate", get rid of the keyboard:
    [self.priceTextField resignFirstResponder];
    [self.discountTextField resignFirstResponder];
    [self.addlDiscountTextField resignFirstResponder];
    [self.taxTextField resignFirstResponder];
    
    //get the text field values that were entered:
    float price = [self. priceTextField.text floatValue];
    float discount = [self.discountTextField.text floatValue];
    float addlDiscount = [self.addlDiscountTextField.text floatValue];
    float tax = [self.taxTextField.text floatValue];
    
    //initalize the 5 values we want to use to hold the information for the 5 labels
    //float originalPrice = 0; //don't need this one, we'll just use "price"
    float discountedPrice = 0; //used for the first discount
    float addlDiscountedPrice = 0; //used for the second discount
    float taxPrice = 0;
    float totalPrice = price; //total price starts with the original price
    
    if(self.taxStatus==0) //The user wishes to apply taxes BEFORE all discounts.
    {
        //1. Show Original Price:
        self.originalPriceLabel.text = [NSString stringWithFormat:@"$%.2f", price];
        
        //2. Calculate Tax (for users that select "Calculate Tax AFTER Discounts"
        //  price * tax rate
        //  example:
        //    $100 * .0875 = $8.75
        //first convert "8.75%" to ".0875"
        tax = tax / 100;
        taxPrice = totalPrice * tax;
        //update the "tax" label (to be "$8.75" in our example)
        self.taxPriceLabel.text = [NSString stringWithFormat:@"+ $%.2f", taxPrice];
        //update total price (to be "$108.75" in our example)
        totalPrice = totalPrice + taxPrice;
        
        //3. Calculate (first) Discount:
        //  price * discount = discountedPriceLabel
        //  example:
        //    $108.75 * .10 = $10.88
        //first convert "10%" to ".10"
        discount = discount / 100;
        discountedPrice = totalPrice * discount;
        //update the "first discount" label (to be "$10.88" in our example)
        self.firstDiscountPriceLabel.text = [NSString stringWithFormat:@"- $%.2f", discountedPrice];
        //update total price (to be "$97.87" in our example)
        totalPrice = totalPrice - discountedPrice;
        
        //4. Calculate Additional Discount:
        //  already discounted price * discount
        //  example
        //    $97.87 * .05 = $4.89
        //first convert "5%" to ".05"
        addlDiscount = addlDiscount / 100;
        addlDiscountedPrice = totalPrice * addlDiscount;
        //update the "second discount" label (to be "$4.89" in our example)
        self.secondDiscountPriceLabel.text = [NSString stringWithFormat:@"- $%.2f", addlDiscountedPrice];
        //update total price (to be "$92.98" in our example)
        totalPrice = totalPrice - addlDiscountedPrice;
        
        //5. Update the total price label
        self.totalPriceLabel.text = [NSString stringWithFormat:@"$%.2f", totalPrice];
        
        //6. Calculate Total Saved
        self.totalSavedLabel.text = [NSString stringWithFormat:@"$%.2f", (price - totalPrice)];
        
        //copy over the variables needed in "myView"
        self.myView.price = price;
        self.myView.discountedPrice = discountedPrice;
        self.myView.addlDiscountedPrice = addlDiscountedPrice;
        self.myView.taxPrice = taxPrice;
//*******this is where I'm having a problem. "self.myView.price" is not being set to "price", and so forth.
        
    }else if(self.taxStatus==1) //The user wishes to apply taxes AFTER all discounts.
    {
        //1. Show Original Price:
        self.originalPriceLabel.text = [NSString stringWithFormat:@"$%.2f", price];
        
        //2. Calculate (first) Discount:
        //  price * discount = discountedPriceLabel
        //  example:
        //    $100 * .10 = $10
        //first convert "10%" to ".10"
        discount = discount / 100;
        discountedPrice = totalPrice * discount;
        //update the "first discount" label (to be "$10" in our example)
        self.firstDiscountPriceLabel.text = [NSString stringWithFormat:@"- $%.2f", discountedPrice];
        
        //update total price (to be "$90" in our example)
        totalPrice = totalPrice - discountedPrice;
        
        //3. Calculate Additional Discount:
        //  already discounted price * discount
        //  example:
        //    $90 * .05 = $4.50
        //first convert "5%" to ".05"
        addlDiscount = addlDiscount / 100;
        addlDiscountedPrice = totalPrice * addlDiscount;
        //update the "second discount" label (to be "$4.50" in our example)
        self.secondDiscountPriceLabel.text = [NSString stringWithFormat:@"- $%.2f", addlDiscountedPrice];
        //update total price (to be "$85.50" in our example)
        totalPrice = totalPrice - addlDiscountedPrice;
        
        //4. Calculate Tax (for users that select "Calculate Tax AFTER Discounts"
        //  complete discounted price * tax rate
        //  example:
        //    $85.50 * .0875 = $7.48
        //first convert "8.75%" to ".0875"
        tax = tax / 100;
        taxPrice = totalPrice * tax;
        //update the "tax" label (to be "$7.48" in our example)
        self.taxPriceLabel.text = [NSString stringWithFormat:@"+ $%.2f", taxPrice];
        //update total price (to be "$92.98" in our example)
        totalPrice = totalPrice + taxPrice;
        
        //5. Update the total price label
        self.totalPriceLabel.text = [NSString stringWithFormat:@"$%.2f", totalPrice];
        
        //6. Calculate Total Saved
        self.totalSavedLabel.text = [NSString stringWithFormat:@"$%.2f", (price - totalPrice)];
        
        //copy over the variables needed in "myView"
        self.myView.price = price;
        self.myView.discountedPrice = discountedPrice;
        self.myView.addlDiscountedPrice = addlDiscountedPrice;
        self.myView.taxPrice = taxPrice;
//*******this is where I'm having a problem. "self.myView.price" is not being set to "price", and so forth.
    }
    //display the "show graph" button:
    self.showGraphButton.hidden = false;
    
}
//Tax Change monitors the "Before/After" segment for changes, then sets a
//  varaible that will be used to calculate the tax. The segment controls
//  whether taxes shall be applied before or after the discounts.
- (IBAction) taxChange
{
    if(self.taxSwitch.selectedSegmentIndex==0) //The user wishes to apply taxes BEFORE discounts.
    {
        self.taxStatus = 0;
        NSLog(@"\nApplying taxes BEFORE discounts");
        //when this button is successfully changed, let's make sure all the result labels are clear:
        self.originalPriceLabel.text = @"";
        self.firstDiscountPriceLabel.text = @"";
        self.secondDiscountPriceLabel.text = @"";
        self.taxPriceLabel.text = @"";
        self.totalPriceLabel.text = @"";
        self.totalSavedLabel.text = @"";
    }
    else if(self.taxSwitch.selectedSegmentIndex==1) //The user wishes to apply taxes AFTER discounts.
    {
        self.taxStatus = 1;
        NSLog(@"\nApplying taxes AFTER discounts");
        //when this button is successfully changed, let's make sure all the result labels are clear:
        self.originalPriceLabel.text = @"";
        self.firstDiscountPriceLabel.text = @"";
        self.secondDiscountPriceLabel.text = @"";
        self.taxPriceLabel.text = @"";
        self.totalPriceLabel.text = @"";
        self.totalSavedLabel.text = @"";
    }else{
        NSLog(@"\nTax Change Error");
    }
}

/*
 If A User Touches Outside The Keyboard, The Keyboard Will Dissapear. This Functionality has been provided by:
 Author Name: Michael Shafae
 Code File Name: ShowHideKeyboard.zip
 Code Download: http://gamble.ecs.fullerton.edu/teaching/fall12/cs491t/sample-code/ShowHideKeyboard.zip/view
 */

//***If A User Touches Outside Of The Keyboard, Return The App As The First Delegate***
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.priceTextField resignFirstResponder];
    [self.discountTextField resignFirstResponder];
    [self.addlDiscountTextField resignFirstResponder];
    [self.taxTextField resignFirstResponder];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
      return YES;
  }
}

@end
