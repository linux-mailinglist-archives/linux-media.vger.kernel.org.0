Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FDA38B94A
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 14:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728342AbfHMM7B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 08:59:01 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46419 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728746AbfHMM7B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 08:59:01 -0400
Received: by mail-pl1-f195.google.com with SMTP id c2so49244670plz.13
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2019 05:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DhHHMldNA11v/SK2WsSGLAU/UTQ6fOX7HQpywB8nTAU=;
        b=tCss9UF0DCoJJ290xSMja7MfUntYGAEA1DeuVnFyDUwT89HpJGVAWMYMXZB77kRjR4
         GadDe3W7BIM704633FeIsD26lvjvTcSbYvl09t42QRUgUh4XIKkAB4t3vupGgkTEXqcB
         +UihTQ4zJKnWd8y9aQOdY3uQduUEix1nIyy4hD7vR/+oD8jjW7o/8N0UCK89Jihl4RHK
         8zvT1b3Txgr4bcUOHfFRlnWMOIRg0fa36KMkyr3I9HN0yBk4OG6OXgjv1sTW5odPuUE/
         AVZ2WF7HvtsCFzMQcNZ/oPdo31vxHWCT3eLMk1aC/fhljxrnOLZHyBDCwm8m97Mnnvz/
         9yAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DhHHMldNA11v/SK2WsSGLAU/UTQ6fOX7HQpywB8nTAU=;
        b=Vo5oeLbqv/YzEhowe9q5a+i4ncFosGg8sxFdBzangAtIFmlK/BPRxyt3vsVn9IDWwj
         ZPbbEQbQnYmt4PzLZmeRHY6RgYENNY0f5JubFy3olsjdZzX9Q9NGtSO139hQUHQqUTGH
         P9DrV+2DuXHuZtM9G3gjpi9QOe3E8ht2FkvLgcTMbRqnxIiwwuNC5j2xq01WfmVScrW8
         thDloWsPVIbIUipYtvAswkRRteo8WVGlqvGMzRl0oXhP4tTSlKSTpeQaDONcTv3PI+t5
         X8/+T7KB2DzDLkaqz9mD28Nijbxm0LW2ERQ/RBb8C0o5xKAFpMf6RhBczP0KbVL5MxU2
         /VKQ==
X-Gm-Message-State: APjAAAWHacYB0Z8Z57khCSPAg7rtj4WylqNV+xfNy3a6XA2GsAgb6z+T
        Jb7aaMh7anyGqsGPMUThXbFurGCpTDDkj19yqvL/ug==
X-Google-Smtp-Source: APXvYqzIOrQplJqd1l29SMBrKZETtZ3wT3HiZ92VFmevqGu0OWai1bWa1/BQWF/Fyd0j9dW0uRCuRvFkZ72wLiuF4LQ=
X-Received: by 2002:a17:902:bb94:: with SMTP id m20mr5204966pls.336.1565701139685;
 Tue, 13 Aug 2019 05:58:59 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000c08c230587e6e01e@google.com>
In-Reply-To: <000000000000c08c230587e6e01e@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 13 Aug 2019 14:58:48 +0200
Message-ID: <CAAeHK+zug7cAxPxhziuXzufxuBf=+=JDYix+BTyv2qz8VTRM_Q@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in v4l2_fh_del
To:     syzbot <syzbot+d53275bc1af5eb01bfff@syzkaller.appspotmail.com>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
        USB list <linux-usb@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 2, 2019 at 2:36 PM syzbot
