//
//  ContentView.swift
//  ErrorHandling
//
//  Created by JOYNAL ABEDIN on 13/9/22.
//

import SwiftUI

struct ContentView: View {
    
    let connectionOK = true
    let connectionSpeed = 30.0
    let fileFound = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
    
    func transferFile() throws {
        guard connectionOK else {
            throw FileTransferError.noConnection
        }
        guard connectionSpeed>30 else {
            throw FileTransferError.lowBandWidth
        }
        guard fileFound else {
            throw FileTransferError.fileNotFound
        }
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
