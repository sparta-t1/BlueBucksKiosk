## 1. **BlueBucksKiosk Project**

<img src= "https://github.com/yoon3208/test-repository/assets/161405457/06d8467e-1805-491d-8efc-1e2742cd5f34.png" width="200" height="200"/>
     (블루벅스 로고 이미지)

- **BlueBucks**는 유명 카페 브랜드인 블루보틀(Blue Bottle Coffee)과 스타벅스(STARBUCKS)를 병합한 이름으로 그 두 기업을 합친 만큼의 큰 기업의 **Kiosk** (키오스크)를 만들 때, 
우리가 가지고 있는 기술 내에서 쉽게 사용할 수 있는 유저 친화적인 앱 개발을 주요 서비스 방향으로 기획
- 프로젝트 일정 : 24/04/01 ~ 24/04/07

## 2. Wireframe (Designed in Figma)

- Wireframe

<img width="632" alt="스크린샷 2024-04-08 오후 4 49 35" src="https://github.com/yoon3208/test-repository/assets/161405457/5f7cd1f5-18e2-4923-a576-f8e12c8bd0e4">

- Wireframe History
    
    Version 1

![Untitled-2](https://github.com/yoon3208/test-repository/assets/161405457/81e2f539-8e57-434a-be14-4a8e360ac0d0)

 
    Version 2 - 화면 흐름 수정 및 결제, 상품 상세페이지 추가
    
![Untitled-3](https://github.com/yoon3208/test-repository/assets/161405457/885908ca-7315-425a-9f57-dc40f46757d9)

    
    Version 3 - 상품 전체삭제 및 결제 재확인 추가
    
![Untitled-4](https://github.com/yoon3208/test-repository/assets/161405457/3d37af4e-ab47-4175-ab13-e15cf30e2dd5)

    
    Version 4 - 컬렉션 뷰 셀, 테이블 뷰 셀
    
![Untitled-5](https://github.com/yoon3208/test-repository/assets/161405457/1eb58b03-27a3-4f81-a82e-74909c36a73c)

    
    Version 5 - 흐름 정리 및 비활성화 버튼 추가
    
   ![Untitled-6](https://github.com/yoon3208/test-repository/assets/161405457/578e31d5-eeb8-464f-9db6-4ded1d4cecd9)

    

## 3. 개발 기능 정리

### **파일 세부 정보 및 아키텍처 구성**

<img width="1133" alt="스크린샷 2024-04-08 오후 5 00 44" src="https://github.com/yoon3208/test-repository/assets/161405457/cd820cff-ae79-4697-b870-1696fd46380d">



### UI Flow

![Untitled-7](https://github.com/yoon3208/test-repository/assets/161405457/5caeafee-b0b0-4c14-9c86-58f9880d574d)


### 페이지별 기능 소개

- 메인 화면
    
<img src= "https://github.com/yoon3208/test-repository/assets/161405457/5c37833f-a9d7-4444-ae19-a0b232eff856.png" width="200" height="400"/>


<img src= "https://github.com/yoon3208/test-repository/assets/161405457/11e4d075-7668-4dce-a422-bb15506e0193.png" width="400" height="200"/>



- 상세 설명 화면
    
<img src= "https://github.com/yoon3208/test-repository/assets/161405457/e30ce35d-fc94-4fbb-a1a4-67456e5109c3.png" width="200" height="400"/>
<img src= "https://github.com/yoon3208/test-repository/assets/161405457/252fea8d-c066-4b0c-8ff8-cce5564cb7ce.png" width="400" height="200"/>
    

- 옵션 선택 화면
  
<img src= "https://github.com/yoon3208/test-repository/assets/161405457/14a86205-7ed1-4809-be05-baaa0720107a.png" width="200" height="400"/>

<img src= "https://github.com/yoon3208/test-repository/assets/161405457/3fae1b85-085a-4381-84b6-2112d7c0a71c.png" width="400" height="200"/>

- 장바구니 화면
    
<img src= "https://github.com/yoon3208/test-repository/assets/161405457/c2ddf8fd-2b03-4e80-8221-7b0bb1af34e1.png" width="200" height="400"/>
<img src= "https://github.com/yoon3208/test-repository/assets/161405457/20ff06c0-fa80-4ba1-b30c-03a8fdc9b1ae.png" width="400" height="200"/>


## 4. Troubleshooting

### 1. git, github 을 어떻게 프로젝트에 적용할 수 있을까?

- Problem
    - 첫 프로젝트 인원이 많아 협업 시 git, github 사용에 미숙
- Solution
    - git, github 사용을 그룹 스터디를 통해 학습 및 적용
    - commit message에 대해 convention을 적용
    - organization을 활용

### 2. 어떻게 데이터를 활용 할 수 있을까?

- Problem
    - 실제 앱들은 일반적으로 서버와 통신을 통해 데이터를 활용
    - 이번 프로젝트에서는 서버를 활용 할 수가 없어서 데이터에 대한 CRUD를 고민
- Solution
    - 데이터를 static 선언하여 메모리의 데이터 영역에 저장
    - 힙 영역의 ProductManager 인스턴스들이 데이터 영역에 저장되어있는 데이터를 서로 공유해서 사용

### 3. MVC 패턴을 어떻게 녹여낼 수 있을까?

- Problem
    - 기존에는 Controller에 View와 Model이 같이 존재하여 파일의 길이가 비대해짐
    - 지속적인 기능 개발과 유지보수를 위해 아키텍처의 필요성 대두
- Solution
    - 기존의 파일을 Model, View, Controller로 분리하여 각자의 역할을 준수할 수 있도록 구성
    - 특히 Model과 View는 서로 참조하지 않도록 구성

## 5. 소감

- 팀원 들 간의 소통이 중요하다는 것을 느낌
(팀원 들간의 회의와 피드백이 프로젝트를 더 원활히 진행할 수 있게 함)
- 팀원들의 다양한 문제해결, 협업하는 자세를 보면서 많은 것을 배울 수 있었음
- 이번 프로젝트를 통해 실제 개발도 하고, 부족한 부분은 추가적으로 학습도 함으로서 프로그래밍적 사고 능력이 성장
- 개인적으로 부족한 부분이 어떤 것인지 알게 됨
- 시간관계상 데이터의 CRUD를 고민할 때 싱글톤 패턴도 보여주지 못했다는 아쉬움이 있었음
- 모두가 포기하지 않고 각자의 책임감을 놓치지 않았기에 많은 걸 배울 수 있었고 성장할 수 있는 시간이 되었다고 생각
