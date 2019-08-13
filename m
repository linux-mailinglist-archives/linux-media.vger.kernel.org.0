Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8D818B887
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 14:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727860AbfHMM2Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 08:28:16 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43344 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727738AbfHMM2P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 08:28:15 -0400
Received: by mail-pf1-f193.google.com with SMTP id v12so3743193pfn.10
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2019 05:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o4jG5xUhAUJZtV3VJiJndVYqDs9JDKOuEWpeDm9O5bE=;
        b=SZWKgi+GtqLEMCmB2uAgjZbHFJfbEhWmi0vz/nUZ9UwbS/lkjG2cnMve4ql4ukoLIS
         GLd3QccUV6PJzEoDoL8YkK3teNF6XW70PIdvYBYeWC5LMhBhGKT7oCne/XgoT2ZdI6Hg
         2wSjP3i1urjij/pSgKTRe+xKnitMjGLxTZic2egHHfuFbaa3W24dMFa/jpLgY72cYE7r
         kKS5vPI7L/aK9ToW617/GxRZnJ+vQVqu4N7UadHB4zpzZg0JOCf1lbSviXpWVYN7v0IB
         /WTE0FFH+9Bg7CfOYjFM8ImIFGMd26ZelSelBLDuM0XE9I592d0AYJDXkUB9CeC7QYVP
         Wr6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o4jG5xUhAUJZtV3VJiJndVYqDs9JDKOuEWpeDm9O5bE=;
        b=MOL1/TriBRjMoKQ3KDBkgtLuLNo+ri80/vt1MwhfHdTTRCMsc8USeHg8lmeBiuFfT8
         AuZealRr5CkhZbNoLPf5tOc80hoamETJ0lxsoA7hAWue4M+VN2HooaW1EZb/yhNyIxi4
         wT8Zxv+suft3qeu6Sn0CBIqDTKWGZkHEz21kKoJOJWVXSWqN38/6WEGego8aoqgmoghO
         4vvxNDk9C7JTpjwIUaJL0izpOJ5+M4zmQ5iL3cWKk3/X9TKJnPgGgD2Pc4/iaExCR/o2
         FrDR57uMDc/gqDdkAUS5qk/Ggx9NKEJl0G3r1PrUX5Xcj2zKLUIlc0ZMuEKw94e2r6/v
         xvTQ==
X-Gm-Message-State: APjAAAX0YnFY7GdIpfqLvg3UyzYsHYpb7UBx7r3VztxH9LrmwLlzm01M
        BOjxYCSofX8w7sgV+Rs5i2fkwj+m4EHN1u+HLV421A==
X-Google-Smtp-Source: APXvYqxIB2bWV/Z2kD1G5C2XJ1KyB1ofIYU0nvkAABlDU3pdmkMcBP8meCnmXxavPJ2mncL2fdoIkJVoE1x531NSB2M=
X-Received: by 2002:aa7:9790:: with SMTP id o16mr3598839pfp.51.1565699294597;
 Tue, 13 Aug 2019 05:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000014c6b305868311d3@google.com>
In-Reply-To: <00000000000014c6b305868311d3@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 13 Aug 2019 14:28:03 +0200
Message-ID: <CAAeHK+y4RwTg+ozvgYmFjjaBAr3+UfN5V+rVHakcMaeR8BHquQ@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in __video_do_ioctl
To:     syzbot <syzbot+5b7575b3f6820232e17c@syzkaller.appspotmail.com>
Cc:     ezequiel@collabora.com, Hans Verkuil <hans.verkuil@cisco.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
        USB list <linux-usb@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        niklas.soderlund+renesas@ragnatech.se,
        paul.kocialkowski@bootlin.com,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Apr 14, 2019 at 10:06 PM syzbot
