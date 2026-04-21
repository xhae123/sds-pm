# sds-pm

서데사 팀 프로젝트(Zan Sol)의 AI PM 하네스.

## 이게 무엇을 한다

**AI가 서데사 단톡에 직접 메시지를 보낸다.**
PM의 맥북에서 카카오톡 Mac 앱을 UI 자동화로 조작하여, 에이전트가 작성한 공지·논제·피드백 요청을 실제 단톡방에 발송한다. 발송 전 PM 승인은 필수다.

그 외에:

- **과제 PDF 한 장으로 제출 수준 초안이 생성된다.** 수업 프레임워크 매핑, V1 중심 전개, 구체 수치 인용, "AI 초안 대비 개선점" 섹션까지 자동으로 채워진다.
- **팀 의사결정이 기록으로 남는다.** 모든 결정은 `CONTEXT.md §5`에 `DECISION / WHY / COURSE LINK` 구조로 저장된다.
- **지난 과제 피드백이 다음 과제에 자동 반영된다.** `MEMORY.md`에 누적된 교훈이 새 과제 작성 시 로드된다.
- **Claude Code 없이 챗봇만으로도 동일하게 작동한다.** `CONTEXT.md + MEMORY.md + course/` 붙여넣기만으로 ChatGPT·Claude 웹에서도 같은 PM이 동작한다.

---

## 사용법

### 챗봇 사용자 (ChatGPT / Claude 웹 / Gemini 등)

1. 새 대화에서 다음 파일을 순서대로 붙여넣는다.
   - `CONTEXT.md`
   - `MEMORY.md`
   - `course/` 안의 4개 파일
2. "서데사 팀 AI PM으로 행동하라"고 지시한다.
3. 이후 질문하거나 과제 PDF를 첨부한다.

ChatGPT Projects 또는 Claude Projects 기능으로 위 묶음을 고정해두면 재붙여넣기가 필요 없다.

카톡 발송 기능은 Claude Code + PM 로컬 환경에서만 동작한다.

### Claude Code 사용자

```bash
git clone https://github.com/xhae123/sds-pm.git
cd sds-pm
claude
```

자동 로드되는 슬래시 명령:
- `/run-assignment <PDF 경로>` — 새 과제 초안 생성
- `/update-context <정보>` — CONTEXT·MEMORY 갱신 제안
- `/kakao-team` — 서데사 단톡 초안 작성 및 발송

---

## 구조

```
AGENTS.md · CLAUDE.md       AI 진입점
CONTEXT.md                  프로젝트 마스터 문서
MEMORY.md                   축적 메타 레슨
course/                     수업 프레임워크 정제
assignments/                과제 이력 (draft → review → final)
.claude/agents/             PM 페르소나
.claude/skills/             슬래시 명령 정의
```

---

## 운영 규칙

- AI 초안을 그대로 제출하지 않는다. 모든 과제는 `draft.md → review.md → final.md` 3단계를 거치며, 최종안에 "AI 초안 대비 개선점" 섹션이 포함된다.
- `CONTEXT.md`의 수치(30초, 2분, 500세션, 85.3% 등)는 모두 근거가 있다. 변경 시 근거 제시 후 PM 승인이 필요하다.
- 이번 학기 결과물은 V1이다. V2 논의는 답안 말미 한 줄로 제한한다.
- 카톡 발송은 PM이 초안을 검토·승인한 후에만 이뤄진다. 자동 발송은 구조적으로 차단되어 있다.
- 교수 PDF, 카톡 원본, 발송 전 초안은 로컬에만 보관한다 (`.gitignore`).

---

## 업데이트

PM이 주기적으로 push한다. 팀원은 `git pull`로 동기화한다.

새 정보가 생기면 PM에게 공유하면 `/update-context`가 기존 내용과의 충돌·중복·근거 정합성을 점검한 뒤 반영 계획을 제시한다.

---

## 팀

| 역할 | 담당 |
|---|---|
| 김우진 (PM) | 기획, 과제 프레이밍, CONTEXT 관리 |
| 유준혁 | 경쟁 앱 분석 |
| 이호준 | 유저 리서치 |
| 김민성 | 기술 검증 |
