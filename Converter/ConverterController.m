//
//  ConverterController.m
//  Converter
//
//  Created by AVIL on 12.07.17.
//  Copyright © 2017 AVIL. All rights reserved.
//

#import "ConverterController.h"

@implementation ConverterController

static NSMutableArray *currencyData;


- (instancetype)init {
    self = [super init];

    NSError *error;
    NSString *url_string = [NSString stringWithFormat:@"http://api.fixer.io/latest?base=RUB&symbols=EUR,USD"];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url_string]];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];

    currencyData = [NSMutableArray array];

    [currencyData addObject:@[[json valueForKey:@"base"], @1.0]];

    [[json valueForKey:@"rates"] enumerateKeysAndObjectsUsingBlock:^(id _Nonnull key, id _Nonnull obj, BOOL *_Nonnull stop) {
        [currencyData addObject:@[key, obj]];
    }];

//    NSLog(@"--> %@", currencyData);

    return self;
}


+ (NSString *)convert:(NSString *)value :(int)currencyOut {

//    NSLog(@"==> %@ %d", value, currencyOut);

    if ([value isEqual:@"0"]) {
        NSLog(@"Empty prameter");
        return [NSString stringWithFormat:@"%.04f", [value doubleValue]];
    }

    // сравниваем RUB и RUB
    if (currencyOut == 0) {
        return [NSString stringWithFormat:@"%.04f", [value doubleValue]];
    }

    double rate = [self getRate:currencyOut];

//    NSLog(@"---> %f <---", rate);

    double res = [value doubleValue] * rate;

    return [NSString stringWithFormat:@"%.04f", res];
}


+ (double)getRate:(NSInteger)to {
    NSNumber *val;
    val = ([currencyData objectAtIndex:to][1]);
    double v = [val doubleValue];
    return  v;
}


@end
