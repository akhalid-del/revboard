-- Enable realtime so role/profile changes broadcast to the affected user's
-- live session (promotions take effect without re-logging in).
alter publication supabase_realtime add table public.floor_users;
