//
//  CYShowHeadreView.h
//  AIYUPlay
//
//  Created by cyan on 2018/2/19.
//  Copyright © 2018年 cyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"

@interface CYShowHeadreView : UITableViewHeaderFooterView
/**轮播图*/
@property(nonatomic,strong) SDCycleScrollView *sdScrollView;
/**数据数组*/
@property(nonatomic,strong)NSArray *headerArr;

@end