<syzbot+5b7575b3f6820232e17c@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    9a33b369 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan/tree/usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=1317cedd200000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=23e37f59d94ddd15
> dashboard link: https://syzkaller.appspot.com/bug?extid=5b7575b3f6820232e17c
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
>
> Unfortunately, I don't have any reproducer for this crash yet.
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+5b7575b3f6820232e17c@syzkaller.appspotmail.com
>
> radio-raremono 6-1:0.210: raremono_cmd_main failed (-71)
> radio-raremono 6-1:0.210: V4L2 device registered as radio32
> usb 6-1: USB disconnect, device number 119
> radio-raremono 6-1:0.210: Thanko's Raremono disconnected
> ==================================================================
> BUG: KASAN: use-after-free in __mutex_lock_common
> kernel/locking/mutex.c:1009 [inline]
> BUG: KASAN: use-after-free in __mutex_lock+0x11ad/0x12b0
> kernel/locking/mutex.c:1072
> Read of size 8 at addr ffff888097e94bf8 by task v4l_id/7329
>
> CPU: 1 PID: 7329 Comm: v4l_id Not tainted 5.1.0-rc4-319354-g9a33b36 #3
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011
> Call Trace:
>   __dump_stack lib/dump_stack.c:77 [inline]
>   dump_stack+0xe8/0x16e lib/dump_stack.c:113
>   print_address_description+0x6c/0x236 mm/kasan/report.c:187
>   kasan_report.cold+0x1a/0x3c mm/kasan/report.c:317
>   __mutex_lock_common kernel/locking/mutex.c:1009 [inline]
>   __mutex_lock+0x11ad/0x12b0 kernel/locking/mutex.c:1072
>   __video_do_ioctl+0x5d2/0xb40 drivers/media/v4l2-core/v4l2-ioctl.c:2842
> usb 5-1: Using ep0 maxpacket: 8
>   video_usercopy+0x44e/0xf00 drivers/media/v4l2-core/v4l2-ioctl.c:3056
>   v4l2_ioctl+0x14e/0x1a0 drivers/media/v4l2-core/v4l2-dev.c:364

#syz dup: KASAN: use-after-free Read in v4l2_ioctl

