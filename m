Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EDF611AD58
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 15:24:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729923AbfLKOYG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 09:24:06 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36262 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729911AbfLKOYF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 09:24:05 -0500
Received: by mail-pg1-f193.google.com with SMTP id k3so10204556pgc.3
        for <linux-media@vger.kernel.org>; Wed, 11 Dec 2019 06:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8KnatWRJvggnUcJXHtww4qB6FhD522LG/aumBjl9qUs=;
        b=n8KiQmLAc8ZK5BVSQV+k0zHdgmk5QcojzmqCuPP/G5EqqLmvGvd/31aA+vmLC/jxZS
         D9actdnYEsJTGtzyAfpwFJ+EO7OzKmTNsuYhUUA2Sf0aDwNEXRIPCKDHdEL8nYaGDa3W
         /HE6WWnq5KaY8J5umcqmXMhwV3cL8LV/BnQfGYW4jLPSSpKwMKD+HTht8w0ritIwvQln
         eT8p9O4f7MbrVxn/QaAa7EdIbzuNyCe4DDWYEtIlH0HUO8AbgYcdpLebuxmyAG3J1Ep8
         TKAvqkqCy5IG5X3069ZSxgRaOfGYuDc3qiVHKmOccCrWRq/CbYIMEJVQ2W2avARRdHnU
         RBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8KnatWRJvggnUcJXHtww4qB6FhD522LG/aumBjl9qUs=;
        b=IvHEAgvtr7lXwEtCZE09pAjoFFaNAH+kaPuCwBb0u6IET2j66yyaYqzOFMtQjMhhpg
         78lgrX2LfsLWAZkADV/IadTR6JC907VxPfC868TW7SG4nxi3ntoDmVbOTNZTDg88NeNC
         IG7Mk0OaqxljZ6WajSe67PYa+eqqE7QV5APEx+jPEjzO+p8wLmhdp+/+LNiRNWc3ibXg
         +20+eZNJUg6pk4DMW6wXrZciF+H/9sCEzXUQ42OxCVE9QAsO9pa+Zy47qhdfKmnHtdsF
         rmDEWomr/3f4AZ1lVhBhI1GpGUfYrp5CnVpegpxGEPm4FXvJbXfgVILLsI3jJXW8A571
         D6sg==
X-Gm-Message-State: APjAAAUkItDXupor74B1tDFpoAoRBffQkwZucY5GgmQjR0muKxZUTBCT
        5K+uhr8oQ5aDFb+gKGo1tQ/mzRHW0z0esun/XjecLQ==
X-Google-Smtp-Source: APXvYqwojB6kioMBHsLADT9ILNBxNH7/MTlgZ1GSprzRXFq+DanmmA7iuwQxb1WHEBhmTIgofpA1k5SqXdkf60aysjo=
X-Received: by 2002:a63:c804:: with SMTP id z4mr4450211pgg.440.1576074244845;
 Wed, 11 Dec 2019 06:24:04 -0800 (PST)
MIME-Version: 1.0
References: <00000000000031a0af05995eca0b@google.com> <Pine.LNX.4.44L0.1912101513580.1647-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1912101513580.1647-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 11 Dec 2019 15:23:53 +0100
Message-ID: <CAAeHK+wFBYX8-L-D8w_nep3W=QjYoLAZbc=-0eoWK684wnuayA@mail.gmail.com>
Subject: Re: Re: KASAN: use-after-free Read in usbvision_v4l2_open
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     syzbot <syzbot+7fa38a608b1075dfd634@syzkaller.appspotmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Souptick Joarder <jrdr.linux@gmail.com>,
        Kernel development list <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org, USB list <linux-usb@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Richard Fontana <rfontana@redhat.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 10, 2019 at 9:17 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Tue, 10 Dec 2019, syzbot wrote:
