//
//  ContentView.swift
//  SwiftUI-MusicPlayerMagicMove
//
//  Created by Arpit Dixit on 28/08/21.
//

import SwiftUI

struct MusicBarView: View {
    
    let namespace: Namespace.ID
    
    var body: some View {
        HStack {
            Image("pattern")
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
                .cornerRadius(3.0)
                .padding()
                .matchedGeometryEffect(id: "animation", in: namespace)
            
            Text("Baby Blue")
                .font(.headline)
            
            Spacer()
            
            Image(systemName: "play.fill")
            Image(systemName: "forward.fill")
                .padding(.trailing, 10)
        }
        .frame(width: .infinity, height: .infinity, alignment: .center)
        .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
    }
}

struct MusicPlayer: View {
    
    let namespace: Namespace.ID
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Image("pattern")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .padding(40)
                .matchedGeometryEffect(id: "animation", in: namespace)
            
            HStack {
                VStack(alignment: .leading, spacing: nil, content: {
                    Text("Baby Blue")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("Badfinger")
                        .font(.title)
                        .fontWeight(.light)
                        .opacity(0.5)
                        .foregroundColor(.white)
                })
                
                Spacer()
            }
            .padding(.leading, 40)
            
            Spacer()
            
            HStack {
                Image(systemName: "backward.fill")
                    .foregroundColor(.white)
                    .font(.system(size:30))
                
                Image(systemName: "play.fill")
                    .foregroundColor(.white)
                    .font(.system(size:30))
                
                Image(systemName: "forward.fill")
                    .foregroundColor(.white)
                    .font(.system(size:30))
            }
            .padding(.bottom, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)))
    }
}

struct ContentView: View {
    
    @Namespace private var ns
    @State private var showDetails = false
    
    var body: some View {
        VStack {
            Spacer()
            if showDetails {
                MusicPlayer(namespace: ns)
            } else {
                MusicBarView(namespace: ns)
            }
        }
        .onTapGesture {
            withAnimation(.spring()) { 
                showDetails.toggle()
            }
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
