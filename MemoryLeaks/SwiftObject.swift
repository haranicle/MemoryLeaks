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
    
    func doSomething() {
        completion = { () in
            print(self.title)
        }
        completion?()
    }
    
    func doSomethingWithWeakSelf() {
        completion = {[weak self] () in
            print(self!.title)
        }
        completion?()
    }

}
