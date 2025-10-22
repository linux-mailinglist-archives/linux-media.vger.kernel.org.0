Return-Path: <linux-media+bounces-45209-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F05BFACDB
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 10:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C720E4F53B1
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 08:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06EA62FF17B;
	Wed, 22 Oct 2025 08:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EkyytFv1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6241DB375
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 08:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761120568; cv=none; b=FbfYUXdGUcMy6hjThgylha2NnuVRIfOoXXv4sF8esPIrLJOCKS73ZbdIAfaP+o6C4v35nVROk1/A7+I5J2r3GyxToUURCd42ZBbY5Fhhi7U2tm7iTC1R2K4s/2ArlXJCGDYcjEOy97ww9ju45d9ZjZ8zIUTSEbTKMWk7AY5a4Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761120568; c=relaxed/simple;
	bh=t3ccdHaZVAvGPSj5O1WfIlioH7oERGOpDoM1l4CUcSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UGsT1tEUwVZyZLOu450k4sfP7XWErRBNtyjpvJnTvHsVBNcHvYP8KEmDwwP4LxGbdX0Klu0ay8+WzxTP/umjcVloZNnBNAix1qrxXjbSyzJ9jJNIYXrnEHfiTabNrIVWiQsZj6KF54OlFpqJKU+Md1jtnszGVqRjOsbBusBBrAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EkyytFv1; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761120567; x=1792656567;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t3ccdHaZVAvGPSj5O1WfIlioH7oERGOpDoM1l4CUcSk=;
  b=EkyytFv1DtU8uQKFutV3+0xZkLUpSQctzVTk8i8uZrVq+pZrVj+qFr2T
   5+mL6LyZgJNewnvRtC2qkqaah6ReSAYzBou+MayD8AsgpooyLnTw+S46b
   3QpXADablE62uuU73/N8L9dEmFayDgk+ZkmOUUHRH3WneYwBM9AFiJWtK
   LIkZ1gYcMhm4WNPOVGoKCwTSgkJHnPq7YifNJlYmSMhsQ42g58z4GCpkK
   xUVabUvYYC9atO4b+uld8bHrR3s8QX0e+YFNLIy/sXn1CpzTcQB67ZhU/
   g991gVt0bEz/SpDxr53c66tpubZEREYQBb6vI2onSFZ0/ltylW1upaJ9z
   g==;
X-CSE-ConnectionGUID: 4JjCMWB8SNm0VCqxOlyP7w==
X-CSE-MsgGUID: YjLBsfSBSx6HelRqYwiB0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63169987"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="63169987"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 01:09:20 -0700
X-CSE-ConnectionGUID: ES70Y4I4SVKNrl6sc6jXWg==
X-CSE-MsgGUID: x+xe4qsOTiOQnbPdrqDpAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="184293171"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.28])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 01:09:19 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D12A311F87B;
	Wed, 22 Oct 2025 11:09:16 +0300 (EEST)
Date: Wed, 22 Oct 2025 11:09:16 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 09/14] media: omap3isp: better VIDIOC_G/S_PARM handling
Message-ID: <aPiRLPbzWoW4GFXt@kekkonen.localdomain>
References: <cover.1760707611.git.hverkuil+cisco@kernel.org>
 <659149538833acf06f40a5660d03809f9f1c7ef6.1760707611.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <659149538833acf06f40a5660d03809f9f1c7ef6.1760707611.git.hverkuil+cisco@kernel.org>

Hi Hans,

On Fri, Oct 17, 2025 at 03:26:46PM +0200, Hans Verkuil wrote:
> Fix various v4l2-compliance errors relating to timeperframe.
> 
> VIDIOC_G/S_PARM is only supported for Video Output, so disable
> these ioctls for Capture devices.
> 
> Ensure numerator and denominator are never 0.
> 
> Set missing V4L2_CAP_TIMEPERFRAME capability for VIDIOC_S_PARM.
> 
> v4l2-compliance:
> 
> 	fail: v4l2-test-formats.cpp(1388): out->timeperframe.numerator == 0 || out->timeperframe.denominator == 0
> test VIDIOC_G/S_PARM: FAIL
> 
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> ---
>  drivers/media/platform/ti/omap3isp/ispvideo.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
> index 471defa6e7fb..5603586271f5 100644
> --- a/drivers/media/platform/ti/omap3isp/ispvideo.c
> +++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
> @@ -928,7 +928,10 @@ isp_video_set_param(struct file *file, void *fh, struct v4l2_streamparm *a)
>  
>  	if (a->parm.output.timeperframe.denominator == 0)
>  		a->parm.output.timeperframe.denominator = 1;
> +	if (a->parm.output.timeperframe.numerator == 0)
> +		a->parm.output.timeperframe.numerator = 1;

I believe S_PARM support has probably been added for v4l2-compliance in the
past. Should there be either a dummy implementation for more or less all
Media device centric drivers or could this be simply omitted?

>  
> +	a->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
>  	vfh->timeperframe = a->parm.output.timeperframe;
>  
>  	return 0;
> @@ -1413,6 +1416,7 @@ static int isp_video_open(struct file *file)
>  	handle->format.fmt.pix.colorspace = V4L2_COLORSPACE_SRGB;
>  	isp_video_pix_to_mbus(&handle->format.fmt.pix, &fmt);
>  	isp_video_mbus_to_pix(video, &fmt, &handle->format.fmt.pix);
> +	handle->timeperframe.numerator = 1;
>  	handle->timeperframe.denominator = 1;
>  
>  	handle->video = video;
> @@ -1532,12 +1536,15 @@ int omap3isp_video_init(struct isp_video *video, const char *name)
>  	video->video.vfl_type = VFL_TYPE_VIDEO;
>  	video->video.release = video_device_release_empty;
>  	video->video.ioctl_ops = &isp_video_ioctl_ops;
> -	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
>  		video->video.device_caps = V4L2_CAP_VIDEO_CAPTURE
>  					 | V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
> -	else
> +		v4l2_disable_ioctl(&video->video, VIDIOC_S_PARM);
> +		v4l2_disable_ioctl(&video->video, VIDIOC_G_PARM);
> +	} else {
>  		video->video.device_caps = V4L2_CAP_VIDEO_OUTPUT
>  					 | V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
> +	}
>  
>  	video->pipe.stream_state = ISP_PIPELINE_STREAM_STOPPED;
>  

-- 
Kind regards,

Sakari Ailus

