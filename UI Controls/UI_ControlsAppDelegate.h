//
//  UI_ControlsAppDelegate.h
//  UI Controls
//
//  Created by Saurabh Jain on 10/25/11.
//  Copyright 2011 USC Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UI_ControlsViewController;

@interface UI_ControlsAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UI_ControlsViewController *viewController;

@end
