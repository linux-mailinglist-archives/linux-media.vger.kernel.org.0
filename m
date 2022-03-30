Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07BA44ECACA
	for <lists+linux-media@lfdr.de>; Wed, 30 Mar 2022 19:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349350AbiC3RiR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Mar 2022 13:38:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233051AbiC3RiP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Mar 2022 13:38:15 -0400
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BA7EB7C51
        for <linux-media@vger.kernel.org>; Wed, 30 Mar 2022 10:36:29 -0700 (PDT)
Received: by mail-il1-f197.google.com with SMTP id h13-20020a056e021d8d00b002c7fb1ec601so11843414ila.6
        for <linux-media@vger.kernel.org>; Wed, 30 Mar 2022 10:36:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=owPYEeWJTBCRqbDZ0tZk0G5OEV4Iq10Wwzh5L/IhgJM=;
        b=RibvAFNPzsLJnffYVJI7dwvWNFrgLjDicvfO3elCFFtzp8iHAzRhMxy1+PjgHiYQVX
         RsWr6KpzgE3HlqT4qx+HYvLhx7cStgA3ju6Jnv5/7DiYUyyj51AUqYlxdi5J3xejWS8m
         QbpcrPSHDHV/VOBdGLbJTg3CDcr773nxTg3AtVst48IDJo7NomxUC+vvvBKghugrpJlm
         v5RNIuIdu1HGjtzgM/WgZl7lL+o9S19sik1xdKjWDokPcLnn8ReInIt6duN7CaGmewkJ
         +DQa8FlWjmP9op5scSK+IAJSwrKse5HmQiIOsGEkn1J8m0waWayWUM1G842gFi5mUJTi
         dX0g==
X-Gm-Message-State: AOAM532BecMDWx09PQiUNBWjtdMl3u7K/LNNq9MclVZx5d3jiSAohz81
        x7EHjqYzOrp8ApQmomv6ZVcKBo9/SIwfbvWZUjcC6mkXkJJP
X-Google-Smtp-Source: ABdhPJzxzW4gdT+HqtA4czEe2f4yTGaK9waqmnZ2KIFSiMvkgTO21kkBrthVfG/FwPONcKq7vIyfPD3OhGWJanY43Oz3DMV+QYgm
MIME-Version: 1.0
X-Received: by 2002:a05:6638:1616:b0:31a:131c:9079 with SMTP id
 x22-20020a056638161600b0031a131c9079mr464369jas.89.1648661788703; Wed, 30 Mar
 2022 10:36:28 -0700 (PDT)
Date:   Wed, 30 Mar 2022 10:36:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000453f3d05db72fc7e@google.com>
Subject: [syzbot] KASAN: use-after-free Read in em28xx_init_extension (2)
From:   syzbot <syzbot+99d6c66dbbc484f50e1c@syzkaller.appspotmail.com>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com
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

Hello,

syzbot found the following issue on:

HEAD commit:    52d543b5497c Merge tag 'for-linus-5.17-1' of https://githu..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17b804fb700000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7094767cefc58fb9
dashboard link: https://syzkaller.appspot.com/bug?extid=99d6c66dbbc484f50e1c
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=161c4739700000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16432d51700000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+99d6c66dbbc484f50e1c@syzkaller.appspotmail.com

em28xx 5-1:0.130: Config register raw data: 0xfffffffb
em28xx 5-1:0.130: AC97 chip type couldn't be determined
em28xx 5-1:0.130: No AC97 audio processor
==================================================================
BUG: KASAN: use-after-free in __list_add_valid+0x93/0xa0 lib/list_debug.c:26
Read of size 8 at addr ffff888027458250 by task kworker/1:1/40

