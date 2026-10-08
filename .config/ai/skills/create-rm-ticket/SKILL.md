---
name: create-rm-ticket
description: Automates the creation of a Jira ticket on the Release Management board with a linked Pull Request.
user-invocable: true    
---

# Release Management Skill

To release new tag on prod, we need to create Jira ticket in RM board with the Github PR link updating tag versions.

## Logic & Constraints

1. **Board Identification**: Tickets must be created in the "Release Management" project (Key: `RM` — *update this to your actual project key*).
2. **Required Inputs**:
    - Infra PR Github URL: Github PR link. Github PR will update helm charts of different assets.
    - Stacks: Stacks for which the tag is being released to. Can be fetched from GitHub PR.
    - Assignee: Assignee should be Arjun Shivraj
3. **Ticket Structure**:
    - **Summary**: `Release: [version]`
    - **Description**: Include the PR link and a brief summary of changes fetched from the current git log or the PR description. If different types of assets are updated, create table in ticket describing that in detail.

## Automated Workflow
1. **Gather Data**: 
   - If the user doesn't provide a PR link, run `gh pr view --json url` to find it.
   - In the PR
2. **Execute**:
   - Call `jira.create_issue` with the mapped fields.
3. **Verification**:
   - Once created, output the Jira Issue Key and the direct URL for the user.
   - Once created update as many fields as you can of the new ticket.

## Example Usage
- "Create a release ticket for the current PR."
- "Create a Jira ticket for release for this PR."
