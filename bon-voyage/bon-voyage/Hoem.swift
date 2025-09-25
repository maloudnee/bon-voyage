//
//  Home.swift
//  bon-voyage
//
//  Created by Maloudnee Marcier on 9/24/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Header
                HeaderView()
                
                // Upcoming Trips Carousel
                TripView(title: "Upcoming Trips", trips:[])
                
                // Past Trips Carousel
                TripView(title: "Past Trips", trips;[])
                
                // Push content to top
                Spacer()
                
                // Add Trip Button
                AddTrip()
                
            }
            .padding(.horizontal)
            .navigationBarHidden(true)
        }
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            // App Name
            Text("BON VOYAGE")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            // Airplane Symbol
            Image(systemName: "airplane.path.dotted")
                .resizable()
                .scaledToFit()
                .frame(width: 46, height: 39)
                .foregroundColor(.teal)
                .accentColor(.mint)
            
            // Divider
            Divider()
                .background(Color.teal.opacity(0.5))
                .padding(.vertical, 5)
                
        }
        .padding(.top)
    }
}

struct TripView : View {
    // Getting trip name and destination
    let title: String
    let trips: [String]
    
    var body : some View {
        VStack(alignment: .leading, spacing:10){
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
                
            // Making Carousel Feature
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 15){
                    ForEach(trips, id: \.self){ trip in
                        TripCardView()
                    }
                }
            }
        }
        
        // View all trips
        Button(action: {
            // Page when buttons pressed go here
        }) {
            Text("View All \(title)")
                .font(.footnote)
                .foregroundColor(.teal)
        }
    }
}

struct TripCardView: View {
    // Define variables
    let tripname: String
    let total = 5
    let current: Int
    
    var body: some View {

        ZStack(alignment: .bottom) {
            // Background image of card
            Image("img_name")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width * 0.9, height:200)
                .clipped()
                .cornerRadius(17)
                .shadow(radius: 5)
            
            // Text overlay
            VStack {
                // Push text to bottom
                Spacer()
                Text(tripname)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                // Give some space in the bottom
                Spacer().frame(height:20)
            }
            
            // Carousel Status
            HStack {
                ForEach(0...total, id: \.self){ i in
                    Circle()
                        .fill(Color.white)
                        .frame(width: 8, height: 8)
                        .opacity(i == current ? 1.0 : 0.3)
                }
            }
            .padding(.bottom, 8)
        }
    }
}
