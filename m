Return-Path: <linux-media+bounces-22255-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C139DBCED
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 21:36:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9AD51B21740
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 20:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7281C304A;
	Thu, 28 Nov 2024 20:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iZcqSQmI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FD11C173C
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 20:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732826183; cv=none; b=A+XZq4Che71kb6CbAAAUUyuySlH/oLDNJgAreDcYuQDMxN9CI9Bh4W60uA7po/vlHamMqYlirAkHqXJ5f+Ddjk54kBAV0teTlApq4qvLCxSrSuRcBGqJouaJW4kG4mylxqPNlVzppstzKiR/WSG+bxJ6g16zSe1HQAuBi/7g+jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732826183; c=relaxed/simple;
	bh=KnKDkO/LxGWDdjT+o3TpUORCbbUXaeZsLJF5S8hD0i0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jl+2p1xbPicNkU+uIvqiD3aqv1aof8jf0J9uE4L+znbcEK5qXg0qBQB23bj8z0chyH2xgTH5jDrkMl9y5FfS3c2a4IqRk1lnkycAVTWC8fhMuOZ+l1lTeHPpNVxLMgEkPO85WHymHF/RkQ1ev0iS2RlQ53TRPRsfeqbvMUytn4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iZcqSQmI; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-724e14b90cfso1169523b3a.2
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 12:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732826181; x=1733430981; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SVBbCgwD2fV6O+Mi5PMdfn6J90+s+eCIZngth27HNHE=;
        b=iZcqSQmIL92st2uaPeaWwFXQdyuWgIXqeUDzTDPCdAavW3mwvAUW3mn+xuKGUazKA/
         p6k5VEP7b9IvEdgQS1Z+VG3TjHK3w0e3MejILpnLTVX+KHz11x+bEWYNI6jqrgjApnPo
         Xo1RiVPGHlywieUyK9EZkWQNY2/OT2NDeUo+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732826181; x=1733430981;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SVBbCgwD2fV6O+Mi5PMdfn6J90+s+eCIZngth27HNHE=;
        b=b1IT/cbjsySuPsRN6xsakJbyc2RD4t5qK2TTPbB89YHQqUwvnYCLapCUhqoJkT7Qhk
         QhfkHrklSKmi7vl2lbmk6gpi45nJ1haMujPR5FPjAgcNNQjcr9Gx6Qi4C9r6LmDxkviN
         6p5h3WTTzPvYR5wLN1NhR9s+w5aDWOxpBRHckxroPCuyxyl5Pq2NinejRG6y3TUfNgXO
         ZGS/i++0t2+sXf6cUbuVhdDqJObff1PRX+4G3ZEVBiZP4AfAPurf7jJ0kOIwx0pzJyg6
         7rFI8TNhHecsyQ8aG0bUscSAwAGXv9mkYthpc0RIh11lokRu6we7Nqz5mkhCyrAy7K4e
         aMhw==
X-Forwarded-Encrypted: i=1; AJvYcCV6A+hsWVmeIUTEgipjofq89bM2pKvTIKMCoNDdXQF6jW8qgAGJa0TYZ7e64GPv2Ifc9VnsRthA/C2YAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1aJCyoX0lvix7hOIhfmjs0Nf/wCp0Rx7XS7YlCGPulfhW6NEV
	oLTUiZVKtOXmYUgpmJyhHbLv9BjAdiz1Kxj422PeJig7uGSdABIHWxWPz/TMrslXrcQTs6cZvuU
	=
X-Gm-Gg: ASbGnctwzYbITJkW1u3o9Hw9yawUy3TP6eE/rNoAVpqgu6qSaNIavhf9DROUzjrdhbb
	qRPOB98GUfRuhVia2kaFXVHppNZ383nDPs7zy7KSz20AnITnPlNyhfs3xIHDqJ6uI2Ns0Zki2Hn
	j39vyUucLFjHzskZebj76ArTwxcsSfxlcsgPJmzKz98O6UqNZOeOlh8vcRfm9vcDWZqoVeHLBdT
	qAIdgwJR6mo9cdLFid59nqGo38yV/GnEPpD0HhMfUjnsXpZYHrZ7JoJX7IUaSmWbNQN3jgtJJAN
	rdqUFYg7runQkqi6
