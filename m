Return-Path: <linux-media+bounces-15747-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BE0946A1A
	for <lists+linux-media@lfdr.de>; Sat,  3 Aug 2024 16:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84A4FB212B9
	for <lists+linux-media@lfdr.de>; Sat,  3 Aug 2024 14:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D780C1514E1;
	Sat,  3 Aug 2024 14:35:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E5714F131
	for <linux-media@vger.kernel.org>; Sat,  3 Aug 2024 14:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722695704; cv=none; b=QOiYtkpdJuEUhZFFizM3I7rKSLtXM9T90JJKZlLo0470qScJXmh3FYax1Hv91F80nOPHVA8tEqQug5KKmISuSo/rzG4IEqPPC8VO0Seki1CDzKDTHp468rTdP4ZgG131shPGpNDyqq8h7a/pXeJqYK6DfEWfVmwMCf559grEz0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722695704; c=relaxed/simple;
	bh=JdgWNwwiTe5pPyMF4mkDnhwO5n2QhFjDyFPKOvNQe2g=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=GMh05RF87tTrRm3gpGrYlpMqKe5y3+62ZigeSq8Mv9tDQrO7i2Vb0bOLZnTvhzJZADcgmvX0LuMbbh6MJofLP8slPODwxsU4MulYnFQlXXyN483Fbtgm7t9L07pcTTsc4uo3ZWifw6s4Lzqn6dYX5X1+2sSbF2fmSrCc6gdWxnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-397052a7bcbso136868395ab.2
        for <linux-media@vger.kernel.org>; Sat, 03 Aug 2024 07:35:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722695702; x=1723300502;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pOX7iDSsj97sBQqRzELz1L0sHB1XuQ4x6QXvQoIlTxs=;
        b=XQw8mv39LYrXT67EPWwWXhM9rktpMLQLJ3Rmi384+31RBYz7RaByZ1+7NgpUMNixJK
         83hoWxovQzwMgvUtRcUXXZFMSSzNViU/DUkkBiNeXP3GbMfJd86Ikb3vwIJaClDqVBwd
         m/aQew4GdxHWK0e7wHD2vpwo522/J54dAYab6O9vjaM84lxJiOJrJDUkoeWGrTlXINTx
         cvxaLtLjxMcC426HJ3eJOoXjWg+iLd63XxPd429Pt6HV9MIqmULttb1OkY79hrj2ZAOw
         p8ehj3+59THUj5nS5+YPJoiEQ65lsEpep3En7D6NaQxsv2iCq5rLKTMw5G1e1VpCusnP
         HT1w==
X-Forwarded-Encrypted: i=1; AJvYcCW8U9SVDTQHrUitSiTVBwavb4hfxi7YXVPOpnfhC3NVK1fPfC/8/TYrcnms7EXGpI9ydduGIKlfl4seZ4ZUwZVbMBZB33OBSrT35h0=
X-Gm-Message-State: AOJu0YzniDTmeh8QsYtPrKgr5V8398LBLxOqsjzuPHjhrF2FOR22ibk2
	ilhkQCng3897eOPMrj8IQJRUsZnqmbsmcE7G83BdVDYixbAXBHsapnDw7YLWdntdP0vQQwApPyH
	epiyW0+Y3O1mi8crfwPBOguKxX5B/tFR4tBrvAZqneFLFtaOPFt/HKGg=
X-Google-Smtp-Source: AGHT+IEk2tIEEFHEggOlrrgxjV9YPLsnZVfo3UKqoRwpR10rgQWMHhfYsP4sGAf0lYmYzNHK4O/0g5lyk2u3x5Peo5xHcLO358LD
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1b0f:b0:382:6a83:f4fc with SMTP id
 e9e14a558f8ab-39b1fc65098mr5205775ab.5.1722695702131; Sat, 03 Aug 2024
 07:35:02 -0700 (PDT)
Date: Sat, 03 Aug 2024 07:35:02 -0700
In-Reply-To: <20240803142426.d8uduX0h@linutronix.de>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000061c8a0061ec859b5@google.com>
Subject: Re: [syzbot] [staging?] [usb?] WARNING in r8712_usb_write_mem/usb_submit_urb
 (2)
