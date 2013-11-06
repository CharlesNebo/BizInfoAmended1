//
//  ViewController.h
//  BizInfoAmended1
//
//  Created by Charles Nebo on 11/5/13.
//  Copyright (c) 2013 charles Nebo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UIImagePickerControllerDelegate
,UINavigationControllerDelegate>

{
    IBOutlet UITextView *_theViewer;
    IBOutlet UISwitch *_theSwitch;

}

-(IBAction)switchOn:(id)sender;

-(IBAction)backgroundTap:(id)sender;

-(IBAction)textViewDoneEditing:(id)sender;


@end
