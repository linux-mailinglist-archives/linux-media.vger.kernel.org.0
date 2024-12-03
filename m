Return-Path: <linux-media+bounces-22551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CDA9E26B4
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 17:16:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD9E2167A3E
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 16:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC121F890F;
	Tue,  3 Dec 2024 16:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AJEjxDAO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D767B1F76D5;
	Tue,  3 Dec 2024 16:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733242315; cv=none; b=M5nQnWzZaY5IJ8BKmWOplcxrunfnOyMJK3CIWRUngpK4eKD90nk5UIftjiOVFm42PQLVqSw41nGUwepkJVHqjXQd+NMGMyhvkrScZoWShpg6n3BVPpJqRHd9d5PngwzP+3UAr7ABwb/3LBB+A0Eu/nesrtMpwF4+540hVPPG5HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733242315; c=relaxed/simple;
	bh=vlJZ/XCZBJlrX/3/6i0NmK2WmJAlLxIdiUYeF2r0x38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FpgzBQS4WowrL6rNYFP+ejypeznSqCTaN2ezhdVSM0ExdlS5KbyOd0IR6xMhl5hFxv7FQoE6pQMq5//ALWg1Eo8EsBWKFs4G8mzsSDtA2xgCP7vwTLRm/mpQX/Xt3On8/w+sb2vlQ50aCWtbD2nHiv4Vf/X6MVSWigHLoieZceI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AJEjxDAO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98247670;
	Tue,  3 Dec 2024 17:11:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733242284;
	bh=vlJZ/XCZBJlrX/3/6i0NmK2WmJAlLxIdiUYeF2r0x38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AJEjxDAOEd1WoBUOszvvA1p6O28iRa6+ievypUde+x2QWF+DZKXlRg0lYMpJ4yxkZ
	 X/rmLauRN68aR59E9bciPaR5aKg9n/zQ4kZZsjGLnxoMnlmZRWUs5VJwzy3s5xUoS/
	 CgiCvqkUj+D6/u4CtOzrfByk8E9PCMp46s3Xxgo4=
Date: Tue, 3 Dec 2024 18:11:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: uvcvideo: Remove duplicated cap/out code
Message-ID: <20241203161140.GW10736@pendragon.ideasonboard.com>
References: <20241202-uvc-dup-cap-out-v3-1-d40b11bb74b7@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241202-uvc-dup-cap-out-v3-1-d40b11bb74b7@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Mon, Dec 02, 2024 at 01:37:35PM +0000, Ricardo Ribalda wrote:
> The *_vid_cap and *_vid_out helpers seem to be identical:
> - Remove all the cap/out duplicated code.
> - Remove s/g_parm helpers
> - Reorder uvc_ioctl_ops
> 
> And now that we are at it, fix a comment for uvc_acquire_privileges()
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Unless I miss something, cap and out helpers are identical. So there is
> no need to duplicate code
> ---
> Changes in v3:
> - if (ret < 0)
> - Link to v2: https://lore.kernel.org/r/20241129-uvc-dup-cap-out-v2-1-596cb9bdd5e8@chromium.org
> 
> Changes in v2:
> - Add missing acquire_privileges.
> - Also remove helper for s/g_parm.
> - Reorder callbacks.
> - Link to v1: https://lore.kernel.org/r/20241127-uvc-dup-cap-out-v1-1-1bdcad2dabb0@chromium.org
> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 162 +++++++++++----------------------------
>  1 file changed, 43 insertions(+), 119 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 97c5407f6603..dee6feeba274 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -26,6 +26,8 @@
>  
>  #include "uvcvideo.h"
>  
> +static int uvc_acquire_privileges(struct uvc_fh *handle);
> +

