//
//  CurrencyTests.swift
//  CurrencyTests
//
//  Created by Enkhjargal Gansukh on 2019/11/01.
//  Copyright © 2019 Enkhjargal Gansukh. All rights reserved.
//

import XCTest
@testable import Currency

class CurrencyTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

     let sampleCurrencies = [Currency(name: "USDUSD", value: 1.0, description: "US Dollar"), Currency(name: "USDKRW", value: 1200.0, description: "South Korean Won")]
    let sampleJSON = """
        {
          "success":true,
          "terms":"https:currencylayer.com/terms",
          "privacy":"https:currencylayer.com/privacy",
          "timestamp":1572970146,
          "source":"USD",
          "quotes":{
            "USDAED":3.672904,
            "USDAFN":78.249716,
            "USDALL":110.80524,
            "USDAMD":476.570055,
            "USDANG":1.735188,
            "USDAOA":486.032497,
            "USDARS":59.652838,
            "USDAUD":1.451168,
            "USDAWG":1.8,
            "USDAZN":1.692304,
            "USDBAM":1.759489,
            "USDBBD":2.019224,
            "USDBDT":84.752596,
            "USDBGN":1.765872,
            "USDBHD":0.376999,
            "USDBIF":1871,
            "USDBMD":1,
            "USDBND":1.356687,
            "USDBOB":6.915652,
            "USDBRL":3.998967,
            "USDBSD":1.000076,
            "USDBTC":0.000107,
            "USDBTN":70.69037,
            "USDBWP":10.847075,
            "USDBYN":2.0414,
            "USDBYR":19600,
            "USDBZD":2.015851,
            "USDCAD":1.316805,
            "USDCDF":1665.000206,
            "USDCHF":0.992825,
            "USDCLF":0.027148,
            "USDCLP":749.10087,
            "USDCNY":7.009702,
            "USDCOP":3316.5,
            "USDCRC":585.17979,
            "USDCUC":1,
            "USDCUP":26.5,
            "USDCVE":99.74943,
            "USDCZK":23.058101,
            "USDDJF":177.720252,
            "USDDKK":6.7518,
            "USDDOP":52.805016,
            "USDDZD":119.884015,
            "USDEGP":16.131204,
            "USDERN":14.999684,
            "USDETB":29.602011,
            "USDEUR":0.903465,
            "USDFJD":2.1811,
            "USDFKP":0.81288,
            "USDGBP":0.77728,
            "USDGEL":2.965012,
            "USDGGP":0.777302,
            "USDGHS":5.51499,
            "USDGIP":0.81288,
            "USDGMD":51.220245,
            "USDGNF":9239.999907,
            "USDGTQ":7.705698,
            "USDGYD":209.233705,
            "USDHKD":7.83285,
            "USDHNL":24.617211,
            "USDHRK":6.7229,
            "USDHTG":97.51795,
            "USDHUF":299.317007,
            "USDIDR":14007.5,
            "USDILS":3.49478,
            "USDIMP":0.777302,
            "USDINR":70.852502,
            "USDIQD":1162.5,
            "USDIRR":42105.000241,
            "USDISK":124.430131,
            "USDJEP":0.777302,
            "USDJMD":139.44295,
            "USDJOD":0.709021,
            "USDJPY":109.180973,
            "USDKES":103.209861,
            "USDKGS":69.822496,
            "USDKHR":4054.999817,
            "USDKMF":442.301867,
            "USDKPW":900.046589,
            "USDKRW":1157.330035,
            "USDKWD":0.30355,
            "USDKYD":0.833408,
            "USDKZT":388.56053,
            "USDLAK":8849.999732,
            "USDLBP":1512.000343,
            "USDLKR":180.31622,
            "USDLRD":211.596828,
            "USDLSL":14.769699,
            "USDLTL":2.95274,
            "USDLVL":0.60489,
            "USDLYD":1.404982,
            "USDMAD":9.626004,
            "USDMDL":17.386446,
            "USDMGA":3732.806097,
            "USDMKD":55.569103,
            "USDMMK":1511.602098,
            "USDMNT":2707.480144,
            "USDMOP":8.070369,
            "USDMRO":357.000346,
            "USDMUR":36.327352,
            "USDMVR":15.460343,
            "USDMWK":730.00007,
            "USDMXN":19.199697,
            "USDMYR":4.130602,
            "USDMZN":62.934989,
            "USDNAD":14.769711,
            "USDNGN":361.999986,
            "USDNIO":33.727363,
            "USDNOK":9.191325,
            "USDNPR":113.10223,
            "USDNZD":1.56818,
            "USDOMR":0.384986,
            "USDPAB":1.000077,
            "USDPEN":3.33401,
            "USDPGK":3.404585,
            "USDPHP":50.496986,
            "USDPKR":155.699865,
            "USDPLN":3.85352,
            "USDPYG":6429.136902,
            "USDQAR":3.641006,
            "USDRON":4.296504,
            "USDRSD":106.134988,
            "USDRUB":63.557197,
            "USDRWF":915,
            "USDSAR":3.750124,
            "USDSBD":8.254337,
            "USDSCR":13.67994,
            "USDSDG":45.116185,
            "USDSEK":9.66178,
            "USDSGD":1.3592,
            "USDSHP":1.3209,
            "USDSLL":9574.999801,
            "USDSOS":580.502791,
            "USDSRD":7.457973,
            "USDSTD":21560.79,
            "USDSVC":8.750528,
            "USDSYP":514.99995,
            "USDSZL":14.769826,
            "USDTHB":30.260162,
            "USDTJS":9.690803,
            "USDTMT":3.51,
            "USDTND":2.832955,
            "USDTOP":2.31325,
            "USDTRY":5.75709,
            "USDTTD":6.783137,
            "USDTWD":30.412023,
            "USDTZS":2305.098337,
            "USDUAH":24.742036,
            "USDUGX":3701.274701,
            "USDUSD":1,
            "USDUYU":37.418809,
            "USDUZS":9470.767004,
            "USDVEF":9.987502,
            "USDVND":23208.5,
            "USDVUV":116.488227,
            "USDWST":2.658774,
            "USDXAF":590.10962,
            "USDXAG":0.056799,
            "USDXAU":0.000674,
            "USDXCD":2.70255,
            "USDXDR":0.726771,
            "USDXOF":590.10696,
            "USDXPF":107.597537,
            "USDYER":250.250132,
            "USDZAR":14.784305,
            "USDZMK":9001.196617,
            "USDZMW":13.446054,
            "USDZWL":322.000001
          }
        }
    """
    func testCalculation(){
        let usd = sampleCurrencies[0]
        let krw = sampleCurrencies[1]
        let answer1 = krw.calculatedValue(insertedValue: "10", selectedCurrencyValue: usd.value)
        let answer2 = usd.calculatedValue(insertedValue: "10", selectedCurrencyValue: krw.value)
        XCTAssertTrue(answer1 == 12000)
        XCTAssertTrue(String(format: "%.4f", answer2) == "0.0083")
    }
    func testParsing(){
        print("testParsing")
        guard let data = sampleJSON.data(using: .utf8) else { fatalError() }
        let viewModel = ContentViewModel()
        let currencies = viewModel.parseData(data: data)
        XCTAssertTrue(currencies.count == 168)
        let names = currencies.filter { $0.name == "USD" }
        print(names)
        XCTAssertTrue(names.count == 1)
    }

}
