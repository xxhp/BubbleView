//
//  ViewController.m
//  COBubbleView
//
//  Created by Manoj Mahapatra on 7/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "BubbleSpaceView.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@property (nonatomic, retain) IBOutlet BubbleSpaceView *bubbleView;
-(void) showBubbles;

@end

@implementation ViewController

@synthesize bubbleView = __bubbleView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // set gradient for background view
	CAGradientLayer *glayer = [CAGradientLayer layer];
	glayer.frame = self.view.bounds;
	UIColor *topColor = [UIColor colorWithRed:0.57 green:0.63 blue:0.68 alpha:1.0]; //light blue-gray
	UIColor *bottomColor = [UIColor colorWithRed:0.31 green:0.41 blue:0.48 alpha:1.0]; //dark blue-gray
	glayer.colors = [NSArray arrayWithObjects:(id)[topColor CGColor], (id)[bottomColor CGColor], nil];
    [self.view.layer insertSublayer:glayer atIndex:0];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.bubbleView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return NO;
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self.bubbleView reset];
    [self showBubbles];
}

-(void) dealloc {
    self.bubbleView = nil;
    [super dealloc];
}


#pragma mark - Show Bubbles

-(void) showBubbles {
    
    srand((unsigned)time(NULL));
	int numberOfStaticBubbles = 10;
	for (int i = 0; i < numberOfStaticBubbles; i++) {
		UIImage* image = [UIImage imageNamed:i%2?@"green":@"blue"];
		CGFloat bubbleDiameter = rand() % (135 - 80 + 1) + 80;
		BubbleFloatingView *bubble = [BubbleFloatingView new];
		bubble.image = image;
		bubble.bounds = CGRectMake(0.0f, 0.0f, bubbleDiameter, bubbleDiameter);
		
		int startX = self.bubbleView.bounds.size.width + bubble.bounds.size.width/2;
		CGFloat y = rand()%((int)self.bubbleView.bounds.size.height - (int)bubble.bounds.size.height/2 + 1) + (int)bubble.bounds.size.height/2;
		double speed = rand() % (30 - 8 + 1) + 8;
		bubble.center = CGPointMake(startX, y);
		bubble.destination = CGPointMake(-bubble.bounds.size.width/2, y);
		bubble.speed = speed;
		[self.bubbleView addFloatingView:bubble];
		
		[bubble release];
	}
	
	[self.bubbleView startAnimations];
}


@end
