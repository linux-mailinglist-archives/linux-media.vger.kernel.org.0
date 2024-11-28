Return-Path: <linux-media+bounces-22257-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 339239DBD08
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 21:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43E84B217D2
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 20:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF8A31C3045;
	Thu, 28 Nov 2024 20:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HKAMAbBv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8AE9463;
	Thu, 28 Nov 2024 20:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732826793; cv=none; b=ItdVlGtLeL30SKydlwpIS97sdq+Dmoup/Qa+VjazGwJJqLw6AD5PYVmrO6ge+2ynz9EeJdXdtwJTogdvR7Sef/BkNA543NtdcaQT3y7KTkBW2eydgOL47yvmRVlB+q7mNly9X4DivVSTyjKKwuHzEQfDs0xu/WsBr1WEoJMLPm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732826793; c=relaxed/simple;
	bh=YgsAdv9oCpugnNqSRK4GABNlpokCOMDY3ZwI/UFDeTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q32j2PROy1TdqhfP7rKB7382hA5wwmTzBq3u7+QRpM9A3Nnjf65Cczkxon9icvSqRTd/FDbldQKQrCa7FKWbR7Xkcg5FqVdkYWHZF6RBG0JyqlP7cQPQUrMIlfXoCQJnwEsNR2QxQZLiE4vZNYTCYf5AnaPBuMe5S/KqTi6GWL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HKAMAbBv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D81E459D;
	Thu, 28 Nov 2024 21:46:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732826766;
	bh=YgsAdv9oCpugnNqSRK4GABNlpokCOMDY3ZwI/UFDeTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HKAMAbBv+WSIuBZvNUIMB6INRosVfWgKFvQv0BvZH/pd4bIz6O04FJPBTsvI3XybN
	 FXTVydPsRN0Iw+eNectHdUkjPYotaVcxYldSE50ogtqU1CdrdfKmbHNGnYbQa3K1FG
	 Xz3VuYaI16cS3oEWeji7m9tUTdRbeHGXqB7ZBcVo=
Date: Thu, 28 Nov 2024 22:46:19 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Remove duplicated cap/out code
Message-ID: <20241128204619.GB25731@pendragon.ideasonboard.com>
References: <20241127-uvc-dup-cap-out-v1-1-1bdcad2dabb0@chromium.org>
 <20241128202442.GC13852@pendragon.ideasonboard.com>
 <20241128203127.GD13852@pendragon.ideasonboard.com>
 <CANiDSCt69HXfRmWHKGELWoUE45bZeWUgVc3C7=aAvykUYZBUzQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCt69HXfRmWHKGELWoUE45bZeWUgVc3C7=aAvykUYZBUzQ@mail.gmail.com>

