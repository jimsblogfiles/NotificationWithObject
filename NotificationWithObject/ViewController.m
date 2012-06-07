//
//  ViewController.m
//  NotificationWithObject
//
//  Created by James Border on 4/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

-(void)buttonAction:(id)sender;
-(void)notificationResponse:(NSNotification *)notif;
-(void)anotherNotificationResponse:(NSNotification *)notif;

@end

@implementation ViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {

    [super viewDidLoad];
	
	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[button setFrame:CGRectMake(10, 10, 120, 37)];
	[button setTitle:@"Swiss" forState:UIControlStateNormal];
	[button setTag:0];
	[button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];

	UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[button1 setFrame:CGRectMake(10, 67, 120, 37)];
	[button1 setTitle:@"Cheddar" forState:UIControlStateNormal];
	[button1 setTag:1];
	[button1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button1];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationResponse:) name:@"ChosenCheeseNotification" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(anotherNotificationResponse:) name:@"ViewDidLoadNotification" object:nil];

	[[NSNotificationCenter defaultCenter] postNotificationName:@"ViewDidLoadNotification" object:@"viewDidLoad"];	

}

-(void)buttonAction:(id)sender {

	[[NSNotificationCenter defaultCenter] postNotificationName:@"ChosenCheeseNotification" object:sender];	
	
}

-(void)notificationResponse:(NSNotification *)notif {
	
	NSLog(@"tag:%i",[notif.object tag]);
	NSLog(@"title:%@", [notif.object currentTitle]);
	
}

-(void)anotherNotificationResponse:(NSNotification *)notif {
	
	NSLog(@"notif.object:%@",notif.object);
	
}

- (void)viewDidUnload {

    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
