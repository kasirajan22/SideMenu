//
//  Menu1.swift
//  SideMenu
//
//  Created by Magizhan on 27/10/20.
//

import SwiftUI

struct Menu1: View {
    @State var isOpen: Bool = false
    var body: some View {
        NavigationView{
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        self.isOpen.toggle()
                    }, label: {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                            .foregroundColor(.black)
                    })
                }
                Spacer()
            }
            .padding()
            
            MenuView(isOpen: $isOpen)
        }
        .navigationBarHidden(true)
        }
    }
}

struct Menu1_Previews: PreviewProvider {
    static var previews: some View {
        Menu1()
    }
}
