//
//  BinarySearchTree.swift
//  DSAOverview
//
//  Created by Abhilash Palem on 04/10/24.
//

/*
 0:33 => Prefix Sum
 1:25 => Two Pointer
 2:05 => Sliding Window
 2:54 => Fast & Slow Pointer
 3:39 => Linked List In-Place Reversal
 4:36 => Monotonic Stack
 5:26 => Top 'k' Elements
 6:14 => Quick Select
 6:33 => Overlapping Intervals
 7:25 => Modified Binary Search
 8:56 => Depth-First Search(DFS)
 9:32 => Breadth-First Search(BFS)
 10:11 => Matrix Traversal
 11:04 => Backtracking
 11:52 => Dynamic Programming
 */

import Foundation

protocol BSTInterface: AnyObject, CustomStringConvertible {
    
    associatedtype Element: Comparable
    associatedtype BSTree: BSTInterface
    
    var left: BSTree? {get set}
    var right: BSTree? {get set}
        
    var count: Int {get}
    var depth: Int {get}
    var height: Int {get}
    var isRoot: Bool {get}
    var isLeaf: Bool {get}
    var isLeftChild: Bool {get}
    var isRightChild: Bool {get}
    var hasLeftChild: Bool {get}
    var hasRightChild: Bool {get}
    var hasAnyChild: Bool {get}
    var hasBothChild: Bool {get}
    
    func insert(_ value: Element)
    func search(_ value: Element) -> BSTree
    func contains(value: Element) -> Bool
    @discardableResult func delete() -> BSTree?
    func isBST(minValue: Element, maxValue: Element) -> Bool
    
    func minimum() -> BSTree
    func maximum() -> BSTree
    func predecessor() -> BSTree?
    func successor() -> BSTree?
    
    func traverseInorder(process: (Element) -> Void)
    func traversePreorder(process: (Element) -> Void)
    func traversePostorder(process: (Element) -> Void)
    func map(_ transform: (Element) -> Element) -> [Element]
    func toArray() -> [Element]
    
    // To create BST from sortedArray or inorder traversal array
    static func createFrom(_ sortedArray: [Element]) -> BSTree
    
    static func createFrom(preOrderArray: [Element]) -> BSTree
    static func createFrom(postOrderArray: [Element]) -> BSTree
}

class BinarySearchTree<T: Comparable>: BSTInterface {
    

    typealias Element = T
    
    private let value: T
    weak var parent: BinarySearchTree?
    var left: BinarySearchTree?
    var right: BinarySearchTree?
    
    init(_ value: T) {
        self.value = value
    }
    
    var count: Int {
        1 + (left?.count ?? 0) + (right?.count ?? 0)
    }
    
    var depth: Int {
        var current = self
        var edges = 0
        while let parent = current.parent {
            edges += 1
            current = parent
        }
        return edges
    }
    
    var height: Int {
        1 + max(left?.height ?? 0, right?.height ?? 0)
    }
    
    var isRoot: Bool {
        parent == nil
    }
    
    var isLeaf: Bool {
        left.isNil && right.isNil
    }
    
    var isLeftChild: Bool {
        self === parent?.left
    }
    
    var isRightChild: Bool {
        self === parent?.right
    }
    
    var hasLeftChild: Bool {
        !left.isNil
    }
    
    var hasRightChild: Bool {
        !right.isNil
    }
    
    var hasAnyChild: Bool {
        hasLeftChild || hasRightChild
    }
    
    var hasBothChild: Bool {
        hasLeftChild && hasRightChild
    }
    
    @discardableResult
    func delete() -> BinarySearchTree? {
        let replacement: BinarySearchTree?
        
        if let right {
            replacement = right.minimum()
        } else if let left {
            replacement = left.maximum()
        } else {
            replacement = nil
        }
        
        replacement?.delete()
        replacement?.left = left
        replacement?.right = right
        left?.parent = replacement
        right?.parent = replacement
        
        reconnectParentTo(node: replacement)
        
        left = nil
        right = nil
        parent = nil
        
        return replacement
    }
    
    func reconnectParentTo(node: BinarySearchTree?) {
        if let parent {
            if isLeftChild {
                parent.left = node
            } else {
                parent.right = node
            }
            node?.parent = parent
        }
    }
    
    func minimum() -> BinarySearchTree {
        var current = self
        while let next = current.left {
            current = next
        }
        return current
    }
    
    func maximum() -> BinarySearchTree {
        var current = self
        while let next = current.right {
            current = next
        }
        return current
    }
    
    func predecessor() -> BinarySearchTree? {
        if let left {
            return left.maximum()
        } else {
            var node = self
            while let parent = node.parent {
                if parent.value < value {
                    return parent
                }
            }
            return nil
        }
    }
    
    func successor() -> BinarySearchTree? {
        if let right {
            return right.minimum()
        } else {
            var node = self
            while let parent = node.parent {
                if parent.value > value {
                    return parent
                }
            }
            return nil
        }
    }
    
    var description: String {
        var message = ""
        if let left {
            message += "\(left.description) <-"
        }
        message += "\(value)"
        if let right {
            message += "\(right.description) ->"
        }
        return message
    }
    
    func insert(_ value: T) {
        if value < self.value {
            if let left {
                left.insert(value)
            } else {
                left = BinarySearchTree(value)
                left?.parent = self
            }
        }
    }
    
    func search(_ value: T) -> BinarySearchTree {
        <#code#>
    }
    
    func contains(value: T) -> Bool {
        <#code#>
    }
    
    func isBST(minValue: T, maxValue: T) -> Bool {
        <#code#>
    }
    
    func traverseInorder(process: (T) -> Void) {
        <#code#>
    }
    
    func traversePreorder(process: (T) -> Void) {
        <#code#>
    }
    
    func traversePostorder(process: (T) -> Void) {
        <#code#>
    }
    
    func map(_ transform: (T) -> T) -> [T] {
        <#code#>
    }
    
    func toArray() -> [T] {
        <#code#>
    }
    
    static func createFrom(_ sortedArray: [T]) -> BinarySearchTree {
        <#code#>
    }
    
    static func createFrom(preOrderArray: [T]) -> BinarySearchTree {
        <#code#>
    }
    
    static func createFrom(postOrderArray: [T]) -> BinarySearchTree {
        <#code#>
    }
}

extension Optional {
    var isNil: Bool {
        switch self {
        case .none:
            return true
        case .some(_):
            return false
        }
    }
}
