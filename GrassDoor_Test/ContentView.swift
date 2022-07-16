//
//  ContentView.swift
//  GrassDoor_Test
//
//  Created by Rameshwar Gupta on 16/07/22.
//

import SwiftUI
import CoreData
import Combine


struct ContentView: View {
    
    var tableViewHeightConstraint: NSLayoutConstraint?
    var cancellables: Set<AnyCancellable> = []
    
    var body: some View {
        CustomTabBarView()
        
       
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
