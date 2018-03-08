//
//  ViewController.swift
//  DrinkOrSink
//
//  Created by Jean Mainguy on 08.03.18.
//  Copyright © 2018 eGym. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var viewModel: ViewModel!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var drinkButton: UIButton!
    @IBOutlet weak var sinkButton: UIButton!
    @IBOutlet weak var gameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ViewModel()
        viewModel.delegate = self
    }
    
    func toggleButtonsVisibility() {
        playButton.isHidden = !playButton.isHidden
        drinkButton.isHidden = !drinkButton.isHidden
        sinkButton.isHidden = !sinkButton.isHidden
    }
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        playButton.setTitle("CONTINUE", for: .normal)
        viewModel.startWave()
    }
    
    @IBAction func drinkButtonTapped(_ sender: UIButton) {
        viewModel.play(with: .drink)
    }
    
    @IBAction func sinkButtonTapped(_ sender: UIButton) {
        viewModel.play(with: .sink)
    }
}

extension ViewController: ViewModelDelegate {
    func didStart(wave: String) {
        gameLabel.text = wave
        toggleButtonsVisibility()
    }
    
    func didPlay(greeting: String) {
        gameLabel.text = greeting
        toggleButtonsVisibility()
    }
    
    func didFinish() {
        playButton.setTitle("RESTART", for: .normal)
    }
}
