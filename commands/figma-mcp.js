module.exports = {
  name: 'figma-mcp',
  description: 'Interact with Figma using the unified MCP server',
  async execute({ claude, args }) {
    // Parse command arguments
    const fileKey = args[0];
    const action = args[1] || 'analyze';
    
    if (!fileKey) {
      return claude.sendMessage("Please provide a Figma file key: /figma-mcp [fileKey] [action]");
    }
    
    let prompt;
    switch (action) {
      case 'analyze':
        prompt = `Using the figma MCP server, analyze the Figma file with key "${fileKey}". 
                  Get file details, extract components, and provide insights about the design system.`;
        break;
      case 'components':
        prompt = `Using the figma MCP server, get all components from the Figma file with key "${fileKey}".
                  Analyze their structure and provide detailed information.`;
        break;
      case 'variables':
        prompt = `Using the figma MCP server, extract all variables and design tokens from the Figma file with key "${fileKey}".
                  Analyze their usage and convert them to useful formats.`;
        break;
      case 'tokens':
        prompt = `Using the figma MCP server, extract design tokens from the Figma file with key "${fileKey}"
                  and convert them to CSS variables.`;
        break;
      default:
        prompt = `Using the figma MCP server, ${action} the Figma file with key "${fileKey}".`;
    }
    
    return claude.sendMessage(prompt);
  },
}; 