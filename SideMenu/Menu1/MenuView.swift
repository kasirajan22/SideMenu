//
//  MenuView.swift
//  SideMenu
//
//  Created by Magizhan on 04/10/20.
//

import SwiftUI

struct MenuView: View {
    @Binding var isOpen: Bool
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "gear")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .heavy))
                    .frame(width: 32, height: 32)
                
                ZStack{
                    Image(systemName: "gear")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                        .padding(.horizontal,24)
                    
                    Circle()
                        .stroke(Color.black)
                        .frame(width: 70, height: 70)
                        .offset(x: -2, y: -1)
                    
                    Circle()
                        .stroke(Color.black)
                        .frame(width: 70, height: 70)
                        .offset(x: 2, y: 1)
                }
                
                Image(systemName: "pencil")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .heavy))
                    .frame(width: 32, height: 32)
            }
            .padding(.top, 20)
            
            Text("Kasirajan")
                .foregroundColor(.white)
                .font(.system(size: 24, weight: .semibold))
                .padding(.top, 10)
                .padding(.bottom, 40)
            
            RowView(activeRow: false, icon: "house", text: "Home")
            RowView(activeRow: true, icon: "person", text: "Profile")
            RowView(activeRow: false, icon: "heart", text: "Favorites")
            
            Spacer()
        }
        .padding(.vertical , 30)
        .background(LinearGradient(gradient: /*@START_MENU_TOKEN@*/Gradient(colors: [Color.red, Color.blue])/*@END_MENU_TOKEN@*/, startPoint: .top, endPoint: .bottom))
        .padding(.trailing, 80)
        .rotation3DEffect(
            Angle(degrees: isOpen ? 0 : 45),
            axis: (x: 0.0, y: 3.0, z: 0.0)
            )
        .offset(x: isOpen ? 0 : -UIScreen.main.bounds.width)
        .animation(.default)
        .onTapGesture{
            self.isOpen.toggle()
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(isOpen: .constant(true))
    }
}
