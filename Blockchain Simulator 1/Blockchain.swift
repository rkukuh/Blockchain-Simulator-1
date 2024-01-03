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
    
    init() {
        // Initialize the blockchain with the Genesis block
        let genesisBlock = createGenesisBlock()
        blocks.append(genesisBlock)
    }
    
    var lastBlock: Block? {
        return blocks.last
    }
    
    // Computed property to provide access to the blocks
    var allBlocks: [Block] {
        return blocks
    }
    
    func addBlock(transactions: [String]) {
        let newBlock = Block(transactions: transactions, previousHash: lastBlock?.hash ?? "")
        blocks.append(newBlock)
    }
    
    private func createGenesisBlock() -> Block {
        // Create a Genesis block with default or hardcoded values
        return Block(transactions: ["Genesis Block"], previousHash: "0000000000000000")
    }
    
    
    static func SHA256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = CryptoKit.SHA256.hash(data: inputData)
        return hashedData.compactMap { String(format: "%02x", $0) }.joined()
    }
}
