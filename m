Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAFC0145EDA
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2020 23:58:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgAVW6J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jan 2020 17:58:09 -0500
Received: from mail-io1-f72.google.com ([209.85.166.72]:55907 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbgAVW6J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jan 2020 17:58:09 -0500
Received: by mail-io1-f72.google.com with SMTP id z21so742860iob.22
        for <linux-media@vger.kernel.org>; Wed, 22 Jan 2020 14:58:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=pmeMxbWQ6wl2cb2vu9yDocNVRieqKicTUlv6dyeXBWY=;
        b=TUWf9ggi1MyI/dWaLWXQt3xXrFSaxnXlt5m2vFsv7gvqLr1qg9PYMcIAwfYIDhVlNi
         1pPdVCQR96yH/nX/+j91orqnrF6TOwVIsJLGCG0n5GpGqY8SRV67a7+SFjhl43ybXW2y
         B2gqzclXn45pr4Wzv2BWs8SIEB4hr1RqWpWTjYrGRTxszz7UKQUsTFFg9W/oVOzpUWsT
         oYnkJulCVS7CJPTO31MX90IcbY4aoIEh8SZS58M5yzSRvLz83pXvz/vgh3ma4NQLdTwu
         yChrslHyDCxeWyJ0zLaKWrNao8aNZkNM3Vi+YJvrYEZL54r9XEq1DVLcBlbm8dkEGlw5
         8Bfw==
X-Gm-Message-State: APjAAAV2IpJlxY3XpI4EFNWMg0STSoFwLZ0qLYWj1vRLeQKWGKwzHi2d
        0Ud2u3r9hjfnc1dOeIuwdkDx5wHks2xhizcVDlpet4N6D2lN
X-Google-Smtp-Source: APXvYqzXLkDDsC6ww6FF8B05eKmDWNktPk3hOkAS2IWHITpAcLcHBMw3boLbGQ/KrDbSqHRQkL+lr3ueogAs2lRHgersDa4X6jGJ
MIME-Version: 1.0
X-Received: by 2002:a5d:9514:: with SMTP id d20mr9019317iom.198.1579733888227;
 Wed, 22 Jan 2020 14:58:08 -0800 (PST)
Date:   Wed, 22 Jan 2020 14:58:08 -0800
In-Reply-To: <000000000000de50d7059ba6acd5@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003f62d6059cc27590@google.com>
Subject: Re: KASAN: use-after-free Read in v4l2_release (3)
From:   syzbot <syzbot+75287f75e2fedd69d680@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, bnvandana@gmail.com,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot has found a reproducer for the following crash on:

HEAD commit:    4cc301ee usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=17f5a721e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9ba75825443d54bd
dashboard link: https://syzkaller.appspot.com/bug?extid=75287f75e2fedd69d680
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16a0b6f1e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1327dd76e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+75287f75e2fedd69d680@syzkaller.appspotmail.com

usbvision_set_audio: can't write iopin register for audio switching
usbvision_radio_close: Final disconnect
==================================================================
BUG: KASAN: use-after-free in v4l2_release+0x2f1/0x390 drivers/media/v4l2-core/v4l2-dev.c:459
Read of size 4 at addr ffff8881caba1068 by task v4l_id/1913

CPU: 1 PID: 1913 Comm: v4l_id Not tainted 5.5.0-rc6-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0xef/0x16e lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0xd3/0x314 mm/kasan/report.c:374
 __kasan_report.cold+0x37/0x85 mm/kasan/report.c:506
 kasan_report+0xe/0x20 mm/kasan/common.c:639
 v4l2_release+0x2f1/0x390 drivers/media/v4l2-core/v4l2-dev.c:459
 __fput+0x2d7/0x840 fs/file_table.c:280
 task_work_run+0x13f/0x1c0 kernel/task_work.c:113
 tracehook_notify_resume include/linux/tracehook.h:188 [inline]
 exit_to_usermode_loop+0x1d2/0x200 arch/x86/entry/common.c:164
 prepare_exit_to_usermode arch/x86/entry/common.c:195 [inline]
 syscall_return_slowpath arch/x86/entry/common.c:278 [inline]
 do_syscall_64+0x4e0/0x5a0 arch/x86/entry/common.c:304
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x7fbeb0b822b0
Code: 40 75 0b 31 c0 48 83 c4 08 e9 0c ff ff ff 48 8d 3d c5 32 08 00 e8 c0 07 02 00 83 3d 45 a3 2b 00 00 75 10 b8 03 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 31 c3 48 83 ec 08 e8 ce 8a 01 00 48 89 04 24
RSP: 002b:00007ffe52d6b158 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 0000000000000003 RCX: 00007fbeb0b822b0
RDX: 0000000000000013 RSI: 0000000080685600 RDI: 0000000000000003
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000400884
R13: 00007ffe52d6b2b0 R14: 0000000000000000 R15: 0000000000000000

Allocated by task 94:
 save_stack+0x1b/0x80 mm/kasan/common.c:72
 set_track mm/kasan/common.c:80 [inline]
 __kasan_kmalloc mm/kasan/common.c:513 [inline]
 __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:486
 kmalloc include/linux/slab.h:556 [inline]
 kzalloc include/linux/slab.h:670 [inline]
 usbvision_alloc drivers/media/usb/usbvision/usbvision-video.c:1315 [inline]
 usbvision_probe.cold+0x5c5/0x1f21 drivers/media/usb/usbvision/usbvision-video.c:1469
 usb_probe_interface+0x310/0x800 drivers/usb/core/driver.c:361
 really_probe+0x290/0xad0 drivers/base/dd.c:548
 driver_probe_device+0x223/0x350 drivers/base/dd.c:721
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:828
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
 __device_attach+0x217/0x390 drivers/base/dd.c:894
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
 device_add+0x1459/0x1bf0 drivers/base/core.c:2487
 usb_set_configuration+0xe47/0x17d0 drivers/usb/core/message.c:2023
 generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
 usb_probe_device+0xaf/0x140 drivers/usb/core/driver.c:266
 really_probe+0x290/0xad0 drivers/base/dd.c:548
 driver_probe_device+0x223/0x350 drivers/base/dd.c:721
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:828
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
 __device_attach+0x217/0x390 drivers/base/dd.c:894
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
 device_add+0x1459/0x1bf0 drivers/base/core.c:2487
 usb_new_device.cold+0x540/0xcd0 drivers/usb/core/hub.c:2537
 hub_port_connect drivers/usb/core/hub.c:5184 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5324 [inline]
 port_event drivers/usb/core/hub.c:5470 [inline]
 hub_event+0x21cb/0x4300 drivers/usb/core/hub.c:5552
 process_one_work+0x945/0x15c0 kernel/workqueue.c:2264
 process_scheduled_works kernel/workqueue.c:2326 [inline]
 worker_thread+0x7ab/0xe20 kernel/workqueue.c:2412
 kthread+0x318/0x420 kernel/kthread.c:255
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Freed by task 1913:
 save_stack+0x1b/0x80 mm/kasan/common.c:72
 set_track mm/kasan/common.c:80 [inline]
 kasan_set_free_info mm/kasan/common.c:335 [inline]
 __kasan_slab_free+0x117/0x160 mm/kasan/common.c:474
 slab_free_hook mm/slub.c:1425 [inline]
 slab_free_freelist_hook mm/slub.c:1458 [inline]
 slab_free mm/slub.c:3005 [inline]
 kfree+0xd5/0x300 mm/slub.c:3957
 usbvision_release+0x181/0x1c0 drivers/media/usb/usbvision/usbvision-video.c:1364
 usbvision_radio_close.cold+0x2b/0x74 drivers/media/usb/usbvision/usbvision-video.c:1130
 v4l2_release+0x2e7/0x390 drivers/media/v4l2-core/v4l2-dev.c:455
 __fput+0x2d7/0x840 fs/file_table.c:280
 task_work_run+0x13f/0x1c0 kernel/task_work.c:113
 tracehook_notify_resume include/linux/tracehook.h:188 [inline]
 exit_to_usermode_loop+0x1d2/0x200 arch/x86/entry/common.c:164
 prepare_exit_to_usermode arch/x86/entry/common.c:195 [inline]
 syscall_return_slowpath arch/x86/entry/common.c:278 [inline]
 do_syscall_64+0x4e0/0x5a0 arch/x86/entry/common.c:304
 entry_SYSCALL_64_after_hwframe+0x49/0xbe

The buggy address belongs to the object at ffff8881caba0000
 which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 4200 bytes inside of
 8192-byte region [ffff8881caba0000, ffff8881caba2000)
The buggy address belongs to the page:
page:ffffea00072ae800 refcount:1 mapcount:0 mapping:ffff8881da00c500 index:0x0 compound_mapcount: 0
raw: 0200000000010200 dead000000000100 dead000000000122 ffff8881da00c500
raw: 0000000000000000 0000000080020002 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff8881caba0f00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8881caba0f80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff8881caba1000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                          ^
 ffff8881caba1080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8881caba1100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================

