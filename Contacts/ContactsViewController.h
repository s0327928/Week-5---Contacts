//
//  ContactsViewController.h
//  Contacts
//
//  Created by Levi Orsinger on 9/22/14.
//  Copyright (c) 2014 Levi Orsinger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *txtFirstName;
@property (strong, nonatomic) IBOutlet UITextField *txtLastName;
@property (strong, nonatomic) IBOutlet UITextField *txtAddress;
@property (strong, nonatomic) IBOutlet UITextField *txtCity;
@property (strong, nonatomic) IBOutlet UITextField *txtState;
@property (strong, nonatomic) IBOutlet UITextField *txtZip;
@property (strong, nonatomic) IBOutlet UITextField *txtPhone;
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
- (IBAction)btnSubmit:(id)sender;
- (IBAction)btnView:(id)sender;
- (IBAction)btnBack:(id)sender;
@property (strong, nonatomic) IBOutlet UITextView *txtContacts;
@property (strong, nonatomic) IBOutlet UIScrollView *ScrollView;
-(IBAction) doneEditing:(id) sender;
@property (strong, nonatomic) IBOutlet UIButton *btnBack;

@end
