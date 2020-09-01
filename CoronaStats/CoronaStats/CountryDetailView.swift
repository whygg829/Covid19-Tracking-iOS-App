//
//  CountryDetailView.swift
//  CoronaStats
//
//  Created by 小肥圓 on 7/17/20.
//  Copyright © 2020 Hsiao Yuan Wang. All rights reserved.
//

import SwiftUI

struct CountryDetailView: View {
    
    @ObservedObject var countryStatisticsRequest = CountryStatisticsFetchRequest()
    var countryName: String
    
    var body: some View {
        
        VStack {
            VStack {
                
                CountryDetailRow(number: countryStatisticsRequest.detailedCountryData?.confirmedCases.formatNumber() ?? "Err", name: "Confirmed Cases")
                    .padding(.top)
                
                CountryDetailRow(number: countryStatisticsRequest.detailedCountryData?.activeCases.formatNumber() ?? "Err", name: "Active Cases")
                
                CountryDetailRow(number: "+" + (countryStatisticsRequest.detailedCountryData?.newCases.formatNumber() ?? "Err"), name: "New Cases")
                
                CountryDetailRow(number: countryStatisticsRequest.detailedCountryData?.recoveredCases.formatNumber() ?? "Err", name: "Recovered Cases")
                
                CountryDetailRow(number: countryStatisticsRequest.detailedCountryData?.criticalCases.formatNumber() ?? "Err", name: "Critical Cases", color: .yellow)
                
                CountryDetailRow(number: countryStatisticsRequest.detailedCountryData?.deaths.formatNumber() ?? "Err", name: "Deaths", color: .red)
                
                CountryDetailRow(number: "+" + (countryStatisticsRequest.detailedCountryData?.newDeaths.formatNumber() ?? "Err"), name: "New Deaths", color: .red)
                
                CountryDetailRow(number: "+" + (countryStatisticsRequest.detailedCountryData?.testsDone.formatNumber() ?? "Err"), name: "Tests Done", color: .yellow)
                
                CountryDetailRow(number: String(format: "%.2f", countryStatisticsRequest.detailedCountryData?.fatalityRate ?? 0.0) + "%", name: "Fatality Rate", color: .red)
                
                CountryDetailRow(number: String(format: "%.2f", countryStatisticsRequest.detailedCountryData?.recoveredRate ?? 0.0) + "%", name: "Recovery Rate", color: .green)
                
            }
            .background(Color("cardBackgroundGray"))
            .cornerRadius(8)
            .padding()
            
            Spacer()
        }
        .padding(.top, 25)
        .navigationBarTitle(countryName)
        .onAppear() {
            self.getStatistics()
        }
    }
    
    // country name in different API has different format
    // so we need to convert them to correct format
    private func getStatistics(){
        countryStatisticsRequest.getStatsFor(country: self.countryName.replacingOccurrences(of: " ", with: "-"))
        print("hi")
    }
}
