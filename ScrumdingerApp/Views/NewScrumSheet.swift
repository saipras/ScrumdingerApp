//
//  NewScrumSheet.swift
//  ScrumdingerApp
//
//  Created by Sai Prasad Rekha on 04/12/23.
//

import SwiftUI

struct NewScrumSheet: View {
    @State private var newScrum = DailyScrum.emptyScrum
       @Binding var scrums: [DailyScrum]
       @Binding var isPresentingNewScrumView: Bool


       var body: some View {
           NavigationStack {
               DetailEditView(scrum: $newScrum)
                   .toolbar {
                       ToolbarItem(placement: .cancellationAction) {
                           Button("Dismiss") {
                               isPresentingNewScrumView = false
                           }
                       }
                       ToolbarItem(placement: .confirmationAction) {
                           Button("Add") {
                               scrums.append(newScrum)
                               isPresentingNewScrumView = false
                           }
                       }
                   }
           }
       }
}

struct NewScrumSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewScrumSheet(scrums: .constant(DailyScrum.sampleData),
                             isPresentingNewScrumView: .constant(true))
    }
}