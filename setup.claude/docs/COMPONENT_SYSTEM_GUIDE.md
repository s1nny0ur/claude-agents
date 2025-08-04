# Component System Guide

## 🎯 LLM Component Creation Protocol

Systematic approach for creating components from Figma using MCP + Code Connect.

## Phase 1: Figma MCP Analysis

### Extract & Categorize
From `get_code` + `get_variable_defs` output:

1. **Sub-components identified**: Button, AspectRatio, Separator, etc.
2. **Typography tokens mapped**: Extract variable mappings to `fs-*` utility classes
3. **Component variants**: Property1="Default"|"Mobile" → props interface
4. **Layout patterns**: Gap, spacing, max-width values

### Decision Matrix
For each sub-component found:

```
Component Type → Navigation Path
├── Primitive (Button, Input) → Check existing → Check shadcn → Create custom
├── Layout (AspectRatio, Separator) → Check shadcn → Create if unavailable  
└── Composite (Card, Modal) → Create custom with existing primitives
```

## Phase 2: Discovery Protocol

### Step 1: Component Exists Check
```bash
# Search for existing component interfaces
grep -r "interface.*{ComponentName}.*Props" src/components/
```

**If found**: Import and use. **DO NOT recreate.**

### Step 2: shadcn Availability Check
```bash
# Check if shadcn component exists
ls src/components/ui/{component-name}.tsx || echo "shadcn {component-name} not found"
```

**If not found, install it**:
```bash
pnpm dlx shadcn@latest add {component-name}
```

Common shadcn mappings:
- Button → `button`
- AspectRatio → `aspect-ratio` 
- Separator → `separator`
- Card → `card`
- Input → `input`
- Dialog → `dialog`

### Step 3: Design Token Verification
```bash
# Verify typography utilities exist
grep -r "fs-{specific-class-from-figma}" styles/exports/styles.css

# Check for semantic color tokens
grep -r "{color-name}" styles/exports/tokens.css
```

**Typography System**: `fs-*` classes are **font style utilities** that ensure exact Figma typography matching. They're generated from Figma exports.

## Phase 3: Creation Rules

### Design Token Application

#### Typography (fs-* Classes)
```tsx
// Figma: "text-lg/leading-normal/normal" → Generated fs-* utility
className="fs-text-lg-leading-normal-normal"

// Figma: "buttons/sm" → Generated fs-* utility  
className="fs-buttons-sm"
```

#### Spacing & Layout
```tsx
// Figma: "spacing/20": "80" → Tailwind spacing
className="gap-20"

// Figma: "spacing/6": "24" → Tailwind spacing
className="px-6"
```

#### Colors
```tsx
// Check for semantic token first
// If semantic token exists: use it
// If no semantic token: use arbitrary value with comment

// Figma: "base/background/secondary": "#f7f7ef"
className="bg-[#f7f7ef]" // base/background/secondary from Figma
```

### Component Creation Hierarchy

1. **Import existing** → Use immediately
2. **Install shadcn** → Customize with design tokens
3. **Create custom** → Only as last resort

### Component Structure
```tsx
interface ComponentProps {
  property1?: 'Default' | 'Mobile'; // Match Figma variants exactly
  // Add semantic props for reusability beyond Figma
  className?: string;
  children?: ReactNode;
}

export default function Component({ 
  property1 = 'Default',
  className,
  ...semanticProps 
}: ComponentProps) {
  return (
    <div className={clsx(
      "fs-text-base-leading-normal-normal", // Typography from fs-* system
      "bg-[#f7f7ef]", // Color (with Figma reference comment if arbitrary)
      "gap-20", // Spacing from Tailwind
      className
    )}>
      {/* Use imported/installed components, not recreated ones */}
    </div>
  );
}
```

### File Organization
```
src/components/
├── ui/              # shadcn components install here
├── [domain]/        # Domain-specific components
│   ├── Component.tsx
│   └── index.ts
└── shared/          # Reusable custom components
```

## Phase 4: Quality Gates

**Before completion**:
- [ ] No component duplication (checked existing components)
- [ ] Used shadcn where available (checked ui/ folder and installed if needed)
- [ ] Applied typography design tokens (`fs-*` classes verified in styles/exports/styles.css)
- [ ] Used semantic color tokens where available
- [ ] Props match Figma variants exactly
- [ ] Zero inline styles
- [ ] Semantic props for reusability beyond Figma specs
- [ ] Proper imports (no component copying/recreation)

## Navigation Scenarios

### Scenario A: Primitive Component Needed
```bash
# 1. Check existing
grep -r "interface.*Button.*Props" src/components/
# → Found: Import and use
# → Not found: Continue to step 2

# 2. Check shadcn
ls src/components/ui/button.tsx
# → Not found: Install it
pnpm dlx shadcn@latest add button
# → Use with design tokens

# 3. Customize with design tokens
<Button className="fs-buttons-sm" variant="outline">
```

### Scenario B: Layout Component Needed
```bash
# 1. Check shadcn first (layout components rarely exist as custom)
pnpm dlx shadcn@latest add aspect-ratio
# → Use immediately with design tokens
```

### Scenario C: Design Token Missing
```bash
# 1. Verify fs-* class exists
grep -r "fs-text-custom-size" styles/exports/styles.css
# → Not found: Use arbitrary with comment

# 2. Flag for design system team
className="text-[24px]" // TODO: Add fs-text-custom-size for Figma token
```

## Typography System Deep Dive

**fs-* Classes Purpose**: 
- Generated utilities that match Figma typography exactly
- Include font-family, size, weight, line-height, letter-spacing
- Located in `styles/exports/styles.css`
- Generated via `pnpm run script:tokens`

**Usage Pattern**:
```tsx
// Instead of multiple Tailwind classes:
❌ className="text-lg font-medium leading-normal tracking-wide"

// Use single fs-* utility:
✅ className="fs-text-lg-leading-normal-medium"
```

## Expected Workflow

1. **MCP Extract** → Analyze Figma component structure and tokens
2. **Discovery Protocol** → Check existing → Check shadcn → Verify tokens
3. **Component Resolution** → Import existing OR install shadcn OR create custom
4. **Token Application** → Apply fs-* typography + semantic colors + spacing
5. **Semantic Enhancement** → Add reusable props beyond Figma specs
6. **Quality Validation** → Verify no duplication, proper tokens, clean exports

This systematic approach ensures **zero duplication**, **maximum consistency**, and **design system fidelity** while being adaptable to any component scenario.