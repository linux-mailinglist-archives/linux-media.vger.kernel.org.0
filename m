Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 479552570BD
	for <lists+linux-media@lfdr.de>; Sun, 30 Aug 2020 23:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbgH3Vgr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Aug 2020 17:36:47 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57888 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbgH3Vgq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Aug 2020 17:36:46 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0913D258;
        Sun, 30 Aug 2020 23:36:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1598823402;
        bh=afb9NeFTelTB2r7vjqDOx2f+fySe7Y8p2317ney7DEM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZsqR1+o61yyvGRlAkKUcfS85Kjqn6S7owyKVw7e31rt7po0awN6/KrnnndJigRbEu
         up4uPDo3QJn0Y1BzYl53viU/6aagoar8TNRJk4TJ3YOXKYb8uCKf6yH0B7daGBASXv
         g3njpj0tz0b4ujhmNEfAn60LOBjM9wt2AS69NPWM=
Date:   Mon, 31 Aug 2020 00:36:21 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-uvc-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] media: uvcvideo: Fix race conditions
Message-ID: <20200830213621.GC6043@pendragon.ideasonboard.com>
References: <20200830150443.167286-1-linux@roeck-us.net>
 <20200830155833.GA6043@pendragon.ideasonboard.com>
 <ac2080a1-3b00-ac9e-cd49-d1ee84c6ca25@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ac2080a1-3b00-ac9e-cd49-d1ee84c6ca25@roeck-us.net>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Guenter,

