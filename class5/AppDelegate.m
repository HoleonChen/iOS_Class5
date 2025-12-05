//
//  AppDelegate.m
//  class5
//
//  Created by Holeon on 2025/12/5.
//

#import "AppDelegate.h"
#import "ViewControllerCollection.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = [[CollectionViewController alloc] init]; //通过切换ScrollViewController,TableViewController和CollectionViewController进行不同高级组件的演示，在正式项目中请通过NavigationViewController之类的特殊视图控制器来控制不同视图的切换。
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