<syzbot+d53275bc1af5eb01bfff@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    43151d6c usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=145cd8ff200000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=4183eeef650d1234
> dashboard link: https://syzkaller.appspot.com/bug?extid=d53275bc1af5eb01bfff
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
>
> Unfortunately, I don't have any reproducer for this crash yet.
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+d53275bc1af5eb01bfff@syzkaller.appspotmail.com
>
> ==================================================================
> BUG: KASAN: use-after-free in __lock_acquire+0x2930/0x37c0
> kernel/locking/lockdep.c:3573
> Read of size 8 at addr ffff88806b57ec90 by task v4l_id/7959
>
> CPU: 0 PID: 7959 Comm: v4l_id Not tainted 5.1.0-rc3-319004-g43151d6 #6
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011
> Call Trace:
>   __dump_stack lib/dump_stack.c:77 [inline]
>   dump_stack+0xe8/0x16e lib/dump_stack.c:113
>   print_address_description+0x6c/0x236 mm/kasan/report.c:187
>   kasan_report.cold+0x1a/0x3c mm/kasan/report.c:317
>   __lock_acquire+0x2930/0x37c0 kernel/locking/lockdep.c:3573
>   lock_acquire+0x10d/0x2f0 kernel/locking/lockdep.c:4211
>   __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
>   _raw_spin_lock_irqsave+0x44/0x60 kernel/locking/spinlock.c:152
>   v4l2_fh_del+0x4e/0x270 drivers/media/v4l2-core/v4l2-fh.c:81
>   v4l2_fh_release+0x46/0x70 drivers/media/v4l2-core/v4l2-fh.c:104
>   v4l2_release+0x2f0/0x390 drivers/media/v4l2-core/v4l2-dev.c:459
>   __fput+0x2df/0x8c0 fs/file_table.c:278
>   task_work_run+0x149/0x1c0 kernel/task_work.c:113
>   tracehook_notify_resume include/linux/tracehook.h:188 [inline]
>   exit_to_usermode_loop+0x243/0x270 arch/x86/entry/common.c:166
>   prepare_exit_to_usermode arch/x86/entry/common.c:197 [inline]
>   syscall_return_slowpath arch/x86/entry/common.c:268 [inline]
>   do_syscall_64+0x40c/0x4f0 arch/x86/entry/common.c:293
>   entry_SYSCALL_64_after_hwframe+0x49/0xbe
> RIP: 0033:0x7fd157cde2b0
> Code: 40 75 0b 31 c0 48 83 c4 08 e9 0c ff ff ff 48 8d 3d c5 32 08 00 e8 c0
> 07 02 00 83 3d 45 a3 2b 00 00 75 10 b8 03 00 00 00 0f 05 <48> 3d 01 f0 ff
> ff 73 31 c3 48 83 ec 08 e8 ce 8a 01 00 48 89 04 24
> RSP: 002b:00007ffcf08bde38 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
> RAX: 0000000000000000 RBX: 0000000000000003 RCX: 00007fd157cde2b0
> RDX: 0000000000000013 RSI: 0000000080685600 RDI: 0000000000000003
> RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000400884
> R13: 00007ffcf08bdf90 R14: 0000000000000000 R15: 0000000000000000
>
> Allocated by task 17:
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
>   driver_probe_device+0x21d/0x350 drivers/base/dd.c:671
>   __device_attach_driver+0x1d8/0x290 drivers/base/dd.c:778
>   bus_for_each_drv+0x163/0x1e0 drivers/base/bus.c:454
>   __device_attach+0x223/0x3a0 drivers/base/dd.c:844
>   bus_probe_device+0x1f1/0x2a0 drivers/base/bus.c:514
>   device_add+0xad2/0x16e0 drivers/base/core.c:2106
>   usb_set_configuration+0xdf7/0x1740 drivers/usb/core/message.c:2023
>   generic_probe+0xa2/0xda drivers/usb/core/generic.c:210
>   usb_probe_device+0xc0/0x150 drivers/usb/core/driver.c:266
>   really_probe+0x2da/0xb10 drivers/base/dd.c:509
>   driver_probe_device+0x21d/0x350 drivers/base/dd.c:671
>   __device_attach_driver+0x1d8/0x290 drivers/base/dd.c:778
>   bus_for_each_drv+0x163/0x1e0 drivers/base/bus.c:454
>   __device_attach+0x223/0x3a0 drivers/base/dd.c:844
>   bus_probe_device+0x1f1/0x2a0 drivers/base/bus.c:514
>   device_add+0xad2/0x16e0 drivers/base/core.c:2106
>   usb_new_device.cold+0x537/0xccf drivers/usb/core/hub.c:2534
>   hub_port_connect drivers/usb/core/hub.c:5089 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
>   port_event drivers/usb/core/hub.c:5350 [inline]
>   hub_event+0x138e/0x3b00 drivers/usb/core/hub.c:5432
>   process_one_work+0x90f/0x1580 kernel/workqueue.c:2269
>   process_scheduled_works kernel/workqueue.c:2331 [inline]
>   worker_thread+0x7b0/0xe20 kernel/workqueue.c:2417
>   kthread+0x313/0x420 kernel/kthread.c:253
>   ret_from_fork+0x3a/0x50 arch/x86/entry/entry_64.S:352
>
> Freed by task 17:
>   set_track mm/kasan/common.c:87 [inline]
>   __kasan_slab_free+0x130/0x180 mm/kasan/common.c:459
>   slab_free_hook mm/slub.c:1429 [inline]
>   slab_free_freelist_hook+0x5e/0x140 mm/slub.c:1456
>   slab_free mm/slub.c:3003 [inline]
>   kfree+0xce/0x290 mm/slub.c:3958
>   release_nodes+0x4ac/0x920 drivers/base/devres.c:508
>   devres_release_all+0x79/0xc8 drivers/base/devres.c:529
>   __device_release_driver drivers/base/dd.c:1086 [inline]
>   device_release_driver_internal+0x23a/0x4f0 drivers/base/dd.c:1113
>   bus_remove_device+0x302/0x5c0 drivers/base/bus.c:556
>   device_del+0x467/0xb90 drivers/base/core.c:2269
>   usb_disable_device+0x242/0x790 drivers/usb/core/message.c:1237
>   usb_disconnect+0x298/0x870 drivers/usb/core/hub.c:2197
>   hub_port_connect drivers/usb/core/hub.c:4940 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
>   port_event drivers/usb/core/hub.c:5350 [inline]
>   hub_event+0xcd2/0x3b00 drivers/usb/core/hub.c:5432
>   process_one_work+0x90f/0x1580 kernel/workqueue.c:2269
>   process_scheduled_works kernel/workqueue.c:2331 [inline]
>   worker_thread+0x7b0/0xe20 kernel/workqueue.c:2417
>   kthread+0x313/0x420 kernel/kthread.c:253
>   ret_from_fork+0x3a/0x50 arch/x86/entry/entry_64.S:352
>
> The buggy address belongs to the object at ffff88806b57e600
>   which belongs to the cache kmalloc-4k of size 4096
> The buggy address is located 1680 bytes inside of
>   4096-byte region [ffff88806b57e600, ffff88806b57f600)
> The buggy address belongs to the page:
> page:ffffea0001ad5e00 count:1 mapcount:0 mapping:ffff88812c3f4600 index:0x0
> compound_mapcount: 0
> flags: 0xfff00000010200(slab|head)
> raw: 00fff00000010200 0000000000000000 0000000100000001 ffff88812c3f4600
> raw: 0000000000000000 0000000000070007 00000001ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
>
> Memory state around the buggy address:
>   ffff88806b57eb80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>   ffff88806b57ec00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> > ffff88806b57ec80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                           ^
>   ffff88806b57ed00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>   ffff88806b57ed80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ==================================================================

#syz dup: KASAN: use-after-free Read in v4l2_ioctl

>
>
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
