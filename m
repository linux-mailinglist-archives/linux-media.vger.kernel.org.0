Return-Path: <linux-media+bounces-7514-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E56D885D50
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 17:21:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8782CB22A0C
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 16:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C0812CD8F;
	Thu, 21 Mar 2024 16:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EiwkjJV3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3A312CD8C
	for <linux-media@vger.kernel.org>; Thu, 21 Mar 2024 16:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711038088; cv=none; b=gCj9pOv5v2jPeLv4gGrEaCvX7WndCFO6dyFeKTyz8gFHT8b4FUhN/HwnI5MPGcq7mV7Za+1b6Bm05AnEmI0BthpQ3ustfZJ9gWGN+mRPf2D+TxjirSJv2SGCuHjwNYcZF0CAGLWMmgV7GLUbOKNFykZ+NBylFHdVEVnDgZMw1rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711038088; c=relaxed/simple;
	bh=pGJMO0unieV6WDIhRllJQjfcz7CNQ7l2UM9wQmWXl24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WEA7yrtBJtk8cMhI9YenNqNwKPbbLHUUPYSnqssb68wtcBu+J9SJHSztGUX+9HdccCpCZF9cMq7WgT1KzW8NWDpe2uHsUSkrvzmQJmaWfB+qKZ4U86vmi172PafJkqlyON3RzEh7SGGY4D6Xt5LOhnMtM04ME63tTJiSGBC1XOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EiwkjJV3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 570427E9;
	Thu, 21 Mar 2024 17:20:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711038055;
	bh=pGJMO0unieV6WDIhRllJQjfcz7CNQ7l2UM9wQmWXl24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EiwkjJV3a+IkQJgVceJVr8FJEJ6mhnMTB7mKQFrhovJv/2Gjfu/377He6p2xP1Ezs
	 l+y6mcVwiFiaPcjVMC8zOULpups2LFNZZi2jJ8Adh7tyessNI9Fa8bGXPjajGktNCZ
	 bifj0kwevEtwLnoCnRmoGAXyw0u0dn+zvvcovXbc=
Date: Thu, 21 Mar 2024 18:21:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 19/38] media: ccs: Use {enable,disable}_streams
 operations
Message-ID: <20240321162120.GW8501@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-20-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313072516.241106-20-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Mar 13, 2024 at 09:24:57AM +0200, Sakari Ailus wrote:
> Switch from s_stream() video op to enable_streams() and disable_streams()
> pad operations. They are preferred and required for streams support.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ccs/ccs-core.c | 187 +++++++++++++++----------------
>  1 file changed, 88 insertions(+), 99 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 671540a8ab6a..9e70946653e9 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -1715,22 +1715,66 @@ static int ccs_power_off(struct device *dev)
>  }
>  
>  /* -----------------------------------------------------------------------------
> - * Video stream management
> + * V4L2 subdev video operations
>   */
>  
> -static int ccs_start_streaming(struct ccs_sensor *sensor)
> +static int ccs_pm_get_init(struct ccs_sensor *sensor)

This patch would have been easier to review if you had moved the
function in a separate patch.

> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
> +	int rval;
> +
> +	/*
> +	 * It can't use pm_runtime_resume_and_get() here, as the driver
> +	 * relies at the returned value to detect if the device was already
> +	 * active or not.
> +	 */
> +	rval = pm_runtime_get_sync(&client->dev);
> +	if (rval < 0)
> +		goto error;
> +
> +	/* Device was already active, so don't set controls */
> +	if (rval == 1 && !sensor->handler_setup_needed)
> +		return 0;
> +
> +	sensor->handler_setup_needed = false;
> +
> +	/* Restore V4L2 controls to the previously suspended device */
> +	rval = __v4l2_ctrl_handler_setup(&sensor->pixel_array->ctrl_handler);
> +	if (rval)
> +		goto error;
> +
> +	rval = __v4l2_ctrl_handler_setup(&sensor->src->ctrl_handler);
> +	if (rval)
> +		goto error;
> +
> +	/* Keep PM runtime usage_count incremented on success */
> +	return 0;

Missing blank line.

> +error:
> +	pm_runtime_put(&client->dev);
> +	return rval;
> +}
> +
> +static int ccs_enable_streams(struct v4l2_subdev *subdev,
> +			      struct v4l2_subdev_state *state, u32 pad,
> +			      u64 streams_mask)
>  {
> +	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
>  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
>  	unsigned int binning_mode;
>  	int rval;
>  
> -	mutex_lock(&sensor->mutex);
> +	if (pad != CCS_PAD_SRC)
> +		return -EINVAL;
> +
> +	rval = ccs_pm_get_init(sensor);
> +	if (rval)
> +		return rval;
>  
>  	rval = ccs_write(sensor, CSI_DATA_FORMAT,
>  			 (sensor->csi_format->width << 8) |
>  			 sensor->csi_format->compressed);
>  	if (rval)
> -		goto out;
> +		goto err_pm_put;

You could also have renamed the error label separately :-)

