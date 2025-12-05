//
//  CollectionViewCell.m
//  class5
//
//  Created by Holeon on 2025/12/5.
//

#import "CollectionViewCell.h"

@interface CollectionViewCell()

@property(nonatomic, strong) UILabel *textLabel;

@end

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor systemBlueColor];
        self.contentView.layer.cornerRadius = 10;
        self.contentView.layer.masksToBounds = YES;
        
        _textLabel = [[UILabel alloc] initWithFrame:self.contentView.bounds];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.font = [UIFont systemFontOfSize:18];
        [self.contentView addSubview:self.textLabel];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _textLabel.frame = self.contentView.bounds;
}

- (void)configure:(NSString *)text{
    _textLabel.text = text;
}

@end
