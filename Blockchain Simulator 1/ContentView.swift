//
//  ContentView.swift
//  Blockchain Simulator 1
//
//  Created by R. Kukuh on 03/01/24.
//

import SwiftUI

struct ContentView: View {
    @State private var blockchain = Blockchain()
    @State private var newTransaction = ""
    
    var body: some View {
        VStack {
            TextField("Enter a transaction", text: $newTransaction)
                .padding()
            
            Button("Add Transaction") {
                blockchain.addBlock(transactions: [newTransaction])
                newTransaction = ""
            }
            .padding()
            
            List(blockchain.allBlocks, id: \.hash) { block in
                VStack(alignment: .leading) {
                    Text("Hash: \(block.hash)")
                    Text("Previous Hash: \(block.previousHash)")
                    Text("Nonce: \(block.nonce)")
                    Text("Version: \(block.version)")
                    Text("Timestamp: \(block.timestamp)")
                    Text("Difficulty Target: \(block.difficultyTarget)")
                    Text("Merkle Root: \(block.merkleRoot)")
                    
                    if block.transactions.isEmpty {
                        Text("No transactions")
                    } else {
                        ForEach(block.transactions, id: \.self) { transaction in
                            Text("Transaction: \(transaction)")
                        }
                    }
                }
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
}

#Preview {
    ContentView()
}