CPU: 1 PID: 40 Comm: kworker/1:1 Not tainted 5.17.0-syzkaller-10752-g52d543b5497c #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 print_address_description.constprop.0.cold+0xeb/0x467 mm/kasan/report.c:313
 print_report mm/kasan/report.c:429 [inline]
 kasan_report.cold+0xf4/0x1c6 mm/kasan/report.c:491
 __list_add_valid+0x93/0xa0 lib/list_debug.c:26
 __list_add include/linux/list.h:69 [inline]
 list_add_tail include/linux/list.h:102 [inline]
 em28xx_init_extension+0x44/0x1f0 drivers/media/usb/em28xx/em28xx-core.c:1123
 em28xx_init_dev.constprop.0+0xa8b/0x1746 drivers/media/usb/em28xx/em28xx-cards.c:3637
 em28xx_usb_probe.cold+0xc29/0x258a drivers/media/usb/em28xx/em28xx-cards.c:3992
 usb_probe_interface+0x315/0x7f0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:517 [inline]
 really_probe+0x245/0xcc0 drivers/base/dd.c:596
 __driver_probe_device+0x338/0x4d0 drivers/base/dd.c:755
 driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:785
 __device_attach_driver+0x20b/0x2f0 drivers/base/dd.c:902
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:427
 __device_attach+0x228/0x4a0 drivers/base/dd.c:973
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:487
 device_add+0xb83/0x1e20 drivers/base/core.c:3405
 usb_set_configuration+0x101e/0x1900 drivers/usb/core/message.c:2170
 usb_generic_driver_probe+0xba/0x100 drivers/usb/core/generic.c:238
 usb_probe_device+0xd9/0x2c0 drivers/usb/core/driver.c:293
 call_driver_probe drivers/base/dd.c:517 [inline]
 really_probe+0x245/0xcc0 drivers/base/dd.c:596
 __driver_probe_device+0x338/0x4d0 drivers/base/dd.c:755
 driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:785
 __device_attach_driver+0x20b/0x2f0 drivers/base/dd.c:902
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:427
 __device_attach+0x228/0x4a0 drivers/base/dd.c:973
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:487
 device_add+0xb83/0x1e20 drivers/base/core.c:3405
 usb_new_device.cold+0x641/0x1091 drivers/usb/core/hub.c:2566
 hub_port_connect drivers/usb/core/hub.c:5358 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5502 [inline]
 port_event drivers/usb/core/hub.c:5660 [inline]
 hub_event+0x25c6/0x4680 drivers/usb/core/hub.c:5742
 process_one_work+0x996/0x1610 kernel/workqueue.c:2289
 process_scheduled_works kernel/workqueue.c:2352 [inline]
 worker_thread+0x854/0x1080 kernel/workqueue.c:2438
 kthread+0x2e9/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
 </TASK>

Allocated by task 40:
 kasan_save_stack+0x1e/0x40 mm/kasan/common.c:38
 kasan_set_track mm/kasan/common.c:45 [inline]
 set_alloc_info mm/kasan/common.c:436 [inline]
 ____kasan_kmalloc mm/kasan/common.c:515 [inline]
 ____kasan_kmalloc mm/kasan/common.c:474 [inline]
 __kasan_kmalloc+0xa6/0xd0 mm/kasan/common.c:524
 kasan_kmalloc include/linux/kasan.h:234 [inline]
 __do_kmalloc mm/slab.c:3709 [inline]
 __kmalloc_track_caller+0x206/0x4d0 mm/slab.c:3724
 kmemdup+0x23/0x50 mm/util.c:128
 kmemdup include/linux/fortify-string.h:304 [inline]
 em28xx_duplicate_dev drivers/media/usb/em28xx/em28xx-cards.c:3690 [inline]
 em28xx_usb_probe.cold+0x134a/0x258a drivers/media/usb/em28xx/em28xx-cards.c:4040
 usb_probe_interface+0x315/0x7f0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:517 [inline]
 really_probe+0x245/0xcc0 drivers/base/dd.c:596
 __driver_probe_device+0x338/0x4d0 drivers/base/dd.c:755
 driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:785
 __device_attach_driver+0x20b/0x2f0 drivers/base/dd.c:902
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:427
 __device_attach+0x228/0x4a0 drivers/base/dd.c:973
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:487
 device_add+0xb83/0x1e20 drivers/base/core.c:3405
 usb_set_configuration+0x101e/0x1900 drivers/usb/core/message.c:2170
 usb_generic_driver_probe+0xba/0x100 drivers/usb/core/generic.c:238
 usb_probe_device+0xd9/0x2c0 drivers/usb/core/driver.c:293
 call_driver_probe drivers/base/dd.c:517 [inline]
 really_probe+0x245/0xcc0 drivers/base/dd.c:596
 __driver_probe_device+0x338/0x4d0 drivers/base/dd.c:755
 driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:785
 __device_attach_driver+0x20b/0x2f0 drivers/base/dd.c:902
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:427
 __device_attach+0x228/0x4a0 drivers/base/dd.c:973
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:487
 device_add+0xb83/0x1e20 drivers/base/core.c:3405
 usb_new_device.cold+0x641/0x1091 drivers/usb/core/hub.c:2566
 hub_port_connect drivers/usb/core/hub.c:5358 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5502 [inline]
 port_event drivers/usb/core/hub.c:5660 [inline]
 hub_event+0x25c6/0x4680 drivers/usb/core/hub.c:5742
 process_one_work+0x996/0x1610 kernel/workqueue.c:2289
 worker_thread+0x665/0x1080 kernel/workqueue.c:2436
 kthread+0x2e9/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295

