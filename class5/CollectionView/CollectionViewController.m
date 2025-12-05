//
//  CollectionViewController.m
//  class5
//
//  Created by Holeon on 2025/12/5.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"
#import "Layout.h"

@interface CollectionViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    Layout *layout = [[Layout alloc] init];

    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];

    self.collectionView.backgroundColor = UIColor.whiteColor;
    self.collectionView.dataSource = self;

    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"CustomCell"];

    [self.view addSubview:self.collectionView];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return 30;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                           cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CustomCell" forIndexPath:indexPath];

    [cell configure:[NSString stringWithFormat:@"%ld", (long)indexPath.item]];
    return cell;
}

// 更多方法请参考讲义

@end
