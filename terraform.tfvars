provider_region = "us-west-1"
bucket_remote_state = "imma-remote-state"
context_org = "imma"
context_env = "dev"

az_count = 2

nat_cidrs    = "172.31.0.64/28 172.31.0.80/28"
vpn_cidrs    = "172.31.0.96/28 172.31.0.112/28"
jump_cidrs   = "172.31.0.128/28 172.31.0.144/28"
consul_cidrs = "172.31.0.160/28 172.31.0.176/28"
cache_cidrs  = "172.31.0.192/28 172.31.0.208/28"
