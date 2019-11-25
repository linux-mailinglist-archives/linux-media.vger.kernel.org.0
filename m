Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71200108F0F
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2019 14:40:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbfKYNkZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Nov 2019 08:40:25 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40845 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbfKYNkY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Nov 2019 08:40:24 -0500
Received: by mail-wm1-f67.google.com with SMTP id y5so15989389wmi.5
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2019 05:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=o7AtskJwiDAWxyTPfRbboFWqMPtgjTBf7dt6aEbG2hw=;
        b=E0gHuUsS1bPpPdF3A2nRziXa1Y51MZneeMBfo7e0FB7aNW7fnlF4qmSRk/IGXoABrS
         LA0KGJ4MojYTJy9emqQobNRM8l0YcmZ+IWpVJy9h1nE53A3uaOQzRiYuS0lCl4Qocqxd
         guFksAwAeY/ieqaIlY3U8T6eNfnoroqS/0fk9VlXQW511piFgMfD7HHcpA27wKt+GXYG
         OQBXIVmT6/e8yi05TSUlDhJwDqKVomo0g5Gmkywqcn+dACsTLilNZOIm9t5jRgCNexOi
         dxMqcGvJ48MdMwS1YQZBQpeiZNA36TlWVGqPOmjF73214Zw9pbTR+JUUb5Gz1Lzl2HlF
         ACfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=o7AtskJwiDAWxyTPfRbboFWqMPtgjTBf7dt6aEbG2hw=;
        b=IiT2fx2OvI4MAhSGwH47NFFknI2tLIu3qFsXlK907KADgJeLISRyoMQFA1/s0RaP5t
         dHXL375EAcDhhK/PBOWzuljqN1ztVOi5+ZCMyOk34n7mLvc2ieFK6+Gpy8AYjzO3RCtf
         +kMEr8zJN7wNf/KrNLfgemd5+aELikH4KwLerxlUU+/ZOIchS7r6G5dxe5RUJegWGxsE
         tllrLwTEmqQaNbpdDb9v9ZhQufdB3UrXI1ic6yrDrY92qkoYkcG3ZYrzx4RM9P6a6sQn
         AIp+u7K0YsVBhmEQ8yH22LVUl9SRrySElW9/WWgpzD1oYkdIVIZZmg6Rc0T9KFglZTAq
         RidQ==
X-Gm-Message-State: APjAAAVDb0nmeklKuBOFW7mdp8P+xaoz4/k6YG8DPq6f2rGqaR4xE5sK
        4vVj4+pY3soWD/XkNHP72ZRcb1CcsfpETm+SEmSEFw==
X-Google-Smtp-Source: APXvYqzGnLTzOmDaTeaQ0+RtozGdY3nsvRaSZ/+7K+udJQeblaFm0tIuVYDblHoJGUhVlfJdh4YTK9kaMaaSf5OVqAs=
X-Received: by 2002:a7b:c92c:: with SMTP id h12mr15121875wml.106.1574689220903;
 Mon, 25 Nov 2019 05:40:20 -0800 (PST)
MIME-Version: 1.0
References: <20190808080330.12292-1-hdanton@sina.com>
In-Reply-To: <20190808080330.12292-1-hdanton@sina.com>
From:   Alexander Potapenko <glider@google.com>
Date:   Mon, 25 Nov 2019 14:40:07 +0100
Message-ID: <CAG_fn=XKCmB8GQKRzbPZ3yUaKhR7MqOK=7scZLf5g-pYUQf4Qw@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in dvb_usb_device_exit (2)
To:     Hillf Danton <hdanton@sina.com>
Cc:     syzbot <syzbot+c58e976e022432ee60b4@syzkaller.appspotmail.com>,
        allison@lohutok.net, Andrey Konovalov <andreyknvl@google.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
        USB list <linux-usb@vger.kernel.org>,
        mail@maciej.szmigiero.name, mchehab@kernel.org,
        Oliver Neukum <oneukum@suse.com>, sean@mess.org,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hillf,

