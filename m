Return-Path: <linux-media+bounces-38415-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EF4B10EE4
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 17:41:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EC0E5A5C3C
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 15:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B012EA47C;
	Thu, 24 Jul 2025 15:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UhZDty8l"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331D2267729
	for <linux-media@vger.kernel.org>; Thu, 24 Jul 2025 15:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753371685; cv=none; b=HCJQkxcm/eahr5pFyFjEhwcccFrUAAR8XAB0fgdgcSxhKZZe9mk039BCI79rMJgvMsOb6z6DZXJy+HYAznyqhSyEFysTUV14japB6HJ4jtmIBM8gJFZA7V02bO5SRBZ5ae/lb+gG0xnaULGabwAGwaTw85FsQBflA+e25jEweTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753371685; c=relaxed/simple;
	bh=v7Jkc7pnFnG8I79TgHdc6VVgvwulobyj8KqUatw+ML8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P9KU9q6+22RxA0mfgYYCXGTaMZPIzHs5t2gTXDRJz6phpsJ7QZs0yQ3IeNtJBEeM38rYAqsNYNmXUUswA3oX3mZe5y3MA53QbOheDH5kuXz3kUeUfq+Kg7vjye51BYHNv5t74sExHejijdFNLCGsIWjwksuZRZOgQ+r23ymwpAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UhZDty8l; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-32b595891d2so8718671fa.2
        for <linux-media@vger.kernel.org>; Thu, 24 Jul 2025 08:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753371681; x=1753976481; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/YO2QLd6dFG0rH+KpwmcIh/OK0/vdVHmYGqiVqxRC7k=;
        b=UhZDty8le7v74ZvGDy6SzP/NxxYBrlBzKixDeyDMvcmPnL/Vw4oVvyUw3+R3eSkFA3
         oGOo24k2Ma0BcE77m83NtTthZ0KmkJPc0TMZ4bHmmUT3Ke6Y808e+gI7YKT5T4S2oO+D
         IUjCdyM+TSq8oMx/gbDph2yseluXoVQf3Dep4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753371681; x=1753976481;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/YO2QLd6dFG0rH+KpwmcIh/OK0/vdVHmYGqiVqxRC7k=;
        b=eUv2dEH5VNlryA8wwztPgNfVltiBFa+VHZdVCoRdXhOyNTtNw2+XLMAJ91Fm/th4CH
         NTQ8qDQOFgFdBZnEJ0V88WvcsS3F8vjxoj9qNUZFvffOzol5JselxUgAM7SYhINTxPS5
         eXgYeHWaHSaE7Oa7+anCHn+rgvZf2RLHejAphYzC/QxAPUAZXc0jX0822FzCVemWMlJF
         VhUJqoeQdaKxiRUaM8sv4WjVHk3olzU7iT5rlihj6SXQqDScfarwVhk4mz5o7cFwLzux
         xeu7UrzMI5EyD2N8ZY95gkIoKh741BZZvnxyuKSEafo72vO1cZQV60HUzzG8BtNZhDQF
         +/3w==
X-Forwarded-Encrypted: i=1; AJvYcCUhJy86GeQxRPwPlq2S2k9sAFV0k58ZX+DmLrSFz51LAUXlXGFkZ3wlDfoytlY/sdkbIi2ZQqwcl6mbpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwO2tMrCeFoxSp+PUfKEGYIh68Gu4wtJruo2RKxU2QpBO37c9Ju
	bOC17aArIQVygWccH849fdoI9spRtsMheraMh2MVvZtPW3GyxU53EoFq5AkcgrGGHaXgxkrqhLg
	yqOg=
