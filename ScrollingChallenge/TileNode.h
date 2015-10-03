//
//  TileNode.h
//  ScrollingChallenge
//
//  Created by Fenkins on 03/10/15.
//  Copyright © 2015 Fenkins. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface TileNode : SKSpriteNode

@property (nonatomic) TileNode* nextTile;
@property (nonatomic) TileNode* prevTile;

@end
