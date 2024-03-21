Return-Path: <linux-media+bounces-7516-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD48F885D96
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 17:36:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 676AB281496
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 16:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5131D79D8;
	Thu, 21 Mar 2024 16:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ehLwwq3G"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2616179C3
	for <linux-media@vger.kernel.org>; Thu, 21 Mar 2024 16:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711039001; cv=none; b=Uv70+hwkt06qtLd+fHA3AMU8p9ZsFJS8Mu0mAC4M5goaYVSXhX+hRuLz5eTFbmX4e6G/VtUOI0TbIPu4gmGM1dPWr21rhQxRMq8NJ8p+G+q5CmrKDSly/digKTv2c0ViWzaDEBSJglAKLWXLYOHY+jmeQR7ZP1ysFoh6Ju19vy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711039001; c=relaxed/simple;
	bh=GNwtSKuYKDni8WuU6I9pyWR6rZlPUACA0BAhctkM0es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WDA2j9KZ8nRibEC8gTusIBSXvUbbh6TPRikjvHMJHjQKhLE6itx69XAhYDKy1bllhh5LgsGEnFOB7tIDcYDWUyoVtkrlokYw5Dnm5CjESN3tv7QQPULWTjm2lXs0wVCqg3TQjAes6ZOxXTMb/p7wy9syoa7h3G8NQ5hVk6bnX7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ehLwwq3G; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 315197E9;
	Thu, 21 Mar 2024 17:36:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711038970;
	bh=GNwtSKuYKDni8WuU6I9pyWR6rZlPUACA0BAhctkM0es=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ehLwwq3GzHep258cBtVGqf6mgqZIA1M5hTfTbfdYI9E6pUfrBJSqWcyOq9kHtsPAy
	 la+JzBy5hs5glNdvT6sMn9ZBfh3gv2cAX3CDYfa7QP1tryYJ8jLNGwH96REm5fbJgD
	 uTCfTM2KYPXG0wF9MBS6wX4GVfLtQgW/Q2pR0alM=
Date: Thu, 21 Mar 2024 18:36:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 20/38] media: ccs: Track streaming state
Message-ID: <20240321163635.GA9582@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-21-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313072516.241106-21-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Mar 13, 2024 at 09:24:58AM +0200, Sakari Ailus wrote:
> With enable_streams and disable_streams, the driver for a device where
> streams are not independently started and stopped needs to maintain state
> information on streams that have been requested to be started. Do that
> now.
> 
> In the future, a helper function in the framework is a desirable way to do
> this instead.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/ccs/ccs-core.c | 13 ++++++++++---
>  drivers/media/i2c/ccs/ccs.h      |  2 +-
>  2 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 9e70946653e9..0cd8ee957655 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -1766,6 +1766,11 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
>  	if (pad != CCS_PAD_SRC)
>  		return -EINVAL;
>  
> +	if (sensor->streaming) {
> +		sensor->streaming |= streams_mask;
> +		return 0;
> +	}
> +
>  	rval = ccs_pm_get_init(sensor);
>  	if (rval)
>  		return rval;
> @@ -1887,7 +1892,7 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
>  
>  	rval = ccs_write(sensor, MODE_SELECT, CCS_MODE_SELECT_STREAMING);
>  
> -	sensor->streaming = true;
> +	sensor->streaming |= streams_mask;
>  
>  	return 0;
>  
> @@ -1909,6 +1914,10 @@ static int ccs_disable_streams(struct v4l2_subdev *subdev,
>  	if (pad != CCS_PAD_SRC)
>  		return -EINVAL;
>  
> +	sensor->streaming &= ~streams_mask;
> +	if (sensor->streaming)
> +		return 0;
> +
>  	rval = ccs_write(sensor, MODE_SELECT, CCS_MODE_SELECT_SOFTWARE_STANDBY);
>  	if (rval)
>  		return rval;
> @@ -1917,7 +1926,6 @@ static int ccs_disable_streams(struct v4l2_subdev *subdev,
>  	if (rval)
>  		dev_err(&client->dev, "post_streamoff quirks failed\n");
>  
> -	sensor->streaming = false;
>  	pm_runtime_mark_last_busy(&client->dev);
>  	pm_runtime_put_autosuspend(&client->dev);
>  
> @@ -3525,7 +3533,6 @@ static int ccs_probe(struct i2c_client *client)
>  		goto out_cleanup;
>  	}
>  
> -	sensor->streaming = false;
>  	sensor->dev_init_done = true;
>  	sensor->handler_setup_needed = true;
>  
> diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
> index 096573845a10..4725e6eca8d0 100644
> --- a/drivers/media/i2c/ccs/ccs.h
> +++ b/drivers/media/i2c/ccs/ccs.h
> @@ -236,7 +236,7 @@ struct ccs_sensor {
>  	u16 image_start; /* image data start line */
>  	u16 visible_pixel_start; /* start pixel of the visible image */
>  
> -	bool streaming;
> +	u8 streaming;
>  	bool dev_init_done;
>  	bool handler_setup_needed;
>  	u8 compressed_min_bpp;

-- 
Regards,

Laurent Pinchart

