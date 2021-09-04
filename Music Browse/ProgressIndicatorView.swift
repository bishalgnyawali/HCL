//
//  ProgressIndicatorView.swift
//  Music Browse
//
//  Created by Bishal on 4/9/21.
//

import SwiftUI
struct ProgressIndicatorView:View{
    var status:String
    var body:some View{
        ZStack{
            //Image("MG")
            ProgressView(status)
                .scaleEffect(1.5, anchor: .center)
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
        }
        
    }
}
