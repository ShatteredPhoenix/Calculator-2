//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Humza Ahmed on 21/02/2015.
//  Copyright (c) 2015 Humza Ahmed. All rights reserved.
//

/*Include CalculatorBrain Header File*/
#import "CalculatorBrain.h"

@interface CalculatorBrain()

/*Property for Switch*/
@property(nonatomic) BOOL RadSwitch;

/*Property for the Array, Strong means keep it around until we are done using it*/
@property (nonatomic, strong) NSMutableArray *OperandStack;

/*Property for the TapeView Array*/
@property (nonatomic, strong) NSMutableArray* TapeView;


@end

/*Implementation for Calculator Brain*/
@implementation CalculatorBrain

/*Manual Synthesis - Custom Getter and Setter - Used to make an instance variable*/
@synthesize OperandStack = _OperandStack;

/*Same as the OPerandStack Synthesis*/
@synthesize RadSwitch = _RadSwitch;

/**/
-(void)RadSwitchOn
{
    _RadSwitch = YES;
}

-(void) RadSwitchOff
{
    _RadSwitch = NO;
}

/*Intialising the Operand Stack*/
- (NSMutableArray *)OperandStack
{
    if (!_OperandStack) {
        _OperandStack = [[NSMutableArray alloc] init];
    }
    return _OperandStack;
    
}

/*Intialising the TapeViewArray*/
- (NSMutableArray *)TapeView
{
    if (!_TapeView) {
        _TapeView = [[NSMutableArray alloc] init];
    }
    return _TapeView;
    
}

/*Cleans memory when AC Button is Pressed*/
- (void) CleanMemory
{
    /*Remove all objects from the stack*/
    [self.OperandStack removeAllObjects];
}

/*ClearLast*/
- (void) ClearLast
{
    /*Remove Last objects from the stack*/
    [self.OperandStack removeLastObject];
}


/*Push the Operands onto the Stack*/
-(void) PushOperand:(double) Operand
{
    /*Because 'double' is a primitive and an object we have to wrap it in the NSNumber Wrapper which wraps primitve types to objects before we can put it in the array of objects */
     NSNumber *operandObject = [NSNumber numberWithDouble:Operand];
    
     /*Add the Operand onto the Stack*/
     [self.OperandStack addObject:operandObject];
}

/*Pop The Operation off the Stack*/
-(double)PopOperand
{
    /*Get the Last Object in the Array/Stack of Operands i.e Last Object*/
    NSNumber *OperandObject = [self.OperandStack lastObject]; // Last Object Returns last Object in the array
    
    /*Check to see if we have a non nil object from the array otherwsie it would crash*/
    if (OperandObject)
    {
        /*Remove the last object from the Stack, the one that we retrieved*/
        [self.OperandStack removeLastObject];
    }
    
    /*Return a double value*/
    return [OperandObject doubleValue];
}

