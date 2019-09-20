Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 946E8B9418
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2019 17:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404117AbfITPfW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Sep 2019 11:35:22 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36463 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404105AbfITPfU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 11:35:20 -0400
Received: by mail-pf1-f193.google.com with SMTP id y22so4762056pfr.3
        for <linux-media@vger.kernel.org>; Fri, 20 Sep 2019 08:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KYYXiwhTHKlZGhQO6s6tMNDr7MAM6pAY3179upZ2BOo=;
        b=KQxbGU1RiQfdCGtKvn71cIg4ycczc7KD03DnHRQPsmd0aj4xtiTgPgQ3XLWbRkzIJZ
         3IFxpiksNZFe0pLUs2bLwa2Yp6XiZwQLRWkWiAqPZkPxFmbiZyW8rBBqF7pIoteEKKnc
         v0ftsjNKmByaOBXLbVZFGjtR2tj20C1XjoZtTp+FAISrP7/d5qbVco1nFORsL31xZlVp
         4RWA2Adml/s8kQAQH2uvUT78+aSCbiLGTU9DzywOlJOL3W4lQER2KDw5/4h6AnuMl8te
         gkSiaVPvfGpmmm81sjxn82iPYqapDk/IYCvG4gt3tXfLhAOpr4cFozZdeN7uWMfwVCm0
         axaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KYYXiwhTHKlZGhQO6s6tMNDr7MAM6pAY3179upZ2BOo=;
        b=YytVBEKJnV/ZkOl2cI7nvtmOaw0rxVFFytqKr7pAj8nLAapD0h/Ad8c/j8SfKkxr6C
         5QLm+N4/8dZjw+10PJFPD/gcBop/7ikp+RSYTlCTERqjRv6YissGMNcBVYmnRGB2jWpH
         oqk4xfAO2FJM6daaP4T6Q/368scFTspf0j4coT3vjGktYDby0kSMYK3MoIzONA1KkL0y
         MmNFU9l+4+tJmgT8XD54Ms6d9gnpVWjsCpA8op8Q535eqPFVxIxdr4AvpJmPKC3zHDoB
         QDueS8weEoYEVyiRuCS54iph7whY3FRlD4yVtsgD6HWS+IgiAhE3xiCovn5cyNqRXVrT
         HAOA==
X-Gm-Message-State: APjAAAX+sxADX2WakKT/F5VzpCOiqWBxv68k28hn6vo4u/uEbVQWqjsR
        OgjZfeAvY9icE+65kZv+nQx8oSZjR7jgk2vWUNpe2A==
X-Google-Smtp-Source: APXvYqwzX7kgRz9E1iQ5UZ2ovmhU2m5NM1Ek8i3gbJBhffTeiMOGOkJ/6wyD4uj9P6rGzmly6IdbeRXXq4frR5RXOuk=
X-Received: by 2002:a63:d20f:: with SMTP id a15mr10870010pgg.130.1568993717722;
 Fri, 20 Sep 2019 08:35:17 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000f111a20592ab9671@google.com>
In-Reply-To: <000000000000f111a20592ab9671@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 20 Sep 2019 17:35:06 +0200
Message-ID: <CAAeHK+znT=Bdy58Vgj+gBR7eNOhhSAPcSu0KXugsmJQBZ3JuLg@mail.gmail.com>
Subject: Re: KASAN: invalid-free in usbvision_release
To:     syzbot <syzbot+0350a2346edac2799574@syzkaller.appspotmail.com>
Cc:     allison@lohutok.net, Hans Verkuil <hverkuil@xs4all.nl>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
        USB list <linux-usb@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 16, 2019 at 3:29 PM syzbot
