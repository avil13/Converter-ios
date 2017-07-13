//
//  HttpController.m
//  Converter
//
//  Created by AVIL on 12.07.17.
//  Copyright © 2017 AVIL. All rights reserved.
//

#import "HttpController.h"

@implementation HttpController

- (void) viewDidLoad
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    [request setURL:[NSURL URLWithString:@"http://api.fixer.io/latest?base=EUR&symbols=RUB"]];

    NSURLSessionDataTask *task = [[self getUrlSession] dataTaskWithRequest
                                  :request completionHandler
                                  :^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{

//            NSString *res = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//            NSLog(@"%@", res);

            NSError *jsonError;
            NSArray *parsedJSONArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error: &jsonError];


        });
    }];

    [task resume];
}




- (NSURLSession *)getUrlSession{
    static NSURLSession *session = nil;
    static dispatch_once_t onceToken;

    dispatch_once( &onceToken,
                  ^{
                      NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
                      session = [NSURLSession sessionWithConfiguration:configuration];
                   } );

    return session;
}

- (void) rq: (NSString*) cur1 :(NSString*) cur2 :(void (^)(void))callback {

    //    callback
    
}


@end
