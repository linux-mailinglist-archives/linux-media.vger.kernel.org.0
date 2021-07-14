Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36CE63C861E
	for <lists+linux-media@lfdr.de>; Wed, 14 Jul 2021 16:27:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239472AbhGNOaK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jul 2021 10:30:10 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:35602 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231977AbhGNOaJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jul 2021 10:30:09 -0400
Received: by mail-io1-f69.google.com with SMTP id n13-20020a5ed90d0000b02904f43c8bffc4so1342915iop.2
        for <linux-media@vger.kernel.org>; Wed, 14 Jul 2021 07:27:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=nUJZTDOZuoAo74BmQ/Ot4FIzrfXIFCmoVdPip3kBnYU=;
        b=hq/EALXc9hkosETqLIakib6ut1TWehO3roMnHP6TgGvIEjVZlmLX6PG8bxFp1cgAA3
         tL+g77k9ze7syUwI35b+OJiBNZsRL09raZ9+3N5Babb57r08v5uHC1ThjFBpXY8M8hVD
         xSPGlmnMXP5Q7OjmxeBmon2gR3HSxZiZpfCm8w3wrLCiEFA+jW/+i6MF7Zu7/SgEha/m
         jBf9yyYz5gnOGlwAAZLX0u9z6BK8B6CitlaK408yeLnk0gUe+nCUVVv7zZXaUieBZrcA
         G+om7HUABddUQYDtiQFOarLXJkQS4M8Jj0uCrHjGmTmwpPRVN9TUrLgfPckip3V4uMHc
         gocg==
X-Gm-Message-State: AOAM530FnEbHxzSZ0ypQtHiaBpkuR2QHjAkVjUjlMMO/2MmLXERH5HSA
        DOVtmffy2h9UMAKhfHL1ZJneU1svA5oWx9RKaTBu8yb0sI5k
X-Google-Smtp-Source: ABdhPJzU484Ek9khlpTDPupbwTcposSoBJ0clG/8ANZ5kNi+Png8s5hXuLk8xjia8g22dwCl0Ysy5Td4j+QPNK2KtrDQ9fSpoI9n
MIME-Version: 1.0
X-Received: by 2002:a05:6638:4109:: with SMTP id ay9mr9027786jab.81.1626272837952;
 Wed, 14 Jul 2021 07:27:17 -0700 (PDT)
Date:   Wed, 14 Jul 2021 07:27:17 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d068cf05c716264c@google.com>
Subject: [syzbot] KASAN: use-after-free Read in em28xx_close_extension
From:   syzbot <syzbot+005037419ebdf14e1d87@syzkaller.appspotmail.com>
To:     hverkuil-cisco@xs4all.nl, igormtorrente@gmail.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab+huawei@kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    3dbdb38e Merge branch 'for-5.14' of git://git.kernel.org/p..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=158cf1e2300000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a1fcf15a09815757
dashboard link: https://syzkaller.appspot.com/bug?extid=005037419ebdf14e1d87
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=169746b0300000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=157e89c4300000

The issue was bisected to:

commit ac5688637144644f06ed1f3c6d4dd8bb7db96020
Author: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Date:   Tue May 4 18:32:49 2021 +0000

    media: em28xx: Fix possible memory leak of em28xx struct

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1742cffc300000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=14c2cffc300000
console output: https://syzkaller.appspot.com/x/log.txt?x=10c2cffc300000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+005037419ebdf14e1d87@syzkaller.appspotmail.com
Fixes: ac5688637144 ("media: em28xx: Fix possible memory leak of em28xx struct")

usb 1-1: bad CDC descriptors
usb 1-1: USB disconnect, device number 2
em28xx 1-1:64.138: Disconnecting em28xx
em28xx 1-1:64.138: Closing input extension
em28xx 1-1:64.138: Freeing device
==================================================================
BUG: KASAN: use-after-free in __list_del_entry_valid+0xcc/0xf0 lib/list_debug.c:42
Read of size 8 at addr ffff888021aa8258 by task kworker/1:2/3456

CPU: 1 PID: 3456 Comm: kworker/1:2 Not tainted 5.13.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:96
 print_address_description.constprop.0.cold+0x6c/0x309 mm/kasan/report.c:233
 __kasan_report mm/kasan/report.c:419 [inline]
 kasan_report.cold+0x83/0xdf mm/kasan/report.c:436
 __list_del_entry_valid+0xcc/0xf0 lib/list_debug.c:42
 __list_del_entry include/linux/list.h:132 [inline]
 list_del include/linux/list.h:146 [inline]
 em28xx_close_extension+0x10b/0x2a0 drivers/media/usb/em28xx/em28xx-core.c:1146
 em28xx_usb_disconnect.cold+0x14b/0x237 drivers/media/usb/em28xx/em28xx-cards.c:4140
 usb_unbind_interface+0x1d8/0x8d0 drivers/usb/core/driver.c:458
 __device_release_driver+0x3bd/0x6f0 drivers/base/dd.c:1181
 device_release_driver_internal drivers/base/dd.c:1212 [inline]
 device_release_driver+0x26/0x40 drivers/base/dd.c:1235
 bus_remove_device+0x2eb/0x5a0 drivers/base/bus.c:533
 device_del+0x502/0xd40 drivers/base/core.c:3512
 usb_disable_device+0x35b/0x7b0 drivers/usb/core/message.c:1413
 usb_disconnect.cold+0x27a/0x78e drivers/usb/core/hub.c:2221
 hub_port_connect drivers/usb/core/hub.c:5129 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5418 [inline]
 port_event drivers/usb/core/hub.c:5564 [inline]
 hub_event+0x1c9c/0x4330 drivers/usb/core/hub.c:5646
 process_one_work+0x98d/0x1630 kernel/workqueue.c:2276
 process_scheduled_works kernel/workqueue.c:2338 [inline]
 worker_thread+0x85c/0x11f0 kernel/workqueue.c:2424
 kthread+0x3e5/0x4d0 kernel/kthread.c:319
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295

