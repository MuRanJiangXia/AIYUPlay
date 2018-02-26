//
//  CYShowCell.m
//  AIYUPlay
//
//  Created by cyan on 2018/2/18.
//  Copyright © 2018年 cyan. All rights reserved.
//

#import "CYShowCell.h"

@implementation CYShowCell


-(instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        
        [self createUI];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    [self createUI];
    
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
        
        
    }
    return self;
}

-(void)setShowModel:(CYShowModel *)showModel{
    
    if (_showModel != showModel) {
        _showModel = showModel;
        [self loadData];
    }
}

-(void)createUI{
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    imageView.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:imageView];
    _imageV = imageView;
    
    UILabel *titleLabel  = [[UILabel alloc]initWithFrame:CGRectZero];
    titleLabel.text = @"标题标题标题标题";
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:titleLabel];
    _titleLab = titleLabel;
    
    UILabel *timeLab  = [[UILabel alloc]initWithFrame:CGRectZero];
    timeLab.text = @"2018-02-17";
    timeLab.textColor = [UIColor colorWithRed:170/255.0 green:164/255.0 blue:157/255.0 alpha:1];
    timeLab.textAlignment = NSTextAlignmentLeft;
    timeLab.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:timeLab];
    _timeLab = timeLab;
    
    
    UILabel *countLab  = [[UILabel alloc]initWithFrame:CGRectZero];
    countLab.text = @"阅读数： 22222";
    countLab.textColor = [UIColor colorWithRed:170/255.0 green:164/255.0 blue:157/255.0 alpha:1];
    countLab.textAlignment = NSTextAlignmentLeft;
    countLab.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:countLab];
    _countLab = countLab;
    
    
    _imageV.frame = CGRectMake(10, 0, 60, 40);
    _imageV.y = self.contentView.center.y;
    _titleLab.frame = CGRectMake(_imageV.right + 5, _imageV.top, MainScreenWidth, 14);
    _timeLab.frame = CGRectMake(_titleLab.left, _titleLab.bottom+2, 80, 12);
    _countLab.frame = CGRectMake(_timeLab.right + 5, _titleLab.bottom+2, 90, 12);

    
}

-(void)loadData{
    [_imageV sd_setImageWithURL:[NSURL URLWithString:_showModel.Pic]];
    _titleLab.text = _showModel.Title;
    NSString *time = [CYTools getYearAndMonthAndDayByTimeIntervalStr:_showModel.CreatTime];
    _timeLab.text = time;
    _countLab.text = [NSString stringWithFormat:@"阅读数：%@", _showModel.ReadCount];
    
}

@end
