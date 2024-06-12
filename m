Return-Path: <linux-media+bounces-12983-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 689A49049A5
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 05:28:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2D0D286F31
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 03:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE603BBEC;
	Wed, 12 Jun 2024 03:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Gngi8TSq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDA93A1C4
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 03:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718162748; cv=none; b=lrpyVBaPFNVPihJmP8AlqADyy5ZiXNFpCYL8u5JFDmqJu7YLOTccWhLRJ7aL1ouiZAEC4FKyvPGB5883lqK6oqgH/tovYLtyx6i2XQ/xft7BPC0xJBQQNQcELrM1dAdWT7PasRVxaUgMbmeWJVBJDJl/AA6e6HTzT+NF1YmGZfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718162748; c=relaxed/simple;
	bh=f0KrILH3kr7anOUOsJZV2d4WNHNntE524DO1e7OauZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ovJdTw8l1Qevz9v16ZY5C7vRzWqrtNdNLgeDOyAIGHVPR8J/eW0ywdCJ/1eCd5RLw+KupKSaGvNzofaKLTWx9YYoYMclKE39Kj7HCgiA1c/TUHPDfehiguw6GqbXVING5zz4KQLvtMFHy67lEfc5Ov+5Pk973YcB0vc7jeDxv2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Gngi8TSq; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-57ca8e45a1bso290807a12.0
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 20:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718162743; x=1718767543; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zncNPlK1KhFnoHey29Jtt2xNQ8IDNyEFlcKcVKZ1KJU=;
        b=Gngi8TSqM6aGg5iNumFe+kztKOkUw417aa9HYQFuU8spWl17nlIpyeovqbqxDfJHCA
         wSrCzgK7G41CAg3ThG/rRy+eoYsK+m+Ia9paBa/3SRlZD5OnLuo6/J2o131MwaZAadL3
         BABPFQ8hJtvF0nDKN4i0W+pUlO0GPUqJAH14A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718162743; x=1718767543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zncNPlK1KhFnoHey29Jtt2xNQ8IDNyEFlcKcVKZ1KJU=;
        b=eR0pUYsQKNbLWwAYv5wrhTAKQyeKKJO0Zwgb7c/J4V0hzB1ievn3fwatYLLvxCnNVa
         ej+9Ej2nca+j8XPmJEt/JI1LX4CbUYjzG8Y5e7Z3GBTCL9vzqniQmSGbhj5uX9p81jI2
         Sc+uxnfkrgLtH7in+bq9//bophgBACh11/W+X/fJ6LrWDxOhxGbYwKVC+TV4lXNus4Rb
         /MdkByceRfWEQXDtjgbfkQCVG6Sr5qwET/cWt42e0LXJ9hK6Y8ZwhtX/99GSyiT4ZhKl
         eZ+/RHLmbhIFmXeY0zQy3Ys09xqMtjQePWJ4rivGzjYRQDGhSXu4VAvnh2VkTvKUjgS+
         2ERw==
X-Forwarded-Encrypted: i=1; AJvYcCUw2n1S433QHjj178tTvlxy36krK7nZC9m1JsBgJ2jsga/oxmCShnPywhMLqyU9dYWkr6u4OoO56LkfWSI4L3iR3RkvqObgCiG4Ayg=
X-Gm-Message-State: AOJu0YyFS5S5JFGLc0N2o+C1OJELi/AAiyjJjOydMGJ5PmyHzPuXYDaq
	Nm4FEitv2hSLg3f6pUhR9T5Jn5UgewrMbwECo3jb8DCr6kGwxt7P0r3zklWkZ6z/RwSKfMMru+k
	GHQ==