>  
>  	/* Binning configuration */
>  	if (sensor->binning_horizontal == 1 &&
> @@ -1743,38 +1787,38 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
>  
>  		rval = ccs_write(sensor, BINNING_TYPE, binning_type);
>  		if (rval < 0)
> -			goto out;
> +			goto err_pm_put;
>  
>  		binning_mode = 1;
>  	}
>  	rval = ccs_write(sensor, BINNING_MODE, binning_mode);
>  	if (rval < 0)
> -		goto out;
> +		goto err_pm_put;
>  
>  	/* Set up PLL */
>  	rval = ccs_pll_configure(sensor);
>  	if (rval)
> -		goto out;
> +		goto err_pm_put;
>  
>  	/* Analog crop start coordinates */
>  	rval = ccs_write(sensor, X_ADDR_START, sensor->pa_src.left);
>  	if (rval < 0)
> -		goto out;
> +		goto err_pm_put;
>  
>  	rval = ccs_write(sensor, Y_ADDR_START, sensor->pa_src.top);
>  	if (rval < 0)
> -		goto out;
> +		goto err_pm_put;
>  
>  	/* Analog crop end coordinates */
>  	rval = ccs_write(sensor, X_ADDR_END,
>  			 sensor->pa_src.left + sensor->pa_src.width - 1);
>  	if (rval < 0)
> -		goto out;
> +		goto err_pm_put;
>  
>  	rval = ccs_write(sensor, Y_ADDR_END,
>  			 sensor->pa_src.top + sensor->pa_src.height - 1);
>  	if (rval < 0)
> -		goto out;
> +		goto err_pm_put;
>  
>  	/*
>  	 * Output from pixel array, including blanking, is set using
> @@ -1787,22 +1831,22 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
>  		rval = ccs_write(sensor, DIGITAL_CROP_X_OFFSET,
>  				 sensor->scaler_sink.left);
>  		if (rval < 0)
> -			goto out;
> +			goto err_pm_put;
>  
>  		rval = ccs_write(sensor, DIGITAL_CROP_Y_OFFSET,
>  				 sensor->scaler_sink.top);
>  		if (rval < 0)
> -			goto out;
> +			goto err_pm_put;
>  
>  		rval = ccs_write(sensor, DIGITAL_CROP_IMAGE_WIDTH,
>  				 sensor->scaler_sink.width);
>  		if (rval < 0)
> -			goto out;
> +			goto err_pm_put;
>  
>  		rval = ccs_write(sensor, DIGITAL_CROP_IMAGE_HEIGHT,
>  				 sensor->scaler_sink.height);
>  		if (rval < 0)
> -			goto out;
> +			goto err_pm_put;
>  	}
>  
>  	/* Scaling */
> @@ -1810,20 +1854,20 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
>  	    != CCS_SCALING_CAPABILITY_NONE) {
>  		rval = ccs_write(sensor, SCALING_MODE, sensor->scaling_mode);
>  		if (rval < 0)
> -			goto out;
> +			goto err_pm_put;
>  
>  		rval = ccs_write(sensor, SCALE_M, sensor->scale_m);
>  		if (rval < 0)
> -			goto out;
> +			goto err_pm_put;
>  	}
>  
>  	/* Output size from sensor */
>  	rval = ccs_write(sensor, X_OUTPUT_SIZE, sensor->src_src.width);
>  	if (rval < 0)
> -		goto out;
> +		goto err_pm_put;
>  	rval = ccs_write(sensor, Y_OUTPUT_SIZE, sensor->src_src.height);
>  	if (rval < 0)
> -		goto out;
> +		goto err_pm_put;
>  
>  	if (CCS_LIM(sensor, FLASH_MODE_CAPABILITY) &
>  	    (CCS_FLASH_MODE_CAPABILITY_SINGLE_STROBE |
> @@ -1832,111 +1876,52 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
>  	    sensor->hwcfg.strobe_setup->trigger != 0) {
>  		rval = ccs_setup_flash_strobe(sensor);
>  		if (rval)
> -			goto out;
> +			goto err_pm_put;
>  	}
>  
>  	rval = ccs_call_quirk(sensor, pre_streamon);
>  	if (rval) {
>  		dev_err(&client->dev, "pre_streamon quirks failed\n");
> -		goto out;
> +		goto err_pm_put;
>  	}
>  
>  	rval = ccs_write(sensor, MODE_SELECT, CCS_MODE_SELECT_STREAMING);
>  
> -out:
> -	mutex_unlock(&sensor->mutex);
> -
> -	return rval;
> -}
> -
> -static int ccs_stop_streaming(struct ccs_sensor *sensor)
> -{
> -	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
> -	int rval;
> -
> -	mutex_lock(&sensor->mutex);
> -	rval = ccs_write(sensor, MODE_SELECT, CCS_MODE_SELECT_SOFTWARE_STANDBY);
> -	if (rval)
> -		goto out;
> -
> -	rval = ccs_call_quirk(sensor, post_streamoff);
> -	if (rval)
> -		dev_err(&client->dev, "post_streamoff quirks failed\n");
> -
> -out:
> -	mutex_unlock(&sensor->mutex);
> -	return rval;
> -}
> -
> -/* -----------------------------------------------------------------------------
> - * V4L2 subdev video operations
> - */
> -
> -static int ccs_pm_get_init(struct ccs_sensor *sensor)
> -{
> -	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
> -	int rval;
> -
> -	/*
> -	 * It can't use pm_runtime_resume_and_get() here, as the driver
> -	 * relies at the returned value to detect if the device was already
> -	 * active or not.
> -	 */
> -	rval = pm_runtime_get_sync(&client->dev);
> -	if (rval < 0)
> -		goto error;
> -
> -	/* Device was already active, so don't set controls */
> -	if (rval == 1 && !sensor->handler_setup_needed)
> -		return 0;
> -
> -	sensor->handler_setup_needed = false;
> +	sensor->streaming = true;
>  
> -	/* Restore V4L2 controls to the previously suspended device */
> -	rval = v4l2_ctrl_handler_setup(&sensor->pixel_array->ctrl_handler);
> -	if (rval)
> -		goto error;
> +	return 0;
>  
> -	rval = v4l2_ctrl_handler_setup(&sensor->src->ctrl_handler);
> -	if (rval)
> -		goto error;
> +err_pm_put:
> +	pm_runtime_mark_last_busy(&client->dev);
> +	pm_runtime_put_autosuspend(&client->dev);

On failures I tend not to use autosuspend, based on the idea that it may
be easier to recover from a failure if the sensor got powered off. I'm
not sure that's really relevant though.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  
> -	/* Keep PM runtime usage_count incremented on success */
> -	return 0;
> -error:
> -	pm_runtime_put(&client->dev);
>  	return rval;
>  }
>  
> -static int ccs_set_stream(struct v4l2_subdev *subdev, int enable)
> +static int ccs_disable_streams(struct v4l2_subdev *subdev,
> +			       struct v4l2_subdev_state *state, u32 pad,
> +			       u64 streams_mask)
>  {
>  	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
>  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
>  	int rval;
>  
> -	if (!enable) {
> -		ccs_stop_streaming(sensor);
> -		sensor->streaming = false;
> -		pm_runtime_mark_last_busy(&client->dev);
> -		pm_runtime_put_autosuspend(&client->dev);
> -
> -		return 0;
> -	}
> +	if (pad != CCS_PAD_SRC)
> +		return -EINVAL;
>  
> -	rval = ccs_pm_get_init(sensor);
> +	rval = ccs_write(sensor, MODE_SELECT, CCS_MODE_SELECT_SOFTWARE_STANDBY);
>  	if (rval)
>  		return rval;
>  
> -	sensor->streaming = true;
> +	rval = ccs_call_quirk(sensor, post_streamoff);
> +	if (rval)
> +		dev_err(&client->dev, "post_streamoff quirks failed\n");
>  
> -	rval = ccs_start_streaming(sensor);
> -	if (rval < 0) {
> -		sensor->streaming = false;
> -		pm_runtime_mark_last_busy(&client->dev);
> -		pm_runtime_put_autosuspend(&client->dev);
> -	}
> +	sensor->streaming = false;
> +	pm_runtime_mark_last_busy(&client->dev);
> +	pm_runtime_put_autosuspend(&client->dev);
>  
> -	return rval;
> +	return 0;
>  }
>  
>  static int ccs_pre_streamon(struct v4l2_subdev *subdev, u32 flags)
> @@ -1962,7 +1947,9 @@ static int ccs_pre_streamon(struct v4l2_subdev *subdev, u32 flags)
>  		}
>  	}
>  
> +	mutex_lock(&sensor->mutex);
>  	rval = ccs_pm_get_init(sensor);
> +	mutex_unlock(&sensor->mutex);
>  	if (rval)
>  		return rval;
>  
> @@ -3046,7 +3033,7 @@ static int ccs_init_state(struct v4l2_subdev *sd,
>  }
>  
>  static const struct v4l2_subdev_video_ops ccs_video_ops = {
> -	.s_stream = ccs_set_stream,
> +	.s_stream = v4l2_subdev_s_stream_helper,
>  	.pre_streamon = ccs_pre_streamon,
>  	.post_streamoff = ccs_post_streamoff,
>  };
> @@ -3057,6 +3044,8 @@ static const struct v4l2_subdev_pad_ops ccs_pad_ops = {
>  	.set_fmt = ccs_set_format,
>  	.get_selection = ccs_get_selection,
>  	.set_selection = ccs_set_selection,
> +	.enable_streams = ccs_enable_streams,
> +	.disable_streams = ccs_disable_streams,
>  };
>  
>  static const struct v4l2_subdev_sensor_ops ccs_sensor_ops = {

-- 
Regards,

Laurent Pinchart

