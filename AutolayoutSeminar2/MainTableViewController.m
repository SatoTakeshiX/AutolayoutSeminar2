//
//  MainTableViewController.m
//  AutolayoutSeminar2
//
//  Created by satoutakeshi on 2015/08/23.
//  Copyright (c) 2015年 satoutakeshi. All rights reserved.
//

#import "MainTableViewController.h"
#import "Practice4ViewController.h"
#import "Practice4ForAnimationViewController.h"
@interface MainTableViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray *pageIdentifier;
@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pageIdentifier = @[@"Practice1", @"Practice1ModelAnswer",@"Practice2", @"Practice2ModelAnswer", @"Practice3", @"Practice3ModelAnswer",@"Practice4", @"Practice4ModelAnswer"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    return self.pageIdentifier.count;
}

//セルの生成
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *pageCell = [self getTableCell:tableView cellIdentifier:@"pageCell"];
    
    //Storyboad名を表示する
    pageCell.textLabel.text = self.pageIdentifier[indexPath.row];
    
    return pageCell;
}

//セル生成メソッド
-(UITableViewCell *)getTableCell:(UITableView *)tableview cellIdentifier:(NSString *)cellIdentifier
{
    UITableViewCell *cell;
    NSString *cellID = cellIdentifier;
    
    cell = [tableview dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 選択状態の解除
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //storyboad名の取得
    NSString *storyboadName = self.pageIdentifier[indexPath.row];
    
    
    //ページ遷移する
    //storyboadを取得
    UIStoryboard *stb = [UIStoryboard storyboardWithName:self.pageIdentifier[indexPath.row] bundle:nil];
    
    
    if ([storyboadName isEqualToString:@"Practice1"]) {
        
        //練習1Storyboadへ
        UIViewController *practice1VC = [stb instantiateInitialViewController];
        [self.navigationController pushViewController:practice1VC animated:YES];
        
    }else if ([storyboadName isEqualToString:@"Practice1ModelAnswer"]){
        
        //等間隔のViewConへ遷移
        UIViewController *practice1ModelAnswerVC = [stb instantiateInitialViewController];
        [self.navigationController pushViewController:practice1ModelAnswerVC animated:YES];
        
    }else if([storyboadName isEqualToString:@"Practice2"]){
        
        //縦スクロールのViewConへ遷移
        UIViewController *practice2VC = [stb instantiateInitialViewController];
        [self.navigationController pushViewController:practice2VC animated:YES];
        
    }else if ([storyboadName isEqualToString:@"Practice2ModelAnswer"]){
        
        //縦横スクロールのViewConへ遷移
        UIViewController *practice2ModelAnswerVC = [stb instantiateInitialViewController];
        [self.navigationController pushViewController:practice2ModelAnswerVC animated:YES];
        
    }else if ([storyboadName isEqualToString:@"Practice3"]){
        
        //縦横スクロールのViewConへ遷移
        UIViewController *practice3VC = [stb instantiateInitialViewController];
        [self.navigationController pushViewController:practice3VC animated:YES];
        
    }else if ([storyboadName isEqualToString:@"Practice3ModelAnswer"]){
        
        //縦横スクロールのViewConへ遷移
        UIViewController *practice3ModelAnswerVC = [stb instantiateInitialViewController];
        [self.navigationController pushViewController:practice3ModelAnswerVC animated:YES];
        
    }else if ([storyboadName isEqualToString:@"Practice4"]){
        
        //縦横スクロールのViewConへ遷移
        Practice4ViewController *practice4VC = [stb instantiateInitialViewController];
        [self.navigationController pushViewController:practice4VC animated:YES];
        
    }else if ([storyboadName isEqualToString:@"Practice4ModelAnswer"]){
        
        //縦横スクロールのViewConへ遷移
        Practice4ForAnimationViewController *practice4ModelAnswerVC = [stb instantiateInitialViewController];
        [self.navigationController pushViewController:practice4ModelAnswerVC animated:YES];
    }
    
    
}



@end
