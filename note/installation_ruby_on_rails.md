## Gem 설치

### 1. `bundler`

- `gem install bundler`

### 2. ~~`webpacker`~~

- ~~`gem install webpacker`~~

### 3. `ruby on rails`

- `gem install rails`

## 설명

### `bundler` 란?

**Bundler**는 Ruby 프로젝트의 **gem(라이브러리) 의존성을 관리**해주는 도구예요.

쉽게 말하면, 프로젝트에서 필요한 gem들을 **`Gemfile`이라는 파일에 목록으로 정리**해두면, Bundler가 그걸 읽고 필요한 gem들을 한 번에 설치/관리해줍니다.

**예를 들어 Gemfile에:**

```ruby
gem 'rails', '~> 7.0'
gem 'pg'
gem 'devise'
```

이렇게 써두면 `bundle install` 한 방으로 다 설치돼요.

**핵심 역할은 두 가지예요:**

첫째, **버전 충돌 방지** — gem A는 특정 라이브러리 1.0버전을 필요로 하고, gem B는 2.0버전을 필요로 할 때 충돌이 생길 수 있는데, Bundler가 호환되는 버전 조합을 찾아줍니다.

둘째, **환경 통일** — `Gemfile.lock` 파일에 정확한 버전을 기록해두기 때문에, 팀원들이나 서버에서도 똑같은 환경으로 실행할 수 있어요. "내 컴퓨터에서는 되는데?" 문제를 방지하는 거죠.

Node.js의 `npm`이나 Python의 `pip + requirements.txt`랑 비슷한 역할이라고 보면 돼요.

### `webpacker` 란?

**Webpacker**는 Rails에서 webpack을 편하게 쓸 수 있게 해주는 gem이에요.

---

**배경을 먼저 이해하면:**

원래 webpack은 순수 JS 도구라서 Rails랑 전혀 관계가 없어요. 그래서 Rails 프로젝트에서 webpack을 쓰려면 설정이 엄청 복잡했는데, Webpacker gem이 이 복잡한 설정을 대신 해줘요.

---

**왜 쓰냐면:**

개발할 때 JS 파일이 100개면 브라우저가 100번 요청해야 해서 속도가 엄청 느려져요. Webpacker가 내부적으로 webpack을 실행해서 이 100개 파일을 `main.js` 하나로 묶어줘요. 그러면 브라우저는 딱 1번만 요청하면 되니까 훨씬 빠르고 효율적이에요. 거기에 코드 압축, 최신 JS 문법을 구형 브라우저용으로 변환하는 것도 자동으로 해줘요.

---

**Webpacker의 역할을 정리하면:**

첫째로 **webpack 설정을 자동화**해줘요. 원래 webpack 쓰려면 설정 파일을 직접 복잡하게 작성해야 하는데, Webpacker가 Rails에 맞게 미리 다 세팅해줘요.

둘째로 **JS 번들링**을 해줘요. `app/javascript` 폴더에 있는 JS 파일들을 webpack을 통해 `main.js` 하나로 묶어서 브라우저에 전달해요.

셋째로 **Yarn과 연결**해줘요. Yarn으로 설치한 JS 패키지들을 번들링 과정에서 같이 처리해줘요.

---

**전체 흐름을 보면:**

```
개발자가 JS 코드 작성 (파일 100개)
       ↓
Yarn으로 필요한 JS 패키지 설치
       ↓
Webpacker(내부적으로 webpack 실행)가 파일들을 main.js 하나로 번들링
       ↓
브라우저는 main.js 1번만 요청 → 빠름!
```

---

한 줄로 요약하면, **Webpacker = Rails와 webpack을 연결해주는 다리**예요. webpack의 강력한 번들링 기능을 Rails에서 별도 설정 없이 바로 쓸 수 있게 해주는 거죠.
