Return-Path: <linux-media+bounces-37527-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C40B0226A
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 19:15:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB61EA41E56
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 17:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B1041AF0AF;
	Fri, 11 Jul 2025 17:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SmmsD68t"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C267522A
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 17:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752254146; cv=none; b=jndKkbIsRVPHukScRaMCyD0zFCfyjzFYjeQ7ceu9bfekCvJnjwCVpfhGSBgC2neefWlptghlkOWQgezgGfxxEGji0aPve2B4xdGf6FWzkuHkKQs4tH8RQb0KqLLHjNklVt9xgKoSkeBQZcTymxEctT08dypzd4dqNzb7PnjKYmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752254146; c=relaxed/simple;
	bh=wll3T0fvtO1K0zQLBnxUJxZd2u5L/KsAaMU0cAzv83Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWEVrn7QHGSKsN2jdytG1R7ec2j2jkOlJRwduj54dXUbc+DLms5oq2mA1Uau2w0/vkkjmQUBgb3el2SE1YN/TsKeKt9666QHlHpuVVcA4gld1jf3fUym+fia2wcHyjw0DXWlSQ/g2G2KClnmAfcdKxUHnGkBq5DftNQHER3lT4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SmmsD68t; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B1431D77;
	Fri, 11 Jul 2025 19:15:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752254112;
	bh=wll3T0fvtO1K0zQLBnxUJxZd2u5L/KsAaMU0cAzv83Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SmmsD68tVkzqlYOY0zdvl9BzX81MUeSjH8UUNJM72xI4zVJOqTiBLX2NPH15pz+eo
	 8/QPbrOZJ5Sl2TCAyz9QcJudO9QvbR2JyjK1RLWCt58OiAHYDfYNfygYIrD/zim9IN
	 iVT1RD5iXMfVrQEusE2+B6gmqjrgzd38a471q2pk=
Date: Fri, 11 Jul 2025 20:15:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Use a count variable for meta_formats
 instead of 0 terminating
Message-ID: <20250711171511.GB28533@pendragon.ideasonboard.com>
References: <20250708104622.73237-1-hansg@kernel.org>
 <20250708104622.73237-2-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250708104622.73237-2-hansg@kernel.org>

Hi Hans,

A few comments here. I see you've included this in your pull request
today, so I'll send patch on top. No need for any action on your side
(except perhaps reviewing the patches :-)).

On Tue, Jul 08, 2025 at 12:46:22PM +0200, Hans de Goede wrote:
> The code dealing with the 0 terminated meta_formats array is a bit klunky
> especially for the uvc_meta_v4l2_enum_formats() case.
> 
> Instead of 0 terminating add an unsigned int nmeta_formats member to struct
> uvc_device and use that. This leads to slightly cleaner code.
> 
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> ---
>  drivers/media/usb/uvc/uvc_metadata.c | 21 +++++++++------------
>  drivers/media/usb/uvc/uvcvideo.h     |  4 ++--
>  2 files changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> index 12972527ab8d..229e08ff323e 100644
> --- a/drivers/media/usb/uvc/uvc_metadata.c
> +++ b/drivers/media/usb/uvc/uvc_metadata.c
> @@ -64,17 +64,16 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *fh,
>  	struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
>  	struct uvc_device *dev = stream->dev;
>  	struct v4l2_meta_format *fmt = &format->fmt.meta;
> -	u32 fmeta = fmt->dataformat;
> -	u32 i;
> +	u32 fmeta = V4L2_META_FMT_UVC;
>  
>  	if (format->type != vfh->vdev->queue->type)
>  		return -EINVAL;
>  
> -	for (i = 0; (fmeta != dev->meta_formats[i]) && dev->meta_formats[i];
> -	     i++)
> -		;
> -	if (!dev->meta_formats[i])
> -		fmeta = V4L2_META_FMT_UVC;
> +	for (unsigned int i = 0; i < dev->nmeta_formats; i++)
> +		if (dev->meta_formats[i] == fmt->dataformat) {
> +			fmeta = fmt->dataformat;
> +			break;
> +		}

Missing curcly braces for the for loop.

>  
>  	memset(fmt, 0, sizeof(*fmt));

We can actually drop the memset, as the V4L2 ioctl core already zeroes
fmt->fmt.

>  
> @@ -119,14 +118,12 @@ static int uvc_meta_v4l2_enum_formats(struct file *file, void *fh,
>  	struct v4l2_fh *vfh = file->private_data;
>  	struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
>  	struct uvc_device *dev = stream->dev;
> -	u32 i;
> +	u32 i = fdesc->index;
>  
>  	if (fdesc->type != vfh->vdev->queue->type)
>  		return -EINVAL;
>  
> -	for (i = 0; (i < fdesc->index) && dev->meta_formats[i]; i++)
> -		;
> -	if (!dev->meta_formats[i])
> +	if (i >= dev->nmeta_formats)
>  		return -EINVAL;
>  
>  	memset(fdesc, 0, sizeof(*fdesc));

Same here, we can drop the memset, which will lead to simplifications in
the function.

> @@ -265,7 +262,7 @@ int uvc_meta_init(struct uvc_device *dev)
>  		dev->meta_formats[i++] = V4L2_META_FMT_UVC_MSXU_1_5;
>  
>  	 /* IMPORTANT: for new meta-formats update UVC_MAX_META_DATA_FORMATS. */
> -	dev->meta_formats[i++] = 0;
> +	dev->nmeta_formats = i;
>  
>  	return 0;
>  }
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index b34c1914ff39..757254fc4fe9 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -588,8 +588,8 @@ struct uvc_device {
>  
>  	const struct uvc_device_info *info;
>  
> -	/* Zero-ended list of meta formats */
> -	u32 meta_formats[UVC_MAX_META_DATA_FORMATS + 1];
> +	u32 meta_formats[UVC_MAX_META_DATA_FORMATS];
> +	unsigned int nmeta_formats;
>  
>  	atomic_t nmappings;
>  

-- 
Regards,

Laurent Pinchart

