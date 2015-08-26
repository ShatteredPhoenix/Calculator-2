//
//  ViewController.h
//  Calculator
//
//  Created by Humza Ahmed on 11/02/2015.
//  Copyright (c) 2015 Humza Ahmed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

/*Property for the Display
    The Property is a Weak Point, Nonatomic (Not Thread Safe), Outlet Property, Pointer to a UI Object, with the name Display
 */
@property (weak, nonatomic) IBOutlet UILabel *DigitDisplay;


/*Sin Button for 2nd Function*/
@property (weak, nonatomic) IBOutlet UIButton *Sin;

/*Property for Tan*/
@property (weak, nonatomic) IBOutlet UIButton *Tan;

/*Property Cos*/
@property (weak, nonatomic) IBOutlet UIButton *Cos;

/*Property for Log Button*/
@property (weak, nonatomic) IBOutlet UIButton *Log;

/*Operation Property as NSString*/
@property (nonatomic, weak) NSString *Operation;

/*Property for Loge*/
@property (weak, nonatomic) IBOutlet UIButton *Loge;

/*Property for Switch*/
@property (weak, nonatomic) IBOutlet UISwitch *Switch;

/*Property for RadDeg Label*/
@property (weak, nonatomic) IBOutlet UILabel *LabelForRadDeg;

/*Boolean Property for Positive, Negative Button*/
@property (nonatomic) BOOL PosNegChange;
@end