On Thu, Nov 28, 2024 at 09:36:06PM +0100, Ricardo Ribalda wrote:
> On Thu, 28 Nov 2024 at 21:31, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > On Thu, Nov 28, 2024 at 10:24:42PM +0200, Laurent Pinchart wrote:
> > > Hi Ricardo,
> > >
> > > Thank you for the patch.
> > >
> > > On Wed, Nov 27, 2024 at 07:31:29AM +0000, Ricardo Ribalda wrote:
> > > > The *_vid_cap and *_vid_out helpers seem to be identical. Remove all the
> > > > duplicated code.
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > > Unless I miss something, cap and out helpers are identical. So there is
> > > > no need to duplicate code
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_v4l2.c | 112 ++++++++-------------------------------
> > > >  1 file changed, 22 insertions(+), 90 deletions(-)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > > > index 97c5407f6603..11ccdaf0269f 100644
> > > > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > > > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > > > @@ -361,9 +361,11 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
> > > >     return ret;
> > > >  }
> > > >
> > > > -static int uvc_v4l2_get_format(struct uvc_streaming *stream,
> > > > -   struct v4l2_format *fmt)
> > > > +static int uvc_ioctl_g_fmt(struct file *file, void *fh,
> > > > +                      struct v4l2_format *fmt)
> > > >  {
> > > > +   struct uvc_fh *handle = fh;
> > > > +   struct uvc_streaming *stream = handle->stream;
> > > >     const struct uvc_format *format;
> > > >     const struct uvc_frame *frame;
> > > >     int ret = 0;
> > > > @@ -395,9 +397,11 @@ static int uvc_v4l2_get_format(struct uvc_streaming *stream,
> > > >     return ret;
> > > >  }
> > > >
> > > > -static int uvc_v4l2_set_format(struct uvc_streaming *stream,
> > > > -   struct v4l2_format *fmt)
> > > > +static int uvc_ioctl_s_fmt(struct file *file, void *fh,
> > > > +                      struct v4l2_format *fmt)
> > > >  {
> > > > +   struct uvc_fh *handle = fh;
> > > > +   struct uvc_streaming *stream = handle->stream;
> > > >     struct uvc_streaming_control probe;
> > > >     const struct uvc_format *format;
> > > >     const struct uvc_frame *frame;
> > > > @@ -685,11 +689,13 @@ static int uvc_ioctl_querycap(struct file *file, void *fh,
> > > >     return 0;
> > > >  }
> > > >
> > > > -static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
> > > > +static int uvc_ioctl_enum_fmt(struct file *file, void *fh,
> > > >                           struct v4l2_fmtdesc *fmt)
> > > >  {
> > > > -   const struct uvc_format *format;
> > > > +   struct uvc_fh *handle = fh;
> > > > +   struct uvc_streaming *stream = handle->stream;
> > > >     enum v4l2_buf_type type = fmt->type;
> > > > +   const struct uvc_format *format;
> > > >     u32 index = fmt->index;
> > > >
> > > >     if (fmt->type != stream->type || fmt->index >= stream->nformats)
> > > > @@ -707,82 +713,8 @@ static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
> > > >     return 0;
> > > >  }
> > > >
> > > > -static int uvc_ioctl_enum_fmt_vid_cap(struct file *file, void *fh,
> > > > -                                 struct v4l2_fmtdesc *fmt)
> > > > -{
> > > > -   struct uvc_fh *handle = fh;
> > > > -   struct uvc_streaming *stream = handle->stream;
> > > > -
> > > > -   return uvc_ioctl_enum_fmt(stream, fmt);
> > > > -}
> > > > -
> > > > -static int uvc_ioctl_enum_fmt_vid_out(struct file *file, void *fh,
> > > > -                                 struct v4l2_fmtdesc *fmt)
> > > > -{
> > > > -   struct uvc_fh *handle = fh;
> > > > -   struct uvc_streaming *stream = handle->stream;
> > > > -
> > > > -   return uvc_ioctl_enum_fmt(stream, fmt);
> > > > -}
> > > > -
> > > > -static int uvc_ioctl_g_fmt_vid_cap(struct file *file, void *fh,
> > > > -                              struct v4l2_format *fmt)
> > > > -{
> > > > -   struct uvc_fh *handle = fh;
> > > > -   struct uvc_streaming *stream = handle->stream;
> > > > -
> > > > -   return uvc_v4l2_get_format(stream, fmt);
> > > > -}
> > > > -
> > > > -static int uvc_ioctl_g_fmt_vid_out(struct file *file, void *fh,
> > > > -                              struct v4l2_format *fmt)
> > > > -{
> > > > -   struct uvc_fh *handle = fh;
> > > > -   struct uvc_streaming *stream = handle->stream;
> > > > -
> > > > -   return uvc_v4l2_get_format(stream, fmt);
> > > > -}
> > > > -
> > > > -static int uvc_ioctl_s_fmt_vid_cap(struct file *file, void *fh,
> > > > -                              struct v4l2_format *fmt)
> > > > -{
> > > > -   struct uvc_fh *handle = fh;
> > > > -   struct uvc_streaming *stream = handle->stream;
> > > > -   int ret;
> > > > -
> > > > -   ret = uvc_acquire_privileges(handle);
> > > > -   if (ret < 0)
> > > > -           return ret;
> > >
> > > Has this now silently disappeared ?
> > >
> > > > -
> > > > -   return uvc_v4l2_set_format(stream, fmt);
> > > > -}
> > > > -
> > > > -static int uvc_ioctl_s_fmt_vid_out(struct file *file, void *fh,
> > > > -                              struct v4l2_format *fmt)
> > > > -{
> > > > -   struct uvc_fh *handle = fh;
> > > > -   struct uvc_streaming *stream = handle->stream;
> > > > -   int ret;
> > > > -
> > > > -   ret = uvc_acquire_privileges(handle);
> > > > -   if (ret < 0)
> > > > -           return ret;
> > > > -
> > > > -   return uvc_v4l2_set_format(stream, fmt);
> > > > -}
> > > > -
> > > > -static int uvc_ioctl_try_fmt_vid_cap(struct file *file, void *fh,
> > > > -                                struct v4l2_format *fmt)
> > > > -{
> > > > -   struct uvc_fh *handle = fh;
> > > > -   struct uvc_streaming *stream = handle->stream;
> > > > -   struct uvc_streaming_control probe;
> > > > -
> > > > -   return uvc_v4l2_try_format(stream, fmt, &probe, NULL, NULL);
> > > > -}
> > > > -
> > > > -static int uvc_ioctl_try_fmt_vid_out(struct file *file, void *fh,
> > > > -                                struct v4l2_format *fmt)
> > > > +static int uvc_ioctl_try_fmt(struct file *file, void *fh,
> > > > +                        struct v4l2_format *fmt)
> > > >  {
> > > >     struct uvc_fh *handle = fh;
> > > >     struct uvc_streaming *stream = handle->stream;
> > > > @@ -1544,14 +1476,14 @@ static unsigned long uvc_v4l2_get_unmapped_area(struct file *file,
> > > >
> > > >  const struct v4l2_ioctl_ops uvc_ioctl_ops = {
> > > >     .vidioc_querycap = uvc_ioctl_querycap,
> > > > -   .vidioc_enum_fmt_vid_cap = uvc_ioctl_enum_fmt_vid_cap,
> > > > -   .vidioc_enum_fmt_vid_out = uvc_ioctl_enum_fmt_vid_out,
> > > > -   .vidioc_g_fmt_vid_cap = uvc_ioctl_g_fmt_vid_cap,
> > > > -   .vidioc_g_fmt_vid_out = uvc_ioctl_g_fmt_vid_out,
> > > > -   .vidioc_s_fmt_vid_cap = uvc_ioctl_s_fmt_vid_cap,
> > > > -   .vidioc_s_fmt_vid_out = uvc_ioctl_s_fmt_vid_out,
> > > > -   .vidioc_try_fmt_vid_cap = uvc_ioctl_try_fmt_vid_cap,
> > > > -   .vidioc_try_fmt_vid_out = uvc_ioctl_try_fmt_vid_out,
> > > > +   .vidioc_enum_fmt_vid_cap = uvc_ioctl_enum_fmt,
> > > > +   .vidioc_enum_fmt_vid_out = uvc_ioctl_enum_fmt,
> > > > +   .vidioc_g_fmt_vid_cap = uvc_ioctl_g_fmt,
> > > > +   .vidioc_g_fmt_vid_out = uvc_ioctl_g_fmt,
> > > > +   .vidioc_s_fmt_vid_cap = uvc_ioctl_s_fmt,
> > > > +   .vidioc_s_fmt_vid_out = uvc_ioctl_s_fmt,
> > > > +   .vidioc_try_fmt_vid_cap = uvc_ioctl_try_fmt,
> > > > +   .vidioc_try_fmt_vid_out = uvc_ioctl_try_fmt,
> >
> > Also, if you're removing wrapper, let's do the same for
> > uvc_ioctl_g_parm() and uvc_ioctl_s_parm(). Furthermore, please try to
> > preserve the order of the function definitions, sorting them as in the
> > ioctl_ops structure.
> 
> Do you want the reorder in a different patch to ease the review or in the same?

The same is fine with me.

> > > >     .vidioc_reqbufs = uvc_ioctl_reqbufs,
> > > >     .vidioc_querybuf = uvc_ioctl_querybuf,
> > > >     .vidioc_qbuf = uvc_ioctl_qbuf,
> > > >
> > > > ---
> > > > base-commit: 72ad4ff638047bbbdf3232178fea4bec1f429319
> > > > change-id: 20241127-uvc-dup-cap-out-6a03c01e30a3

-- 
Regards,

Laurent Pinchart

