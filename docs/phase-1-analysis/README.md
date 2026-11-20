# Phase 1 — Business Analysis: Upwork Acquisition & Conversion Funnel

## What is this?

This was my first real data analysis project, built on **real data for a real client**: an Upwork freelancer specialized in UGC (user-generated content).

The goal was to use the platform's data to understand which factors drive **profile visibility, opportunity generation and contract conversion**, and to turn that data into actionable decisions.

Before focusing on technical tools, I wanted to answer a more fundamental question:

> **How does a data analyst think, and how do they create value from data?**

The project follows an iterative process:

**Problem → Question → Hypothesis → Data → Analysis → Insight → Decision**

> **Privacy note:** the client is not named, and no raw client data is published in this repository. Only aggregated metrics are shown.

---

## 1. Impact of Upwork's Availability Badge

### Problem

The client saw a drop in profile views and contracts and needed to know whether the **Availability Badge** was related to that performance.

### Method

- Compared periods with the Badge turned on vs. off.
- Analyzed **Profile Views** and contracts won.
- Calculated the conversion rate: **Conversion Rate = Contracts / Profile Views**
- Cross-checked against Upwork's official documentation.

### Initial result

- Badge on: up to **5 contracts per month** in the initial period.
- Badge off: **1 contract**.
- Upwork's documentation states that clients can use availability as a filter when searching for freelancers.

### Conclusion & recommendation

The initial data showed an **association between turning on the Availability Badge and a higher volume of contracts**. Recommendation: keep the Badge on and combine it with a profile optimization strategy.

---

## 2. Proposals & Conversion Rate — Finding the Bottleneck

### Problem

The client had the Badge on, was getting profile views, and proposals were being viewed — but not all of them turned into contracts.

> **Was the problem getting visibility, or converting that visibility into a client response?**

### Method

**103 proposals** were analyzed manually from the Upwork interface (94 archived, 9 active):

- Success rate.
- Share of proposals viewed but not answered.
- Comparison against industry benchmarks.

### Results

- Success rate: **6.4%**.
- Active proposals viewed without a reply: **33%**.
- Reported benchmark for viewed proposals: **12–17%** — the observed 33% was above that range.

### Interpretation

Visibility was not the only problem: proposals were reaching clients and being viewed. The next thing to investigate was **what happens after the client views the proposal**, which led to a new hypothesis:

> **Could a personalized video improve client response?**

### Initial recommendation

Test personalized **30–60 second videos**, tailored to each client, as an alternative to text-only proposals.

---

## 3. Availability Badge + Profile Boost — From Traffic to Conversion

### Problem

> **How do Upwork's acquisition tools interact with contract generation?**

The goal was to analyze the **Availability Badge** and **Profile Boost** together, separating exposure, visits and conversions.

### Metrics

| Metric | Definition |
|---|---|
| **Profile Views** | People who opened and reviewed the profile (organic + boosted traffic). |
| **Invitations** | Formal invites from clients to apply to a job before the freelancer sends a proposal. |
| **Impressions** | Times the profile was shown to clients through Profile Boost. |
| **Clicks** | Interactions with the boosted profile (Upwork also tracks saves, invites and hires from the ad). |
| **Conversion Rate** | Contracts / Profile Views. |

### Results

Between May and August: **25 contracts**, an average of **6.25 contracts/month**. August reached **9 contracts in 25 days**.

| Scenario | Impressions | Profile Views | Contracts |
|---|---|---|---|
| April — Boost, no Badge | ~350 | ~90 | 1 |
| June–July — Badge, no Boost | 0 paid | ~100–145 / month | 5 / month |
| August — Badge + Boost | ~180 | 145 | 9 in 25 days |

### Key finding

The two tools play different roles in the funnel:

- **Profile Boost → Attraction:** increases exposure and creates interaction opportunities.
- **Availability Badge → Availability signal:** tells clients the freelancer is ready to work.

Combining **exposure + availability** produced the highest contract volume observed, especially when there is capacity to absorb more demand.

---

## 4. Personalized Video — Testing the Conversion Hypothesis

### Problem

Section 2 suggested personalized video as a way to improve proposal conversion. The next step was to check whether the contracts won afterwards were actually associated with personalized videos.

### Method

A manual audit of the chats with **6 clients** with started or completed contracts. Each case was classified by:

- Contact origin: **Inbound / Outbound / Invite**.
- Whether a personalized video was used in the first contact.
- How the conversation started and evolved into a contract.

### Results

Of the **6 audited clients**:

- **0** received a personalized video in the first contact.
- **4** came through **Inbound** contact, **1** through **Outbound**, **1** through an **Invite**.

In several cases, the clients themselves said the profile or content caught their attention before they reached out.

### Analytical finding

The sample **does not provide enough evidence to say personalized video converted proposals into contracts**. The cases showed a different pattern instead:

**Optimized profile → Client discovers the profile → Inbound contact → Fast reply → Negotiation → Contract**

### Conclusion

The initial hypothesis was revised. In the audited cases, conversion was more directly associated with **profile positioning, inbound lead generation and response/negotiation speed** than with personalized video. Video is still a valid tactic to test in outbound proposals, but **its impact is not demonstrated by this sample**.

---

## Overall Conclusions

```
EXPOSURE
    ↓  Profile Boost
PROFILE VISIT
    ↓  Availability Badge + Portfolio
CONTACT / INVITATION
    ↓
REPLY & NEGOTIATION
    ↓
CONTRACT
```

### Key learnings

1. **Visibility alone does not guarantee conversions.** More impressions from Profile Boost did not necessarily mean more contracts.
2. **The Availability Badge was strongly associated with recovering volume.** After 1 contract in April, there were 25 contracts between May and August (6.25/month on average).
3. **Combining tools produced the best result observed:** Badge + Boost reached 9 contracts in 25 days in August.
4. **The bottleneck was not necessarily visibility.** 33% of the active proposals analyzed were viewed but not answered.
5. **Hypotheses must be validated with real data.** The personalized-video hypothesis was tested with a chat audit and was not supported by the sample (0 of 6).

---

## How this phase was done

This phase was built with the help of AI tools (**ChatGPT, Google Gemini and DeepSeek**) to process, explore and interpret data, test hypotheses and structure the analysis.

> **Note:** this phase did not use Python, SQL, PostgreSQL, Power BI or other traditional analysis tools to process the data.

The focus was on analytical reasoning skills: identifying business problems, asking the right questions, building and challenging hypotheses, interpreting metrics, and turning results into decisions.

**First learn to think like an analyst. Then automate that thinking with technical tools.**

---

## What came next

After defining the KPIs and business logic here, the project evolved into an **Analytics Engineering** solution: an end-to-end pipeline with dbt that turns raw exports into a governed star schema. See the [main README](../../README.md).
