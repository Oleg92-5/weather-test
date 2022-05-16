//
//  ListTableViewController.swift
//  Weather_
//
//  Created by Олег Рубан on 11.04.2022.
//

import Foundation
import UIKit

class ListTableViewController: UIViewController, UITableViewDelegate, UINavigationControllerDelegate, UITableViewDataSource {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBackground
        tableView.register(CellListTableViewController.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    private lazy var addButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pressPlusButton(_:)))
        return button
    }()
    
    var nameCitiesArray = ["Москва", "Санкт-Петербург", "Пенза", "Уфа", "Новосибирск", "Челябинск", "Омск", "Екатеринбург", "Томск", "Сочи"]
    //var nameCitiesArray = ["Омск"]
    var citiesArray = [Weather]()
    
    let emptyCity = Weather()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        emptyCityArray()
        setup()
        addCities()
    }

    @objc func pressPlusButton(_ sender: Any) {
        alertPlusCity(name: "Город", placeholder: "Введите название города") { (city) in
            self.nameCitiesArray.append(city)
            self.citiesArray.append(self.emptyCity)
            self.addCities()
        }
    }

    func emptyCityArray() {
        if citiesArray.isEmpty {
            citiesArray = Array(repeating: emptyCity, count: nameCitiesArray.count)
        }
    }
    
    func addCities() {
        getCitiesWeather(citiesArray: self.nameCitiesArray) { (index, weather) in
            self.citiesArray[index] = weather
            self.citiesArray[index].name = self.nameCitiesArray[index]
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellListTableViewController
        
        var weather = Weather()
        
        weather = citiesArray[indexPath.row]
        
        cell.update(weather: weather)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityWeather = citiesArray[indexPath.row]
        
        let navigationVC = DetailTempViewController()
        navigationVC.weatherModel = cityWeather
        self.show(navigationVC, sender: self)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delateAction = UIContextualAction(style: .destructive, title: "Удалить") { (_, _, completionHandler) in
            let editingRow = self.nameCitiesArray[indexPath.row]
            if let index = self.nameCitiesArray.firstIndex(of: editingRow) {
                self.citiesArray.remove(at: index)
                self.nameCitiesArray.remove(at: index)
            }
            tableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [delateAction])
    }
}



private extension ListTableViewController {
    func setup() {
        navigationItem.rightBarButtonItem = addButton
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
