# Frontend Learning Curriculum for Rails Developers

## Your Stack

Based on your background and current industry trends, this curriculum uses the **T3 Stack**:

| Technology | Rails equivalent | Why |
|---|---|---|
| **TypeScript** | Ruby (but with types) | Type safety from DB to browser |
| **Next.js** | Rails (framework) | Opinionated, file-based routing, SSR |
| **React** | ERB/ViewComponent | Component-based UI |
| **Tailwind CSS** | — | Utility-first styling, no CSS files |
| **Prisma** | ActiveRecord | ORM with migrations, schema, queries |
| **tRPC** | Rails controllers | Type-safe API — no REST boilerplate |
| **NextAuth / Clerk** | Devise / has_secure_password | Auth |
| **Zod** | Strong params + validations | Schema validation |
| **PostgreSQL** | PostgreSQL | You already know this |

> **Why T3?** It's the closest thing to Rails in the JavaScript world —
> opinionated, batteries-included, and end-to-end type safe. Prisma will feel
> familiar. File-based routing will feel familiar. The mental model maps well.

---

## How This Curriculum Works

### Structure

There are **3 projects**, each divided into **phases**. Each phase introduces
specific concepts, builds on the previous one, and ends with an **evaluation
gate** you must pass before moving on.

```
Project 1: The Fundamentals        (JS, HTML, CSS, React basics)
  └── 5 phases, ~2-3 weeks

Project 2: The Full Stack App       (T3 Stack, DB, Auth, API)
  └── 6 phases, ~3-4 weeks

Project 3: The Production App       (Polish, DevOps, Design, Real Users)
  └── 5 phases, ~3-4 weeks
```

### Evaluation gates

At the end of each phase, run the `/checkpoint` command from your learning kit.
Then answer the **self-evaluation questions** listed in each phase. If you can't
answer them confidently, revisit before moving on.

### Rules

1. **Read before you run** — always read Claude's output before executing
2. **Use `/why` liberally** — if you don't understand a decision, ask
3. **Build first, then run Codebase to Course** — understand what was built
4. **Don't skip phases** — even if they feel easy, the evaluation gates matter
5. **Keep a learning journal** — run `/checkpoint` at the end of every session

---

## Project 1: Personal Bookmarks Manager

### What you're building

A browser-based app where you save, tag, search, and organize bookmarks.
No backend. No database. Everything in the browser.

**Why this project:** Removes all backend complexity so you focus purely on
frontend fundamentals. You already know how to build APIs — this is about
learning the other side.

---

### Phase 1.1: JavaScript Fundamentals (No Framework)

**Goal:** Understand modern JavaScript without any framework abstraction.

**What to build:**
A single HTML page with a form that lets you add bookmarks (title + URL) to a
list displayed on the page. No CSS frameworks. No React. Just vanilla JS.

**Concepts introduced:**
- ES6+ syntax: `const/let`, arrow functions, template literals, destructuring
- DOM manipulation: `querySelector`, `addEventListener`, `createElement`
- Array methods: `map`, `filter`, `find`, `reduce`
- `async/await` and `fetch` (fetch a favicon for each URL)
- Modules: `import/export`
- Local Storage for persistence

**Rails bridge:**
| JS concept | Rails equivalent |
|---|---|
| `document.querySelector` | No equivalent — Rails handles this server-side |
| `addEventListener` | `respond_to` (reacting to events, but client-side) |
| `fetch()` | `Net::HTTP` or `Faraday` |
| `localStorage` | Session/cookies |
| `import/export` | `require` / autoload |

**Tasks:**
1. Create `index.html` with a form (title, URL, tags input)
2. Write `app.js` that captures form submission and renders bookmarks
3. Add search/filter by tag using `.filter()`
4. Persist to `localStorage` — reload should keep bookmarks
5. Fetch and display favicons using the Google Favicon API
6. Add delete and edit functionality

