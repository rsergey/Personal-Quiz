//
//  ResultsViewController.swift
//  Personal Quiz
//
//  Created by brubru on 19.07.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultTextLabel: UILabel!
    
    // MARK: - Public Properties
    var answersChooser: [Answer] = []
    
    // MARK: - Private Properties
    var answerAnimalType: AnimalType {
        getPopularAnimal()
    }
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        resultLabel.text = "Вы - \(answerAnimalType.rawValue)!"
        resultTextLabel.text = answerAnimalType.definition
    }
    
    // MARK: - Private Methods
    private func getPopularAnimal() -> AnimalType {
        var uniqueAnimals: [AnimalType: Int] = [:]
        for animal in answersChooser {
            if let _ = uniqueAnimals[animal.type] {
                uniqueAnimals[animal.type]! += 1
            } else {
                uniqueAnimals[animal.type] = 1
            }
        }
        if let result = uniqueAnimals.max(by: { (a, b) -> Bool in
            a.value < b.value
        })?.key {
            return result
        } else {
            return .cat
        }
    }
}

// 1. Передать сюда массив с ответами
// 2. Определить наиболее часто встерчающийся тип живтоного
// 3. Отобразить результат в соответсвии с этим животным
// 4. Избавиться от кнопки возврата назад на экране результатов
