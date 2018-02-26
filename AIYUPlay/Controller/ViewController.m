//
//  ViewController.m
//  AIYUPlay
//
//  Created by cyan on 2018/2/17.
//  Copyright © 2018年 cyan. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "CYShowViewController.h"
#import "UIView+Utils.h"

static NSInteger baseTag = 20180218;

@interface ViewController ()<UIScrollViewDelegate>{
    
    
}
//存储showVC字典
@property(nonatomic,strong)NSMutableDictionary  *listVCQueue;
//记录当前选择的tag
@property(nonatomic,assign) NSInteger btnTag;
//头部按钮背景视图
@property(nonatomic,strong)UIView *topBgView;
//显示showVC的ScrollView
@property(nonatomic,strong)UIScrollView *showScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self creatRightAndLeftNavBtn];
    [self.view addSubview:self.showScrollView];
    [self addListVCWithIndex:0];
    [self topView];

}

//左右按钮
-(void)creatRightAndLeftNavBtn{
    UIImageView *rightImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    rightImageV.image = [UIImage imageNamed:@"home"];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightImageV];
    self.navigationItem.rightBarButtonItem = rightItem;

    //暂时无图
    UIImageView *leftImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 93, 31)];
    leftImageV.image = [UIImage imageNamed:@"LOGO"];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftImageV];
    self.navigationItem.leftBarButtonItem = leftItem;
}

//创建头部按钮视图
-(void)topView{
    NSArray *arr = @[@"BBC六分钟",@"地道英语",@"BBC新闻"];
    _topBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, MainScreenWidth , 50)];
    _topBgView.backgroundColor = [UIColor whiteColor];
    [self.view  addSubview:_topBgView];
    CGFloat width = MainScreenWidth/3;
    for (NSInteger index = 0; index < arr.count ; index ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(width *index, 0, width, 50);
        [button setTitle:arr[index] forState:UIControlStateNormal];
        [button setTitleColor:UIColorFromRGB(0x333333, 1) forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:66/255.0 green:164/255.0 blue:182/255.0 alpha:1.0] forState:UIControlStateSelected];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        button.tag = baseTag + index;
        [button addTarget:self action:@selector(topAction:) forControlEvents:UIControlEventTouchUpInside];
        [_topBgView addSubview:button];
        if (index == 0) {//默认选中第一个
            _btnTag = baseTag + index;
            button.selected = YES;
        }
    }
}
//头部点击方法
-(void)topAction:(UIButton *)btn{
    btn.selected = YES;
    if (_btnTag!= 0) {
        if (_btnTag != btn.tag) {
            UIButton *preBtn =   [_topBgView viewWithTag:_btnTag];
            preBtn.selected = !preBtn.selected;
        }
    }
    [_showScrollView setContentOffset:CGPointMake( (btn.tag -baseTag)*MainScreenWidth, _showScrollView.contentOffset.y) animated:YES];
    _btnTag = btn.tag;
}

//显示vc Scrollview
-(UIScrollView *)showScrollView{
    _showScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 50, MainScreenWidth, MainScreenHeight-64 -50)];
    _showScrollView.backgroundColor = UIColorFromRGB(0xEDEDED, 1.0);;
    //设置显示内容尺寸
    _showScrollView.contentSize = CGSizeMake(MainScreenWidth *3, 50);
    //滑条样式
    _showScrollView.indicatorStyle = UIScrollViewIndicatorStyleBlack;
    //反弹效果
    _showScrollView.bounces = YES;
    _showScrollView.pagingEnabled = YES;
    _showScrollView.delegate = self;
    return _showScrollView;
}



#pragma mark scrollViewDelegate
//scrollViewDidEndDecelerating 手滑动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //    NSLog(@"scrollViewDidEndDecelerating");
    _showScrollView.hidden = NO;
    [self scrollby:scrollView];
    
}
//代码移动
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    //    NSLog(@"scrollViewDidEndScrollingAnimation");
    _showScrollView.hidden = NO;
    [self scrollby:scrollView];
}

/**
 * 滑动到指定位置,改变button选中效果
 */
-(void)scrollby:(UIScrollView *)scrollView{
    NSInteger row =  (scrollView.contentOffset.x+MainScreenWidth/2.f)/MainScreenWidth;
    //根据页数添加相应的视图
    [self addListVCWithIndex:row];
    //上一个btn
    UIButton *button =   [_topBgView viewWithTag:_btnTag];
    button.selected = NO;
    //当前选中btn
    _btnTag = row + baseTag;
    UIButton *button1 =   [_topBgView viewWithTag:_btnTag];
    button1.selected = YES;
    
    
}

//添加vc到队列
- (void)addListVCWithIndex:(NSInteger)index {
    if (!_listVCQueue) {
        _listVCQueue=[[NSMutableDictionary alloc] init];
    }
    if (index<0||index>=3) {
        return;
    }
    //根据页数添加相对应的视图 并存入数组
    if (![_listVCQueue objectForKey:@(index)]) {
        CYShowViewController * contentViewController = [CYShowViewController new];
        [self addChildViewController:contentViewController];
        contentViewController.view.left = index*MainScreenWidth;
        contentViewController.view.top  = 0;
        [_showScrollView addSubview:contentViewController.view];
        [_listVCQueue setObject:contentViewController forKey:@(index)];
    }else{
    
        
    }
}


@end