X-Gm-Gg: ASbGncvCZuew04AHosI7rGHjrhWcaYDuaG2qYvXPkbWODvbhx6JXig1hxDhPcWnsQyN
	yaPbpRMozxbmDZ2LsPx63RzfSLQkD/epwDCwMYbM0GpvXXpWB+A4JKqgY0L1OzQ93Vu/Ua1J2re
	akW5j2qb+t/YrJGDpz1ZrtBxlIiDFgzVSgdlOg5bdZJU6T3cfsvfUDWhEcZpJ+aVV81ZyR0swWt
	vtt8p8tugUG375j4XXR4LT9+/Ml4IdQRiYhBqNmoQ8QbnccLqIm+LnZQ3RR6s2nHLPVwyQLjTzU
	XNPoyiZVticiNccxGqAqPH/k/0xg5e8ouAjasY315Vw9VbWzaBszRogawsCv70LxfBrPiPiTwwl
	qBt2G7NZNb1z2lf0YjGZ8uHZPn+0HcIYFFhjC3VxBdyTJI6rwF6V/s9g2YOpD
X-Google-Smtp-Source: AGHT+IFrmaMULYjQ514GgY3hvkIVQEH9QR42TN3xYN5IF0sX8uXzOASR3ICY7NajAYoITQYqoY0APg==
X-Received: by 2002:a2e:88d1:0:b0:32c:a502:8334 with SMTP id 38308e7fff4ca-330dfe5c4ecmr21372771fa.36.1753371681086;
        Thu, 24 Jul 2025 08:41:21 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-331e091252bsm3320851fa.75.2025.07.24.08.41.19
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 08:41:19 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5561ab55c4dso1170102e87.2
        for <linux-media@vger.kernel.org>; Thu, 24 Jul 2025 08:41:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXh2Kd3H4yNfYxS0yq5UAE0eZFwzwMEmA8a0aRihOwcVh2+u9lQXLujm/7PRu1yoIxKFCVEGwzPXIbEvw==@vger.kernel.org
X-Received: by 2002:a05:6512:159b:b0:553:3314:adcf with SMTP id
 2adb3069b0e04-55a51340ca8mr2321848e87.5.1753371678858; Thu, 24 Jul 2025
 08:41:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717-uvc-onelocksless-v1-1-91a1b834186a@chromium.org> <20250724120840.GL11202@pendragon.ideasonboard.com>
