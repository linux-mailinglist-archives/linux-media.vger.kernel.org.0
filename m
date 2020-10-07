Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C61728648E
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 18:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbgJGQf1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 12:35:27 -0400
Received: from mail-il1-f207.google.com ([209.85.166.207]:43037 "EHLO
        mail-il1-f207.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727033AbgJGQf1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 12:35:27 -0400
Received: by mail-il1-f207.google.com with SMTP id a13so2022504ilb.10
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2020 09:35:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=F9NlrfEi1wBOFRFyq111GrIZEe5I3+u5btu9sLgFEmE=;
        b=Ow6NMKHBWbVa9/hxcuhitpDJA60XshUlsy5n1iGM+6EAWGAFuZ/33XNHTzd+PaPAQ9
         6ai2oVevtHX8RGsEpNjmvPUl0HabpSuZuHSEkgPF4GnCEs4GWLD5q0qDtmOCs3dSBY7e
         pq2DiMlaQtNv+Z73mxy68/1+xfcZkKkj5vhDle0JMmQF13DDdQUcszBewmVuhm1q42Am
         XA+kkmbNXlhRza5xalwoD/FjV4mtFDgXq6OXoGu64AvXgf3tLynfGjvf3NJpf1GwTfZZ
         fkRhHhBEjMe0IxNO1zWMkuswJkpx+QMAYKLlnr7OLw4QZbUplxwm25tRONyB9w7wGAib
         kfCQ==
X-Gm-Message-State: AOAM53141UkrXYMZUwYREnnSJuIqhApHaZx61BCSzDI8+MDMd+sWDnwl
        ZOsHWIgiy5WHhxeZTzLI05sCwLsOqwqBILJVErp/ypmLFVQM
X-Google-Smtp-Source: ABdhPJyb3cL3DtlGdcHFoDjhuILEnf/GGKz7QcL78hhHbi1ipr8JJu2+cOIpFNFS2r6LDuI9lrRxZRq575dFxBb6uIhhqBTKki/m
MIME-Version: 1.0
X-Received: by 2002:a92:7f05:: with SMTP id a5mr3579364ild.112.1602088525767;
 Wed, 07 Oct 2020 09:35:25 -0700 (PDT)
Date:   Wed, 07 Oct 2020 09:35:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007a292205b1174d21@google.com>
Subject: INFO: task hung in mxl5007t_attach
From:   syzbot <syzbot+14d1e5dd1e21dc17ad7e@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, mkrufky@linuxtv.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    9e858682 usbip: vhci_hcd: fix calling usb_hcd_giveback_urb..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=1412b49f900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5429f3643ebc37a
dashboard link: https://syzkaller.appspot.com/bug?extid=14d1e5dd1e21dc17ad7e
compiler:       gcc (GCC) 10.1.0-syz 20200507

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+14d1e5dd1e21dc17ad7e@syzkaller.appspotmail.com

INFO: task kworker/0:1:12 blocked for more than 143 seconds.
      Not tainted 5.9.0-rc8-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/0:1     state:D stack:24960 pid:   12 ppid:     2 flags:0x00004000
Workqueue: usb_hub_wq hub_event
Call Trace:
 context_switch kernel/sched/core.c:3778 [inline]
 __schedule+0x88f/0x1f80 kernel/sched/core.c:4527
 schedule+0xcd/0x2b0 kernel/sched/core.c:4602
 schedule_preempt_disabled+0xc/0x20 kernel/sched/core.c:4661
 __mutex_lock_common kernel/locking/mutex.c:1033 [inline]
 __mutex_lock+0x3e2/0x10a0 kernel/locking/mutex.c:1103
 mxl5007t_attach+0xa4/0x2e0 drivers/media/tuners/mxl5007t.c:852
 au0828_dvb_register+0x451/0x1360 drivers/media/usb/au0828/au0828-dvb.c:597
 au0828_usb_probe+0x56f/0x5d5 drivers/media/usb/au0828/au0828-core.c:738
 usb_probe_interface+0x315/0x7f0 drivers/usb/core/driver.c:396
 really_probe+0x291/0xde0 drivers/base/dd.c:553
 driver_probe_device+0x26b/0x3d0 drivers/base/dd.c:738
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:844
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:431
 __device_attach+0x228/0x4a0 drivers/base/dd.c:912
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0xb51/0x1c70 drivers/base/core.c:2926
 usb_set_configuration+0x1111/0x1880 drivers/usb/core/message.c:2165
 usb_generic_driver_probe+0xba/0xf2 drivers/usb/core/generic.c:240
 usb_probe_device+0xd9/0x2c0 drivers/usb/core/driver.c:293
 really_probe+0x291/0xde0 drivers/base/dd.c:553
 driver_probe_device+0x26b/0x3d0 drivers/base/dd.c:738
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:844
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:431
 __device_attach+0x228/0x4a0 drivers/base/dd.c:912
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0xb51/0x1c70 drivers/base/core.c:2926
 usb_new_device.cold+0x71d/0xfd4 drivers/usb/core/hub.c:2554
 hub_port_connect drivers/usb/core/hub.c:5222 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5362 [inline]
 port_event drivers/usb/core/hub.c:5508 [inline]
 hub_event+0x2348/0x42b0 drivers/usb/core/hub.c:5590
 process_one_work+0x94c/0x15f0 kernel/workqueue.c:2269
 worker_thread+0x64c/0x1120 kernel/workqueue.c:2415
 kthread+0x392/0x470 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294

Showing all locks held in the system:
7 locks held by kworker/0:0/5:
 #0: ffff8881d885a938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
 #0: ffff8881d885a938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: atomic64_set include/asm-generic/atomic-instrumented.h:856 [inline]
 #0: ffff8881d885a938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: atomic_long_set include/asm-generic/atomic-long.h:41 [inline]
 #0: ffff8881d885a938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: set_work_data kernel/workqueue.c:616 [inline]
 #0: ffff8881d885a938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: set_work_pool_and_clear_pending kernel/workqueue.c:643 [inline]
 #0: ffff8881d885a938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x82b/0x15f0 kernel/workqueue.c:2240
 #1: ffff8881da207da8 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x85f/0x15f0 kernel/workqueue.c:2244
 #2: ffff8881d4bdb218 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:785 [inline]
 #2: ffff8881d4bdb218 (&dev->mutex){....}-{3:3}, at: hub_event+0x1c5/0x42b0 drivers/usb/core/hub.c:5536
 #3: ffff8881ce5ff218 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:785 [inline]
 #3: ffff8881ce5ff218 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7a/0x4a0 drivers/base/dd.c:887
 #4: ffff8881cf2bd1a8 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:785 [inline]
 #4: ffff8881cf2bd1a8 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7a/0x4a0 drivers/base/dd.c:887
 #5: ffff8881d099f6d8 (&dev->lock#2){+.+.}-{3:3}, at: au0828_usb_probe+0x195/0x5d5 drivers/media/usb/au0828/au0828-core.c:685
 #6: ffffffff87a66fa8 (mxl5007t_list_mutex){+.+.}-{3:3}, at: mxl5007t_release+0x49/0xf0 drivers/media/tuners/mxl5007t.c:768
7 locks held by kworker/0:1/12:
 #0: ffff8881d885a938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
 #0: ffff8881d885a938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: atomic64_set include/asm-generic/atomic-instrumented.h:856 [inline]
 #0: ffff8881d885a938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: atomic_long_set include/asm-generic/atomic-long.h:41 [inline]
 #0: ffff8881d885a938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: set_work_data kernel/workqueue.c:616 [inline]
 #0: ffff8881d885a938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: set_work_pool_and_clear_pending kernel/workqueue.c:643 [inline]
 #0: ffff8881d885a938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x82b/0x15f0 kernel/workqueue.c:2240
 #1: ffff8881da24fda8 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x85f/0x15f0 kernel/workqueue.c:2244
 #2: ffff8881d44bb218 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:785 [inline]
 #2: ffff8881d44bb218 (&dev->mutex){....}-{3:3}, at: hub_event+0x1c5/0x42b0 drivers/usb/core/hub.c:5536
 #3: ffff8881caa31218 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:785 [inline]
 #3: ffff8881caa31218 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7a/0x4a0 drivers/base/dd.c:887
 #4: ffff8881d8e581a8 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:785 [inline]
 #4: ffff8881d8e581a8 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7a/0x4a0 drivers/base/dd.c:887
 #5: ffff8881c63376d8 (&dev->lock#2){+.+.}-{3:3}, at: au0828_usb_probe+0x195/0x5d5 drivers/media/usb/au0828/au0828-core.c:685
 #6: ffffffff87a66fa8 (mxl5007t_list_mutex){+.+.}-{3:3}, at: mxl5007t_attach+0xa4/0x2e0 drivers/media/tuners/mxl5007t.c:852
6 locks held by kworker/1:0/17:
1 lock held by khungtaskd/23:
 #0: ffffffff87313c20 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x53/0x264 kernel/locking/lockdep.c:5852
1 lock held by in:imklog/244:
7 locks held by kworker/1:5/4297:
 #0: ffff8881d885a938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
 #0: ffff8881d885a938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: atomic64_set include/asm-generic/atomic-instrumented.h:856 [inline]
 #0: ffff8881d885a938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: atomic_long_set include/asm-generic/atomic-long.h:41 [inline]
 #0: ffff8881d885a938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: set_work_data kernel/workqueue.c:616 [inline]
 #0: ffff8881d885a938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: set_work_pool_and_clear_pending kernel/workqueue.c:643 [inline]
 #0: ffff8881d885a938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x82b/0x15f0 kernel/workqueue.c:2240
 #1: ffff8881c5a97da8 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x85f/0x15f0 kernel/workqueue.c:2244
 #2: ffff8881d4503218 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:785 [inline]
 #2: ffff8881d4503218 (&dev->mutex){....}-{3:3}, at: hub_event+0x1c5/0x42b0 drivers/usb/core/hub.c:5536
 #3: ffff8881cccca218 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:785 [inline]
 #3: ffff8881cccca218 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7a/0x4a0 drivers/base/dd.c:887
 #4: ffff8881c91c01a8 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:785 [inline]
 #4: ffff8881c91c01a8 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7a/0x4a0 drivers/base/dd.c:887
 #5: ffff8881c6b1b6d8 (&dev->lock#2){+.+.}-{3:3}, at: au0828_usb_probe+0x195/0x5d5 drivers/media/usb/au0828/au0828-core.c:685
 #6: ffffffff87a66fa8 (mxl5007t_list_mutex){+.+.}-{3:3}, at: mxl5007t_attach+0xa4/0x2e0 drivers/media/tuners/mxl5007t.c:852
11 locks held by kworker/0:2/21590:
6 locks held by kworker/0:7/986:
 #0: ffff8881d885a938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
 #0: ffff8881d885a938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: atomic64_set include/asm-generic/atomic-instrumented.h:856 [inline]
 #0: ffff8881d885a938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: atomic_long_set include/asm-generic/atomic-long.h:41 [inline]
 #0: ffff8881d885a938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: set_work_data kernel/workqueue.c:616 [inline]
 #0: ffff8881d885a938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: set_work_pool_and_clear_pending kernel/workqueue.c:643 [inline]
 #0: ffff8881d885a938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x82b/0x15f0 kernel/workqueue.c:2240
 #1: ffff8881ce037da8 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x85f/0x15f0 kernel/workqueue.c:2244
 #2: ffff8881d4493218 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:785 [inline]
 #2: ffff8881d4493218 (&dev->mutex){....}-{3:3}, at: hub_event+0x1c5/0x42b0 drivers/usb/core/hub.c:5536
 #3: ffff8881d4496580 (&port_dev->status_lock){+.+.}-{3:3}, at: usb_lock_port drivers/usb/core/hub.c:3029 [inline]
 #3: ffff8881d4496580 (&port_dev->status_lock){+.+.}-{3:3}, at: hub_port_connect drivers/usb/core/hub.c:5153 [inline]
 #3: ffff8881d4496580 (&port_dev->status_lock){+.+.}-{3:3}, at: hub_port_connect_change drivers/usb/core/hub.c:5362 [inline]
 #3: ffff8881d4496580 (&port_dev->status_lock){+.+.}-{3:3}, at: port_event drivers/usb/core/hub.c:5508 [inline]
 #3: ffff8881d4496580 (&port_dev->status_lock){+.+.}-{3:3}, at: hub_event+0x216c/0x42b0 drivers/usb/core/hub.c:5590
 #4: ffff8881d4a49268 (hcd->address0_mutex){+.+.}-{3:3}, at: hub_port_init+0x1b6/0x2e40 drivers/usb/core/hub.c:4581
 #5: ffffffff878a8510 (ehci_cf_port_reset_rwsem){.+.+}-{3:3}, at: hub_port_reset+0x199/0x1940 drivers/usb/core/hub.c:2891

=============================================

NMI backtrace for cpu 1
CPU: 1 PID: 23 Comm: khungtaskd Not tainted 5.9.0-rc8-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x107/0x16e lib/dump_stack.c:118
 nmi_cpu_backtrace.cold+0x74/0xb6 lib/nmi_backtrace.c:101
 nmi_trigger_cpumask_backtrace+0x1da/0x1f4 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:146 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:209 [inline]
 watchdog+0xd6a/0xfd0 kernel/hung_task.c:295
 kthread+0x392/0x470 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0 skipped: idling at native_safe_halt arch/x86/include/asm/irqflags.h:60 [inline]
NMI backtrace for cpu 0 skipped: idling at arch_safe_halt arch/x86/include/asm/irqflags.h:103 [inline]
NMI backtrace for cpu 0 skipped: idling at acpi_safe_halt drivers/acpi/processor_idle.c:111 [inline]
NMI backtrace for cpu 0 skipped: idling at acpi_idle_do_entry+0x1c9/0x250 drivers/acpi/processor_idle.c:517


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
