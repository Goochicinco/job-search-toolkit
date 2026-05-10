---
name: find-jobs
description: Search multiple job sources for operations and program management leadership roles matching target profile
argument-hint: [optional-focus-keyword-or-pipeline]
---

Search multiple web sources for operations and program management leadership roles and present ranked results.

## Input

The argument is optional:

- **No argument:** Full broad search across all sources.
- **A keyword or phrase** (e.g., `fintech`, `remote`, `healthcare`): Appended to each search query to narrow results.
- **`pipeline`:** Only check career pages of companies in `Company Pipeline.md`. Skip broad search.

## Target Profile

Read `Inputs/Preferences.md` for the full set of job search preferences including target roles, company criteria, compensation, location, excluded industries, and work environment requirements. Use the criteria there to filter and rank results.

Key filters to apply when searching (drawn from Preferences.md):
- Target titles: Director, Senior Director, VP, Head of, Senior Manager, GM -- in Business Operations, Program Management, Product Operations, Implementation, Customer Success, Provider Relations, Chief of Staff, Partnerships, RevOps. Also catch alternate function phrasings: Strategy & Operations, GTM Operations, Go-to-Market Operations, Post-Sales, Growth Operations, Delivery, Scaled CS, Revenue Strategy.
- Company stage (e.g., Series A through Series C)
- Industry focus and exclusions
- Team size sweet spot
- Location and remote preferences
- Compensation minimum and target

## Process

### Step 1: Read existing data

1. Read `Company Pipeline.md` (if it exists) to get Active Target companies and their career page URLs.
2. Read `Lead Tracker.md` (if it exists) to identify leads already tracked (used for deduplication).

### Step 2: Search job boards

Run WebSearch queries across these sources. If a focus keyword was provided, append it to each query. Skip this step if the argument is `pipeline`.

1. **LinkedIn Jobs:** `"Director" OR "Senior Director" OR "Head of" OR "VP" OR "Senior Manager" "business operations" OR "program management" OR "customer success" OR "product operations" OR "implementation" OR "RevOps" OR "chief of staff" OR "provider relations" site:linkedin.com/jobs`
2. **Wellfound:** `"Director" OR "Senior Director" OR "Head of" OR "VP" "operations" OR "customer success" OR "program management" OR "implementation" site:wellfound.com`
3. **Y Combinator:** `"Director" OR "Senior Director" OR "Head of" OR "VP" "operations" OR "customer success" OR "implementation" OR "program management" site:workatastartup.com`
4. **Built In:** `"Director" OR "Senior Director" OR "Head of" OR "VP" "business operations" OR "customer success" OR "program management" OR "RevOps" site:builtin.com`
5. **The Ladders:** `"Director" OR "Senior Director" OR "Head of" OR "VP" "operations" OR "program management" OR "customer success" OR "implementation" site:theladders.com`
6. **ExecThread:** `"Director" OR "Senior Director" OR "VP" OR "Head of" "operations" OR "program management" OR "customer success" OR "chief of staff" site:execthread.com`
7. **Health eCareers:** `"Director" OR "Senior Director" OR "Head of" OR "VP" "operations" OR "program management" OR "customer success" OR "chief of staff" OR "implementation" site:healthecareers.com`
8. **Rock Health Jobs:** `"Director" OR "Senior Director" OR "Head of" OR "VP" "operations" OR "program management" OR "customer success" OR "implementation" site:jobs.rock.health`
9. **Glassdoor:** `"Director" OR "Senior Director" OR "Head of" OR "VP" "operations" OR "program management" OR "customer success" OR "chief of staff" healthcare OR "health insurance" OR SaaS salary site:glassdoor.com`
10. **Welcome to the Jungle:** `"Director" OR "Senior Director" OR "Head of" OR "VP" "operations" OR "customer success" OR "program management" site:welcometothejungle.com`
11. **Ashby HQ:** `"Director" OR "Senior Director" OR "Head of" OR "VP" OR "Manager" "business operations" OR "program management" OR "customer success" OR "strategy and operations" OR "implementation" OR "RevOps" OR "chief of staff" site:jobs.ashbyhq.com`
12. **Workday (myworkdayjobs.com):** `"Director" OR "Senior Director" OR "Head of" OR "VP" OR "Senior Manager" "business operations" OR "program management" OR "customer success" OR "implementation" OR "RevOps" OR "chief of staff" site:myworkdayjobs.com` -- Note: Workday pages are JS-rendered; WebFetch will not return the full JD. Flag any Workday URLs in results as "open in browser for full JD."
13. **General web (standard titles):** `"Director" OR "Senior Director" OR "Head of" OR "VP" "business operations" OR "program management" OR "customer success" OR "RevOps" startup "Series A" OR "Series B" OR "Series C" healthcare OR SaaS`
14. **General web (alternate function terms):** `"Head of" OR "VP" OR "Director" OR "Manager" "strategy and operations" OR "GTM operations" OR "go-to-market operations" OR "post-sales" OR "growth operations" OR "delivery" startup "Series A" OR "Series B" OR "Series C" healthcare OR SaaS`
15. **Hacker News:** Search for the most recent "Ask HN: Who is hiring?" thread. If found, WebFetch the thread page and extract any comments mentioning Director, Senior Director, VP, Head of, or Manager roles in operations, program management, customer success, implementation, strategy and operations, or post-sales at SaaS or healthcare companies.

