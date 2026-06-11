create table if not exists public.headsets (
    id bigint generated always as identity primary key,
    department text not null,
    slot_key text not null,
    label text not null,
    count integer not null default 0,
    updated_at timestamptz default now(),
    unique (department, slot_key)
);

alter table public.headsets enable row level security;

create policy "Users can manage their department headsets"
    on public.headsets for all
    using (true)
    with check (true);
