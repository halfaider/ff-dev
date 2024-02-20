## Flaskfarm 디버깅 도커
vscode의 dev 컨테이너 접속 방식을 이용하여 flaskfarm을 디버깅하기 위한 도커.

## 폴더 구조
```
/data
  /src
    /flaskfarm
  /venv
  99-ff-profile.sh
  config.yaml
  flaskfarm.code-workspace
  init
  svc
```
- `/data/src/flaskfarm`: flaskfarm의 소스 저장 경로.
- `/data/venv`: flaskfarm의 파이썬 가상환경 경로.
- `/data/99-ff-profile.sh`: 환경변수 설정 파일. (심볼릭 링크: `/etc/profile.d/99-ff-profile.sh`)
- `/data/config.yaml`: flaskfarm 설정 파일.
- `/data/flaskfarm.code-workspace`: vscode 디버깅용 workspace.
- `/data/init`: s6-overlay 초기화 단계에서 호출됨.
- `/data/svc`: s6-overlay 서비스 실행 단계에서 호출됨.

## 99-ff-profile.sh
- `FF_DEBUG`: `config.yaml`의 `debug` 값이 `false`일 경우 컨테이너 시작시 flaskfarm이 서비스로 실행된다. `true`일 경우 flaskfarm이 서비스로 시작되지 않는다. (기본값: true)

  flaskfarm이 서비스로 실행될 경우 celery도 백그라운드에서 서비스로 시작된다. 따라서 `설정>일반설정>비동기 작업>시작시 celery 실행`을 켜지 않아도 된다. 하지만 디버깅으로 실행하면 celery는 수동으로 실행해야 한다.

- `FF_REPO`: flaskfarm의 소스 저장소
- `FF_SRC`: flaskfarm의 소스를 저장할 경로
- `FF_VENV`: flaskfarm 파이썬 가상환경 경로
- `FF_REQUIREMENTS_APT_LIST`: 런타임 패키지 설치 목록
- `FF_REQUIREMENTS_APT_INSTALL`: 패키치 설치 여부 (true | false)
- `FF_REQUIREMENTS_PIP_LIST`: 런타임 파이썬 패키지 설치 목록
- `FF_REQUIREMENTS_PIP_INSTALL`: 패키지 설치 여부 (true | false)
