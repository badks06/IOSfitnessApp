//
//  WorkoutDetailView.swift
//  FitnessApp
//
//  Created by Adk Soft on 08/03/2022.
//

import SwiftUI

struct WorkoutDetailView: View {
    
    var workout: Workout
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(workout.day)
                .padding(.leading, 30)
                .font(.largeTitle)

            Text(workout.bodyPart)
                .padding(.leading, 30)
                .font(.title)
            
            List(workout.routine, id: \.self){ exercise in
                Text(exercise)
            }
        }
    }
}

struct WorkoutDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDetailView(workout: Workout(day: "Monday", bodyPart: "Abs", image: "arms", routine: ["warmups", "planks", "situps"]))
    }
}
