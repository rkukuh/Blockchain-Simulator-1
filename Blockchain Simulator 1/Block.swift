//
//  Block.swift
//  Blockchain Simulator 1
//
//  Created by R. Kukuh on 03/01/24.
//

import Foundation

class Block {
    var nonce: Int = 0
    let transaction: String
    let previousHash: String
    var hash: String {
        return Blockchain.SHA256("\(nonce)\(transaction)\(previousHash)")
    }
    
    init(transaction: String, previousHash: String = "") {
        self.transaction = transaction
        self.previousHash = previousHash
    }
}
