//
//  Contact.h
//  class5
//
//  Created by Holeon on 2025/12/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Contact : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *phoneNumber;

- (instancetype)initWithName:(NSString *)name phoneNumber:(NSString *)phoneNumber;

@end

NS_ASSUME_NONNULL_END
