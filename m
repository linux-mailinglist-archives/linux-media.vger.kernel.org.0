Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E5A0BB7A1
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2019 17:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbfIWPM0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 11:12:26 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46941 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727009AbfIWPM0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 11:12:26 -0400
Received: by mail-pf1-f196.google.com with SMTP id q5so9271364pfg.13
        for <linux-media@vger.kernel.org>; Mon, 23 Sep 2019 08:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+e6VKyi4RDxzO+rMfy4D/+EuNanataS4taqwSVna9oM=;
        b=szKAfDtwzpOu4MZzLe0ZS4E5nlYUrmKWuqmfRRece3j9lH1xpomjbFMSeTm7Xuaq+c
         N05YLh4za/0+mnyWOjpM0CQxPIfktO5s3X987svSdq7nLxlp2617ZoCJDt++CZLnbswM
         rWLLbODhLuJlYoktGAhG6lgaavTOGHR/AOKHAWOQqK8wEmmIVdlLxSfF7YW7jdaxFcWl
         4odWWj9MeB1XmW6JjXQXyZNE4U4vaKioGvjF4q4xaupCgNFBJHjcmZOYlg3vhQWPBlcG
         2xnsPTb+P/bF3MjIsbE8nioHprPNIVmUDbtsh48UVJ9SJI4OpxnyK3dWCF8HVBWYMa38
         MvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+e6VKyi4RDxzO+rMfy4D/+EuNanataS4taqwSVna9oM=;
        b=AktT7t4H0q+8ueei7yT78vDreyLNBDBs5fb9v7bdfpVhSt4wn/Mon+ZlefS6kzC9V/
         fiKKhjKjSJ7WG+bq3bwIdyPVVX13MNo0RXYSAiMMVGjpisMdegJOCco0oZp/TK36zN63
         xJyc+BEITHYvRS/DZGO3R0wPtJUGqSUW/j/UxfBDGJ8767wDqSmiuxCtHhgE8kN0XxPu
         f76EaiwHAxvB9G/4v8UOyizsSudDJBsnxs07n+eWXVlL4DWv9yeYeYm6FAZJB6vIdzdm
         Wxi9d7EoqUEUV2Y9A2Wy6SgCT+L+3naI8ouGcp5WN84KC6LPIkXU2adf7sGgWF/QYn/N
         IyvA==
X-Gm-Message-State: APjAAAXgMPyqCuFATF0EuKiB+/8JaMB7Aigd5WVQHE/tfZgknoVlUyB8
        Df1SyTKVocVnpEm9Q+HESP55SWLsdWtqwyPdpubp7i8y1co1Lg==
X-Google-Smtp-Source: APXvYqzQu3zf7MwD5dSwHodhAcyLgVZAG0O7QPJ49rUXrKnnT4WLwPcTm7oGBXASJ4CDZCVhP2HnLUytdNiWsdA8EXo=
X-Received: by 2002:aa7:8bcc:: with SMTP id s12mr34228pfd.93.1569251544634;
 Mon, 23 Sep 2019 08:12:24 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000058cce90593394589@google.com>
In-Reply-To: <00000000000058cce90593394589@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 23 Sep 2019 17:12:13 +0200
Message-ID: <CAAeHK+ywLa2CLMnxNxck2VStxj-xrxo4QLjJFmamJ7G25Tu+CA@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in v4l2_release (2)
To:     syzbot <syzbot+ac438d7ad8171b0ecbbe@syzkaller.appspotmail.com>
Cc:     boris.brezillon@collabora.com, ezequiel@collabora.com,
        Hans Verkuil <hverkuil@xs4all.nl>,
        LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
        USB list <linux-usb@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        niklas.soderlund+renesas@ragnatech.se, s.nawrocki@samsung.com,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 23, 2019 at 4:31 PM syzbot
