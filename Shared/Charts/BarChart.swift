//
//  BarChart.swift
//  AstroSwiftSampler
//
//  Created by Jeff Hokit on 11/23/22.
//

import SwiftUI
import Charts

struct BarChart: View {
    var body: some View {
        Chart(sampleSeries){ series in
            ForEach(series.items) { item in
                    BarMark(
                        x: .value("Name",item.name),
                        y: .value("Value",item.value)
                    )
                    .foregroundStyle(by: .value("Name",series.name))
            }
        }
        //.chartLegend(position: .trailing)
        .chartYAxis {
            AxisMarks(position: .leading) // move the axis to the left
            AxisMarks(values: .automatic) { _ in
              AxisGridLine()
                    .foregroundStyle(Color.astroUIDarkBlue700)
            }
        }
        .chartXAxis {
            AxisMarks(values: .automatic) { _ in
                AxisGridLine(stroke: StrokeStyle())
                    .foregroundStyle(Color.astroUIDarkBlue700)
                AxisValueLabel()
            }
        }
        .chartForegroundStyleScale([
            "Morning":  Color.astroDataVis1, "Evening": Color.astroDataVis4])
    }
}

struct BarChart_Previews: PreviewProvider {
    static var previews: some View {
        BarChart()
    }
}
