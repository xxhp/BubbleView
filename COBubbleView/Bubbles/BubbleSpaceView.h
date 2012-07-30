//
//  BubbleSpaceView.h
//  COBubbleView
//
//  Created by Manoj Mahapatra on 7/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BubbleFloatingView.h"

@interface BubbleSpaceView : UIView

- (void)addFloatingView:(BubbleFloatingView *)floatingView;
- (void)startAnimations;
- (void)reset;

@end
