//
//  iTodoTableViewController.m
//  iTodo
//
//  Created by Jyrki Rajala on 2014-05-11.
//  Copyright (c) 2014 Jyrki Rajala. All rights reserved.
//

#import "iTodoTableViewController.h"
#import "TodoDetailUIViewViewController.h"
#import "Task.h"

#define TITLE_TAG  10000
#define TEXT_TAG   20000
#define SWITCH_TAG 30000

@interface iTodoTableViewController ()
@property (strong, nonatomic) IBOutlet UITableView *TodoTableView;

@property (nonatomic) NSMutableArray *taskList;

@end

@implementation iTodoTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
		// Custom stuff.
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	self.taskList = [[NSMutableArray alloc] initWithObjects:
					 [[Task alloc] initWithTitle:@"Empty list" andDescription:@"Add stuff to your todo list."],
					 [[Task alloc] initWithTitle:@"Do work" andDescription:@"Do your friggin labs"],
					 nil ];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


-(void) viewWillAppear:(BOOL)animated
{
	[ self.tableView reloadData ];
	
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.taskList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"taskCell" forIndexPath:indexPath];

	Task *t = [self.taskList objectAtIndex:indexPath.row];
	
	UILabel    *titleLabel   = (UILabel *)    [cell viewWithTag:TITLE_TAG ];
	UITextView *textTextView = (UITextView *) [cell viewWithTag:TEXT_TAG ];
	UISwitch   *switchOff    = (UISwitch *)   [cell viewWithTag:SWITCH_TAG ];
	
	switchOff.tag = indexPath.row+1;
	[switchOff setOn:YES];
	[switchOff addTarget:self action:@selector(taskDone:) forControlEvents:UIControlEventTouchUpInside];
	
	
	titleLabel.text   = [NSString stringWithFormat:@"%@", t.Title ];
	textTextView.text = [NSString stringWithFormat:@"%@", t.TodoText ];

    return cell;
}

-(void)taskDone:(UISwitch *)switchOff{
	
	if ( !switchOff.on ) {
		[self.taskList removeObjectAtIndex:switchOff.tag-1];
		[ self.tableView reloadData ];
	}
	
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ( [segue.identifier isEqualToString:@"toEditSegue"] ) {
		
		TodoDetailUIViewViewController *editView = [segue destinationViewController];
		editView.taskList = self.taskList;

	}
}


@end