### Step 2b: Search VC portfolio job boards

Search for roles across VC portfolio job boards. These often surface roles at Series A-C companies that never appear on mainstream job boards.

For each VC job board below, run a WebFetch or WebSearch to find relevant openings. Given the WebSearch/WebFetch budget, pick 6-8 of these per run, rotating across runs to cover them all over time.

**Regional VCs (update these to match your location):**

The examples below are Utah-focused; replace with VCs relevant to your metro area.

| VC Firm | Job Board URL | Focus |
|---------|--------------|-------|
| Pelion Venture Partners | https://jobs.pelionvp.com/jobs | Seed/Series A B2B software, SLC-based |
| Kickstart Fund | https://jobs.kickstart.com/jobs | Pre-seed/seed, Mountain West |
| Peterson Ventures | https://jobs.petersonventures.com | Early-stage digital commerce + SaaS, SLC-based |

**National VCs:**

| VC Firm | Job Board URL |
|---------|--------------|
| Andreessen Horowitz (a16z) | https://jobs.a16z.com/jobs |
| Sequoia Capital | https://jobs.sequoiacap.com/companies |
| Accel | https://jobs.accel.com/jobs |
| Greylock Partners | https://jobs.greylock.com/jobs |
| Bessemer Venture Partners | https://jobs.bvp.com/jobs |
| Sapphire Ventures | https://jobs.sapphireventures.com/jobs |
| Insight Partners | https://jobs.insightpartners.com/ |
| Flare Capital Partners | https://www.flarecapital.com/jobs | Healthcare-focused VC; previously surfaced Cohere Health |

**How to search VC job boards:**
- For boards with search/filter capability: WebFetch the job board URL with a prompt asking to extract relevant roles at SaaS companies. When scanning results, look for any of these title patterns: Director, Senior Director, VP, Head of, Senior Manager, GM -- in operations, program management, customer success, implementation, RevOps, chief of staff, partnerships, strategy and operations, GTM operations, post-sales, or delivery.
- For boards without search: WebFetch the jobs page and scan for relevant titles using the patterns above.
- For VCs with only a portfolio page (no job board): WebSearch `"CTO" OR "VP of Engineering" site:[vc-domain]` to find any linked job postings.
- Note the source VC for each result so you know the company's investor backing.

### Step 2c: Check Named Target Employers

Read `Inputs/Preferences.md` for the Named Target Employers list. For each one, check `Company Pipeline.md` for the employer's "Check method" note and follow it exactly. The pipeline entry tells you which method works for each employer:

- **Adobe:** `site:careers.adobe.com` WebSearch. Individual job pages are directly fetchable via WebFetch.
- **University of Utah + UHealth:** `site:employment.utah.edu` WebSearch. Individual job detail pages require a browser -- flag the URL for Ryan to open and paste into /customize-for-job.
- **Intermountain Health / SelectHealth:** MANUAL ONLY. Note the career page URLs and flag for manual browser review.
- Note that compensation at U of U, UHealth, and Intermountain follows university/health system pay bands -- flag the grade or range if shown; do not discard for lacking Series A+ funding.

