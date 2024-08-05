Return-Path: <linux-media+bounces-15770-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A35CD947803
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 11:11:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DEE82816CB
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 09:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0B714F104;
	Mon,  5 Aug 2024 09:11:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEEF145327
	for <linux-media@vger.kernel.org>; Mon,  5 Aug 2024 09:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722849090; cv=none; b=G6SAFDl1CCI/GcwPpv9htPdEzX3vbzbfc6o5G/5PM6/+ywV8SqUgr+x7w76dHepJIiuwjrgq2XSXo486A6DZceoMQO/wVcSZlYcVOZRymJp5mEac6WPgWZFO9VGhanjlkX615nB3qJswC0D+3OcAfoH3V8VJQO2eJ3f3DcI8yeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722849090; c=relaxed/simple;
	bh=i73UzJ6691G8Sj0dxb5ALka2bgR6uDeR68nP48DJsB0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=J3AWpDSqNMH4X/z4cGMUrkDG8S2/U6xmhi3qKyJu0ZGFA6u3MkySkIMk+8nRSz9hSZOyDnYVi89LrJb0lapJaZCptTpPiN9fm+mJPDkg5SweC4Xo3aVJjjoKYgCllAFN+cKgrg6UhN4VpphKSv3bjrQHHx9nzfUdFKSRausStTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-81f93601444so1522686239f.2
        for <linux-media@vger.kernel.org>; Mon, 05 Aug 2024 02:11:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722849085; x=1723453885;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GDscbgvz0CAMP81wAmAjnZFOm7JZE3jcuxdWGDDGkk0=;
        b=XyNYe5hfM2ROZiQqqDZFzntdtgJk+RXncS8kGlNIph6hXLgdxLKV8mS4pm+9Nu2Vnv
         ZXpVlN9L/uOo2J9+OmFsJFdbmTIdMjL8RI3lusPg4aB48D1i4WH3e/PFcUP0W2Ibw4uY
         0afofJlmG+pdUsr58iwZFpf62x9QHa9SeaSjoYKJcFT+dGl0DtDdwKKQlq/uY+Phux/C
         JSgOrCA/vYTY/EHiKutq6+YjDXZiicxTHgNLMls0SOCVgUrU9bU9Noq/gRSHZTy9jh+/
         rDlywI4/qUv4TJfnDBsD12pFLHl2QtN6fAqxBbAPIq8i4GW+BQgO6IdckZwkFuq8HMQ1
         VY8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVq9HDpIpk1kQ6Oy/ybOyiDTF/pUv/L64CE+pXU0i+a8kSHZq7CZFnpy100bpkr2Jr3ydYQj21G8uQltJqvRObLuj/uMn2zKroMXn8=
X-Gm-Message-State: AOJu0Yw+hHF4L6gkn1LG9rSMbcSendI5jaDgNwoIjdZ7AocESSysw9I6
	U4tAw0lRaLmEoSO9Q2kJ8KwUsQmhE9p7IyhEWP9iPlpXpitryVQwCUBMLHl+mpagFrLLwRMKRw1
	cyBr2wHTwe3M5seYPBP/t6W420ud0zxC3+v4+NWsuQM2+a6u4igwPmIU=
X-Google-Smtp-Source: AGHT+IFCQ+LIHL6yFVBcG99P+/iG5OYoVgu4E1i04csmkFjMImAKXN18Px5eqqyQHQMGmD2iqrfSuSoltyUcXON9rfNRU2XKemmt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:6292:b0:4c2:8e08:f588 with SMTP id
 8926c6da1cb9f-4c8d55b8099mr686876173.2.1722849085622; Mon, 05 Aug 2024
 02:11:25 -0700 (PDT)
Date: Mon, 05 Aug 2024 02:11:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c0158e061eec0fa2@google.com>
Subject: [syzbot] [media?] INFO: rcu detected stall in dvb_usb_read_remote_control
 (2)
From: syzbot <syzbot+01926e7756f51c12b6a3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d483f034f032 usb: dwc2: Skip clock gating on Broadcom SoCs
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=13350e55980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=10d86428d89226d6
dashboard link: https://syzkaller.appspot.com/bug?extid=01926e7756f51c12b6a3
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/eac676eb0054/disk-d483f034.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/808e4e198fc6/vmlinux-d483f034.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ed3a89b45e61/bzImage-d483f034.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+01926e7756f51c12b6a3@syzkaller.appspotmail.com

rcu: INFO: rcu_preempt detected expedited stalls on CPUs/tasks: {
 1-....
 } 2637 jiffies s: 9465 root: 0x2/.
