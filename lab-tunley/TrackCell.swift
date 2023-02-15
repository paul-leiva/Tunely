//
//  TrackCell.swift
//  lab-tunley
//
//  Created by Paul Leiva on 2/15/23.
//

import UIKit
import Nuke // loads artwork image from the remote URL

class TrackCell: UITableViewCell {

    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // Configures the cell's UI for the given track
    func configure(with track: Track) {
        trackNameLabel.text = track.trackName
        artistNameLabel.text = track.artistName
        
        // Load image async via Nuke Library image loading helper method
        Nuke.loadImage(with: track.artworkUrl100, into: trackImageView)
    }

}
