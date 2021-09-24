# Pelpay iOS SDK
Welcome to Pelpay's iOS SDK. This library will help you accept card and alternative payments in your Android app.
**The Pelpay Android SDK permits a deployment target of iOS version 9.0 or higher**.
## Supported Payment Methods
- Credit Card
- Bank Payment
- Bank Transfer
## Installation
- Cocopods
- Swift Package Manager
### Install and Configure the SDK
1. Add the dependency (Cocopods)
```
target 'MyApp' do
  pod 'Pelpay'
end

```
1. Add dependency (Swift Package Manager)

Select **File** → **Swift Packages** → **Add Package Dependency**…. Paste the Git Repository URL: **https://github.com/Chams-Switch/pelpay-ios.git**. The click **Next**.

Depending on your GitHub settings, you may need to authenticate your SSH key here. Then, under Rules, make sure Up to Next Major is selected for the version 1.0.1. Click Next.

If you want to learn more about major and minor versioning check out semver.org. After Xcode fetches the package, ensure the Pelpay product is selected and added to the project target target. Then select Finish.

### Configure your Pelpay integration
**Step 1**: Configure Client ID, Client Secret & Integration Key
After installation of the Pelpay SDK, configure it with your Client ID, Client Secret & Integration Key gotten from your merchant dashboard, for both test and production

#### Sample Integration (Swift)
```swift
import UIKit
import Pelpay

class ViewController: UIViewController, PelpaySdkCallback {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTapTest(_ sender: Any) {
        
        PelpaySdk.shared.initialise(
            withEnvironment: Environment.Staging,
            withClientId: "CLIENT_ID_FROM_MERCHANT_DASHBOARD",
            withClientSecret: "CLIENT_SECRET_FROM_MERCHANT_DASHBOARD",
            withIntegrationKey: "INTEGRATION_KEY_FROM_MERCHANT_DASHBOARD",
            withController: self,
            withTransaction:
                Transaction(amount: 50,
                            currency: "NGN",
                            merchantRef: "UNIQUE_GENERATED_VALUE",
                            narration: "Narration",
                            callBackURL: "http://localhost.com",
                            productCode: "SSD",
                            splitCode: "",
                            shouldTokenize: false,
                            customer:
                                Transaction.Customer(
                                    customerID: "xxx",
                                    customerLastName: "olajuwon",
                                    customerFirstName: "adeoye",
                                    customerEmail: "olajuwon@yopmail.com",
                                    customerPhoneNumber: "07039544295",
                                    customerAddress: "16 Egbeda Road",
                                    customerCity: "Lagos",
                                    customerStateCode: "LA",
                                    customerPostalCode: "12345",
                                    customerCountryCode: "NG"),
                            integrationKey: "a6ccab0e-157d-4fb7-b15d-ddb7cd149153")).setBrandPrimaryColor(color: UIColor.darkGray).setHidePelpayLogo(isHidden: true).withCallBack(callback: self)
    }
    
    
    func onPaymentSuccess(adviceReference: String?) {
        print("PELPAYSDK onPaymentSuccess: \(adviceReference ?? "")")
    }
    
    func onPaymentError(errorMessage: String?) {
        print("PELPAYSDK onPaymentError: \(errorMessage ?? "")")
    }
    
    
}

```
---

**Note** : Ensure when going live, you change the implementation from Staging `Environment.Staging` to production `Environment.Production`. 
Also ensure you don't use staging credentials on production

**Demo**

Use the `5061 2000 0000 0000 195` test card number to trigger an OTP payment flow with CVV/CVC: `109` future expiration date: `12/2025`, Pin: `1234`

Use the `4456 5300 0000 0007` test card number to trigger a 3D Secure payment flow with CVV/CVC: `444` future expiration date: `12/2025`, Pin: `1234`

Use the *WEMA BANK* with Account number `0238681912` to test bank transactions.

OTP: `123456`


---
