Return-Path: <linux-media+bounces-12636-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED238FE3C7
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 12:07:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF83AB24ABE
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 10:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FEBE187347;
	Thu,  6 Jun 2024 10:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q2tQ0EKC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA6F18733F
	for <linux-media@vger.kernel.org>; Thu,  6 Jun 2024 10:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717668282; cv=none; b=i5C8KNSo8CJRb+ZdDvVAKZ7abxATrkmDu+XEEACD3JpoLHRdPukYlo6CpMsgUv5VIK2pYFkuC74dUbKtDqp5uEZvJ1rRFtgrCTXuWnvW2fUT2H8YeFo9UQRTnTj15nGSCMbfIze3O9ApuE2bSKeeKln8wgQqnob6KV7Awv5yjD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717668282; c=relaxed/simple;
	bh=cljjUSYvAY7IKDvMcJNeH/P9k/GXEpyfzDxe6JnqD3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eRUzZaZJOjJ2rsasluLMeW4UVwh9UcBPaKnun/aXEKIwIMXq1e5RTI1Z+yrHY/WJKFiV+zj80lIZVhftswIR2V4SDZPiE8bf2qLHWWaTYr/ss/Rx/hbmrUJaoTZoh+bmF5tZrS64k5Dd2AfOBpJAnRw4TFfkEseWMDvRfgM/XXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Q2tQ0EKC; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-79513555279so33794385a.1
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2024 03:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717668280; x=1718273080; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6FFEfZfMhtCTVz6fJLdJgkQIxu+ZKHBd6J2Z4h3gV+c=;
        b=Q2tQ0EKCP5uKBNWWXnMqd2q8us0BM0caXz93IgTyeKDqpYhE1aqg0ej+3QOj5rP2uz
         QAecPCwEjV6urTJJRXZxipc7BPkByr6BhORwFIjzgxfLDHCk48cyoudG1J7P4OHec2ir
         t91KZ0xGo3666XOC5XWCn6y0WWeHKrT469iJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717668280; x=1718273080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6FFEfZfMhtCTVz6fJLdJgkQIxu+ZKHBd6J2Z4h3gV+c=;
        b=d/3c+0POdfyggv5TZ5660gEfExNBL3D8uTIQrFKSMDMo1snAIgCzf8ft5UfjYKyJB+
         2sWQG8IFQsQ2ZKyqjTxcvjnwm0wxbeN5kdcMnd/jAls667Jis3MLvFjEor2XjESuZkku
         KsLJED6Ml19rAvw0ONzjoVa9Z6nWylVCd8VbGZ5NXoH8q5ASN7SSscuMENjHMnD67SI7
         rMhGeQwK74lmN1NpnxpnaIdZL/TYpTq9PRBLjg34BsOhDb3UTNRK4Qoz5KT5pRtoQ298
         zAN5A80u7+tfEVIt6HJFZkD7sohvwUVBO92jSM1agiwCjgYhasVuH8S6+Fa9J0VcII5o
         u2tw==
X-Forwarded-Encrypted: i=1; AJvYcCV1qJAqzCajXSv4zR8Cdcsq6ebDdC+20XmerZXvjy++qw+cPVbLppNpqfBWuAFnnyCeMTeUHMfKPrxn5WpiBCLIPRGTCbk+a7ORJ+I=
X-Gm-Message-State: AOJu0YzuUaRWz5ZY0GJAIgySAtKmADcHQliedcZZHPxjo8sJlcvJfdD9
	JvAaW2EL3VSQh0miV5m3WbQnRdMzTFgivYjxVXxCU8RxQqnRSMoqA9vhBMIqjRe9j/Hqn+Uo7yY
	ozg==
X-Google-Smtp-Source: AGHT+IHDuFZRqqd1xpSy6ddlZ+/C2wnHZXo9LrzjCOAYfYTgcHMFwygbMq83D1jV5IokugxaZoG0yw==
X-Received: by 2002:a05:620a:3727:b0:795:124c:6c0d with SMTP id af79cd13be357-79523fc2da5mr633627985a.66.1717668279668;
        Thu, 06 Jun 2024 03:04:39 -0700 (PDT)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com. [209.85.219.47])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-795331e5972sm44794585a.124.2024.06.06.03.04.37
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 03:04:38 -0700 (PDT)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6ae1b32752fso3970526d6.0
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2024 03:04:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWCr9XeH4JHCnJy4KB5UuXaHuaXmHb1jscs/MTInp28ZmMUh2FR2of1pmFvW+MBOFX6/PtuS0R5DRkDF7MMKiM9dcMXilrOjJXOOR8=
X-Received: by 2002:a05:6214:4992:b0:6ad:8fd4:efce with SMTP id
 6a1803df08f44-6b02bf761c8mr66383096d6.28.1717668276675; Thu, 06 Jun 2024
 03:04:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240327-guenter-mini-v4-0-49955c198eae@chromium.org>
 <20240327-guenter-mini-v4-1-49955c198eae@chromium.org> <7d06c6e4-c555-4117-a22b-5c614d7f6f8a@xs4all.nl>
