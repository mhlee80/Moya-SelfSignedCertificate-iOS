#  Moya-SelfSignedCertificate-iOS

## Info.plist
1. Info.plist에 다음 항목을 추가합니다.
```
App Transport Security Settings
- Allow Arbitrary Loads: YES
```
![App Transport Security Settings](https://github.com/mhlee80/Moya-SelfSignedCertificate-iOS/blob/main/README-img01.png)

## Self signed certificate 설치
1. 실행기기에 [Self Signed  Certificate를 설치](https://developer.apple.com/library/archive/qa/qa1948/_index.html)합니다.
1. Settings > General > About > Certificate Trust Settings 에서 확인할 수 있습니다.
![Self signed certificate install](https://github.com/mhlee80/Moya-SelfSignedCertificate-iOS/blob/main/README-img01.png)

## 빌드하기
1. [Cocoapods](https://cocoapods.org/)을 설치합니다.
2. 터미널에서 프로젝트 루트로 이동하고 다음을 입력하여, 빌드에 필요한 라이브러리를 설치합니다.
```
> pod install
```
3. Finder에서 Moya-SelfSignedCertificate.xcworkspace를 더블 클릭하여 Xcode를 실행합니다.
4. 상단의 Build 버튼을 눌러주세요
