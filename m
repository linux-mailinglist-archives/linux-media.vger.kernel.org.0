Return-Path: <linux-media+bounces-22253-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E9C9DBCE2
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 21:28:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87959B2197D
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 20:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CAA51C302E;
	Thu, 28 Nov 2024 20:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nFLw4cu+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109701C1F37
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 20:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732825676; cv=none; b=NkeBsA387z0+eU9zQJeU6B2tCJzTXnfT4Cmy9Qd7Wl5mLBnOONXbuqE5quq99sTR8cPKZJDOk09AhmWSvISghO7DS011F9hzrUiXj+GqBtAWee9sgsnZy9SaKlcgF8e4B3JiKwHHrnbXYjaWEdkrMbKHzDTRWKl+Z9pZZ8FxqhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732825676; c=relaxed/simple;
	bh=I7glvZHjF9TTVhZGOGVc/Rgi0rtXsVuj7LRmzGAMbpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WdHYgAKKsGH9xWZyf+rZ9fmfvFP4ICk3gCTOukb3jmCHLAYCNhOQ0KKotpaGfwSmjcA0kkat+VWxZxqF+a0uq8uHCrPaDiCtdBnd7EGYqbPiLLjKF03dDA4xBaV4XCnN8eBiuQ1CHnwmE1WLXBbdCx/zYpgWwMbvKft7/3IY/XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nFLw4cu+; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2120f9ec28eso9254615ad.1
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 12:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732825674; x=1733430474; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p+04Qv/OKsSuOF5+aWL1QlX/6qTCLUpVUdnG7/8jyjU=;
        b=nFLw4cu+lAR8VrYl3dfi7fN1YU2bdC782KzD5zUgN7IkTTE18ILsSxjWFvUzLekeyY
         VZVR8I5M5JcB3ZGMnYx3qr4zTqVQ45KD2mlZKtk6Tgx28bAISzs+lNcRBoRzL4TW7pjm
         QxWkwMx9JiIPd/InsEMaWUexnq56m0UX5Dg6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732825674; x=1733430474;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p+04Qv/OKsSuOF5+aWL1QlX/6qTCLUpVUdnG7/8jyjU=;
        b=HaHnBaIijGs8xLii4NWzZGwQrpWdlVbvvpZX4Jw0m0i6M7BtYolmNbYGC+nn2kVUNm
         27dwuGMgEfNcrzlFWoacMpXNpA2vfWSCL7vxvcIbUkwT/YRI192LfhPV0w+SvRqFw1rf
         Bdx2rYxooKo0gjCgCTXSKMJ68s6lpr0ZDI5FDBZJsC1SWANBbtk0Ru50jkoSE4OPIl9K
         7th/QN9SI5Zyz7t6R8DD90izDMbUOO+9jdKpl/EKMGyk9DiEFf0J9q9VUTmAsyyFS+i5
         rHE9w1na9UfASLWlBp7J1av7gpHQLyK4boOXFBNEfXoIVN6IWo0O5E3uPniz2qXnpbZF
         yp/w==
X-Forwarded-Encrypted: i=1; AJvYcCXUf4eA98VN+MplppY0IfzWwG7memEFTiZOyu0OdU1Ti58PHounTcPYqQra++udIvdbhYd29DUiprj91A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw6H1mZSVBgBfKhLk8jR3hFaTCOgPZftTZSvOw5gs2gh0GWSgl
	VR7qCKgDHNUlntufKBHX3HyHkdshmHh9U7Ms5FaJyDfs4sMeZG9Jse66mnbvg2vlvQQb408DnWY
	=
X-Gm-Gg: ASbGnctBkLOyfIsKbQ6CGcy45AUUdjUqfIlR5spedXV0oq8DBACRRitK6ldxOVAjF0f
	cqJkJi2BcH8vCijZU/5X14ISWv8jLFEmQ72v52J68jIABQRxIE/1ITVQ4642rgAghlFRY+n9MIo
	BcgJKybT7BP0q7RufVWywwM323nwyZEQznzXN8MRNN6H8hxgBm+ycFkk8V4wO1DMj71jNEJQdwJ
	pPNHwj6ZR7IZQh5Ceeh+JHlEZ30dxFKF5elGIoLVxDmOV+ZAM3Iqs/m/URCFTabRTZz4klZtqfx
	Vw7BfhOSN6WZoTAP
