Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48D5E59335F
	for <lists+linux-media@lfdr.de>; Mon, 15 Aug 2022 18:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232342AbiHOQkd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Aug 2022 12:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbiHOQkb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Aug 2022 12:40:31 -0400
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E7BDBE23
        for <linux-media@vger.kernel.org>; Mon, 15 Aug 2022 09:40:29 -0700 (PDT)
Received: by mail-io1-f70.google.com with SMTP id i20-20020a5d88d4000000b0067d13ffbe8cso4488301iol.22
        for <linux-media@vger.kernel.org>; Mon, 15 Aug 2022 09:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc;
        bh=Z4LteLU57bSNHxvVT3R1HiDh8KVxcVFhIZWg+AaecIY=;
        b=GjbejNdDrtgGgtcazpszWEIy7v/exnbGz+Hqw1/Qn3h4pbx7PaXQX7R0JrfHP58pmP
         2gsndIC4QUK1LXhpi6zisktPsCtOsv4L7aen5TEus0B3d7Y+dkOut4fJf2AYaFHAs15q
         RaALH3DQ5mccVIUc14wHB6mjIx/LD4qDoWSWPky3HFlLfh3F55+ue51Nfau5lARKYq5l
         B1GfWXAikD15umUfNWSlWkb/Qo7R6900eSdXYSZpaq2N1xzxYvQA6Wd0r6SHXzORrFou
         IeqQbs2TCd3C+0W5xvCmutoTk0BCeGh3Je7tXvTC/r/nbelL6YnzEJ11OC9lhr/oxJmJ
         kCTA==
X-Gm-Message-State: ACgBeo2AIwk93RFsjCxYHWdtdULFCFRHtc7mvpY9zyntEtiIomPMir98
        9eWCugw3UZIez/TcUPcmcSJQX061B5TE4d6QcLW2aBj0DSv7
X-Google-Smtp-Source: AA6agR5ospixN1Nm6jTa5f6sIZEYQMDSRtTlQ06i+Mllx8HofVfF8K7dPblvj9ChF31tS2ulkl/TNwhCX49zIp3bTktaT4xXJ5Bp
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1aaf:b0:2df:9b36:cf34 with SMTP id
 l15-20020a056e021aaf00b002df9b36cf34mr7476932ilv.45.1660581628664; Mon, 15
 Aug 2022 09:40:28 -0700 (PDT)
Date:   Mon, 15 Aug 2022 09:40:28 -0700
In-Reply-To: <000000000000c5ea3505e52e44bb@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000018e33705e64a4a23@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in send_packet
From:   syzbot <syzbot+f1a69784f6efe748c3bf@syzkaller.appspotmail.com>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org, sean@mess.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot has found a reproducer for the following issue on:

HEAD commit:    568035b01cfb Linux 6.0-rc1
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=156286a5080000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e706e91b2a433db
dashboard link: https://syzkaller.appspot.com/bug?extid=f1a69784f6efe748c3bf
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13e5b2f3080000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12550915080000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f1a69784f6efe748c3bf@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in __create_pipe include/linux/usb.h:1945 [inline]
BUG: KASAN: use-after-free in send_packet+0xa2d/0xbc0 drivers/media/rc/imon.c:627
Read of size 4 at addr ffff8880256fb000 by task syz-executor314/4465

CPU: 2 PID: 4465 Comm: syz-executor314 Not tainted 6.0.0-rc1-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 print_address_description mm/kasan/report.c:317 [inline]
 print_report.cold+0x2ba/0x6e9 mm/kasan/report.c:433
 kasan_report+0xb1/0x1e0 mm/kasan/report.c:495
 __create_pipe include/linux/usb.h:1945 [inline]
 send_packet+0xa2d/0xbc0 drivers/media/rc/imon.c:627
 vfd_write+0x2d9/0x550 drivers/media/rc/imon.c:991
 vfs_write+0x2d7/0xdd0 fs/read_write.c:576
 ksys_write+0x127/0x250 fs/read_write.c:631
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f7590342b49
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 b1 15 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f75902cd308 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f75903c74d8 RCX: 00007f7590342b49
RDX: 0000000000000001 RSI: 0000000020001000 RDI: 0000000000000004
RBP: 00007f75903c74d0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f75903c74dc
R13: 00007f7590394328 R14: 0b8b0509005504e1 R15: 0000000000022000
 </TASK>

