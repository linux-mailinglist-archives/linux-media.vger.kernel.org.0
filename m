Return-Path: <linux-media+bounces-822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C627F4866
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 15:00:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 756EBB20F62
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 14:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E98325571;
	Wed, 22 Nov 2023 13:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Lo9EZXeN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD5EE197
	for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 05:59:49 -0800 (PST)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-1ef370c2e12so3865029fac.1
        for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 05:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700661588; x=1701266388; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D6DKXVEGFtP618IWdtKwLgwiHtnsTox1dLjqRW4wwcY=;
        b=Lo9EZXeNSzLqA4Di37WMHUE84LYjntTKML2DaOoNZZnUnPiLvVs0c/67ritmLayzXI
         rDaOcS2cSsStbXdoAYF3uszcIx5zgguxpXt3ZvnZ0gpcYlO0eDOhXW8C2AmQUObLyJz7
         /yXfS8xoPoUWxtnw7whTwQXn1LlS/CTKQu42U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700661588; x=1701266388;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D6DKXVEGFtP618IWdtKwLgwiHtnsTox1dLjqRW4wwcY=;
        b=oPpgdg8lBxiv1h9apJ1EkH7IqzCJ+aYzlaV9EFOyD2pdF2XK2lEvtUzsrWRa+sfQ4H
         NFXi1nWQBHtm3nmtaPlC39CYrYE7LwY+5wMCjWk2b9JD0MQEesIc9/aqSa7NWzbMHS/o
         ifM+ueiv/eJos27/qryWEncB+pehi83NFAhm9DoRYnIZAJBRphIHtDFIQcLfGVxqXFWS
         iCwx2hdMnZw88oP/x3XlV2gzuqbHuKvUacaN+g9XUaAnO3GpswONEK2HJkKuIOwP72gk
         BQxVUCtAbPW2LKIrJqLjYMesNbHc5lzdz65+Cl2d79f9haTZ9sbs59nJpl5L9iW9SvyQ
         K7Ow==
X-Gm-Message-State: AOJu0YyNQ8aW94pKUUI8qZN1lBlTxd+DiLEo1K8DdNyPXcuczhYI/y1z
	XNqa1tq1jZN/6lFMBuMzMzxXUxCTZ2kUBJz6il+LCQ==
X-Google-Smtp-Source: AGHT+IGJSz3o7KivCCiCDQF4nQTC2iRM1ErukykN7ulC4vrOWNhQ+TLVS0JXLPqIkiefmKD5s2nWFQ==
X-Received: by 2002:a05:6870:f71f:b0:1dc:7e71:d475 with SMTP id ej31-20020a056870f71f00b001dc7e71d475mr2736517oab.4.1700661588754;
        Wed, 22 Nov 2023 05:59:48 -0800 (PST)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com. [209.85.219.50])
        by smtp.gmail.com with ESMTPSA id df25-20020a05622a0ed900b00419c39dd28fsm4431671qtb.20.2023.11.22.05.59.47
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 05:59:47 -0800 (PST)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-66d1a05b816so25935546d6.1
        for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 05:59:47 -0800 (PST)
X-Received: by 2002:a05:6214:5193:b0:671:dac1:c856 with SMTP id
 kl19-20020a056214519300b00671dac1c856mr2106687qvb.53.1700661587263; Wed, 22
 Nov 2023 05:59:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231121-guenter-mini-v3-0-d8a5eae2312b@chromium.org>
 <20231121-guenter-mini-v3-3-d8a5eae2312b@chromium.org> <ZV3WEDZ0EfdYrImE@valkosipuli.retiisi.eu>
 <20231122131455.GC3909@pendragon.ideasonboard.com>
