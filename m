Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DEBF49E796
	for <lists+linux-media@lfdr.de>; Thu, 27 Jan 2022 17:33:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243782AbiA0QdS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jan 2022 11:33:18 -0500
Received: from mail-io1-f71.google.com ([209.85.166.71]:46864 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243780AbiA0QdR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jan 2022 11:33:17 -0500
Received: by mail-io1-f71.google.com with SMTP id d70-20020a6bcd49000000b0060d10445eddso2474457iog.13
        for <linux-media@vger.kernel.org>; Thu, 27 Jan 2022 08:33:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=00IyTIAlzoOrPRUCsi8aulDy0RI8+jIgunsBwuax9qE=;
        b=zD5LUumM4GSn8Ok0wwTHRb21e0DUTXZItCSrNRFUnH4LJPK9a/YI6zdIUe+vhft3gJ
         fwL4fZuqpTo0Ljlaw4HWvonNA6ufkWmrn0fWy+Ms6d1aqBxKSIwG2FipuFJIx+olBC5J
         MmCz7/lDi9uuY9ALhrFlbMSZ7dV4aWMgFP1K8oHXX+bj+dcVfRg/gYlzSSMNYevwqbez
         +vEXdqqOpSlD1+uDZIUtmXZeJFiIthjxCwSo3pTGUCIrdsXFIdue8Wmx50Rn/pXLxmbh
         DLQUkinBzzscvDQ/Qgxrr6HIQcMB8xYviYjd3ko/H/VgNFqt6nrAChWPIPrgbF5zG8TP
         iUog==
X-Gm-Message-State: AOAM533aSpkXwq5IbPqkM1OWboEEFt08BDlI6MvBvNBoICbh/iDvycCz
        pEcj0Ta6reocl/tASCYyk8+NCtSnKJHFsQTL8tV4vL9i7Aef
X-Google-Smtp-Source: ABdhPJzihtu/nGAzFDeHB6dM/QKoTCfGd2ON92hr1zWDeQdcDGIRTdf7RhUJRNNejJ/WW0avfRMhccKAA3nULC54Ti0+mDotzq44
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1806:: with SMTP id a6mr1539808ilv.196.1643301197408;
 Thu, 27 Jan 2022 08:33:17 -0800 (PST)
Date:   Thu, 27 Jan 2022 08:33:17 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000021719805d692e035@google.com>
Subject: [syzbot] inconsistent lock state in sync_info_debugfs_show
From:   syzbot <syzbot+007bfe0f3330f6e1e7d1@syzkaller.appspotmail.com>
To:     christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
        gustavo@padovan.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    1c52283265a4 Merge branch 'akpm' (patches from Andrew)
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1224663fb00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=75bc179af0ff0457
dashboard link: https://syzkaller.appspot.com/bug?extid=007bfe0f3330f6e1e7d1
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+007bfe0f3330f6e1e7d1@syzkaller.appspotmail.com

================================
WARNING: inconsistent lock state
5.16.0-syzkaller #0 Not tainted
--------------------------------
inconsistent {IN-HARDIRQ-W} -> {HARDIRQ-ON-W} usage.
syz-executor.2/18360 [HC0[0]:SC0[0]:HE0:SE1] takes:
ffffffff8c712cf8 (sync_timeline_list_lock){?...}-{2:2}, at: spin_lock_irq include/linux/spinlock.h:374 [inline]
ffffffff8c712cf8 (sync_timeline_list_lock){?...}-{2:2}, at: sync_info_debugfs_show+0x2d/0x200 drivers/dma-buf/sync_debug.c:147
{IN-HARDIRQ-W} state was registered at:
  lock_acquire kernel/locking/lockdep.c:5639 [inline]
  lock_acquire+0x1ab/0x510 kernel/locking/lockdep.c:5604
  __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
  _raw_spin_lock_irqsave+0x39/0x50 kernel/locking/spinlock.c:162
  sync_timeline_debug_remove+0x25/0x190 drivers/dma-buf/sync_debug.c:31
  sync_timeline_free drivers/dma-buf/sw_sync.c:104 [inline]
  kref_put include/linux/kref.h:65 [inline]
  sync_timeline_put drivers/dma-buf/sw_sync.c:116 [inline]
  timeline_fence_release+0x263/0x340 drivers/dma-buf/sw_sync.c:144
  dma_fence_release+0x2ee/0x590 drivers/dma-buf/dma-fence.c:549
  kref_put include/linux/kref.h:65 [inline]
  dma_fence_put include/linux/dma-fence.h:276 [inline]
  dma_fence_array_release+0x1e4/0x2b0 drivers/dma-buf/dma-fence-array.c:120
  dma_fence_release+0x2ee/0x590 drivers/dma-buf/dma-fence.c:549
  kref_put include/linux/kref.h:65 [inline]
  dma_fence_put include/linux/dma-fence.h:276 [inline]
  irq_dma_fence_array_work+0xa5/0xd0 drivers/dma-buf/dma-fence-array.c:52
  irq_work_single+0x120/0x270 kernel/irq_work.c:211
  irq_work_run_list+0x91/0xc0 kernel/irq_work.c:242
  irq_work_run+0x54/0xd0 kernel/irq_work.c:251
  __sysvec_irq_work+0x95/0x3d0 arch/x86/kernel/irq_work.c:22
  sysvec_irq_work+0x8e/0xc0 arch/x86/kernel/irq_work.c:17
  asm_sysvec_irq_work+0x12/0x20 arch/x86/include/asm/idtentry.h:664
  __raw_spin_unlock_irq include/linux/spinlock_api_smp.h:160 [inline]
  _raw_spin_unlock_irq+0x25/0x40 kernel/locking/spinlock.c:202
  spin_unlock_irq include/linux/spinlock.h:399 [inline]
  sw_sync_debugfs_release+0x160/0x240 drivers/dma-buf/sw_sync.c:321
  __fput+0x286/0x9f0 fs/file_table.c:311
  task_work_run+0xdd/0x1a0 kernel/task_work.c:164
  exit_task_work include/linux/task_work.h:32 [inline]
  do_exit+0xb29/0x2a30 kernel/exit.c:806
  do_group_exit+0xd2/0x2f0 kernel/exit.c:935
  get_signal+0x4b0/0x28c0 kernel/signal.c:2862
  arch_do_signal_or_restart+0x2a9/0x1c40 arch/x86/kernel/signal.c:868
  handle_signal_work kernel/entry/common.c:148 [inline]
  exit_to_user_mode_loop kernel/entry/common.c:172 [inline]
  exit_to_user_mode_prepare+0x17d/0x290 kernel/entry/common.c:207
  __syscall_exit_to_user_mode_work kernel/entry/common.c:289 [inline]
  syscall_exit_to_user_mode+0x19/0x60 kernel/entry/common.c:300
  ret_from_fork+0x15/0x30 arch/x86/entry/entry_64.S:288
irq event stamp: 124
hardirqs last  enabled at (123): [<ffffffff894fd980>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:151 [inline]
hardirqs last  enabled at (123): [<ffffffff894fd980>] _raw_spin_unlock_irqrestore+0x50/0x70 kernel/locking/spinlock.c:194
hardirqs last disabled at (124): [<ffffffff894fd6e1>] __raw_spin_lock_irq include/linux/spinlock_api_smp.h:117 [inline]
hardirqs last disabled at (124): [<ffffffff894fd6e1>] _raw_spin_lock_irq+0x41/0x50 kernel/locking/spinlock.c:170
softirqs last  enabled at (116): [<ffffffff81465513>] invoke_softirq kernel/softirq.c:432 [inline]
softirqs last  enabled at (116): [<ffffffff81465513>] __irq_exit_rcu+0x123/0x180 kernel/softirq.c:637
softirqs last disabled at (97): [<ffffffff81465513>] invoke_softirq kernel/softirq.c:432 [inline]
softirqs last disabled at (97): [<ffffffff81465513>] __irq_exit_rcu+0x123/0x180 kernel/softirq.c:637

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(sync_timeline_list_lock);
  <Interrupt>
    lock(sync_timeline_list_lock);

 *** DEADLOCK ***

3 locks held by syz-executor.2/18360:
 #0: ffff88801e30c0f0 (&f->f_pos_lock){+.+.}-{3:3}, at: __fdget_pos+0xe9/0x100 fs/file.c:1034
 #1: ffff88807a26dd58 (&p->lock){+.+.}-{3:3}, at: seq_read_iter+0xdf/0x1280 fs/seq_file.c:182
 #2: ffffffff8c712cf8 (sync_timeline_list_lock){?...}-{2:2}, at: spin_lock_irq include/linux/spinlock.h:374 [inline]
 #2: ffffffff8c712cf8 (sync_timeline_list_lock){?...}-{2:2}, at: sync_info_debugfs_show+0x2d/0x200 drivers/dma-buf/sync_debug.c:147

stack backtrace:
CPU: 0 PID: 18360 Comm: syz-executor.2 Not tainted 5.16.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 print_usage_bug kernel/locking/lockdep.c:203 [inline]
 valid_state kernel/locking/lockdep.c:3945 [inline]
 mark_lock_irq kernel/locking/lockdep.c:4148 [inline]
 mark_lock.cold+0x61/0x8e kernel/locking/lockdep.c:4605
 mark_held_locks+0x9f/0xe0 kernel/locking/lockdep.c:4206
 __trace_hardirqs_on_caller kernel/locking/lockdep.c:4224 [inline]
 lockdep_hardirqs_on_prepare kernel/locking/lockdep.c:4292 [inline]
 lockdep_hardirqs_on_prepare+0x135/0x400 kernel/locking/lockdep.c:4244
 trace_hardirqs_on+0x5b/0x1c0 kernel/trace/trace_preemptirq.c:49
 __raw_spin_unlock_irq include/linux/spinlock_api_smp.h:159 [inline]
 _raw_spin_unlock_irq+0x1f/0x40 kernel/locking/spinlock.c:202
 spin_unlock_irq include/linux/spinlock.h:399 [inline]
 sync_print_obj drivers/dma-buf/sync_debug.c:118 [inline]
 sync_info_debugfs_show+0xeb/0x200 drivers/dma-buf/sync_debug.c:153
 seq_read_iter+0x4f5/0x1280 fs/seq_file.c:230
 seq_read+0x3e8/0x5c0 fs/seq_file.c:162
 vfs_read+0x1b5/0x600 fs/read_write.c:479
 ksys_read+0x12d/0x250 fs/read_write.c:619
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f781fb4b059
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f781e4c0168 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
RAX: ffffffffffffffda RBX: 00007f781fc5df60 RCX: 00007f781fb4b059
RDX: 0000000000000008 RSI: 0000000020000140 RDI: 0000000000000003
RBP: 00007f781fba508d R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fff0ff6575f R14: 00007f781e4c0300 R15: 0000000000022000
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
