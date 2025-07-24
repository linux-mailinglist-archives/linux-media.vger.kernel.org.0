Return-Path: <linux-media+bounces-38425-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9B4B110B4
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 20:16:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 786655872A3
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 18:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D43E2ECD0A;
	Thu, 24 Jul 2025 18:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ke5hphPR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38A82046A9
	for <linux-media@vger.kernel.org>; Thu, 24 Jul 2025 18:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753380967; cv=none; b=YmVr4ko26sX9PheiFRA1lZGVXCKcjn8P1cKcj2knrO2yN2Zz33TP0Lw8Fpt4ZyBaK5T03mj1PYz4u5Y2+L0qCIXl8HM3PTqbEfhOHTU6QLXrW0OqNNgax3YV8xMvRz4qGATYBoChtK6IVVGLAsNSGD08Nh2AxCBP5unnzYQqLfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753380967; c=relaxed/simple;
	bh=XJJ/JfvOvQVQQlfwsQmk3p8nNpWFvIz3xpR4a6LHYcw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sYeHuOctyuAoplCwNgdGLdivb82XBbFceYrAkLWXxdjr8xweEeiN1UYdaHQP0oWnCGWZRFLDLt+1vPE3Eu4B27lxbShY3tVGdVdswVj33PWA1oMU7v6pgxcnMecvyo4CTsva/tVXk8dA+ayc6VoAyLgCqVu3UXwAFBxPzD8sGdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ke5hphPR; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-32f1df5703aso10521991fa.3
        for <linux-media@vger.kernel.org>; Thu, 24 Jul 2025 11:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753380963; x=1753985763; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rRnkmNXtWAx0OvnHuRzyqidxZKn4ESWiP9VSOgI1TiA=;
        b=Ke5hphPR9pK7MiJ9u2mkGyq5xBmUphkP/Mfy7JVW2JXCpK47ccTiNmr/GU36U3+7Oy
         cyqZRbA5aEKvAy6J80B02O2qsQRag0qKqvPH+hamVTCQiVUEFCjMa45OsRyexYDYpniO
         h07ApMM49aaZobahZY+EL+F9kYDFnrNFaR/A4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753380963; x=1753985763;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rRnkmNXtWAx0OvnHuRzyqidxZKn4ESWiP9VSOgI1TiA=;
        b=X3vjcxF6+kYDZb6rtYc/z2sODaAGlUnFVwkIb35SwTRpITjtZbQGxXw0uO+wORQrep
         U7mxgYf8/Wr/Gr3EvzwUUHaXo+eXUejbomfm6pABEnHkA5CRWz/ZJD/jEGkFv+sozlVF
         ynOXm3vdD24uTt2g0FOXsJ7F/Cn7PuhgXcVp0TZ6+D3BgPufeyfeMGE5+Y5VeUdBBPgp
         saO9WE/YCt8LDkgbn81I2glhUbbRVmUorx/z5LzZpvuj6ect9MlzEnFcomd8tRaTrNn/
         BJ5QeVJBItuVcyD7c9wMtMPeEVAbiU52Pq3UrinhVpeOIXQCDxK9MNSSmS0NnLZt1M+N
         yZQw==
X-Forwarded-Encrypted: i=1; AJvYcCVr4l9ZohOFD4a4YToRUMfpIQtk8SdECy4qgnSa0BpEa6AkWG6Ye/yduyzpnuJzqBtSGpdm5Wr28Q5hig==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKtL4Ahi+it1QthPVx4R46rfbIswW8V06tDLV+vh4zRgon4JF1
	9lqTJenapPdLDnu6UciEBk+QnHpJss3P7I+qjKDUXp8OoLr/g2mItYKJ3FFqBkim+hpp7bIfxVg
	bBBE=
X-Gm-Gg: ASbGnctOuGMNnYOYIOuwNeU3uA2GY/Yd3fDzceqDfYy0VN0JcO/zzQdHPm6I9s/pEP5
	hnVNjoY8y9DynA2u9hvIH3D9Snsh/qnuIRbVLUQaiyYrU+Y6bfuPO9q8z2O/IdDnBTjmH3fEB3R
	l009sfmUo+cpsDthArl4q9KETe5fcnZN+0Y/gVddK2nd4Xc3X/IRzml//jpYz8W8ju3VngOmV1g
	MXhXDoky8/PEkMBgzkuXch7JTIF1qOqHr2EqXn4PQs3suSDMb2jJHo8ivBvxQgG675kXKZnFMYr
	+DKLyKM+Rkp4GvgLvWA4HXYgN6HUVh+89OZheM9IMtuZeNsBfniVWdap1GO+0K6viPTexp8N3RL
	+R78Migl4O6YmNL+/4Votl9NVJNKddhS4gslmJKVt2OLshXLw9KBwYw0fGwMm