Allocated by task 3757:
 kasan_save_stack+0x1e/0x40 mm/kasan/common.c:38
 kasan_set_track mm/kasan/common.c:45 [inline]
 set_alloc_info mm/kasan/common.c:437 [inline]
 ____kasan_kmalloc mm/kasan/common.c:516 [inline]
 ____kasan_kmalloc mm/kasan/common.c:475 [inline]
 __kasan_kmalloc+0xa6/0xd0 mm/kasan/common.c:525
 kasan_kmalloc include/linux/kasan.h:234 [inline]
 kmem_cache_alloc_trace+0x25a/0x460 mm/slab.c:3559
 kmalloc include/linux/slab.h:600 [inline]
 kzalloc include/linux/slab.h:733 [inline]
 usb_alloc_dev+0x51/0xf00 drivers/usb/core/usb.c:582
 hub_port_connect drivers/usb/core/hub.c:5255 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5497 [inline]
 port_event drivers/usb/core/hub.c:5653 [inline]
 hub_event+0x214a/0x4610 drivers/usb/core/hub.c:5735
 process_one_work+0x991/0x1610 kernel/workqueue.c:2289
 worker_thread+0x665/0x1080 kernel/workqueue.c:2436
 kthread+0x2e4/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:306

Freed by task 3737:
 kasan_save_stack+0x1e/0x40 mm/kasan/common.c:38
 kasan_set_track+0x21/0x30 mm/kasan/common.c:45
 kasan_set_free_info+0x20/0x30 mm/kasan/generic.c:370
 ____kasan_slab_free mm/kasan/common.c:367 [inline]
 ____kasan_slab_free+0x13d/0x1a0 mm/kasan/common.c:329
 kasan_slab_free include/linux/kasan.h:200 [inline]
 __cache_free mm/slab.c:3418 [inline]
 kfree+0x173/0x390 mm/slab.c:3786
 device_release+0x9f/0x240 drivers/base/core.c:2330
 kobject_cleanup lib/kobject.c:673 [inline]
 kobject_release lib/kobject.c:704 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1be/0x4c0 lib/kobject.c:721
 put_device+0x1b/0x30 drivers/base/core.c:3624
 hub_port_connect drivers/usb/core/hub.c:5197 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5497 [inline]
 port_event drivers/usb/core/hub.c:5653 [inline]
 hub_event+0x1f86/0x4610 drivers/usb/core/hub.c:5735
 process_one_work+0x991/0x1610 kernel/workqueue.c:2289
 worker_thread+0x665/0x1080 kernel/workqueue.c:2436
 kthread+0x2e4/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:306

Last potentially related work creation:
 kasan_save_stack+0x1e/0x40 mm/kasan/common.c:38
 __kasan_record_aux_stack+0x7e/0x90 mm/kasan/generic.c:348
 kvfree_call_rcu+0x74/0x940 kernel/rcu/tree.c:3322
 free_imon_context+0x15b/0x1f0 drivers/media/rc/imon.c:503
 imon_disconnect+0x4b9/0x660 drivers/media/rc/imon.c:2543
 usb_unbind_interface+0x1d8/0x8e0 drivers/usb/core/driver.c:458
 device_remove drivers/base/dd.c:520 [inline]
 device_remove+0x11f/0x170 drivers/base/dd.c:512
 __device_release_driver drivers/base/dd.c:1209 [inline]
 device_release_driver_internal+0x4a1/0x700 drivers/base/dd.c:1235
 bus_remove_device+0x2e3/0x590 drivers/base/bus.c:529
 device_del+0x4f3/0xc80 drivers/base/core.c:3704
 usb_disable_device+0x356/0x7a0 drivers/usb/core/message.c:1419
 usb_disconnect.cold+0x259/0x6ed drivers/usb/core/hub.c:2235
 hub_port_connect drivers/usb/core/hub.c:5197 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5497 [inline]
 port_event drivers/usb/core/hub.c:5653 [inline]
 hub_event+0x1f86/0x4610 drivers/usb/core/hub.c:5735
 process_one_work+0x991/0x1610 kernel/workqueue.c:2289
 worker_thread+0x665/0x1080 kernel/workqueue.c:2436
 kthread+0x2e4/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:306

Second to last potentially related work creation:
 kasan_save_stack+0x1e/0x40 mm/kasan/common.c:38
 __kasan_record_aux_stack+0x7e/0x90 mm/kasan/generic.c:348
 call_rcu+0x99/0x790 kernel/rcu/tree.c:2793
 netlink_release+0xeff/0x1db0 net/netlink/af_netlink.c:815
 __sock_release+0xcd/0x280 net/socket.c:650
 sock_close+0x18/0x20 net/socket.c:1365
 __fput+0x277/0x9d0 fs/file_table.c:320
 task_work_run+0xdd/0x1a0 kernel/task_work.c:177
 exit_task_work include/linux/task_work.h:38 [inline]
 do_exit+0xad5/0x29b0 kernel/exit.c:795
 do_group_exit+0xd2/0x2f0 kernel/exit.c:925
 __do_sys_exit_group kernel/exit.c:936 [inline]
 __se_sys_exit_group kernel/exit.c:934 [inline]
 __x64_sys_exit_group+0x3a/0x50 kernel/exit.c:934
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

