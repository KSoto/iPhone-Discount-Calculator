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
//  File Description: This file defines all variables that will be used in
//      MyView.m to calculate and display the bar graphs.


#import <UIKit/UIKit.h>

@interface MyView : UIView
{
    BOOL isOn;
    float price;
    float discountedPrice;
    float addlDiscountedPrice;
    float taxPrice;
        
}

@property (assign) float price;
@property (assign) float discountedPrice;
@property (assign) float addlDiscountedPrice;
@property (assign) float taxPrice;
@property (assign) BOOL isOn;

@end