X-Google-Smtp-Source: AGHT+IEaFGvg5Cpa3yFdhq4gMz28/ygctmbLZ2e+Sw+CVKv6Zvh+dAP+UVTM2OnuJRzOpkgiF0Sw9w==
X-Received: by 2002:a2e:b8cf:0:b0:32b:7111:95a8 with SMTP id 38308e7fff4ca-330dfdff4b6mr28258481fa.39.1753380962589;
        Thu, 24 Jul 2025 11:16:02 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-331e08e9a54sm3886881fa.52.2025.07.24.11.16.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 11:16:02 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553b5165cf5so1594746e87.0
        for <linux-media@vger.kernel.org>; Thu, 24 Jul 2025 11:16:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+3gx6xBdCA5q0GLwN4eERaGIO9CxFcM4TlGZz7XSfb6KMxg+KKT0Acw0reo63HOt/Cuhx7iouq83jVg==@vger.kernel.org
X-Received: by 2002:a05:6512:2011:b0:550:e608:410b with SMTP id
 2adb3069b0e04-55a513b3587mr1980785e87.33.1753380960869; Thu, 24 Jul 2025
 11:16:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717-uvc-onelocksless-v1-1-91a1b834186a@chromium.org>
 <20250724120840.GL11202@pendragon.ideasonboard.com> <CANiDSCvvAX27u4_qnKxbSqWVWybsZFV-367eSv8ig85-cCeDTw@mail.gmail.com>
 <20250724155101.GA17890@pendragon.ideasonboard.com>
