//
//  CCBPSprite.m
//  SpriteBuilder
//
//  Created by Viktor on 12/17/13.
//
//

#import "CCBPStateMachine.h"
#import "CCScaleFreeNode.h"
#import "CCSprite.h"

@implementation CCBPStateMachine
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
    // Scale free prevents the images under this node from scaling up and down when the
    // editor window is scaled.  Its good for tokens & symbols.
    _scaleFreeNode = [CCScaleFreeNode node];
    [_scaleFreeNode setScale:1.0f];
    [self addChild:_scaleFreeNode];
    
    CCSprite *stateMachineRepresentation = [CCSprite spriteWithImageNamed:@"state-machine.png"];
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
