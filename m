Return-Path: <linux-media+bounces-22268-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFCA9DBD5E
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 22:49:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8EEFB2105F
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 21:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3444D1C3035;
	Thu, 28 Nov 2024 21:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MDzpfsDg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14D51B5EDC
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 21:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732830577; cv=none; b=glA1ON4hBcw9paS+ehavt63nzITQduSgkSc5xx8dN9nMVr6myLmwuDDmSCFwrBbIMU2h4x6VCDkLfYaxRDHZhCMMokgZ5vzm1b5kBlZRlW/uCeuTuvIdiIzXg2hxu7R32Ep1a0v28kSwkMH9RrGlIngUR8T9ziYztd4jcMzkEdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732830577; c=relaxed/simple;
	bh=USiD9t55PxHTOJGMocZenoFCJFXblvsqYmzbtsQ8V1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cCzhAkk00xokWZKLr8Vq5LenM8Ahark0lF97cUplITdqtqbPxyp5u/QYAdlcw9AkwGnE9zoIQWW7wzJndzEGl+1KB9A0qfUv2LceffW89W6YPd51TfRCnwfKp3X+T0gaRoDwWcEhauI0HYMkZ8YjCUhWOemkVmC+qQclVsC5U7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MDzpfsDg; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21288ce11d7so10351155ad.2
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 13:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732830574; x=1733435374; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZDBginDxuBSRjj7TI1uec63Bxogn5cmMPw/VXGr+his=;
        b=MDzpfsDgD8d8YJCHmQV5pGdZHKXylI1dF/vOhOMMfYNWk1e68UXpTdZ4oMP61QL4nd
         TuC7q1vMrAoceNfDv8pg6bhkugs6aPeLny8S4mbUuX5GaM63h+Sm06/hV7csxg1RWjSa
         9ZKOX0fmLfL8VTYEH7UElqE/qkjKsDU2R0180=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732830574; x=1733435374;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZDBginDxuBSRjj7TI1uec63Bxogn5cmMPw/VXGr+his=;
        b=N84rYb8VVdUgp0Gy1hrWI20ammKt1RRCBcsEcSusfFCDJe9wO+hOoJBt20DeR7zq/t
         L9Rgn0PoGLqQFhDqrUnyD1omlQRIGlKk1UKHj9Hgwv4eNrK5DnN2mOkkVRk1DBQ27HKM
         6YiBtEtsN7EJoctreEOHp7KnJhDeCQVkeFLTRMuXvLV3Z6fZEcoVOhFv6O6b/la0sUQs
         2Y/NIA57rIkH4d6gbhUMUINytOFK0/FcAYV382S7ZfHzyLG8CTYCbdg/rBB1F2EFGUAP
         CMZxWsTJ+D23AYy+sVdtizx7aYnJM6cvQvPWEIwvy1gu4sNjJrUiMyT2PuR2yWCuoOiZ
         Mr5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXi48X4ACVsLwu2LjCV7pgTd76v2ZmfedDnuaNMU0aCCsM7AUzv2Z7G13Tk6oNLL3Yt0l9UhikNA27srQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfpEA/ZaFwQm/v2k97PHBT649Tu535FRrcqF1N7+gsN7SUKgNo
	zjzhZlVNddis+E68oEkIxoAMukcEpj63r4FUNX7adE+i5d9hhDuOrufd1e+POjAbPbkWHFtgmd4
	=
X-Gm-Gg: ASbGncuBf5sa8MOXnrZqD0eM4U50yo0aLKXMr4RV9AoNlucZMHgT6k4i+xKMbziomFN
	MNqhjPEvmAL8WORLY5qXq/8CNjGG6qzcekTVnsMqxohTxB13CpH0vauJX6Vsr+aGr/DgnEWDx/r
	9gXmqNg71RWl1TjPB4Np+9vefmvpX49d4f7WaA7LcQYCfh+424cKwKmKHsrwYFA6SYPrOofdmZC
	424YAfRjqUCnzvdyGnQrUlqPx2GQaqF1CWSxLYtqZ0Cl2V/kkocgMB47RrDC64LgKGCcspslzTv
	3A2YGOaTMHZb
