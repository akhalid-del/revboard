-- ============================================================
-- Remove the Quality (QA) module — the app is now a floor operations
-- tracker for floor managers, and QA is no longer part of it.
-- Run in: Supabase Dashboard > SQL Editor > New query > Run
--
-- WARNING: this permanently deletes all QA cases. There is no undo.
-- ============================================================

drop table if exists public.qa_cases cascade;
