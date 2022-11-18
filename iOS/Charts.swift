//
//  Charts.swift
//  AstroSwiftSampler macOS
//
//  Created by Jeff Hokit on 11/14/22.
//

import SwiftUI
import Charts

struct Charts: View {
    var body: some View {
        NavigationView{
            
            ScrollView{
                VStack{
                    Text("Series Chart")
                    SeriesChart()
                }
                .padding()
                .background(Color.astroUISecondaryGroupedBackground)
                .cornerRadius(Sizes.cornerRadius)

                VStack{
                    Text("Fill Gauge")
                    FillGauge()
                }
                .padding()
                .background(Color.astroUISecondaryGroupedBackground)
                .cornerRadius(Sizes.cornerRadius)
            }
            .padding()
            .background(Color.astroUIGroupedBackground)
            .navigationTitle("Charts")
        }.tabItem {
            Image(systemName: "chart.pie")
            Text("Charts")
        }
    }
}

struct DataVis_Previews: PreviewProvider {
    static var previews: some View {
        Charts()
    }
}