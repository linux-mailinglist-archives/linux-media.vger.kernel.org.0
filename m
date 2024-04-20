Return-Path: <linux-media+bounces-9793-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6BA8ABA2C
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 09:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D564B20FB7
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 07:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC79813AC5;
	Sat, 20 Apr 2024 07:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Tnm4XveV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16F07F
	for <linux-media@vger.kernel.org>; Sat, 20 Apr 2024 07:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713599881; cv=none; b=nECXIxWXCJ2Au7w252wrgxDNchhQ7lNxiCaoRY/5sH7dCs//AGLMmu0qyEBjO+LyANzSN5XnjB2tCPSO6UDZQl8KZ397W8fB/GAwj2Pb2otZO+l0Hj1Ep838FRUkZ+uWGPteei640kVVLGC0QMVlchw2Gs6N3idBB1VepzVE1OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713599881; c=relaxed/simple;
	bh=BhEAQBCGZnQUeQQII1to/vZHFO9UoQqPrbAKDrFAc3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gCAMtCVt1ijJ42oWUqc9KCFXQJTj8pRUOrty77rRQa2Niq43MvVc6O2IgrIv+g/4ZHiq3A4arYmMEf9BYOT9EtxV4rjBCp64EXxPBnql6KUQMrldsC0ZuozTj2lyPY6Gy8fIRVPDb1QOxIj2Gr14pKh8hhHfh10ji917rF8qRcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Tnm4XveV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E76F2BC;
	Sat, 20 Apr 2024 09:57:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713599828;
	bh=BhEAQBCGZnQUeQQII1to/vZHFO9UoQqPrbAKDrFAc3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tnm4XveVxRPqBXU3s1KGiP2afB3Rfs/wp65g9STSHml2EIjrDpBdiYk8BGLE5fgxt
	 vj/8GAIG0f8jDdxQW8nD4QM2GU6qol46x8+BjPYTNDGQBvTHhUNAZdLE2lsz/cUS1O
	 Jz63FpYnHms/wIXTvU1EO4HBDQaskMVM2N24lT0A=
Date: Sat, 20 Apr 2024 10:57:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 21/46] media: ccs: Use {enable,disable}_streams
 operations
Message-ID: <20240420075749.GM6414@pendragon.ideasonboard.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-22-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240416193319.778192-22-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Tue, Apr 16, 2024 at 10:32:54PM +0300, Sakari Ailus wrote:
> Switch from s_stream() video op to enable_streams() and disable_streams()
> pad operations. They are preferred and required for streams support.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/ccs/ccs-core.c | 83 ++++++++++++++------------------
>  1 file changed, 36 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index d14e90f8568a..aaa6bf8495e1 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -1715,7 +1715,7 @@ static int ccs_power_off(struct device *dev)
>  }
>  
>  /* -----------------------------------------------------------------------------
> - * Video stream management
> + * V4L2 subdev video operations
>   */
>  
>  static int ccs_pm_get_init(struct ccs_sensor *sensor)
> @@ -1739,11 +1739,11 @@ static int ccs_pm_get_init(struct ccs_sensor *sensor)
>  	sensor->handler_setup_needed = false;
>  
>  	/* Restore V4L2 controls to the previously suspended device */
> -	rval = v4l2_ctrl_handler_setup(&sensor->pixel_array->ctrl_handler);
> +	rval = __v4l2_ctrl_handler_setup(&sensor->pixel_array->ctrl_handler);
>  	if (rval)
>  		goto error;
>  
> -	rval = v4l2_ctrl_handler_setup(&sensor->src->ctrl_handler);
> +	rval = __v4l2_ctrl_handler_setup(&sensor->src->ctrl_handler);
>  	if (rval)
>  		goto error;
>  
> @@ -1755,13 +1755,21 @@ static int ccs_pm_get_init(struct ccs_sensor *sensor)
>  	return rval;
>  }
>  
> -static int ccs_start_streaming(struct ccs_sensor *sensor)
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
> @@ -1880,64 +1888,41 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
>  
>  	rval = ccs_write(sensor, MODE_SELECT, CCS_MODE_SELECT_STREAMING);
>  
> -err_pm_put:
> -	mutex_unlock(&sensor->mutex);
> -
> -	return rval;
> -}
> -
> -static int ccs_stop_streaming(struct ccs_sensor *sensor)
> -{
> -	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
> -	int rval;
> +	sensor->streaming = true;
>  
> -	mutex_lock(&sensor->mutex);
> -	rval = ccs_write(sensor, MODE_SELECT, CCS_MODE_SELECT_SOFTWARE_STANDBY);
> -	if (rval)
> -		goto out;
> +	return 0;
>  
> -	rval = ccs_call_quirk(sensor, post_streamoff);
> -	if (rval)
> -		dev_err(&client->dev, "post_streamoff quirks failed\n");
> +err_pm_put:
> +	pm_runtime_mark_last_busy(&client->dev);
> +	pm_runtime_put_autosuspend(&client->dev);
>  
> -out:
> -	mutex_unlock(&sensor->mutex);
>  	return rval;
>  }
>  
> -/* -----------------------------------------------------------------------------
> - * V4L2 subdev video operations
> - */
> -
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
> @@ -1963,7 +1948,9 @@ static int ccs_pre_streamon(struct v4l2_subdev *subdev, u32 flags)
>  		}
>  	}
>  
> +	mutex_lock(&sensor->mutex);
>  	rval = ccs_pm_get_init(sensor);
> +	mutex_unlock(&sensor->mutex);
>  	if (rval)
>  		return rval;
>  
> @@ -3047,7 +3034,7 @@ static int ccs_init_state(struct v4l2_subdev *sd,
>  }
>  
>  static const struct v4l2_subdev_video_ops ccs_video_ops = {
> -	.s_stream = ccs_set_stream,
> +	.s_stream = v4l2_subdev_s_stream_helper,
>  	.pre_streamon = ccs_pre_streamon,
>  	.post_streamoff = ccs_post_streamoff,
>  };
> @@ -3058,6 +3045,8 @@ static const struct v4l2_subdev_pad_ops ccs_pad_ops = {
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

