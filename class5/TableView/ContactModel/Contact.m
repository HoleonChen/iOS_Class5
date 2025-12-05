//
//  Contact.m
//  class5
//
//  Created by Holeon on 2025/12/5.
//

#import "Contact.h"

@implementation Contact

- (instancetype)initWithName:(NSString *)name phoneNumber:(NSString *)phoneNumber{
    self = [super init];
    if(self){
        _name = name;
        _phoneNumber = phoneNumber;
    }
    return self;
}

@end
