# CLAUDE.md - Figma Component Builder Configuration

🚨 **CRITICAL**: Anti-Fabrication Protocol Active for all Figma component creation

This file provides guidance to Claude Code (claude.ai/code) when working with Figma component creation in this repository.

## Project Overview

This project uses the Figma Component Builder system - a specialized set of AI agents that automate the creation of React components from Figma designs. The system ensures:

- **⚡ HIGH EFFICIENCY** - Target: <20 tool uses, <30k tokens per component
- **🚨 ZERO DATA FABRICATION** - All agents must use actual Figma MCP tools
- Zero component duplication  
- Automatic shadcn/ui component installation
- Design token fidelity with fs-* typography utilities
- Clean, reusable component architecture
- **MANDATORY CONTENT FIDELITY** - Exact text from Figma designs

## Figma Builder Workflow

When creating components from Figma designs, Claude Code follows this systematic workflow:

### 1. Command Invocation

Use the command: `/create_component_from_figma [FIGMA_NODE_ID or FIGMA_LINK]`

### 2. Agent Orchestration

The main Claude agent coordinates these specialized builder agents with MANDATORY VERIFICATION:

1. **figma-component-analyst** 🚨 **MUST USE MCP TOOLS**
   - **MUST call actual MCP tools** (get_image, get_code, get_variable_defs)
   - **MUST include raw MCP output** for verification
   - **MUST extract exact text** (no paraphrasing allowed)
   - **FORBIDDEN to fabricate** any analysis data

2. **Cross-Validation Gate** 🚨 **MANDATORY CHECKPOINT**
   - Verify figma-component-analyst included raw MCP output
   - Verify exact text extraction (not paraphrased)
   - Verify visual reference image present
   - **STOP workflow if verification fails**

3. **component-discovery-specialist**
   - Checks for existing components to prevent duplication
   - Provides exact import paths for reuse

4. **shadcn-ui-expert**
   - Automatically installs missing shadcn components
   - Runs `pnpm dlx shadcn@latest add [component]` commands
   - Prepares customization with verified design tokens

5. **design-token-specialist**
   - Verifies fs-* typography utilities exist
   - Validates semantic color and spacing tokens
   - Flags missing tokens with TODO recommendations

6. **react-component-architect** 🚨 **CONTENT FIDELITY REQUIRED**
   - **MUST use exact text** from figma-component-analyst output
   - **MUST reference Figma visual** for layout verification
   - **MUST include source comment** with Figma node ID
   - **FORBIDDEN to create marketing copy** or placeholder content

## Important Patterns

### Design Token Application

```tsx
// Typography - use fs-* utilities for exact Figma matching
className="fs-text-lg-leading-normal-normal"

// Colors - use semantic tokens when available
className="bg-primary text-primary-foreground"

// Colors - use arbitrary values with comments when semantic tokens missing
className="bg-[#f7f7ef]" // base/background/secondary from Figma

// Spacing - use Tailwind utilities
className="gap-20 px-6"
```

### Component Structure

```tsx
// SOURCE: Figma Node ID [NODE_ID] - [DATE]
// Content verified against figma-component-analyst output

interface ComponentProps {
  property1?: 'Default' | 'Mobile'; // Match EXACT Figma variants
  className?: string;
  children?: ReactNode;
}

export function Component({ ...props }: ComponentProps) {
  return (
    <div className={cn(
      "w-[Xpx] h-[Ypx]", // From actual Figma measurements
      "bg-[#ACTUAL_HEX]", // From actual Figma colors
      className
    )}>
      {/* EXACT TEXT FROM FIGMA - DO NOT CHANGE */}
      <h2 className="fs-text-[size]-leading-[height]-[weight]">
        [EXACT_HEADING_FROM_FIGMA]
      </h2>
    </div>
  );
}
```

### MANDATORY Quality Gates

