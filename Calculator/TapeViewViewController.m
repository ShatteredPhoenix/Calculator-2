//
//  TapeViewViewController.m
//  Calculator
//
//  Created by Humza Ahmed on 25/02/2015.
//  Copyright (c) 2015 Humza Ahmed. All rights reserved.
//

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
