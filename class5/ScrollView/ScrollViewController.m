//
//  ScrollViewController.m
//  class5
//
//  Created by Holeon on 2025/12/5.
//

#import "ScrollViewController.h"

@interface ScrollViewController () <UIScrollViewDelegate> //通过尖括号的形式让类遵守UIScrollViewDelegate协议，只有这样，才能将scrollView的delegate属性设置成self

@property(nonatomic, strong) UIScrollView *scrollView;

@property(nonatomic, strong) UIView *contentView; //这是一个简单的标志视图，可以让各位看清楚设置contentSize的效果

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
        _scrollView.contentSize = CGSizeMake(800, 1200); //可以说这是ScrollView最重要的属性了，这个设置了内容尺寸，内容尺寸大于ScrollView的frame尺寸时，才会出现滚动效果
        _scrollView.bounces = YES; //是否允许弹性效果，默认是YES
        _scrollView.showsHorizontalScrollIndicator = YES; //是否显示水平滚动条，默认是YES
        _scrollView.showsVerticalScrollIndicator = YES; //是否显示垂直滚动条，默认是YES
        _scrollView.delegate = self; //这个会选择scrollView的代理，在这里我们将代理设置成自己
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

#pragma mark - UIScrollViewDelegate

// 当scrollView滚动的时候会调用这个方法，可以用于实时获取滚动的位置，或者触发滚动相关的逻辑。
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"当前的contentOffset是%@", NSStringFromCGPoint(scrollView.contentOffset));
}

// 在⽤户开始拖动滚动视图时调⽤，处理拖动开始的逻辑，例如记录初始位置。
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"开始拖拽");
}

// 其他Delegate方法请参考讲义

@end
