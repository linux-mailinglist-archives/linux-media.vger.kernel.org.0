Return-Path: <linux-media+bounces-45207-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE9CBFAC56
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 10:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62B8258058C
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 08:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163ED3002B6;
	Wed, 22 Oct 2025 08:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OfZOAHl8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AFE2FB607
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 08:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761120266; cv=none; b=EAXtCD32trsNkiIXFtKdo/XTeObNIO2M88SwNGGix+9NVMZeGtAwXxNBRKt+Eo/+LmJH0CBeDqK4Srla9kJDXBMLZZnb/ytoyrFqED2jllFQmDF5h9KBPsovkL3VzhVLBIgKEKWK+ZsOUeaHiRrwaHWOCi3d6hWE6nTKTNU9s94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761120266; c=relaxed/simple;
	bh=HQNjqaq0b6bDvhvDMkQj2B+ID+PoV1V87v0frAb8zpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7nDrJDVgqurBl3Mm7GyYRi8dSZy79O+XwA1vzs+GO8PqOrxD4/wI4OHJCE9pm10RGDHJ9nw7IjQtHp3CJ9SO5/CVPBJgGUG+n3iekOYdicWOM4XOrgiYSxzrh/aehCPtGrbuB6TAlzUjQ/S6n1w7hzTeEdBtOOOoYEq72x+t/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OfZOAHl8; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761120264; x=1792656264;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HQNjqaq0b6bDvhvDMkQj2B+ID+PoV1V87v0frAb8zpk=;
  b=OfZOAHl86/bx90owQLryKE8TiAiEYkknOWV12vBQqBljxS8CF9EDBqwU
   DkiJnl2mPL493pDMXTRDnYSeSyxEe5khFih31bOgBzItQxGvKe1YD585M
   yO9ALL9BgheR6qmr8u0+iMOX1L1gwNY+pFsUNhK4CX2tOisnQxGJJN4t6
   bI4+TGBxtnQCXulOnveoEXzkPnelBZGtTUGtNk6NXOgGB7Z2tQwPTVwbP
   4la6EQpq+kZZ3tsbZqLRZCSHb9ahkn5mFxDwilgsgi6SAUWbW5fVDc59O
   GHCr2kdaSOfWpRinSA8KZDbqJB6f9ICBeyW7E9Kto8St3IhwWYMFLqUno
   A==;
X-CSE-ConnectionGUID: YSGbv62zTkeXSkfOQ7gytg==
X-CSE-MsgGUID: u7w1ee96T+GMcUije32EOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63169502"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="63169502"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 01:04:23 -0700
X-CSE-ConnectionGUID: XSbYO4rZSwO0Nht5yiAkRg==
X-CSE-MsgGUID: 6L46fF6oTvyaYRE+C0BjzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="183016995"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.28])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 01:04:22 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8746611F87B;
	Wed, 22 Oct 2025 11:04:19 +0300 (EEST)
Date: Wed, 22 Oct 2025 11:04:19 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 07/14] media: omap3isp: rework isp_video_try/set_format
Message-ID: <aPiQAwEa4_fN-LIt@kekkonen.localdomain>
References: <cover.1760707611.git.hverkuil+cisco@kernel.org>
 <679d80346bef43fab642342ab9de407c132b62ed.1760707611.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <679d80346bef43fab642342ab9de407c132b62ed.1760707611.git.hverkuil+cisco@kernel.org>

Hi Hans,

On Fri, Oct 17, 2025 at 03:26:44PM +0200, Hans Verkuil wrote:
> isp_video_set_format now calls isp_video_try_format first, ensuring
> consistent behavior and removing duplicate code in both functions.
> 
> This fixes an v4l2-compliance error:
> 
> 	fail: v4l2-test-formats.cpp(519): !pix.sizeimage
> test VIDIOC_S_FMT: FAIL
> 
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> ---
>  drivers/media/platform/ti/omap3isp/ispvideo.c | 60 +++++++++----------
>  1 file changed, 30 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
> index d3fe28506fb0..69d17e4dcd36 100644
> --- a/drivers/media/platform/ti/omap3isp/ispvideo.c
> +++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
> @@ -701,11 +701,15 @@ isp_video_get_format(struct file *file, void *fh, struct v4l2_format *format)
>  }
>  
>  static int
> -isp_video_set_format(struct file *file, void *fh, struct v4l2_format *format)
> +isp_video_try_format(struct file *file, void *fh, struct v4l2_format *format)
>  {
> -	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
>  	struct isp_video *video = video_drvdata(file);
> -	struct v4l2_mbus_framefmt fmt;
> +	struct v4l2_subdev_format fmt = {
> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +	};
> +	struct v4l2_subdev *subdev;
> +	u32 pad;
> +	int ret;
>  
>  	if (format->type != video->type)
>  		return -EINVAL;
> @@ -745,32 +749,11 @@ isp_video_set_format(struct file *file, void *fh, struct v4l2_format *format)
>  		break;
>  	}
>  
> -	/* Fill the bytesperline and sizeimage fields by converting to media bus
> -	 * format and back to pixel format.
> -	 */
> -	isp_video_pix_to_mbus(&format->fmt.pix, &fmt);
> -	isp_video_mbus_to_pix(video, &fmt, &format->fmt.pix);
> -
> -	mutex_lock(&video->mutex);
> -	vfh->format = *format;
> -	mutex_unlock(&video->mutex);
> -
> -	return 0;
> -}
> -
> -static int
> -isp_video_try_format(struct file *file, void *fh, struct v4l2_format *format)
> -{
> -	struct isp_video *video = video_drvdata(file);
> -	struct v4l2_subdev_format fmt = {
> -		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> -	};
> -	struct v4l2_subdev *subdev;
> -	u32 pad;
> -	int ret;
> -
> -	if (format->type != video->type)
> -		return -EINVAL;
> +	if (video->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) {
> +		isp_video_pix_to_mbus(&format->fmt.pix, &fmt.format);
> +		isp_video_mbus_to_pix(video, &fmt.format, &format->fmt.pix);
> +		return 0;
> +	}
>  
>  	subdev = isp_video_remote_subdev(video, &pad);
>  	if (subdev == NULL)
> @@ -781,12 +764,29 @@ isp_video_try_format(struct file *file, void *fh, struct v4l2_format *format)
>  	fmt.pad = pad;
>  	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
>  	if (ret)
> -		return ret == -ENOIOCTLCMD ? -ENOTTY : ret;
> +		return ret == -ENOIOCTLCMD ? -EINVAL : ret;

I believe -ENOTTY was right. Yet this should not happen (albeit I haven't
checked) as all omap3isp sub-device drivers with connected video devices
presumably implement get_fmt.

>  
>  	isp_video_mbus_to_pix(video, &fmt.format, &format->fmt.pix);
>  	return 0;
>  }
>  
> +static int
> +isp_video_set_format(struct file *file, void *fh, struct v4l2_format *format)
> +{
> +	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
> +	struct isp_video *video = video_drvdata(file);
> +	int ret = isp_video_try_format(file, fh, format);

I'd do this assignment separately: initialising variables in declaration
that requires error handling isn't very nice.

> +
> +	if (ret)
> +		return ret;
> +
> +	mutex_lock(&video->mutex);
> +	vfh->format = *format;
> +	mutex_unlock(&video->mutex);
> +
> +	return 0;
> +}
> +
>  static int
>  isp_video_get_selection(struct file *file, void *fh, struct v4l2_selection *sel)
>  {

-- 
Kind regards,

Sakari Ailus

