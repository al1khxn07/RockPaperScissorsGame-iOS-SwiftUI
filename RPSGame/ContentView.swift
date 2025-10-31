//
//  ContentView.swift
//  RPSGame
//
//  Created by Alikhan Zhanibek on 2025-10-30.
//

import SwiftUI

struct CapsuleButton: ViewModifier {
    var start: Color = Color(red: 0.25, green: 0.55, blue: 0.80)
    var end:   Color = Color(red: 0.15, green: 0.30, blue: 0.60)
    var minHeight: CGFloat = 56
    var horizontalPadding: CGFloat = 24
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, minHeight: minHeight)
            .padding(.horizontal, horizontalPadding)
            .background(
                LinearGradient(colors: [start, end],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
            )
            .foregroundColor(.white)
            .clipShape(Capsule())
            .overlay(
                Capsule().stroke(Color.white.opacity(0.18), lineWidth: 1)
            )
            .shadow(color: .black.opacity(0.35), radius: 10, x: 0, y: 6)
            .contentShape(Capsule())
    }
}


extension View {
    func capsuleButton(
        start: Color = Color(red: 0.25, green: 0.55, blue: 0.80),
        end: Color   = Color(red: 0.15, green: 0.30, blue: 0.60),
        minHeight: CGFloat = 56,
        horizontalPadding: CGFloat = 24
    ) -> some View {
        self.modifier(
            CapsuleButton(start: start, end: end,
                          minHeight: minHeight,
                          horizontalPadding: horizontalPadding)
        )
    }
}

struct PressFeedbackStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .animation(.spring(response: 0.25, dampingFraction: 0.8),
                       value: configuration.isPressed)
    }
}

struct ContentView: View {
    
    @State private var appsRPS = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var playerScore = 0
    let rpsArray = ["🪨Rock", "📄Paper", "✂️Scissors"]
    let winIndex = [1, 2, 0]
    let loseIndex = [0, 2, 1]
    @State private var questionsAsked = 0
    @State private var showFinal = false
    
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(red: 0.05, green: 0.05, blue: 0.10),
                    Color(red: 0.25, green: 0.25, blue: 0.45)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack  {
                
                Text("Rock, paper, and scissors game")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                    .padding(.top, 20)
                
                Spacer()
                
                VStack (spacing: 20) {
                    VStack (spacing: 5){
                        Text("Your goal is")
                        Text(shouldWin ? "Win" : "Lose")
                            .foregroundStyle(shouldWin ? .green : .red)
                    }
                    
                    VStack (spacing: 5){
                        Text("Apps' current choice")
                        Text(rpsArray[appsRPS])
                    }
                    
                    VStack (spacing: 5){
                        Text("Player's current score")
                        Text(playerScore, format: .number)
                    }
                }
                .font(.title3)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 250)
                .background(.ultraThinMaterial)
                
                Spacer()
                
                VStack (spacing: 15) {
                    VStack {
                        Button ("Rock") {
                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                            play(0)
                        }
                    }
                    .capsuleButton()                    // default colors
                    .buttonStyle(PressFeedbackStyle())
                    
                    VStack {
                        Button ("Paper") {
                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                            play(1)
                        }
                    }
                    .capsuleButton(
                        start: Color(red: 0.20, green: 0.50, blue: 0.70),
                        end:   Color(red: 0.12, green: 0.32, blue: 0.55)
                    )
                    .buttonStyle(PressFeedbackStyle())
                    
                    VStack {
                        Button ("Scissors") {
                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                            play(2)
                        }
                    }
                    .capsuleButton(
                        start: Color(red: 0.30, green: 0.55, blue: 0.75),
                        end:   Color(red: 0.18, green: 0.38, blue: 0.60)
                    )
                    .buttonStyle(PressFeedbackStyle())
                    
                }
                .padding(.bottom, 24)
                
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .onAppear { nextRound() }
        
        .alert("Game Over", isPresented: $showFinal) {
            Button("Play Again") {
                questionsAsked = 0
                playerScore = 0
                showFinal = false
                nextRound()
            }
        } message: {
            Text("Your score: \(playerScore)")
        }
        
    }
    
    
    
    
    func nextRound() {
        if questionsAsked == 10 {
            showFinal = true
            return
        }
        appsRPS = Int.random(in: 0...2)
        shouldWin.toggle()
    }
    
    
    func play(_ playerChoice: Int) {
        let needed = shouldWin ? winIndex[appsRPS] : loseIndex[appsRPS]
        let correct = (playerChoice == needed)
        playerScore += correct ? 1 : -1
        questionsAsked += 1
        nextRound()
    }
    
}

#Preview {
    ContentView()
}
