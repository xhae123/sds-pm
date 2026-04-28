# 과제 아카이브 — INDEX

이 파일은 **모든 in-class assignment의 단일 진실 원천**이다. 새 과제 작업 전이나 "이 과제 알아?" 질문이 들어오면 **반드시 이 표를 먼저 본다.** 이 표가 없는 과제 = 우리가 모르는 과제.

## 폴더 구조 (각 과제 공통)

```
NN-<slug>/
├── prompt.md    # 과제 원문 압축 정리 (지시서 PDF 경로 포함)
├── draft.md     # AI 초안 (선택 — 레포에 보존하기로 한 경우만)
├── review.md    # 팀 비판적 검토 메모 (선택)
└── final.md     # 최종 제출안 + AI 초안 대비 개선점
```

## 과제 인덱스 (시간순)

| NN | 과제 | 일자 | 지시서 PDF | 제출본 / 산출물 | 상태 |
|---|---|---|---|---|---|
| **00** | **주제 선정 + AI 기획안 (Lecture 2)** | **2026-03-31경** | `course_materials/Lecture2_주제선정_기획안_안내문.pdf` | `00-topic-selection/prompt.md` (산출물 본체는 레포 외) | submitted |
| 01 | Data·Model 8-Step 실습 | ~2026-04-07 | `course_materials/2p_Data-Model 실습.pdf` | (레포 외 — Tom 로컬/노션) | submitted |
| 02 | Freshness | 2026-04-14 | `course_materials/2 In-Class-Assignment-Freshness.pdf` | (레포 외) | submitted |
| **03** | **도메인 전문가 활용 (heuristic)** | **2026-04-16** | `course_materials/실습 0416.pdf` | `03-domain-expert/final.md` + `course_materials/제출본_0416_도메인전문가.pdf` | submitted |
| 04 | Speed | 2026-04-17 | `course_materials/3 In-Class-Assignment-Speed.pdf` | (레포 외) | submitted |
| 05 | Labeling · 공개 구현 · 기존 데이터 | 2026-04-21 | `course_materials/in-class assignment260421.pdf` (지시서) | `05-labeling/final.md` + 구글시트 + `course_materials/0421 In-Class Assignment.pdf` (제출본) | submitted |
| 06 | UX 설계 (IA · User Flow · Wireframe) | 2026-04-28 | `course_materials/0428_UX설계_안내문.pdf` | `06-ux-design/submission.pdf` | submitted |

> **이력 수정 규칙:** 새 과제 시작 시 1) 지시서 PDF를 `course_materials/`에 복사 2) 본 표에 행 추가 3) 폴더 생성. 누락은 곧 "AI가 모르는 과제"가 된다.

## CONTEXT 13-N 매핑 (사고 흔적)

| NN | CONTEXT 섹션 | 핵심 프레이밍 |
|---|---|---|
| 00 | 13-0 | 주제 선정 3원칙 + V1/V2 분리 가능성의 출처 |
| 01 | 13-1 | No Data → Rule → Data 자체 생성 → V2 ML |
| 02 | 13-2 | "모델 최신성" → "product goal 시간 달성" 재프레임 |
| 03 | 13-3 | 학습상담사·교사 절차를 V1 규칙으로 옮김 (5/15/30분 초기값) |
| 04 | 13-4 | "단일 크리티컬 패스" + 3강점 중첩. 단순함이 speed의 보장 |
| 05 | 13-5 | 잔소리 = 4축 256조합 공간의 최적점 탐색 |
| 06 | 13-6 | 트리·Flow·Wireframe 구조화. 잔소리 오버레이 = OS 레이어 노드 |

## 새 과제 시작 방식

```
/run-assignment <과제 PDF 경로>
```

이 슬래시 커맨드가 **자동으로 본 인덱스 다음 NN을 부여**하고 폴더 생성·인덱스 업데이트까지 처리한다. 수동으로 만들지 말 것.

## course_materials/ 분류

- **과제 지시서:** 위 표의 "지시서 PDF" 컬럼 파일들
- **과제 제출본:** `제출본_*.pdf` 접두어
- **강의 자료:** `AI.pdf`, `Decoder-only-vs-Encoder-Decoder.pdf`, `Prompt-Engineering-Frameworks.pdf` 등
- **예시 안내문:** `In-class Assignment_eamxple*.pdf` (교수님이 보여준 양식 예시)