The buggy address belongs to the page:
page:ffffea000086aa00 refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x21aa8
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000000000 ffffea0000ac0d08 ffff8880b9d3b288 0000000000000000
raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as freed
page last allocated via order 2, migratetype Unmovable, gfp_mask 0x40dc0(GFP_KERNEL|__GFP_COMP|__GFP_ZERO), pid 3456, ts 70583523123, free_ts 71218691485
 prep_new_page mm/page_alloc.c:2445 [inline]
 get_page_from_freelist+0xa72/0x2f80 mm/page_alloc.c:4178
 __alloc_pages+0x1b2/0x500 mm/page_alloc.c:5386
 alloc_pages+0x18c/0x2a0 mm/mempolicy.c:2272
 kmalloc_order+0x34/0xf0 mm/slab_common.c:945
 kmalloc_order_trace+0x14/0x120 mm/slab_common.c:961
 kmalloc_large include/linux/slab.h:520 [inline]
 kmalloc include/linux/slab.h:584 [inline]
 kzalloc include/linux/slab.h:721 [inline]
 em28xx_usb_probe+0x1f7/0xd00 drivers/media/usb/em28xx/em28xx-cards.c:3855
 usb_probe_interface+0x315/0x7f0 drivers/usb/core/driver.c:396
 really_probe+0x291/0xf60 drivers/base/dd.c:576
 driver_probe_device+0x298/0x410 drivers/base/dd.c:763
 __device_attach_driver+0x203/0x2c0 drivers/base/dd.c:870
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:431
 __device_attach+0x228/0x4a0 drivers/base/dd.c:938
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0xbe0/0x2100 drivers/base/core.c:3324
 usb_set_configuration+0x113f/0x1910 drivers/usb/core/message.c:2164
 usb_generic_driver_probe+0xba/0x100 drivers/usb/core/generic.c:238
page last free stack trace:
 reset_page_owner include/linux/page_owner.h:24 [inline]
 free_pages_prepare mm/page_alloc.c:1355 [inline]
 free_pcp_prepare+0x2c5/0x780 mm/page_alloc.c:1406
 free_unref_page_prepare mm/page_alloc.c:3341 [inline]
 free_unref_page+0x19/0x690 mm/page_alloc.c:3420
 __refcount_sub_and_test include/linux/refcount.h:282 [inline]
 __refcount_dec_and_test include/linux/refcount.h:315 [inline]
 refcount_dec_and_test include/linux/refcount.h:333 [inline]
 kref_put.constprop.0.isra.0+0x3d/0x7e include/linux/kref.h:64
 em28xx_ir_fini.cold+0x7c/0x120 drivers/media/usb/em28xx/em28xx-input.c:875
 em28xx_close_extension+0xc9/0x2a0 drivers/media/usb/em28xx/em28xx-core.c:1143
 em28xx_usb_disconnect.cold+0x14b/0x237 drivers/media/usb/em28xx/em28xx-cards.c:4140
 usb_unbind_interface+0x1d8/0x8d0 drivers/usb/core/driver.c:458
 __device_release_driver+0x3bd/0x6f0 drivers/base/dd.c:1181
 device_release_driver_internal drivers/base/dd.c:1212 [inline]
 device_release_driver+0x26/0x40 drivers/base/dd.c:1235
 bus_remove_device+0x2eb/0x5a0 drivers/base/bus.c:533
 device_del+0x502/0xd40 drivers/base/core.c:3512
 usb_disable_device+0x35b/0x7b0 drivers/usb/core/message.c:1413
 usb_disconnect.cold+0x27a/0x78e drivers/usb/core/hub.c:2221
 hub_port_connect drivers/usb/core/hub.c:5129 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5418 [inline]
 port_event drivers/usb/core/hub.c:5564 [inline]
 hub_event+0x1c9c/0x4330 drivers/usb/core/hub.c:5646
 process_one_work+0x98d/0x1630 kernel/workqueue.c:2276
 process_scheduled_works kernel/workqueue.c:2338 [inline]
 worker_thread+0x85c/0x11f0 kernel/workqueue.c:2424

Memory state around the buggy address:
 ffff888021aa8100: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff888021aa8180: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>ffff888021aa8200: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
                                                    ^
 ffff888021aa8280: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff888021aa8300: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
