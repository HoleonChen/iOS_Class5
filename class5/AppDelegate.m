//
//  AppDelegate.m
//  class5
//
//  Created by Holeon on 2025/12/5.
//

#import "AppDelegate.h"
#import "ScrollViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = [[ScrollViewController alloc] init];
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
