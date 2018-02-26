//
//  CYShowModel.h
//  AIYUPlay
//
//  Created by cyan on 2018/2/18.
//  Copyright © 2018年 cyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYShowModel : NSObject
/**图片*/
@property(nonatomic,copy)NSString *Pic;
/**标题*/
@property(nonatomic,copy)NSString *Title;
/**时间*/
@property(nonatomic,copy)NSString *CreatTime;
/**浏览数*/
@property(nonatomic,copy)NSString *ReadCount;
@end
