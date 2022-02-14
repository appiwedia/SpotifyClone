//
//  Song.swift
//  SpotifyClone
//
//  Created by Mickael Mas on 14/02/2022.
//

import Foundation
import SwiftUI

struct Song: Identifiable, Hashable {
    var id = UUID()
    let imageName: String
    let title: String
    let artist: String
    let time: Int
    
}

extension Song {
    static var all: [Song] {
        return [
            Song(imageName: "theDoors", title: "Takes It As It Comes", artist: "The Doors", time: 3 * 60),
            Song(imageName: "willieNelson", title: "On The Road Again", artist: "Willie Nelson", time: 3 * 60),
            Song(imageName: "theRazorEdge", title: "Thunderstruck", artist: "ACDC", time: 3 * 60)
        ]
    }
    
    static var sample: Song {
        Song(imageName: "theDoors", title: "Takes It As It Comes", artist: "The Doors", time: 3 * 60)
    }
}
