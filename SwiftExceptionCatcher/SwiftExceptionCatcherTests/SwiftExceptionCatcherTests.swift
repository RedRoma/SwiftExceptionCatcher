//
//  SwiftExceptionCatcherTests.swift
//  SwiftExceptionCatcherTests
//
//  Created by Juan Wellington Moreno on 4/4/16.
//  Copyright © 2016 RedRoma, Inc. All rights reserved.
//

import XCTest
@testable import SwiftExceptionCatcher

class SwiftExceptionCatcherTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testWhenThrows() {
        
        do {
            try tryOp() {
                Throwing.functionThatThrows()
            }
            XCTFail("Expected Exception")
        }
        catch {
            //Test Passed
        }
    }
    
    func testWhenNotThrows() {
        do {
            try tryOp() { Throwing.functionNotThrowing() }
        }
        catch let ex {
            XCTFail("Unexpected Exception: \(ex)")
        }
    }
    
    func testWhenSwiftThrows() {
        do {
            try tryOp() { try self.somethingThatMightThrow(true) }
            XCTFail("Expected Exception")
        }
        catch {
            
        }
    }
    
    func testWhenSwiftNotThrows() {
        do {
            try tryOp() { try self.somethingThatMightThrow(false) }
        }
        catch let ex {
            XCTFail("Unexpected Exception: \(ex)")
        }
    }
    
    
    private func somethingThatMightThrow(shouldThrow: Bool = true) throws {
        
        if shouldThrow {
            throw NSException(name: "Test", reason: "Because", userInfo: nil)
        }
        else {
            print("Not Throwing")
        }
    }
    
}
