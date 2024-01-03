//
//  Block.swift
//  Blockchain Simulator 1
//
//  Created by R. Kukuh on 03/01/24.
//

import Foundation

class Block {
    var version: Int = 1
    let previousHash: String
    var merkleRoot: String {
        // Simplified calculation of the Merkle root
        return transactions.reduce("") { $0 + $1.hashValue.description }
    }
    var timestamp: Int {
        return Int(Date().timeIntervalSince1970)
    }
    var difficultyTarget = 0x1d00ffff
    var nonce: Int = 0
    var transactions: [String]
    
    var hash: String {
        // SHA256 hashing function
        return Blockchain.SHA256("\(version)\(previousHash)\(merkleRoot)\(timestamp)\(difficultyTarget)\(nonce)")
    }
    
    init(transactions: [String], previousHash: String = "") {
        self.transactions = transactions
        self.previousHash = previousHash
    }
}
