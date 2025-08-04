# Test Figma Builder System

🚨 **CRITICAL**: Test anti-fabrication protocols to ensure MCP tool usage

Run these commands to verify the setup and anti-fabrication measures:

## 1. Check Agent Installation
```bash
claude /agents | grep -E "figma-component-analyst|shadcn-ui-expert|component-discovery|design-token"
```

## 2. Verify Anti-Fabrication Protocol
```bash
claude "use @figma-component-analyst to analyze this Figma component: [YOUR_FIGMA_NODE_ID]"
```

**Expected Result**: Agent MUST include:
- ✅ Raw MCP tool output
- ✅ Exact text extraction (not paraphrased)
- ✅ Visual reference image
- ✅ Anti-fabrication checklist completed

**⚠️ FAILURE SIGNS**:
- No raw MCP output shown
- Generic/placeholder text like "Stay in the Loop"
- Analysis without calling actual MCP tools
- Paraphrased or "improved" content

## 3. Test Cross-Validation
```bash
claude "/cross_validate_figma_analysis"
```

**Expected Result**: Should validate figma-component-analyst output against requirements

## 4. Test Component Discovery
```bash
claude "use @component-discovery-specialist to check if we have a Button component"
```

## 5. Test shadcn Installation
```bash
claude "use @shadcn-ui-expert to check what shadcn components are installed"
```

## 6. Full Anti-Fabrication Workflow Test
```bash
claude "/create_component_from_figma [YOUR_FIGMA_LINK]"
```

**Expected Anti-Fabrication Behavior**:

### Phase 1: figma-component-analyst
- ✅ Must call actual MCP tools (get_image, get_code, get_variable_defs)
- ✅ Must include raw MCP output for verification
- ✅ Must extract exact text content (no paraphrasing)
- ❌ FAILS if no MCP tools called
- ❌ FAILS if content appears fabricated

### Phase 2: Cross-Validation Gate
- ✅ Main agent validates figma-component-analyst output
- ✅ Checks for raw MCP output presence
- ✅ Verifies exact text extraction
- ❌ STOPS workflow if validation fails

### Phase 3: react-component-architect
- ✅ Must use exact text from figma-component-analyst
- ✅ Must include source comment with Figma node ID
- ✅ Must reference Figma visual for layout
- ❌ FAILS if text content differs from analysis
- ❌ FAILS if placeholder content used

## 7. Fabrication Detection Test

**Intentionally trigger fabrication detection**:
```bash
claude "Create a newsletter signup component without using Figma data"
```

**Expected Result**: Agent should refuse or request actual Figma analysis first

## Quality Assurance Checklist

### ✅ Agent Functionality
- [ ] figma-component-analyst includes MCP verification section
- [ ] react-component-architect has content fidelity requirements
- [ ] Cross-validation commands available
- [ ] All agents refuse fabrication

### ✅ Content Fidelity
- [ ] All text matches Figma exactly (no creative interpretation)
- [ ] No placeholder or marketing copy
- [ ] Source comments include Figma node ID
- [ ] Visual references included for verification

### ✅ Quality Gates
- [ ] MCP tool verification mandatory
- [ ] Raw output inclusion required
- [ ] Cross-validation prevents fabricated data flow
- [ ] Component fails if any gate fails

## Troubleshooting

### If Agents Still Fabricate:
1. Check agent files have anti-fabrication protocol
2. Verify CLAUDE.md has mandatory verification steps
3. Test MCP server connection
4. Re-run setup script to ensure latest versions

### If MCP Tools Fail:
1. Check Figma MCP server is running
2. Verify API access token
3. Test simple MCP commands first
4. Review Claude Code MCP configuration

**🚨 SYSTEM FAILURE**: If any agent creates content without MCP tools, the entire system has failed and must be fixed immediately.