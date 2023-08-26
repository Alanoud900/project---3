//
//  ActivityComponentView.swift
//  project -3
//
//  Created by Alanoud  on 09/02/1445 AH.
//

import SwiftUI

struct ActivityComponentView: View {
    var body: some View {
        HStack(alignment: .top){
            AsyncImage(url:URL(string: "https://source.unsplash.com/400x300/?person")
            ){result in
                if let image = result.image{
                    image.resizable()
                        .scaledToFill()
                        
                }else {
                    ProgressView()
                }
            }
            .frame(width: 50, height: 50)
                .cornerRadius(50)
            VStack(alignment: .leading){
                HStack{
                    Text("Username")
                        .fontWeight(.medium)
                    Text("12s")
                        .foregroundColor(.gray)
                }
                Text("Follow you")
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            Button(action: {
                
            }, label: {
                Text("Follow")
                    .padding(.horizontal)
                    .padding(.vertical)
                    .background(
                        RoundedRectangle(cornerRadius: 12.5)
                            .stroke(.gray.opacity(0.25))
                    )
            }
            )
            .buttonStyle(.plain)
        }
        .padding(.horizontal)
    }
}

struct ActivityComponentView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityComponentView()
    }
}
