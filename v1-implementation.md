# V1 구현 진입 가이드 (기획 단계 종료 후)

> 이 문서는 현재 **기획/과제 단계**가 끝나고 실제 Android 앱 구현이 시작될 때 쓴다. 지금은 placeholder.

## 진입 트리거

다음 중 하나가 충족되면 구현 단계로 전환:
- 모든 인클래스 과제 완료 + 교수 최종 피드백 수령
- 팀 회의에서 "이제 코딩 시작" 합의
- 기획안 최종본이 CONTEXT.md에 확정 반영 완료

## 예상 구조 변경

구현 시점에 이 레포에 추가될 하위 디렉토리:

```
sds-pm/
├── apps/
│   ├── android/          # Kotlin 네이티브 (Foreground Service, AccessibilityService)
│   ├── webview/          # Lovable (React + TypeScript) 유저뷰
│   └── server/           # FastAPI + RDS (MySQL) API 서버
├── ml/                   # V2 진입 후 (Classification + Bandit)
└── infra/                # AWS 스크립트, 배포 설정
```

또는 별도 레포(`sds-implementation`)로 분리할지 Tom이 결정.

## 구현 단계 에이전트 분화 (제안)

기획 PM 에이전트 + 구현용 서브에이전트 분리:
- **PM 에이전트** (현 `.claude/agents/pm.md`) — 범위·일정·과제
- **Android 에이전트** — Kotlin/AccessibilityService 전문
- **Frontend 에이전트** — Lovable/React/TypeScript 전문
- **Backend 에이전트** — FastAPI/RDS 전문

각 에이전트는 자체 context window로 코드 베이스 isolation (2026 best practice).

## 초기 결정 필요 항목

구현 시작 전 Tom이 확정할 것:
- [ ] 레포 분리 vs 모노레포
- [ ] 개발 환경 (Android Studio 버전, 팀원 M 계열 맥 여부)
- [ ] Git 브랜칭 전략 (main + feature/* vs trunk-based)
- [ ] CI/CD 도입 시점 (V1 출시 직전? 출시 후?)
- [ ] Firebase Analytics / FCM 프로젝트 생성 담당
- [ ] AWS 계정·비용 분담

## 현재는

**이 파일은 플레이스홀더다.** 기획 단계가 끝나면 Tom이 위 체크리스트를 채우고 실제 구현 문서로 확장한다.
