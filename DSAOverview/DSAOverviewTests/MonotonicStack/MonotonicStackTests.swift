//
//  MonotonicStackTests.swift
//  DSAOverviewTests
//
//  Created by Abhilash Palem on 04/10/24.
//

import XCTest
@testable import DSAOverview

final class MonotonicStackTests: XCTestCase {

    func testMonotonicStack() {
        let arr = [1,2,3,4,5]
        let stack = MonotonicStack(arr, sortPriority: < ) { removed, replacement in
            print("Removed: \(removed), Replacement: \(replacement)")
        }
        print("Collection: \(stack.collection)")
        XCTAssertEqual(stack.collection, [1,2,3,4,5])
    }

}
