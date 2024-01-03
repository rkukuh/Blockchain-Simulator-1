//
//  Block.swift
//  Blockchain Simulator 1
//
//  Created by R. Kukuh on 03/01/24.
//

import Foundation

class Block {
    var version: Int = 1 // Simplified version number
    let previousHash: String
    var merkleRoot: String {
        // Simplified calculation of the Merkle root for demonstration purposes.
        // In a real-world scenario, this would be a hash of all the transactions in the block.
        return transactions.reduce("") { $0 + $1.hashValue.description }
    }
    var timestamp: Int {
        // Return the current time as a timestamp.
        return Int(Date().timeIntervalSince1970)
    }
    var difficultyTarget = 0x1d00ffff // A fixed difficulty target for simplicity
    var nonce: Int = 0
    var transactions: [String]
    
    var hash: String {
        // A simplified hash calculation.
        return Blockchain.SHA256("\(version)\(previousHash)\(merkleRoot)\(timestamp)\(difficultyTarget)\(nonce)")
    }
    
    init(transactions: [String], previousHash: String = "") {
        self.transactions = transactions
        self.previousHash = previousHash
    }
}
