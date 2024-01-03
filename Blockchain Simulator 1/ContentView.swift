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
                blockchain.addBlock(transaction: newTransaction)
                newTransaction = ""
            }
            .padding()
            
            List(blockchain.allBlocks, id: \.hash) { block in
                VStack(alignment: .leading) {
                    Text("Hash: \(block.hash)")
                    Text("Transaction: \(block.transaction)")
                    Text("Previous Hash: \(block.previousHash)")
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
}

#Preview {
    ContentView()
}
