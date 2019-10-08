Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECCC1CF67F
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 11:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730384AbfJHJ4W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 05:56:22 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53483 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730026AbfJHJ4V (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 05:56:21 -0400
Received: by mail-wm1-f68.google.com with SMTP id i16so2434532wmd.3
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2019 02:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vEHGV8fz0ze30XF5NY4MQwYrrRa9sbd2HQQv35b43+o=;
        b=bpInivkjCcBdWt72oZG09k+4GDuW0SRI/kvbp/9mJwwkIEwpu6e+pq3a54EnOca1d3
         dvpbiDr8tWAdanduHyyHC8LmSFkcfM4Ab8ZvMDzRyJRKxfZzvslMBDEkG4g5mZsCcTwj
         QiOKcOjopviqLZpiXWLrAbHG5p9teAlRCeQa2i7uRWQpo95/K6wJg0L4hsGPjRWb3Cnl
         j3AJgYoRSGadnzZbbQQebDwPlvAe0eh5Sh/yLcHlJkUis6cOWwTWJbdKmdvlsyEqCrz1
         u60N0C1MbC4oqjbB1JjhoQ6diTpZhyv+AVDhJYOFggFUt1CaMRIRrSk82XaQiRFTwBOD
         1ciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vEHGV8fz0ze30XF5NY4MQwYrrRa9sbd2HQQv35b43+o=;
        b=qUiLW8PgQaV7OLHNpceV7aMcNXvfrmjof/UcXXaQnN1y+3DtYn0EtCe8mGO5wR54L0
         Z4BlkDXqsQO8B3JIVPA+kouIwA1OmouQdJaHzEIlB/3In9UVy9D5FmiSy7P+1HMCyrnF
         xmWwMxD8NMG0bNvxsnOywqEg5X5/jqN649EYmKuSKxNZAmUej+CsUW4rbVg9wRFznm/o
         JCZAy++sAXUBnp+dkoxK4GQivgjHJDyYOB/eZI5JGpxtbQYB6MP4CHJl9ZknAuQTY2Ii
         3jXLGUN14qghlWVtfNFOcONzYwtMAn5tGqEmq6HRi/Bbpg30yxdXpEPg+RGsT+LSX5d4
         hpwg==
X-Gm-Message-State: APjAAAXcRjXUwNbEHE9RJN6xmBnLfrqA/FrTzREJAZ6NcwT2wWdSC2t2
        g7AGsVlh4e+9xQ5P7xPbs2n5m4QARMIMYnrBQ6S/9g==
X-Google-Smtp-Source: APXvYqyWjlo/zH9ipkhuvdAIdYUJ0fjb2/N4IKbtIjiMQ02/qWKSCIjdbuQ+CuXaeFEi2/elRvjPTCk9rlqZ2Mxsb88=
X-Received: by 2002:a05:600c:2489:: with SMTP id 9mr3019891wms.131.1570528577418;
 Tue, 08 Oct 2019 02:56:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190608054928.4792-1-hdanton@sina.com>
In-Reply-To: <20190608054928.4792-1-hdanton@sina.com>
From:   Alexander Potapenko <glider@google.com>
Date:   Tue, 8 Oct 2019 11:56:06 +0200
Message-ID: <CAG_fn=VfLkw5H+e+NPDFeMyE9R7vLN4jnCpe04trGTCcfEuDRA@mail.gmail.com>
Subject: Re: KMSAN: uninit-value in read_sensor_register
To:     Hillf Danton <hdanton@sina.com>
Cc:     syzbot <syzbot+06ddf1788cfd048c5e82@syzkaller.appspotmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
        mchehab@kernel.org,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Jun 8, 2019 at 7:49 AM Hillf Danton <hdanton@sina.com> wrote:
>
>
> Hi
>
> On Fri, 07 Jun 2019 14:53:05 -0700 (PDT) syzbot wrote:
> > Hello,
> >
> > syzbot found the following crash on:
> >
> > HEAD commit:    f75e4cfe kmsan: use kmsan_handle_urb() in urb.c
> > git tree:       kmsan
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D1454b01ea00=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3D602468164cc=
dc30a
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3D06ddf1788cfd0=
48c5e82
> > compiler:       clang version 9.0.0 (/home/glider/llvm/clang
> > 06d00afa61eef8f7f501ebdb4e8612ea43ec2d78)
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D12cbead2a=
00000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D1683b761a00=
000
> >
> > IMPORTANT: if you fix the bug, please add the following tag to the comm=
it:
> > Reported-by: syzbot+06ddf1788cfd048c5e82@syzkaller.appspotmail.com
> >
> > usb 1-1: config 0 has an invalid interface number: 110 but max is 0
> > usb 1-1: config 0 has no interface number 0
> > usb 1-1: New USB device found, idVendor=3D0ac8, idProduct=3Dc301, bcdDe=
vice=3D
> > 1.4a
> > usb 1-1: New USB device strings: Mfr=3D0, Product=3D0, SerialNumber=3D0
> > usb 1-1: config 0 descriptor??
> > gspca_main: vc032x-2.14.0 probing 0ac8:c301
> > gspca_vc032x: reg_w err -71
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > BUG: KMSAN: uninit-value in read_sensor_register+0x732/0x26a0
> > drivers/media/usb/gspca/vc032x.c:2975
> > CPU: 1 PID: 33 Comm: kworker/1:1 Not tainted 5.1.0+ #1
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS=
 Google 01/01/2011
> > Workqueue: usb_hub_wq hub_event
> > Call Trace:
> >   __dump_stack lib/dump_stack.c:77 [inline]
> >   dump_stack+0x191/0x1f0 lib/dump_stack.c:113
> >   kmsan_report+0x130/0x2a0 mm/kmsan/kmsan.c:622
> >   __msan_warning+0x75/0xe0 mm/kmsan/kmsan_instr.c:310
> >   read_sensor_register+0x732/0x26a0 drivers/media/usb/gspca/vc032x.c:29=
75
> >   vc032x_probe_sensor drivers/media/usb/gspca/vc032x.c:3036 [inline]
> >   sd_init+0x2f94/0x5330 drivers/media/usb/gspca/vc032x.c:3167
> >   gspca_dev_probe2+0xee0/0x2240 drivers/media/usb/gspca/gspca.c:1546
> >   gspca_dev_probe+0x346/0x3b0 drivers/media/usb/gspca/gspca.c:1619
> >   sd_probe+0x8d/0xa0 drivers/media/usb/gspca/gl860/gl860.c:523
> >   usb_probe_interface+0xd66/0x1320 drivers/usb/core/driver.c:361
> >   really_probe+0xdae/0x1d80 drivers/base/dd.c:513
> >   driver_probe_device+0x1b3/0x4f0 drivers/base/dd.c:671
> >   __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:778
> >   bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:454
> >   __device_attach+0x454/0x730 drivers/base/dd.c:844
> >   device_initial_probe+0x4a/0x60 drivers/base/dd.c:891
> >   bus_probe_device+0x137/0x390 drivers/base/bus.c:514
> >   device_add+0x288d/0x30e0 drivers/base/core.c:2106
> >   usb_set_configuration+0x30dc/0x3750 drivers/usb/core/message.c:2027
> >   generic_probe+0xe7/0x280 drivers/usb/core/generic.c:210
> >   usb_probe_device+0x14c/0x200 drivers/usb/core/driver.c:266
> >   really_probe+0xdae/0x1d80 drivers/base/dd.c:513
> >   driver_probe_device+0x1b3/0x4f0 drivers/base/dd.c:671
> >   __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:778
> >   bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:454
> >   __device_attach+0x454/0x730 drivers/base/dd.c:844
> >   device_initial_probe+0x4a/0x60 drivers/base/dd.c:891
> >   bus_probe_device+0x137/0x390 drivers/base/bus.c:514
> >   device_add+0x288d/0x30e0 drivers/base/core.c:2106
> >   usb_new_device+0x23e5/0x2ff0 drivers/usb/core/hub.c:2534
> >   hub_port_connect drivers/usb/core/hub.c:5089 [inline]
> >   hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
> >   port_event drivers/usb/core/hub.c:5350 [inline]
> >   hub_event+0x48d1/0x7290 drivers/usb/core/hub.c:5432
> >   process_one_work+0x1572/0x1f00 kernel/workqueue.c:2269
> >   worker_thread+0x111b/0x2460 kernel/workqueue.c:2415
> >   kthread+0x4b5/0x4f0 kernel/kthread.c:254
> >   ret_from_fork+0x35/0x40 arch/x86/entry/entry_64.S:355
> >
> > Uninit was created at:
> >   kmsan_save_stack_with_flags mm/kmsan/kmsan.c:208 [inline]
> >   kmsan_internal_poison_shadow+0x92/0x150 mm/kmsan/kmsan.c:162
> >   kmsan_kmalloc+0xa4/0x130 mm/kmsan/kmsan_hooks.c:175
> >   kmem_cache_alloc_trace+0x503/0xae0 mm/slub.c:2801
> >   kmalloc include/linux/slab.h:547 [inline]
> >   gspca_dev_probe2+0x30c/0x2240 drivers/media/usb/gspca/gspca.c:1480
> >   gspca_dev_probe+0x346/0x3b0 drivers/media/usb/gspca/gspca.c:1619
> >   sd_probe+0x8d/0xa0 drivers/media/usb/gspca/gl860/gl860.c:523
> >   usb_probe_interface+0xd66/0x1320 drivers/usb/core/driver.c:361
> >   really_probe+0xdae/0x1d80 drivers/base/dd.c:513
> >   driver_probe_device+0x1b3/0x4f0 drivers/base/dd.c:671
> >   __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:778
> >   bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:454
> >   __device_attach+0x454/0x730 drivers/base/dd.c:844
> >   device_initial_probe+0x4a/0x60 drivers/base/dd.c:891
> >   bus_probe_device+0x137/0x390 drivers/base/bus.c:514
> >   device_add+0x288d/0x30e0 drivers/base/core.c:2106
> >   usb_set_configuration+0x30dc/0x3750 drivers/usb/core/message.c:2027
> >   generic_probe+0xe7/0x280 drivers/usb/core/generic.c:210
> >   usb_probe_device+0x14c/0x200 drivers/usb/core/driver.c:266
> >   really_probe+0xdae/0x1d80 drivers/base/dd.c:513
> >   driver_probe_device+0x1b3/0x4f0 drivers/base/dd.c:671
> >   __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:778
> >   bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:454
> >   __device_attach+0x454/0x730 drivers/base/dd.c:844
> >   device_initial_probe+0x4a/0x60 drivers/base/dd.c:891
> >   bus_probe_device+0x137/0x390 drivers/base/bus.c:514
> >   device_add+0x288d/0x30e0 drivers/base/core.c:2106
> >   usb_new_device+0x23e5/0x2ff0 drivers/usb/core/hub.c:2534
> >   hub_port_connect drivers/usb/core/hub.c:5089 [inline]
> >   hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
> >   port_event drivers/usb/core/hub.c:5350 [inline]
> >   hub_event+0x48d1/0x7290 drivers/usb/core/hub.c:5432
> >   process_one_work+0x1572/0x1f00 kernel/workqueue.c:2269
> >   worker_thread+0x111b/0x2460 kernel/workqueue.c:2415
> >   kthread+0x4b5/0x4f0 kernel/kthread.c:254
> >   ret_from_fork+0x35/0x40 arch/x86/entry/entry_64.S:355
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> Ignore my noise if you have no interest seeing the syzbot report.
>
> The following tiny diff, made in hope that it may help you perhaps handle
> the report, allocates a slab with zero filled to make the bot happy.
>
> Thanks
> Hillf
> ---
>  drivers/media/usb/gspca.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/gspca.c b/drivers/media/usb/gspca.c
> index be11f78..dcc6ed4 100644
> --- a/drivers/media/usb/gspca.c
> +++ b/drivers/media/usb/gspca.c
> @@ -1468,7 +1468,7 @@ int gspca_dev_probe2(struct usb_interface *intf,
>                 pr_err("couldn't kzalloc gspca struct\n");
>                 return -ENOMEM;
>         }
> -       gspca_dev->usb_buf =3D kmalloc(USB_BUF_SZ, GFP_KERNEL);
> +       gspca_dev->usb_buf =3D kmalloc(USB_BUF_SZ, GFP_KERNEL|__GFP_ZERO)=
;
How about calling kzalloc() then?
>         if (!gspca_dev->usb_buf) {
>                 pr_err("out of memory\n");
>                 ret =3D -ENOMEM;
> --
>
> --
> You received this message because you are subscribed to the Google Groups=
 "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/syzkaller-bugs/20190608054928.4792-1-hdanton%40sina.com.
> For more options, visit https://groups.google.com/d/optout.



--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
