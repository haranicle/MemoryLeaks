//
//  ObjCObject.h
//  MemoryLeaks
//
//  Created by kazushi.hara on 2015/11/11.
//  Copyright © 2015年 haranicle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjCObject : NSObject

- (void)doSomethingAsync;
- (void)doSomething;
- (void)doSomethingWithWeakSelf;

@end