From: syzbot <syzbot+ca2eaaadab55de6a5a42@syzkaller.appspotmail.com>
To: florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, 
	namcao@linutronix.de, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
INFO: task hung in r871xu_dev_remove

INFO: task kworker/1:1:28 blocked for more than 143 seconds.
      Not tainted 6.6.44-syzkaller-g721391060066-dirty #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/1:1     state:D stack:27456 pid:28    ppid:2      flags:0x00004000
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5380 [inline]
 __schedule+0xca5/0x30d0 kernel/sched/core.c:6698
 schedule+0xe7/0x1b0 kernel/sched/core.c:6772
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6831
 __mutex_lock_common kernel/locking/mutex.c:679 [inline]
 __mutex_lock+0x5bd/0x9d0 kernel/locking/mutex.c:747
 unregister_netdev+0x12/0x30 net/core/dev.c:11102
 r871xu_dev_remove+0x291/0x480 drivers/staging/rtl8712/usb_intf.c:596
 usb_unbind_interface+0x1e0/0x8d0 drivers/usb/core/driver.c:458
 device_remove drivers/base/dd.c:569 [inline]
 device_remove+0x122/0x170 drivers/base/dd.c:561
 __device_release_driver drivers/base/dd.c:1272 [inline]
 device_release_driver_internal+0x44a/0x610 drivers/base/dd.c:1295
 bus_remove_device+0x22f/0x420 drivers/base/bus.c:574
 device_del+0x39d/0xa60 drivers/base/core.c:3838
 usb_disable_device+0x36c/0x7f0 drivers/usb/core/message.c:1416
 usb_disconnect+0x2e1/0x890 drivers/usb/core/hub.c:2276
 hub_port_connect drivers/usb/core/hub.c:5329 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5629 [inline]
 port_event drivers/usb/core/hub.c:5789 [inline]
 hub_event+0x1be4/0x4f50 drivers/usb/core/hub.c:5871
 process_one_work+0x889/0x15e0 kernel/workqueue.c:2631
 process_scheduled_works kernel/workqueue.c:2704 [inline]
 worker_thread+0x8b9/0x12a0 kernel/workqueue.c:2785
 kthread+0x2c6/0x3b0 kernel/kthread.c:388
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1b/0x30 arch/x86/entry/entry_64.S:293
 </TASK>

Showing all locks held in the system:
3 locks held by kworker/0:1/9:
 #0: ffff888109ba9138 ((wq_completion)ipv6_addrconf){+.+.}-{0:0}, at: process_one_work+0x789/0x15e0 kernel/workqueue.c:2606
 #1: ffffc9000009fd80 ((work_completion)(&(&net->ipv6.addr_chk_work)->work)){+.+.}-{0:0}, at: process_one_work+0x7eb/0x15e0 kernel/workqueue.c:2607
 #2: ffffffff89ad6da8 (rtnl_mutex){+.+.}-{3:3}, at: addrconf_verify_work+0x12/0x30 net/ipv6/addrconf.c:4684
6 locks held by kworker/1:1/28:
 #0: ffff88810a64fd38 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x789/0x15e0 kernel/workqueue.c:2606
 #1: ffffc900001e7d80 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x7eb/0x15e0 kernel/workqueue.c:2607
 #2: ffff888104f2b190 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:992 [inline]
 #2: ffff888104f2b190 (&dev->mutex){....}-{3:3}, at: hub_event+0x1be/0x4f50 drivers/usb/core/hub.c:5817
 #3: ffff888114cd9190 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:992 [inline]
 #3: ffff888114cd9190 (&dev->mutex){....}-{3:3}, at: usb_disconnect+0x10a/0x890 drivers/usb/core/hub.c:2267
 #4: ffff888100f5b160 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:992 [inline]
 #4: ffff888100f5b160 (&dev->mutex){....}-{3:3}, at: __device_driver_lock drivers/base/dd.c:1095 [inline]
 #4: ffff888100f5b160 (&dev->mutex){....}-{3:3}, at: device_release_driver_internal+0xa4/0x610 drivers/base/dd.c:1292
 #5: ffffffff89ad6da8 (rtnl_mutex){+.+.}-{3:3}, at: unregister_netdev+0x12/0x30 net/core/dev.c:11102
