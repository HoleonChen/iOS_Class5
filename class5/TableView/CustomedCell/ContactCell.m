//
//  ContactCell.m
//  class5
//
//  Created by Holeon on 2025/12/6.
//

#import "ContactCell.h"

@implementation ContactCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.phoneNumberLabel];
    }
    return self;
}

- (UILabel *)nameLabel{
    if(_nameLabel == nil){
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 100, 20)];
        _nameLabel.font = [UIFont systemFontOfSize:16];
    }
    return _nameLabel;
}

- (UILabel *)phoneNumberLabel{
    if(_phoneNumberLabel == nil){
        _phoneNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(180, 5, 100, 20)];
        _phoneNumberLabel.font = [UIFont systemFontOfSize:12];
    }
    return _phoneNumberLabel;
}

@end