X-Google-Smtp-Source: AGHT+IFM/9Q/eiwjIxVCbdOjXkrYUetuTs6oF/ChANKgfOMZ6ilFIZMdCDO2Go7CJ2sAvawBeNRwpA==
X-Received: by 2002:a05:6a00:230b:b0:724:ed8f:4d35 with SMTP id d2e1a72fcca58-725301e3b2amr11102393b3a.26.1732826180784;
        Thu, 28 Nov 2024 12:36:20 -0800 (PST)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com. [209.85.210.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725418149basm1991843b3a.166.2024.11.28.12.36.19
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 12:36:19 -0800 (PST)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-724e14b90cfso1169496b3a.2
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 12:36:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWLhfqUELKhKBfxotLmMGx6S3rxNlwieBritomVB6dUzWVucli7rDeEsRbwxLeWj/QpH0hAdmU/UBmBcA==@vger.kernel.org
X-Received: by 2002:a17:90b:1b47:b0:2ea:9bdc:8f96 with SMTP id
 98e67ed59e1d1-2ee097bb2aamr11057592a91.30.1732826179018; Thu, 28 Nov 2024
 12:36:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127-uvc-dup-cap-out-v1-1-1bdcad2dabb0@chromium.org>
 <20241128202442.GC13852@pendragon.ideasonboard.com> <20241128203127.GD13852@pendragon.ideasonboard.com>
In-Reply-To: <20241128203127.GD13852@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 28 Nov 2024 21:36:06 +0100
X-Gmail-Original-Message-ID: <CANiDSCt69HXfRmWHKGELWoUE45bZeWUgVc3C7=aAvykUYZBUzQ@mail.gmail.com>
Message-ID: <CANiDSCt69HXfRmWHKGELWoUE45bZeWUgVc3C7=aAvykUYZBUzQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Remove duplicated cap/out code
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Nov 2024 at 21:31, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Thu, Nov 28, 2024 at 10:24:42PM +0200, Laurent Pinchart wrote:
> > Hi Ricardo,
> >
> > Thank you for the patch.
> >
> > On Wed, Nov 27, 2024 at 07:31:29AM +0000, Ricardo Ribalda wrote:
> > > The *_vid_cap and *_vid_out helpers seem to be identical. Remove all the
> > > duplicated code.
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > > Unless I miss something, cap and out helpers are identical. So there is
> > > no need to duplicate code
> > > ---
> > >  drivers/media/usb/uvc/uvc_v4l2.c | 112 ++++++++-------------------------------
> > >  1 file changed, 22 insertions(+), 90 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > > index 97c5407f6603..11ccdaf0269f 100644
> > > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > > @@ -361,9 +361,11 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
> > >     return ret;
> > >  }
> > >
> > > -static int uvc_v4l2_get_format(struct uvc_streaming *stream,
> > > -   struct v4l2_format *fmt)
> > > +static int uvc_ioctl_g_fmt(struct file *file, void *fh,
> > > +                      struct v4l2_format *fmt)
> > >  {
> > > +   struct uvc_fh *handle = fh;
> > > +   struct uvc_streaming *stream = handle->stream;
> > >     const struct uvc_format *format;
> > >     const struct uvc_frame *frame;
> > >     int ret = 0;
> > > @@ -395,9 +397,11 @@ static int uvc_v4l2_get_format(struct uvc_streaming *stream,
> > >     return ret;
> > >  }
> > >
> > > -static int uvc_v4l2_set_format(struct uvc_streaming *stream,
> > > -   struct v4l2_format *fmt)
> > > +static int uvc_ioctl_s_fmt(struct file *file, void *fh,
> > > +                      struct v4l2_format *fmt)
> > >  {
> > > +   struct uvc_fh *handle = fh;
> > > +   struct uvc_streaming *stream = handle->stream;
> > >     struct uvc_streaming_control probe;
> > >     const struct uvc_format *format;
> > >     const struct uvc_frame *frame;
> > > @@ -685,11 +689,13 @@ static int uvc_ioctl_querycap(struct file *file, void *fh,
> > >     return 0;
> > >  }
> > >
> > > -static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
> > > +static int uvc_ioctl_enum_fmt(struct file *file, void *fh,
> > >                           struct v4l2_fmtdesc *fmt)
> > >  {
> > > -   const struct uvc_format *format;
> > > +   struct uvc_fh *handle = fh;
> > > +   struct uvc_streaming *stream = handle->stream;
> > >     enum v4l2_buf_type type = fmt->type;
> > > +   const struct uvc_format *format;
> > >     u32 index = fmt->index;
> > >
> > >     if (fmt->type != stream->type || fmt->index >= stream->nformats)
> > > @@ -707,82 +713,8 @@ static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
> > >     return 0;
> > >  }
> > >
> > > -static int uvc_ioctl_enum_fmt_vid_cap(struct file *file, void *fh,
> > > -                                 struct v4l2_fmtdesc *fmt)
> > > -{
> > > -   struct uvc_fh *handle = fh;
> > > -   struct uvc_streaming *stream = handle->stream;
> > > -
> > > -   return uvc_ioctl_enum_fmt(stream, fmt);
> > > -}
> > > -
> > > -static int uvc_ioctl_enum_fmt_vid_out(struct file *file, void *fh,
> > > -                                 struct v4l2_fmtdesc *fmt)
> > > -{
> > > -   struct uvc_fh *handle = fh;
> > > -   struct uvc_streaming *stream = handle->stream;
> > > -
> > > -   return uvc_ioctl_enum_fmt(stream, fmt);
> > > -}
> > > -
> > > -static int uvc_ioctl_g_fmt_vid_cap(struct file *file, void *fh,
> > > -                              struct v4l2_format *fmt)
> > > -{
> > > -   struct uvc_fh *handle = fh;
> > > -   struct uvc_streaming *stream = handle->stream;
> > > -
> > > -   return uvc_v4l2_get_format(stream, fmt);
> > > -}
> > > -
> > > -static int uvc_ioctl_g_fmt_vid_out(struct file *file, void *fh,
> > > -                              struct v4l2_format *fmt)
> > > -{
> > > -   struct uvc_fh *handle = fh;
> > > -   struct uvc_streaming *stream = handle->stream;
> > > -
> > > -   return uvc_v4l2_get_format(stream, fmt);
> > > -}
> > > -
> > > -static int uvc_ioctl_s_fmt_vid_cap(struct file *file, void *fh,
> > > -                              struct v4l2_format *fmt)
> > > -{
> > > -   struct uvc_fh *handle = fh;
> > > -   struct uvc_streaming *stream = handle->stream;
> > > -   int ret;
> > > -
> > > -   ret = uvc_acquire_privileges(handle);
> > > -   if (ret < 0)
> > > -           return ret;
> >
> > Has this now silently disappeared ?
> >
> > > -
> > > -   return uvc_v4l2_set_format(stream, fmt);
> > > -}
> > > -
> > > -static int uvc_ioctl_s_fmt_vid_out(struct file *file, void *fh,
> > > -                              struct v4l2_format *fmt)
> > > -{
> > > -   struct uvc_fh *handle = fh;
> > > -   struct uvc_streaming *stream = handle->stream;
> > > -   int ret;
> > > -
> > > -   ret = uvc_acquire_privileges(handle);
> > > -   if (ret < 0)
> > > -           return ret;
> > > -
> > > -   return uvc_v4l2_set_format(stream, fmt);
> > > -}
> > > -
> > > -static int uvc_ioctl_try_fmt_vid_cap(struct file *file, void *fh,
> > > -                                struct v4l2_format *fmt)
> > > -{
> > > -   struct uvc_fh *handle = fh;
> > > -   struct uvc_streaming *stream = handle->stream;
> > > -   struct uvc_streaming_control probe;
> > > -
> > > -   return uvc_v4l2_try_format(stream, fmt, &probe, NULL, NULL);
> > > -}
> > > -
> > > -static int uvc_ioctl_try_fmt_vid_out(struct file *file, void *fh,
> > > -                                struct v4l2_format *fmt)
> > > +static int uvc_ioctl_try_fmt(struct file *file, void *fh,
> > > +                        struct v4l2_format *fmt)
> > >  {
> > >     struct uvc_fh *handle = fh;
> > >     struct uvc_streaming *stream = handle->stream;
> > > @@ -1544,14 +1476,14 @@ static unsigned long uvc_v4l2_get_unmapped_area(struct file *file,
> > >
> > >  const struct v4l2_ioctl_ops uvc_ioctl_ops = {
> > >     .vidioc_querycap = uvc_ioctl_querycap,
> > > -   .vidioc_enum_fmt_vid_cap = uvc_ioctl_enum_fmt_vid_cap,
> > > -   .vidioc_enum_fmt_vid_out = uvc_ioctl_enum_fmt_vid_out,
> > > -   .vidioc_g_fmt_vid_cap = uvc_ioctl_g_fmt_vid_cap,
> > > -   .vidioc_g_fmt_vid_out = uvc_ioctl_g_fmt_vid_out,
> > > -   .vidioc_s_fmt_vid_cap = uvc_ioctl_s_fmt_vid_cap,
> > > -   .vidioc_s_fmt_vid_out = uvc_ioctl_s_fmt_vid_out,
> > > -   .vidioc_try_fmt_vid_cap = uvc_ioctl_try_fmt_vid_cap,
> > > -   .vidioc_try_fmt_vid_out = uvc_ioctl_try_fmt_vid_out,
> > > +   .vidioc_enum_fmt_vid_cap = uvc_ioctl_enum_fmt,
> > > +   .vidioc_enum_fmt_vid_out = uvc_ioctl_enum_fmt,
> > > +   .vidioc_g_fmt_vid_cap = uvc_ioctl_g_fmt,
> > > +   .vidioc_g_fmt_vid_out = uvc_ioctl_g_fmt,
> > > +   .vidioc_s_fmt_vid_cap = uvc_ioctl_s_fmt,
> > > +   .vidioc_s_fmt_vid_out = uvc_ioctl_s_fmt,
> > > +   .vidioc_try_fmt_vid_cap = uvc_ioctl_try_fmt,
> > > +   .vidioc_try_fmt_vid_out = uvc_ioctl_try_fmt,
>
> Also, if you're removing wrapper, let's do the same for
> uvc_ioctl_g_parm() and uvc_ioctl_s_parm(). Furthermore, please try to
> preserve the order of the function definitions, sorting them as in the
> ioctl_ops structure.

ack.

Do you want the reorder in a different patch to ease the review or in the same?

>
> > >     .vidioc_reqbufs = uvc_ioctl_reqbufs,
> > >     .vidioc_querybuf = uvc_ioctl_querybuf,
> > >     .vidioc_qbuf = uvc_ioctl_qbuf,
> > >
> > > ---
> > > base-commit: 72ad4ff638047bbbdf3232178fea4bec1f429319
> > > change-id: 20241127-uvc-dup-cap-out-6a03c01e30a3
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