X-Google-Smtp-Source: AGHT+IEp3kL+C0ao8xnS2LAK0q8wgF7M5VESOjgC7yRGSXySERkViISKk138twAM8OpMAm2ClPy/FA==
X-Received: by 2002:a50:cd5c:0:b0:57a:2538:7b67 with SMTP id 4fb4d7f45d1cf-57ca974390emr646722a12.3.1718162743241;
        Tue, 11 Jun 2024 20:25:43 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57c96651bc3sm1881387a12.4.2024.06.11.20.25.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 20:25:41 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-57c68c3f8adso2217776a12.1
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 20:25:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV5lwznXwCEi/D0x8Xxx4OUHjFptuTVmMvbSh4C4xy+kLARF3kk5ecT07VZNkwJMm9LL1niZqkiDdd0SSUeOYTxGd0JYEeQprnnPVU=
X-Received: by 2002:a17:906:35cd:b0:a6e:fbe1:d5e1 with SMTP id
 a640c23a62f3a-a6f47f589abmr40566366b.22.1718162741146; Tue, 11 Jun 2024
 20:25:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240327-guenter-mini-v4-0-49955c198eae@chromium.org>
 <20240327-guenter-mini-v4-1-49955c198eae@chromium.org> <7d06c6e4-c555-4117-a22b-5c614d7f6f8a@xs4all.nl>
 <CAAFQd5A3nzpv531fu6h7thCkxettTSbc3vofPyt7ie8qf6SJcQ@mail.gmail.com> <1976a7c6-6b66-4c4c-9c9c-f41dd8b2bdf3@xs4all.nl>
In-Reply-To: <1976a7c6-6b66-4c4c-9c9c-f41dd8b2bdf3@xs4all.nl>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 12 Jun 2024 12:25:12 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CDX9mWejD8RTwFfYA7dLmkfpe8Cbddba+KhrsWJR0uzA@mail.gmail.com>
Message-ID: <CAAFQd5CDX9mWejD8RTwFfYA7dLmkfpe8Cbddba+KhrsWJR0uzA@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] media: uvcvideo: stop stream during unregister
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Ricardo Ribalda <ribalda@chromium.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Max Staudt <mstaudt@chromium.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Alan Stern <stern@rowland.harvard.edu>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sean Paul <seanpaul@chromium.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 6, 2024 at 8:58=E2=80=AFPM Hans Verkuil <hverkuil-cisco@xs4all.=
nl> wrote:
>
> On 06/06/2024 12:04, Tomasz Figa wrote:
> > Hi Hans,
> >
> > On Tue, May 28, 2024 at 4:55=E2=80=AFPM Hans Verkuil <hverkuil-cisco@xs=
4all.nl> wrote:
> >>
> >> On 27/03/2024 09:24, Ricardo Ribalda wrote:
> >>> uvc_unregister_video() can be called asynchronously from
> >>> uvc_disconnect(). If the device is still streaming when that happens,=
 a