On Sun, Aug 30, 2020 at 01:48:24PM -0700, Guenter Roeck wrote:
> On 8/30/20 8:58 AM, Laurent Pinchart wrote:
> > On Sun, Aug 30, 2020 at 08:04:38AM -0700, Guenter Roeck wrote:
> >> The uvcvideo code has no lock protection against USB disconnects
> >> while video operations are ongoing. This has resulted in random
> >> error reports, typically pointing to a crash in usb_ifnum_to_if(),
> >> called from usb_hcd_alloc_bandwidth(). A typical traceback is as
> >> follows.
> >>
> >> usb 1-4: USB disconnect, device number 3
> >> BUG: unable to handle kernel NULL pointer dereference at 0000000000000000
> >> PGD 0 P4D 0
> >> Oops: 0000 [#1] PREEMPT SMP PTI
> >> CPU: 0 PID: 5633 Comm: V4L2CaptureThre Not tainted 4.19.113-08536-g5d29ca36db06 #1
> >> Hardware name: GOOGLE Edgar, BIOS Google_Edgar.7287.167.156 03/25/2019
> >> RIP: 0010:usb_ifnum_to_if+0x29/0x40
> >> Code: <...>
> >> RSP: 0018:ffffa46f42a47a80 EFLAGS: 00010246
> >> RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffff904a396c9000
> >> RDX: ffff904a39641320 RSI: 0000000000000001 RDI: 0000000000000000
> >> RBP: ffffa46f42a47a80 R08: 0000000000000002 R09: 0000000000000000
> >> R10: 0000000000009975 R11: 0000000000000009 R12: 0000000000000000
> >> R13: ffff904a396b3800 R14: ffff904a39e88000 R15: 0000000000000000
> >> FS: 00007f396448e700(0000) GS:ffff904a3ba00000(0000) knlGS:0000000000000000
> >> CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >> CR2: 0000000000000000 CR3: 000000016cb46000 CR4: 00000000001006f0
> >> Call Trace:
> >>  usb_hcd_alloc_bandwidth+0x1ee/0x30f
> >>  usb_set_interface+0x1a3/0x2b7
> >>  uvc_video_start_transfer+0x29b/0x4b8 [uvcvideo]
> >>  uvc_video_start_streaming+0x91/0xdd [uvcvideo]
> >>  uvc_start_streaming+0x28/0x5d [uvcvideo]
> >>  vb2_start_streaming+0x61/0x143 [videobuf2_common]
> >>  vb2_core_streamon+0xf7/0x10f [videobuf2_common]
> >>  uvc_queue_streamon+0x2e/0x41 [uvcvideo]
> >>  uvc_ioctl_streamon+0x42/0x5c [uvcvideo]
> >>  __video_do_ioctl+0x33d/0x42a
> >>  video_usercopy+0x34e/0x5ff
> >>  ? video_ioctl2+0x16/0x16
> >>  v4l2_ioctl+0x46/0x53
> >>  do_vfs_ioctl+0x50a/0x76f
> >>  ksys_ioctl+0x58/0x83
> >>  __x64_sys_ioctl+0x1a/0x1e
> >>  do_syscall_64+0x54/0xde
> >>
> >> While this is problem rarely observed in the field, it is relatively easy
> >> to reproduce by adding msleep() calls into the code.
> >>
> >> I don't presume to claim that I found every issue, but this patch series
> >> should fix at least the major problems.
> >>
> >> The patch series was tested exensively on a Chromebook running chromeos-4.19
> >> and on a Linux system running a v5.8.y based kernel.
> > 
> > I'll review each patch individually, but I think 2/5, 4/5 and 5/5 should
> > be handled in the V4L2 core, not the uvcvideo driver. Otherwise we would
> > have to replicate that logic in all drivers, while I think it can easily
> > be implemented in a generic fashion as previously discussed.
> > 
> The problem is that the v4l2 core already does support locking. There is
> a global lock, in struct video_device, a queue lock in struct v4l2_m2m_ctx,
> and another queue lock in struct vb2_queue. However, all of those have
> to be initialized from the driver. The uvcvideo driver uses its own locks and
> does not set the lock pointers in the various generic structures. I was able
> to figure out how to use the uvcvideo specific locks in the uvcvideo
> driver, but all my attempts to initialize and use the generic locks failed.
> 
> It may well be that the generic code isn't entirely clean - for example
> I am not sure if the lock protection in v4l2_open() is complete since
> it doesn't handle disconnects after checking if the video device is still
> registered (and I don't really see the point of the second video_is_registered()
> call in v4l2_open). However, that may just be a lack of understanding on my
> side on how the code is supposed to work. Maybe the actual device open function
> is expected to have its own protection against underlying hardware removal
> and video device unregistration while opening the device.
> 
> [ Regarding the second call to video_is_registered() in v4l2_open():
>   Add msleep(5000) between it and the call to the driver open function,
>   disconnect the device during the sleep, and it will happily call the device
>   open function on a non-registered video device. That is what patch 5/5 tries
>   to fix or the uvcvideo driver.
>   The same problem applies to other file operations in v4l2-dev.c: They all
>   check if the video device is registered before calling the device
>   specific code, but I don't really see the point of doing that because
>   there is no protection against unregistration after the check was made
>   and before/while the device specific code is running.
>   Patch 4/5 tries to fix this for the uvcvideo driver.
>   If that is a bug in the v4l2 code, I'll be happy to work on a fix,
>   but the only generic fix I could think of would be to utilize the lock in
>   struct video_device ... but that lock isn't initialized by the uvcvideo
>   driver.
> ]
> 
> Either case, I don't think my understanding of the interaction between
> v4l2 and uvcvideo is good enough to make more invasive changes. I _think_
> any generic improvement should start with refactoring the uvcvideo code to
> use the v4l2 locking mechanism. However, from the exchange here, my
> understanding is that this locking mechanism is not used on purpose. That
> means we'll have a uvcvideo specific locking mechanism, period, and I don't
> think it is even possible to solve the problem without utilizing this locking
> mechanism.
> 
> Of course, it may as well be that I am completely off track and clueless.
> After all, the first time I looked into this code was about two weeks ago.
> So please bear with me if I talk nonsense.

It would be rather impolite to claim you're clueless, given that you
managed to write this patch series only two weeks after first looking
into the problem :-)

I'll try to prototype what I envision would be a good solution in the
V4L2 core. If stars align, I may even try to push it one level up, to
the chardev layer. Would you then be able to test it ?

> >> ----------------------------------------------------------------
> >> Guenter Roeck (5):
> >>       media: uvcvideo: Cancel async worker earlier
> >>       media: uvcvideo: Lock video streams and queues while unregistering
> >>       media: uvcvideo: Release stream queue when unregistering video device
> >>       media: uvcvideo: Protect uvc queue file operations against disconnect
> >>       media: uvcvideo: In uvc_v4l2_open, check if video device is registered
> >>
> >>  drivers/media/usb/uvc/uvc_ctrl.c   | 11 ++++++----
> >>  drivers/media/usb/uvc/uvc_driver.c | 12 ++++++++++
> >>  drivers/media/usb/uvc/uvc_queue.c  | 32 +++++++++++++++++++++++++--
> >>  drivers/media/usb/uvc/uvc_v4l2.c   | 45 ++++++++++++++++++++++++++++++++++++--
> >>  drivers/media/usb/uvc/uvcvideo.h   |  1 +
> >>  5 files changed, 93 insertions(+), 8 deletions(-)

-- 
Regards,

Laurent Pinchart
