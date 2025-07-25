Return-Path: <linux-media+bounces-38440-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D60B11A60
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 10:59:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1A1B5A1A26
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 08:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C603A24A043;
	Fri, 25 Jul 2025 08:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Rs8Z3b35"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083B1241CB7
	for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 08:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753433962; cv=none; b=g2n8uzs5oSjwq0+Kim6tz9v54rgnY1DnNF7K7IjqabfSoYY5ZahvvAZ1sSCu1r9x912KDazEBD3eh6pPiw/b5SKYJ6Lc9bZDFcgkdb7Vtzyx77QtTvbJQ5bmcRJNK5WJ64wE/zUtsuKtAcl6pmVwAw2XisHjjsj5znqSEyCPLUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753433962; c=relaxed/simple;
	bh=Epvz5xYDEH6GKKNdQXbFMYOls6Bpp+GEsfDk9aT0VMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YZZJwcEJA+au7plUqxaU0z36086uFTcM0pppsOKfl0X/UbfiubJec50BODB5mK/tgFE3nxl0hvokghQaMg6JCop+a2QB2Qs2d9hw+OjEJaX15VbLspdxXKrh8CYBpMpH2Ghuwhy7rp6iYmjZ1+Dg5Nh23NQySRZxszuOysBA40E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Rs8Z3b35; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32f2947ab0bso15159471fa.3
        for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 01:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753433956; x=1754038756; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4AOzOJElgwV0qIorBKZrScQx66fbUFWWoBvz5q4bGY=;
        b=Rs8Z3b35G9lDFbxqagHt6+uUgLTxBMDLgoKZi+zVrBxR4c4PSIiYuCnvJdgDyFyMWJ
         lrlNS9D0GmWtckEIZqHnZYNMv3twGnfN0JhGVFujJBpv5TRj3fydPHQWWKDLu6+aZwgq
         darmExu9em5K0xQDdSZCrEdYHbKjfTCfSJAmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753433956; x=1754038756;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z4AOzOJElgwV0qIorBKZrScQx66fbUFWWoBvz5q4bGY=;
        b=e2KjzKmyoIPCdk3l9oLVPDnQGy0BLrP/m2PU2rYJWMq2uF1blS3hnkbg59XtdJeOO4
         EYcr3jyYxlT9/PR1zbvqd6SAh+q4GxMEYasca+ToofZoPfq1yyRI6iR57ZMXKyS4kTVe
         5/z1eTeKLyGsKPkQo/dSS7KMBG0TvDv4ciSB3e/ngKHtNKd3itIckK9eStdKVanYMubZ
         kQxCBkmZgiUFVTdAKcYU+tHSor0Jyx6IO8pNBNsIH4WQbKhuH1xboeZ1n1GjiewxTdHT
         jL8aeC+VWjbuIrvwaFhpTgurR3XoXuNavYGk8CjjanLa/45CerNXXAlfmjCNUFNsczbF
         8Npw==
X-Forwarded-Encrypted: i=1; AJvYcCX2PBF263hqLFcizGLs+5WQxCOamPaJM8ZWvRbg704bEnSYAl8T+XNWIpYvg2paCvfEWA9BFLnU7rPcSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBF6xJuMfse2I66A/t4l6QK80WmOenbus38xWn3Qod1K2MiBf+
	qKx9deeMI6xRMI/Y0lueiiPEqSHivbY4viPAUv9pIuY7wLYbvQWmTv3o2JxKI5VC34Zhuy7Y2xD
	YW/s=
X-Gm-Gg: ASbGncvj124SobwBs4+HD6XZf8HJkdylaHwwYY7m5SZTiEzmCxWt0xha/hIoEoqrd8x
	Ft65CrHnlGIsHvPDa64jPBQgvlYbf1C2pNhG/vJJY9NSJMhze9SvmQYQr0m93J0fN4+r6NkEDo1
	JWqWBhVMTUD+gkhKNkdUZFusMXVGzeTfobzfSk/ns85xJE24KlI5+l9XennvGRFBcFRGkKEsF59
	gygGlI19Rt7OHybWLOFXEPAyP3iOnBJ7VPvLdjIilLDCh4vhWRBjj1CzumsE2I2vwZR4KPiqY7f
	KEMEOUVTt5MP3IzXT2TlhacnD23gdCHvriOV/5sLp7wFo2zFqk1zEvpeUrOHJEaylcTk1HJjbuE
	m9yoC9ForaGsaZs6L06CyccxtRc7rUyaT5xmo3MLDAEjFsO/XfHC3o+k9/awOj5n1