In-Reply-To: <20250724120840.GL11202@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 24 Jul 2025 17:41:06 +0200
X-Gmail-Original-Message-ID: <CANiDSCvvAX27u4_qnKxbSqWVWybsZFV-367eSv8ig85-cCeDTw@mail.gmail.com>
X-Gm-Features: Ac12FXylfoPrM2Hz79UdvKdBFKxBMHUnQ0YXNw1mT6Ux9JoPA088IRzv3mRoF_U
Message-ID: <CANiDSCvvAX27u4_qnKxbSqWVWybsZFV-367eSv8ig85-cCeDTw@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Drop stream->mutex
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Thu, 24 Jul 2025 at 14:08, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Thu, Jul 17, 2025 at 07:56:45AM +0000, Ricardo Ribalda wrote:
> > Since commit c93d73c9c2cf ("media: uvcvideo: Use vb2 ioctl and fop
> > helpers"), the IOCTLs are serialized. Due to this there is no more need
> > to protect ctrl, cur_format or cur_frame from concurrent access.
> >
> > Drop stream->mutex after thanking it for years of good service.
> >
> > Use this opportunity to do fix some CodeStyle.
>
> Is that about the following change only:
>
> -       if (format == NULL || frame == NULL) {
> +       if (!format || !frame)
>
> or is there something else I missed ?

I believe that's it.

>
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c   |  4 ----
> >  drivers/media/usb/uvc/uvc_metadata.c |  8 ++------
> >  drivers/media/usb/uvc/uvc_v4l2.c     | 39 ++++++++----------------------------
> >  drivers/media/usb/uvc/uvcvideo.h     |  6 ------
> >  4 files changed, 10 insertions(+), 47 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index 775bede0d93d9b3e5391914aa395326d3de6a3b1..3039e6a533b82dd917050d416c9ced8756d69170 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -183,8 +183,6 @@ static void uvc_stream_delete(struct uvc_streaming *stream)
> >       if (stream->async_wq)
> >               destroy_workqueue(stream->async_wq);
> >
> > -     mutex_destroy(&stream->mutex);
> > -
> >       usb_put_intf(stream->intf);
> >
> >       kfree(stream->formats);
> > @@ -201,8 +199,6 @@ static struct uvc_streaming *uvc_stream_new(struct uvc_device *dev,
> >       if (stream == NULL)
> >               return NULL;
> >
> > -     mutex_init(&stream->mutex);
> > -
> >       stream->dev = dev;
> >       stream->intf = usb_get_intf(intf);
> >       stream->intfnum = intf->cur_altsetting->desc.bInterfaceNumber;
> > diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> > index 229e08ff323eed9129d835b24ea2e8085bb713b8..d1d4fade634bd3f8b12bbaa75388db42aecc25ea 100644
> > --- a/drivers/media/usb/uvc/uvc_metadata.c
> > +++ b/drivers/media/usb/uvc/uvc_metadata.c
> > @@ -100,14 +100,10 @@ static int uvc_meta_v4l2_set_format(struct file *file, void *fh,
> >        * Metadata buffers would still be perfectly parseable, but it's more
> >        * consistent and cleaner to disallow that.
> >        */
> > -     mutex_lock(&stream->mutex);
> > -
> >       if (vb2_is_busy(&stream->meta.queue.queue))
> > -             ret = -EBUSY;
> > -     else
> > -             stream->meta.format = fmt->dataformat;
> > +             return -EBUSY;
> >
> > -     mutex_unlock(&stream->mutex);
> > +     stream->meta.format = fmt->dataformat;
> >
> >       return ret;
>
>         return 0;
>
> >  }
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 160f9cf6e6dbdbf39e3eff56a5d5ea1d977fbe22..d7be4d59f0c73b983aa01321f4acc8f8bf6e83ef 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -329,14 +329,12 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
> >        * developers test their webcams with the Linux driver as well as with
> >        * the Windows driver).
> >        */
> > -     mutex_lock(&stream->mutex);
> >       if (stream->dev->quirks & UVC_QUIRK_PROBE_EXTRAFIELDS)
> >               probe->dwMaxVideoFrameSize =
> >                       stream->ctrl.dwMaxVideoFrameSize;
> >
> >       /* Probe the device. */
> >       ret = uvc_probe_video(stream, probe);
> > -     mutex_unlock(&stream->mutex);
> >       if (ret < 0)
> >               return ret;
> >
> > @@ -395,19 +393,15 @@ static int uvc_ioctl_g_fmt(struct file *file, void *fh,
> >       struct uvc_streaming *stream = handle->stream;
> >       const struct uvc_format *format;
> >       const struct uvc_frame *frame;
> > -     int ret = 0;
> >
> >       if (fmt->type != stream->type)
> >               return -EINVAL;
> >
> > -     mutex_lock(&stream->mutex);
> >       format = stream->cur_format;
> >       frame = stream->cur_frame;
> >
> > -     if (format == NULL || frame == NULL) {
> > -             ret = -EINVAL;
> > -             goto done;
> > -     }
> > +     if (!format || !frame)
> > +             return -EINVAL;
> >
> >       fmt->fmt.pix.pixelformat = format->fcc;
> >       fmt->fmt.pix.width = frame->wWidth;
> > @@ -419,9 +413,7 @@ static int uvc_ioctl_g_fmt(struct file *file, void *fh,
> >       fmt->fmt.pix.xfer_func = format->xfer_func;
> >       fmt->fmt.pix.ycbcr_enc = format->ycbcr_enc;
> >
> > -done:
> > -     mutex_unlock(&stream->mutex);
> > -     return ret;
> > +     return 0;
> >  }
> >
> >  static int uvc_ioctl_s_fmt(struct file *file, void *fh,
> > @@ -441,19 +433,14 @@ static int uvc_ioctl_s_fmt(struct file *file, void *fh,
> >       if (ret < 0)
> >               return ret;
> >
> > -     mutex_lock(&stream->mutex);
> > -     if (vb2_is_busy(&stream->queue.queue)) {
> > -             ret = -EBUSY;
> > -             goto done;
> > -     }
> > +     if (vb2_is_busy(&stream->queue.queue))
> > +             return -EBUSY;
> >
> >       stream->ctrl = probe;
> >       stream->cur_format = format;
> >       stream->cur_frame = frame;
> >
> > -done:
> > -     mutex_unlock(&stream->mutex);
> > -     return ret;
> > +     return 0;
> >  }
> >
> >  static int uvc_ioctl_g_parm(struct file *file, void *fh,
> > @@ -466,9 +453,7 @@ static int uvc_ioctl_g_parm(struct file *file, void *fh,
> >       if (parm->type != stream->type)
> >               return -EINVAL;
> >
> > -     mutex_lock(&stream->mutex);
> >       numerator = stream->ctrl.dwFrameInterval;
> > -     mutex_unlock(&stream->mutex);
> >
>
> You can drop the blank line here.
>
> >       denominator = 10000000;
> >       v4l2_simplify_fraction(&numerator, &denominator, 8, 333);
> > @@ -519,12 +504,9 @@ static int uvc_ioctl_s_parm(struct file *file, void *fh,
> >       uvc_dbg(stream->dev, FORMAT, "Setting frame interval to %u/%u (%u)\n",
> >               timeperframe.numerator, timeperframe.denominator, interval);
> >
> > -     mutex_lock(&stream->mutex);
> >
>
> Double blank line.
>
> > -     if (uvc_queue_streaming(&stream->queue)) {
> > -             mutex_unlock(&stream->mutex);
> > +     if (uvc_queue_streaming(&stream->queue))
> >               return -EBUSY;
> > -     }
> >
> >       format = stream->cur_format;
> >       frame = stream->cur_frame;
> > @@ -556,14 +538,11 @@ static int uvc_ioctl_s_parm(struct file *file, void *fh,
> >
> >       /* Probe the device with the new settings. */
> >       ret = uvc_probe_video(stream, &probe);
> > -     if (ret < 0) {
> > -             mutex_unlock(&stream->mutex);
> > +     if (ret < 0)
> >               return ret;
> > -     }
> >
> >       stream->ctrl = probe;
> >       stream->cur_frame = frame;
> > -     mutex_unlock(&stream->mutex);
> >
> >       /* Return the actual frame period. */
> >       timeperframe.numerator = probe.dwFrameInterval;
> > @@ -941,10 +920,8 @@ static int uvc_ioctl_g_selection(struct file *file, void *fh,
> >
> >       sel->r.left = 0;
> >       sel->r.top = 0;
> > -     mutex_lock(&stream->mutex);
> >       sel->r.width = stream->cur_frame->wWidth;
> >       sel->r.height = stream->cur_frame->wHeight;
> > -     mutex_unlock(&stream->mutex);
> >
> >       return 0;
> >  }
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 757254fc4fe930ae61c9d0425f04d4cd074a617e..86765b9d7935f0888476249c3fb826cd7f36b35c 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -469,12 +469,6 @@ struct uvc_streaming {
> >       const struct uvc_format *cur_format;
> >       const struct uvc_frame *cur_frame;
> >
> > -     /*
> > -      * Protect access to ctrl, cur_format, cur_frame and hardware video
> > -      * probe control.
> > -      */
> > -     struct mutex mutex;
> > -
>
> Could you please instead keep this mutex and drop uvc_video_queue.mutex
> ? The rationale is that the same lock is now used to protect the queue
> operations and to serialize the ioctls. It's therefore a higher-level
> lock, which should be stored in the higher-level object, not in the
> queue.
>
> You can then also drop the lock assignment in uvc_queue.c that reads
>
>         queue->queue.lock = &queue->mutex;
>
> as videobuf2 and the V4L2 core will use the video device lock when no
> queue lock is set. The comment at the top of uvc_queue.c may need to be
> updated.

Are we sure that it is exactly the same?

There are places in videobuf2-core.c where we do not use video device lock.

Eg:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/common/videobuf2/videobuf2-core.c#n2056

I'd rather keep the assignment to be in the safe side.

Regards!


>
> >       /* Buffers queue. */
> >       unsigned int frozen : 1;
> >       struct uvc_video_queue queue;
> >
> > ---
> > base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
> > change-id: 20250716-uvc-onelocksless-b66658e01f89
>
> --
> Regards,
>
> Laurent Pinchart



--
Ricardo Ribalda

