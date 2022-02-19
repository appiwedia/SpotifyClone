//
//  ContentView.swift
//  SpotifyClone
//
//  Created by Mickael Mas on 14/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var timing: Double = 23.0
    
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
                Spacer()
                Spacer()
                
                HStack {
                    TopButtonView(actionPrint: "Action", image: "chevron.down")
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text("EK Rock")
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    TopButtonView(actionPrint: "More", image: "ellipsis")
                        .foregroundColor(.white)
                    
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
                            .font(.title.bold())
                            .foregroundStyle(.white)
                        Text(selection.artist)
                            .foregroundStyle(.regularMaterial)
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
                }.tint(.white)
                    .foregroundColor(.white)
                    .padding()
                
                HStack {
                    Button {
                        print("Shuffle")
                    } label: {
                        Image(systemName: "shuffle")
                            .font(.title)
                    }
                    .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            let index = self.index < 1 ? 0 : (self.index - 1)

                            selection = Song.all[index]
                        }
                    } label: {
                        Image(systemName: "backward.end.fill")
                            .font(.system(size: 40))
                    }
                    .foregroundStyle(.white)

                    
                    Spacer()
                    
                    Button {
                        print("More")
                    } label: {
                        Image(systemName: "play.circle.fill")
                            .font(.system(size: 90))
                    }
                    .foregroundStyle(.white)

                    
                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            let index = self.index > Song.all.count - 1 ? Song.all.count - 1 : self.index + 1
                            selection = Song.all[index]
                        }
                    } label: {
                        Image(systemName: "forward.end.fill")
                            .font(.system(size: 40))
                    }
                    .foregroundStyle(.white)

                    
                    Spacer()
                    
                    Button {
                        print("More")
                    } label: {
                        Image(systemName: "repeat")
                            .font(.title)
                    }
                    .foregroundStyle(.white)

                }
                .padding(.bottom, 50)
                .padding(.horizontal)
                
                Spacer()
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


struct TopButtonView: View {
    var actionPrint: String
    var image: String
    
    var body: some View {
        Button {
            print(actionPrint)
        } label: {
            Image(systemName: image)
        }
    }
}


// song view communique avec songVM

// Song vm Selection morceau courrant, playlist, func pause play stop, shuffle, repeat

// ask to VM songviewmodel @State sur songVM et SongVm il donnera les infos à la vue
