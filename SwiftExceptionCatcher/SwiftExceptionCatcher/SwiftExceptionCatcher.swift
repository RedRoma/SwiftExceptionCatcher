//
//  TryOperation.swift
//  SwiftExceptionCatcher
//
//  Created by Juan Wellington Moreno on 4/4/16.
//  Copyright © 2016 RedRoma, Inc. All rights reserved.
//

import Foundation

// This Extensions adds the ability to catch NSException Types
// with Swift
extension NSException : ErrorType {
    public var _domain: String { return "tech.redroma.Aroma" }
    public var _code: Int { return 0 }
}

// This class wraps Operations that may throw NSException types and catches them in a safe way
// Primarily designed to overcome Swift's exception-handling limitations.
public func tryOp<T>(operation: (() throws -> T)) throws -> T {
    
    var result: T?
    var error: NSException?
    
    let theTry: () -> () = {
        do {
            result = try operation()
        } catch let ex {
            error = ex as? NSException
        }
        return
    }
    
    let theCatch: (NSException!) -> () = { ex in
        error = ex
    }
    
    tryOperation(theTry, theCatch)
    
    if let result = result {
        return result
    } else if let ex = error {
        throw ex
    } else {
        throw NSException(name: "Unknown", reason: "Error Occured performing Operation", userInfo: nil)
    }
}
