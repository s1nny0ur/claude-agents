# Setup and Usage Guide for Claude Sub-Agent Commands

This guide explains how to install and use these powerful sub-agent commands with Claude.

## Prerequisites

- Claude Desktop application installed
- Access to your user home directory
- Basic command line knowledge

## Installation

### 1. Locate Your Claude Commands Directory

The Claude commands directory is located at:
- **macOS/Linux**: `~/.claude/commands/`
- **Windows**: `%USERPROFILE%\.claude\commands\`

### 2. Create the Commands Directory (if it doesn't exist)

```bash
# macOS/Linux
mkdir -p ~/.claude/commands

# Windows (PowerShell)
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.claude\commands"
```

### 3. Copy Command Files

#### Option A: Direct Download (Recommended)

```bash
# macOS/Linux
cd ~/.claude/commands
curl -O https://raw.githubusercontent.com/derek-opdee/subagent-example-script/main/sub-agent-tech-debt-finder-fixer.md
curl -O https://raw.githubusercontent.com/derek-opdee/subagent-example-script/main/sub-agent-architecture-reviewer.md
curl -O https://raw.githubusercontent.com/derek-opdee/subagent-example-script/main/sub-agent-test-generator.md
curl -O https://raw.githubusercontent.com/derek-opdee/subagent-example-script/main/sub-agent-performance-optimizer.md
curl -O https://raw.githubusercontent.com/derek-opdee/subagent-example-script/main/sub-agent-migration-assistant.md
curl -O https://raw.githubusercontent.com/derek-opdee/subagent-example-script/main/sub-agent-refactor.md
curl -O https://raw.githubusercontent.com/derek-opdee/subagent-example-script/main/sub-agent-new-feature.md
```

#### Option B: Clone and Copy

```bash
# Clone the repository
git clone https://github.com/derek-opdee/subagent-example-script.git
cd subagent-example-script

# Copy to Claude commands directory (macOS/Linux)
cp *.md ~/.claude/commands/

# Copy to Claude commands directory (Windows PowerShell)
Copy-Item *.md "$env:USERPROFILE\.claude\commands\"
```

#### Option C: Manual Copy

1. Download each `.md` file from the repository
2. Place them in your `~/.claude/commands/` directory

### 4. Verify Installation

```bash
# List installed commands (macOS/Linux)
ls -la ~/.claude/commands/

# List installed commands (Windows PowerShell)
Get-ChildItem "$env:USERPROFILE\.claude\commands"
```

You should see:
- `sub-agent-tech-debt-finder-fixer.md`
- `sub-agent-architecture-reviewer.md`
- `sub-agent-test-generator.md`
- `sub-agent-performance-optimizer.md`
- `sub-agent-migration-assistant.md`
- `sub-agent-refactor.md`
- `sub-agent-new-feature.md`

## Usage

Once installed, you can use these commands in any Claude conversation by typing the command name or its aliases.

### 1. Tech Debt Finder & Fixer

Find and fix technical debt in your codebase:

```bash
# Full command
sub-agent-tech-debt-finder-fixer src/

# Using alias
@tech-debt-finder-fixer src/

# Shortest alias
@satdff src/ --dry-run

# Examples
@tech-debt-finder-fixer --auto-fix safe --fix-order quick-wins
@satdff src/components --type duplicates --threshold aggressive
```

### 2. Architecture Reviewer

Review and visualize your system architecture:

```bash
# Full command
sub-agent-architecture-reviewer

# Using aliases
@architecture-review src/
@arch-review --detect-violations --suggest-improvements
@saar --style hexagonal --visualize

# Examples
@arch-review . --rules .architecture-rules.yaml
@saar src/ --output mermaid --depth deep
```

### 3. Test Generator

Generate comprehensive test suites:

```bash
# Full command
sub-agent-test-generator src/services/

# Using aliases
@test-gen src/ --only-untested
@test-generator --coverage-target 90
@satg --type e2e --from-flows

# Examples
@test-gen src/utils/ --update-existing --edge-cases
@satg src/api/ --framework jest --mock-strategy realistic
```

### 4. Performance Optimizer

Optimize application performance:

```bash
# Full command
sub-agent-performance-optimizer

# Using aliases
@perf-optimize --target frontend
@performance src/ --bundle-analysis
@sapo --target database --suggest-indexes

# Examples
@perf-optimize . --baseline perf-baseline.json
@sapo wp-content/ --target wordpress --cache-strategy
```

### 5. Migration Assistant

Assist with framework and library migrations:

```bash
# Full command
sub-agent-migration-assistant --from react@17 --to react@18

# Using aliases
@migrate --from laravel@8 --to laravel@10
@migration-assistant --pattern class-to-hooks
@sama --from mysql@5.7 --to mysql@8.0

# Examples
@migrate --pattern class-to-hooks src/components/ --safe-mode
@sama --from php@7.4 --to php@8.2 --dry-run
```

### 6. Refactor Command

Intelligently refactor code while preserving functionality:

```bash
# Full command
sub-agent-refactor src/components/Dashboard.tsx

# Using aliases
@refactor src/services/ --type extract-method
@sar src/ --max-file-size 200 --interactive

# Examples
@refactor src/utils/ --type consolidate-utils --create-shared
@sar "src/**/*.tsx" --type extract-component --dry-run
```

### 7. New Feature Builder

Build new features by learning from existing code:

```bash
# Full command
sub-agent-new-feature --feature "user profile card" --location src/components/

# Using aliases
@new-feature --feature "CSV export API" --location app/Http/Controllers/
@sanf --feature "real-time chat" --location src/features/ --type full-stack

