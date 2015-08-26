//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Humza Ahmed on 21/02/2015.
//  Copyright (c) 2015 Humza Ahmed. All rights reserved.
//

/***********************************************************************
 ICalculator - Simple smart calculator for iOS made for learning and an assignment at university of westminster.
 Copyright (C) 2015 Humza Ahmed
 
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
 ***********************************************************************/

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
