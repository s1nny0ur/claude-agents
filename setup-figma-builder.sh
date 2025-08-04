#!/bin/bash

# Figma Builder Setup Script
# This script creates a setup.claude/ directory with all necessary files
# for the Figma component creation system

set -e  # Exit on error

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 Setting up Figma Builder System for Claude Code${NC}"
echo ""

# Create setup directory structure
echo -e "${YELLOW}Creating setup.claude directory structure...${NC}"
mkdir -p setup.claude/agents/builder
mkdir -p setup.claude/agents/specialized/react
mkdir -p setup.claude/agents/universal
mkdir -p setup.claude/commands
mkdir -p setup.claude/docs

# Copy builder agents
echo -e "${YELLOW}Copying builder agents...${NC}"
cp agents/builder/figma-component-analyst.md setup.claude/agents/builder/
cp agents/builder/shadcn-ui-expert.md setup.claude/agents/builder/
cp agents/builder/component-discovery-specialist.md setup.claude/agents/builder/
cp agents/builder/design-token-specialist.md setup.claude/agents/builder/

# Copy supporting agents
echo -e "${YELLOW}Copying supporting agents...${NC}"
cp agents/specialized/react/react-component-architect.md setup.claude/agents/specialized/react/
cp agents/universal/tailwind-css-expert.md setup.claude/agents/universal/

# Copy command
echo -e "${YELLOW}Copying Figma commands...${NC}"
cp commands/create_component_from_figma.md setup.claude/commands/

# Copy original COMPONENT_SYSTEM_GUIDE as reference
echo -e "${YELLOW}Copying reference documentation...${NC}"
cp COMPONENT_SYSTEM_GUIDE.md setup.claude/docs/

# Copy settings.local.json for MCP permissions
echo -e "${YELLOW}Copying MCP settings...${NC}"
cp settings.local.json setup.claude/

# Create specialized CLAUDE.md
echo -e "${YELLOW}Creating specialized CLAUDE.md for Figma Builder...${NC}"
cat > setup.claude/CLAUDE.md << 'EOF'
# CLAUDE.md - Figma Component Builder Configuration

This file provides guidance to Claude Code (claude.ai/code) when working with Figma component creation in this repository.

## Project Overview

This project uses the Figma Component Builder system - a specialized set of AI agents that automate the creation of React components from Figma designs. The system ensures:

- Zero component duplication
- Automatic shadcn/ui component installation
- Design token fidelity with fs-* typography utilities
- Clean, reusable component architecture

## Figma Builder Workflow

When creating components from Figma designs, Claude Code follows this systematic workflow:

### 1. Command Invocation

Use the command: `/create_component_from_figma [FIGMA_NODE_ID or FIGMA_LINK]`

### 2. Agent Orchestration

The main Claude agent coordinates these specialized builder agents in sequence:

1. **figma-component-analyst**
   - Extracts component structure using MCP tools
   - Identifies sub-components and design tokens
   - Returns structured analysis

2. **component-discovery-specialist**
   - Checks for existing components
   - Prevents duplication
   - Provides import paths

3. **shadcn-ui-expert**
   - Automatically installs missing shadcn components
   - No manual installation required
   - Prepares customization plans

4. **design-token-specialist**
   - Verifies fs-* typography utilities
   - Validates color and spacing tokens
   - Flags missing tokens