X-Google-Smtp-Source: AGHT+IFP5wMpP3zDfhRmf57+FteH24MDS3FVNMk8W4tNW30KNI7QogwbPXP2eExIaxHw0/FLbMZ0sA==
X-Received: by 2002:a05:651c:20cc:20b0:32c:ab57:126b with SMTP id 38308e7fff4ca-331ee75ee79mr2093611fa.16.1753433955806;
        Fri, 25 Jul 2025 01:59:15 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-331e08e9955sm6982641fa.48.2025.07.25.01.59.14
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 01:59:14 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32b5226e6beso16691921fa.2
        for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 01:59:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWsqt6tx8oKi3WAywr74U4Ty7mk2Y1JGcP5YtcuwsQHtgAGYkpaZuOswsoQGiwC4f76sETORcUev2WMcw==@vger.kernel.org
X-Received: by 2002:a2e:b8ce:0:b0:32b:4773:7aaf with SMTP id
 38308e7fff4ca-331ee83c6c1mr3694771fa.35.1753433953931; Fri, 25 Jul 2025
 01:59:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717-uvc-onelocksless-v1-1-91a1b834186a@chromium.org>
 <20250724120840.GL11202@pendragon.ideasonboard.com> <CANiDSCvvAX27u4_qnKxbSqWVWybsZFV-367eSv8ig85-cCeDTw@mail.gmail.com>
 <20250724155101.GA17890@pendragon.ideasonboard.com> <CANiDSCsojmQdCQqYXBFStPwGJ3n+-04_+dqTx+tsUrT+dRSC2Q@mail.gmail.com>
 <20250724200014.GT11202@pendragon.ideasonboard.com>
