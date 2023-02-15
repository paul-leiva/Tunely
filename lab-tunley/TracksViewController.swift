//
//  ViewController.swift
//  lab-tunley
//
//  Created by Charlie Hieger on 12/1/22.
//

import UIKit

class TracksViewController: UIViewController, UITableViewDataSource {

    // TODO: Pt 1 - Add a tracks property
    var tracks: [Track] = []


    // TODO: Pt 1 - Add table view outlet
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // TODO: Pt 1 - Set tracks property with mock tracks array
        tracks = Track.mockTracks
        for track in tracks {
            print(track.trackName)
            print(track.artistName)
            print((track.artworkUrl100.absoluteString) + "\n")
        }
        
        // set self as data source for table view
        tableView.dataSource = self

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Get a cell with idenfitier "TrackCell"
        // the dequeueReusableCell(withIdentifier:) method returns a generic UITableViewCell, so it's necessary to cast it to our specific custom cell.
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrackCell", for: indexPath) as! TrackCell
        
        // Get the track that corresponds to the table view row
        let track = tracks[indexPath.row]
        
        // Configure the cell with its associated track
        cell.configure(with: track)
        
        // return the cell for display in the table view
        return cell
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // TODO: Pt 1 - Pass the selected track to the detail view controller


    }

    // TODO: Pt 1 - Add table view data source methods


}