<syzbot+0350a2346edac2799574@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    f0df5c1b usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=11caf595600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=5c6633fa4ed00be5
> dashboard link: https://syzkaller.appspot.com/bug?extid=0350a2346edac2799574
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
>
> Unfortunately, I don't have any reproducer for this crash yet.
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+0350a2346edac2799574@syzkaller.appspotmail.com
>
> usb 6-1: usbvision_write_reg: failed: error -2
> usbvision_set_audio: can't write iopin register for audio switching
> usb 6-1: usbvision_write_reg: failed: error -19
> usbvision_audio_off: can't write reg
> usbvision_radio_close: Final disconnect
> ==================================================================
> BUG: KASAN: double-free or invalid-free in usbvision_release+0x13b/0x1c0
> drivers/media/usb/usbvision/usbvision-video.c:1353
>
> CPU: 1 PID: 7362 Comm: v4l_id Not tainted 5.3.0-rc7+ #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011
> Call Trace:
>   __dump_stack lib/dump_stack.c:77 [inline]
>   dump_stack+0xca/0x13e lib/dump_stack.c:113
>   print_address_description+0x6a/0x32c mm/kasan/report.c:351
>   kasan_report_invalid_free+0x61/0xa0 mm/kasan/report.c:444
>   __kasan_slab_free+0x162/0x180 mm/kasan/common.c:434
>   slab_free_hook mm/slub.c:1423 [inline]
>   slab_free_freelist_hook mm/slub.c:1474 [inline]
>   slab_free mm/slub.c:3016 [inline]
>   kfree+0xe4/0x2f0 mm/slub.c:3957
>   usbvision_release+0x13b/0x1c0
> drivers/media/usb/usbvision/usbvision-video.c:1353
>   usbvision_radio_close.cold+0x6f/0x74
> drivers/media/usb/usbvision/usbvision-video.c:1125
>   v4l2_release+0x2e7/0x390 drivers/media/v4l2-core/v4l2-dev.c:455
>   __fput+0x2d7/0x840 fs/file_table.c:280
>   task_work_run+0x13f/0x1c0 kernel/task_work.c:113
>   tracehook_notify_resume include/linux/tracehook.h:188 [inline]
>   exit_to_usermode_loop+0x1d2/0x200 arch/x86/entry/common.c:163
>   prepare_exit_to_usermode arch/x86/entry/common.c:194 [inline]
>   syscall_return_slowpath arch/x86/entry/common.c:274 [inline]
>   do_syscall_64+0x45f/0x580 arch/x86/entry/common.c:299
>   entry_SYSCALL_64_after_hwframe+0x49/0xbe
> RIP: 0033:0x7f0c157b92b0
> Code: 40 75 0b 31 c0 48 83 c4 08 e9 0c ff ff ff 48 8d 3d c5 32 08 00 e8 c0
> 07 02 00 83 3d 45 a3 2b 00 00 75 10 b8 03 00 00 00 0f 05 <48> 3d 01 f0 ff
> ff 73 31 c3 48 83 ec 08 e8 ce 8a 01 00 48 89 04 24
> RSP: 002b:00007fff5c949928 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
> RAX: 0000000000000000 RBX: 0000000000000003 RCX: 00007f0c157b92b0
> RDX: 00007f0c15a6fdf0 RSI: 0000000000000001 RDI: 0000000000000003
> RBP: 0000000000000000 R08: 00007f0c15a6fdf0 R09: 000000000000000a
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000400884
> R13: 00007fff5c949a80 R14: 0000000000000000 R15: 0000000000000000
>
> Allocated by task 1995:
>   save_stack+0x1b/0x80 mm/kasan/common.c:69
>   set_track mm/kasan/common.c:77 [inline]
>   __kasan_kmalloc mm/kasan/common.c:493 [inline]
>   __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:466
>   kmalloc_array include/linux/slab.h:676 [inline]
>   usbvision_probe.cold+0xaae/0x1e57
> drivers/media/usb/usbvision/usbvision-video.c:1484
>   usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
>   really_probe+0x281/0x6d0 drivers/base/dd.c:548
>   driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
>   bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:454
>   __device_attach+0x217/0x360 drivers/base/dd.c:894
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
>   device_add+0xae6/0x16f0 drivers/base/core.c:2165
>   usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
>   generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
>   usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
>   really_probe+0x281/0x6d0 drivers/base/dd.c:548
>   driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
>   bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:454
>   __device_attach+0x217/0x360 drivers/base/dd.c:894
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
>   device_add+0xae6/0x16f0 drivers/base/core.c:2165
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
> Freed by task 1995:
>   save_stack+0x1b/0x80 mm/kasan/common.c:69
>   set_track mm/kasan/common.c:77 [inline]
>   __kasan_slab_free+0x130/0x180 mm/kasan/common.c:455
>   slab_free_hook mm/slub.c:1423 [inline]
>   slab_free_freelist_hook mm/slub.c:1474 [inline]
>   slab_free mm/slub.c:3016 [inline]
>   kfree+0xe4/0x2f0 mm/slub.c:3957
>   usbvision_release+0x13b/0x1c0
> drivers/media/usb/usbvision/usbvision-video.c:1353
>   usbvision_disconnect+0x16c/0x1d0
> drivers/media/usb/usbvision/usbvision-video.c:1582
>   usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
>   __device_release_driver drivers/base/dd.c:1134 [inline]
>   device_release_driver_internal+0x42f/0x500 drivers/base/dd.c:1165
>   bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:556
>   device_del+0x420/0xb10 drivers/base/core.c:2339
>   usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1237
>   usb_disconnect+0x284/0x8d0 drivers/usb/core/hub.c:2199
>   hub_port_connect drivers/usb/core/hub.c:4949 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
>   port_event drivers/usb/core/hub.c:5359 [inline]
>   hub_event+0x1454/0x3640 drivers/usb/core/hub.c:5441
>   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
>   worker_thread+0x96/0xe20 kernel/workqueue.c:2415
>   kthread+0x318/0x420 kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>
> The buggy address belongs to the object at ffff8881d41ad420
>   which belongs to the cache kmalloc-32 of size 32
> The buggy address is located 0 bytes inside of
>   32-byte region [ffff8881d41ad420, ffff8881d41ad440)
> The buggy address belongs to the page:
> page:ffffea0007506b40 refcount:1 mapcount:0 mapping:ffff8881da003400
> index:0x0
> flags: 0x200000000000200(slab)
> raw: 0200000000000200 ffffea0007662c40 0000000f0000000f ffff8881da003400
> raw: 0000000000000000 0000000080550055 00000001ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
>
> Memory state around the buggy address:
>   ffff8881d41ad300: fb fb fb fb fc fc fb fb fb fb fc fc fb fb fb fb
>   ffff8881d41ad380: fc fc fb fb fb fb fc fc fb fb fb fb fc fc fb fb
> > ffff8881d41ad400: fb fb fc fc fb fb fb fb fc fc fb fb fb fb fc fc
>                                 ^
>   ffff8881d41ad480: fb fb fb fb fc fc fb fb fb fb fc fc fb fb fb fb
>   ffff8881d41ad500: fc fc 00 00 00 00 fc fc fb fb fb fb fc fc fb fb
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
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/000000000000f111a20592ab9671%40google.com.

Most probably the same bug as:

https://syzkaller.appspot.com/bug?extid=7fa38a608b1075dfd634

#syz dup: general protection fault in usb_set_interface