🚨 **EVERY COMPONENT MUST PASS ALL CHECKS:**
- [ ] **MCP Tool Verification**: figma-component-analyst used actual MCP tools
- [ ] **Raw Data Included**: MCP output present for verification
- [ ] **Content Fidelity**: All text matches Figma exactly (no paraphrasing)
- [ ] **Visual Reference**: Figma image included for layout verification
- [ ] **Source Traceability**: Component includes Figma node ID comment
- [ ] **No Fabrication**: Zero placeholder or marketing copy
- [ ] Component duplication prevented by discovery specialist
- [ ] All shadcn components installed automatically
- [ ] Design tokens applied from token specialist verification
- [ ] Semantic props matching actual Figma variants
- [ ] Zero inline styles

**🚨 COMPONENT FAILS IF ANY GATE FAILS**

## Available Builder Agents

| Agent | Purpose | Efficiency Target |
|-------|---------|-----------------|
| figma-component-analyst | Figma MCP analysis | 1-2 tools, <5k tokens |
| component-discovery-specialist | Component search | 2-3 tools, <3k tokens |
| shadcn-ui-expert | Component installation | 3-5 tools, <5k tokens |
| design-token-specialist | Token verification | 2-3 tools, <3k tokens |
| react-component-architect | Component creation | 5-8 tools, <15k tokens |

**⚡ TOTAL TARGET: <20 tool uses, <30k tokens per component**

## Common Commands

```bash
# Create a component from Figma
/create_component_from_figma https://www.figma.com/file/xxx/yyy?node-id=123:456

# Analyze a Figma component structure
/analyze_figma_component node-123456

# Install missing shadcn components
/install_shadcn_components button card dialog

# Verify design tokens
/verify_design_tokens
```

## Project-Specific Configuration

### Typography System
- All typography uses fs-* utility classes from `styles/exports/styles.css`
- Run `pnpm run script:tokens` to generate new tokens from Figma

### Component Organization
```
src/components/
├── ui/              # shadcn components (auto-installed)
├── [domain]/        # Domain-specific components
└── shared/          # Reusable custom components
```

### Design Token Sources
- Typography: `styles/exports/styles.css` (fs-* classes)
- Colors: `styles/exports/tokens.css` (semantic tokens)
- Spacing: Tailwind theme configuration

## Troubleshooting

### 🚨 Agent Fabrication Detected
**SYMPTOMS**: Component has wrong text, placeholder content, or generic marketing copy
**CAUSE**: figma-component-analyst fabricated data instead of using MCP tools
**SOLUTION**: 
1. Stop immediately - do not use fabricated component
2. Re-run `/analyze_figma_component` with MCP tool verification
3. Verify raw MCP output is included in analysis
4. Restart workflow with verified Figma data

### MCP Tool Connection Issues
**SYMPTOMS**: "No MCP tools available" or connection errors
**CAUSE**: Figma MCP server not configured
**SOLUTION**:
1. Ensure Figma MCP server is running
2. Check Claude Code MCP configuration
3. Verify Figma API access token
4. Test MCP connection with simple get_file command

### Missing fs-* Classes
1. Check `styles/exports/styles.css` for the utility
2. If missing, use arbitrary values with TODO comment
3. Run `pnpm run script:tokens` to regenerate

### shadcn Installation Issues
1. Ensure `shadcn.json` exists in project root
2. Check network connectivity
3. Verify pnpm is installed

### Component Discovery Failures
1. Check import aliases in tsconfig.json
2. Verify component file naming conventions
3. Ensure proper exports from index files

### Content Fidelity Failures
**SYMPTOMS**: Component text doesn't match Figma design
**CAUSE**: react-component-architect used fabricated analysis
**SOLUTION**:
1. Check figma-component-analyst output for exact text
2. Verify no paraphrasing or "improvement" occurred
3. Cross-reference with Figma visual image
4. Rebuild component with exact content

---

Generated by Figma Builder Setup
Last Updated: $(date)
