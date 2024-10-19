//
//  Stack.swift
//  DSAOverview
//
//  Created by Abhilash Palem on 04/10/24.
//

import Foundation

private protocol StackInterface {
    associatedtype Element
    
    var isEmpty: Bool {get}
    var count: Int {get}
    var top: Element? {get}
    mutating func push(_ element: Element)
    mutating func pop() -> Element?
}

struct Stack<T>: StackInterface {
    
    private var collection: [T] = []
    
    var isEmpty: Bool {
        collection.isEmpty
    }
    
    /*
     To check whether a collection is empty, use its isEmpty property instead of comparing count to zero. Unless the collection guarantees random-access performance, calculating count can be an O(n) operation.
     */
    var count: Int {
        collection.count
    }
    
    // O(1)
    var top: T? {
        collection.last
    }
    
    // O(1)
    mutating func push(_ element: T) {
        collection.append(element)
    }
    
    // O(1)
    mutating func pop() -> T? {
        collection.popLast()
    }
}
