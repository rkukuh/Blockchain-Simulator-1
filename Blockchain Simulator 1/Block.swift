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
        return computeMerkleRoot(transactions: transactions)
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
    
    private func computeMerkleRoot(transactions: [String]) -> String {
        var hashes = transactions.map { Blockchain.SHA256($0) }
        
        while hashes.count > 1 {
            if hashes.count % 2 != 0 {
                hashes.append(hashes.last!)
            }
            
            var newLevel = [String]()
            for i in stride(from: 0, to: hashes.count, by: 2) {
                let combinedHash = hashes[i] + hashes[i + 1]
                newLevel.append(Blockchain.SHA256(combinedHash))
            }
            hashes = newLevel
        }
        
        return hashes.first ?? ""
    }
    
    func mineBlock(difficulty: Int) {
        let target = String(repeating: "0", count: difficulty)
        
        while !self.hash.hasPrefix(target) {
            nonce += 1
            // Recompute the hash with the new nonce
        }
    }
}