In-Reply-To: <20250724155101.GA17890@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 24 Jul 2025 20:15:48 +0200
X-Gmail-Original-Message-ID: <CANiDSCsojmQdCQqYXBFStPwGJ3n+-04_+dqTx+tsUrT+dRSC2Q@mail.gmail.com>
X-Gm-Features: Ac12FXwZ8FXtJgrp5RAT5nu5B8p5f9k2i-x7S1tdmRh1ThkXammGMBlz8NwmaeY
Message-ID: <CANiDSCsojmQdCQqYXBFStPwGJ3n+-04_+dqTx+tsUrT+dRSC2Q@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Drop stream->mutex
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hans Verkuil <hans@jjverkuil.nl>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Thu, 24 Jul 2025 at 17:51, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> (CC'ing Hans Verkuil)
>
> On Thu, Jul 24, 2025 at 05:41:06PM +0200, Ricardo Ribalda wrote:
> > On Thu, 24 Jul 2025 at 14:08, Laurent Pinchart wrote:
> > > On Thu, Jul 17, 2025 at 07:56:45AM +0000, Ricardo Ribalda wrote:
> > > > Since commit c93d73c9c2cf ("media: uvcvideo: Use vb2 ioctl and fop
> > > > helpers"), the IOCTLs are serialized. Due to this there is no more need
> > > > to protect ctrl, cur_format or cur_frame from concurrent access.
> > > >
> > > > Drop stream->mutex after thanking it for years of good service.
> > > >
> > > > Use this opportunity to do fix some CodeStyle.
> > >
> > > Is that about the following change only:
> > >
> > > -       if (format == NULL || frame == NULL) {
> > > +       if (!format || !frame)
> > >
> > > or is there something else I missed ?
> >
> > I believe that's it.
> >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_driver.c   |  4 ----
> > > >  drivers/media/usb/uvc/uvc_metadata.c |  8 ++------
> > > >  drivers/media/usb/uvc/uvc_v4l2.c     | 39 ++++++++----------------------------
> > > >  drivers/media/usb/uvc/uvcvideo.h     |  6 ------
> > > >  4 files changed, 10 insertions(+), 47 deletions(-)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > > index 775bede0d93d9b3e5391914aa395326d3de6a3b1..3039e6a533b82dd917050d416c9ced8756d69170 100644
> > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > @@ -183,8 +183,6 @@ static void uvc_stream_delete(struct uvc_streaming *stream)
> > > >       if (stream->async_wq)
> > > >               destroy_workqueue(stream->async_wq);
> > > >
> > > > -     mutex_destroy(&stream->mutex);
> > > > -
> > > >       usb_put_intf(stream->intf);
> > > >
> > > >       kfree(stream->formats);
> > > > @@ -201,8 +199,6 @@ static struct uvc_streaming *uvc_stream_new(struct uvc_device *dev,
> > > >       if (stream == NULL)
> > > >               return NULL;
> > > >
> > > > -     mutex_init(&stream->mutex);
> > > > -
> > > >       stream->dev = dev;
> > > >       stream->intf = usb_get_intf(intf);
> > > >       stream->intfnum = intf->cur_altsetting->desc.bInterfaceNumber;
> > > > diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> > > > index 229e08ff323eed9129d835b24ea2e8085bb713b8..d1d4fade634bd3f8b12bbaa75388db42aecc25ea 100644
> > > > --- a/drivers/media/usb/uvc/uvc_metadata.c
> > > > +++ b/drivers/media/usb/uvc/uvc_metadata.c
> > > > @@ -100,14 +100,10 @@ static int uvc_meta_v4l2_set_format(struct file *file, void *fh,
> > > >        * Metadata buffers would still be perfectly parseable, but it's more
> > > >        * consistent and cleaner to disallow that.
> > > >        */
> > > > -     mutex_lock(&stream->mutex);
> > > > -
> > > >       if (vb2_is_busy(&stream->meta.queue.queue))
> > > > -             ret = -EBUSY;
> > > > -     else
> > > > -             stream->meta.format = fmt->dataformat;
> > > > +             return -EBUSY;
> > > >
> > > > -     mutex_unlock(&stream->mutex);
> > > > +     stream->meta.format = fmt->dataformat;
> > > >
> > > >       return ret;
> > >
> > >         return 0;
> > >
> > > >  }
> > > > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > > > index 160f9cf6e6dbdbf39e3eff56a5d5ea1d977fbe22..d7be4d59f0c73b983aa01321f4acc8f8bf6e83ef 100644
> > > > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > > > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > > > @@ -329,14 +329,12 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
> > > >        * developers test their webcams with the Linux driver as well as with
> > > >        * the Windows driver).
> > > >        */
> > > > -     mutex_lock(&stream->mutex);
> > > >       if (stream->dev->quirks & UVC_QUIRK_PROBE_EXTRAFIELDS)
> > > >               probe->dwMaxVideoFrameSize =
> > > >                       stream->ctrl.dwMaxVideoFrameSize;
> > > >
> > > >       /* Probe the device. */
> > > >       ret = uvc_probe_video(stream, probe);
> > > > -     mutex_unlock(&stream->mutex);
> > > >       if (ret < 0)
> > > >               return ret;
> > > >
> > > > @@ -395,19 +393,15 @@ static int uvc_ioctl_g_fmt(struct file *file, void *fh,
> > > >       struct uvc_streaming *stream = handle->stream;
> > > >       const struct uvc_format *format;
> > > >       const struct uvc_frame *frame;
> > > > -     int ret = 0;
> > > >
> > > >       if (fmt->type != stream->type)
> > > >               return -EINVAL;
> > > >
> > > > -     mutex_lock(&stream->mutex);
> > > >       format = stream->cur_format;
> > > >       frame = stream->cur_frame;
> > > >
> > > > -     if (format == NULL || frame == NULL) {
> > > > -             ret = -EINVAL;
> > > > -             goto done;
> > > > -     }
> > > > +     if (!format || !frame)
> > > > +             return -EINVAL;
> > > >
> > > >       fmt->fmt.pix.pixelformat = format->fcc;
> > > >       fmt->fmt.pix.width = frame->wWidth;
> > > > @@ -419,9 +413,7 @@ static int uvc_ioctl_g_fmt(struct file *file, void *fh,
> > > >       fmt->fmt.pix.xfer_func = format->xfer_func;
> > > >       fmt->fmt.pix.ycbcr_enc = format->ycbcr_enc;
> > > >
> > > > -done:
> > > > -     mutex_unlock(&stream->mutex);
> > > > -     return ret;
> > > > +     return 0;
> > > >  }
> > > >
> > > >  static int uvc_ioctl_s_fmt(struct file *file, void *fh,
> > > > @@ -441,19 +433,14 @@ static int uvc_ioctl_s_fmt(struct file *file, void *fh,
> > > >       if (ret < 0)
> > > >               return ret;
> > > >
> > > > -     mutex_lock(&stream->mutex);
> > > > -     if (vb2_is_busy(&stream->queue.queue)) {
> > > > -             ret = -EBUSY;
> > > > -             goto done;
> > > > -     }
> > > > +     if (vb2_is_busy(&stream->queue.queue))
> > > > +             return -EBUSY;
> > > >
> > > >       stream->ctrl = probe;
> > > >       stream->cur_format = format;
> > > >       stream->cur_frame = frame;
> > > >
> > > > -done:
> > > > -     mutex_unlock(&stream->mutex);
> > > > -     return ret;
> > > > +     return 0;
> > > >  }
> > > >
> > > >  static int uvc_ioctl_g_parm(struct file *file, void *fh,
> > > > @@ -466,9 +453,7 @@ static int uvc_ioctl_g_parm(struct file *file, void *fh,
> > > >       if (parm->type != stream->type)
> > > >               return -EINVAL;
> > > >
> > > > -     mutex_lock(&stream->mutex);
> > > >       numerator = stream->ctrl.dwFrameInterval;
> > > > -     mutex_unlock(&stream->mutex);
> > > >
> > >
> > > You can drop the blank line here.
> > >
> > > >       denominator = 10000000;
> > > >       v4l2_simplify_fraction(&numerator, &denominator, 8, 333);
> > > > @@ -519,12 +504,9 @@ static int uvc_ioctl_s_parm(struct file *file, void *fh,
> > > >       uvc_dbg(stream->dev, FORMAT, "Setting frame interval to %u/%u (%u)\n",
> > > >               timeperframe.numerator, timeperframe.denominator, interval);
> > > >
> > > > -     mutex_lock(&stream->mutex);
> > > >
> > >
> > > Double blank line.
> > >
> > > > -     if (uvc_queue_streaming(&stream->queue)) {
> > > > -             mutex_unlock(&stream->mutex);
> > > > +     if (uvc_queue_streaming(&stream->queue))
> > > >               return -EBUSY;
> > > > -     }
> > > >
> > > >       format = stream->cur_format;
> > > >       frame = stream->cur_frame;
> > > > @@ -556,14 +538,11 @@ static int uvc_ioctl_s_parm(struct file *file, void *fh,
> > > >
> > > >       /* Probe the device with the new settings. */
> > > >       ret = uvc_probe_video(stream, &probe);
> > > > -     if (ret < 0) {
> > > > -             mutex_unlock(&stream->mutex);
> > > > +     if (ret < 0)
> > > >               return ret;
> > > > -     }
> > > >
> > > >       stream->ctrl = probe;
> > > >       stream->cur_frame = frame;
> > > > -     mutex_unlock(&stream->mutex);
> > > >
> > > >       /* Return the actual frame period. */
> > > >       timeperframe.numerator = probe.dwFrameInterval;
> > > > @@ -941,10 +920,8 @@ static int uvc_ioctl_g_selection(struct file *file, void *fh,
> > > >
> > > >       sel->r.left = 0;
> > > >       sel->r.top = 0;
> > > > -     mutex_lock(&stream->mutex);
> > > >       sel->r.width = stream->cur_frame->wWidth;
> > > >       sel->r.height = stream->cur_frame->wHeight;
> > > > -     mutex_unlock(&stream->mutex);
> > > >
> > > >       return 0;
> > > >  }
> > > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > > index 757254fc4fe930ae61c9d0425f04d4cd074a617e..86765b9d7935f0888476249c3fb826cd7f36b35c 100644
> > > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > > @@ -469,12 +469,6 @@ struct uvc_streaming {
> > > >       const struct uvc_format *cur_format;
> > > >       const struct uvc_frame *cur_frame;
> > > >
> > > > -     /*
> > > > -      * Protect access to ctrl, cur_format, cur_frame and hardware video
> > > > -      * probe control.
> > > > -      */
> > > > -     struct mutex mutex;
> > > > -
> > >
> > > Could you please instead keep this mutex and drop uvc_video_queue.mutex
> > > ? The rationale is that the same lock is now used to protect the queue
> > > operations and to serialize the ioctls. It's therefore a higher-level
> > > lock, which should be stored in the higher-level object, not in the
> > > queue.
> > >
> > > You can then also drop the lock assignment in uvc_queue.c that reads
> > >
> > >         queue->queue.lock = &queue->mutex;
> > >
> > > as videobuf2 and the V4L2 core will use the video device lock when no
> > > queue lock is set. The comment at the top of uvc_queue.c may need to be
> > > updated.
> >
> > Are we sure that it is exactly the same?
> >
> > There are places in videobuf2-core.c where we do not use video device lock.
> >
> > Eg:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/common/videobuf2/videobuf2-core.c#n2056
> >
> > I'd rather keep the assignment to be in the safe side.
>
> There are lots of places where the vdev lock is used is the queue has no
> lock. Hans, was is an oversight not to do it in __vb2_wait_for_done_vb()
> ? If we don't want to support not setting the queue lock that's OK, but
> we should then drop code that uses vdev->lock instead.
>
> We can keep the assignment for the time being to be safe until that
> issue gets resolved, but I'd still like to use the stream mutex instead
> of the queue mutex.

The problem with using the stream mutex is that the meta device and
the capture device have the same uvc_streaming, but they need a
different mutex.

So if you do something like this:

console0 # yavta -c /dev/video1 &

console1# yavta -c /dev/video0 &

You end in a deadlock. Where the DQBUF of video1 do not let you use video0

We can add a second mutex to uvc_streaming.... but I think this is a
bit overkill.

Any ideas?


>
> > > >       /* Buffers queue. */
> > > >       unsigned int frozen : 1;
> > > >       struct uvc_video_queue queue;
> > > >
> > > > ---
> > > > base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
> > > > change-id: 20250716-uvc-onelocksless-b66658e01f89
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

