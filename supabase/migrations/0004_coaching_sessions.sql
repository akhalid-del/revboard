-- ============================================================
-- Coaching sessions log (floor managers record coaching conversations)
-- Run in: Supabase Dashboard > SQL Editor > New query > Run
-- ============================================================

create table if not exists public.coaching_sessions (
    id            bigserial primary key,
    agent_name    text not null,
    session_date  date,
    topic         text,
    notes         text,
    coached_by    text,
    department    text,
    created_at    timestamptz default now()
);

alter table public.coaching_sessions enable row level security;

-- Department-scoped policies (same pattern as the other tables).
drop policy if exists coaching_select_dept on public.coaching_sessions;
create policy coaching_select_dept on public.coaching_sessions
  for select using (department = public.my_department());

drop policy if exists coaching_insert_dept on public.coaching_sessions;
create policy coaching_insert_dept on public.coaching_sessions
  for insert with check (department = public.my_department());

drop policy if exists coaching_update_dept on public.coaching_sessions;
create policy coaching_update_dept on public.coaching_sessions
  for update using (department = public.my_department());

drop policy if exists coaching_delete_dept on public.coaching_sessions;
create policy coaching_delete_dept on public.coaching_sessions
  for delete using (public.is_manager() and department = public.my_department());
