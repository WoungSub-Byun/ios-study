//
//  MovieTableViewCell.swift
//  MovieSearcher
//
//  Created by 변웅섭 on 2021/07/07.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet var movieTitleLabel: UILabel!
    @IBOutlet var movieYearLabel: UILabel!
    @IBOutlet var moviePosterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    static let identifier = "MovieTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName:  "MovieTableViewCell", bundle: nil)
    }
    
    func configure(with model: Movie) {
        self.movieTitleLabel.text = model.Title
        self.movieYearLabel.text = model.Year
        let url = model.Poster
        let data = try! Data(contentsOf: URL(string: url)!)
        
        self.moviePosterImageView.image = UIImage(data: data)
        
    }
}