>
> > > On Mon, 9 Dec 2019, syzbot wrote:
> >
> > >> Hello,
> >
> > >> syzbot found the following crash on:
> >
> > >> HEAD commit:    1f22d15c usb: gadget: add raw-gadget interface
> > >> git tree:       https://github.com/google/kasan.git usb-fuzzer
> > >> console output: https://syzkaller.appspot.com/x/log.txt?x=1296f42ae00000
> > >> kernel config:
> > >> https://syzkaller.appspot.com/x/.config?x=8ccee2968018adcb
> > >> dashboard link:
> > >> https://syzkaller.appspot.com/bug?extid=c7b0ec009a216143df30
> > >> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> >
> > >> Unfortunately, I don't have any reproducer for this crash yet.
> >
> > >> IMPORTANT: if you fix the bug, please add the following tag to the
> > >> commit:
> > >> Reported-by: syzbot+c7b0ec009a216143df30@syzkaller.appspotmail.com
> >
> > >> ==================================================================
> > >> BUG: KASAN: use-after-free in __mutex_lock_common
> > >> kernel/locking/mutex.c:1043 [inline]
> > >> BUG: KASAN: use-after-free in __mutex_lock+0x124d/0x1360
> > >> kernel/locking/mutex.c:1106
> > >> Read of size 8 at addr ffff8881cad4d8b8 by task v4l_id/4526
> >
> > >> CPU: 0 PID: 4526 Comm: v4l_id Not tainted 5.4.0-syzkaller #0
> > >> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> > >> Google 01/01/2011
> > >> Call Trace:
> > >>    __dump_stack lib/dump_stack.c:77 [inline]
> > >>    dump_stack+0xef/0x16e lib/dump_stack.c:118
> > >>    print_address_description.constprop.0+0x36/0x50 mm/kasan/report.c:374
> > >>    __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:506
> > >>    kasan_report+0xe/0x20 mm/kasan/common.c:638
> > >>    __mutex_lock_common kernel/locking/mutex.c:1043 [inline]
> > >>    __mutex_lock+0x124d/0x1360 kernel/locking/mutex.c:1106
> > >>    usbvision_v4l2_open+0x77/0x340
> > >> drivers/media/usb/usbvision/usbvision-video.c:314
> > >>    v4l2_open+0x20f/0x3d0 drivers/media/v4l2-core/v4l2-dev.c:423
> > >>    chrdev_open+0x219/0x5c0 fs/char_dev.c:414
> > >>    do_dentry_open+0x494/0x1120 fs/open.c:797
> > >>    do_last fs/namei.c:3412 [inline]
> > >>    path_openat+0x142b/0x4030 fs/namei.c:3529
> > >>    do_filp_open+0x1a1/0x280 fs/namei.c:3559
> > >>    do_sys_open+0x3c0/0x580 fs/open.c:1097
> > >>    do_syscall_64+0xb7/0x5b0 arch/x86/entry/common.c:294
> > >>    entry_SYSCALL_64_after_hwframe+0x49/0xbe
> >
> > > This looks like a race in v4l2_open(): The function drops the
> > > videodev_lock mutex before calling the video driver's open routine, and
> > > the device can be unregistered during the short time between.
> >
> > > This patch tries to make the race much more likely to happen, for
> > > testing and verification.
> >
> > > Andrey, will syzbot run the same test with this patch, even though it
> > > says it doesn't have a reproducer?
> >
> > > Alan Stern
> >
> > > #syz test: https://github.com/google/kasan.git 1f22d15c
> >
> > This crash does not have a reproducer. I cannot test it.
>
> Let's try the same patch with a different bug report -- one that has a
> reproducer.  I assume that syzbot gets the bug identity from the
> email's From: line (which has been updated acoordingly) rather than the
> Subject: line.

Did you get a response for this test? I see the test attempt on the
dashboard (the patch failed to build), but I didn't get an email with
the result.

>
> #syz test: https://github.com/google/kasan.git 1f22d15c
>
> Index: usb-devel/drivers/media/usb/usbvision/usbvision-video.c
> ===================================================================
> --- usb-devel.orig/drivers/media/usb/usbvision/usbvision-video.c
> +++ usb-devel/drivers/media/usb/usbvision/usbvision-video.c
> @@ -1585,6 +1585,7 @@ static void usbvision_disconnect(struct
>                 wake_up_interruptible(&usbvision->wait_frame);
>                 wake_up_interruptible(&usbvision->wait_stream);
>         } else {
> +               msleep(100);
>                 usbvision_release(usbvision);
>         }
>
> Index: usb-devel/drivers/media/v4l2-core/v4l2-dev.c
> ===================================================================
> --- usb-devel.orig/drivers/media/v4l2-core/v4l2-dev.c
> +++ usb-devel/drivers/media/v4l2-core/v4l2-dev.c
> @@ -419,9 +419,10 @@ static int v4l2_open(struct inode *inode
>         video_get(vdev);
>         mutex_unlock(&videodev_lock);
>         if (vdev->fops->open) {
> -               if (video_is_registered(vdev))
> +               if (video_is_registered(vdev)) {
> +                       msleep(200);
>                         ret = vdev->fops->open(filp);
> -               else
> +               } else
>                         ret = -ENODEV;
>         }
>
>
