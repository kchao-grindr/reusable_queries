with n_cleaned as
(
    select device_id 
    from aurora_grindr.reporting.device_assignments_from_log
    where experiment in ('{EXPERIMENT_NAME_iOS}', '{EXPERIMENT_NAME_Android}')
      and ds <= '{MAX_DATE}'
    group by 1
    having count(distinct experiment) = 1 and count(distinct experiment_group) = 1
)
