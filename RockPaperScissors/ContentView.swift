//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Kushagra Sinha on 14/11/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State var moves = ["Paper","Rock", "Scissor"].shuffled()
    
    @State var correctAnswer = Int.random(in: 0...2)
    
    @State private var score = 0
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(.white), location: 0.4),
                .init(color: Color(.orange), location: 0.4),
            ],  center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack(spacing:40){
                
                Text("Score: \(score)")
                    .font(.largeTitle.weight(.black))
                
                Image(moves[correctAnswer])
                    .shadow(radius: 5)
                
                Text("How to win this game??")
                    .font(.title.weight(.medium))
                    .font(.system(size: 30))
                
                HStack(spacing:15){
                    ForEach(0..<3){ number in
                        Button {
                            answer(number)
                        } label: {
                            Image(moves[number])
                                .shadow(radius: 5)
                        }
                    }
                }
                
            }
            
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your Score is \(score)")
        }
        
    }
    
    func answer(_ number: Int) {
        if (Image(moves[correctAnswer]) == Image("Rock") && Image(moves[number]) == Image("Paper")) {
            scoreTitle = "Correct"
            score += 1
        }
        else if (Image(moves[correctAnswer]) == Image("Paper") && Image(moves[number]) == Image("Scissor")) {
            scoreTitle = "Correct"
            score += 1
        }
        else if (Image(moves[correctAnswer]) == Image("Scissor") && Image(moves[number]) == Image("Rock")) {
            scoreTitle = "Correct"
            score += 1
        }
        else {
            scoreTitle = "Wrong"
            score -= 1
        }
        
        showingScore = true
        
    }
    
    func askQuestion() {
        moves.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
