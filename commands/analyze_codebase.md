# Analyze Codebase Readiness

You are tasked with analyzing the software project to determine its current status, readiness for deployment, and any remaining development work. Follow these steps carefully to provide a comprehensive assessment:

    1. Generate a directory tree to understand the project structure:
    - Execute the command: find . -type f -not -path "*/node_modules/*" -not -path "*/.git/*" | sort
    - Analyze the directory structure to understand the organization of the codebase
    - Note any new files or directories since the last analysis (if status report exists)

    2. Review the provided project materials:

    <project_codebase>
    $INCLUDE_CODEBASE
    </project_codebase>

    <requirements_doc>
    $REQUIREMENTS
    </requirements_doc>

    <status_report>
    $STATUS_REPORT
    </status_report>

    3. Analyze the provided documents, focusing on the requirements, feature requests, and any existing status reports. If these documents are not available or are incomplete, you will need to analyze the codebase thoroughly.

    4. Follow this step-by-step process:
    - a. Examine the requirements document and status report (if available).
    - b. If a feature or task list exists, use it as a basis for your analysis.
    - c. If no feature or task list exists, analyze the codebase to create a feature checklist.
    - d. For each feature or component, estimate its percentage of completion.
    - e. Run an end-to-end full coverage test to identify issues, code smells, and refactoring opportunities.
    - f. Based on your analysis. Assess the overall progress of the project.
    - g. Identify what's missing or incomplete in the current state of the project.

    5. If you need to create a feature checklist, follow these steps:
    - a. Analyze the project structure and main components.
    - b. Identify key features and functionalities.
    - c. List these features and estimate their completion percentage.
    - d. Note any missing or incomplete features.

    6. Conduct an end-to-end full coverage test:
    - a. Identify and list any bugs or issues found.
    - b. Note any code smells or areas that need refactoring.
    - c. Assess the overall code quality and test coverage.

    7. Based on your analysis, prepare a comprehensive project status report that includes:
    - a. Overall project status (percentage complete, readiness for deployment)
    - b. Feature checklist with completion percentages 
    - c. Identified issues, bugs, and areas needing improvement 
    - d. Recommendations for next steps or areas of focus
    - e. Assessment of whether the project is ready for deployment

    8. Present your findings in a clear, structured format. Use your first-principle thinking to ensure your assessment is thorough and well-reasoned.

Your final output should be the creation of the following files in the .context/ directory if they do not exist. If files exist, update them:

1. Overall Project Status: overall_project_status.md
2. Feature Checklist and Completion Percentages: feature_checklist.md
3. Identified Issues and Areas for Improvement: identified_issues.md
4. Recommendations: recommendations.md
5. Deployment Readiness Assessment: deployment_readiness.md
6. Project Structure: project_structure.md (include the directory tree and highlight any new files since last analysis)

Ensure that your report is comprehensive, well-reasoned, and based on the analysis of the provided materials. Do not include any of your internal thought processes or the step-by-step analysis in the final output. Focus on presenting a clear, concise, and actionable project status report.