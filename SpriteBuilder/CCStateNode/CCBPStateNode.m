//
//  CCBPSprite.m
//  SpriteBuilder
//
//  Created by Viktor on 12/17/13.
//
//

#import "CCBPStateNode.h"
#import "CCScaleFreeNode.h"
#import "CCSprite.h"

@implementation CCBPStateNode
{
    CCNode *_scaleFreeNode;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupVisual];
    }
    return self;
}

- (void)setupVisual
{
    _scaleFreeNode = [CCScaleFreeNode node];
    [_scaleFreeNode setScale:1.0f];
    [self addChild:_scaleFreeNode];
    
    CCSprite *stateMachineRepresentation = [CCSprite spriteWithImageNamed:@"state-node.png"];
    stateMachineRepresentation.positionType = CCPositionTypeUIPoints;
    [_scaleFreeNode addChild:stateMachineRepresentation];
}

- (void)visit:(CCRenderer *)renderer parentTransform:(const GLKMatrix4 *)parentTransform
{
    [super visit:renderer parentTransform:parentTransform];
    //    NSLog(@"Visit state machine");
}

- (void)onEnter
{
    [super onEnter];
    NSLog(@"CCBPStateMachine onEnter");
    
    NSPoint pos = NSPointFromCGPoint([self position]);
    NSLog(@"location: %@", NSStringFromPoint(pos));
}


@end
