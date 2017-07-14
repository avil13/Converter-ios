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

    ConverterController *converterController;

    converterController = [[ConverterController alloc] init];

    _inputFrom.delegate = self;
    _inputFrom.keyboardType = UIKeyboardTypeDecimalPad;

    _secontPickerView.delegate = self;
    _secontPickerView.dataSource = self;

    _pikerViewArray = @[@"RUB", @"USD", @"EUR"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Настройка pickerView ---
// Выбрали валюту
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    [self updateData]; // обновляем данные
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _pikerViewArray.count;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _pikerViewArray[row];
}
// /pickerView


// Update value in input
- (IBAction)updateVal:(id)sender {
    [self updateData];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    /*  limit to only numeric characters  */
    NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    for (int i = 0; i < [string length]; i++) {
        unichar c = [string characterAtIndex:i];
        if ([myCharSet characterIsMember:c]) {
            return YES;
        }
    }

    /*  limit the users input to only 9 characters  */
    NSUInteger newLength = [_inputFrom.text length] + [string length] - range.length;
    return (newLength > 9) ? NO : YES;
}
//@


- (NSString *)getVal {
    NSString *txt = [NSString stringWithFormat:@"%@", _inputFrom.text];

    if ([txt isEqual:@""]) {
        txt = @"0";
    }

    return txt;
}


- (void)updateData {
    NSString *val = [self getVal];
//    NSLog(@"value: %@", val);
    int to;
    to = [_secontPickerView selectedRowInComponent:0];

    _toVal.text = [ConverterController convert:val :to];
}


@end










