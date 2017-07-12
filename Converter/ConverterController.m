//
//  ConverterController.m
//  Converter
//
//  Created by AVIL on 12.07.17.
//  Copyright © 2017 AVIL. All rights reserved.
//

#import "ConverterController.h"

@implementation ConverterController

+(NSString *) convert: (NSString *) value :(NSString *) currencyIn :(NSString *) currencyOut{
    if(value == nil || currencyIn == nil || currencyOut == nil){
        NSLog(@"Empty prameter");
        return @"0";
    }

    return [NSString stringWithFormat:@" %@ %@ %@ ", value, currencyIn, currencyOut];
}

@end
