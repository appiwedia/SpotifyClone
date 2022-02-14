//
//  SongViewModel.swift
//  SpotifyClone
//
//  Created by Elliot Knight on 14/02/2022.
//

import Foundation
import SwiftUI

class SongViewModel: ObservableObject {
    
    
    var songs = [Song]()
    @Published var selection: Song = Song.all[0]
    @Published var index: Int = 0
    
    
    func nextSong() {
        withAnimation {
            let index = self.index < 1 ? 0 : (self.index - 1)
            selection = Song.all[index]
        }
    }
    
    func pastSong() {
        withAnimation {
            let index = self.index > Song.all.count - 1 ? Song.all.count - 1 : self.index + 1
            selection = Song.all[index]
        }

        
    }
    
    func playSong() { }
    
    func stopSong() { }
    
    func shufflePlaylist() {
        songs.shuffled()
    }
    
    func listenLoopSong() { }
    
}
