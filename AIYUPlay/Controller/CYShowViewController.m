//
//  CYShowViewController.m
//  AIYUPlay
//
//  Created by cyan on 2018/2/18.
//  Copyright © 2018年 cyan. All rights reserved.
//

#import "CYShowViewController.h"
#import "XMLDictionary.h"
#import "CYShowCell.h"
#import "CYShowHeadreView.h"

@interface CYShowViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)NSMutableArray *cellArr;
@end

@implementation CYShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.table];
    [self loadData];
}

-(void)loadData{
    NSURL *URL = [[NSURL alloc] initWithString:@"http://apps.iyuba.com/minutes/titleNewApi.jsp?maxid=1&format=xml&type=android"];
    NSString *xmlString = [[NSString alloc] initWithContentsOfURL:URL encoding:NSUTF8StringEncoding error:NULL];
    NSDictionary *xmlDoc = [NSDictionary dictionaryWithXMLString:xmlString];
    NSArray *arr = xmlDoc[@"Bbctitle"];
    _cellArr = [NSMutableArray new];
    for (NSInteger index = 0 ; index < arr.count; index ++) {
        CYShowModel *model = [CYShowModel new];
        [model setValuesForKeysWithDictionary:arr[index]];
        [_cellArr addObject:model];
    }
    
    [self.table reloadData];
    
}


#pragma mark --- table
-(UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc]initWithFrame: CGRectMake(0, 0,MainScreenWidth, MainScreenHeight -64  ) style:UITableViewStyleGrouped];
        [_table registerClass:[CYShowCell class] forCellReuseIdentifier:@"CYShowCell"];
        [_table registerClass:[CYShowHeadreView class] forHeaderFooterViewReuseIdentifier:@"CYShowHeadreView"];
        _table.delegate = self;
        _table.dataSource = self;
        _table.backgroundColor =   [UIColor groupTableViewBackgroundColor];
        //去掉头部留白
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0.001)];
        view.backgroundColor = [UIColor redColor];
        _table.tableHeaderView = view;
        
    }
    return _table;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _cellArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CYShowCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CYShowCell" forIndexPath:indexPath];
    cell.showModel = _cellArr[indexPath.row];
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    CYShowHeadreView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"CYShowHeadreView"];
    headerView.headerArr = [_cellArr copy];
    return headerView;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 100;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