/*Performs the given operation*/
- (double) PerformOperation: (NSString *) Operation
{
    /*pop the stack onto 2 variables for basic operations and recurseive use of equals*/
    double V2 = [self PopOperand];
    double V1 = [self PopOperand];
    
    double result = 0;
    
    /*If the Operation is = to NSString '+' then it will perform the add operation*/
    if ([Operation isEqualToString:@"+"])
    {
        
        /*The Values we get off the stack are now added together to perform the addition operation*/
        //result = [self PopOperand] + [self PopOperand];
        result = V2 + V1;
        
        /*Make a String of the complete operation and store into the Mutable Array which will be used for the tape view*/
        NSString * String = [NSString stringWithFormat:@"%g + %g = %g",V1, V2, result];
        
        /*Add String into the Array*/
        [self.TapeView addObject:String];

    }
    
    /*Otherwise if the Operation is = to 'X' perform the multiple operation */
    else if ([@"X"isEqualToString:Operation])
    {
        
        /*The Values we get off the stack are now multiplied together to perform the multiplication operation*/
        result = V1 * V2;
        
         /*Make a String of the complete operation and store into the Mutable Array which will be used for the tape view*/
        NSString * String = [NSString stringWithFormat:@"%g x %g = %g",V1, V2, result];
        
        /*Add String into the Array*/
        [self.TapeView addObject:String];
    }
    
    /*If the operation is equal to NSString '-' then the Subtract Operation will be performed*/
    else if ([Operation isEqualToString:@"-"])
    {
        
        /*Values are now poped off the stack then subtracted*/
        result = V1 - V2;
        
        /*Make a String of the complete operation and store into the Mutable Array which will be used for the tape view*/
        NSString * String = [NSString stringWithFormat:@"%g - %g = %g",V1, V2, result];
        
        /*Add String into the Array*/
        [self.TapeView addObject:String];
    }
    
    /*Otherwise if = to '/' the Division Operation will be Performed*/
    else if ([Operation isEqualToString:@"/"])
    {
        
        /*Once propped off correctly the division operation will be performed we return 0 on a divide by 0*/
        result = V1 / V2;
        
        /*Make a String of the complete operation and store into the Mutable Array which will be used for the tape view*/
        NSString * String = [NSString stringWithFormat:@"%g / %g = %g",V1, V2, result];
        
        /*Add String into the Array*/
        [self.TapeView addObject:String];
      
        
    }
    
    /*Otherwise if the sign is % then it will do a % calculation*/
    else if ([Operation isEqualToString:@"%"])
    {
        //Divide by Variable
        result = V1 / 100;
        
        /*Make a String of the complete operation and store into the Mutable Array which will be used for the tape view*/
        NSString * String = [NSString stringWithFormat:@"%g Percent = %g",V1, result];
        
        /*Add String into the Array*/
        [self.TapeView addObject:String];
        
        
    }
    
    /*Sin if String is equal to 'Sin'*/
    else if ([Operation isEqualToString:@"Sin"])
    {
        /*If Rad switch is YES to Rad calculation*/
        if (_RadSwitch == YES)
        {
            result = sin(V1);//Radian Calculation
            
        }
        /*Do normal Degree Calculation*/
        else
        {
          result = sin(V1 *M_PI/180); // Degree Calculation
        }
        
        /*Make a String of the complete operation and store into the Mutable Array which will be used for the tape view*/
        NSString * String = [NSString stringWithFormat:@"Sin(%g) = %g",V1, result];
        
        /*Add String into the Array*/
        [self.TapeView addObject:String];
        
    }
    
    /*Cos if Cos is String then do Cos*/
    else if ([Operation isEqualToString:@"Cos"])
    {
        
        //Rad Switch is On
        if (_RadSwitch == YES)
        {
            result = cos(V1);//Rad Calculation
        }
        
        /*Else do Degree Calculation*/
        else
        {
           result = cos(V1*M_PI/180);//Degree Calculation
        }
        
        /*Make a String of the complete operation and store into the Mutable Array which will be used for the tape view*/
        NSString * String = [NSString stringWithFormat:@"Cos(%g) = %g",V1, result];
        
        /*Add String into the Array*/
        [self.TapeView addObject:String];
    }
    
    /*Tan*/
    else if ([Operation isEqualToString:@"Tan"])
    {
        
        //Switch on then do
        if (_RadSwitch == YES)
        {
            result = tan(V1);//Rad Calculations
        }
        
        //Switch off
        else
        
        {
          result = tan(V1*M_PI/180); //Degree Calculation
        }
        
        /*Make a String of the complete operation and store into the Mutable Array which will be used for the tape view*/
        NSString * String = [NSString stringWithFormat:@"Tan(%g) = %g",V1, result];
        
        /*Add String into the Array*/
        [self.TapeView addObject:String];
    }

    /*Log*/
    else if ([Operation isEqualToString:@"Log"])
    {
        
        result = log10(V1);
        
        /*Make a String of the complete operation and store into the Mutable Array which will be used for the tape view*/
        NSString * String = [NSString stringWithFormat:@"Log10(%g) = %g",V1, result];
        
        /*Add String into the Array*/
        [self.TapeView addObject:String];
    }
    
    /*Ln*/
    else if ([Operation isEqualToString:@"ln"])
    {
        
        result = log(V1);
        
        /*Make a String of the complete operation and store into the Mutable Array which will be used for the tape view*/
        NSString * String = [NSString stringWithFormat:@"Log(%g) = %g",V1, result];
        
        /*Add String into the Array*/
        [self.TapeView addObject:String];
    }
    
    /*Squared*/
    else if ([Operation isEqualToString:@"x²"])
    {

        result = pow(V1, 2.0);
        
        /*Make a String of the complete operation and store into the Mutable Array which will be used for the tape view*/
        NSString * String = [NSString stringWithFormat:@" %g² = %g",V1, result];
        
        /*Add String into the Array*/
        [self.TapeView addObject:String];
    }
    
    /*Recip*/
    else if ([Operation isEqualToString:@"1/x"])
    {
        result = 1/V1;
        
        /*Make a String of the complete operation and store into the Mutable Array which will be used for the tape view*/
        NSString * String = [NSString stringWithFormat:@" 1/%g = %g",V1, result];
        
        /*Add String into the Array*/
        [self.TapeView addObject:String];
        
    }
    
    /*Pi*/
    else if ([Operation isEqualToString:@"π"])
    {
        result = M_PI;
        
        /*Make a String of the complete operation and store into the Mutable Array which will be used for the tape view*/
        NSString * String = [NSString stringWithFormat:@"  π = %g", result];
        
        /*Add String into the Array*/
        [self.TapeView addObject:String];
        
    }
    
    /*Pos,Neg*/
    else if ([Operation isEqualToString:@"±"])
    {
        result = -1 * [self PopOperand];
        
        /*Make a String of the complete operation and store into the Mutable Array which will be used for the tape view*/
        NSString * String = [NSString stringWithFormat:@"  %g", result];
        
        /*Add String into the Array*/
        [self.TapeView addObject:String];
        
    }
    
    /*Sin-1 if String = Sin-1*/
    else if ([Operation isEqualToString:@"Sin⁻¹"])
    {
        
        //Switch on
        if (_RadSwitch == YES)
        {
             result = asin(V1);//Rad Calculation
        }
        
        //Switch Off
        else
        {
         result = asin((V1))* (180/M_PI);//Deg Calculation
        }
        
        /*Make a String of the complete operation and store into the Mutable Array which will be used for the tape view*/
             NSString * String = [NSString stringWithFormat:@"Sin⁻¹(%g) = %g",V1, result];
        
        /*Add String into the Array*/
        [self.TapeView addObject:String];
        
    }
    
    /*Tan-1*/
    else if ([Operation isEqualToString:@"Tan⁻¹"])
    {
        
        //Switch on
        if (_RadSwitch == YES)
        {
              result = atan(V1);//Rad Calculation
        }
        
        //Switch Off
        else
        {
            result = atan((V1))* (180/M_PI);//Deg Calculation
        }
        
        /*Make a String of the complete operation and store into the Mutable Array which will be used for the tape view*/
        NSString * String = [NSString stringWithFormat:@"Tan⁻¹(%g) = %g",V1, result];
        
        /*Add String into the Array*/
        [self.TapeView addObject:String];
        
    }
    
    /*Cos-1*/
    else if ([Operation isEqualToString:@"Cos⁻¹"])
    {
        //Switch On
        if (_RadSwitch == YES)
        {
            result = acos(V1);//Rad Calculation
        }
        
        //Switch Off
        else
        {
            result = acos((V1))* (180/M_PI);//Deg Calculation
        }
        
        /*Make a String of the complete operation and store into the Mutable Array which will be used for the tape view*/
        NSString * String = [NSString stringWithFormat:@"Cos⁻¹(%g) = %g",V1, result];
        
        /*Add String into the Array*/
        [self.TapeView addObject:String];
    }
    
    else if ([Operation isEqualToString:@"√"])
    {
 
        /*Square root Variable*/
        result = sqrt(V1);
        
        /*Make a String of the complete operation and store into the Mutable Array which will be used for the tape view*/
        NSString * String = [NSString stringWithFormat:@"√%g  = %g",V1, result];
        
        /*Add String into the Array*/
        [self.TapeView addObject:String];
    }
    
    [self TapeViewArray];
    [self PushOperand:V1];
    return result;
}

/*Method for looping through the array and putting everything into a NsMutableString*/
-(void) TapeViewArray
{
    NSMutableString * StringAgain = [[NSMutableString alloc ] init];
    
    for (int x = 0; x < self.TapeView.count; x++)
    {
        [StringAgain appendFormat:@"\n %@", self.TapeView[x]];
    }
    
[[NSUserDefaults standardUserDefaults] setValue:StringAgain forKey:@"Person"];
    
}

@end