5. **react-component-architect** + **tailwind-css-expert**
   - Creates final component implementation
   - Applies all design tokens
   - Ensures accessibility and responsiveness

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
interface ComponentProps {
  property1?: 'Default' | 'Mobile'; // Match Figma variants exactly
  className?: string;
  children?: ReactNode;
}
```

### Quality Gates

Before any component is considered complete:
- [ ] No component duplication (verified by discovery specialist)
- [ ] All shadcn components installed (handled by shadcn expert)
- [ ] Design tokens applied (verified by token specialist)
- [ ] Semantic props added for reusability
- [ ] Zero inline styles

## Available Builder Agents

| Agent | Purpose | Key Capability |
|-------|---------|----------------|
| figma-component-analyst | Figma analysis | MCP tool usage, token extraction |
| shadcn-ui-expert | UI library management | Automatic component installation |
| component-discovery-specialist | Duplication prevention | Component search and reuse |
| design-token-specialist | Token verification | fs-* utility validation |

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

---

Generated by Figma Builder Setup
Last Updated: $(date)
EOF

# Create README for setup
echo -e "${YELLOW}Creating setup README...${NC}"
cat > setup.claude/README.md << 'EOF'
# Figma Component Builder for Claude Code

This setup package contains specialized AI agents that automate React component creation from Figma designs.

## Installation

1. **Copy to your project:**
   ```bash
   cp -r agents ~/.claude/agents
   cp -r commands ~/.claude/commands
   cp CLAUDE.md .
   ```

2. **Or symlink for updates:**
   ```bash
   ln -sf "$(pwd)/agents" ~/.claude/agents
   ln -sf "$(pwd)/commands" ~/.claude/commands
   ```

3. **Verify installation:**
   ```bash
   claude /agents | grep builder
   ```

## Usage

### Basic Component Creation
```bash
claude /create_component_from_figma https://www.figma.com/file/xxx?node-id=123
```

### With Specific Node ID
```bash
claude /create_component_from_figma node-123456
```

## Features

- ✅ **Automatic shadcn Installation** - No manual component setup
- ✅ **Zero Duplication** - Discovers and reuses existing components
- ✅ **Design Token Fidelity** - Exact Figma typography with fs-* utilities
- ✅ **Smart Orchestration** - Agents work in perfect sequence

## Agent Workflow

1. **Figma Analysis** → Extract structure and tokens
2. **Component Discovery** → Check for existing implementations
3. **shadcn Management** → Auto-install missing components
4. **Token Verification** → Ensure all design tokens exist
5. **Component Creation** → Build with all requirements met

## Requirements

- Claude Code CLI with active subscription
- Project with:
  - React + TypeScript
  - Tailwind CSS
  - shadcn/ui setup (`shadcn.json`)
  - Figma MCP server configured

## Troubleshooting

**Q: shadcn components not installing?**
A: Ensure `pnpm` is installed and `shadcn.json` exists

**Q: fs-* classes not found?**
A: Run `pnpm run script:tokens` to generate typography utilities

**Q: Component already exists error?**
A: The discovery specialist found an existing component - check the import path provided

## Support

For issues or improvements, please contribute to the main claude-agents repository.
EOF

# Create a quick test file
echo -e "${YELLOW}Creating test file...${NC}"
cat > setup.claude/test-figma-builder.md << 'EOF'
# Test Figma Builder System

Run these commands to verify the setup:

## 1. Check Agent Installation
```bash
claude /agents | grep -E "figma-component-analyst|shadcn-ui-expert|component-discovery|design-token"
```

## 2. Test Figma Analysis (requires Figma MCP)
```bash
claude "use @figma-component-analyst to analyze this Figma component: [YOUR_FIGMA_NODE_ID]"
```

## 3. Test Component Discovery
```bash
claude "use @component-discovery-specialist to check if we have a Button component"
```

## 4. Test shadcn Installation
```bash
claude "use @shadcn-ui-expert to check what shadcn components are installed"
```

## 5. Full Workflow Test
```bash
claude "/create_component_from_figma [YOUR_FIGMA_LINK]"
```

Expected results:
- All agents should be found
- Agents should return structured responses
- shadcn expert should offer to install missing components
- Full workflow should coordinate all agents smoothly
EOF

echo ""
echo -e "${GREEN}✅ Setup complete!${NC}"
echo ""
echo -e "${BLUE}📁 Files created in setup.claude/:${NC}"
echo "   • agents/builder/ (4 specialized agents)"
echo "   • agents/specialized/react/react-component-architect.md"
echo "   • agents/universal/tailwind-css-expert.md"
echo "   • commands/create_component_from_figma.md"
echo "   • CLAUDE.md (customized for Figma builder)"
echo "   • README.md (installation guide)"
echo "   • test-figma-builder.md (verification steps)"
echo ""
echo -e "${YELLOW}📋 Next steps:${NC}"
echo "1. cd setup.claude"
echo "2. Copy to your target project"
echo "3. Follow README.md for installation"
echo ""
echo -e "${GREEN}Happy building! 🚀${NC}"