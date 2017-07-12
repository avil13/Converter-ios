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

NSArray *_pikerViewArray;


@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    _myPickerView.delegate = self;
    _myPickerView.dataSource = self;

    _pikerViewArray = @[@"RUB", @"EUR", @"USD"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Настройка pickerView ---
// Выбрали валюту
- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    _toVal.text = [_pikerViewArray objectAtIndex:row];
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _pikerViewArray.count;
}

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return _pikerViewArray[row];
}
// /pickerView




// Update value in input

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