In-Reply-To: <20231122131455.GC3909@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 22 Nov 2023 14:59:31 +0100
X-Gmail-Original-Message-ID: <CANiDSCs9wQyrDt8i7Rk8yFVdBEzdE_AcJWKU4m9iX5EHn8ATqQ@mail.gmail.com>
Message-ID: <CANiDSCs9wQyrDt8i7Rk8yFVdBEzdE_AcJWKU4m9iX5EHn8ATqQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] media: uvcvideo: Lock video streams and queues
 while unregistering
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Tomasz Figa <tfiga@chromium.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sean Paul <seanpaul@chromium.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dan Williams <dan.j.williams@intel.com>, Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Wed, 22 Nov 2023 at 14:14, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> CC'ing Dan Williams.
>
> On Wed, Nov 22, 2023 at 10:21:04AM +0000, Sakari Ailus wrote:
> > Hi Ricardo,
> >
> > On Tue, Nov 21, 2023 at 07:53:50PM +0000, Ricardo Ribalda wrote:
> > > From: Guenter Roeck <linux@roeck-us.net>
> > >
> > > The call to uvc_disconnect() is not protected by any mutex.
> > > This means it can and will be called while other accesses to the video
> > > device are in progress. This can cause all kinds of race conditions,
> > > including crashes such as the following.
> > >
> > > usb 1-4: USB disconnect, device number 3
> > > BUG: unable to handle kernel NULL pointer dereference at 0000000000000000
> > > PGD 0 P4D 0
> > > Oops: 0000 [#1] PREEMPT SMP PTI
> > > CPU: 0 PID: 5633 Comm: V4L2CaptureThre Not tainted 4.19.113-08536-g5d29ca36db06 #1
> > > Hardware name: GOOGLE Edgar, BIOS Google_Edgar.7287.167.156 03/25/2019
> > > RIP: 0010:usb_ifnum_to_if+0x29/0x40
> > > Code: <...>
> > > RSP: 0018:ffffa46f42a47a80 EFLAGS: 00010246
> > > RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffff904a396c9000
> > > RDX: ffff904a39641320 RSI: 0000000000000001 RDI: 0000000000000000
> > > RBP: ffffa46f42a47a80 R08: 0000000000000002 R09: 0000000000000000
> > > R10: 0000000000009975 R11: 0000000000000009 R12: 0000000000000000
> > > R13: ffff904a396b3800 R14: ffff904a39e88000 R15: 0000000000000000
> > > FS: 00007f396448e700(0000) GS:ffff904a3ba00000(0000) knlGS:0000000000000000
> > > CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > CR2: 0000000000000000 CR3: 000000016cb46000 CR4: 00000000001006f0
> > > Call Trace:
> > >  usb_hcd_alloc_bandwidth+0x1ee/0x30f
> > >  usb_set_interface+0x1a3/0x2b7
> > >  uvc_video_start_transfer+0x29b/0x4b8 [uvcvideo]
> > >  uvc_video_start_streaming+0x91/0xdd [uvcvideo]
> > >  uvc_start_streaming+0x28/0x5d [uvcvideo]
> > >  vb2_start_streaming+0x61/0x143 [videobuf2_common]
> > >  vb2_core_streamon+0xf7/0x10f [videobuf2_common]
> > >  uvc_queue_streamon+0x2e/0x41 [uvcvideo]
> > >  uvc_ioctl_streamon+0x42/0x5c [uvcvideo]
> > >  __video_do_ioctl+0x33d/0x42a
> > >  video_usercopy+0x34e/0x5ff
> > >  ? video_ioctl2+0x16/0x16
> > >  v4l2_ioctl+0x46/0x53
> > >  do_vfs_ioctl+0x50a/0x76f
> > >  ksys_ioctl+0x58/0x83
> > >  __x64_sys_ioctl+0x1a/0x1e
> > >  do_syscall_64+0x54/0xde
> > >
> > > usb_set_interface() should not be called after the USB device has been
> > > unregistered. However, in the above case the disconnect happened after
> > > v4l2_ioctl() was called, but before the call to usb_ifnum_to_if().
> > >
> > > Acquire various mutexes in uvc_unregister_video() to fix the majority
> > > (maybe all) of the observed race conditions.
> > >
> > > The uvc_device lock prevents races against suspend and resume calls
> > > and the poll function.
> > >
> > > The uvc_streaming lock prevents races against stream related functions;
> > > for the most part, those are ioctls. This lock also requires other
> > > functions using this lock to check if a video device is still registered
> > > after acquiring it. For example, it was observed that the video device
> > > was already unregistered by the time the stream lock was acquired in
> > > uvc_ioctl_streamon().
> > >
> > > The uvc_queue lock prevents races against queue functions, Most of
> > > those are already protected by the uvc_streaming lock, but some
> > > are called directly. This is done as added protection; an actual race
> > > was not (yet) observed.
> > >
> > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Cc: Alan Stern <stern@rowland.harvard.edu>
> > > Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > > Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> > > Reviewed-by: Sean Paul <seanpaul@chromium.org>
> > > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > index 413c32867617..3408b865d346 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > @@ -1907,14 +1907,22 @@ static void uvc_unregister_video(struct uvc_device *dev)
> > >  {
> > >     struct uvc_streaming *stream;
> > >
> > > +   mutex_lock(&dev->lock);
> > > +
> > >     list_for_each_entry(stream, &dev->streams, list) {
> > >             if (!video_is_registered(&stream->vdev))
> > >                     continue;
> > >
> > > +           mutex_lock(&stream->mutex);
> > > +           mutex_lock(&stream->queue.mutex);
> > > +
> > >             video_unregister_device(&stream->vdev);
> > >             video_unregister_device(&stream->meta.vdev);
> > >
> > >             uvc_debugfs_cleanup_stream(stream);
> > > +
> > > +           mutex_unlock(&stream->queue.mutex);
> > > +           mutex_unlock(&stream->mutex);
> > >     }
> > >
> > >     uvc_status_unregister(dev);
> > > @@ -1925,6 +1933,7 @@ static void uvc_unregister_video(struct uvc_device *dev)
> > >     if (media_devnode_is_registered(dev->mdev.devnode))
> > >             media_device_unregister(&dev->mdev);
> > >  #endif
> > > +   mutex_unlock(&dev->lock);
> > >  }
> > >
> > >  int uvc_register_video_device(struct uvc_device *dev,
> > >
> >
> > Instead of acquiring all the possible locks, could you instead take the
> > same approach as you do with ISP? It should use refcount_t btw.
> > <URL:https://chromium.googlesource.com/chromiumos/third_party/kernel/+/refs/heads/kcam-6.1/drivers/isp/isp-device.c:
>
> The right approach, as I've said countless of times, is to fix this at
> the cdev and V4L2 level. Dan Williams has done some ground work on this
> a while ago ([1]), and before that I posted an RFC series that
> overlapped with Dan's work (with a more naive and less efficient
> implementation of refcounting, see [2]).
>
> [1] https://lore.kernel.org/all/161117153776.2853729.6944617921517514510.stgit@dwillia2-desk3.amr.corp.intel.com/
> [2] https://lore.kernel.org/linux-media/20171116003349.19235-2-laurent.pinchart+renesas@ideasonboard.com/

The UVC driver is violating the USB driver API [1] causing crashes and
probably security vulnerabilities. It has to be fixed.

If there was a different way TODAY to do this, I would very happily
implement it differently. But your patchset is 6 years old and Dan's 2
and they have not landed. How many kernel versions is ok to put our
users willingly at risk?

This patch simply serialises unregister_video? How can this patch
affect the viability of your patchset or Dan's patch? If this patch is
not needed in the future we can simply revert it.

When/If there is a better way to implement this, I would very happily
send a follow-up patch to use that framework.

[1] https://www.kernel.org/doc/html/latest/driver-api/usb/callbacks.html#the-disconnect-callback









>
> --
> Regards,
>
> Laurent Pinchart



--
Ricardo Ribalda