In-Reply-To: <7d06c6e4-c555-4117-a22b-5c614d7f6f8a@xs4all.nl>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 6 Jun 2024 19:04:20 +0900
X-Gmail-Original-Message-ID: <CAAFQd5A3nzpv531fu6h7thCkxettTSbc3vofPyt7ie8qf6SJcQ@mail.gmail.com>
Message-ID: <CAAFQd5A3nzpv531fu6h7thCkxettTSbc3vofPyt7ie8qf6SJcQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] media: uvcvideo: stop stream during unregister
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Ricardo Ribalda <ribalda@chromium.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Max Staudt <mstaudt@chromium.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Alan Stern <stern@rowland.harvard.edu>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sean Paul <seanpaul@chromium.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Tue, May 28, 2024 at 4:55=E2=80=AFPM Hans Verkuil <hverkuil-cisco@xs4all=
.nl> wrote:
>
> On 27/03/2024 09:24, Ricardo Ribalda wrote:
> > uvc_unregister_video() can be called asynchronously from
> > uvc_disconnect(). If the device is still streaming when that happens, a
> > plethora of race conditions can happen.
> >
> > Make sure that the device has stopped streaming before exiting this
> > function.
> >
> > If the user still holds handles to the driver's file descriptors, any
> > ioctl will return -ENODEV from the v4l2 core.
> >
> > This change make uvc more consistent with the rest of the v4l2 drivers
> > using the vb2_fop_* and vb2_ioctl_* helpers.
> >
> > Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc=
/uvc_driver.c
> > index bbd90123a4e76..17fc945c8deb6 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -1911,8 +1911,19 @@ static void uvc_unregister_video(struct uvc_devi=
ce *dev)
> >               if (!video_is_registered(&stream->vdev))
> >                       continue;
> >
> > +             /*
> > +              * Serialize other access to the stream.
> > +              */
> > +             mutex_lock(&stream->mutex);
> > +             uvc_queue_streamoff(&stream->queue, stream->type);
> >               video_unregister_device(&stream->vdev);
> >               video_unregister_device(&stream->meta.vdev);
> > +             mutex_unlock(&stream->mutex);
>
> This sequence isn't fool proof. You have to follow the same sequence as
> vb2_video_unregister_device(): take a reference to the video device,
> then unregister, then take the stream mutex and call vb2_queue_release
> for each queue. Finally unlock the mutex and call put_device.

vb2_queue_release() will run when the userspace releases the file
handle that owns the vb2 queue [1], so we shouldn't really need to
call it here.

[1] https://elixir.bootlin.com/linux/v6.9.3/source/drivers/media/usb/uvc/uv=
c_v4l2.c#L655

>
> Doing the video_unregister_device first ensures no new ioctls can be
> called on that device node. Taking the mutex ensures that any still
> running ioctls will finish (since it will sleep until they release the
> mutex), and then you can release the queue.

Actually isn't the only missing thing in the code basically ensuring
that any ioctl currently being executed finishes? Why is the streamoff
or queue release needed?

Best regards,
Tomasz

>
> This does require that you call get_device before calling video_unregiste=
r_device,
> otherwise everything might be released at that point.
>
> Instead of vb2_queue_release() you might have to call uvc_queue_streamoff=
,
> but note that there are two queues here: video and meta. The code above
> just calls streamoff for the video device.
>
> For the meta device I think you can just use vb2_video_unregister_device(=
)
> directly, since that sets vdev->queue and vdev->queue.lock to the correct
> values. That would just leave the video device where you need to do this
> manually.
>
> Regards,
>
>         Hans
>
> > +
> > +             /*
> > +              * Now the vdev is not streaming and all the ioctls will
> > +              * return -ENODEV
> > +              */
> >
> >               uvc_debugfs_cleanup_stream(stream);
> >       }
> >
>

