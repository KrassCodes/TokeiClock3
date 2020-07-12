//  Copyright © 2020 Krassimir Iankov. All rights reserved.

import SwiftUI

public class MarkerNumbersData: ObservableObject  {
    @Published var kanjiNumbers: [String]
    @Published var arabicNumbers: [String]
    
    init() {
        self.kanjiNumbers = ["十二","一","二","三","四","五","六","七","八","九","十","十一"]
        self.arabicNumbers = ["12","1","2","3","4","5","6","7","8","9","10","11"]
    }
}

