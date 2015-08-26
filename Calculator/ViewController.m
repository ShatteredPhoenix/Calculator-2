//
//  ViewController.m
//  Calculator
//
//  Created by Humza Ahmed on 11/02/2015.
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

/*Imports from other header files*/
#import "CalculatorBrain.h"
#import "ViewController.h"

@interface ViewController ()
/*Private Property*/
/*User entering a Number*/
@property (nonatomic) BOOL UserInTheMiddleOfEnteringANumber;

/*Calculator Brain Property*/
@property (nonatomic, strong) CalculatorBrain *Brain;

@end

@implementation ViewController

/*Using it to prevent confusion and mistakes like forgetting the 'self'*/
@synthesize Operation = _Operation;

/*Instantiating the Brain*/
- (CalculatorBrain *) Brain
{
    if (!_Brain) _Brain = [[CalculatorBrain alloc] init];
    return _Brain;
}

/*Method for Digit Pressed 
 IBAction is exactly the same as void, ID = pointer to an object of any class, Using UIButton = Static Typing */
- (IBAction)DigitPressed:(UIButton*)sender
{
    
    /*If the length of the text in that displa is = 9 then*/
    if (_DigitDisplay.text.length >= 9)
    {
        /*Form a Subtring, basically cut off all the numbers after 9 digits have been entered Tranculate them*/
        _DigitDisplay.text=[_DigitDisplay.text substringToIndex:8];
    }
    
    /*Create NSString Object Variable, currentTitle returns a NSS String containing title of the Button */
    NSString *Digit = [sender currentTitle];
   
    
    /*Condition statement if user is in middle of entering number then append the numbers to the end of the display otherwise just start a new digit with the number the user touched. This will only work until 9 digits have been entered then the display will stop adding new numbers*/
    if (self.UserInTheMiddleOfEnteringANumber && _DigitDisplay.text.length < 9)
    {
        /*Append the digit the user touched the end of display*/
        self.DigitDisplay.text = [self.DigitDisplay.text stringByAppendingString:Digit];
        
      //  NSString *Comma = [self addComasToStringEvery3chrsFromRightToLeft:_DigitDisplay.text];
       // _DigitDisplay.text = Comma;
    }
    
    else
    {   /*If user is not in the middle of typing then start from new Digit*/
        self.DigitDisplay.text = Digit;
        
        /*Set Bool to YES*/
        self.UserInTheMiddleOfEnteringANumber = YES;
    }
    
}


/*Operation Pressed Method*/
- (IBAction)OperandPressed:(id)sender
{
    /*Return NSString of the title of the operation button pessed (+/-x) */
     _Operation= [sender currentTitle];
    
    /*Push the double value on our display into the model*/
    [self.Brain PushOperand:[self.DigitDisplay.text doubleValue]];
    
    /*User is not in the middle of entering a number*/
    self.UserInTheMiddleOfEnteringANumber = NO;
    
    
}

- (IBAction)EqualIsPressed:(UIButton *)sender {
    /*Push the double value on display into our model and stack*/
    [self.Brain PushOperand:[self.DigitDisplay.text doubleValue]];
    
    /*User in the middle of entering a Number ofc not*/
    self.UserInTheMiddleOfEnteringANumber = NO;
    
    /*Perform the operation and then store the result as double in var result*/
    double result = [self.Brain PerformOperation:_Operation];
    
    /*Change text of the display to the result up to 8 Decimals technically 0.8f Decimal float to 8 Decimal Places*/
    self.DigitDisplay.text = [NSString stringWithFormat:@"%8g", result];
  
    
}

/*Clear Memory when AC Button Is Pressed*/
- (IBAction)ACButtonPressed:(UIButton *)sender
{
    /*Call Clean Memory Operation from Brain*/
    [self.Brain CleanMemory];
    
    /*Set the Display back to 0*/
    self.DigitDisplay.text = @"0";
    
    /*User is not in the middle of entering a number if they are pressing the AC Buttpm*/
    self.UserInTheMiddleOfEnteringANumber = NO;
}

/*Clears the last Number put in*/
- (IBAction)ClearLast:(id)sender
{
    /*Clear Last Object*/
    [self.Brain ClearLast];
    
    /*Set the Display back to 0*/
    self.DigitDisplay.text = @"0";
    
    /*User is not in the middle of entering a number if they are pressing the AC Buttpm*/
    self.UserInTheMiddleOfEnteringANumber = NO;
}