X-Google-Smtp-Source: AGHT+IF2HM2DDDlxYFOLSFZxHzSmRmnw7lQmmKb3oOkwHjLrtQXTEAz/UCIv/7NL8nCzPiSTWRoZpQ==
X-Received: by 2002:a17:902:ec8b:b0:20c:cd01:79ae with SMTP id d9443c01a7336-2151d88563dmr61813585ad.24.1732825673925;
        Thu, 28 Nov 2024 12:27:53 -0800 (PST)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com. [209.85.210.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21521905f2bsm17812145ad.93.2024.11.28.12.27.52
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 12:27:53 -0800 (PST)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7253bc4d25eso824799b3a.0
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 12:27:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVJj1Af6CkEQTSTAZogP4QOv+VWEGM9qZh9m1MECSxA+Naqv4HPuhxpJzhGtVraMCApLlwTt29Uupun0w==@vger.kernel.org
X-Received: by 2002:a05:6a00:84c:b0:724:db17:f975 with SMTP id
 d2e1a72fcca58-7253f369c37mr7692058b3a.12.1732825672148; Thu, 28 Nov 2024
 12:27:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127-uvc-dup-cap-out-v1-1-1bdcad2dabb0@chromium.org> <20241128202442.GC13852@pendragon.ideasonboard.com>
In-Reply-To: <20241128202442.GC13852@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 28 Nov 2024 21:27:39 +0100
X-Gmail-Original-Message-ID: <CANiDSCvDoWf56bpejAgY0Cm_yrctPZzomG1SHF1kUyLRtn4dCg@mail.gmail.com>
Message-ID: <CANiDSCvDoWf56bpejAgY0Cm_yrctPZzomG1SHF1kUyLRtn4dCg@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Remove duplicated cap/out code
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Nov 2024 at 21:24, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Wed, Nov 27, 2024 at 07:31:29AM +0000, Ricardo Ribalda wrote:
> > The *_vid_cap and *_vid_out helpers seem to be identical. Remove all the
> > duplicated code.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > Unless I miss something, cap and out helpers are identical. So there is
> > no need to duplicate code
> > ---
> >  drivers/media/usb/uvc/uvc_v4l2.c | 112 ++++++++-------------------------------
> >  1 file changed, 22 insertions(+), 90 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 97c5407f6603..11ccdaf0269f 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -361,9 +361,11 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
> >       return ret;
> >  }
> >
> > -static int uvc_v4l2_get_format(struct uvc_streaming *stream,
> > -     struct v4l2_format *fmt)
> > +static int uvc_ioctl_g_fmt(struct file *file, void *fh,
> > +                        struct v4l2_format *fmt)
> >  {
> > +     struct uvc_fh *handle = fh;
> > +     struct uvc_streaming *stream = handle->stream;
> >       const struct uvc_format *format;
> >       const struct uvc_frame *frame;
> >       int ret = 0;
> > @@ -395,9 +397,11 @@ static int uvc_v4l2_get_format(struct uvc_streaming *stream,
> >       return ret;
> >  }
> >
> > -static int uvc_v4l2_set_format(struct uvc_streaming *stream,
> > -     struct v4l2_format *fmt)
> > +static int uvc_ioctl_s_fmt(struct file *file, void *fh,
> > +                        struct v4l2_format *fmt)
> >  {
> > +     struct uvc_fh *handle = fh;
> > +     struct uvc_streaming *stream = handle->stream;
> >       struct uvc_streaming_control probe;
> >       const struct uvc_format *format;
> >       const struct uvc_frame *frame;
> > @@ -685,11 +689,13 @@ static int uvc_ioctl_querycap(struct file *file, void *fh,
> >       return 0;
> >  }
> >
> > -static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
> > +static int uvc_ioctl_enum_fmt(struct file *file, void *fh,
> >                             struct v4l2_fmtdesc *fmt)
> >  {
> > -     const struct uvc_format *format;
> > +     struct uvc_fh *handle = fh;
> > +     struct uvc_streaming *stream = handle->stream;
> >       enum v4l2_buf_type type = fmt->type;
> > +     const struct uvc_format *format;
> >       u32 index = fmt->index;
> >
> >       if (fmt->type != stream->type || fmt->index >= stream->nformats)
> > @@ -707,82 +713,8 @@ static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
> >       return 0;
> >  }
> >
> > -static int uvc_ioctl_enum_fmt_vid_cap(struct file *file, void *fh,
> > -                                   struct v4l2_fmtdesc *fmt)
> > -{
> > -     struct uvc_fh *handle = fh;
> > -     struct uvc_streaming *stream = handle->stream;
> > -
> > -     return uvc_ioctl_enum_fmt(stream, fmt);
> > -}
> > -
> > -static int uvc_ioctl_enum_fmt_vid_out(struct file *file, void *fh,
> > -                                   struct v4l2_fmtdesc *fmt)
> > -{
> > -     struct uvc_fh *handle = fh;
> > -     struct uvc_streaming *stream = handle->stream;
> > -
> > -     return uvc_ioctl_enum_fmt(stream, fmt);
> > -}
> > -
> > -static int uvc_ioctl_g_fmt_vid_cap(struct file *file, void *fh,
> > -                                struct v4l2_format *fmt)
> > -{
> > -     struct uvc_fh *handle = fh;
> > -     struct uvc_streaming *stream = handle->stream;
> > -
> > -     return uvc_v4l2_get_format(stream, fmt);
> > -}
> > -
> > -static int uvc_ioctl_g_fmt_vid_out(struct file *file, void *fh,
> > -                                struct v4l2_format *fmt)
> > -{
> > -     struct uvc_fh *handle = fh;
> > -     struct uvc_streaming *stream = handle->stream;
> > -
> > -     return uvc_v4l2_get_format(stream, fmt);
> > -}
> > -
> > -static int uvc_ioctl_s_fmt_vid_cap(struct file *file, void *fh,
> > -                                struct v4l2_format *fmt)
> > -{
> > -     struct uvc_fh *handle = fh;
> > -     struct uvc_streaming *stream = handle->stream;
> > -     int ret;
> > -
> > -     ret = uvc_acquire_privileges(handle);
> > -     if (ret < 0)
> > -             return ret;
>
> Has this now silently disappeared ?

My bad, I guess I got excited pressing the delete key :).

Good catch. I will resend.

>
> > -
> > -     return uvc_v4l2_set_format(stream, fmt);
> > -}
> > -
> > -static int uvc_ioctl_s_fmt_vid_out(struct file *file, void *fh,
> > -                                struct v4l2_format *fmt)
> > -{
> > -     struct uvc_fh *handle = fh;
> > -     struct uvc_streaming *stream = handle->stream;
> > -     int ret;
> > -
> > -     ret = uvc_acquire_privileges(handle);
> > -     if (ret < 0)
> > -             return ret;
> > -
> > -     return uvc_v4l2_set_format(stream, fmt);
> > -}
> > -
> > -static int uvc_ioctl_try_fmt_vid_cap(struct file *file, void *fh,
> > -                                  struct v4l2_format *fmt)
> > -{
> > -     struct uvc_fh *handle = fh;
> > -     struct uvc_streaming *stream = handle->stream;
> > -     struct uvc_streaming_control probe;
> > -
> > -     return uvc_v4l2_try_format(stream, fmt, &probe, NULL, NULL);
> > -}
> > -
> > -static int uvc_ioctl_try_fmt_vid_out(struct file *file, void *fh,
> > -                                  struct v4l2_format *fmt)
> > +static int uvc_ioctl_try_fmt(struct file *file, void *fh,
> > +                          struct v4l2_format *fmt)
> >  {
> >       struct uvc_fh *handle = fh;
> >       struct uvc_streaming *stream = handle->stream;
> > @@ -1544,14 +1476,14 @@ static unsigned long uvc_v4l2_get_unmapped_area(struct file *file,
> >
> >  const struct v4l2_ioctl_ops uvc_ioctl_ops = {
> >       .vidioc_querycap = uvc_ioctl_querycap,
> > -     .vidioc_enum_fmt_vid_cap = uvc_ioctl_enum_fmt_vid_cap,
> > -     .vidioc_enum_fmt_vid_out = uvc_ioctl_enum_fmt_vid_out,
> > -     .vidioc_g_fmt_vid_cap = uvc_ioctl_g_fmt_vid_cap,
> > -     .vidioc_g_fmt_vid_out = uvc_ioctl_g_fmt_vid_out,
> > -     .vidioc_s_fmt_vid_cap = uvc_ioctl_s_fmt_vid_cap,
> > -     .vidioc_s_fmt_vid_out = uvc_ioctl_s_fmt_vid_out,
> > -     .vidioc_try_fmt_vid_cap = uvc_ioctl_try_fmt_vid_cap,
> > -     .vidioc_try_fmt_vid_out = uvc_ioctl_try_fmt_vid_out,
> > +     .vidioc_enum_fmt_vid_cap = uvc_ioctl_enum_fmt,
> > +     .vidioc_enum_fmt_vid_out = uvc_ioctl_enum_fmt,
> > +     .vidioc_g_fmt_vid_cap = uvc_ioctl_g_fmt,
> > +     .vidioc_g_fmt_vid_out = uvc_ioctl_g_fmt,
> > +     .vidioc_s_fmt_vid_cap = uvc_ioctl_s_fmt,
> > +     .vidioc_s_fmt_vid_out = uvc_ioctl_s_fmt,
> > +     .vidioc_try_fmt_vid_cap = uvc_ioctl_try_fmt,
> > +     .vidioc_try_fmt_vid_out = uvc_ioctl_try_fmt,
> >       .vidioc_reqbufs = uvc_ioctl_reqbufs,
> >       .vidioc_querybuf = uvc_ioctl_querybuf,
> >       .vidioc_qbuf = uvc_ioctl_qbuf,
> >
> > ---
> > base-commit: 72ad4ff638047bbbdf3232178fea4bec1f429319
> > change-id: 20241127-uvc-dup-cap-out-6a03c01e30a3
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

