//
//  FileTransferError.swift
//  ErrorHandling
//
//  Created by JOYNAL ABEDIN on 13/9/22.
//

import Foundation

enum FileTransferError: Error {
    case noConnection
    case lowBandWidth
    case fileNotFound
}