On Thu, Aug 8, 2019 at 10:03 AM Hillf Danton <hdanton@sina.com> wrote:
>
>
> [respin due to "Sender frequency limited" and therefore the Cc list once
> cut short:(]
>
> Tue, 06 Aug 2019 06:18:08 -0700
> > Hello,
> >
> > syzbot found the following crash on:
> >
> > HEAD commit:    e96407b4 usb-fuzzer: main usb gadget fuzzer driver
> > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D114fd9aa600=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dcfa2c18fb6a=
8068e
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3Dc58e976e02243=
2ee60b4
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D173ee42c6=
00000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D16d9442c600=
000
> >
> > IMPORTANT: if you fix the bug, please add the following tag to the comm=
it:
> > Reported-by: syzbot+c58e976e022432ee60b4@syzkaller.appspotmail.com
> >
> > input: TeVii S421 PCI as
> > /devices/platform/dummy_hcd.0/usb1/1-1/rc/rc0/input5
> > dvb-usb: schedule remote query interval to 150 msecs.
> > dw2102: su3000_power_ctrl: 0, initialized 1
> > dvb-usb: TeVii S421 PCI successfully initialized and connected.
> > usb 1-1: USB disconnect, device number 2
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > BUG: KASAN: use-after-free in dvb_usb_device_exit+0x19a/0x1a0
> > drivers/media/usb/dvb-usb/dvb-usb-init.c:305
> > Read of size 8 at addr ffff8881d50468e8 by task kworker/1:1/22
> >
> > CPU: 1 PID: 22 Comm: kworker/1:1 Not tainted 5.3.0-rc2+ #25
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> > Google 01/01/2011
> > Workqueue: usb_hub_wq hub_event
> > Call Trace:
> >   __dump_stack lib/dump_stack.c:77 [inline]
> >   dump_stack+0xca/0x13e lib/dump_stack.c:113
> >   print_address_description+0x6a/0x32c mm/kasan/report.c:351
> >   __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:482
> >   kasan_report+0xe/0x12 mm/kasan/common.c:612
> >   dvb_usb_device_exit+0x19a/0x1a0  drivers/media/usb/dvb-usb/dvb-usb-in=
it.c:305
> >   usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
> >   __device_release_driver drivers/base/dd.c:1120 [inline]
> >   device_release_driver_internal+0x404/0x4c0 drivers/base/dd.c:1151
> >   bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:556
> >   device_del+0x420/0xb10 drivers/base/core.c:2288
> >   usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1237
> >   usb_disconnect+0x284/0x8d0 drivers/usb/core/hub.c:2199
> >   hub_port_connect drivers/usb/core/hub.c:4949 [inline]
> >   hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
> >   port_event drivers/usb/core/hub.c:5359 [inline]
> >   hub_event+0x1454/0x3640 drivers/usb/core/hub.c:5441
> >   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
> >   process_scheduled_works kernel/workqueue.c:2331 [inline]
> >   worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
> >   kthread+0x318/0x420 kernel/kthread.c:255
> >   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> >
> > Allocated by task 22:
> >   save_stack+0x1b/0x80 mm/kasan/common.c:69
> >   set_track mm/kasan/common.c:77 [inline]
> >   __kasan_kmalloc mm/kasan/common.c:487 [inline]
> >   __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:460
> >   slab_post_alloc_hook mm/slab.h:520 [inline]
> >   slab_alloc_node mm/slub.c:2766 [inline]
> >   slab_alloc mm/slub.c:2774 [inline]
> >   __kmalloc_track_caller+0xc8/0x2a0 mm/slub.c:4331
> >   kmemdup+0x23/0x50 mm/util.c:120
> >   kmemdup include/linux/string.h:432 [inline]
> >   dw2102_probe+0x627/0xc40 drivers/media/usb/dvb-usb/dw2102.c:2372
> >   usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
> >   really_probe+0x281/0x650 drivers/base/dd.c:548
> >   driver_probe_device+0x101/0x1b0 drivers/base/dd.c:709
> >   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:816
> >   bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
> >   __device_attach+0x217/0x360 drivers/base/dd.c:882
> >   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
> >   device_add+0xae6/0x16f0 drivers/base/core.c:2114
> >   usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
> >   generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
> >   usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
> >   really_probe+0x281/0x650 drivers/base/dd.c:548
> >   driver_probe_device+0x101/0x1b0 drivers/base/dd.c:709
> >   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:816
> >   bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
> >   __device_attach+0x217/0x360 drivers/base/dd.c:882
> >   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
> >   device_add+0xae6/0x16f0 drivers/base/core.c:2114
> >   usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
> >   hub_port_connect drivers/usb/core/hub.c:5098 [inline]
> >   hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
> >   port_event drivers/usb/core/hub.c:5359 [inline]
> >   hub_event+0x1b5c/0x3640 drivers/usb/core/hub.c:5441
> >   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
> >   worker_thread+0x96/0xe20 kernel/workqueue.c:2415
> >   kthread+0x318/0x420 kernel/kthread.c:255
> >   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> >
> > Freed by task 22:
> >   save_stack+0x1b/0x80 mm/kasan/common.c:69
> >   set_track mm/kasan/common.c:77 [inline]
> >   __kasan_slab_free+0x130/0x180 mm/kasan/common.c:449
> >   slab_free_hook mm/slub.c:1423 [inline]
> >   slab_free_freelist_hook mm/slub.c:1470 [inline]
> >   slab_free mm/slub.c:3012 [inline]
> >   kfree+0xe4/0x2f0 mm/slub.c:3953
> >   dw2102_probe+0x871/0xc40 drivers/media/usb/dvb-usb/dw2102.c:2406
> >   usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
> >   really_probe+0x281/0x650 drivers/base/dd.c:548
> >   driver_probe_device+0x101/0x1b0 drivers/base/dd.c:709
> >   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:816
> >   bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
> >   __device_attach+0x217/0x360 drivers/base/dd.c:882
> >   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
> >   device_add+0xae6/0x16f0 drivers/base/core.c:2114
> >   usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
> >   generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
> >   usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
> >   really_probe+0x281/0x650 drivers/base/dd.c:548
> >   driver_probe_device+0x101/0x1b0 drivers/base/dd.c:709
> >   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:816
> >   bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
> >   __device_attach+0x217/0x360 drivers/base/dd.c:882
> >   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
> >   device_add+0xae6/0x16f0 drivers/base/core.c:2114
> >   usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
> >   hub_port_connect drivers/usb/core/hub.c:5098 [inline]
> >   hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
> >   port_event drivers/usb/core/hub.c:5359 [inline]
> >   hub_event+0x1b5c/0x3640 drivers/usb/core/hub.c:5441
> >   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
> >   worker_thread+0x96/0xe20 kernel/workqueue.c:2415
> >   kthread+0x318/0x420 kernel/kthread.c:255
> >   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> >
> > The buggy address belongs to the object at ffff8881d5046600
> >   which belongs to the cache kmalloc-4k of size 4096
> > The buggy address is located 744 bytes inside of
> >   4096-byte region [ffff8881d5046600, ffff8881d5047600)
> > The buggy address belongs to the page:
> > page:ffffea0007541000 refcount:1 mapcount:0 mapping:ffff8881da00c280
> > index:0x0 compound_mapcount: 0
> > flags: 0x200000000010200(slab|head)
> > raw: 0200000000010200 dead000000000100 dead000000000122 ffff8881da00c28=
0
> > raw: 0000000000000000 0000000000070007 00000001ffffffff 000000000000000=
0
> > page dumped because: kasan: bad access detected
> >
> > Memory state around the buggy address:
> >   ffff8881d5046780: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> >   ffff8881d5046800: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> > > ffff8881d5046880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> >                                                            ^
> >   ffff8881d5046900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> >   ffff8881d5046980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Recompute desc after copying properties.
>
> --- a/drivers/media/usb/dvb-usb/dvb-usb-init.c
> +++ b/drivers/media/usb/dvb-usb/dvb-usb-init.c
> @@ -276,7 +276,8 @@ int dvb_usb_device_init(struct usb_inter
>
>         d->udev =3D udev;
>         memcpy(&d->props, props, sizeof(struct dvb_usb_device_properties)=
);
> -       d->desc =3D desc;
> +       cold =3D 0;
> +       d->desc =3D dvb_usb_find_device(udev, &d->props, &cold);
>         d->owner =3D owner;
>
>         usb_set_intfdata(intf, d);
> --
Did you have a chance to land this patch?
We're still seeing similar reports on the KMSAN bot.
> --
> You received this message because you are subscribed to the Google Groups=
 "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/syzkaller-bugs/20190808080330.12292-1-hdanton%40sina.com.



--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
