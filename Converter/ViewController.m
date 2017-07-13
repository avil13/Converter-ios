//
//  ViewController.m
//  Converter
//
//  Created by AVIL on 10.07.17.
//  Copyright © 2017 AVIL. All rights reserved.
//

#import "ViewController.h"
#import "ConverterController.h"

@interface ViewController ()

@end

NSArray *_pikerViewArray;


@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    ConverterController*converterController;

    converterController = [[ConverterController alloc]init];

    
    _myPickerView.delegate = self;
    _myPickerView.dataSource = self;

    _secontPickerView.delegate = self;
    _secontPickerView.dataSource = self;

    _pikerViewArray = @[@"RUB", @"EUR", @"USD"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Настройка pickerView ---
// Выбрали валюту
- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    [self updateData]; // обновляем данные
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
    [self updateData];
}


- (NSString *) getVal {
    NSString * txt = _inputFrom.text;

    if([txt isEqual: @""]){
        txt = @"0";
    }
    
    return txt;
}



-(void) updateData{
    NSString *val = [self getVal] ;

    NSString *from = _pikerViewArray [(long)[_myPickerView selectedRowInComponent:0]];
    NSString *to = _pikerViewArray[(long)[_secontPickerView selectedRowInComponent:0]];

    _toVal.text = [ConverterController convert :val :from :to];
}

@end










