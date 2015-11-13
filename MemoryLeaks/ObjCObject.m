//
//  ObjCObject.m
//  MemoryLeaks
//
//  Created by kazushi.hara on 2015/11/11.
//  Copyright © 2015年 haranicle. All rights reserved.
//

#import "ObjCObject.h"

@interface ObjCObject ()
@property (nonatomic) NSString* title;
@property (nonatomic, copy) void (^completion)();
@end

@implementation ObjCObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"Objc Object";
    }
    return self;
}

// リークしない
- (void)doSomethingAsync {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"%@", _title);
    });
}

// selfがリークする
- (void)doSomething {
    self.completion = ^void() {
        NSLog(@"%@", _title);
    };
    _completion();
    // self.completion = nil; // これがあるとちゃんとreleaseされていることになる
}

// リークしない
- (void)doSomethingWithWeakSelf {
    __weak ObjCObject *weakSelf = self;
    self.completion = ^void() {
        NSLog(@"%@", weakSelf.title);
    };
    _completion();
}

@end
