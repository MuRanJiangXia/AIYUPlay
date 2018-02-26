//
//  CYShowCell.h
//  AIYUPlay
//
//  Created by cyan on 2018/2/18.
//  Copyright © 2018年 cyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYShowModel.h"
@interface CYShowCell : UITableViewCell
@property(nonatomic,strong)CYShowModel *showModel;

@property(nonatomic,strong)UIImageView *imageV;

@property(nonatomic,strong)UILabel *titleLab;

@property(nonatomic,strong)UILabel *timeLab;

@property(nonatomic,strong)UILabel *countLab;

@end
