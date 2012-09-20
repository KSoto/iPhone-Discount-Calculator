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
//  File Description: This file calculates and displays a bar graph showing
//      where the discounts and taxes have been allocated. These have been
//      calculated by using percentages of the original amount, so the boxes
//      that have been drawn are based on percentage. 
/*
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
 
 */

#import "MyView.h"

@implementation MyView

- (void) drawRect:(CGRect)rect
{    
    //Variable to hold the percent of tax in the total discount
    float mTaxPer = 0;
    
    //Variable to hold the percent of the first discount in the total discount
    float mFDiscountPer = 0;
    
    //Variable to hold the percent of the second discount in the total discount
    float mSDiscountPer = 0;
    
    //Original Price: (example, $100)
    float mPrice = 0;
    
    //Amount charged for tax: (example, $8.75)
    float mtaxPrice = 0;
    
    //Amount saved from first discount: (example, $10.88)
    float mdiscountedPrice = 0;
    
    //Amount saved from additional discount: (example, $4.89)
    float maddlDiscountedPrice = 0;
    
    //if for some reason all the prices are zero (something went wrong), then use example values:
    if((self.price==0)&&(self.taxPrice==0)&&(self.discountedPrice==0)&&(self.addlDiscountedPrice==0))
    {
        NSLog(@"\nNo Values For Graph Chart Found... Using Example Values");
        mPrice = 100;
        mtaxPrice = 8.75;
        mdiscountedPrice = 10.88;
        maddlDiscountedPrice = 4.89;
    }else{ //else, get the values from ViewController.h
        mPrice = self.price;
        mtaxPrice = self.taxPrice;
        mdiscountedPrice = self.discountedPrice;
        maddlDiscountedPrice = self.addlDiscountedPrice;
    }
    
  // Drawing code taken from QuartzDemo v.2.5, retrieved on 9/2012
  // http://tinyurl.com/7kjas57
  // Copyright (C) 2010 Apple Inc. All Rights Reserved.
  if (!self.isOn) {
		CGContextRef context = UIGraphicsGetCurrentContext();
		// Drawing with a white stroke color
		CGContextSetRGBStrokeColor(context, 0.0, 0.0, 1.0, 1.0);
		// And draw with a blue fill color
		CGContextSetRGBFillColor(context, 0.5, 0.0, 1.0, 1.0);
		// Draw them with a 2.0 stroke width so they are a bit more visible.
		CGContextSetLineWidth(context, 2.0);
		
        //Draw a rectangle for the "original price" bar
        CGContextFillRect(context, CGRectMake(40.0, 30.0, 40.0, 310.0));
		CGContextStrokePath(context);
      
      
      //1) Calculate the percentage of tax
      //     tax / totalOriginalPrice = %
      mTaxPer = mtaxPrice / mPrice;
      
      //2) Calculate the percentage of first discount
      //     firstDiscount / totalOriginalPrice = %
      mFDiscountPer = mdiscountedPrice / mPrice;
      
      //3) Calculate the percentage of second discount
      //     secondDiscount / totalOriginalPrice = %
      mSDiscountPer = maddlDiscountedPrice / mPrice;
      
      //4) Draw the base discount rectangle
      CGContextSetRGBFillColor(context, 0.5, 0.0, 1.0, 1.0);
      CGContextFillRect(context, CGRectMake(120.0, 30.0, 40.0, 310.0));
      CGContextStrokePath(context);
      
      //5) Draw discount 1 box
      CGContextSetRGBFillColor(context, 0.0, 1.0, 0.0, 1.0);
      float fdBox = 310*mFDiscountPer; //310 * 0.08 or whatever.
      //This will give you the amount of pixels the box goes down to
      CGContextFillRect(context, CGRectMake(120.0, 30.0, 40.0, fdBox));
      //FILL GREEN
      CGContextStrokePath(context);
      
      //6) Draw discount 2 box
      CGContextSetRGBFillColor(context, 0.0, 0.0, 1.0, 1.0);
      float sdBox = (310-fdBox)*mSDiscountPer; //290 * 0.07 or whatever.
      CGContextFillRect(context, CGRectMake(120.0, (30.0+fdBox), 40.0, sdBox));
      //FILL BLUE
      CGContextStrokePath(context);
      
      //7) Draw tax box
      CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 1.0);
      float taxBox = (310-fdBox-sdBox)*mTaxPer; //240 * 0.0875 or whatever.
      CGContextFillRect(context, CGRectMake(120.0, (30.0+fdBox+sdBox), 40.0, taxBox));
      //FILL RED
      CGContextStrokePath(context);
      
	}
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.isOn = NO;
    }
    return self;
    
}

@end
