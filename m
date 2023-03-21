Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98B466C37A9
	for <lists+linux-media@lfdr.de>; Tue, 21 Mar 2023 18:05:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbjCURFa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Mar 2023 13:05:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbjCURFY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Mar 2023 13:05:24 -0400
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7A14303EE
        for <linux-media@vger.kernel.org>; Tue, 21 Mar 2023 10:04:47 -0700 (PDT)
Received: by mail-il1-f200.google.com with SMTP id v14-20020a92c80e000000b0031faea6493cso8049887iln.11
        for <linux-media@vger.kernel.org>; Tue, 21 Mar 2023 10:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679418287;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+zTrQymw8nWm1LaYS6yQZNEVKZFLl6piGpgaLk7/4RE=;
        b=tLM4V2O+FuPUniPUyKCTWjg6JUE9P+3Bb3Ykq2SUHk8LN+ZzPVC1NS5eOmqwuLkeRR
         UhwBhVs8A9UfoumGyT0NTaYEKaggapHFWBXzt4uiIetLB8Jg0LiM7ADbauMajTSFQm6P
         28nJU+AWgAf+kiJ1xRtziR1dnLo9k/2Nx5qCWJTscSQthctLLCDlGW/ZySSkeUi4J6/k
         OeFGO3fp4c1TKyLYl6GB1yL4pU9ddSVdoOkx7uzm2SZYvwHROh9IGnIiBJ3EeIGIeN8I
         t//OiC6NMJtRCgxZVjBE05z8dIPFQaEQOkSgjomVVlxFYrDNSCYQG9/fJ8rYhEtPMVbR
         5+jA==
X-Gm-Message-State: AO0yUKVwsUv6YaEZduV5r0QZrNyW3E4hCLzQ+d0CF7a4LvAwxBRgRWEu
        ckJ+ang5peC2mHSvFKNuWxS+9P25V1W3BL/9b03DF7FKruOr
X-Google-Smtp-Source: AK7set9ZLrfktTpmIZ42olW6S9WFaixJFSMx4jgpyGAZsTz4YqTTPuheLv3NxoBXl0MTeXnwBNJY/zeGRCozfMx2sV1x9SBu/ngM
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:f13:b0:313:c399:73c8 with SMTP id
 x19-20020a056e020f1300b00313c39973c8mr1279881ilj.4.1679418287044; Tue, 21 Mar
 2023 10:04:47 -0700 (PDT)
Date:   Tue, 21 Mar 2023 10:04:47 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006dc0c105f76c0a72@google.com>
Subject: [syzbot] [dri?] BUG: sleeping function called from invalid context in _vm_unmap_aliases
From:   syzbot <syzbot+a9a2bb6afe9eb31efc56@syzkaller.appspotmail.com>
To:     airlied@gmail.com, christian.koenig@amd.com, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com,
        tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    f3594f0204b7 Add linux-next specific files for 20230321
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=161552eec80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f22105589e896af1
dashboard link: https://syzkaller.appspot.com/bug?extid=a9a2bb6afe9eb31efc56
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0b755145006a/disk-f3594f02.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/fca26e328a81/vmlinux-f3594f02.xz
kernel image: https://storage.googleapis.com/syzbot-assets/39744d7d289f/bzImage-f3594f02.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a9a2bb6afe9eb31efc56@syzkaller.appspotmail.com

BUG: sleeping function called from invalid context at kernel/locking/mutex.c:580
in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 10028, name: syz-executor.4
preempt_count: 0, expected: 0
RCU nest depth: 1, expected: 0
3 locks held by syz-executor.4/10028:
 #0: ffff88807597afd8 (&mm->mmap_lock){++++}-{3:3}, at: mmap_write_lock_killable include/linux/mmap_lock.h:110 [inline]
 #0: ffff88807597afd8 (&mm->mmap_lock){++++}-{3:3}, at: vm_mmap_pgoff+0x158/0x3b0 mm/util.c:541
 #1: ffff888081123270 (&shmem->pages_lock){+.+.}-{3:3}, at: drm_gem_shmem_get_pages+0x53/0x180 drivers/gpu/drm/drm_gem_shmem_helper.c:216
 #2: ffffffff8c796500 (rcu_read_lock){....}-{1:2}, at: _vm_unmap_aliases.part.0+0x138/0x560 mm/vmalloc.c:2182
