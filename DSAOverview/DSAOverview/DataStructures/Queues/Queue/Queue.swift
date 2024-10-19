//
//  Queue.swift
//  DSAOverview
//
//  Created by Abhilash Palem on 04/10/24.
//

import Foundation

protocol QueueInterface {
    associatedtype Element
    var count: Int {get}
    var isEmpty: Bool {get}
    
    func front() -> Element?
    mutating func enqueue(_ element: Element)
    mutating func dequeue() -> Element?
}

struct Queue<T>: QueueInterface {
    
    private var collection: [T] = []
    
    var count: Int {
        collection.count
    }
    
    var isEmpty: Bool {
        collection.isEmpty
    }
    
    func front() -> T? {
        collection.first
    }
    
    mutating func enqueue(_ element: T) {
        collection.append(element)
    }
    
    mutating func dequeue() -> T? {
        isEmpty ? nil : collection.removeFirst()
    }
}
