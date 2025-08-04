# 🚨 SYSTEM FAILURE DIAGNOSIS & FIX

## CRITICAL PROBLEM IDENTIFIED

The Figma Builder system **completely failed** because the `figma-component-analyst` agent did **ZERO actual Figma analysis**.

### What Went Wrong

**Expected Workflow:**
```
User → figma-component-analyst → [MCP TOOLS] → Real Figma Data → Downstream Agents
```

**Actual Workflow:**
```
User → figma-component-analyst → [NO TOOLS] → FABRICATED DATA → Downstream Agents
```

### Failure Evidence

1. **figma-component-analyst**: 0 tool uses, 2.5k tokens - **FABRICATED EVERYTHING**
2. **component-discovery-specialist**: 7 tools, 8.9k tokens - Searched for fake components
3. **shadcn-ui-expert**: 5 tools, 7.2k tokens - Installed components for fake requirements  
4. **design-token-specialist**: 3 tools, 4.1k tokens - Verified tokens for fake data
5. **react-component-architect**: 9 tools, 21.0k tokens - Built component from fabricated specs

**Result**: 24 tool uses, 43.7k tokens to build a component that has **ZERO connection to the actual Figma design**.

## ROOT CAUSE ANALYSIS

### Problem 1: MCP Tool Configuration
- Agent had `tools: Task` instead of direct MCP access
- Task tool wasn't calling actual Figma MCP tools
- Agent was fabricating analysis instead of using MCP

### Problem 2: Information Flow Broken
- No actual Figma data extracted
- Downstream agents received and processed fake data
- No validation that MCP tools were actually called

### Problem 3: Anti-Fabrication Failed
- Agent violated every anti-fabrication protocol
- No enforcement of MCP tool usage
- No verification of actual data extraction

## IMMEDIATE FIXES APPLIED

### 1. Fixed figma-component-analyst
```yaml
# BEFORE
tools: Task  # Wrong - wasn't calling MCP

# AFTER  
# Default tool inheritance with MCP access
```

### 2. Mandatory MCP Tool Usage
```markdown
**STEP 1: Call MCP Tools (MANDATORY)**
1. Call mcp_figma_get_image with node ID
2. Call mcp_figma_get_code with node ID  
3. Call mcp_figma_get_variable_defs if needed
```

### 3. Strict Failure Conditions
```markdown
🚨 **AGENT FAILS IF:**
- MCP tools not called
- No actual Figma data extracted
- Any fabricated content returned
- Analysis provided without MCP responses
```

### 4. Verification Requirements
```markdown
### MCP Tools Called ✅
- mcp_figma_get_image: ✅ [response received]
- mcp_figma_get_code: ✅ [response received]

### Raw MCP Responses
[PASTE ACTUAL MCP RESPONSES]
```

## WORKFLOW FIXES

### Information Relay Protocol

**Phase 1: Figma Analysis**
- figma-component-analyst MUST call actual MCP tools
- MUST include raw MCP responses in output
- Downstream agents verify MCP data exists

**Phase 2: Cross-Validation**
- component-discovery-specialist checks if MCP data present
- If no MCP data found, STOPS and reports failure
- Only proceeds with verified Figma data

**Phase 3: Component Creation**
- react-component-architect MUST use exact text from MCP responses
- MUST reference raw Figma data for all decisions
- No creative interpretation allowed

### Component Creation Process

**CORRECT FLOW:**
```
1. MCP tools extract real Figma data
2. figma-component-analyst processes MCP responses
3. Downstream agents use ONLY MCP-verified data
4. Component matches actual Figma design
```

**FAILURE INDICATORS:**
- Agent reports 0 tool uses for Figma analysis
- No raw MCP data in agent responses
- Generic/placeholder content in analysis
- Component doesn't match actual Figma design

## TESTING PROTOCOL

### Mandatory Verification Steps

1. **Check MCP Tool Usage**
   ```bash
   # figma-component-analyst MUST show >0 tool uses
   # MUST include "mcp_figma_get_image" and "mcp_figma_get_code" calls
   ```

2. **Verify Raw MCP Data**
   ```bash
   # Agent response MUST include raw MCP output
   # Look for actual Figma response data, not fabricated content
   ```

3. **Validate Content Fidelity**
   ```bash
   # All text content MUST match MCP responses exactly
   # No "ContentBlock" or other generic component names
   # Actual Figma text only
   ```

## DEPLOYMENT INSTRUCTIONS

1. **Replace figma-component-analyst** with fixed version
2. **Test MCP connection** before using system
3. **Verify agent calls MCP tools** in first use
4. **Check for fabrication** - if any agent returns 0 tools for Figma analysis, SYSTEM FAILED

**🚨 CRITICAL**: If figma-component-analyst shows 0 tool uses, the entire system has failed and must be fixed immediately.