Freed by task 40:
 kasan_save_stack+0x1e/0x40 mm/kasan/common.c:38
 kasan_set_track+0x21/0x30 mm/kasan/common.c:45
 kasan_set_free_info+0x20/0x30 mm/kasan/generic.c:370
 ____kasan_slab_free mm/kasan/common.c:366 [inline]
 ____kasan_slab_free+0x13d/0x180 mm/kasan/common.c:328
 kasan_slab_free include/linux/kasan.h:200 [inline]
 __cache_free mm/slab.c:3438 [inline]
 kfree+0xfb/0x2c0 mm/slab.c:3809
 __refcount_sub_and_test include/linux/refcount.h:282 [inline]
 __refcount_dec_and_test include/linux/refcount.h:315 [inline]
 refcount_dec_and_test include/linux/refcount.h:333 [inline]
 kref_put.constprop.0.isra.0+0x3d/0x7e include/linux/kref.h:64
 em28xx_usb_disconnect.cold+0x1c2/0x237 drivers/media/usb/em28xx/em28xx-cards.c:4158
 usb_unbind_interface+0x1d8/0x8e0 drivers/usb/core/driver.c:458
 __device_release_driver+0x627/0x760 drivers/base/dd.c:1209
 device_release_driver_internal drivers/base/dd.c:1242 [inline]
 device_release_driver+0x26/0x40 drivers/base/dd.c:1265
 bus_remove_device+0x2eb/0x5a0 drivers/base/bus.c:529
 device_del+0x4f3/0xc80 drivers/base/core.c:3592
 usb_disable_device+0x35b/0x7b0 drivers/usb/core/message.c:1419
 usb_disconnect.cold+0x278/0x6ec drivers/usb/core/hub.c:2228
 hub_port_connect drivers/usb/core/hub.c:5202 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5502 [inline]
 port_event drivers/usb/core/hub.c:5660 [inline]
 hub_event+0x1e74/0x4680 drivers/usb/core/hub.c:5742
 process_one_work+0x996/0x1610 kernel/workqueue.c:2289
 process_scheduled_works kernel/workqueue.c:2352 [inline]
 worker_thread+0x854/0x1080 kernel/workqueue.c:2438
 kthread+0x2e9/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295

The buggy address belongs to the object at ffff888027458000
 which belongs to the cache kmalloc-16k of size 16384
The buggy address is located 592 bytes inside of
 16384-byte region [ffff888027458000, ffff88802745c000)

