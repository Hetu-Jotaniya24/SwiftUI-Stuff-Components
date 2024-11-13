//
//  PickerSegmented.swift
//  AnimalBook
//
//  Created by Hiral Jotaniya on 13/11/24.
//


struct PickerSegmented<P>: View  where P: CustomStringConvertible & CaseIterable & Hashable{
        //tag and selection must match types exactly
    typealias TagType = P
        //Generic type
    @Binding var selection: TagType
    var body: some View {
        Picker("", selection: $selection) {
                //Use custom Case Iterable and Hashable
            ForEach(Array(P.allCases), id: \.description) { option in
                    //Use Custom String Convertible
                Text(option.description)
                    //tag and selection must match types exactly
                    .tag(option as TagType)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

enum SegmentOption: String, CaseIterable, CustomStringConvertible, Hashable {
    case first = "First"
    case second = "Second"
    case third = "Third"
    case fourth = "Fourth"
    case fifth = "Fifth"
    
        // Conforming to CustomStringConvertible
    var description: String {
        return self.rawValue
    }
}


//MARK: How to use
struct GenericPickerComponent: View {
    @State var selectedSegment: SegmentOption = .first
    
    var body: some View {
        
        VStack {
            PickerSegmented(selection: $selectedSegment)
            Text("Selected segment: \(selectedSegment.description)")
        }
    }
}