/*When the Decimal Button I.e Dot Button is Pressed*/
- (IBAction)DecimalButtonPressed:(UIButton *)sender
{
    NSRange range = [self.DigitDisplay.text rangeOfString:@"."];
    if (range.location == NSNotFound){
        self.DigitDisplay.text = [ self.DigitDisplay.text stringByAppendingString:@"."];
    }
    
    /*User is still entering a number during decimal*/
    self.UserInTheMiddleOfEnteringANumber = YES;
}

/*Seperate action for Recpricole*/
- (IBAction)Recipricole:(UIButton *)sender
{
    /*if Result is = 0 show ERROR*/
    if (_DigitDisplay.text == 0)
    {
        _DigitDisplay.text = [NSString stringWithFormat:@"ERROR"];
    }
    
    /*Return NSString of the title of the operation button pessed (+/-x) */
    _Operation= [sender currentTitle];
    
    /*Push the double value on our display into the model*/
    [self.Brain PushOperand:[self.DigitDisplay.text doubleValue]];
    
    /*User is not in the middle of entering a number*/
    self.UserInTheMiddleOfEnteringANumber = NO;
    
    /*Perform the operation and then store the result as double in var result*/
    double result = [self.Brain PerformOperation:_Operation];
    
  
    /*Change text of the display to the result up to 8 Decimals technically 0.8f Decimal float to 8 Decimal Places*/
    self.DigitDisplay.text = [NSString stringWithFormat:@"%8g", result];
    
}

/*Button for PI Seperate because of the 8 decimal place*/
- (IBAction)PIButton:(UIButton *)sender
{
    /*Return NSString of the title of the operation button pessed (+/-x) */
    _Operation= [sender currentTitle];
    
    /*Push the double value on our display into the model*/
    [self.Brain PushOperand:[self.DigitDisplay.text doubleValue]];
    
    /*User is not in the middle of entering a number*/
    self.UserInTheMiddleOfEnteringANumber = NO;
    
    /*Perform the operation and then store the result as double in var result*/
    double result = [self.Brain PerformOperation:_Operation];
    
    
    /*Change text of the display to the result up to 8 Decimals technically .8f Decimal float to 8 Decimal Places*/
    self.DigitDisplay.text = [NSString stringWithFormat:@"%.8f", result];
}


- (IBAction)stButton:(UIButton *)sender
{
    [_Sin setTitle:@"Sin" forState:UIControlStateNormal];
    [_Tan setTitle:@"Tan" forState:UIControlStateNormal];
    [_Cos setTitle:@"Cos" forState:UIControlStateNormal];
    [_Log setTitle:@"Log" forState:UIControlStateNormal];
    [_Loge setTitle:@"Loge" forState:UIControlStateNormal];
}

/*Change the text of buttons*/
- (IBAction)ButtonChange2nd:(UIButton *)sender {
    [_Sin setTitle:@"Sin⁻¹" forState:UIControlStateNormal];
    [_Tan setTitle:@"Tan⁻¹" forState:UIControlStateNormal];
    [_Cos setTitle:@"Cos⁻¹" forState:UIControlStateNormal];
    [_Log setTitle:@"%" forState:UIControlStateNormal];
    [_Loge setTitle:@"√" forState:UIControlStateNormal];
   
}

/*The Rad Degree Switch + Counter*/
- (IBAction)RadDEgree:(UISwitch *)sender {
    if (sender.on)
    {
        [self.Brain RadSwitchOn];
        _LabelForRadDeg.text = [NSString stringWithFormat:@"Radian"];
    }
    else
    {
        [self.Brain RadSwitchOff];
        _LabelForRadDeg.text = [NSString stringWithFormat:@"Degree"];
    }
}


/***************************************ª****************************************************************/
//-(void) willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
//    //you code here to handle programatic segue
//    
//    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
//        NSLog(@"Landscape left");
//        
//        [self performSegueWithIdentifier:@"LandscapeView" sender:self];
//        
//        
//        
//    } //etc.
//    else if (toInterfaceOrientation == UIInterfaceOrientationPortrait)
//    {
//        [self dismissViewControllerAnimated:YES completion:NULL];
//    }
//    
//}

//-(NSString*) addComasToStringEvery3chrsFromRightToLeft:(NSString*) myString{
//    NSMutableString *stringFormatted = [NSMutableString stringWithFormat:@"%@",myString];
//    for(NSInteger i=[stringFormatted length]-3;i>0;i=i-3) {
//        if (i>0) {
//            [stringFormatted insertString: @"," atIndex: i];
//        }
//    }
//    return stringFormatted;
//}

/*-------------------------------Seperate Spare Code xCode Genertated ------------------------------------*/
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
