//
//  ConverterController.h
//  Converter
//
//  Created by AVIL on 12.07.17.
//  Copyright © 2017 AVIL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConverterController : NSObject
+ (NSString *) convert: (NSString *) value :(NSString *) currencyIn :(NSString *) currencyOut;
@end
