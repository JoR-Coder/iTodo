//
//  TodoDetailUIViewViewController.m
//  iTodo
//
//  Created by Jyrki Rajala on 2014-05-11.
//  Copyright (c) 2014 Jyrki Rajala. All rights reserved.
//

#import "TodoDetailUIViewViewController.h"


@interface TodoDetailUIViewViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *textTextView;

@end

@implementation TodoDetailUIViewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)saveButtonClicked:(id)sender {
	NSString *title = self.titleTextField.text;
	NSString *text  = self.textTextView.text;
	
	[self.taskList addObject:[[Task alloc] initWithTitle:title andDescription:text]];
	[self goBack:self.navigationItem.self];
}

- (IBAction)goBack:(id)sender {
	[self.view endEditing:YES];
	[self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
