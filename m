Return-Path: <linux-media+bounces-7521-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 04600885EE9
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 17:58:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB6871F22F74
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 16:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E500013173E;
	Thu, 21 Mar 2024 16:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Tx2unpTy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67901332AC
	for <linux-media@vger.kernel.org>; Thu, 21 Mar 2024 16:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711039875; cv=none; b=oTtYrcYEwsoQhZAAyMM15BC5NtTWaGnAa/wR5CuXJGkL1jjAeZm/EW+nvNRVMm4Ys1380hbIFPgvmg5JiAIU3Jiokgz9QFTbthyXQ2pI58ZLoiu74/XrTdWr4Fw3x7kZOtfLe+1BoAsGy2HHzwt//gbTS1T+5qG10cIdY1LOQzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711039875; c=relaxed/simple;
	bh=IL8cGuf/JNWCQvjd1O6LrvUhRqUjWHmhp1aVIj6reb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MCQsWw4tnz4L/dz/DaDjvZxt8OA4Dyhk9P7LVDiqwJNt4XOxWew1ZsHogGSZPe9QAyZWrtkmBtJzPv55jiBn4n/k2Y0AJlO+gdKnKhAj5L7aeMEPiARMEYw1hTa+LJ1YXwvzMaHOcj57btWjRpGYurOsHkFMXxj68IMITErvyF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Tx2unpTy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A00F5672;
	Thu, 21 Mar 2024 17:50:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711039843;
	bh=IL8cGuf/JNWCQvjd1O6LrvUhRqUjWHmhp1aVIj6reb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tx2unpTyToM2u4MIJeN6Wshw6ENkFSHuwZr5TIJwKPPaLXxz428emf5PRQhZ03Oxs
	 uIODd7hS3IfV+DGPLDIJg1IYwtBMbeirWejFIwFORb4x6h2LkQocm/c5T0btwooRQj
	 AcxI1ZRuKsEiCsiGCazhgXXCUODmL0mdJyhz+gBw=
Date: Thu, 21 Mar 2024 18:51:08 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 31/38] media: uapi: v4l: subdev: Enable streams API
Message-ID: <20240321165108.GE9582@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-32-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313072516.241106-32-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Mar 13, 2024 at 09:25:09AM +0200, Sakari Ailus wrote:
> Remove v4l2_subdev_enable_streams_api variable that was used to easily
> enable streams API for development, and conditions that use the variable.
> 
> This patch enables the streams API for V4L2 sub-device interface which
> allows transporting multiple streams on a single MC link.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

The patch itself looks good, but I'll only send my Rb when I'll be
confident the API is stable :-)

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 30 ---------------------------
>  1 file changed, 30 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index c8c435df92c8..b3a697df4b66 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -26,15 +26,6 @@
>  #include <media/v4l2-fh.h>
>  #include <media/v4l2-ioctl.h>
>  
> -#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> -/*
> - * The Streams API is an experimental feature. To use the Streams API, set
> - * 'v4l2_subdev_enable_streams_api' to 1 below.
> - */
> -
> -static bool v4l2_subdev_enable_streams_api;
> -#endif
> -
>  /*
>   * Maximum stream ID is 63 for now, as we use u64 bitmask to represent a set
>   * of streams.
> @@ -570,13 +561,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  				       V4L2_SUBDEV_CLIENT_CAP_STREAMS;
>  	int rval;
>  
> -	/*
> -	 * If the streams API is not enabled, remove V4L2_SUBDEV_CAP_STREAMS.
> -	 * Remove this when the API is no longer experimental.
> -	 */
> -	if (!v4l2_subdev_enable_streams_api)
> -		streams_subdev = false;
> -
>  	switch (cmd) {
>  	case VIDIOC_SUBDEV_QUERYCAP: {
>  		struct v4l2_subdev_capability *cap = arg;
> @@ -916,9 +900,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		struct v4l2_subdev_krouting krouting = {};
>  		unsigned int i;
>  
> -		if (!v4l2_subdev_enable_streams_api)
> -			return -ENOIOCTLCMD;
> -
>  		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
>  			return -ENOIOCTLCMD;
>  
> @@ -989,9 +970,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		struct v4l2_subdev_routing *routing = arg;
>  		struct v4l2_subdev_krouting *krouting;
>  
> -		if (!v4l2_subdev_enable_streams_api)
> -			return -ENOIOCTLCMD;
> -
>  		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
>  			return -ENOIOCTLCMD;
>  
> @@ -1019,14 +997,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  	case VIDIOC_SUBDEV_S_CLIENT_CAP: {
>  		struct v4l2_subdev_client_capability *client_cap = arg;
>  
> -		/*
> -		 * Clear V4L2_SUBDEV_CLIENT_CAP_STREAMS if streams API is not
> -		 * enabled. Remove this when streams API is no longer
> -		 * experimental.
> -		 */
> -		if (!v4l2_subdev_enable_streams_api)
> -			client_cap->capabilities &= ~V4L2_SUBDEV_CLIENT_CAP_STREAMS;
> -
>  		/* Filter out unsupported capabilities */
>  		client_cap->capabilities &= (V4L2_SUBDEV_CLIENT_CAP_STREAMS |
>  					     V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH);

-- 
Regards,

Laurent Pinchart