The buggy address belongs to the object at ffff8880256fb000
 which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 0 bytes inside of
 2048-byte region [ffff8880256fb000, ffff8880256fb800)

The buggy address belongs to the physical page:
page:ffffea000095bec0 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x256fb
flags: 0xfff00000000200(slab|node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000000200 ffffea000089bb88 ffffea0000727fc8 ffff888011840800
raw: 0000000000000000 ffff8880256fb000 0000000100000001 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x2420c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_COMP|__GFP_THISNODE), pid 3133, tgid 3133 (udevd), ts 116180599550, free_ts 116180286761
 prep_new_page mm/page_alloc.c:2532 [inline]
 get_page_from_freelist+0x109b/0x2ce0 mm/page_alloc.c:4283
 __alloc_pages+0x1c7/0x510 mm/page_alloc.c:5515
 __alloc_pages_node include/linux/gfp.h:243 [inline]
 kmem_getpages mm/slab.c:1363 [inline]
 cache_grow_begin+0x75/0x360 mm/slab.c:2569
 cache_alloc_refill+0x27f/0x380 mm/slab.c:2942
 ____cache_alloc mm/slab.c:3018 [inline]
 ____cache_alloc mm/slab.c:3001 [inline]
 __do_cache_alloc mm/slab.c:3246 [inline]
 slab_alloc mm/slab.c:3287 [inline]
 __do_kmalloc mm/slab.c:3684 [inline]
 __kmalloc+0x3a1/0x4a0 mm/slab.c:3695
 kmalloc include/linux/slab.h:605 [inline]
 sk_prot_alloc+0x143/0x290 net/core/sock.c:1976
 sk_alloc+0x36/0x770 net/core/sock.c:2029
 __netlink_create+0x63/0x380 net/netlink/af_netlink.c:647
 netlink_create+0x3ad/0x5e0 net/netlink/af_netlink.c:710
 __sock_create+0x355/0x790 net/socket.c:1515
 sock_create net/socket.c:1566 [inline]
 __sys_socket_create net/socket.c:1603 [inline]
 __sys_socket_create net/socket.c:1588 [inline]
 __sys_socket+0x12f/0x240 net/socket.c:1636
 __do_sys_socket net/socket.c:1649 [inline]
 __se_sys_socket net/socket.c:1647 [inline]
 __x64_sys_socket+0x6f/0xb0 net/socket.c:1647
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
page last free stack trace:
 reset_page_owner include/linux/page_owner.h:24 [inline]
 free_pages_prepare mm/page_alloc.c:1449 [inline]
 free_pcp_prepare+0x5e4/0xd20 mm/page_alloc.c:1499
 free_unref_page_prepare mm/page_alloc.c:3380 [inline]
 free_unref_page+0x19/0x4d0 mm/page_alloc.c:3476
 mm_free_pgd kernel/fork.c:737 [inline]
 __mmdrop+0xcb/0x3f0 kernel/fork.c:788
 mmdrop include/linux/sched/mm.h:50 [inline]
 mmdrop_sched include/linux/sched/mm.h:78 [inline]
 finish_task_switch.isra.0+0x6cc/0xc70 kernel/sched/core.c:5087
 context_switch kernel/sched/core.c:5185 [inline]
 __schedule+0xae7/0x52b0 kernel/sched/core.c:6494
 schedule+0xda/0x1b0 kernel/sched/core.c:6570
 schedule_hrtimeout_range_clock+0x343/0x390 kernel/time/hrtimer.c:2296
 ep_poll fs/eventpoll.c:1878 [inline]
 do_epoll_wait+0x12ba/0x1950 fs/eventpoll.c:2256
 __do_sys_epoll_wait fs/eventpoll.c:2268 [inline]
 __se_sys_epoll_wait fs/eventpoll.c:2263 [inline]
 __x64_sys_epoll_wait+0x158/0x270 fs/eventpoll.c:2263
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

Memory state around the buggy address:
 ffff8880256faf00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8880256faf80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff8880256fb000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                   ^
 ffff8880256fb080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880256fb100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================

