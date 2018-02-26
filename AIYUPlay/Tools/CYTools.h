//
//  CYTools.h
//  AIYUPlay
//
//  Created by cyan on 2018/2/18.
//  Copyright © 2018年 cyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYTools : NSObject
/**根据时间戳字符串 获取 年-月-日*/
+(NSString *)getYearAndMonthAndDayByTimeIntervalStr:(NSString *)interval;
@end
