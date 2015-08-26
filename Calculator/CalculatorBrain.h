//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Humza Ahmed on 21/02/2015.
//  Copyright (c) 2015 Humza Ahmed. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

/*Will Push Operands onto the Stack*/
- (void) PushOperand:(double) Operand;

/*Will clean the memory when the AC button is pressed*/
-(void) CleanMemory;

/*Clear last button pressed from Stack*/
-(void) ClearLast;

/*Performs a given operation using the operands on the stack*/
- (double) PerformOperation: (NSString *) Operation;

/*Switch on and off*/
-(void) RadSwitchOn;
-(void) RadSwitchOff;


@end
