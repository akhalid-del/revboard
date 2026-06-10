-- ============================================================
-- Add a team / supervisor field to floor_users so Team Totals can
-- rank directives by the team each member belongs to.
-- Run in: Supabase Dashboard > SQL Editor > New query > Run
-- ============================================================

alter table public.floor_users
  add column if not exists team text;