rcu: blocking rcu_node structures (internal RCU debug):
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 4959 Comm: kworker/1:4 Not tainted 6.11.0-rc1-syzkaller-00012-gd483f034f032 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/27/2024
Workqueue: events dvb_usb_read_remote_control
RIP: 0010:___update_load_sum kernel/sched/pelt.c:190 [inline]
RIP: 0010:__update_load_avg_cfs_rq+0xc9/0x940 kernel/sched/pelt.c:322
Code: e8 48 b8 00 00 00 00 00 fc ff df 48 8d bb 80 00 00 00 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 95 06 00 00 48 8b 93 80 00 00 00 <4c> 89 e0 48 29 d0 0f 88 b1 02 00 00 49 89 c6 49 c1 ee 0a 4d 85 f6
RSP: 0018:ffffc900001b8c30 EFLAGS: 00000046
RAX: dffffc0000000000 RBX: ffff8881f633d800 RCX: ffffffff812b8845
RDX: 000000e61628f800 RSI: ffff8881f633d800 RDI: ffff8881f633d880
RBP: 00000000000172b9 R08: 0000000000000000 R09: fffffbfff1464b9b
R10: ffffffff8a325cdf R11: 0000000000000000 R12: 000000e616904a2d
R13: 0000000000000007 R14: 0000000000000000 R15: ffff888103af1d80
FS:  0000000000000000(0000) GS:ffff8881f6300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000021000000 CR3: 0000000008aa0000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <NMI>
 </NMI>
 <IRQ>
 update_cfs_rq_load_avg kernel/sched/fair.c:4633 [inline]
 update_load_avg+0x158/0x1f70 kernel/sched/fair.c:4746
 entity_tick kernel/sched/fair.c:5519 [inline]
 task_tick_fair+0xab/0x3e0 kernel/sched/fair.c:12686
 sched_tick+0x163/0x2d0 kernel/sched/core.c:5466
 update_process_times+0x199/0x220 kernel/time/timer.c:2490
 tick_sched_handle kernel/time/tick-sched.c:276 [inline]
 tick_nohz_handler+0x376/0x530 kernel/time/tick-sched.c:297
 __run_hrtimer kernel/time/hrtimer.c:1689 [inline]
 __hrtimer_run_queues+0x657/0xcc0 kernel/time/hrtimer.c:1753
 hrtimer_interrupt+0x31b/0x800 kernel/time/hrtimer.c:1815
 local_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1032 [inline]
 __sysvec_apic_timer_interrupt+0x10f/0x450 arch/x86/kernel/apic/apic.c:1049
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1043 [inline]
 sysvec_apic_timer_interrupt+0x8b/0xb0 arch/x86/kernel/apic/apic.c:1043
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:console_trylock_spinning kernel/printk/printk.c:2010 [inline]
RIP: 0010:vprintk_emit kernel/printk/printk.c:2347 [inline]
RIP: 0010:vprintk_emit+0x4c2/0x5a0 kernel/printk/printk.c:2303
Code: 00 4d 85 e4 0f 85 8e 00 00 00 e8 39 e7 1e 00 9c 5b 81 e3 00 02 00 00 31 ff 48 89 de e8 57 e2 1e 00 48 85 db 0f 85 9a 00 00 00 <e8> 19 e7 1e 00 45 31 c9 41 b8 01 00 00 00 31 c9 48 8d 05 00 00 00
RSP: 0018:ffffc900021bfb78 EFLAGS: 00000293
RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffffffff81347dfc
RDX: ffff888103af1d00 RSI: ffffffff81347e06 RDI: 0000000000000007
RBP: 000000000000003e R08: 0000000000000007 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000200
R13: ffff8881016b1d00 R14: ffffffff87c42000 R15: ffffc900021bfbf8
 vprintk+0x7f/0xa0 kernel/printk/printk_safe.c:45
 _printk+0xc8/0x100 kernel/printk/printk.c:2373
 dvb_usb_read_remote_control+0x174/0x1c0 drivers/media/usb/dvb-usb/dvb-usb-remote.c:263
 process_one_work+0x9c5/0x1b40 kernel/workqueue.c:3231
 process_scheduled_works kernel/workqueue.c:3312 [inline]
 worker_thread+0x6c8/0xf20 kernel/workqueue.c:3390
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status -71
yealink 4-1:36.0: unexpected response 0
yealink 4-1:36.0: urb_ctl_callback - urb status -71
yealink 4-1:36.0: urb_irq_callback - urb status

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

