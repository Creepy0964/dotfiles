# polybar battery module installation

- insert this to your `polybar` config
```bash
[module/battery]
type = internal/battery

label-charging = %percentage%%
label-discharging = %percentage%%
format-charging-prefix = "BAT "
format-discharging-prefix = "BAT "
format-full-prefix = "BAT "
format-low-prefix = "BAT "
format-charging-prefix-foreground = ${colors.bat-ch}
format-discharging-prefix-foreground = ${colors.bat-ch}
format-full-prefix-foreground = ${colors.bat-full}
format-low-prefix-foreground = ${colors.bat-low}

; This is useful in case the battery never reports 100% charge
; Default: 100
full-at = 100

; format-low once this charge percentage is reached
; Default: 10
; New in version 3.6.0
low-at = 15

; Use the following command to list batteries and adapters:
; $ ls -1 /sys/class/power_supply/
battery = BAT0
adapter = ADP1

; If an inotify event haven't been reported in this many
; seconds, manually poll for new values.
;
; Needed as a fallback for systems that don't report events
; on sysfs/procfs.
;
; Disable polling by setting the interval to 0.
;
; Default: 5
poll-interval = 5
```

- insert `battery` keyword in your `modules-right` variable

done. restart `polybar` to apply changes