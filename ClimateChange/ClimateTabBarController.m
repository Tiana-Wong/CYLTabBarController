#import "ClimateTabBarController.h"

@interface ClimateTabBarController ()

@end

@implementation ClimateTabBarController

- (instancetype)init {
    if (!(self = [super init])) {
        return nil;
    }
    
    UIEdgeInsets imageInsets = UIEdgeInsetsMake(4.5, 0, -4.5, 0);
    UIOffset titlePositionAdjustment = UIOffsetMake(0, -3.5);
    
    CYLTabBarController *tabBarController = [CYLTabBarController tabBarControllerWithViewControllers:self.viewControllers
                                                                           tabBarItemsAttributes:self.tabBarItemsAttributesForController
                                                                                     imageInsets:imageInsets
                                                                         titlePositionAdjustment:titlePositionAdjustment
                                                                                         context:nil];
    [self customizeTabBarAppearance:tabBarController];
    return (self = (ClimateTabBarController *)tabBarController);
}

- (NSArray *)viewControllers {
    // Home View Controller
    UIViewController *homeVC = [[UIViewController alloc] init];
    homeVC.view.backgroundColor = [UIColor whiteColor];
    UILabel *homeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 300, 100)];
    homeLabel.text = @"Climate Change Overview\nTrack global temperature changes and key indicators";
    homeLabel.numberOfLines = 0;
    [homeVC.view addSubview:homeLabel];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    homeVC.navigationItem.title = @"Climate Overview";
    
    // Data View Controller
    UIViewController *dataVC = [[UIViewController alloc] init];
    dataVC.view.backgroundColor = [UIColor whiteColor];
    UILabel *dataLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 300, 100)];
    dataLabel.text = @"Climate Data\nView CO2 levels, temperature records, and sea level rise";
    dataLabel.numberOfLines = 0;
    [dataVC.view addSubview:dataLabel];
    UINavigationController *dataNav = [[UINavigationController alloc] initWithRootViewController:dataVC];
    dataVC.navigationItem.title = @"Climate Data";
    
    // Actions View Controller
    UIViewController *actionsVC = [[UIViewController alloc] init];
    actionsVC.view.backgroundColor = [UIColor whiteColor];
    UILabel *actionsLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 300, 100)];
    actionsLabel.text = @"Take Action\nDiscover ways to reduce your carbon footprint";
    actionsLabel.numberOfLines = 0;
    [actionsVC.view addSubview:actionsLabel];
    UINavigationController *actionsNav = [[UINavigationController alloc] initWithRootViewController:actionsVC];
    actionsVC.navigationItem.title = @"Take Action";
    
    // News View Controller
    UIViewController *newsVC = [[UIViewController alloc] init];
    newsVC.view.backgroundColor = [UIColor whiteColor];
    UILabel *newsLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 300, 100)];
    newsLabel.text = @"Climate News\nStay updated with latest climate change news";
    newsLabel.numberOfLines = 0;
    [newsVC.view addSubview:newsLabel];
    UINavigationController *newsNav = [[UINavigationController alloc] initWithRootViewController:newsVC];
    newsVC.navigationItem.title = @"Climate News";
    
    return @[homeNav, dataNav, actionsNav, newsNav];
}

- (NSArray *)tabBarItemsAttributesForController {
    NSDictionary *homeTabAttributes = @{
        CYLTabBarItemTitle: @"Home",
        CYLTabBarItemImage: @"home_normal",
        CYLTabBarItemSelectedImage: @"home_selected",
    };
    
    NSDictionary *dataTabAttributes = @{
        CYLTabBarItemTitle: @"Data",
        CYLTabBarItemImage: @"data_normal",
        CYLTabBarItemSelectedImage: @"data_selected",
    };
    
    NSDictionary *actionsTabAttributes = @{
        CYLTabBarItemTitle: @"Actions",
        CYLTabBarItemImage: @"actions_normal",
        CYLTabBarItemSelectedImage: @"actions_selected",
    };
    
    NSDictionary *newsTabAttributes = @{
        CYLTabBarItemTitle: @"News",
        CYLTabBarItemImage: @"news_normal",
        CYLTabBarItemSelectedImage: @"news_selected",
    };
    
    return @[homeTabAttributes, dataTabAttributes, actionsTabAttributes, newsTabAttributes];
}

- (void)customizeTabBarAppearance:(CYLTabBarController *)tabBarController {
    // Set the theme color - using green to represent environmental awareness
    UIColor *themeColor = [UIColor colorWithRed:34/255.0 green:139/255.0 blue:34/255.0 alpha:1.0];
    
    // Customize TabBar appearance
    [UITabBar appearance].tintColor = themeColor;
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    [[UITabBar appearance] setTranslucent:NO];
    
    // Customize TabBarItem text attributes
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = themeColor;
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

@end