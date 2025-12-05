//
//  Layout.m
//  class5
//
//  Created by Holeon on 2025/12/5.
//

#import "Layout.h"

@interface Layout ()

// 用于缓存所有 Cell 的布局属性（位置、大小等）
// 为什么需要缓存？
// 因为在滚动时系统会频繁调用 layoutAttributesForElementsInRect，
// 如果每次重新计算会非常耗性能，因此提前计算好存在数组中。
@property (nonatomic, strong) NSMutableArray<UICollectionViewLayoutAttributes *> *cache;

// collectionView 内容总高度，用于滚动区域计算
@property (nonatomic, assign) CGFloat contentHeight;

@end


@implementation Layout


#pragma mark - 布局准备阶段（布局生命周期中最核心的方法）
/**
 prepareLayout 是 UICollectionViewLayout 最重要的方法之一。
 系统会在第一次布局、数据更新、滚动等情况下调用它。

 这个方法里应该完成：
 ① 计算所有 item 的位置和大小
 ② 生成并缓存所有布局属性 UICollectionViewLayoutAttributes
*/
- (void)prepareLayout {
    [super prepareLayout];

    // 初始化缓存
    self.cache = [NSMutableArray array];
    self.contentHeight = 0; // 内容高度归零

    // -----------------------------
    // 布局相关参数（可修改以改变布局效果）
    // -----------------------------
    NSInteger columns = 3;           // 每行 3 列
    CGFloat spacing = 10;            // item 之间的间距
    CGFloat normalHeight = 100;      // 所有 item 的统一高度

    // collectionView 的可视宽度
    CGFloat width = self.collectionView.bounds.size.width;

    // 总间距："左间距 + 中间间距 * (列数 - 1) + 右间距"
    CGFloat totalSpacing = spacing * (columns + 1);

    // 计算每个 Item 宽度（等宽布局）
    CGFloat itemWidth = (width - totalSpacing) / columns;

    // yOffset 用于记录下一行的起始 y 坐标（从 spacing 开始）
    CGFloat yOffset = spacing;

    // 获取当前 section 中 item 的数量（本示例只有一个 section）
    NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];


    // -----------------------------------
    // 为每一个 item 计算布局属性（核心循环）
    // -----------------------------------
    for (NSInteger item = 0; item < itemCount; item++) {

        // 创建 indexPath
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:0];
        
        // 当前 item 的列号（0, 1, 2）
        NSInteger col = item % columns;

        // 行号（例如 items 0~2 为第 0 行，3~5 为第 1 行）
        // NSInteger row = item / columns;
        // 因为这个变量自始至终都没有用过，所以说这个变量的声明被注释掉了，在此仅作为参考

        // 当前 item 的 X 坐标（左侧间距 + 前面 item 宽度 × 列号）
        CGFloat x = spacing + col * (itemWidth + spacing);

        // 统一高度（你修改后的版本）
        CGFloat height = normalHeight;

        // 生成该 item 的 frame
        CGRect frame = CGRectMake(x, yOffset, itemWidth, height);


        // -----------------------------------
        // 创建布局属性并保存到缓存中
        // -----------------------------------
        UICollectionViewLayoutAttributes *attr =
            [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];

        attr.frame = frame;    // 设置 frame
        [self.cache addObject:attr];


        // -----------------------------------
        // 行结束时移动 yOffset（进入下一行）
        // col == 最后一列时为一行结束
        // -----------------------------------
        if (col == columns - 1) {
            yOffset += height + spacing;
        }
    }

    // 设置内容总高度（决定滚动范围）
    self.contentHeight = yOffset;
}



#pragma mark - 返回整个内容区域大小（滚动范围）
/**
 collectionViewContentSize 决定 collectionView 的滚动区域。
 必须正确返回，否则无法正常滚动。
*/
- (CGSize)collectionViewContentSize {
    return CGSizeMake(self.collectionView.bounds.size.width, self.contentHeight);
}



#pragma mark - 返回某个 rect 中所有 item 的属性（系统频繁调用）
/**
 rect 表示当前可视区域（例如屏幕上的一段矩形区域）
 返回与 rect 相交的布局属性（即哪些 cell 需要显示）
*/
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {

    NSMutableArray *visible = [NSMutableArray array];

    // 遍历 cache 中所有 attributes
    for (UICollectionViewLayoutAttributes *attr in self.cache) {
        // 如果 item frame 与当前可视区域相交，则需要返回
        if (CGRectIntersectsRect(attr.frame, rect)) {
            [visible addObject:attr];
        }
    }

    return visible;
}



#pragma mark - 返回单个 item 的布局属性（根据 indexPath）
/**
 供系统按需获取某个特定 item 的布局信息。
*/
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {

    // cache 的顺序与 item 顺序一一对应，因此可以直接返回
    return self.cache[indexPath.item];
}

@end
