//
//  GameScene.m
//  ScrollingChallenge
//
//  Created by Fenkins on 02/10/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

#import "GameScene.h"
#import "TileNode.h"

@implementation GameScene {
    TileNode* _leftMostTile;
    TileNode* _rightMostTile;
    int _direction;
}

static const CGFloat kScrollSpeed = 70.0;

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    self.backgroundColor = [SKColor colorWithRed:0.81 green:0.95 blue:0.96 alpha:1.0];
    
    _direction = -1;
    
    _leftMostTile = nil;
    _rightMostTile = nil;
    for (int i = 0; i<3; i++) {
        TileNode* tile = [TileNode spriteNodeWithImageNamed:@"bg_desert"];
        tile.anchorPoint = CGPointZero;
        if (!_leftMostTile) {
            _leftMostTile = tile;
        }
        if (_rightMostTile) {
            tile.position = CGPointMake(_rightMostTile.position.x+_rightMostTile.size.width, _rightMostTile.position.y);
        }else{
            tile.position = CGPointZero;
        }
        tile.prevTile = _rightMostTile;
        _rightMostTile.nextTile = tile;
        _rightMostTile = tile;
        [self addChild:tile];
    }
    _leftMostTile.prevTile = _rightMostTile;
    _rightMostTile.nextTile = _leftMostTile;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    _direction *= -1;
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    static CFTimeInterval lastCallTime;
    CFTimeInterval timeElapsed = currentTime - lastCallTime;
    if (timeElapsed > 10.0 / 60.0) {
        timeElapsed = 10.0/ 60.0;
    }
    lastCallTime = currentTime;
    
    CGFloat scrollDistance = kScrollSpeed*timeElapsed;
    TileNode* tile = _leftMostTile;
    do {
        tile.position = CGPointMake(tile.position.x+scrollDistance*_direction, tile.position.y);
        tile = tile.nextTile;
    } while (tile != _leftMostTile);
    if (_direction == -1) {
        if (_leftMostTile.position.x + _leftMostTile.size.width < 0) {
            _leftMostTile.position = CGPointMake(_rightMostTile.position.x+_rightMostTile.size.width, _leftMostTile.position.y);
            _rightMostTile = _leftMostTile;
            _leftMostTile = _leftMostTile.nextTile;
        }
    } else {
        if (_rightMostTile.position.x > self.size.width) {
            _rightMostTile.position = CGPointMake(_leftMostTile.position.x-_rightMostTile.size.width, _rightMostTile.position.y);
            _leftMostTile = _rightMostTile;
            _rightMostTile = _rightMostTile.prevTile;
        }
    }
}

@end
