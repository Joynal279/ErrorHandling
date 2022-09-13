//
//  ContentView.swift
//  ErrorHandling
//
//  Created by JOYNAL ABEDIN on 13/9/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var readText = ""
    
    let connectionOK = true
    let connectionSpeed = 30.0
    let fileFound = false
    
    var body: some View {
        VStack {
            Button("click here") {
                self.readText = sendFile()
            }
            Text(readText)
        }
       
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
    
    func sendFile() -> String {
        
//        defer {
//            removeTmpFiles()
//            closeConnection()
//        }
        
        do {
            try transferFile()
        }catch FileTransferError.noConnection {
            return "No Network connection"
        }catch FileTransferError.lowBandWidth {
            return "File Transfer Speed to low"
        }catch FileTransferError.fileNotFound {
            return "File Not Found"
        }
        catch {
            return "Unknown Error"
        }
        
        return "Successfully transfer"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
