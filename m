Return-Path: <linux-media+bounces-21863-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB6F9D6BA7
	for <lists+linux-media@lfdr.de>; Sat, 23 Nov 2024 22:32:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92D44281589
	for <lists+linux-media@lfdr.de>; Sat, 23 Nov 2024 21:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03EE1836D9;
	Sat, 23 Nov 2024 21:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nCvxc3oA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23E1158DA3;
	Sat, 23 Nov 2024 21:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732397543; cv=none; b=tcoWjs9ia0OwUjp5FA1cRfx2++DMepQI1deK6Srfdv0ehbSPnKuu59GdWwOsZmmnD2HG1LmMBYDf1+cMTXWiGNKJj/5XIUrzrmBLnFuaMDNW7WxrYvVsVYVywM87prZUMX6s024hkQN5uTrbq8FzLq5L2appTYxw2OW9XLYYdjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732397543; c=relaxed/simple;
	bh=pwLkUZGl5gZHToFhGMEPJsWKLyGGNGJ+ubZ7Yvq9Jps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XkD/artoTOnDs2CEkJpSQlcI9EhRyoqpP2q37be/VbUF0QXpVQxjsnBUrk6lfCovnP4VQvU8+JkkoNj0dd/DrEBElsUyCJ4URkpS1jCqdB2/VKX7V+uwtlc/55gBfl+/M5lU6rwX/W/mIMx0Ke792fbYFSw8DJD6TQ3/JYX0FF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nCvxc3oA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D73AC594;
	Sat, 23 Nov 2024 22:31:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732397513;
	bh=pwLkUZGl5gZHToFhGMEPJsWKLyGGNGJ+ubZ7Yvq9Jps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nCvxc3oAvG+PCL9p1R6Z/KLtnctJ39sVX4BZRxRRFcpCo0JNmBcA9yWmYqTLRRFgM
	 RvqNJJm3Axw3vn3k94MMy/nXeLO8CVJqNSWnu69P4Hbbcq9SSKCpbQ7nmOnIFmQojv
	 MGHjLF817l85oYLbYSbcoj6TB7Yy6WPidozcFf7c=
Date: Sat, 23 Nov 2024 23:32:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l: subdev: Use dev_err() to print errors and
 clarify
Message-ID: <20241123213203.GC19573@pendragon.ideasonboard.com>
References: <20241122153343.237308-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122153343.237308-1-demonsingur@gmail.com>

Hi Cosmin,

On Fri, Nov 22, 2024 at 05:33:39PM +0200, Cosmin Tanislav wrote:
> The error values end up being returned to userspace, it makes sense to
> have some useful information printed when debugging them, even if the
> reason for the errors are bad configs or internal driver issues.
> 
> Replace dev_dbg() with dev_err() for errors.

We use dev_dbg() on purpose for all errors that can be triggered
directly by applications. This includes in particular all pipeline
validation errors.

The error paths in this specific patch shouldn't be in that category, as
all the validation should have been performed before starting subdevs
(assuming all drivers are correctly implemented, which is of course not
a given, but those issues should be fixed). I think we could therefore
switch to dev_err() here. However, I'm wondering what kind of issues
triggered this patch. What errors did you run into that would have
benefited from being reported more loudly, and were they caused by
driver bugs or userspace misconfiguring the device ?

> Also, when using complex pipelines with multiple bridges between the
> video device and multiple source sub devices, printing just the video
> device name for each error does not provide enough context as to which
> operation failed.
> 
> Add sub device entity name to the messages where possible to clarify the
> source of the errors.

This can be considered as a standalone patch.

> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 4f0eecd7fd66f..d51b4594d11c5 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -2303,20 +2303,21 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
>  				    &found_streams, &enabled_streams);
>  
>  	if (found_streams != streams_mask) {
> -		dev_dbg(dev, "streams 0x%llx not found on %s:%u\n",
> +		dev_err(dev, "streams 0x%llx not found on %s:%u\n",
>  			streams_mask & ~found_streams, sd->entity.name, pad);
>  		ret = -EINVAL;
>  		goto done;
>  	}
>  
>  	if (enabled_streams) {
> -		dev_dbg(dev, "streams 0x%llx already enabled on %s:%u\n",
> +		dev_err(dev, "streams 0x%llx already enabled on %s:%u\n",
>  			enabled_streams, sd->entity.name, pad);
>  		ret = -EALREADY;
>  		goto done;
>  	}
>  
> -	dev_dbg(dev, "enable streams %u:%#llx\n", pad, streams_mask);
> +	dev_dbg(dev, "enable streams %s:%u:%#llx\n",
> +		sd->entity.name, pad, streams_mask);
>  
>  	already_streaming = v4l2_subdev_is_streaming(sd);
>  
> @@ -2333,8 +2334,8 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
>  	}
>  
>  	if (ret) {
> -		dev_dbg(dev, "enable streams %u:%#llx failed: %d\n", pad,
> -			streams_mask, ret);
> +		dev_err(dev, "enable streams %s:%u:%#llx failed: %d\n",
> +			sd->entity.name, pad, streams_mask, ret);
>  		goto done;
>  	}
>  
> @@ -2403,20 +2404,21 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
>  				    &found_streams, &enabled_streams);
>  
>  	if (found_streams != streams_mask) {
> -		dev_dbg(dev, "streams 0x%llx not found on %s:%u\n",
> +		dev_err(dev, "streams 0x%llx not found on %s:%u\n",
>  			streams_mask & ~found_streams, sd->entity.name, pad);
>  		ret = -EINVAL;
>  		goto done;
>  	}
>  
>  	if (enabled_streams != streams_mask) {
> -		dev_dbg(dev, "streams 0x%llx already disabled on %s:%u\n",
> +		dev_err(dev, "streams 0x%llx already disabled on %s:%u\n",
>  			streams_mask & ~enabled_streams, sd->entity.name, pad);
>  		ret = -EALREADY;
>  		goto done;
>  	}
>  
> -	dev_dbg(dev, "disable streams %u:%#llx\n", pad, streams_mask);
> +	dev_dbg(dev, "disable streams %s:%u:%#llx\n",
> +		sd->entity.name, pad, streams_mask);
>  
>  	if (!use_s_stream) {
>  		/* Call the .disable_streams() operation. */
> @@ -2432,8 +2434,8 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
>  	}
>  
>  	if (ret) {
> -		dev_dbg(dev, "disable streams %u:%#llx failed: %d\n", pad,
> -			streams_mask, ret);
> +		dev_err(dev, "disable streams %s:%u:%#llx failed: %d\n",
> +			sd->entity.name, pad, streams_mask, ret);
>  		goto done;
>  	}
>  

-- 
Regards,

Laurent Pinchart