<syzbot+ac438d7ad8171b0ecbbe@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    e0bd8d79 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=14d4b6a1600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=8847e5384a16f66a
> dashboard link: https://syzkaller.appspot.com/bug?extid=ac438d7ad8171b0ecbbe
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
>
> Unfortunately, I don't have any reproducer for this crash yet.
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+ac438d7ad8171b0ecbbe@syzkaller.appspotmail.com
>
> usb 4-1: usbvision_write_reg: failed: error -19
> usbvision_audio_off: can't write reg
> usbvision_radio_close: Final disconnect
> ==================================================================
> BUG: KASAN: use-after-free in v4l2_release+0x2f1/0x390
> drivers/media/v4l2-core/v4l2-dev.c:459
> Read of size 4 at addr ffff8881c5c55228 by task v4l_id/16726
>
> CPU: 0 PID: 16726 Comm: v4l_id Not tainted 5.3.0+ #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011
> Call Trace:
>   __dump_stack lib/dump_stack.c:77 [inline]
>   dump_stack+0xca/0x13e lib/dump_stack.c:113
>   print_address_description+0x6a/0x32c mm/kasan/report.c:351
>   __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:482
>   kasan_report+0xe/0x12 mm/kasan/common.c:618
>   v4l2_release+0x2f1/0x390 drivers/media/v4l2-core/v4l2-dev.c:459
>   __fput+0x2d7/0x840 fs/file_table.c:280
>   task_work_run+0x13f/0x1c0 kernel/task_work.c:113
>   tracehook_notify_resume include/linux/tracehook.h:188 [inline]
>   exit_to_usermode_loop+0x1d2/0x200 arch/x86/entry/common.c:163
>   prepare_exit_to_usermode arch/x86/entry/common.c:194 [inline]
>   syscall_return_slowpath arch/x86/entry/common.c:274 [inline]
>   do_syscall_64+0x45f/0x580 arch/x86/entry/common.c:300
>   entry_SYSCALL_64_after_hwframe+0x49/0xbe
> RIP: 0033:0x7f26b3e742b0
> Code: 40 75 0b 31 c0 48 83 c4 08 e9 0c ff ff ff 48 8d 3d c5 32 08 00 e8 c0
> 07 02 00 83 3d 45 a3 2b 00 00 75 10 b8 03 00 00 00 0f 05 <48> 3d 01 f0 ff
> ff 73 31 c3 48 83 ec 08 e8 ce 8a 01 00 48 89 04 24
> RSP: 002b:00007fff0e393978 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
> RAX: 0000000000000000 RBX: 0000000000000003 RCX: 00007f26b3e742b0
> RDX: 00007f26b412adf0 RSI: 0000000000000001 RDI: 0000000000000003
> RBP: 0000000000000000 R08: 00007f26b412adf0 R09: 000000000000000a
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000400884
> R13: 00007fff0e393ad0 R14: 0000000000000000 R15: 0000000000000000
>
> Allocated by task 2757:
>   save_stack+0x1b/0x80 mm/kasan/common.c:69
>   set_track mm/kasan/common.c:77 [inline]
>   __kasan_kmalloc mm/kasan/common.c:493 [inline]
>   __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:466
>   kmalloc include/linux/slab.h:552 [inline]
>   kzalloc include/linux/slab.h:748 [inline]
>   usbvision_alloc drivers/media/usb/usbvision/usbvision-video.c:1298 [inline]
>   usbvision_probe.cold+0x5c5/0x1f1f
> drivers/media/usb/usbvision/usbvision-video.c:1452
>   usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
>   really_probe+0x281/0x6d0 drivers/base/dd.c:548
>   driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
>   bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
>   __device_attach+0x217/0x360 drivers/base/dd.c:894
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
>   device_add+0xae6/0x16f0 drivers/base/core.c:2201
>   usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
>   generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
>   usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
>   really_probe+0x281/0x6d0 drivers/base/dd.c:548
>   driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
>   bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
>   __device_attach+0x217/0x360 drivers/base/dd.c:894
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
>   device_add+0xae6/0x16f0 drivers/base/core.c:2201
>   usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
>   hub_port_connect drivers/usb/core/hub.c:5098 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
>   port_event drivers/usb/core/hub.c:5359 [inline]
>   hub_event+0x1b5c/0x3640 drivers/usb/core/hub.c:5441
>   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
>   worker_thread+0x96/0xe20 kernel/workqueue.c:2415
>   kthread+0x318/0x420 kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>
> Freed by task 16726:
>   save_stack+0x1b/0x80 mm/kasan/common.c:69
>   set_track mm/kasan/common.c:77 [inline]
>   __kasan_slab_free+0x130/0x180 mm/kasan/common.c:455
>   slab_free_hook mm/slub.c:1423 [inline]
>   slab_free_freelist_hook mm/slub.c:1474 [inline]
>   slab_free mm/slub.c:3016 [inline]
>   kfree+0xe4/0x2f0 mm/slub.c:3957
>   usbvision_release+0x181/0x1c0
> drivers/media/usb/usbvision/usbvision-video.c:1347
>   usbvision_radio_close.cold+0x6f/0x74
> drivers/media/usb/usbvision/usbvision-video.c:1113
>   v4l2_release+0x2e7/0x390 drivers/media/v4l2-core/v4l2-dev.c:455
>   __fput+0x2d7/0x840 fs/file_table.c:280
>   task_work_run+0x13f/0x1c0 kernel/task_work.c:113
>   tracehook_notify_resume include/linux/tracehook.h:188 [inline]
>   exit_to_usermode_loop+0x1d2/0x200 arch/x86/entry/common.c:163
>   prepare_exit_to_usermode arch/x86/entry/common.c:194 [inline]
>   syscall_return_slowpath arch/x86/entry/common.c:274 [inline]
>   do_syscall_64+0x45f/0x580 arch/x86/entry/common.c:300
>   entry_SYSCALL_64_after_hwframe+0x49/0xbe
>
> The buggy address belongs to the object at ffff8881c5c54200
>   which belongs to the cache kmalloc-8k of size 8192
> The buggy address is located 4136 bytes inside of
>   8192-byte region [ffff8881c5c54200, ffff8881c5c56200)
> The buggy address belongs to the page:
> page:ffffea0007171400 refcount:1 mapcount:0 mapping:ffff8881da00c500
> index:0x0 compound_mapcount: 0
> flags: 0x200000000010200(slab|head)
> raw: 0200000000010200 0000000000000000 0000000100000001 ffff8881da00c500
> raw: 0000000000000000 0000000080030003 00000001ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
>
> Memory state around the buggy address:
>   ffff8881c5c55100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>   ffff8881c5c55180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> > ffff8881c5c55200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                                    ^
>   ffff8881c5c55280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>   ffff8881c5c55300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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

Most probably the same bug as:

https://syzkaller.appspot.com/bug?extid=7fa38a608b1075dfd634

#syz dup: general protection fault in usb_set_interface
