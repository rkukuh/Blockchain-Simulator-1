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
        let genesisBlock = createGenesisBlock()
        blocks.append(genesisBlock)
    }
    
    var lastBlock: Block? {
        return blocks.last
    }
    
    var allBlocks: [Block] {
        return blocks
    }
    
    func addBlock(transactions: [String]) {
        let newBlock = Block(transactions: transactions, previousHash: lastBlock?.hash ?? "")
        blocks.append(newBlock)
    }
    
    private func createGenesisBlock() -> Block {
        // Create the Genesis block with a default transaction
        return Block(transactions: ["Genesis Block"], previousHash: "0000000000000000")
    }
    
    static func SHA256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = CryptoKit.SHA256.hash(data: inputData)
        return hashedData.compactMap { String(format: "%02x", $0) }.joined()
    }
}
