//
//  ContactsViewController.m
//  Contacts
//
//  Created by Levi Orsinger on 9/22/14.
//  Copyright (c) 2014 Levi Orsinger. All rights reserved.
//

#import "ContactsViewController.h"

@interface ContactsViewController ()

@end

@implementation ContactsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    CGSize size = [self getScreenSize];
    self.ScrollView .frame = CGRectMake(0, 50, size.width, size.height);
}
-(void)dismissKeyboard {
    // add textfields and textviews
    //[Nameofoutletlikeatextfield resignFirstResponder];
    [self.txtFirstName resignFirstResponder];
    [self.txtLastName resignFirstResponder];
    [self.txtAddress resignFirstResponder];
    [self.txtCity resignFirstResponder];
    [self.txtState resignFirstResponder];
    [self.txtZip resignFirstResponder];
    [self.txtPhone resignFirstResponder];
    [self.txtEmail resignFirstResponder];
    [self.txtContacts resignFirstResponder];
}
-(IBAction) doneEditing:(id) sender {
    [sender resignFirstResponder];
}
- (CGSize)getScreenSize
{
    //Get Screen size
    CGSize size;
    if (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation) && [[UIScreen mainScreen] bounds].size.height > [[UIScreen mainScreen] bounds].size.width) {
        // in Landscape mode, width always higher than height
        size.width = [[UIScreen mainScreen] bounds].size.height;
        size.height = [[UIScreen mainScreen] bounds].size.width;
    } else if (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) && [[UIScreen mainScreen] bounds].size.height < [[UIScreen mainScreen] bounds].size.width) {
        // in Portrait mode, height always higher than width
        size.width = [[UIScreen mainScreen] bounds].size.height;
        size.height = [[UIScreen mainScreen] bounds].size.width;
    } else {
        // otherwise it is normal
        size.height = [[UIScreen mainScreen] bounds].size.height;
        size.width = [[UIScreen mainScreen] bounds].size.width;
    }
    return size;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSubmit:(id)sender {
    //hide keyboard
    [self dismissKeyboard];
    
    //save
    //format
    if ([self.txtContacts.text  isEqual:@""])
    {
        self.txtContacts.text = @"MyContacts";
    }
    self.txtContacts.text = [NSString stringWithFormat:@"%@\n\nName: %@ %@\nAddress: %@\n         %@, %@ %@\nPhone: %@\nEmail: %@", self.txtContacts.text, self.txtFirstName.text, self.txtLastName.text, self.txtAddress.text, self.txtCity.text, self.txtState.text, self.txtZip.text, self.txtPhone.text, self.txtEmail.text];
    
    self.txtFirstName.text = @"";
    self.txtLastName.text = @"";
    self.txtAddress.text = @"";
    self.txtCity.text = @"";
    self.txtState.text = @"";
    self.txtZip.text = @"";
    self.txtPhone.text = @"";
    self.txtEmail.text = @"";
    
    CGPoint scrollPoint = CGPointMake(0, self.btnBack.frame.origin.y);
    [self.ScrollView  setContentOffset:scrollPoint animated:YES];
}

- (IBAction)btnView:(id)sender {
    //hide keyboard
    [self dismissKeyboard];
    //load voew
    CGPoint scrollPoint = CGPointMake(0, self.btnBack.frame.origin.y);
    [self.ScrollView  setContentOffset:scrollPoint animated:YES];
}

- (IBAction)btnBack:(id)sender {
    [self.ScrollView setContentOffset:CGPointZero animated:YES];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y);
    [self.ScrollView setContentOffset:scrollPoint animated:YES];
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self.ScrollView setContentOffset:CGPointZero animated:YES];
}
- (void)textViewDidBeginEditing:(UITextView *)textView {
    CGPoint scrollPoint = CGPointMake(0, textView.frame.origin.y);
    [self.ScrollView  setContentOffset:scrollPoint animated:YES];
}
- (void)textViewDidEndEditing:(UITextView *)textView {
    [self.ScrollView  setContentOffset:CGPointZero animated:YES];
}

@end
