//
//  CYShowHeadreView.m
//  AIYUPlay
//
//  Created by cyan on 2018/2/19.
//  Copyright © 2018年 cyan. All rights reserved.
//

#import "CYShowHeadreView.h"
#import "CYShowModel.h"

@implementation CYShowHeadreView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
    }
    return  self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        
        [self createUI];
    }
    return self;
}
-(void)setHeaderArr:(NSArray *)headerArr{
    if (_headerArr != headerArr) {
        _headerArr = headerArr;
        _sdScrollView.imageURLStringsGroup = [self urlGroup];
    }
}
//创建轮播图
-(void)createUI{
    _sdScrollView = [[SDCycleScrollView alloc]initWithFrame:CGRectZero];
    _sdScrollView.autoScrollTimeInterval = 3;
    _sdScrollView.showPageControl = YES;
    [self addSubview:_sdScrollView];
    _sdScrollView.frame = CGRectMake(0, 0, MainScreenWidth, 100);
}


//获取所有图片url
-(NSArray *)urlGroup{
    NSMutableArray *group = [NSMutableArray new];
    for (CYShowModel *model  in _headerArr) {
        NSString *imgUrl = model.Pic;
        [group addObject:imgUrl];
    }
    
    return [group copy];
}

@end
