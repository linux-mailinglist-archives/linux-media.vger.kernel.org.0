Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A99DF151AC4
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2020 13:50:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727185AbgBDMur (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Feb 2020 07:50:47 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46231 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727127AbgBDMur (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Feb 2020 07:50:47 -0500
Received: by mail-pf1-f195.google.com with SMTP id k29so9410861pfp.13
        for <linux-media@vger.kernel.org>; Tue, 04 Feb 2020 04:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D1fOvtk+I1UyywJXprOxF/iNJ4ODYEblRn8JKl/LqkM=;
        b=vIPJqp984BzTft8k3zINAudFK7+lN9k4k4Sh8N7pF1FNoNuoN0ofAV93JdVvsGm7fQ
         e/6nXF22kNcu+9DSxqzyUIyimESSpBzPXZx+RqnJvqjCffH6DG/4e7k1CU6zNI68dStU
         I/a9TMe8/vrgei8T6ViEDmnnIUsE9rJpjw0OxgZM3P1ffKPGpkaGVimFApqpv/VUKrMb
         XjrZG15Sym2MxGaY1iofu/glrVEbmC+jS5yMDwY51EUWuTNxYXuV7OehCG+gcR5Zre1i
         URguCZC2hBedi4xv8555UfGlbFvg8jxBoMOwQ8Yk0xZsI3d496klr3Hyqc/z+c7cJQbU
         E0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D1fOvtk+I1UyywJXprOxF/iNJ4ODYEblRn8JKl/LqkM=;
        b=Cv1EEFR2JrILx7pH0rDBB8CDKNZ1Hh/fhaLlyfS2UQ1U3Dc2qRvmwW8wIZpKSipIyl
         APP4IpDn403ZZiMP7toTw309oYSXkCTb444D/FC33LsmNXipcTXsimNM2htWxu+aePVA
         XKyEmfmVGO42B1E7ClLU2fJGUWFK6EBEgb+t3kdV8L7QQ2KaRuJ/VKCm7bJRTlFF015a
         iDxOYBBJJ46HNj1O6bALdyMqmx4nZGddofVIhmcSpeVc1j6Leg7OJo7LOnC47ePr11JZ
         fqMIZFN2LunMIWAycc4ZZKF9TLxfc4oVb3UzGI9KZy463w1PlXkckDi+dqkEmLBUvOYa
         2mFw==
X-Gm-Message-State: APjAAAWsROu6s6fypgaWJYcLLvkJKsvqbqnMOCfENWXhDoqAGsUi7mjt
        19RDDwp9QxeYgBZs+OzFePuyhcL9TkiaPkypNUXWXQ==
X-Google-Smtp-Source: APXvYqwXBTe4wHAO1mpa1DCruitXHGpYp+6elbNPNzyoL4FZsxteou37tXi4cfgS4YUJkg1sxn3e+rv4+uPb0W4H2GM=
X-Received: by 2002:aa7:9629:: with SMTP id r9mr31236027pfg.51.1580820646459;
 Tue, 04 Feb 2020 04:50:46 -0800 (PST)
MIME-Version: 1.0
References: <0000000000003a39d50599d200e6@google.com> <CAAeHK+wnE6anSjmoA-Cr4nvx_oujUWH=D_YkhE38eiJurjsCWg@mail.gmail.com>
 <CAAeHK+zZTWpnE=duVb+Jv9zj4wuYn6bj=yzUHugB-G9aoyDf1Q@mail.gmail.com>
In-Reply-To: <CAAeHK+zZTWpnE=duVb+Jv9zj4wuYn6bj=yzUHugB-G9aoyDf1Q@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 4 Feb 2020 13:50:35 +0100
Message-ID: <CAAeHK+xDLGKDaG+48i1_RQqA1SGhGSK_eFb=LM14dbYLseVa8w@mail.gmail.com>
Subject: Re: WARNING in uvc_scan_chain_forward
To:     syzbot <syzbot+0a5c96772a9b26f2a876@syzkaller.appspotmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
        USB list <linux-usb@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 23, 2020 at 3:00 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> On Fri, Jan 10, 2020 at 4:51 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> >
> > On Mon, Dec 16, 2019 at 2:15 PM syzbot
> > <syzbot+0a5c96772a9b26f2a876@syzkaller.appspotmail.com> wrote:
> > >
> > > Hello,
> > >
> > > syzbot found the following crash on:
> > >
> > > HEAD commit:    4cc037ec usb: gadget: add raw-gadget interface
> > > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=11b905dee00000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=e9c2b6de462bc469
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=0a5c96772a9b26f2a876
> > > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10f82546e00000
> > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1638ef7ee00000
> > >
> > > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > > Reported-by: syzbot+0a5c96772a9b26f2a876@syzkaller.appspotmail.com
> > >
> > > usb 1-1: New USB device found, idVendor=0bd3, idProduct=0755,
> > > bcdDevice=69.6a
> > > usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> > > usb 1-1: config 0 descriptor??
> > > usb 1-1: string descriptor 0 read error: -71
> > > uvcvideo: Found UVC 0.00 device <unnamed> (0bd3:0755)
> > > ------------[ cut here ]------------
> > > list_add double add: new=ffff8881d0637010, prev=ffff8881d0637010,
> > > next=ffff8881d4e87c18.
> > > WARNING: CPU: 1 PID: 22 at lib/list_debug.c:29 __list_add_valid+0xb4/0xf0
> > > lib/list_debug.c:29
> > > Kernel panic - not syncing: panic_on_warn set ...
> > > CPU: 1 PID: 22 Comm: kworker/1:1 Not tainted 5.5.0-rc1-syzkaller #0
> > > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> > > Google 01/01/2011
> > > Workqueue: usb_hub_wq hub_event
> > > Call Trace:
> > >   __dump_stack lib/dump_stack.c:77 [inline]
> > >   dump_stack+0xef/0x16e lib/dump_stack.c:118
> > >   panic+0x2aa/0x6e1 kernel/panic.c:221
> > >   __warn.cold+0x2f/0x30 kernel/panic.c:582
> > >   report_bug+0x27b/0x2f0 lib/bug.c:195
> > >   fixup_bug arch/x86/kernel/traps.c:174 [inline]
> > >   fixup_bug arch/x86/kernel/traps.c:169 [inline]
> > >   do_error_trap+0x12b/0x1e0 arch/x86/kernel/traps.c:267
> > >   do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:286
> > >   invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1027
> > > RIP: 0010:__list_add_valid+0xb4/0xf0 lib/list_debug.c:29
> > > Code: 48 c7 c7 e0 f3 da 85 4c 89 e6 e8 ef cf 2b ff 0f 0b 31 c0 eb c5 48 89
> > > f2 4c 89 e1 48 89 ee 48 c7 c7 60 f4 da 85 e8 d4 cf 2b ff <0f> 0b 31 c0 eb
> > > aa 48 89 34 24 e8 fd 3c 7f ff 48 8b 34 24 e9 60 ff
> > > RSP: 0018:ffff8881d8c37080 EFLAGS: 00010286
> > > RAX: 0000000000000000 RBX: ffff8881d0637010 RCX: 0000000000000000
> > > RDX: 0000000000000000 RSI: ffffffff81295dad RDI: ffffed103b186e02
> > > RBP: ffff8881d0637010 R08: ffff8881da24e200 R09: fffffbfff11f1eae
> > > R10: fffffbfff11f1ead R11: ffffffff88f8f56f R12: ffff8881d4e87c18
> > > R13: ffff8881d0637000 R14: dffffc0000000000 R15: ffff8881d4e87c18
> > >   __list_add include/linux/list.h:60 [inline]
> > >   list_add_tail include/linux/list.h:93 [inline]
> > >   uvc_scan_chain_forward.isra.0+0x4df/0x637
> > > drivers/media/usb/uvc/uvc_driver.c:1526
> > >   uvc_scan_chain drivers/media/usb/uvc/uvc_driver.c:1640 [inline]
> > >   uvc_scan_device drivers/media/usb/uvc/uvc_driver.c:1824 [inline]
> > >   uvc_probe.cold+0x1aee/0x29de drivers/media/usb/uvc/uvc_driver.c:2197
> > >   usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
> > >   really_probe+0x281/0x6d0 drivers/base/dd.c:548
> > >   driver_probe_device+0x104/0x210 drivers/base/dd.c:721
> > >   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
> > >   bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
> > >   __device_attach+0x217/0x360 drivers/base/dd.c:894
> > >   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
> > >   device_add+0x1480/0x1c20 drivers/base/core.c:2487
> > >   usb_set_configuration+0xe67/0x1740 drivers/usb/core/message.c:2023
> > >   generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
> > >   usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
> > >   really_probe+0x281/0x6d0 drivers/base/dd.c:548
> > >   driver_probe_device+0x104/0x210 drivers/base/dd.c:721
> > >   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
> > >   bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
> > >   __device_attach+0x217/0x360 drivers/base/dd.c:894
> > >   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
> > >   device_add+0x1480/0x1c20 drivers/base/core.c:2487
> > >   usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2537
> > >   hub_port_connect drivers/usb/core/hub.c:5184 [inline]
> > >   hub_port_connect_change drivers/usb/core/hub.c:5324 [inline]
> > >   port_event drivers/usb/core/hub.c:5470 [inline]
> > >   hub_event+0x1e59/0x3860 drivers/usb/core/hub.c:5552
> > >   process_one_work+0x92b/0x1530 kernel/workqueue.c:2264
> > >   worker_thread+0x96/0xe20 kernel/workqueue.c:2410
> > >   kthread+0x318/0x420 kernel/kthread.c:255
> > >   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> > > Kernel Offset: disabled
> > > Rebooting in 86400 seconds..
> > >
> > >
> > > ---
> > > This bug is generated by a bot. It may contain errors.
> > > See https://goo.gl/tpsmEJ for more information about syzbot.
> > > syzbot engineers can be reached at syzkaller@googlegroups.com.
> > >
> > > syzbot will keep track of this bug report. See:
> > > https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> > > syzbot can test patches for this bug, for details see:
> > > https://goo.gl/tpsmEJ#testing-patches
> >
> > #syz fix: media: uvc: Avoid cyclic entity chains due to malformed USB
> > descriptors
>
> #syz fix:
> media: uvc: Avoid cyclic entity chains due to malformed USB descriptors

#syz fix:
media: uvcvideo: Avoid cyclic entity chains due to malformed USB descriptors
