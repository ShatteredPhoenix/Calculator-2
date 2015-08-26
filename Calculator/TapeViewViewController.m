//
//  TapeViewViewController.m
//  Calculator
//
//  Created by Humza Ahmed on 25/02/2015.
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

#import "TapeViewViewController.h"

@interface TapeViewViewController ()

@end

@implementation TapeViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   self.TextView.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"Person"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
