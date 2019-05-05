//
//  TryOperation.swift
//  SwiftExceptionCatcher
//
//  Created by Wellington Moreno on 4/4/16.
//  Copyright © 2019 RedRoma, Inc. All rights reserved.
//

import Foundation


/**
 * This Extension adds the ability to catch NSException Types in Swift.
 */
extension NSException : Error
{
    public var _domain: String { return "tech.redroma.SwiftExceptionCatcher" }
    public var _code: Int { return 0 }
}

/**
   This class wraps Operations that may throw NSException types and catches them in a safe way
   Primarily designed to overcome Swift's exception-handling limitations.
 
    - parameter operation: This operation may throw an Objective-C NSException type and must be safely wrapped.
*/
public func tryOp<T>(_ operation: @escaping (() throws -> T)) throws -> T
{
    
    var result: T?
    var error: NSException?
    
    let theTry: () -> () =
    {
        do
        {
            result = try operation()
        }
        catch let ex
        {
            error = ex as? NSException
        }
        return
    }
    
    let theCatch: (NSException?) -> () = { ex in
        error = ex
    }
    
    tryOperation(theTry, theCatch)
    
    if let result = result
    {
        return result
    }
    else if let ex = error
    {
        throw ex as Error
    }
    else
    {
        throw NSException(name: NSExceptionName(rawValue: "Unknown"), reason: "Error Occured performing Operation", userInfo: nil)
    }
}
