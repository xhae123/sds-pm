# 과제 아카이브

매 수업 in-class assignment의 이력을 남긴다. 각 과제는 `NN-<slug>/` 폴더로 저장.

## 폴더 구조 (각 과제 공통)

```
NN-<slug>/
├── prompt.md    # 과제 원문 압축 정리 (원본 PDF는 gitignore)
├── draft.md     # AI 초안
├── review.md    # 팀 비판적 검토 메모
└── final.md     # 최종 제출안 + AI 초안 대비 개선점 섹션
```

## 현재 이력

| NN | 과제 유형 | 상태 | 제출일 |
| --- | --- | --- | --- |
| 01 | Data·Model 실습 | submitted | 2026-04-07 추정 |
| 02 | Freshness | submitted | 2026-04-14 추정 |
| 03 | Speed | submitted | 2026-04-17 추정 |
| 04 | Labeling·Public Impl·Existing Data | submitted | 2026-04-21 |

> **주의:** 01~03번 과제의 세부 산출물은 이 레포에 이관되지 않은 상태(개인 로컬 또는 노션에 존재). 이관이 필요하면 `/run-assignment` 혹은 `/update-context` 스킬로 Tom 지시에 따라 진행.

## 새 과제 시작 방식

Claude Code 환경에서:
```
/run-assignment <과제 PDF 경로>
```

챗봇(ChatGPT/Claude 웹 등) 환경에서:
1. `CONTEXT.md` + `MEMORY.md` + `course/` 전체를 대화 시작 시 붙여넣기
2. 과제 PDF 원문 또는 요약 제공
3. `.claude/skills/run-assignment/SKILL.md`의 Step 1~11을 가이드로 활용
