//
//  SwiftExceptionCatcherTests.swift
//  SwiftExceptionCatcherTests
//
//  Created by Wellington Moreno on 4/4/16.
//  Copyright © 2016 RedRoma, Inc. All rights reserved.
//

import XCTest
@testable import SwiftExceptionCatcher

class SwiftExceptionCatcherTests: XCTestCase
{
    
    func testWhenThrows()
    {
        
        do
        {
            try tryOp()
            {
                Throwing.functionThatThrows()
            }
            XCTFail("Expected Exception")
        }
        catch
        {
            //Test Passed
        }
    }
    
    func testWhenNotThrows()
    {
        do
        {
            try tryOp() { Throwing.functionNotThrowing() }
        }
        catch let ex
        {
            XCTFail("Unexpected Exception: \(ex)")
        }
    }
    
    func testWhenSwiftThrows()
    {
        do
        {
            try tryOp() { try self.somethingThatMightThrow(true) }
            XCTFail("Expected Exception")
        }
        catch {
            
        }
    }
    
    func testWhenSwiftNotThrows()
    {
        do
        {
            try tryOp() { try self.somethingThatMightThrow(false) }
        }
        catch let ex
        {
            XCTFail("Unexpected Exception: \(ex)")
        }
    }
    
    
    fileprivate func somethingThatMightThrow(_ shouldThrow: Bool = true) throws
    {
        
        if shouldThrow
        {
            throw NSException(name: NSExceptionName(rawValue: "Test"), reason: "Because", userInfo: nil)
        }
        else
        {
            print("Not Throwing")
        }
    }
    
}
