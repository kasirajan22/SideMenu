//
//  Menu2.swift
//  SideMenu
//
//  Created by Magizhan on 27/10/20.
//

import SwiftUI

struct Menu2: View {
    @State var midY: CGFloat = 0
    @State var selected = "Shakes"
    @State var search = ""
    var body: some View {
        HStack(spacing: 0){
            VStack{
                Button(action: {}, label: {
                    Image(systemName: "line.horizontal.3")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                })
                Spacer()
                ForEach(tabs,id:\.self){ name in
                    ZStack {
                        
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 12, height: 12)
                            .offset(x: self.selected == name ? 28 : -80)
                        
                        
                        Color("tab")
                            .frame(width:150,height:110)
                            .rotationEffect(.init(degrees: -90))
                            .offset(x: -50)
                        
                        GeometryReader { reader in
                            Button(action: {
                                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.65, blendDuration: 0.65)){
                                    self.midY = reader.frame(in: .global).midY
                                    
                                    self.selected = name
                                }
                            }, label: {
                                Text(name)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.white)
                            })
                            .frame(width:150,height:110)
                            .rotationEffect(.init(degrees: -90))
                            .onAppear(perform: {
                                if name == tabs.first {
                                    self.midY = reader.frame(in: .global).midY
                                }
                            })
                            .offset(x: -8)
                        }
                        .frame(width:150,height:110)
                    }
                }
                
                Spacer(minLength: 0)
            }
            .frame(width:70)
            .background(
                Color("tab")
                    .clipShape(Curve(midY: midY))
                    .ignoresSafeArea()
            )
            VStack{
                HStack{
                    Spacer(minLength: 0)
                    Button(action: {}, label: {
                        Image(systemName: "cart")
                            .font(.title2)
                            .foregroundColor(.black)
                    })
                }
                .padding()
                
                
                HStack {
                    VStack(alignment: .leading,spacing: 4, content: {
                            Text("Smootgie King")
                                .font(.title)
                                .fontWeight(.heavy)
                            Text("Shakes")
                                .font(.title)
                                
                        })
                    .foregroundColor(.black)
                }
                    
                
                    
                    HStack(spacing: 15){
                        TextField("Search", text: $search)
                        
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(Color.black.opacity(0.06))
                    .clipShape(Capsule())
                    .padding(.horizontal)
                    .padding(.top)
                    
               Text("Show Items")
                .padding()
                
                Spacer()
                
            }
            .padding(.leading)
            Spacer()
        }
        
    }
}


var tabs = ["Shakes","Coffee","Drinks","Cocktail"]

struct Curve: Shape {
    var midY: CGFloat
    
    var animatableData: CGFloat {
        get {return midY}
        set {midY = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        return Path{ path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            
            
            // CURVE
            let width = rect.width
            path.move(to: CGPoint(x: width, y: midY - 40))
            
            let to = CGPoint(x: width - 25, y: midY)
            let control1 = CGPoint(x: width, y: midY - 20)
            let control2 = CGPoint(x: width - 25, y: midY - 20)
            
            path.addCurve(to: to, control1: control1, control2: control2)
            
            let to2 = CGPoint(x: width, y: midY + 40)
            let control3 = CGPoint(x: width - 25, y: midY + 20)
            let control4 = CGPoint(x: width, y: midY + 20)
            
            path.addCurve(to: to2, control1: control3, control2: control4)
        }
    }
}
struct Item: Identifiable {
    
    var id = UUID().uuidString
    var title: String
    var cost: String
    var image: String
}

var items = [
    
        Item(title: "Orange Juice Shake", cost: "$6", image: "shake1"),
        Item(title: "Strawberry Juice Shake", cost: "$10", image: "shake2")
]
struct Menu2_Previews: PreviewProvider {
    static var previews: some View {
        Menu2()
    }
}
