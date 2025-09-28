
import SwiftUI

struct DemoView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("SwiftUI Alerts — Demos") {
                    NavigationLink("1) Basic Alert", destination: BasicAlertView())
                    NavigationLink("2) Delete / Cancel (roles)", destination: DeleteAlertView())
                    NavigationLink("3) Confirmation Dialog (compare)", destination: ConfirmationDialogDemo())
                }

                Section("Reusable Patterns") {
                    NavigationLink("Reusable Helper Examples", destination: ReusableHelperExamples())
                }
            }
            .navigationTitle("Alerts Masterclass")
        }
    }
}

#Preview {
    DemoView()
}
