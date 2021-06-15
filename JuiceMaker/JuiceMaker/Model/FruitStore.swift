//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 
import Foundation

enum Fruit: CaseIterable{
    case strawberry, banana, pineapple, kiwi, mango
}

enum FruitError: Error {
    case outOfStock
    case outOfStockWhenMakeFruits
}

class FruitStore {
    private var fruitStock = [Fruit: Int]()
    
    public init() {
        for fruit in Fruit.allCases {
            increaseStock(fruit: fruit, count: 10)
        }
    }
    public func getStockAmount(fruit: Fruit) -> Int {
        return fruitStock[fruit] ?? 0
    }
    
    public func increaseStock(fruit: Fruit, count: Int) {
        let stock = fruitStock[fruit] ?? 0
        fruitStock[fruit] = stock + count
    }

    func usingFruits(fruit: Fruit, needs: Int) throws {
        guard let stock = fruitStock[fruit] else { return }
        if stock < needs {
            throw FruitError.outOfStock
        } else {
            fruitStock[fruit] = stock - needs
        }
    }
}