> >>> plethora of race conditions can happen.
> >>>
> >>> Make sure that the device has stopped streaming before exiting this
> >>> function.
> >>>
> >>> If the user still holds handles to the driver's file descriptors, any
> >>> ioctl will return -ENODEV from the v4l2 core.
> >>>
> >>> This change make uvc more consistent with the rest of the v4l2 driver=
s
> >>> using the vb2_fop_* and vb2_ioctl_* helpers.
> >>>
> >>> Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >>> ---
> >>>  drivers/media/usb/uvc/uvc_driver.c | 11 +++++++++++
> >>>  1 file changed, 11 insertions(+)
> >>>
> >>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/u=
vc/uvc_driver.c
> >>> index bbd90123a4e76..17fc945c8deb6 100644
> >>> --- a/drivers/media/usb/uvc/uvc_driver.c
> >>> +++ b/drivers/media/usb/uvc/uvc_driver.c
> >>> @@ -1911,8 +1911,19 @@ static void uvc_unregister_video(struct uvc_de=
vice *dev)
> >>>               if (!video_is_registered(&stream->vdev))
> >>>                       continue;
> >>>
> >>> +             /*
> >>> +              * Serialize other access to the stream.
> >>> +              */
> >>> +             mutex_lock(&stream->mutex);
> >>> +             uvc_queue_streamoff(&stream->queue, stream->type);
> >>>               video_unregister_device(&stream->vdev);
> >>>               video_unregister_device(&stream->meta.vdev);
> >>> +             mutex_unlock(&stream->mutex);
> >>
> >> This sequence isn't fool proof. You have to follow the same sequence a=
s
> >> vb2_video_unregister_device(): take a reference to the video device,
> >> then unregister, then take the stream mutex and call vb2_queue_release
> >> for each queue. Finally unlock the mutex and call put_device.
> >
> > vb2_queue_release() will run when the userspace releases the file
> > handle that owns the vb2 queue [1], so we shouldn't really need to
> > call it here.
> >
> > [1] https://elixir.bootlin.com/linux/v6.9.3/source/drivers/media/usb/uv=
c/uvc_v4l2.c#L655
> >
> >>
> >> Doing the video_unregister_device first ensures no new ioctls can be
> >> called on that device node. Taking the mutex ensures that any still
> >> running ioctls will finish (since it will sleep until they release the
> >> mutex), and then you can release the queue.
> >
> > Actually isn't the only missing thing in the code basically ensuring
> > that any ioctl currently being executed finishes? Why is the streamoff
> > or queue release needed?
>
> See below...
>
> >
> > Best regards,
> > Tomasz
> >
> >>
> >> This does require that you call get_device before calling video_unregi=
ster_device,
> >> otherwise everything might be released at that point.
> >>
> >> Instead of vb2_queue_release() you might have to call uvc_queue_stream=
off,
> >> but note that there are two queues here: video and meta. The code abov=
e
> >> just calls streamoff for the video device.
> >>
> >> For the meta device I think you can just use vb2_video_unregister_devi=
ce()
> >> directly, since that sets vdev->queue and vdev->queue.lock to the corr=
ect
> >> values. That would just leave the video device where you need to do th=
is
> >> manually.
>
> Ideally uvc should just use centralized locking (i.e. set vdev->queue.loc=
k)
> for the video node, just like it does for the meta device.
>
> If that was the case, then it can just call vb2_video_unregister_device()=
.
> The vb2_video_unregister_device helper was added to ensure that no ioctls
> are running, and then streaming is stopped and the queue is released.

Yes, it would be as simple as that if it used standard locking, but
since it does its own stuff, I'm not very confident that the same
logic as in vb2_video_unregister_device() would work fine for it as
well.

>
> While it is true that the queue is released automatically when the last u=
ser
> closes the filehandle, it can get complicated if the application has a fi=
le
> handle open when the device is unregistered (usually due to it being unpl=
ugged).
> Without that call to vb2_video_unregister_device() the queue is still act=
ive,
> and especially if you also have subdevices that are still in streaming mo=
de,
> it is hard to make sure nothing is still using the hardware.
>
> vb2_video_unregister_device() provides a clean way of ensuring that when =
the
> device is unregistered all streaming is stopped and the vb2 queue is rele=
ased.
>
> After that the only file operation that can be used without returning an =
error
> is close().
>
> Since uvc uses its own locking for the video device, it has to do this ma=
nually.
> It is probably enough to ensure no ioctls are running since uvc doesn't h=
ave
> subdevices, but I think it makes sense to stop streaming and release the =
queue
> when unregistering the device, it is weird to postpone that until the las=
t fh
> is closed.

My comment comes from a concern that releasing objects and changing
internal state in the release callback may break some assumptions in
the operations that will follow once the lock is released, e.g.
close(), leading to some kind of double frees or dereferencing freed
objects. Therefore just preventing new opens and setting the
video_device as unregistered could be potentially a safer option until
the driver is converted to standard locking. (Is there even a plan to
do that?)

Best regards,
Tomasz

>
> Regards,
>
>         Hans
>
>
> >>
> >> Regards,
> >>
> >>         Hans
> >>
> >>> +
> >>> +             /*
> >>> +              * Now the vdev is not streaming and all the ioctls wil=
l
> >>> +              * return -ENODEV
> >>> +              */
> >>>
> >>>               uvc_debugfs_cleanup_stream(stream);
> >>>       }
> >>>
> >>
>
>

