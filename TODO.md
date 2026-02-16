# TODO — DVS README Template

> Future path, improvements, and considerations for the DVS template system.
>
> Last reviewed: 2026-02-16

---

## Scaffolding Script (`new-project.sh`)

- [ ] **Fix hardcoded source path** — Script references `../dvs-readme-template/` which only works if the template repo lives at that exact sibling path. Should use `$SCRIPT_DIR` (the directory where the script itself lives) instead.
- [ ] **Add `data/`, `tests/`, `results/` to template** — The script creates these directories in new projects, but they don't exist in the template repo itself. Consider adding `.gitkeep` files so the intended structure is visible in the template.
- [ ] **Handle Windows compatibility** — `sed -i ''` (macOS) vs `sed -i` (Linux) is handled, but the script is bash-only. Consider a Python-based scaffolding alternative or document WSL requirement for Windows users.
- [ ] **Replace more placeholders** — Script only replaces `[Project Name]` and `[DOMAIN]`. Could also replace `[USERNAME]`, `[REPO-NAME]`, and the GitHub clone URL in the README.
- [ ] **Add `--dry-run` flag** — Let users preview what will be created before committing.
- [ ] **Add GitHub repo creation option** — Offer to run `gh repo create` and `git remote add` as part of scaffolding, so the full flow is one command.

---

## README Template (`README.md`)

- [ ] **Add a "Quick Start" or "TL;DR" section** — Readers scanning portfolios want the punchline fast. A 3-4 line summary block at the top (problem, approach, result) before the deep-dive sections.
- [ ] **Add a "Results Summary" section** — A place to showcase headline metrics (e.g., "92% precision on 200 test cases") prominently, separate from the detailed verification table.
- [ ] **Add architecture diagram placeholder** — A spot for a system diagram image/mermaid block. Visual architecture communicates faster than text.
- [ ] **Add "Demo / Screenshot" section** — For projects with CLI or UI output, a place to show what running the tool actually looks like.
- [ ] **Standardize badge URLs** — The domain/status badges use placeholder syntax that doesn't render. Provide working badge examples or a helper to generate them.
- [ ] **Add LICENSE placeholder** — No license file or section exists. Each scaffolded project should include a license (MIT, Apache 2.0, etc.).
- [ ] **Consider a shorter "lite" template variant** — The full template is thorough but long. Some simpler projects (⭐⭐) may benefit from a streamlined version.

---

## Project Tracker (`PROJECT_TRACKER.md`)

- [ ] **Keep tracker in sync as projects launch** — Update status, add repo links, and fill the sharing log as projects are completed.
- [ ] **Add target dates or sprint goals** — The tracker lists projects but has no timeline. Even rough "Phase 1 by Q2" targets would help maintain momentum.
- [ ] **Add a "lessons across projects" section** — As patterns emerge (e.g., "verification is always the hardest part"), capture cross-project insights.
- [ ] **Decide on project ordering** — Phase 1 mixes ⭐⭐ and ⭐⭐⭐ complexity. Consider starting with the easiest to build momentum and refine the template before tackling harder ones.

---

## GitHub Profile README (`GITHUB_PROFILE_README.md`)

- [ ] **Fill in personal details** — `[Your Name]`, LinkedIn, X handles are still placeholders.
- [ ] **Update featured projects table as repos go live** — Replace placeholder links with actual repo URLs.
- [ ] **Add GitHub stats or contribution graph** — Optional flair (shields.io badges, streak stats) to make the profile more visually engaging.

---

## Code Template (`main.py`, `src/`)

- [ ] **Add a base `processor.py` and `verifier.py` stub** — The README project structure references `src/processor.py` and `src/verifier.py`, but only `src/__init__.py` exists in the template. Scaffold these so new projects start with the DVS pattern baked in.
- [ ] **Add a sample test file** — `tests/test_processor.py` is shown in the README structure but doesn't exist. A minimal pytest stub would lower the barrier to writing tests.
- [ ] **Add a `Makefile` or `justfile`** — Common commands (`make setup`, `make test`, `make run`) standardized across all projects.
- [ ] **Consider a shared utilities package** — If patterns repeat across projects (e.g., confidence scoring, LLM API wrappers, result formatting), extract them into a shared `dvs-utils` package.

---

## Dependencies & Tooling

- [ ] **Pin or update dependency versions** — `anthropic>=0.18.0` is dated; current SDK is well past that. Review and update floor versions.
- [ ] **Add a `pyproject.toml` option** — Modern Python projects often use `pyproject.toml` instead of (or alongside) `requirements.txt`. Consider supporting both or migrating.
- [ ] **Add pre-commit hooks config** — A `.pre-commit-config.yaml` with ruff/black/mypy would enforce code quality across all DVS projects.
- [ ] **Add CI template** — A GitHub Actions workflow (`.github/workflows/test.yml`) that runs tests on push. Could be part of the scaffolding.

---

## Documentation & Portfolio Strategy

- [ ] **Write a CONTRIBUTING.md** — If this template is shared publicly, guide others on how to use/adapt it.
- [ ] **Create a portfolio landing page** — Consider a simple GitHub Pages site or a `dvs-portfolio` repo that indexes all completed projects with summaries and links.
- [ ] **Define "done" criteria per project** — What does ✅ Complete mean? Suggested: working code, filled README, 3+ test cases, shared on at least one platform.
- [ ] **Plan the first project** — No projects have been started yet. Pick one (suggest: Contract Clause Flagger or Job Market Intelligence Extractor as ⭐⭐ starters) and begin.
- [ ] **Build a LinkedIn/X content strategy** — The sharing log exists but is empty. Decide on a cadence (e.g., one project share per week/sprint) and what format posts should take.

---

## Repo Hygiene

- [ ] **Add a `CLAUDE.md`** — Project-level instructions for Claude Code sessions (coding conventions, preferred tools, project context).
- [ ] **Add a `.editorconfig`** — Standardize indentation, line endings, and encoding across editors and contributors.
- [ ] **Review `.gitignore` completeness** — Current ignore list is solid but missing some common entries: `.mypy_cache/`, `.ruff_cache/`, `.coverage`, `htmlcov/`.
- [ ] **Tag a v1.0 release** — Once the template is considered stable, tag it so future changes can be versioned.

---

## Ideas to Explore

- [ ] **Cookiecutter or Copier integration** — Replace the bash script with a proper Python templating tool for richer prompts and more flexibility.
- [ ] **GitHub template repository feature** — Mark this repo as a GitHub template so new projects can be created directly from the GitHub UI with "Use this template."
- [ ] **Evaluation harness** — A shared framework for running verification suites across DVS projects, producing comparable metrics.
- [ ] **Blog post or write-up** — Document the DVS methodology itself as a standalone article. The philosophy is strong enough to stand on its own.

---

*Update this file as items are completed or new ideas emerge.*