**Evaluation gate:**
- [ ] Can you explain what the DOM is and how JS interacts with it?
- [ ] Can you write a `.filter()` chain from memory without looking it up?
- [ ] Can you explain the difference between `let`, `const`, and `var`?
- [ ] Can you explain what `async/await` does vs callbacks?
- [ ] Can you describe what would happen differently if this were server-rendered in Rails?

---

### Phase 1.2: TypeScript Introduction

**Goal:** Understand why TypeScript exists and how it prevents bugs.

**What to build:**
Rewrite Phase 1.1 in TypeScript. Same functionality, but now with types.

**Concepts introduced:**
- Basic types: `string`, `number`, `boolean`, `array`
- Interfaces and type aliases
- Union types and optional properties
- Type narrowing and type guards
- `tsconfig.json` basics
- Generics (just awareness — don't go deep yet)

**Rails bridge:**
| TypeScript concept | Rails equivalent |
|---|---|
| Interface | Duck typing (but explicit) |
| Type checking at compile | Tests catching type mismatches at runtime |
| `tsconfig.json` | `.rubocop.yml` (project-level config) |
| Generics | Metaprogramming / concerns (loosely) |

**Tasks:**
1. Set up a simple TypeScript project with `tsc`
2. Define a `Bookmark` interface with `title`, `url`, `tags`, `createdAt`
3. Rewrite all functions with proper type annotations
4. Experience a type error — intentionally pass a wrong type and see what TS catches
5. Add a `BookmarkCollection` type with methods for add/remove/search

**Evaluation gate:**
- [ ] Can you define an interface from memory?
- [ ] Can you explain why TypeScript caught a bug that Ruby wouldn't until runtime?
- [ ] Can you explain the difference between `interface` and `type`?
- [ ] Do you understand what `strict: true` does in `tsconfig.json`?

---

### Phase 1.3: React Fundamentals

**Goal:** Understand component-based UI and React's mental model.

**What to build:**
Rebuild the bookmark manager as a React app. Same features, new architecture.

**Concepts introduced:**
- JSX: HTML-in-JS (and why it exists)
- Components: function components, props, children
- `useState`: managing state inside a component
- `useEffect`: side effects (fetching data, syncing localStorage)
- Conditional rendering
- Lists and keys
- Event handling in React vs vanilla JS
- Component composition (splitting into smaller pieces)

**Rails bridge:**
| React concept | Rails equivalent |
|---|---|
| Component | Partial / ViewComponent |
| Props | Local variables passed to a partial |
| `useState` | Instance variable in a controller |
| `useEffect` | `after_action` / callbacks |
| JSX | ERB (template with embedded logic) |
| Re-rendering | Full page reload (but automatic and partial) |
| Key prop on lists | No equivalent — React needs it for DOM diffing |

**Tasks:**
1. `npx create-next-app@latest bookmarks --typescript` (use Next.js from the start)
2. Build a `BookmarkForm` component
3. Build a `BookmarkCard` component
4. Build a `BookmarkList` component that maps over bookmarks
5. Lift state up to a parent component
6. Add search with a controlled input
7. Persist to localStorage via `useEffect`

**Evaluation gate:**
- [ ] Can you explain what "state" means in React vs Rails?
- [ ] Can you explain why React re-renders and when?
- [ ] Can you draw the component tree of your app from memory?
- [ ] Can you explain what "lifting state up" means and why it's necessary?
- [ ] Can you explain the difference between props and state?

---

### Phase 1.4: Tailwind CSS and Layout

**Goal:** Learn how to style without writing CSS files.

**What to build:**
Style the bookmark manager to look professional using Tailwind CSS.

**Concepts introduced:**
- Utility-first CSS: what it means and why
- Tailwind classes: spacing, typography, colors, borders, shadows
- Flexbox and Grid via Tailwind (`flex`, `grid`, `gap`, `justify`, `items`)
- Responsive design: `sm:`, `md:`, `lg:` breakpoints
- Dark mode with `dark:` variant
- Component extraction: when to create a reusable styled component

**Rails bridge:**
| Tailwind concept | Rails equivalent |
|---|---|
| Utility classes | Inline styles (but systematic) |
| `@apply` | SCSS mixins |
| Responsive prefixes | Media queries (but inline) |
| `tailwind.config.js` | Asset pipeline config |

**Tasks:**
1. Install and configure Tailwind (already done if you used `create-next-app`)
2. Design a card layout for bookmarks (shadow, rounded corners, hover state)
3. Build a responsive grid: 1 column on mobile, 2 on tablet, 3 on desktop
4. Style the form with proper spacing, focus states, and validation colors
5. Add a dark mode toggle
6. Create a `Tag` component with colored badges

**Evaluation gate:**
- [ ] Can you build a responsive two-column layout from memory?
- [ ] Can you explain what `flex`, `justify-between`, `items-center` do?
- [ ] Can you explain the difference between `p-4`, `px-4`, `py-4`, `pt-4`?
- [ ] Can you describe the mobile-first approach of Tailwind breakpoints?

---

### Phase 1.5: Hooks Deep Dive and Custom Hooks

**Goal:** Understand React's hook system beyond `useState` and `useEffect`.

**What to build:**
Add advanced features to the bookmark manager using custom hooks.

**Concepts introduced:**
- `useRef`: accessing DOM elements directly
- `useMemo` and `useCallback`: performance optimization (awareness level)
- Custom hooks: extracting reusable logic
- `useReducer`: complex state management (like a mini Redux)
- The rules of hooks (why you can't call them conditionally)

**Tasks:**
1. Create `useLocalStorage` custom hook (replaces raw localStorage calls)
2. Create `useBookmarks` custom hook (encapsulates all bookmark CRUD logic)
3. Create `useSearch` custom hook (debounced search with `useRef`)
4. Refactor the app to use these hooks — the components should be thin
5. Add keyboard shortcuts using `useEffect` and `useRef`

**Rails bridge:**
| Hook concept | Rails equivalent |
|---|---|
| Custom hook | Concern / Service object |
| `useReducer` | State machine (like AASM gem) |
| `useRef` | Direct SQL query (bypassing ActiveRecord) |
| Rules of hooks | Method visibility rules (but stricter) |

**Evaluation gate:**
- [ ] Can you write a custom hook from memory?
- [ ] Can you explain when to use `useReducer` vs `useState`?
- [ ] Can you explain what the "rules of hooks" are and why they exist?
- [ ] Can you describe how your custom hooks separate concerns (like service objects)?

**🏁 PROJECT 1 COMPLETE — Run `/checkpoint` and Codebase to Course**

---

## Project 2: Team Task Board (Kanban)

### What you're building

A Trello-like kanban board where users can create boards, add columns, create
tasks, drag and drop them between columns, assign team members, and filter.
Full stack with database and authentication.

**Why this project:** Introduces the full T3 stack — database, API, auth —
while building something interactive enough to learn advanced React patterns.
Kanban boards are familiar territory for any developer.

---

### Phase 2.1: T3 Stack Scaffold and Prisma (Your New ActiveRecord)

**Goal:** Set up the T3 stack and learn Prisma as your ORM.

**What to build:**
The database layer: schema, migrations, seed data. No UI yet — just the
data foundation.

**Concepts introduced:**
- `create-t3-app`: scaffolding a full-stack app
- Prisma schema: models, relations, enums
- Prisma migrations: `prisma migrate dev`
- Prisma Client: CRUD operations
- Prisma Studio: GUI for your database (like Rails console for the DB)
- Seeding: `prisma/seed.ts`
- Next.js project structure: `app/`, `server/`, `prisma/`

**Rails bridge:**
| Prisma concept | Rails equivalent |
|---|---|
| `schema.prisma` | `schema.rb` |
| `prisma migrate dev` | `rails db:migrate` |
| `prisma db seed` | `rails db:seed` |
| `prisma studio` | Rails console + pgAdmin |
| `prisma generate` | No equivalent (auto in Rails) |
| `model User { ... }` | `class User < ApplicationRecord` |
| `@relation` | `has_many` / `belongs_to` |
| `@@unique` | `add_index :table, :column, unique: true` |

**Tasks:**
1. Run `npm create t3-app@latest taskboard` with TypeScript, Tailwind, tRPC, Prisma
2. Define models: `Board`, `Column`, `Task`, `User`
3. Set up relations: Board has many Columns, Column has many Tasks, Task belongs to User
4. Add enums for task priority: `LOW`, `MEDIUM`, `HIGH`, `URGENT`
5. Write a seed script with sample data
6. Run `prisma studio` and explore your data
7. Write raw Prisma queries in a scratch file — practice CRUD

**Evaluation gate:**
- [ ] Can you write a Prisma model with relations from memory?
- [ ] Can you explain the difference between `prisma migrate dev` and `prisma db push`?
- [ ] Can you compare the Prisma workflow to the Rails migration workflow?
- [ ] Can you explain what `prisma generate` does and why it's necessary?

---

### Phase 2.2: tRPC — Your New Controller Layer

**Goal:** Build type-safe API endpoints without REST boilerplate.

**What to build:**
The API layer: all CRUD operations for boards, columns, and tasks.

**Concepts introduced:**
- tRPC routers: organizing API endpoints
- Procedures: `query` (GET) and `mutation` (POST/PUT/DELETE)
- Input validation with Zod schemas
- Context: sharing database access across procedures
- Error handling in tRPC
- The magic: end-to-end type safety (change server → TS tells frontend)

**Rails bridge:**
| tRPC concept | Rails equivalent |
|---|---|
| Router | `routes.rb` + Controller |
| `query` procedure | `def index` / `def show` (GET) |
| `mutation` procedure | `def create` / `def update` / `def destroy` |
| Zod schema | Strong params + model validations |
| Context | `ApplicationController` (shared state) |
| Middleware | `before_action` |

**Tasks:**
1. Create `boardRouter` with: `getAll`, `getById`, `create`, `update`, `delete`
2. Create `columnRouter` with: `getByBoard`, `create`, `reorder`, `delete`
3. Create `taskRouter` with: `getByColumn`, `create`, `update`, `move`, `delete`
4. Add Zod validation for all inputs
5. Test all endpoints using tRPC panel or a scratch component
6. Intentionally change a return type on the server — watch TS catch it on the frontend

**Evaluation gate:**
- [ ] Can you write a tRPC router with query and mutation from memory?
- [ ] Can you explain what "end-to-end type safety" means practically?
- [ ] Can you compare a tRPC mutation to a Rails controller action?
- [ ] Can you write a Zod schema and explain why it's better than manual validation?

---

### Phase 2.3: Building the Kanban UI

**Goal:** Build a complex, interactive UI with multiple interacting components.

**What to build:**
The kanban board interface: columns, cards, drag and drop.

**Concepts introduced:**
- Complex component composition (deeply nested components)
- Client vs Server Components in Next.js
- `"use client"` directive: when and why
- Data fetching with tRPC hooks: `useQuery`, `useMutation`
- Optimistic updates: updating UI before server confirms
- Drag and drop with `@dnd-kit` library
- Loading and error states

**Rails bridge:**
| Next.js concept | Rails equivalent |
|---|---|
| Server Component | Traditional Rails view (rendered on server) |
| Client Component | Stimulus controller / Turbo Frame |
| `"use client"` | No equivalent — Rails is all server by default |
| `useQuery` | Controller loading data in `before_action` |
| Optimistic updates | Turbo Stream (but more manual) |

**Tasks:**
1. Build `BoardView` (server component, fetches board data)
2. Build `Column` component (renders tasks, has "add task" button)
3. Build `TaskCard` component (shows title, priority badge, assignee)
4. Wire up tRPC: fetch boards, columns, tasks
5. Add create/edit/delete modals for tasks
6. Implement drag and drop between columns
7. Add optimistic updates so moves feel instant

**Evaluation gate:**
- [ ] Can you explain the difference between Server and Client Components?
- [ ] Can you describe when to use `"use client"` and when NOT to?
- [ ] Can you explain what an optimistic update is and why it matters for UX?
- [ ] Can you draw the data flow from database → tRPC → component?

---

### Phase 2.4: Authentication

**Goal:** Add user authentication and authorization.

**What to build:**
Login, signup, session management, and per-user boards.

**Concepts introduced:**
- NextAuth.js (or Clerk): authentication providers
- Session management: JWT vs database sessions
- Protected routes: middleware redirects
- Authorization: users can only see their own boards
- tRPC middleware: checking auth before procedures run

**Rails bridge:**
| Auth concept | Rails equivalent |
|---|---|
| NextAuth provider | Devise + OmniAuth |
| Session | `session[:user_id]` |
| Middleware redirect | `before_action :authenticate_user!` |
| Protected procedure | `authorize!` (CanCanCan/Pundit) |

**Tasks:**
1. Set up NextAuth with GitHub and email/password providers
2. Create a login/signup page
3. Add middleware to protect routes (`/boards/*` requires auth)
4. Add `protectedProcedure` in tRPC that checks session
5. Scope all queries to the current user (only your boards)
6. Add user avatar and profile dropdown

**Evaluation gate:**
- [ ] Can you explain the difference between JWT and session-based auth?
- [ ] Can you describe how middleware protects routes in Next.js vs `before_action` in Rails?
- [ ] Can you explain what a "protected procedure" is in tRPC?
- [ ] Can you describe the full auth flow from login to accessing a protected board?

---

### Phase 2.5: Forms, Validation, and Error Handling

**Goal:** Learn professional form handling patterns in React.

**What to build:**
Proper forms for creating and editing boards, columns, tasks with real validation.

**Concepts introduced:**
- React Hook Form: controlled forms without the boilerplate
- Zod integration: shared validation between client and server
- Error display: field-level and form-level errors
- Toast notifications: success/error feedback
- Loading states during form submission
- Form accessibility: labels, aria attributes, focus management

**Rails bridge:**
| Form concept | Rails equivalent |
|---|---|
| React Hook Form | `form_with` / `form_for` |
| Zod client validation | Client-side JS validation (Rails UJS) |
| Zod server validation | Model validations |
| Shared Zod schema | Model + strong params (but unified) |
| Toast notifications | Flash messages |

**Tasks:**
1. Install `react-hook-form` and `@hookform/resolvers`
2. Create shared Zod schemas in a `/schemas` folder
3. Build a `TaskForm` component with validation
4. Show field-level errors below each input
5. Add toast notifications using `sonner` or `react-hot-toast`
6. Handle loading and disabled states during submission
7. Add accessibility: proper labels, focus trap in modals

**Evaluation gate:**
- [ ] Can you set up React Hook Form with Zod validation from memory?
- [ ] Can you explain why sharing Zod schemas between client and server is powerful?
- [ ] Can you describe three accessibility requirements for forms?
- [ ] Can you compare this form pattern to Rails' `form_with` + model validations?

---

### Phase 2.6: Testing

**Goal:** Learn frontend testing patterns and how they differ from RSpec.

**What to build:**
Test suite for the task board: unit, integration, and E2E tests.

**Concepts introduced:**
- Vitest: unit testing (like RSpec for JS)
- React Testing Library: component testing
- Testing philosophy: "test behavior, not implementation"
- MSW (Mock Service Worker): mocking API calls
- Playwright: end-to-end testing
- Test-driven bug fixes

**Rails bridge:**
| Testing concept | Rails equivalent |
|---|---|
| Vitest | RSpec |
| React Testing Library | Capybara (but for components) |
| MSW | WebMock / VCR |
| Playwright | Capybara + Selenium |
| `describe/it/expect` | `describe/it/expect` (same!) |

**Tasks:**
1. Set up Vitest and React Testing Library
2. Write unit tests for Zod schemas and utility functions
3. Write component tests for `TaskCard` and `TaskForm`
4. Mock tRPC calls using MSW
5. Write 3 Playwright E2E tests: login, create board, move task
6. Practice TDD: write a failing test, then implement the feature

**Evaluation gate:**
- [ ] Can you write a component test from memory?
- [ ] Can you explain the "testing trophy" (unit vs integration vs E2E)?
- [ ] Can you explain how MSW differs from WebMock?
- [ ] Can you write a Playwright test for a user flow?

**🏁 PROJECT 2 COMPLETE — Run `/checkpoint` and Codebase to Course**

---

## Project 3: Recipe Sharing Platform (Production-Ready)

### What you're building

A public recipe sharing platform where users create, share, and discover recipes.
Features: image uploads, search with filters, social features (likes, comments),
responsive mobile-first design, and deployment to Vercel.

**Why this project:** This pulls everything together — design thinking, performance,
real-world features, deployment. It's the project you put in a portfolio.

---

### Phase 3.1: Design System and UI Architecture

**Goal:** Think like a designer before writing code.

**What to build:**
A design system and component library for the recipe app.

**Concepts introduced:**
- Design tokens: colors, spacing, typography as variables
- Component hierarchy: atoms, molecules, organisms
- shadcn/ui: a component library you own (not a dependency)
- Figma basics: reading a design file (not creating one)
- Accessibility from day one: WCAG contrast, keyboard nav
- Mobile-first responsive design

**Skills to activate:**
- Anthropic's `frontend-design` skill
- The passive design awareness from your `CLAUDE.md`

**Tasks:**
1. Define your design tokens in `tailwind.config.ts` (colors, fonts, spacing scale)
2. Install shadcn/ui and customize the theme
3. Build base components: Button, Input, Card, Badge, Avatar, Modal
4. Build composite components: RecipeCard, UserProfile, SearchBar
5. Create a Storybook-like page (`/design-system`) that shows all components
6. Test all components for keyboard navigation and screen reader support

**Evaluation gate:**
- [ ] Can you explain what a design token is and why it matters?
- [ ] Can you describe the difference between a component library you install vs shadcn/ui?
- [ ] Can you check a color combination for WCAG AA contrast?
- [ ] Can you describe the mobile-first approach and why it's preferred?

---

### Phase 3.2: Image Uploads and Media Handling

**Goal:** Handle file uploads, image optimization, and media storage.

**What to build:**
Recipe creation with image uploads, thumbnails, and optimized display.

**Concepts introduced:**
- File uploads in React: `<input type="file" />` and drag-and-drop
- Cloud storage: S3, Cloudflare R2, or Uploadthing
- Image optimization: Next.js `<Image />` component
- Responsive images: `srcset` and `sizes`
- Loading states and progress indicators for uploads
- Image validation: size limits, format checks

**Rails bridge:**
| Concept | Rails equivalent |
|---|---|
| Uploadthing / S3 | Active Storage |
| Next.js `<Image />` | `image_tag` + CDN |
| Client-side validation | Direct upload validations |
| Progress indicators | Active Storage direct uploads |

**Tasks:**
1. Set up Uploadthing (or S3 + presigned URLs)
2. Build an image upload component with drag-and-drop
3. Add progress bar during upload
4. Use Next.js `<Image />` for optimized display
5. Generate and store thumbnail URLs
6. Add Zod validation for file type and size

**Evaluation gate:**
- [ ] Can you explain the difference between server upload and presigned URL upload?
- [ ] Can you describe what Next.js `<Image />` does under the hood?
- [ ] Can you compare this to Active Storage in Rails?

---

### Phase 3.3: Search, Filtering, and Performance

**Goal:** Build performant search with filters and learn frontend performance.

**What to build:**
Recipe search with filters (cuisine, dietary, difficulty, ingredients),
infinite scroll, and performance optimization.

**Concepts introduced:**
- Server-side filtering and pagination
- Infinite scroll with `useInfiniteQuery`
- URL search params: syncing filters with the URL
- Debounced search input
- React performance: `React.memo`, lazy loading, code splitting
- Core Web Vitals: LCP, FID, CLS
- `next/dynamic` for lazy loading heavy components

**Rails bridge:**
| Concept | Rails equivalent |
|---|---|
| URL search params | `params[:query]`, `params[:page]` |
| Infinite scroll | Pagy / Kaminari + Turbo Streams |
| `React.memo` | Fragment caching |
| Code splitting | No equivalent (Rails sends everything) |
| Core Web Vitals | PageSpeed Insights |

**Tasks:**
1. Build search with debounced input (reuse `useSearch` hook from Project 1)
2. Add filter sidebar: cuisine, dietary restrictions, difficulty, cook time
3. Sync filters with URL params (shareable URLs like `/recipes?cuisine=italian&diet=vegan`)
4. Implement infinite scroll for recipe results
5. Run Lighthouse and fix performance issues
6. Add lazy loading for images and heavy components

**Evaluation gate:**
- [ ] Can you explain what debouncing is and why search needs it?
- [ ] Can you describe the difference between pagination and infinite scroll?
- [ ] Can you read a Lighthouse report and explain what LCP, FID, and CLS mean?
- [ ] Can you explain what code splitting does and why it matters?

---

### Phase 3.4: Social Features and Real-time

**Goal:** Build interactive social features and learn real-time patterns.

**What to build:**
Likes, comments, user profiles, and real-time comment updates.

**Concepts introduced:**
- Polymorphic-style relations in Prisma (likes on recipes)
- Nested comments and recursive components
- Real-time updates: polling, SSE, or WebSockets
- Optimistic UI for social interactions (instant like feedback)
- User profiles and public/private data
- Rate limiting and abuse prevention

**Tasks:**
1. Add Like model in Prisma (user + recipe relation)
2. Build like button with optimistic update and animation
3. Add Comment model with nested replies
4. Build a comment thread component (recursive rendering)
5. Add real-time comment updates using polling or SSE
6. Build user profile pages with their recipes and stats
7. Add rate limiting to prevent spam

**Evaluation gate:**
- [ ] Can you explain what a recursive component is?
- [ ] Can you describe the trade-offs between polling, SSE, and WebSockets?
- [ ] Can you explain why optimistic updates improve perceived performance?
- [ ] Can you describe how you'd prevent comment spam without CAPTCHAs?

---

### Phase 3.5: Deployment, DevOps, and Going Live

**Goal:** Ship the app to production with proper CI/CD and monitoring.

**What to build:**
Production deployment with CI/CD, monitoring, and production hardening.

**Concepts introduced:**
- Vercel deployment: environment variables, domains, preview deploys
- CI/CD with GitHub Actions: lint, type check, test on every PR
- Database hosting: Neon, Supabase, or PlanetScale
- Environment management: `.env.local`, `.env.production`
- Error tracking: Sentry
- Analytics: Vercel Analytics or Plausible
- SEO basics: meta tags, Open Graph, sitemap

**Rails bridge:**
| Concept | Rails equivalent |
|---|---|
| Vercel | Heroku / Render |
| GitHub Actions | CI (CircleCI, GitHub Actions — same) |
| Preview deploys | Review apps on Heroku |
| Neon / Supabase | Heroku Postgres |
| Sentry | Sentry / Honeybadger |
| `.env.local` | Rails credentials / `dotenv` |
| `next-sitemap` | `sitemap_generator` gem |

**Tasks:**
1. Deploy to Vercel (connect GitHub repo, set env vars)
2. Set up Neon or Supabase for production database
3. Create GitHub Actions workflow: lint → type check → test → deploy
4. Add Sentry for error tracking
5. Add meta tags and Open Graph images for recipe pages
6. Generate a sitemap
7. Set up a custom domain
8. Run a final Lighthouse audit and fix any issues

**Evaluation gate:**
- [ ] Can you deploy a Next.js app to Vercel from scratch?
- [ ] Can you write a basic GitHub Actions workflow from memory?
- [ ] Can you explain what preview deploys are and why they're valuable?
- [ ] Can you describe the full path of a request from browser to database in your deployed app?
- [ ] Can you explain the difference between build-time and runtime environment variables?

**🏁 PROJECT 3 COMPLETE — Run `/checkpoint` and Codebase to Course**

---

## After Completing All Three Projects

### What you now know

```
✅ JavaScript / TypeScript fundamentals
✅ React component architecture and hooks
✅ Tailwind CSS and responsive design
✅ Next.js (App Router, SSR, API routes)
✅ Prisma ORM and database management
✅ tRPC for type-safe APIs
✅ Authentication and authorization
✅ Form handling and validation
✅ Testing (unit, integration, E2E)
✅ Image uploads and media handling
✅ Search, filtering, performance
✅ Real-time features
✅ CI/CD and deployment
✅ Basic design system thinking
✅ Accessibility fundamentals
```

### What to explore next

- **Design deep dive:** Add the design skills to your learning kit (Phase 2 from our earlier discussion)
- **Advanced React patterns:** Server Actions, Suspense boundaries, streaming SSR
- **State management:** Zustand for complex client state
- **Monorepo:** Turborepo for shared packages
- **Mobile:** React Native or Expo for native apps
- **Advanced DevOps:** Docker, Kubernetes, Terraform (but only if you want that path)

---

## Companion Files for Your Learning Kit

This curriculum works best with the learning kit installed. Add these files
to your `learning-kit/curriculum/` folder:

### `curriculum/commands/evaluate.md`

```markdown
---
description: Run phase evaluation after completing a phase
argument-hint: <phase number, e.g. "1.3">
---

The user has completed phase $ARGUMENTS of the curriculum.

1. Review all code written during this phase
2. Ask the evaluation gate questions from the curriculum one at a time
3. For each answer, rate understanding as:
   - 🟢 Solid — could explain to someone else
   - 🟡 Partial — understands the concept but gaps remain
   - 🔴 Needs review — should revisit before moving on
4. If any 🔴 ratings, suggest specific exercises to fill the gap
5. If all 🟢 or 🟡, congratulate and summarize what was learned
6. Save results to a `progress.md` file in the project root
```

### `curriculum/progress-template.md`

```markdown
# Learning Progress

## Project 1: Bookmarks Manager
| Phase | Status | Date | Notes |
|-------|--------|------|-------|
| 1.1 JavaScript | ⬜ Not started | | |
| 1.2 TypeScript | ⬜ Not started | | |
| 1.3 React | ⬜ Not started | | |
| 1.4 Tailwind | ⬜ Not started | | |
| 1.5 Hooks | ⬜ Not started | | |

## Project 2: Task Board
| Phase | Status | Date | Notes |
|-------|--------|------|-------|
| 2.1 Prisma | ⬜ Not started | | |
| 2.2 tRPC | ⬜ Not started | | |
| 2.3 Kanban UI | ⬜ Not started | | |
| 2.4 Auth | ⬜ Not started | | |
| 2.5 Forms | ⬜ Not started | | |
| 2.6 Testing | ⬜ Not started | | |

## Project 3: Recipe Platform
| Phase | Status | Date | Notes |
|-------|--------|------|-------|
| 3.1 Design System | ⬜ Not started | | |
| 3.2 Image Uploads | ⬜ Not started | | |
| 3.3 Search & Perf | ⬜ Not started | | |
| 3.4 Social & RT | ⬜ Not started | | |
| 3.5 Deploy | ⬜ Not started | | |

## Key Concepts Learned
(Updated by /checkpoint after each session)

## Decisions Log
(Updated by /checkpoint — architectural decisions and why)
```
