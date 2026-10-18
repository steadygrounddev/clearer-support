---
title: Access Groups
nav_order: 1
---

# Access groups

A [limit group]({{ "/guides/limit-groups/" | relative_url }}) says when apps are restricted. An access group turns that around: it says when apps are **available at all**. The rest of the time they're closed.

Some ways to use one:

- Work apps open only on weekdays from 9 to 5, or only at the office, so evenings and weekends stay yours.
- Social apps open only in the evening.
- A game that's open only on weekends.

## Create an access group

1. Open the **Access** tab and tap **Add**.
2. Name the group and choose its apps.
3. Under **Open when**, add one or more rules.

## Open when: access rules

| Rule | The group is open |
| --- | --- |
| **Hours** | On the weekdays you choose, between a start and end time. A window can run past midnight, for example 9 PM to 1 AM. |
| **Focus** | While a Focus you've set up for it is on. See [Focus filters]({{ "/guides/focus-filters/" | relative_url }}). A group can have one Focus rule. |
| **Places** | While you're at one of the places you choose, or, with "anywhere except", while you're away from all of them. See [Places]({{ "/guides/places/" | relative_url }}). |

A group is **open when any one of its rules holds** and **closed** otherwise. A Places rule and an Hours rule in the same group means "at the office, or weekdays 9 to 5". There's no "all day" rule, since that would never close, and no allowance or unpause. Time budgets belong to limit groups.

## What you see

Each card says where the group stands: "Open until 5:00 PM," "Closed, opens at 5:00 PM," or "Closed until you're at Gym." On a group's page, a **Today** strip shows the day as open, open with a limit, and closed. It draws Hours rules and limits only, and its caption says when Focus or place rules could also open the apps.

When you open a closed app, the screen tells you when it opens. There's no unpause for a closed group. You set it up on purpose, and editing the group is the way out. Editing can break your [streak]({{ "/guides/streaks/" | relative_url }}); Clearer warns you first.

## Apps in more than one access group

An app is open whenever **any** access group that holds it is open. It's closed only when every one of them is closed.

## Combining with limit groups

Access comes first. A closed access group wins over everything, including a limit group's allowance. An open access group doesn't lift a limit group's pause; it only stops closing the app. See [How groups are applied]({{ "/guides/how-groups-are-applied/" | relative_url }}).

## When a rule can't be checked

Clearer never closes your apps because it's unsure. A rule it can't check is set aside, as if it weren't there. That happens when:

- a Places rule has no place chosen yet,
- Clearer doesn't have **Always** location access,
- a place hasn't been read yet, or iOS can't watch it.

A group with no rule it can check stays open until you set one up. Its card says so in amber, and when location access is the problem it links to Settings.

## Good to know

- If iOS is slow to tell Clearer a window has started, an access group's apps can stay closed a little longer than they should. Opening Clearer fixes it.
- Always Allowed apps are never closed by an access group. See [Always Allowed apps]({{ "/guides/always-allowed-apps/" | relative_url }}).
