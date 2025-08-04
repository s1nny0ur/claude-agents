# Figma Component Builder for Claude Code

This setup package contains specialized AI agents that automate React component creation from Figma designs.

## Installation

1. **Copy to your project:**
   ```bash
   cp -r agents ~/.claude/agents
   cp -r commands ~/.claude/commands
   cp CLAUDE.md .
   cp settings.local.json ~/.claude/
   ```

2. **Or symlink for updates:**
   ```bash
   ln -sf "$(pwd)/agents" ~/.claude/agents
   ln -sf "$(pwd)/commands" ~/.claude/commands
   ln -sf "$(pwd)/settings.local.json" ~/.claude/settings.local.json
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
