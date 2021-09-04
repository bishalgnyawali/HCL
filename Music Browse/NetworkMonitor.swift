//
//  CheckNetworkConnection.swift
//  Music Browse
//
//  Created by Bishal on 4/9/21.
//

import Foundation
import Network

final class NetworkMonitor:ObservableObject{
    let monitor=NWPathMonitor()
    let queue=DispatchQueue(label:"Monitor")
    @Published var isConnected=true
    init(){
        monitor.pathUpdateHandler={ path in
            
        }
    }
}