>   vfs_ioctl fs/ioctl.c:46 [inline]
>   file_ioctl fs/ioctl.c:509 [inline]
>   do_vfs_ioctl+0xced/0x12f0 fs/ioctl.c:696
>   ksys_ioctl+0xa0/0xc0 fs/ioctl.c:713
>   __do_sys_ioctl fs/ioctl.c:720 [inline]
>   __se_sys_ioctl fs/ioctl.c:718 [inline]
>   __x64_sys_ioctl+0x74/0xb0 fs/ioctl.c:718
>   do_syscall_64+0xcf/0x4f0 arch/x86/entry/common.c:290
>   entry_SYSCALL_64_after_hwframe+0x49/0xbe
> RIP: 0033:0x7f582f197347
> Code: 90 90 90 48 8b 05 f1 fa 2a 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff
> ff c3 90 90 90 90 90 90 90 90 90 90 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff
> ff 73 01 c3 48 8b 0d c1 fa 2a 00 31 d2 48 29 c2 64
> usb 5-1: config 0 has an invalid interface number: 85 but max is 0
> RSP: 002b:00007ffda90c77a8 EFLAGS: 00000202 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f582f197347
> RDX: 00007ffda90c77b0 RSI: 0000000080685600 RDI: 0000000000000003
> RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000400884
> R13: 00007ffda90c7900 R14: 0000000000000000 R15: 0000000000000000
>
> Allocated by task 5:
>   set_track mm/kasan/common.c:87 [inline]
>   __kasan_kmalloc mm/kasan/common.c:497 [inline]
>   __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:470
>   slab_post_alloc_hook mm/slab.h:437 [inline]
>   slab_alloc_node mm/slub.c:2756 [inline]
>   __kmalloc_node_track_caller+0xf3/0x320 mm/slub.c:4372
>   alloc_dr drivers/base/devres.c:103 [inline]
>   devm_kmalloc+0x8c/0x190 drivers/base/devres.c:793
>   devm_kzalloc include/linux/device.h:679 [inline]
>   usb_raremono_probe+0x34/0x235 drivers/media/radio/radio-raremono.c:298
>   usb_probe_interface+0x31d/0x820 drivers/usb/core/driver.c:361
>   really_probe+0x2da/0xb10 drivers/base/dd.c:509
> usb 5-1: config 0 has no interface number 0
>   driver_probe_device+0x21d/0x350 drivers/base/dd.c:671
>   __device_attach_driver+0x1d8/0x290 drivers/base/dd.c:778
>   bus_for_each_drv+0x163/0x1e0 drivers/base/bus.c:454
>   __device_attach+0x223/0x3a0 drivers/base/dd.c:844
>   bus_probe_device+0x1f1/0x2a0 drivers/base/bus.c:514
>   device_add+0xad2/0x16e0 drivers/base/core.c:2106
>   usb_set_configuration+0xdf7/0x1740 drivers/usb/core/message.c:2021
>   generic_probe+0xa2/0xda drivers/usb/core/generic.c:210
>   usb_probe_device+0xc0/0x150 drivers/usb/core/driver.c:266
>   really_probe+0x2da/0xb10 drivers/base/dd.c:509
>   driver_probe_device+0x21d/0x350 drivers/base/dd.c:671
>   __device_attach_driver+0x1d8/0x290 drivers/base/dd.c:778
>   bus_for_each_drv+0x163/0x1e0 drivers/base/bus.c:454
>   __device_attach+0x223/0x3a0 drivers/base/dd.c:844
> usb 5-1: New USB device found, idVendor=04b3, idProduct=4001, bcdDevice=
> 1.10
>   bus_probe_device+0x1f1/0x2a0 drivers/base/bus.c:514
>   device_add+0xad2/0x16e0 drivers/base/core.c:2106
>   usb_new_device.cold+0x537/0xccf drivers/usb/core/hub.c:2534
> usb 5-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
>   hub_port_connect drivers/usb/core/hub.c:5089 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
>   port_event drivers/usb/core/hub.c:5350 [inline]
>   hub_event+0x138e/0x3b00 drivers/usb/core/hub.c:5432
>   process_one_work+0x90f/0x1580 kernel/workqueue.c:2269
>   worker_thread+0x9b/0xe20 kernel/workqueue.c:2415
>   kthread+0x313/0x420 kernel/kthread.c:253
>   ret_from_fork+0x3a/0x50 arch/x86/entry/entry_64.S:352
>
> Freed by task 5:
>   set_track mm/kasan/common.c:87 [inline]
>   __kasan_slab_free+0x130/0x180 mm/kasan/common.c:459
>   slab_free_hook mm/slub.c:1429 [inline]
>   slab_free_freelist_hook+0x5e/0x140 mm/slub.c:1456
> usb 5-1: config 0 descriptor??
>   slab_free mm/slub.c:3003 [inline]
>   kfree+0xce/0x290 mm/slub.c:3958
>   release_nodes+0x4ac/0x920 drivers/base/devres.c:508
>   devres_release_all+0x79/0xc8 drivers/base/devres.c:529
>   __device_release_driver drivers/base/dd.c:1086 [inline]
>   device_release_driver_internal+0x23a/0x4f0 drivers/base/dd.c:1113
>   bus_remove_device+0x302/0x5c0 drivers/base/bus.c:556
>   device_del+0x467/0xb90 drivers/base/core.c:2269
>   usb_disable_device+0x242/0x790 drivers/usb/core/message.c:1235
> usb-storage 5-1:0.85: USB Mass Storage device detected
>   usb_disconnect+0x298/0x870 drivers/usb/core/hub.c:2197
>   hub_port_connect drivers/usb/core/hub.c:4940 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
>   port_event drivers/usb/core/hub.c:5350 [inline]
>   hub_event+0xcd2/0x3b00 drivers/usb/core/hub.c:5432
> usb-storage 5-1:0.85: Quirks match for vid 04b3 pid 4001: 2000
>   process_one_work+0x90f/0x1580 kernel/workqueue.c:2269
>   process_scheduled_works kernel/workqueue.c:2331 [inline]
>   worker_thread+0x7b0/0xe20 kernel/workqueue.c:2417
>   kthread+0x313/0x420 kernel/kthread.c:253
>   ret_from_fork+0x3a/0x50 arch/x86/entry/entry_64.S:352
>
> The buggy address belongs to the object at ffff888097e94400
>   which belongs to the cache kmalloc-4k of size 4096
> The buggy address is located 2040 bytes inside of
>   4096-byte region [ffff888097e94400, ffff888097e95400)
> The buggy address belongs to the page:
> page:ffffea00025fa400 count:1 mapcount:0 mapping:ffff88812c3f4600 index:0x0
> compound_mapcount: 0
> flags: 0xfff00000010200(slab|head)
> raw: 00fff00000010200 dead000000000100 dead000000000200 ffff88812c3f4600
> raw: 0000000000000000 0000000000070007 00000001ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
>
> Memory state around the buggy address:
>   ffff888097e94a80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>   ffff888097e94b00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> > ffff888097e94b80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                                                                  ^
>   ffff888097e94c00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>   ffff888097e94c80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ==================================================================
>
>
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