I don't like forward declarations, they're often a sign of bad code
design. In most cases they can be avoided just by moving functions
around. I'll send a patch to reshuffle functions in this file, as Hans
has already merged this patch and it will be easier to get the result
I'd like by doing it myself instead of asking you to do it for me.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  static int uvc_control_add_xu_mapping(struct uvc_video_chain *chain,
>  				      struct uvc_control_mapping *map,
>  				      const struct uvc_xu_control_mapping *xmap)
> @@ -361,9 +363,11 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
>  	return ret;
>  }
>  
> -static int uvc_v4l2_get_format(struct uvc_streaming *stream,
> -	struct v4l2_format *fmt)
> +static int uvc_ioctl_g_fmt(struct file *file, void *fh,
> +			   struct v4l2_format *fmt)
>  {
> +	struct uvc_fh *handle = fh;
> +	struct uvc_streaming *stream = handle->stream;
>  	const struct uvc_format *format;
>  	const struct uvc_frame *frame;
>  	int ret = 0;
> @@ -395,14 +399,20 @@ static int uvc_v4l2_get_format(struct uvc_streaming *stream,
>  	return ret;
>  }
>  
> -static int uvc_v4l2_set_format(struct uvc_streaming *stream,
> -	struct v4l2_format *fmt)
> +static int uvc_ioctl_s_fmt(struct file *file, void *fh,
> +			   struct v4l2_format *fmt)
>  {
> +	struct uvc_fh *handle = fh;
> +	struct uvc_streaming *stream = handle->stream;
>  	struct uvc_streaming_control probe;
>  	const struct uvc_format *format;
>  	const struct uvc_frame *frame;
>  	int ret;
>  
> +	ret = uvc_acquire_privileges(handle);
> +	if (ret < 0)
> +		return ret;
> +
>  	if (fmt->type != stream->type)
>  		return -EINVAL;
>  
> @@ -426,10 +436,12 @@ static int uvc_v4l2_set_format(struct uvc_streaming *stream,
>  	return ret;
>  }
>  
> -static int uvc_v4l2_get_streamparm(struct uvc_streaming *stream,
> -		struct v4l2_streamparm *parm)
> +static int uvc_ioctl_g_parm(struct file *file, void *fh,
> +			    struct v4l2_streamparm *parm)
>  {
>  	u32 numerator, denominator;
> +	struct uvc_fh *handle = fh;
> +	struct uvc_streaming *stream = handle->stream;
>  
>  	if (parm->type != stream->type)
>  		return -EINVAL;
> @@ -461,9 +473,11 @@ static int uvc_v4l2_get_streamparm(struct uvc_streaming *stream,
>  	return 0;
>  }
>  
> -static int uvc_v4l2_set_streamparm(struct uvc_streaming *stream,
> -		struct v4l2_streamparm *parm)
> +static int uvc_ioctl_s_parm(struct file *file, void *fh,
> +			    struct v4l2_streamparm *parm)
>  {
> +	struct uvc_fh *handle = fh;
> +	struct uvc_streaming *stream = handle->stream;
>  	struct uvc_streaming_control probe;
>  	struct v4l2_fract timeperframe;
>  	const struct uvc_format *format;
> @@ -472,6 +486,10 @@ static int uvc_v4l2_set_streamparm(struct uvc_streaming *stream,
>  	unsigned int i;
>  	int ret;
>  
> +	ret = uvc_acquire_privileges(handle);
> +	if (ret < 0)
> +		return ret;
> +
>  	if (parm->type != stream->type)
>  		return -EINVAL;
>  
> @@ -573,6 +591,7 @@ static int uvc_v4l2_set_streamparm(struct uvc_streaming *stream,
>   * - VIDIOC_S_INPUT
>   * - VIDIOC_S_PARM
>   * - VIDIOC_S_FMT
> + * - VIDIOC_CREATE_BUFS
>   * - VIDIOC_REQBUFS
>   */
>  static int uvc_acquire_privileges(struct uvc_fh *handle)
> @@ -685,11 +704,13 @@ static int uvc_ioctl_querycap(struct file *file, void *fh,
>  	return 0;
>  }
>  
> -static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
> +static int uvc_ioctl_enum_fmt(struct file *file, void *fh,
>  			      struct v4l2_fmtdesc *fmt)
>  {
> -	const struct uvc_format *format;
> +	struct uvc_fh *handle = fh;
> +	struct uvc_streaming *stream = handle->stream;
>  	enum v4l2_buf_type type = fmt->type;
> +	const struct uvc_format *format;
>  	u32 index = fmt->index;
>  
>  	if (fmt->type != stream->type || fmt->index >= stream->nformats)
> @@ -707,82 +728,8 @@ static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
>  	return 0;
>  }
>  
> -static int uvc_ioctl_enum_fmt_vid_cap(struct file *file, void *fh,
> -				      struct v4l2_fmtdesc *fmt)
> -{
> -	struct uvc_fh *handle = fh;
> -	struct uvc_streaming *stream = handle->stream;
> -
> -	return uvc_ioctl_enum_fmt(stream, fmt);
> -}
> -
> -static int uvc_ioctl_enum_fmt_vid_out(struct file *file, void *fh,
> -				      struct v4l2_fmtdesc *fmt)
> -{
> -	struct uvc_fh *handle = fh;
> -	struct uvc_streaming *stream = handle->stream;
> -
> -	return uvc_ioctl_enum_fmt(stream, fmt);
> -}
> -
> -static int uvc_ioctl_g_fmt_vid_cap(struct file *file, void *fh,
> -				   struct v4l2_format *fmt)
> -{
> -	struct uvc_fh *handle = fh;
> -	struct uvc_streaming *stream = handle->stream;
> -
> -	return uvc_v4l2_get_format(stream, fmt);
> -}
> -
> -static int uvc_ioctl_g_fmt_vid_out(struct file *file, void *fh,
> -				   struct v4l2_format *fmt)
> -{
> -	struct uvc_fh *handle = fh;
> -	struct uvc_streaming *stream = handle->stream;
> -
> -	return uvc_v4l2_get_format(stream, fmt);
> -}
> -
> -static int uvc_ioctl_s_fmt_vid_cap(struct file *file, void *fh,
> -				   struct v4l2_format *fmt)
> -{
> -	struct uvc_fh *handle = fh;
> -	struct uvc_streaming *stream = handle->stream;
> -	int ret;
> -
> -	ret = uvc_acquire_privileges(handle);
> -	if (ret < 0)
> -		return ret;
> -
> -	return uvc_v4l2_set_format(stream, fmt);
> -}
> -
> -static int uvc_ioctl_s_fmt_vid_out(struct file *file, void *fh,
> -				   struct v4l2_format *fmt)
> -{
> -	struct uvc_fh *handle = fh;
> -	struct uvc_streaming *stream = handle->stream;
> -	int ret;
> -
> -	ret = uvc_acquire_privileges(handle);
> -	if (ret < 0)
> -		return ret;
> -
> -	return uvc_v4l2_set_format(stream, fmt);
> -}
> -
> -static int uvc_ioctl_try_fmt_vid_cap(struct file *file, void *fh,
> -				     struct v4l2_format *fmt)
> -{
> -	struct uvc_fh *handle = fh;
> -	struct uvc_streaming *stream = handle->stream;
> -	struct uvc_streaming_control probe;
> -
> -	return uvc_v4l2_try_format(stream, fmt, &probe, NULL, NULL);
> -}
> -
> -static int uvc_ioctl_try_fmt_vid_out(struct file *file, void *fh,
> -				     struct v4l2_format *fmt)
> +static int uvc_ioctl_try_fmt(struct file *file, void *fh,
> +			     struct v4l2_format *fmt)
>  {
>  	struct uvc_fh *handle = fh;
>  	struct uvc_streaming *stream = handle->stream;
> @@ -1212,29 +1159,6 @@ static int uvc_ioctl_g_selection(struct file *file, void *fh,
>  	return 0;
>  }
>  
> -static int uvc_ioctl_g_parm(struct file *file, void *fh,
> -			    struct v4l2_streamparm *parm)
> -{
> -	struct uvc_fh *handle = fh;
> -	struct uvc_streaming *stream = handle->stream;
> -
> -	return uvc_v4l2_get_streamparm(stream, parm);
> -}
> -
> -static int uvc_ioctl_s_parm(struct file *file, void *fh,
> -			    struct v4l2_streamparm *parm)
> -{
> -	struct uvc_fh *handle = fh;
> -	struct uvc_streaming *stream = handle->stream;
> -	int ret;
> -
> -	ret = uvc_acquire_privileges(handle);
> -	if (ret < 0)
> -		return ret;
> -
> -	return uvc_v4l2_set_streamparm(stream, parm);
> -}
> -
>  static int uvc_ioctl_enum_framesizes(struct file *file, void *fh,
>  				     struct v4l2_frmsizeenum *fsize)
>  {
> @@ -1543,15 +1467,17 @@ static unsigned long uvc_v4l2_get_unmapped_area(struct file *file,
>  #endif
>  
>  const struct v4l2_ioctl_ops uvc_ioctl_ops = {
> +	.vidioc_g_fmt_vid_cap = uvc_ioctl_g_fmt,
> +	.vidioc_g_fmt_vid_out = uvc_ioctl_g_fmt,
> +	.vidioc_s_fmt_vid_cap = uvc_ioctl_s_fmt,
> +	.vidioc_s_fmt_vid_out = uvc_ioctl_s_fmt,
> +	.vidioc_g_parm = uvc_ioctl_g_parm,
> +	.vidioc_s_parm = uvc_ioctl_s_parm,
>  	.vidioc_querycap = uvc_ioctl_querycap,
> -	.vidioc_enum_fmt_vid_cap = uvc_ioctl_enum_fmt_vid_cap,
> -	.vidioc_enum_fmt_vid_out = uvc_ioctl_enum_fmt_vid_out,
> -	.vidioc_g_fmt_vid_cap = uvc_ioctl_g_fmt_vid_cap,
> -	.vidioc_g_fmt_vid_out = uvc_ioctl_g_fmt_vid_out,
> -	.vidioc_s_fmt_vid_cap = uvc_ioctl_s_fmt_vid_cap,
> -	.vidioc_s_fmt_vid_out = uvc_ioctl_s_fmt_vid_out,
> -	.vidioc_try_fmt_vid_cap = uvc_ioctl_try_fmt_vid_cap,
> -	.vidioc_try_fmt_vid_out = uvc_ioctl_try_fmt_vid_out,
> +	.vidioc_enum_fmt_vid_cap = uvc_ioctl_enum_fmt,
> +	.vidioc_enum_fmt_vid_out = uvc_ioctl_enum_fmt,
> +	.vidioc_try_fmt_vid_cap = uvc_ioctl_try_fmt,
> +	.vidioc_try_fmt_vid_out = uvc_ioctl_try_fmt,
>  	.vidioc_reqbufs = uvc_ioctl_reqbufs,
>  	.vidioc_querybuf = uvc_ioctl_querybuf,
>  	.vidioc_qbuf = uvc_ioctl_qbuf,
> @@ -1570,8 +1496,6 @@ const struct v4l2_ioctl_ops uvc_ioctl_ops = {
>  	.vidioc_try_ext_ctrls = uvc_ioctl_try_ext_ctrls,
>  	.vidioc_querymenu = uvc_ioctl_querymenu,
>  	.vidioc_g_selection = uvc_ioctl_g_selection,
> -	.vidioc_g_parm = uvc_ioctl_g_parm,
> -	.vidioc_s_parm = uvc_ioctl_s_parm,
>  	.vidioc_enum_framesizes = uvc_ioctl_enum_framesizes,
>  	.vidioc_enum_frameintervals = uvc_ioctl_enum_frameintervals,
>  	.vidioc_subscribe_event = uvc_ioctl_subscribe_event,
> 
> ---
> base-commit: 72ad4ff638047bbbdf3232178fea4bec1f429319
> change-id: 20241127-uvc-dup-cap-out-6a03c01e30a3

-- 
Regards,

Laurent Pinchart

