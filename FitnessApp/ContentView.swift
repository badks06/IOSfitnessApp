//
//  ContentView.swift
//  FitnessApp
//
//  Created by Adk Soft on 07/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    let workouts = workoutsData
    
    var body: some View {
        NavigationView {
            
            VStack(
                //alignment: .leading
            ) {
                
                // Main Card View
                ZStack {
                    Image("fitness-workout")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 300)
                    
                    // Vertical stack - where objects are stacked vertically
                    VStack {
                        
                        Spacer()
                        
                        Text("Full Body Workout")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        Text("For Beginners")
                            .fontWeight(.regular)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .frame(width: 380)
                    .background(.black)
                    .opacity(0.5)
                }
                .frame(width: 300, height: 300)
                .cornerRadius(20)
                .clipped()
                .shadow(radius: 8)
//                .padding(.top, 20)
                .padding()
                
                Text("Weekly Plan")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding()
                
                
                // Stack where the inner elements are arranged / stacked horizontally
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 30) {
                        ForEach(workouts) {  workout in
                            
                            // Day card
                            NavigationLink(destination: WorkoutDetailView(workout: workout)) {
                                ZStack {
                                    Image(workout.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                    .frame(height: 220)
                                    
                                    // Vertical stack - where objects are stacked vertically
                                    VStack {
                                        
                                        Spacer()
                                        
                                        Text(workout.day)
                                            .font(.title)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.white)
                                        Text(workout.bodyPart)
                                            .fontWeight(.regular)
                                            .foregroundColor(.white)
                                    }
                                    .padding()
                                    .frame(width: 150)
                                    .background(.black)
                                    .opacity(0.5)
                                }
                                .frame(width: 150, height: 220)
                                .clipped()
                                .cornerRadius(20)
                            .shadow(radius: 8)
                            }
                        }
                    }
                    .padding()
                }
                .offset(x: 0, y: -40)
                
                Spacer()
            }.navigationBarTitle("Home Workouts")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Workout: Identifiable {
    // variable ID is being set to the returned unique identifier generated from the metho UUID()
    var id = UUID()
    
    // variable name with their respective types
    var day: String
    var bodyPart: String
    var image: String
    var routine: [String]
}

let workoutsData = [
Workout(day: "Monday", bodyPart: "Chest", image: "push-ups",
        routine: ["Warmup", "Pushups", "Cool Down"]),
Workout(day: "Tuesday", bodyPart: "Back", image: "fitness-workout", routine: ["Warmup", "Pullups", "Cool Down"]),
Workout(day: "Wednesday", bodyPart: "Arms", image: "arms", routine: ["Warmup", "Curls", "Cool Down"])
]
