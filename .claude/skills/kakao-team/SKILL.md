---
name: kakao-team
description: 서데사 단톡(4인)에 🤖 Claude (by PM) 명의로 초안을 만들고, 읽고, Tom 승인 후 발송한다. kakaotalk-mac 스킬의 얇은 래퍼로 팀 전용 톤·접두사·승인 플로우를 강제한다.
disable-model-invocation: false
allowed-tools: Bash, Read, Write
---

# kakao-team — 서데사 단톡 전용 커뮤니케이션 스킬

## 대상 채팅방

- **이름:** `서데사` (kakaotalk-mac 스킬의 Known chats에 등록됨, chat_id: 463025774233407)
- **멤버:** 4인 (김우진=Tom, 유준혁, 이호준, 김민성)
- **용도:** 팀플 전용. 사적 대화 없음.

## 절대 원칙

1. **자동 발송 금지.** 항상 초안 → Tom 승인 → 발송.
2. **발신 명의 고정:** 모든 메시지 첫 줄 `🤖 Claude (by PM)` 접두사 + 빈 줄.
3. **초안은 `drafts/` 폴더에 저장** (gitignore). 파일명: `YYYYMMDD-HHMM_<slug>.md`.

## 팀 톤 프리셋 (관찰 기반)

- **어미:** 존댓말 기본. "~해요 / ~합니당 / ~같습니다 / ~부탁드립니다"
- **포맷:** 논제가 여러 개면 `논제 1. / 논제 2. / 논제 3.` 번호 매김
- **마무리:** "확인 부탁드립니다" 또는 "의견 주시면 반영하겠습니다"
- **금지:** 과도한 이모지, 영어 남발, 평어체, 길이 과잉 (400자 내 권장)
- **호칭:** "팀원 여러분" (이름 개별 호출 지양)

## 워크플로우 — 발신

### 1. 초안 작성 목적 확인

Tom에게 이 초안의 목적을 1줄로 확인한다:
- 논제 제시 (팀 의견 수렴)
- 과제 공지 (새 과제 내용 요약)
- 결정 통보 (팀 논의 후 결론)
- 제출 완료 리포트
- 일정 조율

### 2. 맥락 로드

- `CONTEXT.md` 관련 섹션
- 필요하면 `_research/seodesa_chat_dump.txt` 최근 맥락 (gitignore)

### 3. 초안 생성

`drafts/YYYYMMDD-HHMM_<slug>.md` 생성:

```markdown
# 카톡 발신 초안

**발신 대상:** 서데사
**목적:** <한 줄>
**발신 시점 (예정):** YYYY-MM-DD HH:MM

---

## 본문

🤖 Claude (by PM)

안녕하세요 팀원 여러분, <한 줄 맥락>.

논제 1. <제목>
- <설명>
- 제안: ...

논제 2. <제목>
- ...

확인 부탁드립니다!

---

## 발신 체크리스트
- [ ] 🤖 Claude (by PM) 접두사 포함
- [ ] 존댓말 일관
- [ ] 400자 이내 (현재 <count>자)
- [ ] 팀원 이름 개별 호출 없음
- [ ] V1/V2 혼동 없음
- [ ] CONTEXT와 충돌 없음
```

### 4. Tom 검토 요청

Tom에게 초안 경로 + 본문 미리보기 제시:
- "drafts/XXX.md에 초안 준비했습니다. 발송할까요? 수정 필요하면 어디 고칠지 알려주세요."

### 5. Tom 응답 처리

- **"발송"** → Step 6 진행
- **"X 고쳐"** → 초안 수정, Step 4 재실행
- **"보류"** → 초안 유지, 발송 취소

### 6. 실제 발송

```bash
# dry-run 먼저 (입력만, 엔터 안 누름)
osascript /Users/tom.kim/.claude/skills/kakaotalk-mac/scripts/send_via_ui.applescript \
  "서데사" "<본문>"

# Tom이 카카오톡 화면에서 타이핑된 내용 확인 → OK면 실제 발송
osascript /Users/tom.kim/.claude/skills/kakaotalk-mac/scripts/send_via_ui.applescript \
  "서데사" "<본문>" send
```

참고: kakaotalk-mac 스킬의 Known chats 정책상 "서데사"는 dry-run 생략하고 바로 `send`도 가능. 하지만 **이 스킬에서는 반드시 dry-run 먼저** (팀 커뮤니케이션은 더 엄격).

### 7. 발송 후 기록

- `drafts/` 파일에 `**발송 완료: YYYY-MM-DD HH:MM KST**` 추가
- 필요 시 MEMORY.md에 한 줄 (중요한 팀 결정을 공유했을 때)

## 워크플로우 — 수신 (읽기)

자율 허용. Tom 승인 불필요.

```bash
python3 /Users/tom.kim/.claude/skills/kakaotalk-mac/scripts/kakaotalk_mac.py messages \
  --chat-id 463025774233407 --since 7d --json
```

또는 auth cache 사용한 kakaocli 직접 호출 (7일 이상 필요 시):

```bash
DB_PATH=$(python3 -c "import json; print(json.load(open('$HOME/.cache/k-skill/kakaotalk-mac-auth.json'))['database_path'])")
DB_KEY=$(python3 -c "import json; print(json.load(open('$HOME/.cache/k-skill/kakaotalk-mac-auth.json'))['key'])")
kakaocli messages --chat-id 463025774233407 --since 30d --limit 1000 --json --db "$DB_PATH" --key "$DB_KEY"
```

결과는 `_research/seodesa_chat_dump_YYYYMMDD.txt`에 저장 (gitignore).

**타임스탬프는 UTC → KST(+9) 변환 필수.** 사용자에게 보여줄 땐 `MM-DD HH:MM` 형식.

## 상황별 초안 템플릿

### (A) 논제 제기

```
🤖 Claude (by PM)

안녕하세요 팀원 여러분, <한 줄 맥락>.

논제 1. <제목>
- <배경/문제>
- 선택지 A: ...
- 선택지 B: ...
- PM 제안: A

논제 2. ...

확인 부탁드립니다!
```

### (B) 과제 공지

```
🤖 Claude (by PM)

새 인클래스 과제 나왔습니다.

- 제목: <과제>
- 핵심 요구: <한 줄>
- 제출 항목: N개 (1. .. 2. .. 3. ..)
- 분량: 한 페이지 / 슬라이드 1장

제가 초안 돌려놓을 테니 <시간>까지 확인 부탁드립니다.
```

### (C) 결정 통보

```
🤖 Claude (by PM)

팀 논의 결과 아래로 결정되었습니다.

결정: <내용>
근거: <한 줄>
반영될 곳: CONTEXT §<번호>

이견 있으시면 <시간>까지 알려주세요. 아니면 확정 반영합니다.
```

### (D) 제출 완료 리포트

```
🤖 Claude (by PM)

<과제명> 제출 완료했습니다.

- 제출 시점: MM-DD HH:MM
- 핵심 포인트: <3줄>
- 피드백 있으시면 다음 과제에 반영하겠습니다!
```

## 금지 사항

- Tom 승인 없이 `send` 인자로 실행
- 접두사 `🤖 Claude (by PM)` 생략
- 카톡에서 읽은 내용을 **레포에 commit** (반드시 gitignore 경로)
- 팀원 개인 DM 내용을 단톡에 옮기기
- 500자 초과 메시지 (초과 시 분할 또는 요약)
