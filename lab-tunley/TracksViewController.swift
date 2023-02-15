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
        
        // Get the cell that triggered the segue
        if let cell = sender as? UITableViewCell,
           // Get the index path of the cell from the table view
           let indexPath = tableView.indexPath(for: cell),
           // Get the detail view controller
           let detailViewController = segue.destination as? DetailViewController {

            // Use the index path to get the associated track
            let track = tracks[indexPath.row]

            // Set the track on the detail view controller
            detailViewController.track = track
        }

    }

    // TODO: Pt 1 - Add table view data source methods
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Get the index path ofr the current selected table view row (if it exists)
        if let indexPath = tableView.indexPathForSelectedRow {
            
            // Deselect the row at the corresponding index path
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

}