# Examples
@new-feature --feature "data table with sorting" --location src/components/ --example-files "src/components/UserTable.tsx"
@sanf --feature "image optimization worker" --location functions/ --tech-stack cloudflare
```

## How Commands Work

### Command Structure

Each command follows this pattern:
```
command-name [target] [options]
```

- **command-name**: The full command name or alias
- **target**: Directory, file, or pattern to analyze (optional, defaults to current directory)
- **options**: Command-specific flags and parameters

### Common Options

Most commands support these options:
- `--dry-run` - Preview what would be changed without modifying files
- `--interactive` - Review each change before applying (usually default)
- `--auto-fix` - Automatically apply safe fixes
- `--backup` - Create backup files before changes (usually default)
- `--test-command` - Custom command to run tests
- `--max-changes` - Limit number of changes per run

### Sub-Agent Orchestration

These commands use multiple specialized AI agents working in parallel:

1. **Analysis Phase**: Multiple agents analyze different aspects simultaneously
2. **Synthesis Phase**: Results are combined into actionable insights
3. **Planning Phase**: A comprehensive plan is created with priorities
4. **Implementation Phase**: Specialized agents execute approved changes
5. **Verification Phase**: Changes are tested and validated

## Best Practices

### 1. Start with Dry Runs
Always run commands with `--dry-run` first to preview changes:
```bash
@tech-debt-finder-fixer --dry-run
```

### 2. Use Interactive Mode
Review changes before applying them:
```bash
@tech-debt-finder-fixer --interactive
```

### 3. Work on Small Scopes
Start with specific directories rather than entire codebases:
```bash
@tech-debt-finder-fixer src/components/ --type duplicates
```

### 4. Have Good Test Coverage
Ensure you have tests before major refactoring:
```bash
@test-gen src/ --coverage-target 80
```

### 5. Create Backups
Most commands create backups by default, but you can ensure it:
```bash
@tech-debt-finder-fixer --backup
```

## Configuration

### Project-Specific Configuration

Create configuration files in your project root:

#### `.techdebtignore`
```
# Ignore patterns for tech debt analysis
vendor/
node_modules/
*.min.js
*.generated.ts
legacy/
```

#### `.architecture-rules.yaml`
```yaml
rules:
  layers:
    - name: Presentation
      allowedDependencies: [Application]
      forbidden: [Infrastructure]
  complexity:
    maxComponentDependencies: 7
    maxLayerDepth: 4
```

#### `.performance.config.js`
```javascript
module.exports = {
  targets: {
    pageLoad: 3000,
    timeToInteractive: 5000,
    apiResponse: 200
  }
};
```

## Troubleshooting

### Commands Not Found

If Claude doesn't recognize the commands:

1. **Check Installation Path**:
   ```bash
   ls ~/.claude/commands/
   ```

2. **Restart Claude**: Close and reopen the Claude desktop app

3. **Check File Names**: Ensure files end with `.md` extension

4. **Verify Permissions**: Files should be readable
   ```bash
   chmod 644 ~/.claude/commands/*.md
   ```

### Commands Not Working as Expected

1. **Check Target Path**: Ensure you're in the correct directory
2. **Verify Options**: Use `--help` or check command documentation
3. **Review Error Messages**: Claude will provide specific error details
4. **Try Smaller Scope**: Test on a single file first

### Performance Issues

1. **Limit Scope**: Work on smaller directories
2. **Use Specific Types**: Focus on one type of issue at a time
3. **Adjust Max Changes**: Use `--max-changes 5` to limit work

## Examples for Common Scenarios

### Clean Up a React Project
```bash
# 1. Find tech debt
@tech-debt-finder-fixer src/ --dry-run

# 2. Fix duplicates first
@satdff src/ --type duplicates --auto-fix safe

# 3. Generate missing tests
@test-gen src/ --only-untested --coverage-target 80

# 4. Optimize performance
@perf-optimize src/ --target frontend --bundle-analysis
```

### Prepare for Framework Migration
```bash
# 1. Review current architecture
@arch-review src/ --detect-violations

# 2. Clean up tech debt
@tech-debt-finder-fixer src/ --fix-order quick-wins

# 3. Plan migration
@migrate --from react@17 --to react@18 --dry-run

# 4. Execute migration
@migrate --from react@17 --to react@18 --incremental
```

### Improve Code Quality
```bash
# 1. Find all issues
@tech-debt-finder-fixer --type all

# 2. Fix patterns
@satdff --type patterns --auto-fix safe

# 3. Add tests
@test-gen --type unit --edge-cases

# 4. Review architecture
@arch-review --suggest-improvements
```

## Advanced Usage

### Combining Commands
Run multiple commands in sequence for comprehensive improvements:

```bash
# Complete code quality improvement workflow
@tech-debt-finder-fixer --fix-order quick-wins && \
@test-gen --only-untested && \
@arch-review --detect-violations && \
@perf-optimize --target all
```

### Custom Test Commands
Specify project-specific test commands:

```bash
@tech-debt-finder-fixer --test-command "npm run test:unit && npm run lint"
@test-gen --test-command "composer test"
```

### CI/CD Integration
Add to your CI pipeline:

```yaml
code-quality:
  script:
    - claude run @tech-debt-finder-fixer --dry-run
    - claude run @arch-review --detect-violations
```

## Support and Contributions

- **Repository**: https://github.com/derek-opdee/subagent-example-script
- **Issues**: Report bugs or request features via GitHub Issues
- **Contributing**: PRs welcome for improvements and new commands

## License

These commands are provided as examples for Claude sub-agent orchestration patterns.