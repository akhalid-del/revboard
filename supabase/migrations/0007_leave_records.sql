-- ============================================================
-- Leave tracker — record time off (sick, emergency, annual, half day...)
-- Run in: Supabase Dashboard > SQL Editor > New query > Run
-- ============================================================

create table if not exists public.leave_records (
    id           bigserial primary key,
    member_name  text not null,
    leave_type   text not null,
    start_date   date,
    end_date     date,
    status       text default 'Approved',
    notes        text,
    logged_by    text,
    department   text,
    created_at   timestamptz default now()
);

alter table public.leave_records enable row level security;

drop policy if exists leave_select_dept on public.leave_records;
create policy leave_select_dept on public.leave_records
  for select using (department = public.my_department());

drop policy if exists leave_insert_dept on public.leave_records;
create policy leave_insert_dept on public.leave_records
  for insert with check (department = public.my_department());

drop policy if exists leave_update_dept on public.leave_records;
create policy leave_update_dept on public.leave_records
  for update using (department = public.my_department());

drop policy if exists leave_delete_dept on public.leave_records;
create policy leave_delete_dept on public.leave_records
  for delete using (public.is_manager() and department = public.my_department());
