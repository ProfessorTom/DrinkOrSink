protocol ViewModelDelegate: class {
    func didStart(wave: String)
    func didPlay(greeting: String)
    func didFinish()
}

class ViewModel {
    weak var delegate: ViewModelDelegate!
    
    internal var waves: [String] = [
        "One shot of tequilla sunrise!",
        "Two glasses of Gin Tonic!",
        "A pint of Guiness!"
    ]
    internal var round = 1
    
    enum Action {
        case drink
        case sink
    }
    
    func startWave() {
        delegate?.didStart(wave: waves[round - 1])
    }
    
    func play(with action: Action) {
        
        switch action {
        case .drink:
            guard round < waves.count else {
                delegate?.didPlay(greeting: "YOU ARE A WINNER! And a drunk...")
                finish()
                return
            }
            delegate?.didPlay(greeting: "Well Done! Beverages are no secret for you!")
            round += 1
            
        case .sink:
            delegate?.didPlay(greeting: "You sink... You're weak...")
            finish()
            return
        }
    }
    
    private func finish() {
        delegate?.didFinish()
        round = 1
    }
}
