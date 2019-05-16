Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE723204F9
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 13:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727558AbfEPLkB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 07:40:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34436 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727515AbfEPLkA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 07:40:00 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EAF4D2FD;
        Thu, 16 May 2019 13:39:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1558006799;
        bh=QQ/Ch1KI6mCuFY2t6hJP5dTeJU+pL+6bKVJIR4tZPxQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nAlAeHauIrB5B5dnElxAIYAi1HE9/f90Dszs+pElRHN4iuxI6RMPx5E3AcKQ97dyx
         Kbi5bfr5fqICGDC62rtJno4qJBXJx3A9I6e09gjmqssMzA4foH5vRNZeL0c2kywsbb
         oZmeTJulYN1w0DuzYtPpyzDTV2gBqRMyJ5l36YFo=
Date:   Thu, 16 May 2019 14:39:42 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Ulrich Hecht <uli@fpond.eu>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: Re: [PATCH v2 5/8] rcar-vin: Move pm_runtime_{get,put} out of helpers
Message-ID: <20190516113942.GD14820@pendragon.ideasonboard.com>
References: <20190516011417.10590-1-niklas.soderlund+renesas@ragnatech.se>
 <20190516011417.10590-6-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190516011417.10590-6-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Thu, May 16, 2019 at 03:14:14AM +0200, Niklas Söderlund wrote:
> The helpers rvin_power_{on,off} deal with both VIN and the parallel
> subdevice power. This makes it hard to merge the Gen2 and Gen3
> open/release functions. Move the VIN power handling directly to the
> open/release functions to prepare for the merge.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 34 +++++++++++++--------
>  1 file changed, 21 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index 71651c5a69483367..5a9658b7d848fc86 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -754,8 +754,6 @@ static int rvin_power_on(struct rvin_dev *vin)
>  	int ret;
>  	struct v4l2_subdev *sd = vin_to_source(vin);
>  
> -	pm_runtime_get_sync(vin->v4l2_dev.dev);
> -
>  	ret = v4l2_subdev_call(sd, core, s_power, 1);
>  	if (ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV)
>  		return ret;
> @@ -768,9 +766,6 @@ static int rvin_power_off(struct rvin_dev *vin)
>  	struct v4l2_subdev *sd = vin_to_source(vin);
>  
>  	ret = v4l2_subdev_call(sd, core, s_power, 0);
> -
> -	pm_runtime_put(vin->v4l2_dev.dev);
> -
>  	if (ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV)
>  		return ret;
>  
> @@ -802,20 +797,31 @@ static int rvin_open(struct file *file)
>  
>  	file->private_data = vin;
>  
> +	ret = pm_runtime_get_sync(vin->dev);

I like operating on vin->dev much more than on vin->v4l2_dev.dev, even
if the two point to the same platform device.

> +	if (ret < 0)
> +		goto err_unlock;

Would it be useful to do this before locking the mutex, as PM runtime
doesn't need to be protected by that lock, to minimise the time spent
with the mutex held ?

> +
>  	ret = v4l2_fh_open(file);
>  	if (ret)
> -		goto unlock;
> +		goto err_pm;
>  
> -	if (!v4l2_fh_is_singular_file(file))
> -		goto unlock;
> -
> -	if (rvin_initialize_device(file)) {
> -		v4l2_fh_release(file);
> -		ret = -ENODEV;
> +	if (v4l2_fh_is_singular_file(file)) {
> +		if (rvin_initialize_device(file)) {
> +			ret = -ENODEV;

Should you propagate the return value of rvin_initialize_device ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +			goto err_open;
> +		}
>  	}
>  
> -unlock:
>  	mutex_unlock(&vin->lock);
> +
> +	return 0;
> +err_open:
> +	v4l2_fh_release(file);
> +err_pm:
> +	pm_runtime_put(vin->dev);
> +err_unlock:
> +	mutex_unlock(&vin->lock);
> +
>  	return ret;
>  }
>  
> @@ -840,6 +846,8 @@ static int rvin_release(struct file *file)
>  	if (fh_singular)
>  		rvin_power_off(vin);
>  
> +	pm_runtime_put(vin->dev);
> +

This one could also be moved after mutex_unlock().

>  	mutex_unlock(&vin->lock);
>  
>  	return ret;

-- 
Regards,

Laurent Pinchart
