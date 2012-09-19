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
//  File Description: This file defines all variables and functions that will
//      be used in ViewController.m for calculations and display.
//
//The touchesBegan function
//      allows the app to return as first responder after the user touches outside of
//      the keyboard. Note that "touchesBegan" has been taken from Michael Shafae.
//      Here is the author's information for "touchesBegan":
//
//              Author Name: Michael Shafae
//              Code File Name: ShowHideKeyboard.zip
//              Code Download: http://gamble.ecs.fullerton.edu/teaching/fall12/cs491t/sample-code/ShowHideKeyboard.zip/view
//

#import <UIKit/UIKit.h>
#import "MyView.h"

@interface ViewController : UIViewController <UITextFieldDelegate>
{
     IBOutlet MyView* _myView;
    
    //Private variables used in ViewController.m
@private
    IBOutlet UITextField* _priceTextField;
    IBOutlet UITextField* _discountTextField;
    IBOutlet UITextField* _addlDiscountTextField;
    IBOutlet UITextField* _taxTextField;
    IBOutlet UISegmentedControl* _taxSwitch;
    IBOutlet UILabel* _originalPriceLabel;
    IBOutlet UILabel* _firstDiscountPriceLabel;
    IBOutlet UILabel* _secondDiscountPriceLabel;
    IBOutlet UILabel* _taxPriceLabel;
    IBOutlet UILabel* _totalPriceLabel;
    IBOutlet UILabel* _totalSavedLabel;
    IBOutlet UIButton* _showGraphButton;
    int _taxStatus;
}

@property (retain, nonatomic) MyView*  myView;
@property (nonatomic, retain) UITextField* priceTextField;
@property (nonatomic, retain) UITextField* discountTextField;
@property (nonatomic, retain) UITextField* addlDiscountTextField;
@property (nonatomic, retain) UITextField* taxTextField;
@property (nonatomic, retain) UISegmentedControl* taxSwitch;
@property (nonatomic, retain) UILabel* originalPriceLabel;
@property (nonatomic, retain) UILabel* firstDiscountPriceLabel;
@property (nonatomic, retain) UILabel* secondDiscountPriceLabel;
@property (nonatomic, retain) UILabel* taxPriceLabel;
@property (nonatomic, retain) UILabel* totalPriceLabel;
@property (nonatomic, retain) UILabel* totalSavedLabel;
@property (nonatomic, retain) UIButton* showGraphButton;
@property int taxStatus;

//Calculate Discount does all calculations and changes the appropriate labels.
- (IBAction)calculateDiscount :(UIButton*)sender;

//Tax Change monitors the "Before/After" segment for changes, then sets a
//  varaible that will be used to calculate the tax. The segment controls
//  whether taxes shall be applied before or after the discounts.
- (IBAction)taxChange;

//Touches Began function was taken from Michael Shafae. It allows the App to return
//as first responder when a user touches outside of the keyboard area.
/*
 Author Name: Michael Shafae
 Code File Name: ShowHideKeyboard.zip
 Code Download: http://gamble.ecs.fullerton.edu/teaching/fall12/cs491t/sample-code/ShowHideKeyboard.zip/view
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

@end
