//
//  ViewController.h
//  Converter
//
//  Created by AVIL on 10.07.17.
//  Copyright © 2017 AVIL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *toVal;

@property (weak, nonatomic) IBOutlet UITextField *inputFrom;

@property (weak, nonatomic) IBOutlet UIPickerView *myPickerView;

@end