CPU: 1 PID: 10028 Comm: syz-executor.4 Not tainted 6.3.0-rc3-next-20230321-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/02/2023
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x136/0x150 lib/dump_stack.c:106
 __might_resched+0x358/0x580 kernel/sched/core.c:10059
 __mutex_lock_common kernel/locking/mutex.c:580 [inline]
 __mutex_lock+0x9f/0x1350 kernel/locking/mutex.c:747
 _vm_unmap_aliases.part.0+0x1ca/0x560 mm/vmalloc.c:2187
 _vm_unmap_aliases mm/vmalloc.c:2181 [inline]
 vm_unmap_aliases+0x49/0x50 mm/vmalloc.c:2230
 change_page_attr_set_clr+0x226/0x470 arch/x86/mm/pat/set_memory.c:1837
 cpa_set_pages_array arch/x86/mm/pat/set_memory.c:1892 [inline]
 _set_pages_array+0x1c6/0x220 arch/x86/mm/pat/set_memory.c:2230
 drm_gem_shmem_get_pages_locked+0x155/0x240 drivers/gpu/drm/drm_gem_shmem_helper.c:191
 drm_gem_shmem_get_pages+0x71/0x180 drivers/gpu/drm/drm_gem_shmem_helper.c:219
 drm_gem_shmem_mmap drivers/gpu/drm/drm_gem_shmem_helper.c:636 [inline]
 drm_gem_shmem_mmap+0x153/0x540 drivers/gpu/drm/drm_gem_shmem_helper.c:620
 drm_gem_mmap_obj+0x1b6/0x6c0 drivers/gpu/drm/drm_gem.c:1046
 drm_gem_mmap+0x41d/0x780 drivers/gpu/drm/drm_gem.c:1124
 call_mmap include/linux/fs.h:1859 [inline]
 mmap_region+0x694/0x28d0 mm/mmap.c:2652
 do_mmap+0x831/0xf60 mm/mmap.c:1438
 vm_mmap_pgoff+0x1a2/0x3b0 mm/util.c:543
 ksys_mmap_pgoff+0x41f/0x5a0 mm/mmap.c:1484
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f905968c0f9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 19 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f905a3fa168 EFLAGS: 00000246 ORIG_RAX: 0000000000000009
RAX: ffffffffffffffda RBX: 00007f90597abf80 RCX: 00007f905968c0f9
RDX: 0000000000000000 RSI: 0000000000003028 RDI: 0000000020ffc000
RBP: 00007f90596e7b39 R08: 0000000000000004 R09: 0000000100000000
R10: 0000000000000012 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffcde03503f R14: 00007f905a3fa300 R15: 0000000000022000
 </TASK>

=============================
[ BUG: Invalid wait context ]
6.3.0-rc3-next-20230321-syzkaller #0 Tainted: G        W         
-----------------------------
syz-executor.4/10028 is trying to lock:
ffff888027c7a068 (&vb->lock){+.+.}-{3:3}, at: _vm_unmap_aliases.part.0+0x1ca/0x560 mm/vmalloc.c:2187
other info that might help us debug this:
context-{4:4}
3 locks held by syz-executor.4/10028:
 #0: ffff88807597afd8 (&mm->mmap_lock){++++}-{3:3}, at: mmap_write_lock_killable include/linux/mmap_lock.h:110 [inline]
 #0: ffff88807597afd8 (&mm->mmap_lock){++++}-{3:3}, at: vm_mmap_pgoff+0x158/0x3b0 mm/util.c:541
 #1: ffff888081123270 (&shmem->pages_lock){+.+.}-{3:3}, at: drm_gem_shmem_get_pages+0x53/0x180 drivers/gpu/drm/drm_gem_shmem_helper.c:216
 #2: ffffffff8c796500 (rcu_read_lock){....}-{1:2}, at: _vm_unmap_aliases.part.0+0x138/0x560 mm/vmalloc.c:2182
stack backtrace:
CPU: 1 PID: 10028 Comm: syz-executor.4 Tainted: G        W          6.3.0-rc3-next-20230321-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/02/2023
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd9/0x150 lib/dump_stack.c:106
 print_lock_invalid_wait_context kernel/locking/lockdep.c:4724 [inline]
 check_wait_context kernel/locking/lockdep.c:4785 [inline]
 __lock_acquire+0x159e/0x5df0 kernel/locking/lockdep.c:5024
 lock_acquire.part.0+0x11c/0x370 kernel/locking/lockdep.c:5691
 __mutex_lock_common kernel/locking/mutex.c:603 [inline]
 __mutex_lock+0x12f/0x1350 kernel/locking/mutex.c:747
 _vm_unmap_aliases.part.0+0x1ca/0x560 mm/vmalloc.c:2187
 _vm_unmap_aliases mm/vmalloc.c:2181 [inline]
 vm_unmap_aliases+0x49/0x50 mm/vmalloc.c:2230
 change_page_attr_set_clr+0x226/0x470 arch/x86/mm/pat/set_memory.c:1837
 cpa_set_pages_array arch/x86/mm/pat/set_memory.c:1892 [inline]
 _set_pages_array+0x1c6/0x220 arch/x86/mm/pat/set_memory.c:2230
 drm_gem_shmem_get_pages_locked+0x155/0x240 drivers/gpu/drm/drm_gem_shmem_helper.c:191
 drm_gem_shmem_get_pages+0x71/0x180 drivers/gpu/drm/drm_gem_shmem_helper.c:219
 drm_gem_shmem_mmap drivers/gpu/drm/drm_gem_shmem_helper.c:636 [inline]
 drm_gem_shmem_mmap+0x153/0x540 drivers/gpu/drm/drm_gem_shmem_helper.c:620
 drm_gem_mmap_obj+0x1b6/0x6c0 drivers/gpu/drm/drm_gem.c:1046
 drm_gem_mmap+0x41d/0x780 drivers/gpu/drm/drm_gem.c:1124
 call_mmap include/linux/fs.h:1859 [inline]
 mmap_region+0x694/0x28d0 mm/mmap.c:2652
 do_mmap+0x831/0xf60 mm/mmap.c:1438
 vm_mmap_pgoff+0x1a2/0x3b0 mm/util.c:543
 ksys_mmap_pgoff+0x41f/0x5a0 mm/mmap.c:1484
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f905968c0f9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 19 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f905a3fa168 EFLAGS: 00000246 ORIG_RAX: 0000000000000009
RAX: ffffffffffffffda RBX: 00007f90597abf80 RCX: 00007f905968c0f9
RDX: 0000000000000000 RSI: 0000000000003028 RDI: 0000000020ffc000
RBP: 00007f90596e7b39 R08: 0000000000000004 R09: 0000000100000000
R10: 0000000000000012 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffcde03503f R14: 00007f905a3fa300 R15: 0000000000022000
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
