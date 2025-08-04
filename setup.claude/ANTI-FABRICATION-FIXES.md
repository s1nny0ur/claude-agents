# 🚨 CRITICAL AGENT FAILURE FIXES

## Problem Summary

The original Figma Builder agents had massive failures:
- **figma-component-analyst**: Completely fabricated analysis without using MCP tools
- **react-component-architect**: Created placeholder content instead of using exact Figma text
- **Result**: Components with wrong content, wrong styling, and zero Figma fidelity

## Fixed Agents

### 1. figma-component-analyst.md
**CRITICAL FIXES:**
- ✅ **MANDATORY MCP TOOL USAGE**: Must call get_image, get_code, get_variable_defs
- ✅ **RAW OUTPUT VERIFICATION**: Must include unedited MCP output for validation
- ✅ **EXACT TEXT EXTRACTION**: Forbidden to paraphrase or "improve" content
- ✅ **ANTI-FABRICATION PROTOCOL**: Clear failure conditions and requirements
- ✅ **VISUAL VERIFICATION**: Must include Figma image for layout reference

**Key Addition:**
```markdown
🚨 **AGENT FAILS IF:**
- No MCP tools are called
- Raw MCP output not included
- Text content is paraphrased or changed
- Measurements are approximated or guessed
- Any content appears to be fabricated
```

### 2. react-component-architect.md
**CRITICAL FIXES:**
- ✅ **CONTENT FIDELITY REQUIREMENTS**: Must use exact text from figma-component-analyst
- ✅ **SOURCE TRACEABILITY**: Must include Figma node ID in component comments
- ✅ **VISUAL VERIFICATION**: Must reference Figma image for layout accuracy
- ✅ **FABRICATION PREVENTION**: Forbidden to create marketing copy or placeholders
- ✅ **MANDATORY VALIDATION**: Must verify figma-component-analyst data before proceeding

**Key Addition:**
```typescript
// SOURCE: Figma Node ID [NODE_ID] - [DATE]
// Content verified against figma-component-analyst output

{/* EXACT TEXT FROM FIGMA - DO NOT CHANGE */}
<h2 className="fs-text-[size]-leading-[height]-[weight]">
  [EXACT_HEADING_FROM_FIGMA]
</h2>
```

### 3. create_component_from_figma.md
**CRITICAL FIXES:**
- ✅ **ANTI-FABRICATION PROTOCOL**: Active monitoring at each workflow phase
- ✅ **CROSS-VALIDATION GATES**: Main agent validates each step
- ✅ **QUALITY GATES**: Component fails if any verification fails
- ✅ **MCP TOOL VERIFICATION**: Commands specifically require MCP tool usage
- ✅ **NEW COMMAND**: cross_validate_figma_analysis for verification

### 4. CLAUDE.md
**CRITICAL FIXES:**
- ✅ **MANDATORY QUALITY GATES**: Every component must pass all verification checks
- ✅ **FAILURE CONDITIONS**: Clear consequences for fabrication
- ✅ **TROUBLESHOOTING**: Specific guidance for fabrication detection
- ✅ **ANTI-FABRICATION PROTOCOL**: Prominently displayed requirements

## Verification Workflow

### Phase 1: Figma Analysis
```
figma-component-analyst MUST:
├── Call actual MCP tools ✅
├── Include raw MCP output ✅
├── Extract exact text (no paraphrasing) ✅
└── Provide visual reference ✅
```

### Phase 2: Cross-Validation
```
Main Agent MUST verify:
├── Raw MCP output present ✅
├── Exact text extraction (not paraphrased) ✅
├── Visual reference included ✅
└── Anti-fabrication checklist completed ✅
```

### Phase 3: Component Creation
```
react-component-architect MUST:
├── Use exact text from Phase 1 ✅
├── Include source comment with Figma node ID ✅
├── Reference Figma visual for layout ✅
└── Apply verified design tokens only ✅
```

## Testing Protocol

The system now includes comprehensive testing:
- **Anti-fabrication detection**: Verify MCP tool usage
- **Content fidelity validation**: Ensure exact text matching
- **Cross-validation testing**: Verify each phase validates previous
- **Fabrication detection**: Intentionally trigger to test safeguards

## Quality Assurance

### Before Using This System:
1. ✅ Test MCP server connection
2. ✅ Verify agents include anti-fabrication protocols
3. ✅ Run fabrication detection tests
4. ✅ Confirm cross-validation works

### After Component Creation:
1. ✅ Verify component includes Figma node ID comment
2. ✅ Check all text matches Figma exactly
3. ✅ Confirm no placeholder or marketing copy
4. ✅ Validate against original Figma visual

## Installation

The complete anti-fabrication system is ready in `setup.claude/`:

```bash
# Install fixed system
cp -r setup.claude/* /your/project/
```

## Critical Success Metrics

This system NOW ensures:
- **100% MCP tool usage**: No analysis without actual Figma data
- **100% content fidelity**: Exact text matching from Figma
- **100% traceability**: Every component links back to Figma source
- **0% fabrication**: Impossible to create components without Figma data

**🚨 SYSTEM SUCCESS**: If agents follow these protocols, fabrication is impossible and all components will match Figma designs exactly.