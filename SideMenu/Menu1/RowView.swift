//
//  RowView.swift
//  SideMenu
//
//  Created by Magizhan on 04/10/20.
//

import SwiftUI

struct RowView: View {
    var activeRow: Bool
    var icon = "house"
    var text = "Dashboard"
    var body: some View {
        HStack{
            Image(systemName: icon)
                .foregroundColor(activeRow ? Color.red : .white)
                .font(.system(size: 15, weight: activeRow ? .bold : .regular))
                .frame(width: 48, height: 32)
            
            Text(text)
                .foregroundColor(activeRow ? Color.red : .white)
                .font(.system(size: 15, weight: activeRow ? .bold : .regular))
            
            Spacer()
        }
        .padding(5)
        .background(activeRow ? Color.white : Color.white.opacity(0))
        .padding(.trailing, 20)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .offset(x: 20)
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(activeRow: true, icon: "house", text: "Home")
    }
}
