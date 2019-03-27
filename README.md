## blockchain_vote

웹과 mist 프로그램을 연결시키기 위해서는 컨트랙트를 생성하고 그 주소가 필요했습니다. 그래서 컨트랙트를 알아보기 위해 투표 예제를 실행해보았습니다.

우선 mist 프로그램 내에서 컨트랙트를 생성하고 생성된 컨트랙트의 인터페이스와 주소를 복사합니다.

![image](https://user-images.githubusercontent.com/38427658/55115652-61088200-5128-11e9-9da3-7847467349c0.png)


그 후 html파일 소스 내에 있는 문장을 수정하면 웹과 mist 프로그램이 연결되고 구동이 가능해집니다.
```html
var vc = web3.eth.contract
```
![image](https://user-images.githubusercontent.com/38427658/55115716-87c6b880-5128-11e9-82b5-6e7c29357336.png)
