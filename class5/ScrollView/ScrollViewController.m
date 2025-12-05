//
//  ScrollViewController.m
//  class5
//
//  Created by Holeon on 2025/12/5.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()

@property(nonatomic, strong) UIScrollView *scrollView;

@property(nonatomic, strong) UIView *contentView;

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.contentView];
}

#pragma mark - 视图懒加载

- (UIScrollView *)scrollView{
    if(_scrollView == nil){
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, self.view.bounds.size.height - 50)];
        _scrollView.backgroundColor = [UIColor lightGrayColor];
    }
    return _scrollView;
}

- (UIView *)contentView{
    if(_contentView == nil){
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
        _contentView.backgroundColor = [UIColor blueColor];
    }
    return _contentView;
}

@end
