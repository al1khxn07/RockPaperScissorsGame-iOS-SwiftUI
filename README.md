# 🪨 Rock Paper Scissors (SwiftUI)

A simple and fun **Rock Paper Scissors** brain-training game built with **SwiftUI**.  
Each round the app randomly chooses **Rock**, **Paper**, or **Scissors** and tells the player whether they should **win** or **lose**.  
Your goal is to tap the correct move to achieve that outcome.  
You gain a point if you’re right — lose one if you’re wrong.  
After 10 rounds, your total score is displayed.

---

## 📱 Features

- 🎮 Interactive game logic with instant feedback  
- 🔢 Dynamic score tracking  
- 🧠 Randomized “Win / Lose” challenges each round  
- 💾 10-question round limit with restart alert  
- 🎨 Custom capsule-style buttons with gradients, shadows, and press animation  
- 🌈 Beautiful dark gradient background (charcoal → indigo)  
- ✨ Haptic feedback for button taps  

---

## 🧩 What I Learned

Working on this project helped me strengthen several **SwiftUI fundamentals**:

### 🧱 Layout & Alignment
- Using `VStack`, `HStack`, and `Spacer` to control screen structure  
- Applying `.frame(maxWidth: .infinity, maxHeight: .infinity, alignment:)` for flexible layouts  
- Centering specific sections while keeping titles fixed at the top  

### 🎨 Styling & UI Design
- Building reusable **ViewModifiers** for consistent button styling  
- Creating adaptive gradients with `LinearGradient` and `.ignoresSafeArea()`  
- Applying `clipShape(Capsule())`, `shadow`, and `overlay` for modern button design  

### ⚙️ Logic & State Management
- Managing game state with `@State` variables  
- Randomizing choices and toggling logic with arrays  
- Using `alert` to show final score and restart the game  

### 💡 SwiftUI Techniques
- Adding haptic feedback using `UIImpactFeedbackGenerator`  
- Writing clean, reusable modifiers and styles  
- Organizing SwiftUI code for readability and scalability  

---

## 🧰 Technologies

- **Swift**  
- **SwiftUI**  
- **Xcode**  
- **Git + GitHub** for version control  

---

## 🚀 How to Run

1. Clone the repository  
   ```bash
   git clone https://github.com/YOUR_USERNAME/RPSGame.git
