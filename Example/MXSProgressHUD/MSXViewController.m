//
//  MSXViewController.m
//  MXSProgressHUD
//
//  Created by Anonymous-Monk on 08/20/2019.
//  Copyright (c) 2019 Anonymous-Monk. All rights reserved.
//

#import "MSXViewController.h"
#import <RHProgressHUD.h>


@interface MSXViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation MSXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"示例";
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        [RHProgressHUD showMessage:@"文字提示"];
    }else if (indexPath.row == 1) {
        [RHProgressHUD showMessage:@"文字提示" postion:RHHUDPostionCenten view:self.view];
    } else if (indexPath.row == 2) {
        [RHProgressHUD showDetailMessage:@"标题" detail:@"描述"];
    } else if (indexPath.row == 3) {
        [RHProgressHUD showInfoMsg:@"文本信息"];
    } else if (indexPath.row == 4) {
        [RHProgressHUD showSuccess:@"操作成功"];
    } else if (indexPath.row == 5) {
        [RHProgressHUD showFailure:@"操作失败"];
    } else if (indexPath.row == 6) {
        [RHProgressHUD showWarningMsg:@"⚠️提示"];
    } else if (indexPath.row == 7) {
        [RHProgressHUD showLoading];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [RHProgressHUD hideHUD];
        });
    } else if (indexPath.row == 8) {
        [RHProgressHUD showLoading:@"正在加载"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [RHProgressHUD hideHUD];
        });
        
    } else if (indexPath.row == 9) {
        [RHProgressHUD showCustomView:[UIImage imageNamed:@"member_icon_yes"] text:@"自定义文本" view:self.view];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [RHProgressHUD hideHUDForView:self.view];
        });
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    }
    return _tableView;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc]initWithArray:@[
            @"showMessage",
            @"showMessage postion",
            @"showDetailMessage",
            @"showInfoMsg",
            @"showSuccess",
            @"showFailure",
            @"showWarningMsg",
            @"showLoading",
            @"showLoading text",
            @"showCustomView"]];
    }
    return _dataSource;
}

@end
