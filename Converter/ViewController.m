//
//  ViewController.m
//  Converter
//
//  Created by AVIL on 10.07.17.
//  Copyright © 2017 AVIL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)updateVal:(id)sender {

    _toVal.text = [self getVal];
}

- (NSString *) getVal {
    NSString * txt = _inputFrom.text;

    if([txt isEqual: @""]){
        txt = @"0";
    }
    
    return txt;
}

@end
