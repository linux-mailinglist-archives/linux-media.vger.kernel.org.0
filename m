Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51D04101F84
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2019 10:10:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725306AbfKSJKB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Nov 2019 04:10:01 -0500
Received: from mail-io1-f71.google.com ([209.85.166.71]:53217 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726836AbfKSJKB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Nov 2019 04:10:01 -0500
Received: by mail-io1-f71.google.com with SMTP id o5so15470445iob.19
        for <linux-media@vger.kernel.org>; Tue, 19 Nov 2019 01:10:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=2U+VP01yGK5GN91C64pS6CJdl5VZIy+xQr07ya4SFr0=;
        b=tmdn5JS7j6cQT8L29MLIkJRJoN7T8L704gAECxAKh7m8xsPHd7LVY/wdcXUcboz5hs
         CoJyAMfS5WNNyw8HFky+Ajv0QWmx1UgSETu2Mn/9Iwh0Htf2MfnI4tWta93cVb/BdZbF
         GWvoD8GV5E2D8BPJS1iLhUglqWVevl7Sq2pUPnu/+oMQgYYH1IEuhm5f5iIOijg6UhDr
         NI1D7YloBlaumg3aczyB9JdMIpqohjb7NYnJmGifeAljZf9UHkztvLSsZ3z2o6eJCE8O
         60I4um9b00zqr3rf5qLPfrQ2h+zZ7nkiom25LPrbZImKF172h7qfsuIJDRQyL2+0rvGd
         Pdow==
X-Gm-Message-State: APjAAAVNYL6jtA4mNQqsNOaWhrwxuDOE+d5Q2HA3q9ubOPNNYVdrMTdi
        drzTHaoZSlRYbmF87KoSajfyUxZoxIhPXJcXgmsl5CKS9j/R
X-Google-Smtp-Source: APXvYqxU97nEhrgWlk9v1WZFrfuMn9DYF11hBF1h9wehGgJYTQF4dADfx/NUlvTBGUY0G/VcCC10y5OJmXZV/R0EJaJ40x4O3t+l
MIME-Version: 1.0
X-Received: by 2002:a92:4804:: with SMTP id v4mr21196914ila.201.1574154600552;
 Tue, 19 Nov 2019 01:10:00 -0800 (PST)
Date:   Tue, 19 Nov 2019 01:10:00 -0800
In-Reply-To: <1574084670.2698.7.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c9a4d50597af6d44@google.com>
Subject: Re: KASAN: use-after-free Read in si470x_int_in_callback (2)
From:   syzbot <syzbot+9ca7a12fd736d93e0232@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, hverkuil@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org, oneukum@suse.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot has tested the proposed patch but the reproducer still triggered  
crash:
KASAN: use-after-free Read in si470x_int_in_callback

radio-si470x 4-1:0.0: non-zero urb status (-71)
==================================================================
BUG: KASAN: use-after-free in si470x_int_in_callback.cold+0x27/0xbe  
drivers/media/radio/si470x/radio-si470x-usb.c:378
Read of size 8 at addr ffff8881d2fceab0 by task kworker/0:2/2107

CPU: 0 PID: 2107 Comm: kworker/0:2 Not tainted 5.4.0-rc3-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  <IRQ>
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description.constprop.0+0x36/0x50 mm/kasan/report.c:374
  __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:506
  kasan_report+0xe/0x20 mm/kasan/common.c:634
  si470x_int_in_callback.cold+0x27/0xbe  
drivers/media/radio/si470x/radio-si470x-usb.c:378
  __usb_hcd_giveback_urb+0x1f2/0x470 drivers/usb/core/hcd.c:1654
  usb_hcd_giveback_urb+0x368/0x420 drivers/usb/core/hcd.c:1719
  dummy_timer+0x120f/0x2fa2 drivers/usb/gadget/udc/dummy_hcd.c:1966
  call_timer_fn+0x179/0x650 kernel/time/timer.c:1404
  expire_timers kernel/time/timer.c:1449 [inline]
  __run_timers kernel/time/timer.c:1773 [inline]
  __run_timers kernel/time/timer.c:1740 [inline]
  run_timer_softirq+0x5e3/0x1490 kernel/time/timer.c:1786
  __do_softirq+0x221/0x912 kernel/softirq.c:292
  invoke_softirq kernel/softirq.c:373 [inline]
  irq_exit+0x178/0x1a0 kernel/softirq.c:413
  exiting_irq arch/x86/include/asm/apic.h:536 [inline]
  smp_apic_timer_interrupt+0x12f/0x500 arch/x86/kernel/apic/apic.c:1137
  apic_timer_interrupt+0xf/0x20 arch/x86/entry/entry_64.S:830
  </IRQ>
RIP: 0010:arch_local_irq_restore arch/x86/include/asm/irqflags.h:85 [inline]
RIP: 0010:console_trylock_spinning kernel/printk/printk.c:1751 [inline]
RIP: 0010:vprintk_emit+0x3cd/0x3e0 kernel/printk/printk.c:1995
Code: 00 83 fb ff 75 d6 e9 db fc ff ff e8 fd 7a 15 00 e8 78 a7 1a 00 41 56  
9d e9 b1 fd ff ff e8 eb 7a 15 00 e8 66 a7 1a 00 41 56 9d <e9> 2a ff ff ff  
0f 1f 40 00 66 2e 0f 1f 84 00 00 00 00 00 55 48 89
RSP: 0018:ffff8881cb01f238 EFLAGS: 00000293 ORIG_RAX: ffffffffffffff13
RAX: 0000000000000007 RBX: 0000000000000200 RCX: 0000000000000006
RDX: 0000000000000000 RSI: ffff8881cbfa08f0 RDI: ffff8881cbfa084c
RBP: ffff8881cb01f280 R08: ffff8881cbfa0000 R09: fffffbfff11b23ae
R10: fffffbfff11b23ad R11: ffffffff88d91d6f R12: 0000000000000034
R13: ffff8881da24e000 R14: 0000000000000293 R15: 0000000000000000
  vprintk_func+0x75/0x113 kernel/printk/printk_safe.c:386
  printk+0xba/0xed kernel/printk/printk.c:2056
  really_probe.cold+0x69/0x1de drivers/base/dd.c:628
  driver_probe_device+0x104/0x210 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
  device_add+0xae6/0x16f0 drivers/base/core.c:2201
  usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
  generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
  usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x104/0x210 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
  device_add+0xae6/0x16f0 drivers/base/core.c:2201
  usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
  hub_port_connect drivers/usb/core/hub.c:5183 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5323 [inline]
  port_event drivers/usb/core/hub.c:5469 [inline]
  hub_event+0x1dd0/0x37e0 drivers/usb/core/hub.c:5551
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Allocated by task 2107:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_kmalloc mm/kasan/common.c:510 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:483
  kmalloc include/linux/slab.h:556 [inline]
  kzalloc include/linux/slab.h:690 [inline]
  si470x_usb_driver_probe+0x51/0xf50  
drivers/media/radio/si470x/radio-si470x-usb.c:573
  usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x104/0x210 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
  device_add+0xae6/0x16f0 drivers/base/core.c:2201
  usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
  generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
  usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x104/0x210 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
  device_add+0xae6/0x16f0 drivers/base/core.c:2201
  usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
  hub_port_connect drivers/usb/core/hub.c:5183 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5323 [inline]
  port_event drivers/usb/core/hub.c:5469 [inline]
  hub_event+0x1dd0/0x37e0 drivers/usb/core/hub.c:5551
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Freed by task 2107:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  kasan_set_free_info mm/kasan/common.c:332 [inline]
  __kasan_slab_free+0x130/0x180 mm/kasan/common.c:471
  slab_free_hook mm/slub.c:1424 [inline]
  slab_free_freelist_hook mm/slub.c:1475 [inline]
  slab_free mm/slub.c:3018 [inline]
  kfree+0xe4/0x320 mm/slub.c:3967
  si470x_usb_driver_probe+0xb27/0xf50  
drivers/media/radio/si470x/radio-si470x-usb.c:766
  usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x104/0x210 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
  device_add+0xae6/0x16f0 drivers/base/core.c:2201
  usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
  generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
  usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x104/0x210 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
  device_add+0xae6/0x16f0 drivers/base/core.c:2201
  usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
  hub_port_connect drivers/usb/core/hub.c:5183 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5323 [inline]
  port_event drivers/usb/core/hub.c:5469 [inline]
  hub_event+0x1dd0/0x37e0 drivers/usb/core/hub.c:5551
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

The buggy address belongs to the object at ffff8881d2fce000
  which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 2736 bytes inside of
  4096-byte region [ffff8881d2fce000, ffff8881d2fcf000)
The buggy address belongs to the page:
page:ffffea00074bf200 refcount:1 mapcount:0 mapping:ffff8881da00c280  
index:0x0 compound_mapcount: 0
flags: 0x200000000010200(slab|head)
raw: 0200000000010200 dead000000000100 dead000000000122 ffff8881da00c280
raw: 0000000000000000 0000000000040004 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881d2fce980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881d2fcea00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ffff8881d2fcea80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                      ^
  ffff8881d2fceb00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881d2fceb80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


Tested on:

commit:         22be26f7 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
console output: https://syzkaller.appspot.com/x/log.txt?x=149ed686e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=387eccb7ac68ec5
dashboard link: https://syzkaller.appspot.com/bug?extid=9ca7a12fd736d93e0232
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1508a25ae00000

