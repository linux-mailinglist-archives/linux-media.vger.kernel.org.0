Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D592010B341
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2019 17:30:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727095AbfK0QaD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Nov 2019 11:30:03 -0500
Received: from mail-il1-f199.google.com ([209.85.166.199]:33228 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726909AbfK0QaD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Nov 2019 11:30:03 -0500
Received: by mail-il1-f199.google.com with SMTP id s14so19856212ila.0
        for <linux-media@vger.kernel.org>; Wed, 27 Nov 2019 08:30:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=/v0Hc4dmadTjmLQ47Pq0iPN4XeBjrXjDm/J4YGW+vXM=;
        b=RbYXoI88+CQ4pjQoh8zwO0oL73o08+X5PIttl7b60H8kNXpD22mS+pR5UBVurhMKz8
         UF3Qp5Lr5QryU3uIs6aK1uDYX8y0dLx0ivVJKHtYgbXKGGeg2MbwWNK9IV0cHzA1XlY+
         4uOV0C7qqgihm3+ixxrNskUNow/zYj86Iej8MuBP5sJmle0hmFZJ0f10eVADIClbPDcg
         v9qR6O8oaICPEuvLQWd9E76nD1SRhVlk1UTk18kLTXGNck6lpJra5DFwxi1QVtH8j9IJ
         3B9BnLNWJUqank0kS+TVH70ypz+hMQgtJGZfV1P7ZJBzVWEvzxmjt5T4LKxv8TU8K5kz
         Cv6A==
X-Gm-Message-State: APjAAAUEFisoytgHwKlCbyX8gWJ1ZOiQdnQ76S3HDnoP4f5rzYNamF+0
        a9hoGN0N1tJZ6pdu2ccwu465TsvuB8LGshL4Te6avB6tmZL/
X-Google-Smtp-Source: APXvYqweiOhb0X7bKUsqOaVzESnajjnOfo+XaUTkk4+XLeHQemnaAqH5FKDJ/G/9YTevZc0kIqEuRJ3DGFhDxDJdKs6N0HCqqrzC
MIME-Version: 1.0
X-Received: by 2002:a92:906:: with SMTP id y6mr7675093ilg.157.1574872201158;
 Wed, 27 Nov 2019 08:30:01 -0800 (PST)
Date:   Wed, 27 Nov 2019 08:30:01 -0800
In-Reply-To: <1574850465.2485.10.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001dec4905985682c9@google.com>
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

radio-si470x 5-1:0.0: non-zero urb status (-71)
radio-si470x 3-1:0.0: non-zero urb status (-71)
rcu: INFO: rcu_sched self-detected stall on CPU
rcu: 	1-....: (8213 ticks this GP) idle=4f6/1/0x4000000000000004  
softirq=3368/3368 fqs=3
	(t=10501 jiffies g=2713 q=134)
NMI backtrace for cpu 1
CPU: 1 PID: 1853 Comm: syz-executor.2 Not tainted 5.4.0-rc3-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
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
RDX: 0000000000000000 RSI: 0000000000000008 RDI: ffff8881ce7fb84c
RBP: ffff8881d50f0000 R08: ffff8881ce7fb000 R09: fffffbfff11b23b8
R10: fffffbfff11b23b7 R11: ffffffff88d91dbf R12: 0000000000000080
R13: 0000000000000000 R14: dffffc0000000000 R15: ffff8881c6617500
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
RIP: 0010:__raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:160  
[inline]
RIP: 0010:_raw_spin_unlock_irqrestore+0x40/0x50  
kernel/locking/spinlock.c:191
Code: e8 95 14 b3 fb 48 89 ef e8 6d f3 b3 fb f6 c7 02 75 11 53 9d e8 61 ba  
d0 fb 65 ff 0d a2 67 8f 7a 5b 5d c3 e8 02 be d0 fb 53 9d <eb> ed 0f 1f 40  
00 66 2e 0f 1f 84 00 00 00 00 00 55 48 89 fd 65 ff
RSP: 0018:ffff8881cd477ba8 EFLAGS: 00000246 ORIG_RAX: ffffffffffffff13
RAX: 0000000000000007 RBX: 0000000000000246 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000006 RDI: ffff8881ce7fb84c
RBP: ffff8881db325b00 R08: ffff8881ce7fb000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: dffffc0000000000
R13: ffff8881db325b80 R14: 0000000000000000 R15: ffff8881db325b00
  unlock_hrtimer_base kernel/time/hrtimer.c:898 [inline]
  hrtimer_start_range_ns+0x5bf/0xb00 kernel/time/hrtimer.c:1133
  hrtimer_start_expires include/linux/hrtimer.h:435 [inline]
  hrtimer_sleeper_start_expires kernel/time/hrtimer.c:1792 [inline]
  do_nanosleep+0x1b9/0x650 kernel/time/hrtimer.c:1868
  hrtimer_nanosleep+0x249/0x4f0 kernel/time/hrtimer.c:1924
  __do_sys_nanosleep kernel/time/hrtimer.c:1958 [inline]
  __se_sys_nanosleep kernel/time/hrtimer.c:1945 [inline]
  __x64_sys_nanosleep+0x19d/0x220 kernel/time/hrtimer.c:1945
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x457f00
Code: c0 5b 5d c3 66 0f 1f 44 00 00 8b 04 24 48 83 c4 18 5b 5d c3 66 0f 1f  
44 00 00 83 3d 51 e8 61 00 00 75 14 b8 23 00 00 00 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 24 d3 fb ff c3 48 83 ec 08 e8 ea 46 00 00
RSP: 002b:00007ffe6aaf7d48 EFLAGS: 00000246 ORIG_RAX: 0000000000000023
RAX: ffffffffffffffda RBX: 000000000000961f RCX: 0000000000457f00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00007ffe6aaf7d50
RBP: 0000000000000004 R08: 0000000000000001 R09: 0000000002432940
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000003
R13: 00007ffe6aaf7da0 R14: 0000000000008efa R15: 00007ffe6aaf7db0
radio-si470x 1-1:0.0: non-zero urb status (-71)
radio-si470x 5-1:0.0: non-zero urb status (-71)
radio-si470x 3-1:0.0: non-zero urb status (-71)
radio-si470x 4-1:0.0: non-zero urb status (-71)
radio-si470x 1-1:0.0: non-zero urb status (-71)
radio-si470x 2-1:0.0: non-zero urb status (-71)
radio-si470x 6-1:0.0: non-zero urb status (-71)
radio-si470x 6-1:0.0: non-zero urb status (-71)
radio-si470x 2-1:0.0: non-zero urb status (-71)


Tested on:

commit:         22be26f7 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
console output: https://syzkaller.appspot.com/x/log.txt?x=177ca17ae00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=387eccb7ac68ec5
dashboard link: https://syzkaller.appspot.com/bug?extid=9ca7a12fd736d93e0232
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1226e536e00000

