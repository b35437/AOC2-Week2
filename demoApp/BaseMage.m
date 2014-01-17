//
//  BaseMage.m
//  demoApp
//
//  Created by nathan byarley on 1/8/14.
//  Copyright (c) 2014 nathan byarley. All rights reserved.
//

#import "BaseMage.h"

@implementation BaseMage

@synthesize castTime;
@synthesize mastery;
@synthesize spellName;

-(id)init {
    self = [super init];
    if(self !=nil) {
        [self setCastTime:0];
        [self setMastery:nil];
        [self setSpellName:nil];
    }
    return self;
}

//string for calCastTime
-(int)calcCastTime {
    
    /*
    NSString *calCastMsg = [[NSString alloc] initWithFormat:@"Your cast time would be %i ", castTime];
    return calCastMsg;
     */
    [self setCastTime:( 100 ) ];
    return castTime;
}
@end
