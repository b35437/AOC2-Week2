//
//  ViewController.m
//  demoApp
//
//  Created by nathan byarley on 1/8/14.
//  Copyright (c) 2014 nathan byarley. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//
-(IBAction)onClickMult:(id)sender {
    
    if(stepper) {
        if(stepper.tag == 0 && mageType) {
            NSLog(@"You have accessed the stepper");
            
            currentValue = stepper.value;
            
            //used different strings based on mageType using if statements
            if ([mageType isEqualToString:@"Fire"]) {
                if (currentValue > 1) {
                    textField.text = [NSString stringWithFormat:@"%d %@ Spells", currentValue, mageType];
                } else {
                    textField.text = [NSString stringWithFormat:@"%d %@ Spell", currentValue, mageType];
                }
            } else if ([mageType isEqualToString:@"Frost"]) {
                if (currentValue > 1) {
                    textField.text = [NSString stringWithFormat:@"%d Creatures", currentValue];
                } else {
                    textField.text = [NSString stringWithFormat:@"%d Creature", currentValue];
                }
            } else if ([mageType isEqualToString:@"Arcane"]) {
                if (currentValue > 1) {
                    textField.text = [NSString stringWithFormat:@"%d %@ Charges", currentValue, mageType];
                } else {
                    textField.text = [NSString stringWithFormat:@"%d %@ Charge", currentValue, mageType];
                }
            } else {
                textField.text = [NSString stringWithFormat:@"Select a Mage Type"];
            }
        }
    }
    
}

//transition between views
-(IBAction)exit:(UIStoryboardSegue *)segue {
    
}

-(IBAction)onClickBtn:(id)sender {
    //button tags are as follows
    //0 = fire
    //1 = frost
    //2 = arcane
    //3 = calculate
    //4 = info
    
    UIButton *button = (UIButton*)sender;
    
    if(button) {
        if(button.tag == 0) {
            NSLog(@"You Chose Fire Mage");
            
            if(![mageType isEqualToString:@"Fire"]) {
                stepper.value = 1;
                currentValue = stepper.value;
            }
            
            textField.text = [NSString stringWithFormat:@"You have Chosen Fire Mage"];
            mageType = @"Fire";
            
            sLabel.text = [NSString stringWithFormat:@"Increase your Haste"];
            iLabel.text = [NSString stringWithFormat:@"Number of spells"];
            
            //self
            fireButton.enabled = FALSE;
            fireButton.alpha = 0.5f;
            
            //others
            frostButton.Enabled = TRUE;
            frostButton.alpha = 1.0f;
            arcaneButton.Enabled = TRUE;
            arcaneButton.alpha = 1.0f;
            
        } else if (button.tag == 1) {
            NSLog(@"You Chose Frost Mage");
            
            if (![mageType isEqualToString:@"Frost"]) {
                stepper.value = 1;
                currentValue = stepper.value;
            }
            textField.text = [NSString stringWithFormat:@"You have chosen Frost mage"];
            mageType = @"Frost";
            
            sLabel.text = [NSString stringWithFormat:@"What is your Damage Modification"];
            iLabel.text = [NSString stringWithFormat:@"How many Targets"];
            
            //self
            frostButton.enabled = FALSE;
            frostButton.alpha = 0.5f;
            
            //others
            fireButton.Enabled = TRUE;
            fireButton.alpha = 1.0f;
            arcaneButton.Enabled = TRUE;
            arcaneButton.alpha = 1.0f;
            
        } else if (button.tag == 2) {
            NSLog(@"You Chose Arcane Mage");
            
            if (![mageType isEqualToString:@"Arcane"]) {
                stepper.value = 2;
                currentValue = stepper.value;
            }
            textField.text = [NSString stringWithFormat:@"You have chosen Arcane Mage"];
            mageType = @"Arcane";
            
            sLabel.text = [NSString stringWithFormat:@"What is your Total Damage Output"];
            iLabel.text = [NSString stringWithFormat:@"How many Charges"];
            
            //self
            arcaneButton.enabled = FALSE;
            arcaneButton.alpha = 0.5f;
            
            //others
            fireButton.Enabled = TRUE;
            fireButton.alpha = 1.0f;
            frostButton.Enabled = TRUE;
            frostButton.alpha = 1.0f;

        } else if (button.tag == 3) {
            if ([mageType isEqualToString:@"Fire"]) {
                fireMage *fire = (fireMage*)[mageFactory createNewMage:FIRE];
                if (currentValue > 1) {
                    textField.text = [NSString stringWithFormat:@"%d Fire Spells --> %i%% Haste", currentValue, [fire calcCastTime]*currentValue ];
                } else {
                    textField.text = [NSString stringWithFormat:@"%d Fire Spell --> %i%% Haste", currentValue, [fire calcCastTime]*currentValue ];
                }
            } else if ([mageType isEqualToString:@"Frost"]) {
                frostMage *frost = (frostMage*)[mageFactory createNewMage:FROST];
                if (currentValue > 1) {
                    textField.text = [NSString stringWithFormat:@"%d Targets Affected --> %i Damage", currentValue, ([frost calcDmg]*currentValue) ];
                } else {
                    textField.text = [NSString stringWithFormat:@"%d Target Affected --> %i Damage", currentValue, ([frost calcDmg]*currentValue) ];
                }
            } else if ([mageType isEqualToString:@"Arcane"]) {
                arcaneMage *arcane = (arcaneMage*)[mageFactory createNewMage:ARCANE];
                if (currentValue > 1) {
                    textField.text = [NSString stringWithFormat:@"%d Charges --> %i Output", currentValue, ([arcane calArcaneDmg]*currentValue) ];
                } else {
                    textField.text = [NSString stringWithFormat:@"%d Charge --> %i Output", currentValue, ([arcane calArcaneDmg]*currentValue) ];
                }
            }
        }

    }
    
}

 

-(IBAction)onChange:(id)sender {
    //segment controll allows the changing of what ever action based on buttons pushed
    //same as radio buttons.
    UISegmentedControl *segCntrl = (UISegmentedControl*)sender;
    if (segCntrl) {
        int index = segCntrl.selectedSegmentIndex;
        NSLog(@"Index #:%d selected", index);
        if (segCntrl.selectedSegmentIndex == 0) {
            self.view.backgroundColor = [UIColor redColor];
        } else if (segCntrl.selectedSegmentIndex == 1) {
            self.view.backgroundColor = [UIColor blueColor];
        } else if (segCntrl.selectedSegmentIndex == 2) {
            self.view.backgroundColor = [UIColor purpleColor];
        } else if (segCntrl.selectedSegmentIndex == 3) {
            self.view.backgroundColor = [UIColor whiteColor];
        }
    }
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