1 lock held by khungtaskd/29:
 #0: ffffffff888aece0 (rcu_read_lock){....}-{1:2}, at: rcu_lock_acquire include/linux/rcupdate.h:334 [inline]
 #0: ffffffff888aece0 (rcu_read_lock){....}-{1:2}, at: rcu_read_lock include/linux/rcupdate.h:786 [inline]
 #0: ffffffff888aece0 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x75/0x340 kernel/locking/lockdep.c:6614
1 lock held by kworker/u4:7/1043:
 #0: ffff8881f653b318 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested kernel/sched/core.c:558 [inline]
 #0: ffff8881f653b318 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock kernel/sched/sched.h:1375 [inline]
 #0: ffff8881f653b318 (&rq->__lock){-.-.}-{2:2}, at: rq_lock kernel/sched/sched.h:1684 [inline]
 #0: ffff8881f653b318 (&rq->__lock){-.-.}-{2:2}, at: __schedule+0x290/0x30d0 kernel/sched/core.c:6613
3 locks held by kworker/1:2/1939:
 #0: ffff888109ba9138 ((wq_completion)ipv6_addrconf){+.+.}-{0:0}, at: process_one_work+0x789/0x15e0 kernel/workqueue.c:2606
 #1: ffffc9000393fd80 ((work_completion)(&(&net->ipv6.addr_chk_work)->work)){+.+.}-{0:0}, at: process_one_work+0x7eb/0x15e0 kernel/workqueue.c:2607
 #2: ffffffff89ad6da8 (rtnl_mutex){+.+.}-{3:3}, at: addrconf_verify_work+0x12/0x30 net/ipv6/addrconf.c:4684
1 lock held by klogd/2494:
 #0: ffff8881f653b318 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested kernel/sched/core.c:558 [inline]
 #0: ffff8881f653b318 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock kernel/sched/sched.h:1375 [inline]
 #0: ffff8881f653b318 (&rq->__lock){-.-.}-{2:2}, at: rq_lock kernel/sched/sched.h:1684 [inline]
 #0: ffff8881f653b318 (&rq->__lock){-.-.}-{2:2}, at: __schedule+0x290/0x30d0 kernel/sched/core.c:6613
2 locks held by dhcpcd/2543:
 #0: ffffffff89ad6da8 (rtnl_mutex){+.+.}-{3:3}, at: devinet_ioctl+0x1d3/0x1f10 net/ipv4/devinet.c:1091
 #1: ffff88811928cdb0 (&padapter->mutex_start){+.+.}-{3:3}, at: netdev_open+0x32/0x840 drivers/staging/rtl8712/os_intfs.c:392
2 locks held by getty/2563:
 #0: ffff88810af530a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x24/0x80 drivers/tty/tty_ldisc.c:243
 #1: ffffc900000432f0 (&ldata->atomic_read_lock){+.+.}-{3:3}, at: n_tty_read+0xfc9/0x1480 drivers/tty/n_tty.c:2216

=============================================

NMI backtrace for cpu 0
CPU: 0 PID: 29 Comm: khungtaskd Not tainted 6.6.44-syzkaller-g721391060066-dirty #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/27/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd9/0x1b0 lib/dump_stack.c:106
 nmi_cpu_backtrace+0x27b/0x390 lib/nmi_backtrace.c:113
 nmi_trigger_cpumask_backtrace+0x29c/0x300 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:160 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:222 [inline]
 watchdog+0xf87/0x1210 kernel/hung_task.c:379
 kthread+0x2c6/0x3b0 kernel/kthread.c:388
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1b/0x30 arch/x86/entry/entry_64.S:293
 </TASK>
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1 skipped: idling at native_safe_halt arch/x86/include/asm/irqflags.h:48 [inline]
NMI backtrace for cpu 1 skipped: idling at arch_safe_halt arch/x86/include/asm/irqflags.h:86 [inline]
NMI backtrace for cpu 1 skipped: idling at acpi_safe_halt+0x1b/0x30 drivers/acpi/processor_idle.c:111


Tested on:

commit:         72139106 Linux 6.6.44
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git linux-6.6.y
console output: https://syzkaller.appspot.com/x/log.txt?x=17be7b65980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cc2e57d9f035477b
dashboard link: https://syzkaller.appspot.com/bug?extid=ca2eaaadab55de6a5a42
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11be7b65980000


