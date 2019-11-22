Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18512106A3E
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2019 11:33:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727887AbfKVKdH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Nov 2019 05:33:07 -0500
Received: from mail-il1-f197.google.com ([209.85.166.197]:33596 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727861AbfKVKdD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Nov 2019 05:33:03 -0500
Received: by mail-il1-f197.google.com with SMTP id s14so5698705ila.0
        for <linux-media@vger.kernel.org>; Fri, 22 Nov 2019 02:33:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=rhYDm+zochRcMNdTm5jb0yCTb8qYLiR5nZayvXZYJEU=;
        b=lQJrU/eE7zXZLOQRDclyyUCmJsc83KYJt+RUa4kIKA6kDLhm4fFSR1+9zbs3ZODPoG
         ozaylne9/kc/2xOznWogbKnuYn9gvew+yz5Llh9YwOUQ5KhI2PlPBnU3TWpW6NYDpftC
         7WEzJa/b4sdo8lkD/fvaM+QPEWfKuZWCP8mpeuOK55RFtEQ7+cVTrnl5a8fUJy6TYCgt
         GDeAWWIv6WgPifRVBwbIHKyhQKxVR++VvfNqxLOVoe32VGlMe5E72vFkWwuI4PnihPkL
         cmmnGM5AnxtmNVQadIu1FXf8dWC5pllTMNJKmdILDtP96l30uABoX2pVeW/GQml7ivad
         1vuw==
X-Gm-Message-State: APjAAAVHe0OriRgArYeAQOdWIIEu9tEjicdNqJAKPOaq7IQMQgFhZjGN
        JVRNp7ohY1FGkXaLqlsqQGKIBv5TsGOjWQc1YoHPBWL2OY7k
X-Google-Smtp-Source: APXvYqy7sQm8PbBUwtS/ukFd+yV2n2R7QPeGzm2D97/L795lSTd1k3wRc9YkvviTgko2ApkWIn24MAtVHQKuh3bZCrHjhdEkDLOO
MIME-Version: 1.0
X-Received: by 2002:a6b:6d05:: with SMTP id a5mr12725122iod.133.1574418781132;
 Fri, 22 Nov 2019 02:33:01 -0800 (PST)
Date:   Fri, 22 Nov 2019 02:33:01 -0800
In-Reply-To: <1574337654.29504.0.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002d684a0597ecf0b5@google.com>
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
INFO: rcu detected stall in dummy_timer

radio-si470x 1-1:0.0: non-zero urb status (-71)
radio-si470x 4-1:0.0: non-zero urb status (-71)
radio-si470x 3-1:0.0: non-zero urb status (-71)
rcu: INFO: rcu_sched self-detected stall on CPU
rcu: 	1-...!: (8177 ticks this GP) idle=78e/1/0x4000000000000004  
softirq=3439/3439 fqs=0
	(t=10502 jiffies g=2653 q=23)
rcu: rcu_sched kthread starved for 10504 jiffies! g2653 f0x0  
RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=0
rcu: RCU grace-period kthread stack dump:
rcu_sched       R  running task    29744    10      2 0x80004000
Call Trace:
  schedule+0xca/0x250 kernel/sched/core.c:4136
  schedule_timeout+0x440/0xb20 kernel/time/timer.c:1895
  rcu_gp_fqs_loop kernel/rcu/tree.c:1639 [inline]
  rcu_gp_kthread+0xaff/0x29e0 kernel/rcu/tree.c:1799
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
NMI backtrace for cpu 1
CPU: 1 PID: 1737 Comm: kworker/1:3 Not tainted 5.4.0-rc3-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  <IRQ>
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  nmi_cpu_backtrace.cold+0x55/0x96 lib/nmi_backtrace.c:101
  nmi_trigger_cpumask_backtrace+0x1b0/0x1c7 lib/nmi_backtrace.c:62
  trigger_single_cpu_backtrace include/linux/nmi.h:164 [inline]
  rcu_dump_cpu_stacks+0x169/0x1b3 kernel/rcu/tree_stall.h:254
  print_cpu_stall kernel/rcu/tree_stall.h:455 [inline]
  check_cpu_stall kernel/rcu/tree_stall.h:529 [inline]
  rcu_pending kernel/rcu/tree.c:2795 [inline]
  rcu_sched_clock_irq.cold+0x4da/0x936 kernel/rcu/tree.c:2244
  update_process_times+0x25/0x60 kernel/time/timer.c:1726
  tick_sched_handle+0x9b/0x180 kernel/time/tick-sched.c:167
  tick_sched_timer+0x42/0x130 kernel/time/tick-sched.c:1299
  __run_hrtimer kernel/time/hrtimer.c:1514 [inline]
  __hrtimer_run_queues+0x303/0xc60 kernel/time/hrtimer.c:1576
  hrtimer_interrupt+0x2e8/0x730 kernel/time/hrtimer.c:1638
  local_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1110 [inline]
  smp_apic_timer_interrupt+0xf5/0x500 arch/x86/kernel/apic/apic.c:1135
  apic_timer_interrupt+0xf/0x20 arch/x86/entry/entry_64.S:830
RIP: 0010:arch_local_irq_restore arch/x86/include/asm/irqflags.h:85 [inline]
RIP: 0010:__raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:160  
[inline]
RIP: 0010:_raw_spin_unlock_irqrestore+0x40/0x50  
kernel/locking/spinlock.c:191
Code: e8 95 14 b3 fb 48 89 ef e8 6d f3 b3 fb f6 c7 02 75 11 53 9d e8 61 ba  
d0 fb 65 ff 0d a2 67 8f 7a 5b 5d c3 e8 02 be d0 fb 53 9d <eb> ed 0f 1f 40  
00 66 2e 0f 1f 84 00 00 00 00 00 55 48 89 fd 65 ff
RSP: 0018:ffff8881db309b08 EFLAGS: 00000206 ORIG_RAX: ffffffffffffff13
RAX: 0000000000000007 RBX: 0000000000000206 RCX: 0000000000000002
RDX: 0000000000000000 RSI: 0000000000000008 RDI: ffff8881d065084c
RBP: ffff8881d50f4000 R08: ffff8881d0650000 R09: fffffbfff11b23b8
R10: fffffbfff11b23b7 R11: ffffffff88d91dbf R12: 0000000000000080
R13: 0000000000000000 R14: dffffc0000000000 R15: ffff8881d46bcd00
  spin_unlock_irqrestore include/linux/spinlock.h:393 [inline]
  dummy_timer+0x131b/0x2fa2 drivers/usb/gadget/udc/dummy_hcd.c:1980
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
RIP: 0010:console_unlock+0xb4f/0xc40 kernel/printk/printk.c:2477
Code: 32 fe ff ff e8 a2 ae 15 00 48 8b bc 24 80 00 00 00 e8 b5 dd ff ff e9  
29 fb ff ff e8 8b ae 15 00 e8 06 db 1a 00 ff 74 24 30 9d <e9> 15 fb ff ff  
e8 67 f0 3c 00 e9 de f6 ff ff e8 6d f0 3c 00 e9 98
RSP: 0018:ffff8881c06beda0 EFLAGS: 00000293 ORIG_RAX: ffffffffffffff13
RAX: 0000000000000007 RBX: 0000000000000200 RCX: 0000000000000006
RDX: 0000000000000000 RSI: ffff8881d06508f0 RDI: ffff8881d065084c
RBP: 0000000000000001 R08: ffff8881d0650000 R09: fffffbfff11b23ae
R10: fffffbfff11b23ad R11: ffffffff88d91d6f R12: 0000000000000047
R13: dffffc0000000000 R14: ffffffff8293f390 R15: ffffffff87077070
  vprintk_emit+0x171/0x3e0 kernel/printk/printk.c:1996
  dev_vprintk_emit+0x4fc/0x541 drivers/base/core.c:3312
  dev_printk_emit+0xba/0xf1 drivers/base/core.c:3323
  __dev_printk+0x1db/0x203 drivers/base/core.c:3335
  _dev_warn+0xd7/0x109 drivers/base/core.c:3379
  si470x_set_report.isra.0.constprop.0.cold+0x32/0x41  
drivers/media/radio/si470x/radio-si470x-usb.c:234
  si470x_set_register+0x11c/0x180  
drivers/media/radio/si470x/radio-si470x-usb.c:269
  si470x_start+0x72/0x2bf  
drivers/media/radio/si470x/radio-si470x-common.c:374
  si470x_start_usb+0x507/0x53d  
drivers/media/radio/si470x/radio-si470x-usb.c:549
  si470x_usb_driver_probe.cold+0x6e5/0x8b2  
drivers/media/radio/si470x/radio-si470x-usb.c:737
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
radio-si470x 1-1:0.0: non-zero urb status (-71)
radio-si470x 4-1:0.0: non-zero urb status (-71)
radio-si470x 3-1:0.0: non-zero urb status (-71)
radio-si470x 4-1:0.0: non-zero urb status (-71)
radio-si470x 1-1:0.0: non-zero urb status (-71)
radio-si470x 3-1:0.0: non-zero urb status (-71)
radio-si470x 3-1:0.0: non-zero urb status (-71)
radio-si470x 1-1:0.0: non-zero urb status (-71)
radio-si470x 4-1:0.0: non-zero urb status (-71)
radio-si470x 1-1:0.0: non-zero urb status (-71)
radio-si470x 3-1:0.0: non-zero urb status (-71)
radio-si470x 4-1:0.0: non-zero urb status (-71)
radio-si470x 1-1:0.0: non-zero urb status (-71)
radio-si470x 1-1:0.0: non-zero urb status (-71)
radio-si470x 1-1:0.0: non-zero urb status (-71)
radio-si470x 1-1:0.0: non-zero urb status (-71)
radio-si470x 6-1:0.0: non-zero urb status (-71)
radio-si470x 1-1:0.0: non-zero urb status (-71)
radio-si470x 6-1:0.0: non-zero urb status (-71)
radio-si470x 1-1:0.0: non-zero urb status (-71)
radio-si470x 6-1:0.0: non-zero urb status (-71)
radio-si470x 2-1:0.0: non-zero urb status (-71)
radio-si470x 5-1:0.0: non-zero urb status (-71)
radio-si470x 5-1:0.0: non-zero urb status (-71)
radio-si470x 2-1:0.0: non-zero urb status (-71)
radio-si470x 5-1:0.0: non-zero urb status (-71)
radio-si470x 5-1:0.0: non-zero urb status (-71)
radio-si470x 2-1:0.0: non-zero urb status (-71)
radio-si470x 5-1:0.0: non-zero urb status (-71)
radio-si470x 2-1:0.0: non-zero urb status (-71)
radio-si470x 5-1:0.0: non-zero urb status (-71)
radio-si470x 2-1:0.0: non-zero urb status (-71)
radio-si470x 4-1:0.0: non-zero urb status (-71)
radio-si470x 6-1:0.0: non-zero urb status (-71)
radio-si470x 6-1:0.0: non-zero urb status (-71)


Tested on:

commit:         22be26f7 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
console output: https://syzkaller.appspot.com/x/log.txt?x=11821c22e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=387eccb7ac68ec5
dashboard link: https://syzkaller.appspot.com/bug?extid=9ca7a12fd736d93e0232
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12ae33ace00000

