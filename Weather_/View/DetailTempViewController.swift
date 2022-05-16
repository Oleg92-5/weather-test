//
//  DetailTempViewController.swift
//  Weather_
//
//  Created by Олег Рубан on 11.04.2022.
//

import UIKit
import SwiftSVG

class DetailTempViewController: UIViewController {
    private lazy var cityNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Название"
        label.font = .systemFont(ofSize: 28.0, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Статус"
        label.font = .systemFont(ofSize: 22.0, weight: .regular)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "99 \(celsius)"
        label.font = .systemFont(ofSize: 22.0, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var imageStatus: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
//        image.contentMode = .center
//        image.clipsToBounds = true
//        image.center = CGPoint(x: -200, y: 0)
        return image
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [cityNameLabel, imageStatus, statusLabel, temperatureLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20.0
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private lazy var pressureInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Давление:"
        label.font = .systemFont(ofSize: 18.0, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var speedInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Скорость ветра:"
        label.font = .systemFont(ofSize: 18.0, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var minTemperatureInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Min температура днем:"
        label.font = .systemFont(ofSize: 18.0, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var maxTemperatureInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Max температура днем:"
        label.font = .systemFont(ofSize: 18.0, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var humidityInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Влажность воздуха:"
        label.font = .systemFont(ofSize: 18.0, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    
    private lazy var precTypeInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Тип осадков:"
        label.font = .systemFont(ofSize: 18.0, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var infoStackView2: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [pressureInfoLabel, speedInfoLabel, minTemperatureInfoLabel, maxTemperatureInfoLabel, humidityInfoLabel, precTypeInfoLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10.0
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private lazy var pressureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "766 \(pressure)"
        label.font = .systemFont(ofSize: 18.0, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var speedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "99 \(speed)"
        label.font = .systemFont(ofSize: 18.0, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var minTemperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "99 \(celsius)"
        label.font = .systemFont(ofSize: 18.0, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var maxTemperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "99 \(celsius)"
        label.font = .systemFont(ofSize: 18.0, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var humidityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0 \(percent)"
        label.font = .systemFont(ofSize: 18.0, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var precTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = .systemFont(ofSize: 18.0, weight: .regular)
        label.textAlignment = .left
        return label
    }()

    private lazy var infoStackView3: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [pressureLabel, speedLabel, minTemperatureLabel, maxTemperatureLabel, humidityLabel, precTypeLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10.0
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private lazy var allStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [infoStackView2, infoStackView3])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 40.0
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    var celsius = "°C"
    var speed = "м/с"
    var pressure = "мм.рт.ст"
    var percent = "%"
    
    var weatherModel: Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        update()
    }
}

private extension DetailTempViewController {
    func setup() {
        view.backgroundColor = .systemBackground
        view.addSubview(infoStackView)
        view.addSubview(allStackView)
        
        var constraints = [NSLayoutConstraint]()
        
        //infoStackView
        constraints.append(infoStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24.0))
        constraints.append(infoStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        
        //statusLabel
        constraints.append(statusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(statusLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        
        //cityNameLabel
        constraints.append(cityNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(cityNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        
        //temperatureLabel
        constraints.append(temperatureLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(temperatureLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor))

        //imageStatus
        constraints.append(imageStatus.heightAnchor.constraint(equalToConstant: 140.0))
//        constraints.append(imageStatus.widthAnchor.constraint(equalToConstant: 180.0))
        constraints.append(imageStatus.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(imageStatus.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 140.0))
        
        //allStackView
        constraints.append(allStackView.topAnchor.constraint(equalTo: infoStackView.bottomAnchor, constant: 24.0))
        constraints.append(allStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func update() {
        cityNameLabel.text = "\(weatherModel!.name)"
        
        let url = URL(string: "https://yastatic.net/weather/i/icons/blueye/color/svg/\(weatherModel!.condirionCode).svg")

        let weatherImage = UIImageView(SVGURL: url!) { (image) in
            image.resizeToFit(.init(x: 0, y: 0, width: 120, height: 120))
        }
        imageStatus.addSubview(weatherImage)
        
        statusLabel.text = "\((weatherModel?.conditionString)!)"
        temperatureLabel.text = "\((weatherModel?.temperature)!) \(celsius)"
        
        pressureLabel.text = "\((weatherModel?.presureMm)!) \(pressure)"
        speedLabel.text = "\((weatherModel?.windSpeed)!) \(speed)"
        minTemperatureLabel.text = "\((weatherModel?.tempMin)!) \(celsius)"
        maxTemperatureLabel.text = "\((weatherModel?.tempMax)!) \(celsius)"
        humidityLabel.text = "\((weatherModel?.humidity)!) \(percent)"
        precTypeLabel.text = "\((weatherModel?.precTypeString)!)"
    }
}
