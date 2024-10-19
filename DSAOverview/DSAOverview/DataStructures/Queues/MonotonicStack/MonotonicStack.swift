//
//  MonotonicStack.swift
//  DSAOverview
//
//  Created by Abhilash Palem on 04/10/24.
//

import Foundation

private protocol MonotonicStackInterface {
    associatedtype Element: Comparable
    
    init(
        _ collection: [Element],
        sortPriority: @escaping (Element, Element) -> Bool,
        onRemove: @escaping (_ invalidElement: Element, _ replacement: Element) -> Void
    )
    mutating func append(_ element: Element)
    mutating func pop() -> Element?
}

struct MonotonicStack<T: Comparable>: MonotonicStackInterface {
    
    private(set) var collection: [T] = []
    private let sortPriority: (T, T) -> Bool
    private let onRemove: (T, T) -> Void
    
    init(
        _ arr: [T],
        sortPriority: @escaping (T, T) -> Bool,
        onRemove: @escaping (T, T) -> Void
    ) {
        self.sortPriority = sortPriority
        self.onRemove = onRemove
        
        // O(N)
        for element in arr {
            append(element)
        }
    }
    
    // O(1)
    mutating func append(_ element: T) {
        if let last = collection.last, !sortPriority(last, element) {
            _ = collection.popLast()
            collection.append(element)
            onRemove(last, element)
        } else {
            collection.append(element)
        }
    }
    
    // O(1)
    mutating func pop() -> T? {
        collection.popLast()
    }
}
