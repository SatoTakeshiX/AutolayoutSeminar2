//
//  Practice4ViewController.m
//  AutolayoutSeminar2
//
//  Created by satoutakeshi on 2015/08/23.
//  Copyright (c) 2015年 satoutakeshi. All rights reserved.
//

#import "Practice4ViewController.h"

@interface Practice4ViewController ()

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIView *yellowView;
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (strong, nonatomic) NSDictionary *views;

- (IBAction)changePositonForViews:(UIBarButtonItem *)sender;

@end

@implementation Practice4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changePositonForViews:(UIBarButtonItem *)sender {
    
    //いったん制約を解除
    [self.contentView layoutIfNeeded];
    [self.contentView removeConstraints:self.contentView.constraints];
    
    
    if (!self.views.count) {
        
        //変数名をキー、その値をバリューにして辞書を作成
        self.views = NSDictionaryOfVariableBindings(_redView, _yellowView, _blueView);
    }
    
    //キーにした変数名をシャッフルする
    NSArray *viewNames = [self clockwiseRotationArrayFromArry:self.views.allKeys];
    
    //シャッフルした変数名を取得
    NSString *topViewKey = viewNames[0];
    NSString *leftViewKey = viewNames[1];
    NSString *rightViewKey = viewNames[2];
    
    //VFLで文字列をまとめる
    NSString *horizontalFormat      =   [NSString stringWithFormat:@"H:|-20-[%@]-20-|", topViewKey];
    NSString *addHorizontalFormat   =   [NSString stringWithFormat:@"H:|-20-[%1$@]-20-[%2$@(==%1$@)]-20-|", leftViewKey,rightViewKey];
    NSString *verticalFormat        =   [NSString stringWithFormat:@"V:|-88-[%1$@]-20-[%2$@(==%1$@)]-20-|", topViewKey, leftViewKey];
    NSString *addVertivalFormat     =   [NSString stringWithFormat:@"V:|-88-[%1$@]-20-[%2$@(==%1$@)]-20-|", topViewKey, rightViewKey];
    
    
    //制約を設定する
    [self.contentView addConstraints:[NSLayoutConstraint
                                      constraintsWithVisualFormat:horizontalFormat
                                      options:0
                                      metrics:nil
                                      views:self.views]];
    
    [self.contentView addConstraints:[NSLayoutConstraint
                                      constraintsWithVisualFormat:addHorizontalFormat
                                      options:NSLayoutFormatAlignAllTop
                                      metrics:nil
                                      views:self.views]];
    
    [self.contentView addConstraints:[NSLayoutConstraint
                                      constraintsWithVisualFormat:verticalFormat
                                      options:0
                                      metrics:nil
                                      views:self.views]];
    
    [self.contentView addConstraints:[NSLayoutConstraint
                                      constraintsWithVisualFormat:addVertivalFormat
                                      options:0
                                      metrics:nil
                                      views:self.views]];
    
    //アニメーションメソッドで親ビューに対してlayoutIfNeededを実行して再描写する
    [UIView animateWithDuration:1.0f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [self.contentView layoutIfNeeded];
                     }completion:nil];
    
}

/*
 配列要素を入れ替えるメソッド
 */
-(NSArray *)clockwiseRotationArrayFromArry:(NSArray *)array
{
    NSMutableArray *rotationArray = [array mutableCopy];
    NSInteger count = [rotationArray count];
    
    for (NSInteger i = 0; i < count - 1; i++) {
        
        [rotationArray exchangeObjectAtIndex:i withObjectAtIndex:i + 1];
        
    }
    
    return [rotationArray copy];
}
@end
