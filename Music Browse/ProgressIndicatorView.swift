//
//  ProgressIndicatorView.swift
//  Music Browse
//
//  Created by Bishal on 4/9/21.
//

import SwiftUI
struct ProgressIndicatorView:View{
    var body:some View{
        ZStack{
            //Image("MG")
            ProgressView("Loading")
                .scaleEffect(1.5, anchor: .center)
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
        }
        
    }
}
