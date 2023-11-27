## Flaskfarm 디버깅 도커
vscode의 dev 컨테이너 접속 방식을 이용하여 flaskfarm을 디버깅하기 위한 도커.

## 폴더 구조
```
/data
  /src
    /flaskfarm
  /venv
  config.json
  config.yaml
  flaskfarm.code-workspace
  init
  svc
```
- `/data/src/flaskfarm`: flaskfarm의 소스 저장 경로
- `/data/venv`: flaskfarm의 파이썬 가상환경 경로
- `/data/config.json`: 컨테이너 환경설정 파일
- `/data/config.yaml`: flaskfarm 설정 파일
- `/data/flaskfarm.code-workspace`: vscode 디버깅용 workspace
- `/data/init`: s6-overlay의 초기화 단계에서 호출됨
- `/data/svc`: s6-overlay의 서비스 실행 단계에서 호출됨

## config.json
- `FF_DEV`: `false`일 경우 컨테이너 시작시 flaskfarm이 서비스로 실행됨. `true`일 경우 디버깅시 중복 실행을 방지하기 위해서 flaskfarm이 서비스로 시작되지 않음. (true | false)
- `FF_REPO`: flaskfarm의 소스 저장소
- `FF_SRC`: flaskfarm의 소스를 저장할 경로
- `FF_VENV`: 파이썬 가상환경 경로
- `FF_CONFIG`: flaskfarm 설정 파일 경로
- `FF_RUNNING_TYPE`: flaskfarm 실행 타입
- `FF_REQUIREMENTS_APT`: 런타임 패키지 설치 목록
- `FF_REQUIREMENTS_APT_INSTALL`: 패키치 설치 여부 (true | false)
- `FF_REQUIREMENTS_PIP`: 런타임 파이썬 패키지 설치 목록
- `FF_REQUIREMENTS_PIP_INSTALL`: 패키지 설치 여부 (true | false)
