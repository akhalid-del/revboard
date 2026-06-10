-- ============================================================
-- Add probation tracking to floor_users
-- Run in: Supabase Dashboard > SQL Editor > New query > Run
-- ============================================================

-- Marks a team member as having passed their probation period.
-- Managers toggle this in the People view; a badge then shows in the sidebar.
alter table public.floor_users
  add column if not exists probation_passed boolean default false;
