# Figma Component Creation Commands

## create_component_from_figma

⚡ **OPTIMIZED V2**: Intelligent workflow routing with parallel execution

```prompt
Creating React component from Figma design: $FIGMA_INPUT

🎯 **INTELLIGENT WORKFLOW** (Target: <15k tokens, <10 tool uses):

**Phase 1: Smart Triage & Parallel Analysis**
→ @figma-workflow-optimizer (2-3 tools, <2k tokens) - Determine workflow needed
→ @figma-component-analyst (3 tools, <5k tokens) - MCP Figma extraction  
→ @component-discovery-specialist (2-3 tools, <2k tokens) - Existing component check
→ **RUN SIMULTANEOUSLY** for maximum efficiency

**Phase 2: Conditional Routing Based on Triage**
→ IF simple update: Skip to react-component-architect
→ IF moderate: Add @figma-diff-analyzer for targeted changes
→ IF complex: Add @shadcn-ui-expert + @design-token-specialist
→ **SKIP UNNECESSARY AGENTS**

**Phase 3: Targeted Implementation**
→ @react-component-architect (5-8 tools, <8k tokens) - Focused implementation

**EFFICIENCY TARGETS:**
- Simple updates: 2 agents, ~10k tokens, ~8 tools
- Moderate builds: 3-4 agents, ~15k tokens, ~12 tools  
- Complex builds: 5 agents, ~20k tokens, ~15 tools

**ANTI-FABRICATION**: All agents use verified MCP data
**INTELLIGENCE**: Skip work that's not needed

Starting intelligent workflow routing...
```

## smart_update_component

⚡ **NEW**: For updating existing components efficiently

```prompt
Smart component update: $FIGMA_INPUT

🎯 **MINIMAL WORKFLOW** (Target: <10k tokens, <6 tool uses):

**Phase 1: Parallel Diff Analysis**
→ @figma-component-analyst + @figma-diff-analyzer simultaneously
→ Identify exactly what needs to change

**Phase 2: Targeted Update**  
→ @react-component-architect with diff-guided implementation
→ Update only what's necessary

**Skip unnecessary agents:**
- component-discovery (already exists)
- shadcn-ui-expert (no new components)
- design-token-specialist (existing tokens sufficient)

Expected: 60% faster than full workflow
```

## parallel_component_analysis

⚡ **NEW**: For maximum efficiency on complex builds

```prompt
Parallel component analysis: $FIGMA_INPUT

🎯 **BATCH EXECUTION** (Target: <20k tokens, <15 tool uses):

**All agents run simultaneously:**
→ @figma-component-analyst (Figma MCP)
→ @component-discovery-specialist (Component search)
→ @shadcn-ui-expert (Component check)
→ @design-token-specialist (Token verification)

**Then coordinate:**
→ @react-component-architect synthesizes all findings

Maximum parallelization for complex builds.
```

## validate_figma_build

⚡ **NEW**: Post-build validation

```prompt
Validate component against Figma: $FIGMA_INPUT

Quick validation workflow:
→ Compare built component with original Figma design
→ Verify all MCP requirements met
→ Check for any missed specifications

Ensures 100% Figma fidelity.
```