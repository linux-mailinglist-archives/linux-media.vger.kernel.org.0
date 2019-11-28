Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B09D10C9E4
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2019 14:53:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbfK1NxC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Nov 2019 08:53:02 -0500
Received: from mail-io1-f69.google.com ([209.85.166.69]:34768 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbfK1NxC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Nov 2019 08:53:02 -0500
Received: by mail-io1-f69.google.com with SMTP id a13so18181103iol.1
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2019 05:53:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=HlNtWG4QLHoqNy7xSs6hxWc2ATZTr6pJooFGudGc1j0=;
        b=NKabXMiEbnfDOOnjeMaqcF+ZWIPCV2nwR9k8K8Ur8VedG3G0Tl9gyM3OZWdNeIjn00
         DcURHLkjnxxG4M7CEPRPNoiZX1LC4P1SdzUh6Z6G55BbndBacIIYgHAf6wdSfxsB4wC1
         xWV4OuMh4oWNcNMLMrpUjy+R41GLz8siCbL8AAoCGzouc5qVNrHVpL8WVBmgD8zkih5G
         EJit5PQx7lUevilGS4Sa5vPbsJ5yM60dPhHX3eDfUFmThhqPmiA4+gej4Fs2hpr2hZEm
         NxiSBxmT/DnIGI1CKVUXKUQK1Xl9ZiWrdZhkC661Pf6s7ql6ieulIeqDdDtRknb2biyL
         MTeQ==
X-Gm-Message-State: APjAAAUUkocboY8mCX/jtyk6UayvLzN57I7kln9GGdZ/DJkl6nYE14tC
        nQDKYOpre5vVyAB5XSG6DTCRNEO63D66a6X8OYPSgJur7oR4
X-Google-Smtp-Source: APXvYqxmzCC9oDeVozKl23bF9fkflTFKNISqXLHUSKoTnBgv7WRylx34I3DYJ06Mbkh1hzBiO3e5P/VqByEpL2XN2VX7jqCOYyK+
MIME-Version: 1.0
X-Received: by 2002:a6b:f401:: with SMTP id i1mr33495843iog.241.1574949180646;
 Thu, 28 Nov 2019 05:53:00 -0800 (PST)
Date:   Thu, 28 Nov 2019 05:53:00 -0800
In-Reply-To: <1574939450.21204.7.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000073b7ed0598686e8d@google.com>
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

radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
rcu: INFO: rcu_sched self-detected stall on CPU
rcu: 	1-...!: (1 GPs behind) idle=82a/0/0x3 softirq=3099/3100 fqs=0
	(t=10503 jiffies g=2445 q=28)
rcu: rcu_sched kthread starved for 10505 jiffies! g2445 f0x0  
RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=0
rcu: RCU grace-period kthread stack dump:
rcu_sched       R  running task    29384    10      2 0x80004000
Call Trace:
  schedule+0xca/0x250 kernel/sched/core.c:4136
  schedule_timeout+0x440/0xb20 kernel/time/timer.c:1895
  rcu_gp_fqs_loop kernel/rcu/tree.c:1639 [inline]
  rcu_gp_kthread+0xaff/0x29e0 kernel/rcu/tree.c:1799
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
NMI backtrace for cpu 1
CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.4.0-rc3-syzkaller #0
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
RDX: 0000000000000000 RSI: 0000000000000008 RDI: ffff8881da21384c
RBP: ffff8881d50e0000 R08: ffff8881da213000 R09: fffffbfff11b23b8
R10: fffffbfff11b23b7 R11: ffffffff88d91dbf R12: 0000000000000080
R13: 0000000000000000 R14: dffffc0000000000 R15: ffff8881d2f05b00
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
RIP: 0010:default_idle+0x28/0x2e0 arch/x86/kernel/process.c:581
Code: 90 90 41 56 41 55 65 44 8b 2d f4 20 8f 7a 41 54 55 53 0f 1f 44 00 00  
e8 c6 d2 d0 fb e9 07 00 00 00 0f 00 2d ea c5 4f 00 fb f4 <65> 44 8b 2d d0  
20 8f 7a 0f 1f 44 00 00 5b 5d 41 5c 41 5d 41 5e c3
RSP: 0018:ffff8881da22fdc8 EFLAGS: 00000246 ORIG_RAX: ffffffffffffff13
RAX: 0000000000000007 RBX: ffff8881da213000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000006 RDI: ffff8881da21384c
RBP: ffffed103b442600 R08: ffff8881da213000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000001
R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000000
  cpuidle_idle_call kernel/sched/idle.c:154 [inline]
  do_idle+0x3b6/0x500 kernel/sched/idle.c:263
  cpu_startup_entry+0x14/0x20 kernel/sched/idle.c:355
  start_secondary+0x27d/0x330 arch/x86/kernel/smpboot.c:264
  secondary_startup_64+0xa4/0xb0 arch/x86/kernel/head_64.S:241
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 1-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0
radio-si470x 2-1:0.0: non-zero urb status (-71)
In resubmit code path with result 0


Tested on:

commit:         22be26f7 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
console output: https://syzkaller.appspot.com/x/log.txt?x=10baff5ee00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=387eccb7ac68ec5
dashboard link: https://syzkaller.appspot.com/bug?extid=9ca7a12fd736d93e0232
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=164cd702e00000

