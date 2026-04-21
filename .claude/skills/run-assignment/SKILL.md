---
name: run-assignment
description: 새 수업 in-class assignment PDF를 받으면 유형 판별 → 포맷 체크 → 초안 작성 → 검토 → 최종안 3단계 파일로 아카이브까지 진행한다. 수업이 요구하는 "AI 초안 대비 개선점" 섹션 포함.
argument-hint: [pdf-path]
---

# run-assignment — 과제 수행 워크플로우

입력: 과제 PDF 경로 (`$ARGUMENTS`).

---

## Step 1. 과제 읽기 & 유형 판별

PDF를 Read 툴로 읽는다. 다음 중 어느 유형인지 판별:

| 키워드 | 유형 | 포맷 참조 |
| --- | --- | --- |
| "Data", "Model", "Input/Output", "Framing" | Data-Model 실습 | `course/assignment-formats.md` §Data·Model |
| "Freshness", "시간이 지나", "최신성" | Freshness | `course/assignment-formats.md` §Freshness |
| "Speed", "대기 시간", "속도" | Speed | `course/assignment-formats.md` §Speed |
| "라벨링", "Labeling", "유사 구현", "Similar Public Implementations" | Labeling | `course/assignment-formats.md` §Labeling |
| 위에 없음 | 신규 유형 | Tom에게 "기존 포맷 확장할지 새 포맷 만들지" 질문 |

---

## Step 2. 컨텍스트 로드

항상 다음을 먼저 읽는다:
- `CONTEXT.md` Section 3 (Core Identity), Section 5 (의사결정 로그), Section 13 (과제별 근거)
- `MEMORY.md` 최근 entries
- `course/framework.md` + `course/good-answer-rubric.md`
- `course/assignment-formats.md` 해당 유형

---

## Step 3. 폴더 생성

```
assignments/NN-<slug>/
├── prompt.md     # 과제 원문을 우리 말로 압축 정리 (원본 PDF는 gitignore)
├── draft.md      # AI 초안
├── review.md     # Tom/팀 비판적 검토 (문제점·개선점 메모)
└── final.md      # 최종 제출안 (AI 초안 대비 개선점 섹션 포함)
```

`NN`은 다음 번호 (기존 `assignments/` 확인해서 결정).
`<slug>`는 과제 유형 기반 영문 (예: `04-labeling`, `05-prompt-engineering`).

---

## Step 4. prompt.md 작성

과제 PDF의 요구사항을 우리 말로 정리:
- 과제 제목, 날짜
- 목적 (한 문장)
- 제출 항목 리스트 (해당 포맷 문서의 체크리스트와 일치시킴)
- 분량 제약
- 특이사항 (엑셀 첨부 필요, 발표 유무 등)

---

## Step 5. draft.md 초안 작성

공통 구조:

```markdown
# <과제 제목>

## 1. 프로젝트 주제
Zan Sol — <1줄>

## 2. <과제별 항목 1>
...

## N. <과제별 항목 N>

## 우리 팀의 최종 판단
...

---

## 수업 원칙 매핑
- Step X: <우리 프로젝트 적용>
- 수업 핵심 메시지 "<원문>" → <우리 해석>

## AI 초안 대비 개선 (최종안에서 채워질 섹션)
(여기서는 초안이므로 비워둠. review.md 작성 후 final.md에서 채움)
```

**작성 시 체크리스트:**
- [ ] Product Goal 문장이 답안에 재등장
- [ ] 수업 Step 번호 최소 1회 인용
- [ ] 구체 수치 (30초, 500세션, 85.3% 등) 포함
- [ ] "왜 X인가"의 근거가 레퍼런스·우리 맥락과 연결
- [ ] V1 중심, V2는 마지막 1줄 이내
- [ ] 추상적 "~한다" 대신 "어떻게·얼마나·왜"

---

## Step 6. Tom에게 초안 제시 + 검토 요청

Tom에게 다음을 전달:
- `assignments/NN-<slug>/draft.md` 경로
- 초안 핵심 포인트 3줄 요약
- "검토 후 문제점/개선점을 알려주세요. 제가 review.md에 옮겨 정리하겠습니다."

---

## Step 7. review.md 작성 (Tom 피드백 받은 후)

```markdown
# <과제 제목> — 검토 메모

## 문제점
- ...

## 개선 방향
- ...

## 추가 참조 필요
- ...
```

Tom이 구두로 피드백하면 그걸 구조화해서 저장. 팀원 추가 피드백 있으면 같이 기록.

---

## Step 8. final.md 작성

draft를 review에 맞게 수정 + **"AI 초안 대비 개선" 섹션**을 반드시 채운다:

```markdown
## AI 초안 대비 개선 점

- 초안 §X에서 [잘못/부족]했던 점 → [어떻게 고쳤는지]
- 추가한 근거·수치: ...
- 제거/이동한 내용: ...
- 팀 비판적 검토의 결과: ...
```

이 섹션이 수업 평가의 필수 요소다. 반드시 작성.

---

## Step 9. 메모리 갱신

`MEMORY.md`에 아래 형식으로 한 entry 추가:

```markdown
## YYYY-MM-DD — <과제 짧은 제목>

- 무엇을 제출했나 (1줄)
- 이번에 얻은 교훈 (1~2줄, 추상화)
- 다음 과제에 적용할 방식 (선택, 1줄)
```

---

## Step 10. CONTEXT.md 섹션 13 업데이트 제안

과제 산출물이 프로젝트의 새로운 통찰을 만들었다면 `/update-context` 스킬을 호출해 Section 13에 반영 제안.

---

## Step 11. 팀 공유 (선택)

Tom이 원하면 `/kakao-team` 호출해 서데사 단톡 공지 초안 작성 (Tom 승인 후 발송).

---

## 주의

- 절대 draft 단계에서 final로 건너뛰지 않는다. 수업 방침상 "AI 초안 → 비판적 검토 → 최종안" 3단계가 평가 요소.
- `course_materials/` 하위 원본 PDF는 gitignore 되어 있으니 레포에는 안 들어간다. prompt.md에 압축만 한다.
- 과제가 엑셀/구글시트 첨부를 요구하면 Tom에게 "파일 준비 주시면 링크를 final.md에 포함"이라고 요청.