In-Reply-To: <20250724200014.GT11202@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 25 Jul 2025 10:59:01 +0200
X-Gmail-Original-Message-ID: <CANiDSCvfD_j3KhrEU9ajRxC5Wgdp=Anq_PTZkUg7G8-Nof3O4w@mail.gmail.com>
X-Gm-Features: Ac12FXyUZoN8IWCHRFEqo-qPEo_qvsB-UP_v6qbQ-rSDUJObnSDxRVqW8O02WBk
Message-ID: <CANiDSCvfD_j3KhrEU9ajRxC5Wgdp=Anq_PTZkUg7G8-Nof3O4w@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Drop stream->mutex
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hans Verkuil <hans@jjverkuil.nl>
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Jul 2025 at 22:00, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Thu, Jul 24, 2025 at 08:15:48PM +0200, Ricardo Ribalda wrote:
> > On Thu, 24 Jul 2025 at 17:51, Laurent Pinchart wrote:
> > >
> > > (CC'ing Hans Verkuil)
> > >
> > > On Thu, Jul 24, 2025 at 05:41:06PM +0200, Ricardo Ribalda wrote:
> > > > On Thu, 24 Jul 2025 at 14:08, Laurent Pinchart wrote:
> > > > > On Thu, Jul 17, 2025 at 07:56:45AM +0000, Ricardo Ribalda wrote:
> > > > > > Since commit c93d73c9c2cf ("media: uvcvideo: Use vb2 ioctl and fop
> > > > > > helpers"), the IOCTLs are serialized. Due to this there is no more need
> > > > > > to protect ctrl, cur_format or cur_frame from concurrent access.
> > > > > >
> > > > > > Drop stream->mutex after thanking it for years of good service.
> > > > > >
> > > > > > Use this opportunity to do fix some CodeStyle.
> > > > >
> > > > > Is that about the following change only:
> > > > >
> > > > > -       if (format == NULL || frame == NULL) {
> > > > > +       if (!format || !frame)
> > > > >
> > > > > or is there something else I missed ?
> > > >
> > > > I believe that's it.
> > > >
> > > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > > ---
> > > > > >  drivers/media/usb/uvc/uvc_driver.c   |  4 ----
> > > > > >  drivers/media/usb/uvc/uvc_metadata.c |  8 ++------
> > > > > >  drivers/media/usb/uvc/uvc_v4l2.c     | 39 ++++++++----------------------------
> > > > > >  drivers/media/usb/uvc/uvcvideo.h     |  6 ------
> > > > > >  4 files changed, 10 insertions(+), 47 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > > > > index 775bede0d93d9b3e5391914aa395326d3de6a3b1..3039e6a533b82dd917050d416c9ced8756d69170 100644
> > > > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > > > @@ -183,8 +183,6 @@ static void uvc_stream_delete(struct uvc_streaming *stream)
> > > > > >       if (stream->async_wq)
> > > > > >               destroy_workqueue(stream->async_wq);
> > > > > >
> > > > > > -     mutex_destroy(&stream->mutex);
> > > > > > -
> > > > > >       usb_put_intf(stream->intf);
> > > > > >
> > > > > >       kfree(stream->formats);
> > > > > > @@ -201,8 +199,6 @@ static struct uvc_streaming *uvc_stream_new(struct uvc_device *dev,
> > > > > >       if (stream == NULL)
> > > > > >               return NULL;
> > > > > >
> > > > > > -     mutex_init(&stream->mutex);
> > > > > > -
> > > > > >       stream->dev = dev;
> > > > > >       stream->intf = usb_get_intf(intf);
> > > > > >       stream->intfnum = intf->cur_altsetting->desc.bInterfaceNumber;
> > > > > > diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> > > > > > index 229e08ff323eed9129d835b24ea2e8085bb713b8..d1d4fade634bd3f8b12bbaa75388db42aecc25ea 100644
> > > > > > --- a/drivers/media/usb/uvc/uvc_metadata.c
> > > > > > +++ b/drivers/media/usb/uvc/uvc_metadata.c
> > > > > > @@ -100,14 +100,10 @@ static int uvc_meta_v4l2_set_format(struct file *file, void *fh,
> > > > > >        * Metadata buffers would still be perfectly parseable, but it's more
> > > > > >        * consistent and cleaner to disallow that.
> > > > > >        */
> > > > > > -     mutex_lock(&stream->mutex);
> > > > > > -
> > > > > >       if (vb2_is_busy(&stream->meta.queue.queue))
> > > > > > -             ret = -EBUSY;
> > > > > > -     else
> > > > > > -             stream->meta.format = fmt->dataformat;
> > > > > > +             return -EBUSY;
> > > > > >
> > > > > > -     mutex_unlock(&stream->mutex);
> > > > > > +     stream->meta.format = fmt->dataformat;
> > > > > >
> > > > > >       return ret;
> > > > >
> > > > >         return 0;
> > > > >
> > > > > >  }
> > > > > > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > > > > > index 160f9cf6e6dbdbf39e3eff56a5d5ea1d977fbe22..d7be4d59f0c73b983aa01321f4acc8f8bf6e83ef 100644
> > > > > > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > > > > > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > > > > > @@ -329,14 +329,12 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
> > > > > >        * developers test their webcams with the Linux driver as well as with
> > > > > >        * the Windows driver).
> > > > > >        */
> > > > > > -     mutex_lock(&stream->mutex);
> > > > > >       if (stream->dev->quirks & UVC_QUIRK_PROBE_EXTRAFIELDS)
> > > > > >               probe->dwMaxVideoFrameSize =
> > > > > >                       stream->ctrl.dwMaxVideoFrameSize;
> > > > > >
> > > > > >       /* Probe the device. */
> > > > > >       ret = uvc_probe_video(stream, probe);
> > > > > > -     mutex_unlock(&stream->mutex);
> > > > > >       if (ret < 0)
> > > > > >               return ret;
> > > > > >
> > > > > > @@ -395,19 +393,15 @@ static int uvc_ioctl_g_fmt(struct file *file, void *fh,
> > > > > >       struct uvc_streaming *stream = handle->stream;
> > > > > >       const struct uvc_format *format;
> > > > > >       const struct uvc_frame *frame;
> > > > > > -     int ret = 0;
> > > > > >
> > > > > >       if (fmt->type != stream->type)
> > > > > >               return -EINVAL;
> > > > > >
> > > > > > -     mutex_lock(&stream->mutex);
> > > > > >       format = stream->cur_format;
> > > > > >       frame = stream->cur_frame;
> > > > > >
> > > > > > -     if (format == NULL || frame == NULL) {
> > > > > > -             ret = -EINVAL;
> > > > > > -             goto done;
> > > > > > -     }
> > > > > > +     if (!format || !frame)
> > > > > > +             return -EINVAL;
> > > > > >
> > > > > >       fmt->fmt.pix.pixelformat = format->fcc;
> > > > > >       fmt->fmt.pix.width = frame->wWidth;
> > > > > > @@ -419,9 +413,7 @@ static int uvc_ioctl_g_fmt(struct file *file, void *fh,
> > > > > >       fmt->fmt.pix.xfer_func = format->xfer_func;
> > > > > >       fmt->fmt.pix.ycbcr_enc = format->ycbcr_enc;
> > > > > >
> > > > > > -done:
> > > > > > -     mutex_unlock(&stream->mutex);
> > > > > > -     return ret;
> > > > > > +     return 0;
> > > > > >  }
> > > > > >
> > > > > >  static int uvc_ioctl_s_fmt(struct file *file, void *fh,
> > > > > > @@ -441,19 +433,14 @@ static int uvc_ioctl_s_fmt(struct file *file, void *fh,
> > > > > >       if (ret < 0)
> > > > > >               return ret;
> > > > > >
> > > > > > -     mutex_lock(&stream->mutex);
> > > > > > -     if (vb2_is_busy(&stream->queue.queue)) {
> > > > > > -             ret = -EBUSY;
> > > > > > -             goto done;
> > > > > > -     }
> > > > > > +     if (vb2_is_busy(&stream->queue.queue))
> > > > > > +             return -EBUSY;
> > > > > >
> > > > > >       stream->ctrl = probe;
> > > > > >       stream->cur_format = format;
> > > > > >       stream->cur_frame = frame;
> > > > > >
> > > > > > -done:
> > > > > > -     mutex_unlock(&stream->mutex);
> > > > > > -     return ret;
> > > > > > +     return 0;
> > > > > >  }
> > > > > >
> > > > > >  static int uvc_ioctl_g_parm(struct file *file, void *fh,
> > > > > > @@ -466,9 +453,7 @@ static int uvc_ioctl_g_parm(struct file *file, void *fh,
> > > > > >       if (parm->type != stream->type)
> > > > > >               return -EINVAL;
> > > > > >
> > > > > > -     mutex_lock(&stream->mutex);
> > > > > >       numerator = stream->ctrl.dwFrameInterval;
> > > > > > -     mutex_unlock(&stream->mutex);
> > > > > >
> > > > >
> > > > > You can drop the blank line here.
> > > > >
> > > > > >       denominator = 10000000;
> > > > > >       v4l2_simplify_fraction(&numerator, &denominator, 8, 333);
> > > > > > @@ -519,12 +504,9 @@ static int uvc_ioctl_s_parm(struct file *file, void *fh,
> > > > > >       uvc_dbg(stream->dev, FORMAT, "Setting frame interval to %u/%u (%u)\n",
> > > > > >               timeperframe.numerator, timeperframe.denominator, interval);
> > > > > >
> > > > > > -     mutex_lock(&stream->mutex);
> > > > > >
> > > > >
> > > > > Double blank line.
> > > > >
> > > > > > -     if (uvc_queue_streaming(&stream->queue)) {
> > > > > > -             mutex_unlock(&stream->mutex);
> > > > > > +     if (uvc_queue_streaming(&stream->queue))
> > > > > >               return -EBUSY;
> > > > > > -     }
> > > > > >
> > > > > >       format = stream->cur_format;
> > > > > >       frame = stream->cur_frame;
> > > > > > @@ -556,14 +538,11 @@ static int uvc_ioctl_s_parm(struct file *file, void *fh,
> > > > > >
> > > > > >       /* Probe the device with the new settings. */
> > > > > >       ret = uvc_probe_video(stream, &probe);
> > > > > > -     if (ret < 0) {
> > > > > > -             mutex_unlock(&stream->mutex);
> > > > > > +     if (ret < 0)
> > > > > >               return ret;
> > > > > > -     }
> > > > > >
> > > > > >       stream->ctrl = probe;
> > > > > >       stream->cur_frame = frame;
> > > > > > -     mutex_unlock(&stream->mutex);
> > > > > >
> > > > > >       /* Return the actual frame period. */
> > > > > >       timeperframe.numerator = probe.dwFrameInterval;
> > > > > > @@ -941,10 +920,8 @@ static int uvc_ioctl_g_selection(struct file *file, void *fh,
> > > > > >
> > > > > >       sel->r.left = 0;
> > > > > >       sel->r.top = 0;
> > > > > > -     mutex_lock(&stream->mutex);
> > > > > >       sel->r.width = stream->cur_frame->wWidth;
> > > > > >       sel->r.height = stream->cur_frame->wHeight;
> > > > > > -     mutex_unlock(&stream->mutex);
> > > > > >
> > > > > >       return 0;
> > > > > >  }
> > > > > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > > > > index 757254fc4fe930ae61c9d0425f04d4cd074a617e..86765b9d7935f0888476249c3fb826cd7f36b35c 100644
> > > > > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > > > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > > > > @@ -469,12 +469,6 @@ struct uvc_streaming {
> > > > > >       const struct uvc_format *cur_format;
> > > > > >       const struct uvc_frame *cur_frame;
> > > > > >
> > > > > > -     /*
> > > > > > -      * Protect access to ctrl, cur_format, cur_frame and hardware video
> > > > > > -      * probe control.
> > > > > > -      */
> > > > > > -     struct mutex mutex;
> > > > > > -
> > > > >
> > > > > Could you please instead keep this mutex and drop uvc_video_queue.mutex
> > > > > ? The rationale is that the same lock is now used to protect the queue
> > > > > operations and to serialize the ioctls. It's therefore a higher-level
> > > > > lock, which should be stored in the higher-level object, not in the
> > > > > queue.
> > > > >
> > > > > You can then also drop the lock assignment in uvc_queue.c that reads
> > > > >
> > > > >         queue->queue.lock = &queue->mutex;
> > > > >
> > > > > as videobuf2 and the V4L2 core will use the video device lock when no
> > > > > queue lock is set. The comment at the top of uvc_queue.c may need to be
> > > > > updated.
> > > >
> > > > Are we sure that it is exactly the same?
> > > >
> > > > There are places in videobuf2-core.c where we do not use video device lock.
> > > >
> > > > Eg:
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/common/videobuf2/videobuf2-core.c#n2056
> > > >
> > > > I'd rather keep the assignment to be in the safe side.
> > >
> > > There are lots of places where the vdev lock is used is the queue has no
> > > lock. Hans, was is an oversight not to do it in __vb2_wait_for_done_vb()
> > > ? If we don't want to support not setting the queue lock that's OK, but
> > > we should then drop code that uses vdev->lock instead.
> > >
> > > We can keep the assignment for the time being to be safe until that
> > > issue gets resolved, but I'd still like to use the stream mutex instead
> > > of the queue mutex.
> >
> > The problem with using the stream mutex is that the meta device and
> > the capture device have the same uvc_streaming, but they need a
> > different mutex.
> >
> > So if you do something like this:
> >
> > console0 # yavta -c /dev/video1 &
> >
> > console1# yavta -c /dev/video0 &
> >
> > You end in a deadlock. Where the DQBUF of video1 do not let you use video0
>
> Aarrghhh :-(
>
> I wouldn't expect a deadlock as DQBUF should release the lock when
> waiting, but still, aarrrrgghhhhh :-(
>
> > We can add a second mutex to uvc_streaming.... but I think this is a
> > bit overkill.
> >
> > Any ideas?
>
> I'm thinking it could make sense to move the video_device members of
> uvc_streaming to uvc_video_queue and rename uvc_video_queue to
> uvc_video_device. That's a change that should probably be done on top of
> this patch, as it won't change the location of the mutex.

I have moved the video_device members.

But after playing a bit with renaming uvc_video_queue.... It does not
look like a good idea. To do it properly we also need to rename
variables and functions and the change will be pretty massive. Any
future backport to stable is going to be hell....

>
> > > > > >       /* Buffers queue. */
> > > > > >       unsigned int frozen : 1;
> > > > > >       struct uvc_video_queue queue;
> > > > > >
> > > > > > ---
> > > > > > base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
> > > > > > change-id: 20250716-uvc-onelocksless-b66658e01f89
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

