Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B05EA3B3BCE
	for <lists+linux-media@lfdr.de>; Fri, 25 Jun 2021 06:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbhFYEzi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Jun 2021 00:55:38 -0400
Received: from mail-il1-f199.google.com ([209.85.166.199]:37672 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbhFYEzf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Jun 2021 00:55:35 -0400
Received: by mail-il1-f199.google.com with SMTP id g12-20020a056e021a2cb02901dfc46878d8so5490875ile.4
        for <linux-media@vger.kernel.org>; Thu, 24 Jun 2021 21:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=zhr7fMoDKbzjVLdMuqznadruuc1rpsivuLCxZxT2TaY=;
        b=ACAm6nzDcJdbWM3BC/sCiPYanfH4mVCwEMJcP75VX7IW1EMhwe7LMK2Ei77DiFUL96
         /U0zo4Iwyp/gGI7xTvTDvf5xpJpPxk5bGsgweBKgv0SGzPYjCZ+dcxnMSaxAyQeHeKmw
         Xn+ACPb77i6bw+DEawZvLrzDu93dtNwxDtH3nea0JjXWVVQb/S6eygeOKjkDRcmLe0eW
         4LLgl0ohDU3LD/9NmQqNErrbyBtQcPVZAYl3FpZfh8Kz41FHt5cViQsnEwfTMc8pjxR7
         ayoGT3XLrPCwckFsgxSN5tyVuTcCRVO3JBnnMZsf3d26GKMXB+7kmVTHqjCda82fYNez
         FGDQ==
X-Gm-Message-State: AOAM533OIPDtSIlg0OyJsTK2lAHC7izoxAW38WAOpFgYiA4/38lPuiXt
        WiRAJxevi6caz9ia02eK6xe0igk10TmUiR9cIrbYBPQ147c1
X-Google-Smtp-Source: ABdhPJwjmCO+WSG+VbYMAOrToTxJTiTTcI002XJQzGSEzm77cbIAVij+lgP8H1HzX6C6j95uEJvYgJ5JrOgocp2tLnrjI/XstbPT
MIME-Version: 1.0
X-Received: by 2002:a02:bb85:: with SMTP id g5mr5220309jan.61.1624596795496;
 Thu, 24 Jun 2021 21:53:15 -0700 (PDT)
Date:   Thu, 24 Jun 2021 21:53:15 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e61e2105c58fea48@google.com>
Subject: [syzbot] KASAN: use-after-free Read in v4l2_ioctl (2)
From:   syzbot <syzbot+19c5a4b75931e8d63aab@syzkaller.appspotmail.com>
To:     ezequiel@collabora.com, hverkuil-cisco@xs4all.nl,
        lijian@yulong.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    a1f92694 Add linux-next specific files for 20210518
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=12cb6184300000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d612e75ffd53a6d3
dashboard link: https://syzkaller.appspot.com/bug?extid=19c5a4b75931e8d63aab
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13f87f20300000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11f82d34300000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+19c5a4b75931e8d63aab@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in v4l2_ioctl+0x1f1/0x250 drivers/media/v4l2-core/v4l2-dev.c:364
Read of size 8 at addr ffff88801dc54398 by task v4l_id/25000

CPU: 0 PID: 25000 Comm: v4l_id Not tainted 5.13.0-rc2-next-20210518-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x13e/0x1d6 lib/dump_stack.c:129
 print_address_description.constprop.0.cold+0x6c/0x309 mm/kasan/report.c:233
 __kasan_report mm/kasan/report.c:419 [inline]
 kasan_report.cold+0x83/0xdf mm/kasan/report.c:436
 v4l2_ioctl+0x1f1/0x250 drivers/media/v4l2-core/v4l2-dev.c:364
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:1069 [inline]
 __se_sys_ioctl fs/ioctl.c:1055 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:1055
 do_syscall_64+0x31/0xb0 arch/x86/entry/common.c:47
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f30112bb017
Code: 00 00 00 48 8b 05 81 7e 2b 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 51 7e 2b 00 f7 d8 64 89 01 48
RSP: 002b:00007ffcfc119d68 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f30112bb017
RDX: 00007ffcfc119d70 RSI: 0000000080685600 RDI: 0000000000000003
RBP: 0000000000000003 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000002 R11: 0000000000000246 R12: 000055f2227cb8d0
R13: 00007ffcfc119ed0 R14: 0000000000000000 R15: 0000000000000000

Allocated by task 12321:
 kasan_save_stack+0x1b/0x40 mm/kasan/common.c:38
 kasan_set_track mm/kasan/common.c:46 [inline]
 set_alloc_info mm/kasan/common.c:431 [inline]
 ____kasan_kmalloc mm/kasan/common.c:510 [inline]
 ____kasan_kmalloc mm/kasan/common.c:469 [inline]
 __kasan_kmalloc+0x9b/0xd0 mm/kasan/common.c:519
 kmalloc include/linux/slab.h:590 [inline]
 kzalloc include/linux/slab.h:720 [inline]
 stk_camera_probe+0x7d/0xc50 drivers/media/usb/stkwebcam/stk-webcam.c:1281
 usb_probe_interface+0x315/0x7f0 drivers/usb/core/driver.c:396
 really_probe+0x291/0xf60 drivers/base/dd.c:576
 driver_probe_device+0x298/0x410 drivers/base/dd.c:763
 __device_attach_driver+0x203/0x2c0 drivers/base/dd.c:870
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:431
 __device_attach+0x228/0x4a0 drivers/base/dd.c:938
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0xbe0/0x2100 drivers/base/core.c:3320
 usb_set_configuration+0x113f/0x1910 drivers/usb/core/message.c:2164
 usb_generic_driver_probe+0xba/0x100 drivers/usb/core/generic.c:238
 usb_probe_device+0xd9/0x2c0 drivers/usb/core/driver.c:293
 really_probe+0x291/0xf60 drivers/base/dd.c:576
 driver_probe_device+0x298/0x410 drivers/base/dd.c:763
 __device_attach_driver+0x203/0x2c0 drivers/base/dd.c:870
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:431
 __device_attach+0x228/0x4a0 drivers/base/dd.c:938
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0xbe0/0x2100 drivers/base/core.c:3320
 usb_new_device.cold+0x721/0x1058 drivers/usb/core/hub.c:2556
 hub_port_connect drivers/usb/core/hub.c:5276 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5416 [inline]
 port_event drivers/usb/core/hub.c:5562 [inline]
 hub_event+0x2357/0x4330 drivers/usb/core/hub.c:5644
 process_one_work+0x98d/0x1600 kernel/workqueue.c:2275
 worker_thread+0x64c/0x1120 kernel/workqueue.c:2421
 kthread+0x3b1/0x4a0 kernel/kthread.c:313
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294

Freed by task 16814:
 kasan_save_stack+0x1b/0x40 mm/kasan/common.c:38
 kasan_set_track+0x1c/0x30 mm/kasan/common.c:46
 kasan_set_free_info+0x20/0x30 mm/kasan/generic.c:357
 ____kasan_slab_free mm/kasan/common.c:363 [inline]
 ____kasan_slab_free mm/kasan/common.c:328 [inline]
 __kasan_slab_free+0xfb/0x130 mm/kasan/common.c:371
 kasan_slab_free include/linux/kasan.h:212 [inline]
 slab_free_hook mm/slub.c:1623 [inline]
 slab_free_freelist_hook+0xdf/0x240 mm/slub.c:1648
 slab_free mm/slub.c:3208 [inline]
 kfree+0xeb/0x650 mm/slub.c:4274
 usb_unbind_interface+0x1d8/0x8d0 drivers/usb/core/driver.c:458
 __device_release_driver+0x3bd/0x6f0 drivers/base/dd.c:1181
 device_release_driver_internal drivers/base/dd.c:1212 [inline]
 device_release_driver+0x26/0x40 drivers/base/dd.c:1235
 bus_remove_device+0x2eb/0x5a0 drivers/base/bus.c:533
 device_del+0x502/0xd40 drivers/base/core.c:3508
 usb_disable_device+0x35b/0x7b0 drivers/usb/core/message.c:1413
 usb_disconnect.cold+0x27a/0x78e drivers/usb/core/hub.c:2219
 hub_port_connect drivers/usb/core/hub.c:5127 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5416 [inline]
 port_event drivers/usb/core/hub.c:5562 [inline]
 hub_event+0x1c9c/0x4330 drivers/usb/core/hub.c:5644
 process_one_work+0x98d/0x1600 kernel/workqueue.c:2275
 worker_thread+0x64c/0x1120 kernel/workqueue.c:2421
 kthread+0x3b1/0x4a0 kernel/kthread.c:313
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294

The buggy address belongs to the object at ffff88801dc54000
 which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 920 bytes inside of
 4096-byte region [ffff88801dc54000, ffff88801dc55000)
The buggy address belongs to the page:
page:ffffea0000771400 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1dc50
head:ffffea0000771400 order:3 compound_mapcount:0 compound_pincount:0
flags: 0xfff00000010200(slab|head|node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000010200 0000000000000000 0000000100000001 ffff888011042140
raw: 0000000000000000 0000000000040004 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd2040(__GFP_IO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 11559, ts 1619924100847, free_ts 1619644095689
 prep_new_page mm/page_alloc.c:2377 [inline]
 get_page_from_freelist+0x125c/0x2ed0 mm/page_alloc.c:4038
 __alloc_pages+0x1b2/0x500 mm/page_alloc.c:5239
 alloc_pages+0x18c/0x2a0 mm/mempolicy.c:2272
 alloc_slab_page mm/slub.c:1686 [inline]
 allocate_slab+0x2c2/0x4c0 mm/slub.c:1826
 new_slab mm/slub.c:1889 [inline]
 new_slab_objects mm/slub.c:2635 [inline]
 ___slab_alloc+0x4ba/0x820 mm/slub.c:2798
 __slab_alloc.constprop.0+0xa7/0xf0 mm/slub.c:2838
 slab_alloc_node mm/slub.c:2920 [inline]
 slab_alloc mm/slub.c:2962 [inline]
 __kmalloc+0x312/0x330 mm/slub.c:4112
 kmalloc include/linux/slab.h:595 [inline]
 tomoyo_realpath_from_path+0xc3/0x620 security/tomoyo/realpath.c:254
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_path_perm+0x21b/0x400 security/tomoyo/file.c:822
 security_inode_getattr+0xcf/0x140 security/security.c:1332
 vfs_getattr fs/stat.c:139 [inline]
 vfs_statx+0x164/0x390 fs/stat.c:207
 vfs_fstatat fs/stat.c:225 [inline]
 vfs_lstat include/linux/fs.h:3384 [inline]
 __do_sys_newlstat+0x91/0x110 fs/stat.c:380
 do_syscall_64+0x31/0xb0 arch/x86/entry/common.c:47
 entry_SYSCALL_64_after_hwframe+0x44/0xae
page last free stack trace:
 reset_page_owner include/linux/page_owner.h:24 [inline]
 free_pages_prepare mm/page_alloc.c:1305 [inline]
 __free_pages_ok+0x4cb/0xf30 mm/page_alloc.c:1586
 qlink_free mm/kasan/quarantine.c:146 [inline]
 qlist_free_all+0x5a/0xc0 mm/kasan/quarantine.c:165
 kasan_quarantine_reduce+0x180/0x200 mm/kasan/quarantine.c:272
 __kasan_slab_alloc+0x8e/0xa0 mm/kasan/common.c:441
 kasan_slab_alloc include/linux/kasan.h:236 [inline]
 slab_post_alloc_hook mm/slab.h:512 [inline]
 slab_alloc_node mm/slub.c:2954 [inline]
 slab_alloc mm/slub.c:2962 [inline]
 kmem_cache_alloc+0x285/0x4a0 mm/slub.c:2967
 getname_flags.part.0+0x50/0x4f0 fs/namei.c:138
 getname_flags include/linux/audit.h:319 [inline]
 getname fs/namei.c:209 [inline]
 __do_sys_unlink fs/namei.c:4139 [inline]
 __se_sys_unlink fs/namei.c:4137 [inline]
 __x64_sys_unlink+0xb1/0x100 fs/namei.c:4137
 do_syscall_64+0x31/0xb0 arch/x86/entry/common.c:47
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Memory state around the buggy address:
 ffff88801dc54280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88801dc54300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88801dc54380: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                            ^
 ffff88801dc54400: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88801dc54480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
