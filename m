Return-Path: <linux-media+bounces-22470-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CBE9E083D
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 17:17:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D31C0B3799C
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 15:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 643F9207A12;
	Mon,  2 Dec 2024 15:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EYG4Gy9q"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF02F205E23
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 15:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733152167; cv=none; b=GQTG7ivMqgIN6IYCubYh7T4FP7n02r57vcggChm+LKFnD2lOPp2AVSId96oYv+0vVt8//t6xpZj6yx0kHE6A2EI9CdnXbmQEX7o6wZQ7GB0kii/WNHVcYTysJ1VQg52saMv3eAobZf0ZRq7g/ouh2vaeHCZCXiCxUUijef/kfVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733152167; c=relaxed/simple;
	bh=Cpo1GLhQZtLE6Ei3Gd0MgTCc26yTI2b2sBq8PVNxAbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DyQSDnX7JYBSgqnv5xE2Qpja54X/4/pjnZUzXOdm59tPrXvWc2ndwev141a1fvU2Z7BjszDg6sSYRw9IgidgM8oRuzEwK7Ud4UV6GABoLOVuXqalx6lgVWMv+TTCIFkpLsbd8Q6aoia2LZliTQtvFRKRuZCGxz3vdrJHX89ZjMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EYG4Gy9q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733152164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w3JoDr8j8H/mDWqJfxj8rt4kckCv7HnvmSqtlB1v6QE=;
	b=EYG4Gy9qBmii5bK1i84iryyXpwR6zw3EN8KnmrEeXxbAkWHU78XO1a0kVYIYZNzs3bTe5b
	ZPvZU9C4MZIvns6090zbdCPdzLgC5wkuJsV0iSVuJrUbjydTzWL6P7MArRyL08MbjYXeuG
	9kzuUpIt5yJJv1Jvkokiz83XJPwiIU4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-BVXptixUO2KL2XvtfLNWcQ-1; Mon, 02 Dec 2024 10:09:23 -0500
X-MC-Unique: BVXptixUO2KL2XvtfLNWcQ-1
X-Mimecast-MFC-AGG-ID: BVXptixUO2KL2XvtfLNWcQ
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5d0c9bbc6ceso2086884a12.1
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 07:09:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733152162; x=1733756962;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w3JoDr8j8H/mDWqJfxj8rt4kckCv7HnvmSqtlB1v6QE=;
        b=keKF7JfujbGhhtW6co/G0Cd+vAQ5LeE5ro0NyrKWm0KIj5TvRKE9Mw/tMrMQvuDaI5
         NXzv5GpgQ5FKmS5iByLrKcVciLEa1bYUuW+/c59cypPlCxuNMQ9I9PqzhzEkX7T0xPid
         A9LI/IlvpRSmlV/bjs+2vo/DOu8oH2yJ/qKKyXkypK07HPNvSb8fO+3p4GHrQml09Lt+
         +WnJRnOUyJbl6a2+I3WJ4uQ/6c4u76ju82i+R8UwljSlzJJAtNsYJ4CpvW1XoECj8Gc3
         9romtpfkA3aM74DiKnr1zck9/tedgxWX6k3iTVkMmaI5hvbmRNDOfVxhgeLigNLVBEKb
         vflQ==
X-Gm-Message-State: AOJu0YyzA6tE2u4nR5GhV0UI/TbEz1YLqhGHnqJELEgCyjlBGgDJjD+d
	oOzBhXmbO9n9bMNu1+T/z6JoJw87lMMB1lNDqOGfzfiNvgVqBE9PtmjSyqZVjXurjB4XUcel9DT
	W0t5OlOdK6yU+AHD5Av/6NvvTs3gdyYL/xzCtHw7xzF00sYb1rFFnJHCT2jCs
X-Gm-Gg: ASbGncvKerpdPIMfI9aBjNIOXTK2w8EDCpm1SFTydnCFrVC4lCiC60qdVjODItmTyIl
	J6/AsltfDX4MSyrzYg6CzD2lhv1bwSFjzHFF2YXT+S2kEWrl6utbsQQEGlpIPQfLE4IxO3x9q/J
	ORiW8t3//Yk7PC8evs6rHUheAnebyHxAkR0931DmsZWjon12v8CQiJfkHR5p+IBAPsktmDzAt3s
	lYInqyBZWmpJQtLOO+UyWQethajyyzvyHAZxQ2GOtae2gNLW919GQ==
X-Received: by 2002:a17:906:2932:b0:a9a:238a:381d with SMTP id a640c23a62f3a-aa581073eadmr2150698466b.52.1733152161144;
        Mon, 02 Dec 2024 07:09:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGsz+K25a3h1GCaZTkkz1+xGWIAIQSlRxjT04Wug8E0C4OQc+Pgpsa357Gz2PqrzT8O6k9T+A==
X-Received: by 2002:a17:906:2932:b0:a9a:238a:381d with SMTP id a640c23a62f3a-aa581073eadmr2150679366b.52.1733152158937;
        Mon, 02 Dec 2024 07:09:18 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996ddbf0sm518848566b.57.2024.12.02.07.09.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 07:09:18 -0800 (PST)
Message-ID: <8d16fca9-c824-4c0e-a5d3-a7fa0fade3c7@redhat.com>
Date: Mon, 2 Dec 2024 16:09:17 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: uvcvideo: Remove duplicated cap/out code
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241202-uvc-dup-cap-out-v3-1-d40b11bb74b7@chromium.org>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241202-uvc-dup-cap-out-v3-1-d40b11bb74b7@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2-Dec-24 2:37 PM, Ricardo Ribalda wrote:
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

Thank you for your patch.

I have merged this into:

https://gitlab.freedesktop.org/linux-media/users/uvc/-/commits/next/

Regards,

Hans



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
> 
> Best regards,


