---
title: How Groups Are Applied
nav_order: 3
---

# How groups are applied

An app can be in several groups, and a group can have several rules. You don't set priorities or an order. Clearer follows a few fixed rules, and you can read them top to bottom.

## 1. Always Allowed beats everything

Apps on your [Always Allowed]({{ "/guides/always-allowed-apps/" | relative_url }}) list are never paused or closed by any group.

## 2. Access groups decide first

If an app is in an [access group]({{ "/guides/access-groups/" | relative_url }}), the app has to be open there before anything else matters.

- With one access group: open when the group is open, closed otherwise.
- With several: open when **any** of them is open, closed only when all are closed.

A closed app stays closed. A limit group's allowance and unpause can't open it.

## 3. Limits apply once an app is open

For an open app (or one in no access group), every [limit group]({{ "/guides/limit-groups/" | relative_url }}) rule set that applies right now is checked on its own. **If any of them is pausing the app, it's paused.** A pause beats an allowance, and the strictest rule wins.

An open access group never lifts a limit group's pause. It just stops closing the app.

## The pause screen tells you why

The screen names the group or rule set responsible, for example "Work hours, Social," so you always know what to change.

An unpause only lifts the rule set that offered it. If another rule set is also pausing the app, the screen shows that rule set's options instead.

## Worked example

Say your social apps are in three groups:

- **A**, an access group: open 5 to 9 PM.
- **B**, a limit group: 30 minutes, 6 to 9 PM.
- **C**, a limit group: 60 minutes, 7 AM to noon.

| Time | What happens |
| --- | --- |
| 5 to 6 PM | A is open. B and C don't apply. No restrictions. |
| 6 to 9 PM | A is open, and B's 30-minute allowance applies. Use the apps for 30 minutes, then they're paused. |
| 7 AM to noon | A is closed, so the apps are closed. C's allowance never comes into play. |
| Any other time | A is closed, so the apps are closed. |

To see how a group's day plays out, open an access group and look at its **Today** strip. Settings also has a **How Rules Combine** page that sums this up.

## Good to know

- A group's apps can overlap with another group's. Time in an app counts toward each group's allowance that holds it.
- Clearer warns you when open hours in an access group close part or all of a limit's window. It's a note, never a block on saving.
