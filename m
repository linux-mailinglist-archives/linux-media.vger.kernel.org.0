Return-Path: <linux-media+bounces-49590-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 272DACDF8D3
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 12:21:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 49B4530026B9
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 11:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0734B3126C7;
	Sat, 27 Dec 2025 11:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iAQleKYn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632A31D5ACE;
	Sat, 27 Dec 2025 11:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766834509; cv=none; b=qj6kk0j1KQADmQc3B4QOmIIX9CiVqOuDwSWgXNJpIAld+Yu5wSWIGuSGFcAUWtN3Sylo6UEZUj1XHqMrWpm8UTrE5iU3EeYMuArL9RXck7cHBq1V5q8+NXUP9tGloEn91IOcaBLJXT0mYkUuz0/zwyCS1M/b9jfWGTzMWJwQ7v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766834509; c=relaxed/simple;
	bh=UCfM3fBvJJ7jzqMjWSYORYijW2zgyf4nfpvGuTxnO+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cGwOuY9X5PLlP+GC9ldHRkl9dQu6CtCVlU6O9Z7m9P/S5pYLkryg18uaTO0PEf302/Cr5YF/7xyD1ZiNcJi4U7ODkhXyUNRh8LLi0LFThJFVNK4oK8OmQpYDPZkZjKKfdkjvKsCfQXPwxxZ2FaciTBlA/ehuzeDRw4WWdla9/ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iAQleKYn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B6731BB;
	Sat, 27 Dec 2025 12:21:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766834491;
	bh=UCfM3fBvJJ7jzqMjWSYORYijW2zgyf4nfpvGuTxnO+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iAQleKYnEt5UiFAUWl4leUGShzP4eEVJsi3yWZ3EhrvpeZSru1Pi3+t8y7AUW0D7c
	 vMEpRA4Sd9WhgIOku8VIEG3snyfxxw7Q8hr57bPb4s3ZhTQl3QzAaWQiTyOImL6UNA
	 JzV3qamqtsi6B0217wy1qKTtKmun7e3zcfFcO6wk=
Date: Sat, 27 Dec 2025 13:21:29 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: sakari.ailus@linux.intel.com, dave.stevenson@raspberrypi.com,
	jacopo@jmondi.org, mchehab@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
	johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
	jai.luthra@ideasonboard.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: ov5647: Switch to using the sub-device
 state lock
Message-ID: <20251227112129.GG4094@pendragon.ideasonboard.com>
References: <20251226031311.2068414-1-xiaolei.wang@windriver.com>
 <20251226031311.2068414-3-xiaolei.wang@windriver.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251226031311.2068414-3-xiaolei.wang@windriver.com>

Hi Xiaolei,

Thank you for the patch.

On Fri, Dec 26, 2025 at 11:13:11AM +0800, Xiaolei Wang wrote:
> Switch to using the sub-device state lock and properly call
> v4l2_subdev_init_finalize() / v4l2_subdev_cleanup() on probe() /
> remove().

We try to convert image sensor drivers to the .enable_streams() and
.disable_streams() operations at the same time as the conversion to
v4l2_subdev_init_finalize(), to standardize on recent APIs. This hasn't
been entirely successful so far (there are 40 drivers using
v4l2_subdev_init_finalize() and only 22 of those use the new
operations), but let's avoid making it worse :-)

Could you please include a patch in v2 to move to the new
.enable_streams() and .disable_streams() operations ?

> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---
>  drivers/media/i2c/ov5647.c | 40 +++++++++++++-------------------------
>  1 file changed, 14 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 1f8e173417b8..2619971353fd 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -96,7 +96,6 @@ struct ov5647 {
>  	struct v4l2_subdev		sd;
>  	struct regmap                   *regmap;
>  	struct media_pad		pad;
> -	struct mutex			lock;
>  	struct clk			*xclk;
>  	struct gpio_desc		*pwdn;
>  	bool				clock_ncont;
> @@ -657,7 +656,7 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
>  	}
>  
>  	/* Apply customized values from user when stream starts. */
> -	ret =  __v4l2_ctrl_handler_setup(sd->ctrl_handler);
> +	ret =  v4l2_ctrl_handler_setup(sd->ctrl_handler);
>  	if (ret)
>  		return ret;
>  
> @@ -821,15 +820,12 @@ __ov5647_get_pad_crop(struct ov5647 *ov5647,
>  static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
> -	struct ov5647 *sensor = to_sensor(sd);
>  	int ret;
>  
> -	mutex_lock(&sensor->lock);
> -
>  	if (enable) {
>  		ret = pm_runtime_resume_and_get(&client->dev);
>  		if (ret < 0)
> -			goto error_unlock;
> +			return ret;
>  
>  		ret = ov5647_stream_on(sd);
>  		if (ret < 0) {
> @@ -845,14 +841,10 @@ static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
>  		pm_runtime_put(&client->dev);
>  	}
>  
> -	mutex_unlock(&sensor->lock);
> -
>  	return 0;
>  
>  error_pm:
>  	pm_runtime_put(&client->dev);
> -error_unlock:
> -	mutex_unlock(&sensor->lock);
>  
>  	return ret;
>  }
> @@ -900,7 +892,6 @@ static int ov5647_get_pad_fmt(struct v4l2_subdev *sd,
>  	const struct v4l2_mbus_framefmt *sensor_format;
>  	struct ov5647 *sensor = to_sensor(sd);
>  
> -	mutex_lock(&sensor->lock);
>  	switch (format->which) {
>  	case V4L2_SUBDEV_FORMAT_TRY:
>  		sensor_format = v4l2_subdev_state_get_format(sd_state,
> @@ -912,7 +903,6 @@ static int ov5647_get_pad_fmt(struct v4l2_subdev *sd,
>  	}
>  
>  	*fmt = *sensor_format;
> -	mutex_unlock(&sensor->lock);
>  
>  	return 0;
>  }
> @@ -930,7 +920,6 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
>  				      fmt->width, fmt->height);
>  
>  	/* Update the sensor mode and apply at it at streamon time. */
> -	mutex_lock(&sensor->lock);
>  	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
>  		*v4l2_subdev_state_get_format(sd_state, format->pad) = mode->format;
>  	} else {
> @@ -959,7 +948,6 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
>  					 exposure_def);
>  	}
>  	*fmt = mode->format;
> -	mutex_unlock(&sensor->lock);
>  
>  	return 0;
>  }
> @@ -972,10 +960,8 @@ static int ov5647_get_selection(struct v4l2_subdev *sd,
>  	case V4L2_SEL_TGT_CROP: {
>  		struct ov5647 *sensor = to_sensor(sd);
>  
> -		mutex_lock(&sensor->lock);
>  		sel->r = *__ov5647_get_pad_crop(sensor, sd_state, sel->pad,
>  						sel->which);
> -		mutex_unlock(&sensor->lock);
>  
>  		return 0;
>  	}
> @@ -1149,9 +1135,6 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
>  	int ret = 0;
>  
> -
> -	/* v4l2_ctrl_lock() locks our own mutex */
> -
>  	if (ctrl->id == V4L2_CID_VBLANK) {
>  		int exposure_max, exposure_def;
>  
> @@ -1351,13 +1334,11 @@ static int ov5647_probe(struct i2c_client *client)
>  		return -EINVAL;
>  	}
>  
> -	mutex_init(&sensor->lock);
> -
>  	sensor->mode = OV5647_DEFAULT_MODE;
>  
>  	ret = ov5647_init_controls(sensor);
>  	if (ret)
> -		goto mutex_destroy;
> +		return ret;
>  
>  	sd = &sensor->sd;
>  	v4l2_i2c_subdev_init(sd, client, &ov5647_subdev_ops);
> @@ -1385,9 +1366,16 @@ static int ov5647_probe(struct i2c_client *client)
>  	if (ret < 0)
>  		goto power_off;
>  
> +	sd->state_lock = sensor->ctrls.lock;
> +	ret = v4l2_subdev_init_finalize(sd);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to init subdev: %d", ret);
> +		goto power_off;
> +	}
> +
>  	ret = v4l2_async_register_subdev(sd);
>  	if (ret < 0)
> -		goto power_off;
> +		goto v4l2_subdev_cleanup;
>  
>  	/* Enable runtime PM and turn off the device */
>  	pm_runtime_set_active(dev);
> @@ -1398,14 +1386,14 @@ static int ov5647_probe(struct i2c_client *client)
>  
>  	return 0;
>  
> +v4l2_subdev_cleanup:
> +	v4l2_subdev_cleanup(sd);
>  power_off:
>  	ov5647_power_off(dev);
>  entity_cleanup:
>  	media_entity_cleanup(&sd->entity);
>  ctrl_handler_free:
>  	v4l2_ctrl_handler_free(&sensor->ctrls);
> -mutex_destroy:
> -	mutex_destroy(&sensor->lock);
>  
>  	return ret;
>  }
> @@ -1416,11 +1404,11 @@ static void ov5647_remove(struct i2c_client *client)
>  	struct ov5647 *sensor = to_sensor(sd);
>  
>  	v4l2_async_unregister_subdev(&sensor->sd);
> +	v4l2_subdev_cleanup(sd);
>  	media_entity_cleanup(&sensor->sd.entity);
>  	v4l2_ctrl_handler_free(&sensor->ctrls);
>  	v4l2_device_unregister_subdev(sd);
>  	pm_runtime_disable(&client->dev);
> -	mutex_destroy(&sensor->lock);
>  }
>  
>  static const struct dev_pm_ops ov5647_pm_ops = {

-- 
Regards,

Laurent Pinchart

