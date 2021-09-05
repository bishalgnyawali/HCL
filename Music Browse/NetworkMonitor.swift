//
//  CheckNetworkConnection.swift
//  Music Browse
//
//  Created by Bishal on 4/9/21.
//
//this class checks for internet connection status, if its connected value of 'isConnected' variable is true else false
import Foundation
import Network

final class NetworkMonitor:ObservableObject{
    let monitor=NWPathMonitor()
    let queue=DispatchQueue(label:"Monitor")
    @Published var isConnected=true
    init(){
        monitor.pathUpdateHandler={ [weak self]path in
            DispatchQueue.main.async{
                self?.isConnected=path.status == .satisfied ? true:false
            }
        }
        monitor.start(queue: queue)
    }
}
