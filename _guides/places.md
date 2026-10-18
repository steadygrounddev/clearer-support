---
title: Places
nav_order: 6
---

# Places

A place is somewhere you want Clearer to recognize, like home, work or the gym. Use places in a [limit group]({{ "/guides/limit-groups/" | relative_url }}) (a **Location** rule set) or an [access group]({{ "/guides/access-groups/" | relative_url }}) (a **Places** rule).

## Add a place

1. Open **Settings**, then **Places**, and tap **Add**.
2. Choose what kind of place it is, then search or drop a pin on the map.
3. Set the radius. A bigger radius notices you sooner. Very small places can take longer to notice. The default is 150 m, and iOS doesn't reliably watch anything under 100 m.

Places are shared. Create one and use it in any group.

## Use a place in a rule

- In a **limit group**, a Location rule applies while you're at one of the chosen places. Choose **everywhere except** to apply it anywhere outside them.
- In an **access group**, a Places rule opens the group while you're at one of the chosen places. With **anywhere except**, it opens the group while you're away from all of them.

## Privacy

Places stay on your device. Clearer checks whether you're at a place, never where you are.

## Location access

For Places to work, Clearer needs location access set to **Always**, so it can notice when you arrive or leave. iOS asks twice: first **While Using**, then **Always**. If you don't allow Always:

- a limit group's Location rule stops applying, and
- an access group sets the Places rule aside, so it never closes your apps without being sure. The group shows an amber note with a link to Settings.

## When a place can't be checked

Clearer sets a place aside if it hasn't read it yet, if iOS can't watch it, or if you've gone over iOS's limit of 20 watched places in total. Being inside any place you named settles a rule either way.

## Deleting a place

The place disappears from the rules that used it. A Places rule left with no place isn't applied, and the confirmation says so before you delete.

## Good to know

- iOS can deliver arrivals and departures a little late, from seconds to a few minutes.
- After you save a new place, Clearer may take a little while to notice you're already inside it.
