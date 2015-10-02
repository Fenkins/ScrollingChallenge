//
//  GameScene.m
//  ScrollingChallenge
//
//  Created by Fenkins on 02/10/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    self.backgroundColor = [SKColor colorWithRed:0.0 green:0.6 blue:1.0 alpha:1.0];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
