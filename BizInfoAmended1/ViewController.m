//
//  ViewController.m
//  BizInfoAmended1
//
//  Created by Charles Nebo on 11/5/13.
//  Copyright (c) 2013 charles Nebo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
 
    IBOutlet UILabel *_label;
    IBOutlet UIImageView *_imageView;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	_label.text = @"No image";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cameraButton:(id)sender {
    //_cameraLabel.text = @"Camera button pressed";
    [self startRealCameraControllerFromViewController:self usingDelegate:self];
}

- (IBAction)saveButton:(id)sender {
    if (_imageView.image) {
        _label.text = @"Saving image ...";
        UIImageWriteToSavedPhotosAlbum(_imageView.image, self, @selector(image:didFinnishSavingWithError:contextInfo:), nil);
    } else {
        _label.text = @"Cannot save: no image";
    }
}


- (IBAction)pictureButton:(id)sender {
    //_label.text = @"Pressed the button.";
    [self startCameraControllerFromViewController:self usingDelegate:self];
}

- (void) image:(UIImage *) image didFinnishSavingWithError:(NSError *)error contextInfo:(void *) contextInfo{
    if (error) {
        _label.text = [NSString stringWithFormat:@"Error %d: %@", error.code, error.localizedDescription];
    } else {
        _label.text = @"Image saved.";
        _imageView.image = nil;
    }
}

- (BOOL) startCameraControllerFromViewController: (UIViewController*)controller usingDelegate: (id<UIImagePickerControllerDelegate, UINavigationControllerDelegate>)
delegate {
    if (([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] == NO) || (delegate == nil) || (controller == nil)) {
        return NO;
    }
    UIImagePickerController *cameraUI = [[UIImagePickerController alloc] init];
    cameraUI.delegate = delegate;
    [controller presentViewController:cameraUI animated:YES completion:nil];
    return YES;
}

- (BOOL) startRealCameraControllerFromViewController: (UIViewController*)controller usingDelegate: (id<UIImagePickerControllerDelegate, UINavigationControllerDelegate>)
delegate {
    if (([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] == NO) || (delegate == nil) || (controller == nil)) {
        return NO;
    }
    UIImagePickerController *cameraUI = [[UIImagePickerController alloc] init];
    cameraUI.sourceType = UIImagePickerControllerSourceTypeCamera;
    cameraUI.delegate = delegate;
    [controller presentViewController:cameraUI animated:YES completion:nil];
    return YES;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    _label.text = [NSString stringWithFormat:@"Have image %d x %d", (int)image.size.width, (int)image.size.height];
    _imageView.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(IBAction)switchOn:(id)sender{
    
    if (_theSwitch.isOn == YES) {
        _theViewer.hidden = NO;
    }else if(_theSwitch.isOn == NO)
        
        _theViewer.hidden = YES;
    
  }

-(IBAction)backgroundTap:(id)sender{
   
    [self->_theViewer resignFirstResponder];
}


-(IBAction)textViewDoneEditing:(id)sender{

   [sender resignFirstResponder];
}
@end
















