set(src
  gce_metadata.c
  stackdriver_conf.c
  stackdriver.c
  stackdriver_operation.c
  )

FLB_PLUGIN(out_stackdriver "${src}" "")
