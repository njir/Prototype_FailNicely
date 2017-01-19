<!-- page_number: true -->

# iOS에서 library 관리

### CocoaPods
[CocoaPods](http://cocoapods.org)는 iOS 개발 시에 사용하는 Cocoa project의 일종의 라이브러리 매니저이다. 우리가 알고 있는 npm과 유사하다.

설치 방법
```bash
$ gem install cocoapods  
```

설치 후 저장소를 생성해야 한다. 아래 명령어는 상당히 오래 걸려서 구글에 검색하면 관련 글이 많이 나온다. [참고](http://stackoverflow.com/questions/21680573/cocoapods-setup-stuck-on-pod-setup-command-on-terminal/21916507#21916507)할 것
```bash
$ pod setup --verbose  
```

---
### CocoaPods를 이용해서 Xcode 프로젝트에 라이브러리 추가하기
작업하고 있는 프로젝트로 이동해서 아래 명령어를 입력해 Podfile을 만든다.
```bash
$ pod init
```
Podfile 파일에서 추가하고자 하는 라이브러리를 입력하고 저장한다.
```
target 'BeSoul' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
      use_frameworks!
      # Pods for BeSoul
      pod '라이브러리명'
end
```
이후, 다음 커맨드를 입력한다.
```bash
$ pod install
```
---



