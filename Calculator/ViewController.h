//
//  ViewController.h
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

