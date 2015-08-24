//
//  Practice4ForAnimationViewController.m
//  AutolayoutSeminar2
//
//  Created by satoutakeshi on 2015/08/23.
//  Copyright (c) 2015年 satoutakeshi. All rights reserved.
//

#import "Practice4ForAnimationViewController.h"

@interface Practice4ForAnimationViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIView *yellowView;
@property (weak, nonatomic) IBOutlet UIView *blueVIew;
@property (strong, nonatomic) NSArray *views;

- (IBAction)changePositonForViews:(UIBarButtonItem *)sender;

@end

@implementation Practice4ForAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)changePositonForViews:(UIBarButtonItem *)sender {
    
    //いったん制約を解除
    [self.contentView layoutIfNeeded];
    [self.contentView removeConstraints:self.contentView.constraints];
    
    
    if (!self.views.count) {
        //ビューを配列にまとめる
        self.views = @[self.redView, self.yellowView, self.blueVIew];
    }
    
    //配列をシャッフルする
    self.views = [self clockwiseRotationArrayFromArry:self.views];
    
    /*
     隣接制約
     */
    //上部ビューのトップと親ビューの制約
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.views[0]
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1
                                                                  constant:88]];
    
    //上部ビューと親ビューのLeading制約
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.views[0]
                                                                 attribute:NSLayoutAttributeLeading
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeLeading
                                                                multiplier:1
                                                                  constant:20]];

    //上部ビューと親ビューのTrailing制約
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                 attribute:NSLayoutAttributeTrailing
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.views[0]
                                                                 attribute:NSLayoutAttributeTrailing
                                                                multiplier:1
                                                                  constant:20]];
    
    //上部ビューと左ビューの上下制約
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.views[1]
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.views[0]
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1
                                                                  constant:20]];
    //上部ビューと右ビューの上下制約
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.views[2]
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.views[0]
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1
                                                                  constant:20]];
    
    //左ビューと親ビューのLeading制約
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.views[1]
                                                                 attribute:NSLayoutAttributeLeading
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeLeading
                                                                multiplier:1
                                                                  constant:20]];
    
    //左ビューと右ビューの制約
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.views[2]
                                                                 attribute:NSLayoutAttributeLeading
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.views[1]
                                                                 attribute:NSLayoutAttributeTrailing
                                                                multiplier:1
                                                                  constant:20]];

    //右ビューと親ビューの制約
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                 attribute:NSLayoutAttributeTrailing
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.views[2]
                                                                 attribute:NSLayoutAttributeTrailing
                                                                multiplier:1
                                                                  constant:20]];
    
    //左ビューと親ビューのボトム制約
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.views[1]
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1
                                                                  constant:64]];
    
    //右ビューと親ビューのボトム制約
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.views[2]
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1
                                                                constant:64]];
    /*
     サイズの制約
    */
    //上部ビューと左ビューの高さを一緒にする
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.views[0]
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.views[1]
                                                                 attribute:NSLayoutAttributeHeight
                                                                multiplier:1
                                                                  constant:0]];
    
    //上部ビューと右ビューの高さを一緒にする
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.views[0]
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.views[2]
                                                                 attribute:NSLayoutAttributeHeight
                                                                multiplier:1
                                                                  constant:0]];
    
    //左ビューと右ビューの幅を一緒にする
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.views[1]
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.views[2]
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:1
                                                                  constant:0]];
    
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
