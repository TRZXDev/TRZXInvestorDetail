//
//  TRZXInvestorDetailViewController.m
//  TRZXInvestorDetail
//
//  Created by zhangbao on 2017/3/7.
//  Copyright © 2017年 TRZX. All rights reserved.
//

#import "TRZXInvestorDetailViewController.h"
#import "TRZXInvestorDetailMacro.h"
#import "TRZXInvestorDetailTableViewCoverHeaderView.h"
#import <ZBCellConfig/ZBCellConfig.h>

@interface TRZXInvestorDetailViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) TRZXInvestorDetailTableViewCoverHeaderView *tableViewHeaderView;


@end

@implementation TRZXInvestorDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self addOwnViews];
    
    [self layoutFrameOfSubViews];
    
    [self receiveActions];
    
    [self reloadData];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)addOwnViews
{
    [self.view addSubview:self.tableView];
}
- (void)layoutFrameOfSubViews
{
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    _tableView.tableHeaderView = self.tableViewHeaderView;
}
- (void)receiveActions
{
    __weak __typeof(&*self)weakSelf = self;
    [_tableViewHeaderView setOnNavigationBarActionBlock:^(ENavigationBarAction action) {
        switch (action) {
            case ENavigationBarAction_Back:
                [weakSelf.navigationController popViewControllerAnimated:YES];
                break;
                
            default:
                break;
        }
    }];
}
- (void)reloadData
{
    _tableViewHeaderView.title = @"中户恭贺啦啦工期狗不理德拉斯全qu666";
}

#pragma mark - <UITableViewDelegate/DataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"cell"];
    }
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
}

#pragma mark - <Setter/Getter>
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        // 设置代理
        _tableView.delegate = self;
        _tableView.dataSource = self;
        // 设置背景色
//        _tableView.backgroundColor = kTRZXBGrayColor;
        // 自动计算cell高度
        _tableView.estimatedRowHeight = 80.0f;
        // iOS8 系统中 rowHeight 的默认值已经设置成了 UITableViewAutomaticDimension
        _tableView.rowHeight = UITableViewAutomaticDimension;
        //        _tableView.estimatedSectionHeaderHeight = 10;
        //        _tableView.sectionHeaderHeight = UITableViewAutomaticDimension;
        // 去除cell分割线
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (TRZXInvestorDetailTableViewCoverHeaderView *)tableViewHeaderView
{
    if (!_tableViewHeaderView) {
        _tableViewHeaderView = [[TRZXInvestorDetailTableViewCoverHeaderView alloc] initWithScrollView:_tableView];
        _tableViewHeaderView.collectButtonHidden = YES;
    }
    return _tableViewHeaderView;
}


@end
