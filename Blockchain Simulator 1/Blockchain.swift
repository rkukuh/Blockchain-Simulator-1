//
//  Blockchain.swift
//  Blockchain Simulator 1
//
//  Created by R. Kukuh on 03/01/24.
//

import Foundation
import CryptoKit

class Blockchain {
    private var blocks: [Block] = []
    
    var lastBlock: Block? {
        return blocks.last
    }
    
    // Add this computed property to provide access to the blocks
    var allBlocks: [Block] {
        return blocks
    }
    
    func addBlock(transactions: [String]) {
        let newBlock = Block(transactions: transactions, previousHash: lastBlock?.hash ?? "")
        blocks.append(newBlock)
    }
    
    static func SHA256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = CryptoKit.SHA256.hash(data: inputData)
        return hashedData.compactMap { String(format: "%02x", $0) }.joined()
    }
}