X-Google-Smtp-Source: AGHT+IFzTed6Tr3GKdjk7qrcAyPKBn2L0Il/s+PPG4xUGwKR+scGCRtOvyMQehaTKOWJkqeEyu//Fw==
X-Received: by 2002:a17:902:f550:b0:20b:951f:6dff with SMTP id d9443c01a7336-21500fee024mr132779535ad.0.1732830574436;
        Thu, 28 Nov 2024 13:49:34 -0800 (PST)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com. [209.85.216.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21539e88cefsm5148145ad.182.2024.11.28.13.49.33
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 13:49:33 -0800 (PST)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ee3737d2b5so523010a91.1
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 13:49:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVLXU2Xoh+hE2r6+A0m5Ei072lsMZErDZUSnEAmkOogCPDSIFcGGL48dm2cCORC20ld9VRR32+WOpPJQg==@vger.kernel.org
X-Received: by 2002:a17:90b:548f:b0:2ea:2a8d:dd2a with SMTP id
 98e67ed59e1d1-2ee095bff07mr10313522a91.27.1732830573104; Thu, 28 Nov 2024
 13:49:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127-uvc-dup-cap-out-v1-1-1bdcad2dabb0@chromium.org>
 <20241128202442.GC13852@pendragon.ideasonboard.com> <20241128203127.GD13852@pendragon.ideasonboard.com>
 <CANiDSCt69HXfRmWHKGELWoUE45bZeWUgVc3C7=aAvykUYZBUzQ@mail.gmail.com> <20241128204619.GB25731@pendragon.ideasonboard.com>
In-Reply-To: <20241128204619.GB25731@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 28 Nov 2024 22:49:20 +0100
X-Gmail-Original-Message-ID: <CANiDSCvKfNSdUb35AibcNg0d5NerpzeOB2SVss7+-4wy27BaCg@mail.gmail.com>
Message-ID: <CANiDSCvKfNSdUb35AibcNg0d5NerpzeOB2SVss7+-4wy27BaCg@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Remove duplicated cap/out code
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Nov 2024 at 21:46, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Thu, Nov 28, 2024 at 09:36:06PM +0100, Ricardo Ribalda wrote:
> > On Thu, 28 Nov 2024 at 21:31, Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > On Thu, Nov 28, 2024 at 10:24:42PM +0200, Laurent Pinchart wrote:
> > > > Hi Ricardo,
> > > >
> > > > Thank you for the patch.
> > > >
> > > > On Wed, Nov 27, 2024 at 07:31:29AM +0000, Ricardo Ribalda wrote:
> > > > > The *_vid_cap and *_vid_out helpers seem to be identical. Remove all the
> > > > > duplicated code.
> > > > >
> > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > ---
> > > > > Unless I miss something, cap and out helpers are identical. So there is
> > > > > no need to duplicate code
> > > > > ---
> > > > >  drivers/media/usb/uvc/uvc_v4l2.c | 112 ++++++++-------------------------------
> > > > >  1 file changed, 22 insertions(+), 90 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > > > > index 97c5407f6603..11ccdaf0269f 100644
> > > > > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > > > > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > > > > @@ -361,9 +361,11 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
> > > > >     return ret;
> > > > >  }
> > > > >
> > > > > -static int uvc_v4l2_get_format(struct uvc_streaming *stream,
> > > > > -   struct v4l2_format *fmt)
> > > > > +static int uvc_ioctl_g_fmt(struct file *file, void *fh,
> > > > > +                      struct v4l2_format *fmt)
> > > > >  {
> > > > > +   struct uvc_fh *handle = fh;
> > > > > +   struct uvc_streaming *stream = handle->stream;
> > > > >     const struct uvc_format *format;
> > > > >     const struct uvc_frame *frame;
> > > > >     int ret = 0;
> > > > > @@ -395,9 +397,11 @@ static int uvc_v4l2_get_format(struct uvc_streaming *stream,
> > > > >     return ret;
> > > > >  }
> > > > >
> > > > > -static int uvc_v4l2_set_format(struct uvc_streaming *stream,
> > > > > -   struct v4l2_format *fmt)
> > > > > +static int uvc_ioctl_s_fmt(struct file *file, void *fh,
> > > > > +                      struct v4l2_format *fmt)
> > > > >  {
> > > > > +   struct uvc_fh *handle = fh;
> > > > > +   struct uvc_streaming *stream = handle->stream;
> > > > >     struct uvc_streaming_control probe;
> > > > >     const struct uvc_format *format;
> > > > >     const struct uvc_frame *frame;
> > > > > @@ -685,11 +689,13 @@ static int uvc_ioctl_querycap(struct file *file, void *fh,
> > > > >     return 0;
> > > > >  }
> > > > >
> > > > > -static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
> > > > > +static int uvc_ioctl_enum_fmt(struct file *file, void *fh,
> > > > >                           struct v4l2_fmtdesc *fmt)
> > > > >  {
> > > > > -   const struct uvc_format *format;
> > > > > +   struct uvc_fh *handle = fh;
> > > > > +   struct uvc_streaming *stream = handle->stream;
> > > > >     enum v4l2_buf_type type = fmt->type;
> > > > > +   const struct uvc_format *format;
> > > > >     u32 index = fmt->index;
> > > > >
> > > > >     if (fmt->type != stream->type || fmt->index >= stream->nformats)
> > > > > @@ -707,82 +713,8 @@ static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
> > > > >     return 0;
> > > > >  }
> > > > >
> > > > > -static int uvc_ioctl_enum_fmt_vid_cap(struct file *file, void *fh,
> > > > > -                                 struct v4l2_fmtdesc *fmt)
> > > > > -{
> > > > > -   struct uvc_fh *handle = fh;
> > > > > -   struct uvc_streaming *stream = handle->stream;
> > > > > -
> > > > > -   return uvc_ioctl_enum_fmt(stream, fmt);
> > > > > -}
> > > > > -
> > > > > -static int uvc_ioctl_enum_fmt_vid_out(struct file *file, void *fh,
> > > > > -                                 struct v4l2_fmtdesc *fmt)
> > > > > -{
> > > > > -   struct uvc_fh *handle = fh;
> > > > > -   struct uvc_streaming *stream = handle->stream;
> > > > > -
> > > > > -   return uvc_ioctl_enum_fmt(stream, fmt);
> > > > > -}
> > > > > -
> > > > > -static int uvc_ioctl_g_fmt_vid_cap(struct file *file, void *fh,
> > > > > -                              struct v4l2_format *fmt)
> > > > > -{
> > > > > -   struct uvc_fh *handle = fh;
> > > > > -   struct uvc_streaming *stream = handle->stream;
> > > > > -
> > > > > -   return uvc_v4l2_get_format(stream, fmt);
> > > > > -}
> > > > > -
> > > > > -static int uvc_ioctl_g_fmt_vid_out(struct file *file, void *fh,
> > > > > -                              struct v4l2_format *fmt)
> > > > > -{
> > > > > -   struct uvc_fh *handle = fh;
> > > > > -   struct uvc_streaming *stream = handle->stream;
> > > > > -
> > > > > -   return uvc_v4l2_get_format(stream, fmt);
> > > > > -}
> > > > > -
> > > > > -static int uvc_ioctl_s_fmt_vid_cap(struct file *file, void *fh,
> > > > > -                              struct v4l2_format *fmt)
> > > > > -{
> > > > > -   struct uvc_fh *handle = fh;
> > > > > -   struct uvc_streaming *stream = handle->stream;
> > > > > -   int ret;
> > > > > -
> > > > > -   ret = uvc_acquire_privileges(handle);
> > > > > -   if (ret < 0)
> > > > > -           return ret;
> > > >
> > > > Has this now silently disappeared ?
> > > >
> > > > > -
> > > > > -   return uvc_v4l2_set_format(stream, fmt);
> > > > > -}
> > > > > -
> > > > > -static int uvc_ioctl_s_fmt_vid_out(struct file *file, void *fh,
> > > > > -                              struct v4l2_format *fmt)
> > > > > -{
> > > > > -   struct uvc_fh *handle = fh;
> > > > > -   struct uvc_streaming *stream = handle->stream;
> > > > > -   int ret;
> > > > > -
> > > > > -   ret = uvc_acquire_privileges(handle);
> > > > > -   if (ret < 0)
> > > > > -           return ret;
> > > > > -
> > > > > -   return uvc_v4l2_set_format(stream, fmt);
> > > > > -}
> > > > > -
> > > > > -static int uvc_ioctl_try_fmt_vid_cap(struct file *file, void *fh,
> > > > > -                                struct v4l2_format *fmt)
> > > > > -{
> > > > > -   struct uvc_fh *handle = fh;
> > > > > -   struct uvc_streaming *stream = handle->stream;
> > > > > -   struct uvc_streaming_control probe;
> > > > > -
> > > > > -   return uvc_v4l2_try_format(stream, fmt, &probe, NULL, NULL);
> > > > > -}
> > > > > -
> > > > > -static int uvc_ioctl_try_fmt_vid_out(struct file *file, void *fh,
> > > > > -                                struct v4l2_format *fmt)
> > > > > +static int uvc_ioctl_try_fmt(struct file *file, void *fh,
> > > > > +                        struct v4l2_format *fmt)
> > > > >  {
> > > > >     struct uvc_fh *handle = fh;
> > > > >     struct uvc_streaming *stream = handle->stream;
> > > > > @@ -1544,14 +1476,14 @@ static unsigned long uvc_v4l2_get_unmapped_area(struct file *file,
> > > > >
> > > > >  const struct v4l2_ioctl_ops uvc_ioctl_ops = {
> > > > >     .vidioc_querycap = uvc_ioctl_querycap,
> > > > > -   .vidioc_enum_fmt_vid_cap = uvc_ioctl_enum_fmt_vid_cap,
> > > > > -   .vidioc_enum_fmt_vid_out = uvc_ioctl_enum_fmt_vid_out,
> > > > > -   .vidioc_g_fmt_vid_cap = uvc_ioctl_g_fmt_vid_cap,
> > > > > -   .vidioc_g_fmt_vid_out = uvc_ioctl_g_fmt_vid_out,
> > > > > -   .vidioc_s_fmt_vid_cap = uvc_ioctl_s_fmt_vid_cap,
> > > > > -   .vidioc_s_fmt_vid_out = uvc_ioctl_s_fmt_vid_out,
> > > > > -   .vidioc_try_fmt_vid_cap = uvc_ioctl_try_fmt_vid_cap,
> > > > > -   .vidioc_try_fmt_vid_out = uvc_ioctl_try_fmt_vid_out,
> > > > > +   .vidioc_enum_fmt_vid_cap = uvc_ioctl_enum_fmt,
> > > > > +   .vidioc_enum_fmt_vid_out = uvc_ioctl_enum_fmt,
> > > > > +   .vidioc_g_fmt_vid_cap = uvc_ioctl_g_fmt,
> > > > > +   .vidioc_g_fmt_vid_out = uvc_ioctl_g_fmt,
> > > > > +   .vidioc_s_fmt_vid_cap = uvc_ioctl_s_fmt,
> > > > > +   .vidioc_s_fmt_vid_out = uvc_ioctl_s_fmt,
> > > > > +   .vidioc_try_fmt_vid_cap = uvc_ioctl_try_fmt,
> > > > > +   .vidioc_try_fmt_vid_out = uvc_ioctl_try_fmt,
> > >
> > > Also, if you're removing wrapper, let's do the same for
> > > uvc_ioctl_g_parm() and uvc_ioctl_s_parm(). Furthermore, please try to
> > > preserve the order of the function definitions, sorting them as in the
> > > ioctl_ops structure.
> >
> > Do you want the reorder in a different patch to ease the review or in the same?
>
> The same is fine with me.

I tried reordering the functions and that patch will make future
stable cherry-picks a hell:
https://gitlab.freedesktop.org/linux-media/users/ribalda/-/commit/bdcc5b6a87f1046711d9d8b6ff68c3951c1a12f8

I am reordering the callbacks in uvc_ioctl_ops instead. You do not
seem to follow any particular order there, so I guess it is fine.

Please let me know otherwise


>
> > > > >     .vidioc_reqbufs = uvc_ioctl_reqbufs,
> > > > >     .vidioc_querybuf = uvc_ioctl_querybuf,
> > > > >     .vidioc_qbuf = uvc_ioctl_qbuf,
> > > > >
> > > > > ---
> > > > > base-commit: 72ad4ff638047bbbdf3232178fea4bec1f429319
> > > > > change-id: 20241127-uvc-dup-cap-out-6a03c01e30a3
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

