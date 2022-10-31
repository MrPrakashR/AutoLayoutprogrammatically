//
//  ViewController.swift
//  WeatherAppAutoLayout
//
//  Created by Apple on 31/10/22.
//

import UIKit

class WeatherViewController: UIViewController {
    
    let rootStackView = UIStackView()
    let searchStackView = UIStackView()
    let locationButton = UIButton()
    let backgroundView = UIImageView()
    let searchButton = UIButton()
    
    let searchTextField = UITextField()
    
    // weather
    let conditionImageView = UIImageView()
    let temperatureLabel = UILabel()
    let cityLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension WeatherViewController {
    
    func style() {
        rootStackView.translatesAutoresizingMaskIntoConstraints =  false
        rootStackView.axis = .vertical
        rootStackView.alignment = .trailing
        rootStackView.spacing = 10
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.image = UIImage(named: "background")
        backgroundView.contentMode = .scaleToFill
        
        //Search Stack view
        searchStackView.translatesAutoresizingMaskIntoConstraints = false
        searchStackView.spacing = 10
        
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        locationButton.setBackgroundImage(UIImage(systemName: "location.circle.fill"), for: .normal)
        locationButton.tintColor = .label
        
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.setBackgroundImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = .label
        
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.font = UIFont.preferredFont(forTextStyle: .title1)
        searchTextField.placeholder = "Search"
        searchTextField.textAlignment = .left
        searchTextField.borderStyle = .roundedRect
        searchTextField.backgroundColor = .systemFill
        
        searchStackView.translatesAutoresizingMaskIntoConstraints = false
        searchStackView.spacing = 10
        
        // weather
        conditionImageView.translatesAutoresizingMaskIntoConstraints = false
        conditionImageView.image = UIImage(systemName: "sun.max")
        conditionImageView.tintColor = .label
        
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.font = UIFont.systemFont(ofSize: 80)
        temperatureLabel.attributedText = makeTemperatureText(with: "22")
        
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        cityLabel.text = "Cupertino"
        
    }
    
    func layout() {
        view.addSubview(backgroundView)
        view.addSubview(rootStackView)
        
        searchStackView.addArrangedSubview(locationButton)
        searchStackView.addArrangedSubview(searchTextField)
        searchStackView.addArrangedSubview(searchButton)
        
        rootStackView.addArrangedSubview(searchStackView)
        rootStackView.addArrangedSubview(conditionImageView)
        rootStackView.addArrangedSubview(temperatureLabel)
        rootStackView.addArrangedSubview(cityLabel)
        
        //        view.addSubview(locationButton)
        //        view.addSubview(searchButton)
        //        view.addSubview(searchTextField)
        
        //Auto Layout
        NSLayoutConstraint.activate([
            
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            locationButton.widthAnchor.constraint(equalToConstant: 44),
            locationButton.heightAnchor.constraint(equalToConstant: 44),
            
            rootStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            rootStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: rootStackView.trailingAnchor, multiplier: 1),
            
            // Here we need this constraint to pull the searchStackView all the way to the left, and effectively make it the same width as the rootStackView. Without it our searchStackView won’t stretch and will appear thinner that we would like.
            searchStackView.leftAnchor.constraint(equalTo: rootStackView.leftAnchor),
            
            //searchButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            //view.trailingAnchor.constraint(equalToSystemSpacingAfter: searchButton.trailingAnchor, multiplier: 1),
            //searchButton.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -8),
            
            searchButton.heightAnchor.constraint(equalToConstant: 44),
            searchButton.widthAnchor.constraint(equalToConstant: 44),
            
            conditionImageView.heightAnchor.constraint(equalToConstant: 120),
            conditionImageView.widthAnchor.constraint(equalToConstant: 120),
            
            //searchTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            //searchTextField.leftAnchor.constraint(equalTo: locationButton.rightAnchor, constant: 10),
            //searchTextField.rightAnchor.constraint(equalTo: searchButton.leftAnchor, constant: -10)
        ])
        
    }
    
    private func makeTemperatureText(with temperature: String) -> NSAttributedString {
        
        var boldTextAttributes = [NSAttributedString.Key:AnyObject]()
        boldTextAttributes[.foregroundColor] = UIColor.label
        boldTextAttributes[.font] = UIFont.boldSystemFont(ofSize: 100)
        
        var plainTextAttributes = [NSAttributedString.Key: AnyObject]()
        plainTextAttributes[.font] = UIFont.systemFont(ofSize: 80)

        
        let text = NSMutableAttributedString(string: temperature, attributes: boldTextAttributes)
        text.append(NSAttributedString(string: "°C", attributes: plainTextAttributes))

        return text
    }
    
//    func makeAttributed2() -> UILabel {
  //        let dollarSignAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .callout), .baselineOffset: 8]
  //        let priceAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .title1)]
  //        let monthAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .callout)]
  //        let termAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .footnote), .baselineOffset: 8]
  //
  //        let rootString = NSMutableAttributedString(string: "$", attributes: dollarSignAttributes)
  //        let priceString = NSAttributedString(string: "8", attributes: priceAttributes)
  //        let monthString = NSAttributedString(string: "/mo", attributes: monthAttributes)
  //        let termString = NSAttributedString(string: "1", attributes: termAttributes)
  //
  //        rootString.append(priceString)
  //        rootString.append(monthString)
  //        rootString.append(termString)
  //
  //        let label = UILabel()
  //        label.attributedText = rootString
  //
  //        return label
  //    }
    
}

