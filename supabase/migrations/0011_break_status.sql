-- Quick "who's on break" status for the People tab.
alter table public.floor_users add column if not exists on_break boolean default false;
alter table public.floor_users add column if not exists break_since timestamptz;
