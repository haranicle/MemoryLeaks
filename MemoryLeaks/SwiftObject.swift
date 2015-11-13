//
//  SwiftObject.swift
//  MemoryLeaks
//
//  Created by kazushi.hara on 2015/11/11.
//  Copyright © 2015年 haranicle. All rights reserved.
//

import UIKit

class SwiftObject: NSObject {
    var title = "Swift Object"
    var completion:(()->())?
    
    override init() {
        super.init()
    }
    
    // リークしない
    func doSomethingAsync() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            print(self.title)
        }
    }
    
    // selfがリークする
    func doSomething() {
        completion = { () in
            print(self.title)
        }
        completion?()
        // completion = nil // これがあるとちゃんとreleaseされていることになる
    }
    
    // リークしない
    func doSomethingWithWeakSelf() {
        weak var weakSelf = self
        completion = {() in
            print(weakSelf!.title)
        }
        completion?()
    }
    
    // リークしない
    func doSomethingWithCaptureList() {
        completion = {[weak self] () in
            print(self!.title)
        }
        completion?()
    }

}
