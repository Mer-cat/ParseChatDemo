//
//  ChatViewController.m
//  ParseChatDemo
//
//  Created by Mercy Bickell on 7/6/20.
//  Copyright © 2020 mercycat. All rights reserved.
//

#import "ChatViewController.h"
#import <Parse/Parse.h>

@interface ChatViewController ()
@property (weak, nonatomic) IBOutlet UITextField *chatMessageField;

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)didTapSend:(id)sender {
    PFObject *chatMessage = [PFObject objectWithClassName:@"Message_fbu2020"];
    chatMessage[@"text"] = self.chatMessageField.text;
    [chatMessage saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            NSLog(@"The message was saved!");
            self.chatMessageField.text = @"";
        } else {
            NSLog(@"Problem saving message: %@",error.localizedDescription);
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
