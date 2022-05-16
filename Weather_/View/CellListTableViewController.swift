//
//  CellListTableViewController.swift
//  Weather_
//
//  Created by Олег Рубан on 11.04.2022.
//

import Foundation
import UIKit

class CellListTableViewController: UITableViewCell {
    
    private lazy var cityNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Название"
        label.font = .systemFont(ofSize: 18.0, weight: .bold)
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Статус"
        label.font = .systemFont(ofSize: 14.0, weight: .regular)
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "99 \(celsius)"
        label.font = .systemFont(ofSize: 18.0, weight: .bold)
        return label
    }()
    
    private lazy var temperatureStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageStatus, statusLabel, temperatureLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 16.0
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private lazy var imageStatus: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    var celsius = "°C"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "cell")
        
        setup()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cityNameLabel.text = nil
        statusLabel.text = nil
        temperatureLabel.text = nil
        imageStatus.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.backgroundColor = .systemBackground
        
        self.addSubview(cityNameLabel)
        self.addSubview(temperatureStackView)

        
        var constraints = [NSLayoutConstraint]()
        
        //cityNameLabel
        constraints.append(cityNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8.0))
        constraints.append(cityNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor))

        
        //temperatureStackView
        constraints.append(temperatureStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8.0))
        constraints.append(temperatureStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor))
        
        //imageStatus
        constraints.append(imageStatus.heightAnchor.constraint(equalToConstant: 30.0))
        constraints.append(imageStatus.widthAnchor.constraint(equalToConstant: 30.0))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func update(weather: Weather) {
        cityNameLabel.text = weather.name
        statusLabel.text = weather.conditionString
        temperatureLabel.text = "\(weather.temperature) \(celsius)"
        
//        let url = URL(string: "https://yastatic.net/weather/i/icons/blueye/color/svg/\(weather.condirionCode).svg")!
//        let weatherImage = UIImageView(SVGURL: url) { (image) in
//        }
//        imageStatus.addSubview(weatherImage)
    }
}
