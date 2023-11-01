//
//  MovieDetailsViewController.swift
//  Cinetopia
//
//  Created by Giovanna Moeller on 31/10/23.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    private var movie: Movie
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = movie.title
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 28.0, weight: .bold)
        return label
    }()
    
    private lazy var posterImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.layer.cornerRadius = 32.0
        imgView.layer.masksToBounds = true
        let url = URL(string: movie.image)
        imgView.kf.setImage(with: url)
        return imgView
    }()
    
    private lazy var userRatingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Classificação dos usuários: \(movie.rate)"
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 16.0, weight: .bold)
        return label
    }()
    
    private lazy var synopsisLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white.withAlphaComponent(0.75)
        label.text = movie.synopsis
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        addSubviews()
        setupConstraints()
        // Do any additional setup after loading the view.
    }
    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(posterImageView)
        view.addSubview(userRatingLabel)
        view.addSubview(synopsisLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            
            userRatingLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 32.0),
            userRatingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            posterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            posterImageView.widthAnchor.constraint(equalToConstant: 192.0),
            posterImageView.heightAnchor.constraint(equalToConstant: 264.0),
            posterImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32.0),
            
            synopsisLabel.topAnchor.constraint(equalTo: userRatingLabel.bottomAnchor, constant: 32.0),
            synopsisLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            synopsisLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
        ])
    }
    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