### Step 3: Check Company Pipeline

For each company listed under **Active Targets** in `Company Pipeline.md`:

1. Read the company's "Check method" note first. It will tell you exactly how to check that company.
2. **If the Check method is `site:[domain]` WebSearch:** Run the WebSearch query specified in the note. This is the preferred method for companies whose career sites are Google-indexed (e.g., Adobe at careers.adobe.com, U of U + UHealth at employment.utah.edu). For any relevant results found:
   - For Adobe: WebFetch the individual job URL directly -- careers.adobe.com pages are fully fetchable.
   - For employment.utah.edu: Note the job title and URL. Individual detail pages require a browser -- flag for Ryan to open and paste JD into /customize-for-job.
3. **If "MANUAL ONLY":** Skip automated fetch entirely. List the company under "Pipeline Company Check" in results with its career page URL and note "Manual check required -- browse directly in browser."
4. Note any relevant openings found.
5. Update the "Last Checked" date for that company in `Company Pipeline.md`.

Skip this step if `Company Pipeline.md` does not exist or has no Active Targets.

### Step 4: Filter and deduplicate

1. Remove duplicate results (same company + same role title).
2. Remove any leads that already appear in `Lead Tracker.md`, including Closed Leads. Do not waste time researching or evaluating companies that have been previously discarded.
3. Discard results that are clearly not leadership or senior individual contributor roles (e.g., a company name contains "Director" but the actual role is an entry-level or IC position).
4. Flag but do not discard roles where stage, comp, or location are unknown.

### Step 5: Rank results

Score each result against the target profile in Preferences.md:

- **Strong Match (3):** Title + stage + industry + location all align, or comp data confirms fit
- **Good Match (2):** Most criteria align; one or two are unknown or slightly off
- **Worth Investigating (1):** Title matches but other criteria are unknown or partially misaligned

### Step 6: Present results

Display results grouped by rank:

```
### Strong Matches

1. **[Role Title]** at [CompanyName] ([Stage], $[Funding] raised)
   - Source: [Site] | Posted: [Date if known]
   - URL: [link]
   - Signals: [healthcare/SaaS, remote/hybrid, company stage, comp range, function area, etc.]

### Good Matches
...

### Worth Investigating
...

### Pipeline Company Check
- [CompanyName]: [Relevant opening found / No relevant openings / Career page not accessible]
```

If no results are found in a category, omit that section. If no results are found at all, say so honestly and suggest alternative approaches (networking, recruiters, adjusting search terms).

### Step 7: User interaction

1. Display the full results list with direct job posting URLs visible (not job board wrapper URLs) so the user can review them before deciding.
2. Ask: "Which leads should I add to the Lead Tracker? (Enter numbers, 'all', or 'none')"
3. For selected leads, append them to the **Discovered** section of `Lead Tracker.md` (create the file from the template if it does not exist). Include the direct posting URL in the tracker entry.
4. Update the **Pipeline Summary** counts in `Lead Tracker.md`.
5. Ask: "Want me to run `/customize-for-job` on any of these?"

## Important Rules

- NEVER fabricate job listings or company details. Only report what WebSearch actually returned.
- ALWAYS use the direct job posting URL (e.g., `greenhouse.io/jobs/123`, `workday.com/...`, `lever.co/company/role`) -- never a job board search result page (e.g., `linkedin.com/jobs/search`, `builtin.com/jobs`). If you can only find a job board URL, note that the direct URL was not resolvable.
- NEVER attempt authenticated access to LinkedIn or any other service.
- NEVER use em dashes in any output.
- Cap at ~20 WebSearch calls and ~10 WebFetch calls per run to stay responsive.
- Honestly note limitations: some job boards render client-side and may not appear in search results; postings may be stale or already filled.
- Include the posting date when available. Flag anything that appears older than 30 days.
- If a search query returns no relevant results, note it and move on. Do not pad results.
