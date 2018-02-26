//
//  CYTools.m
//  AIYUPlay
//
//  Created by cyan on 2018/2/18.
//  Copyright © 2018年 cyan. All rights reserved.
//

#import "CYTools.h"

@implementation CYTools



+(NSString *)getYearAndMonthAndDayByTimeIntervalStr:(NSString *)interval{
    
    NSTimeInterval interval2 =[interval doubleValue]/1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval2];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //    yyyy-MM-dd HH:mm:ss:SSS
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString *time = [formatter stringFromDate:date];
    return time;
}
@end
