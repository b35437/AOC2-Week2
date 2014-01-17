//
//  ViewController.h
//  demoApp
//
//  Created by nathan byarley on 1/8/14.
//  Copyright (c) 2014 nathan byarley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "mageFactory.h"

@interface ViewController : UIViewController <UITextFieldDelegate> {
    
    IBOutlet UITextField *textField;
    IBOutlet UILabel *sLabel;
    IBOutlet UILabel *iLabel;
    IBOutlet UIButton *fireButton;
    IBOutlet UIButton *frostButton;
    IBOutlet UIButton *arcaneButton;
    IBOutlet UIButton *calcButton;
    IBOutlet UIStepper *stepper;
    
    int currentValue;
    NSString *mageType;
    
    
}

-(IBAction)onClickMult:(id)sender;
-(IBAction)onClickBtn:(id)sender;
-(IBAction)onChange:(id)sender;


@end
