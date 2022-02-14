//
//  ContentView.swift
//  SpotifyClone
//
//  Created by Mickael Mas on 14/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var timing: Double = 0.0
    
    @State private var songs: [Song] = Song.all
    
    @State private var selection: Song = Song.all[0]
    @State private var index: Int = 0

    var body: some View {
        ZStack {
            Color.primary
            
            
            Image(selection.imageName)
                .resizable()
                .blur(radius: 15)
                .opacity(0.7)
                .background(.thinMaterial)
            
            VStack {
                HStack {
                    Button {
                        print("More")
                    } label: {
                        Image(systemName: "chevron.down")
                    }
                    
                    Spacer()
                    
                    Text("EK Rock")
                        .foregroundStyle(.white)
                    
                    Spacer()

                    Button {
                        print("More")
                    } label: {
                        Image(systemName: "ellipsis")
                    }

                }.padding()
                
                Spacer()
                
                TabView(selection: $selection) {
                    
                    ForEach(songs) { song in
                        Image(song.imageName)
                            .resizable()
                            .frame(maxWidth: 400, maxHeight: 400, alignment: .center)
                            .padding()
                            .tag(song)
                    }
                    
                }.tabViewStyle(.page(indexDisplayMode: .never))
                    
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(selection.title)
                            .font(.title2)
                            .bold()
                            .foregroundStyle(.primary)
                        Text(selection.artist)
                            .foregroundStyle(.secondary)
                    }
                    
                    Spacer()
                    
                    Button {
                        print("More")
                    } label: {
                        Image(systemName: "heart.fill")
                            .font(.title)
                            .foregroundStyle(.green)
                    }
                    
                    
                }.padding()
                
                
                Slider(value: $timing, in: 0...180) {
                    Text("Slider")
                } minimumValueLabel: {
                    Text("0:00")
                } maximumValueLabel: {
                    Text("3:00")
                }.tint(.primary)
                .padding()
                
                
                HStack {
                    Button {
                        print("Shuffle")
                    } label: {
                        Image(systemName: "shuffle")
                            .font(.title)
                    }
                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            let index = self.index < 1 ? 0 : (self.index - 1)
                            selection = Song.all[index]
                        }
                    } label: {
                        Image(systemName: "backward.end.fill")
                            .font(.system(size: 40))
                    }.foregroundStyle(.primary)
                    
                    Spacer()
                    
                    Button {
                        print("More")
                    } label: {
                        Image(systemName: "play.circle.fill")
                            .font(.system(size: 90))
                    }.foregroundStyle(.primary)

                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            let index = self.index > Song.all.count - 1 ? Song.all.count - 1 : self.index + 1
                            
                            selection = Song.all[index]

                        }
                    } label: {
                        Image(systemName: "forward.end.fill")
                            .font(.system(size: 40))
                    }.foregroundStyle(.primary)

                    Spacer()
                    
                    Button {
                        print("More")
                    } label: {
                        Image(systemName: "repeat")
                            .font(.title)

                    }
                }.padding()

                Spacer()
                
            }
        }.ignoresSafeArea()
            .onChange(of: selection) { newValue in
                print(newValue)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
