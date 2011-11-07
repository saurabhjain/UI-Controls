//
//  UI_ControlsViewController.m
//  UI Controls
//
//  Created by Saurabh Jain on 10/25/11.
//  Copyright 2011 USC Student. All rights reserved.
//

#import "UI_ControlsViewController.h"

@implementation UI_ControlsViewController
@synthesize nameField;
@synthesize numberField;
@synthesize sliderLabel;
@synthesize leftSwitch;
@synthesize rightSwitch;
@synthesize switchView;
@synthesize doSomethingButton;

- (IBAction)doSomething:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Are you Sure?" delegate:self cancelButtonTitle:@"No Way!" destructiveButtonTitle:@"Yes I'm Sure!" otherButtonTitles:nil];
    [actionSheet showInView:self.view];
    [actionSheet release];
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if(!buttonIndex == [actionSheet cancelButtonIndex])
    {
        NSString *msg = nil;
        
        if(nameField.text.length > 0)
        {
            msg = [[NSString alloc] initWithFormat:@"You can breathe easy, %@, everything went OK.", nameField.text];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Something was done" message:msg delegate:self cancelButtonTitle:@"Phew!" otherButtonTitles:nil];
            [alert show];
            [alert release];
            [msg release];
        }
        else
        {
            msg = @"You can breathe easy, everything went OK.";
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Something was done" message:msg delegate:self cancelButtonTitle:@"Phew!" otherButtonTitles:nil];
            [alert show];
            [alert release];
            [msg release];
        }
    }
}

- (IBAction)switchChanged:(id)sender
{
    UISwitch *whichSwitch = (UISwitch *)sender;
    BOOL setting = whichSwitch.isOn;
    [leftSwitch setOn:setting animated:YES];
    [rightSwitch setOn:setting animated:YES];
}

- (IBAction)toggleShowHide:(id)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    NSInteger segment = segmentedControl.selectedSegmentIndex;
    
    if (segment == kShowSegmentIndex)
    {
        [switchView setHidden:NO];
    }
    else
    {
        [switchView setHidden:YES];
    }
}

- (IBAction)sliderChanged:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    int progressAsInt = (int)(slider.value + 0.5f);
    NSString *newText = [[NSString alloc] initWithFormat:@"%d", progressAsInt];
    sliderLabel.text = newText;
    [newText release];
}

- (IBAction)textFieldDoneEditing:(id)sender 
{
    [sender resignFirstResponder];
}

- (IBAction)backgroundClick:(id)sender
{
    [nameField resignFirstResponder];
    [numberField resignFirstResponder];
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    UIImage *buttonImageNormal = [UIImage imageNamed:@"whiteButton.png"];
    UIImage *stretchableButtonImageNormal = [buttonImageNormal stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    [doSomethingButton setBackgroundImage:stretchableButtonImageNormal forState:UIControlStateNormal];
    
    UIImage *buttonImagePressed = [UIImage imageNamed:@"blueButton.png"];
    UIImage *stretchableButtonImagePressed = [buttonImagePressed stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    [doSomethingButton setBackgroundImage:stretchableButtonImagePressed forState:UIControlStateHighlighted];
    //[super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
    //return YES;
}

@end