The buggy address belongs to the physical page:
page:ffffea00009d1600 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x27458
head:ffffea00009d1600 order:3 compound_mapcount:0 compound_pincount:0
flags: 0xfff00000010200(slab|head|node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000010200 ffffea00008c5808 ffffea00009bf608 ffff888010c40b00
raw: 0000000000000000 ffff888027458000 0000000100000001 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0x2420c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_COMP|__GFP_THISNODE), pid 40, tgid 40 (kworker/1:1), ts 55959586532, free_ts 54110027164
 prep_new_page mm/page_alloc.c:2438 [inline]
 get_page_from_freelist+0xba2/0x3df0 mm/page_alloc.c:4179
 __alloc_pages+0x1b2/0x500 mm/page_alloc.c:5405
 __alloc_pages_node include/linux/gfp.h:589 [inline]
 kmem_getpages mm/slab.c:1378 [inline]
 cache_grow_begin+0x75/0x350 mm/slab.c:2584
 cache_alloc_refill+0x27f/0x380 mm/slab.c:2957
 ____cache_alloc mm/slab.c:3040 [inline]
 ____cache_alloc mm/slab.c:3023 [inline]
 __do_cache_alloc mm/slab.c:3267 [inline]
 slab_alloc mm/slab.c:3309 [inline]
 __do_kmalloc mm/slab.c:3707 [inline]
 __kmalloc_track_caller+0x3b0/0x4d0 mm/slab.c:3724
 kmemdup+0x23/0x50 mm/util.c:128
 kmemdup include/linux/fortify-string.h:304 [inline]
 em28xx_duplicate_dev drivers/media/usb/em28xx/em28xx-cards.c:3690 [inline]
 em28xx_usb_probe.cold+0x134a/0x258a drivers/media/usb/em28xx/em28xx-cards.c:4040
 usb_probe_interface+0x315/0x7f0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:517 [inline]
 really_probe+0x245/0xcc0 drivers/base/dd.c:596
 __driver_probe_device+0x338/0x4d0 drivers/base/dd.c:755
 driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:785
 __device_attach_driver+0x20b/0x2f0 drivers/base/dd.c:902
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:427
 __device_attach+0x228/0x4a0 drivers/base/dd.c:973
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:487
 device_add+0xb83/0x1e20 drivers/base/core.c:3405
page last free stack trace:
 reset_page_owner include/linux/page_owner.h:24 [inline]
 free_pages_prepare mm/page_alloc.c:1353 [inline]
 free_pcp_prepare+0x549/0xd20 mm/page_alloc.c:1403
 free_unref_page_prepare mm/page_alloc.c:3325 [inline]
 free_unref_page+0x19/0x690 mm/page_alloc.c:3420
 skb_free_frag include/linux/skbuff.h:3135 [inline]
 skb_free_head+0x96/0x110 net/core/skbuff.c:653
 skb_release_data+0x6bc/0x810 net/core/skbuff.c:677
 skb_release_all net/core/skbuff.c:742 [inline]
 __kfree_skb+0x46/0x60 net/core/skbuff.c:756
 __sk_defer_free_flush net/ipv4/tcp.c:1601 [inline]
 sk_defer_free_flush include/net/tcp.h:1380 [inline]
 tcp_recvmsg+0x1ca/0x610 net/ipv4/tcp.c:2577
 inet_recvmsg+0x11b/0x5e0 net/ipv4/af_inet.c:850
 sock_recvmsg_nosec net/socket.c:948 [inline]
 sock_recvmsg net/socket.c:966 [inline]
 sock_recvmsg net/socket.c:962 [inline]
 sock_read_iter+0x33c/0x470 net/socket.c:1039
 call_read_iter include/linux/fs.h:2075 [inline]
 new_sync_read+0x5c2/0x6e0 fs/read_write.c:401
 vfs_read+0x49b/0x5e0 fs/read_write.c:482
 ksys_read+0x1ee/0x250 fs/read_write.c:620
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Memory state around the buggy address:
 ffff888027458100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888027458180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888027458200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                 ^
 ffff888027458280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888027458300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
