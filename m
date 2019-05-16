Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 310F420640
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 13:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727447AbfEPLs5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 07:48:57 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34700 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727817AbfEPLsy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 07:48:54 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA0672FD;
        Thu, 16 May 2019 13:48:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1558007331;
        bh=s7hLWlBo7amBJq1P8APfOipBJL4XakYbg9xTS8jsnPI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pld/BfU2z4RaH7vQ2uujGMa425AsxcMjBA66R6iZWHzq0VYUCUs04llHlsofBVGpt
         Kyo4hIYryfa5FqlM9wwNroRybVTQgmCopc2OYUyuPSot6CjlE+XP2b/6TU7AYtY4r6
         vTQq0LG0awjc7dFBQafb4pV2ago7Ev5avFnUndk0=
Date:   Thu, 16 May 2019 14:48:34 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Ulrich Hecht <uli@fpond.eu>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: Re: [PATCH v2 8/8] rcar-vin: Merge Gen2 and Gen3 file operations
Message-ID: <20190516114834.GG14820@pendragon.ideasonboard.com>
References: <20190516011417.10590-1-niklas.soderlund+renesas@ragnatech.se>
 <20190516011417.10590-9-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190516011417.10590-9-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Thu, May 16, 2019 at 03:14:17AM +0200, Niklas Söderlund wrote:
> After the rework of the Gen2 file operations it's now trivial to merge
> the Gen2 and Gen3 versions.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 96 ++++-----------------
>  1 file changed, 16 insertions(+), 80 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index 169639416121f204..8e4afa4278fe9d30 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -781,14 +781,19 @@ static int rvin_open(struct file *file)
>  	if (ret)
>  		goto err_pm;
>  
> -	if (v4l2_fh_is_singular_file(file)) {
> -		ret = rvin_power_parallel(vin, true);
> +	if (vin->info->use_mc) {
> +		ret = v4l2_pipeline_pm_use(&vin->vdev.entity, 1);
>  		if (ret < 0)
>  			goto err_open;
> +	} else {
> +		if (v4l2_fh_is_singular_file(file)) {
> +			ret = rvin_power_parallel(vin, true);
> +			if (ret < 0)
> +				goto err_open;
>  
> -		v4l2_ctrl_handler_setup(&vin->ctrl_handler);
> +			v4l2_ctrl_handler_setup(&vin->ctrl_handler);
> +		}
>  	}

I wonder if you shouldn't abstract the first open init and last close
cleanup operations in separate functions, with MC and non-MC variants,
as you will need to handle the v4l2_ctrl_handler_setup() failure here,
making error handling more complex.

> -
>  	mutex_unlock(&vin->lock);
>  
>  	return 0;
> @@ -816,12 +821,12 @@ static int rvin_release(struct file *file)
>  	/* the release helper will cleanup any on-going streaming */
>  	ret = _vb2_fop_release(file, NULL);
>  
> -	/*
> -	 * If this was the last open file.
> -	 * Then de-initialize hw module.
> -	 */
> -	if (fh_singular)
> -		rvin_power_parallel(vin, false);
> +	if (vin->info->use_mc) {
> +		v4l2_pipeline_pm_use(&vin->vdev.entity, 0);
> +	} else {
> +		if (fh_singular)
> +			rvin_power_parallel(vin, false);
> +	}
>  
>  	pm_runtime_put(vin->dev);
>  
> @@ -840,74 +845,6 @@ static const struct v4l2_file_operations rvin_fops = {
>  	.read		= vb2_fop_read,
>  };
>  
> -/* -----------------------------------------------------------------------------
> - * Media controller file operations
> - */
> -
> -static int rvin_mc_open(struct file *file)
> -{
> -	struct rvin_dev *vin = video_drvdata(file);
> -	int ret;
> -
> -	ret = mutex_lock_interruptible(&vin->lock);
> -	if (ret)
> -		return ret;
> -
> -	ret = pm_runtime_get_sync(vin->dev);
> -	if (ret < 0)
> -		goto err_unlock;
> -
> -	ret = v4l2_pipeline_pm_use(&vin->vdev.entity, 1);
> -	if (ret < 0)
> -		goto err_pm;
> -
> -	file->private_data = vin;
> -
> -	ret = v4l2_fh_open(file);
> -	if (ret)
> -		goto err_v4l2pm;
> -
> -	mutex_unlock(&vin->lock);
> -
> -	return 0;
> -err_v4l2pm:
> -	v4l2_pipeline_pm_use(&vin->vdev.entity, 0);
> -err_pm:
> -	pm_runtime_put(vin->dev);
> -err_unlock:
> -	mutex_unlock(&vin->lock);
> -
> -	return ret;
> -}
> -
> -static int rvin_mc_release(struct file *file)
> -{
> -	struct rvin_dev *vin = video_drvdata(file);
> -	int ret;
> -
> -	mutex_lock(&vin->lock);
> -
> -	/* the release helper will cleanup any on-going streaming. */
> -	ret = _vb2_fop_release(file, NULL);
> -
> -	v4l2_pipeline_pm_use(&vin->vdev.entity, 0);
> -	pm_runtime_put(vin->dev);
> -
> -	mutex_unlock(&vin->lock);
> -
> -	return ret;
> -}
> -
> -static const struct v4l2_file_operations rvin_mc_fops = {
> -	.owner		= THIS_MODULE,
> -	.unlocked_ioctl	= video_ioctl2,
> -	.open		= rvin_mc_open,
> -	.release	= rvin_mc_release,
> -	.poll		= vb2_fop_poll,
> -	.mmap		= vb2_fop_mmap,
> -	.read		= vb2_fop_read,
> -};
> -
>  void rvin_v4l2_unregister(struct rvin_dev *vin)
>  {
>  	if (!video_is_registered(&vin->vdev))
> @@ -948,6 +885,7 @@ int rvin_v4l2_register(struct rvin_dev *vin)
>  	snprintf(vdev->name, sizeof(vdev->name), "VIN%u output", vin->id);
>  	vdev->release = video_device_release_empty;
>  	vdev->lock = &vin->lock;
> +	vdev->fops = &rvin_fops;
>  	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
>  		V4L2_CAP_READWRITE;
>  
> @@ -959,10 +897,8 @@ int rvin_v4l2_register(struct rvin_dev *vin)
>  	vin->format.colorspace = RVIN_DEFAULT_COLORSPACE;
>  
>  	if (vin->info->use_mc) {
> -		vdev->fops = &rvin_mc_fops;
>  		vdev->ioctl_ops = &rvin_mc_ioctl_ops;
>  	} else {
> -		vdev->fops = &rvin_fops;
>  		vdev->ioctl_ops = &rvin_ioctl_ops;
>  		rvin_reset_format(vin);
>  	}

-- 
Regards,

Laurent Pinchart
