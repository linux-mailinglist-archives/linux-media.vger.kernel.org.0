Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 390387A1B36
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 11:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232405AbjIOJu4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 05:50:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232147AbjIOJuz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 05:50:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC94D49F7
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 02:48:41 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5056A208C;
        Fri, 15 Sep 2023 11:47:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694771223;
        bh=MvzMphZCGwuo3U36pYvBAuOUhxXRJdYganQaJvdBXZU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FRjiVQyCMvTiBreIQTq8AkXTMIYCdrSMmETjeV//5ax1dLdgj6z9fLrLYce/HA/Ki
         LTQE/W2zh2r/qI5RCLR2KhhCQDnLMvZ6FFer8D3JVimw6hDumSBzzgLd+Ri4V3C2Ms
         OmFCLmmjIT6SOgUN7mpfhQJ7ythrzL1Xb8UEIJKE=
Date:   Fri, 15 Sep 2023 12:48:50 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 6/7] media: ov2740: Use sub-device active state
Message-ID: <20230915094850.GG14641@pendragon.ideasonboard.com>
References: <20230915072809.37886-1-sakari.ailus@linux.intel.com>
 <20230915072809.37886-7-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230915072809.37886-7-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Fri, Sep 15, 2023 at 10:28:08AM +0300, Sakari Ailus wrote:
> Use sub-device active state. Rely on control handler lock to serialise
> access to the active state. Also clean up locking on s_stream handler.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ov2740.c | 121 +++++++++++++++----------------------
>  1 file changed, 49 insertions(+), 72 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index 319dc00e47b4..de39a66b1b81 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -336,9 +336,6 @@ struct ov2740 {
>  	/* Current mode */
>  	const struct ov2740_mode *cur_mode;
>  
> -	/* To serialize asynchronus callbacks */
> -	struct mutex mutex;
> -
>  	/* Streaming on/off */
>  	bool streaming;
>  
> @@ -582,7 +579,6 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
>  	if (ret)
>  		return ret;
>  
> -	ctrl_hdlr->lock = &ov2740->mutex;
>  	cur_mode = ov2740->cur_mode;
>  	size = ARRAY_SIZE(link_freq_menu_items);
>  
> @@ -792,18 +788,18 @@ static int ov2740_set_stream(struct v4l2_subdev *sd, int enable)
>  {
>  	struct ov2740 *ov2740 = to_ov2740(sd);
>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
> +	struct v4l2_subdev_state *sd_state;
>  	int ret = 0;
>  
> +	sd_state = v4l2_subdev_lock_and_get_active_state(&ov2740->sd);
> +
>  	if (ov2740->streaming == enable)
> -		return 0;
> +		goto out_unlock;
>  
> -	mutex_lock(&ov2740->mutex);
>  	if (enable) {
>  		ret = pm_runtime_resume_and_get(&client->dev);
> -		if (ret < 0) {
> -			mutex_unlock(&ov2740->mutex);
> -			return ret;
> -		}
> +		if (ret < 0)
> +			goto out_unlock;
>  
>  		ret = ov2740_start_streaming(ov2740);
>  		if (ret) {
> @@ -817,7 +813,9 @@ static int ov2740_set_stream(struct v4l2_subdev *sd, int enable)
>  	}
>  
>  	ov2740->streaming = enable;
> -	mutex_unlock(&ov2740->mutex);
> +
> +out_unlock:
> +	v4l2_subdev_unlock_state(sd_state);
>  
>  	return ret;
>  }
> @@ -826,12 +824,13 @@ static int ov2740_suspend(struct device *dev)
>  {
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>  	struct ov2740 *ov2740 = to_ov2740(sd);
> +	struct v4l2_subdev_state *sd_state;
>  
> -	mutex_lock(&ov2740->mutex);
> +	sd_state = v4l2_subdev_lock_and_get_active_state(&ov2740->sd);
>  	if (ov2740->streaming)
>  		ov2740_stop_streaming(ov2740);
>  
> -	mutex_unlock(&ov2740->mutex);
> +	v4l2_subdev_unlock_state(sd_state);
>  
>  	return 0;
>  }

This conflicts with a series I've just sent. As my series contains 57
patches, I would appreciate not to have to rebase it :-) You could pick
up the ov2740 patches and include them in this series, before this one.

> @@ -840,9 +839,10 @@ static int ov2740_resume(struct device *dev)
>  {
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>  	struct ov2740 *ov2740 = to_ov2740(sd);
> +	struct v4l2_subdev_state *sd_state;
>  	int ret = 0;
>  
> -	mutex_lock(&ov2740->mutex);
> +	sd_state = v4l2_subdev_lock_and_get_active_state(&ov2740->sd);
>  	if (!ov2740->streaming)
>  		goto exit;
>  
> @@ -853,7 +853,7 @@ static int ov2740_resume(struct device *dev)
>  	}
>  
>  exit:
> -	mutex_unlock(&ov2740->mutex);
> +	v4l2_subdev_unlock_state(sd_state);
>  	return ret;
>  }
>  
> @@ -870,48 +870,26 @@ static int ov2740_set_format(struct v4l2_subdev *sd,
>  				      height, fmt->format.width,
>  				      fmt->format.height);
>  
> -	mutex_lock(&ov2740->mutex);
>  	ov2740_update_pad_format(mode, &fmt->format);
> -	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> -		*v4l2_subdev_get_try_format(sd, sd_state, fmt->pad) = fmt->format;
> -	} else {
> -		ov2740->cur_mode = mode;
> -		__v4l2_ctrl_s_ctrl(ov2740->link_freq, mode->link_freq_index);
> -		__v4l2_ctrl_s_ctrl_int64(ov2740->pixel_rate,
> -					 to_pixel_rate(mode->link_freq_index));
> -
> -		/* Update limits and set FPS to default */
> -		vblank_def = mode->vts_def - mode->height;
> -		__v4l2_ctrl_modify_range(ov2740->vblank,
> -					 mode->vts_min - mode->height,
> -					 OV2740_VTS_MAX - mode->height, 1,
> -					 vblank_def);
> -		__v4l2_ctrl_s_ctrl(ov2740->vblank, vblank_def);
> -		h_blank = to_pixels_per_line(mode->hts, mode->link_freq_index) -
> -			  mode->width;
> -		__v4l2_ctrl_modify_range(ov2740->hblank, h_blank, h_blank, 1,
> -					 h_blank);
> -	}
> -	mutex_unlock(&ov2740->mutex);
> -
> -	return 0;
> -}
> +	*v4l2_subdev_get_pad_format(sd, sd_state, fmt->pad) = fmt->format;
>  
> -static int ov2740_get_format(struct v4l2_subdev *sd,
> -			     struct v4l2_subdev_state *sd_state,
> -			     struct v4l2_subdev_format *fmt)
> -{
> -	struct ov2740 *ov2740 = to_ov2740(sd);
> -
> -	mutex_lock(&ov2740->mutex);
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> -		fmt->format = *v4l2_subdev_get_try_format(&ov2740->sd,
> -							  sd_state,
> -							  fmt->pad);
> -	else
> -		ov2740_update_pad_format(ov2740->cur_mode, &fmt->format);
> +		return 0;
>  
> -	mutex_unlock(&ov2740->mutex);
> +	ov2740->cur_mode = mode;
> +	__v4l2_ctrl_s_ctrl(ov2740->link_freq, mode->link_freq_index);
> +	__v4l2_ctrl_s_ctrl_int64(ov2740->pixel_rate,
> +				 to_pixel_rate(mode->link_freq_index));
> +
> +	/* Update limits and set FPS to default */
> +	vblank_def = mode->vts_def - mode->height;
> +	__v4l2_ctrl_modify_range(ov2740->vblank,
> +				 mode->vts_min - mode->height,
> +				 OV2740_VTS_MAX - mode->height, 1, vblank_def);
> +	__v4l2_ctrl_s_ctrl(ov2740->vblank, vblank_def);
> +	h_blank = to_pixels_per_line(mode->hts, mode->link_freq_index) -
> +		mode->width;
> +	__v4l2_ctrl_modify_range(ov2740->hblank, h_blank, h_blank, 1, h_blank);
>  
>  	return 0;
>  }
> @@ -946,14 +924,11 @@ static int ov2740_enum_frame_size(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> -static int ov2740_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +static int ov2740_init_cfg(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_state *sd_state)
>  {
> -	struct ov2740 *ov2740 = to_ov2740(sd);
> -
> -	mutex_lock(&ov2740->mutex);
>  	ov2740_update_pad_format(&supported_modes[0],
> -				 v4l2_subdev_get_try_format(sd, fh->state, 0));
> -	mutex_unlock(&ov2740->mutex);
> +				 v4l2_subdev_get_pad_format(sd, sd_state, 0));
>  
>  	return 0;
>  }
> @@ -963,10 +938,11 @@ static const struct v4l2_subdev_video_ops ov2740_video_ops = {
>  };
>  
>  static const struct v4l2_subdev_pad_ops ov2740_pad_ops = {
> +	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = ov2740_set_format,
> -	.get_fmt = ov2740_get_format,
>  	.enum_mbus_code = ov2740_enum_mbus_code,
>  	.enum_frame_size = ov2740_enum_frame_size,
> +	.init_cfg = ov2740_init_cfg,
>  };
>  
>  static const struct v4l2_subdev_ops ov2740_subdev_ops = {
> @@ -978,10 +954,6 @@ static const struct media_entity_operations ov2740_subdev_entity_ops = {
>  	.link_validate = v4l2_subdev_link_validate,
>  };
>  
> -static const struct v4l2_subdev_internal_ops ov2740_internal_ops = {
> -	.open = ov2740_open,
> -};
> -
>  static int ov2740_check_hwcfg(struct device *dev)
>  {
>  	struct fwnode_handle *ep;
> @@ -1047,13 +1019,12 @@ static int ov2740_check_hwcfg(struct device *dev)
>  static void ov2740_remove(struct i2c_client *client)
>  {
>  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> -	struct ov2740 *ov2740 = to_ov2740(sd);
>  
>  	v4l2_async_unregister_subdev(sd);
>  	media_entity_cleanup(&sd->entity);
> +	v4l2_subdev_cleanup(sd);
>  	v4l2_ctrl_handler_free(sd->ctrl_handler);
>  	pm_runtime_disable(&client->dev);
> -	mutex_destroy(&ov2740->mutex);
>  }
>  
>  static int ov2740_nvmem_read(void *priv, unsigned int off, void *val,
> @@ -1062,9 +1033,10 @@ static int ov2740_nvmem_read(void *priv, unsigned int off, void *val,
>  	struct nvm_data *nvm = priv;
>  	struct device *dev = regmap_get_device(nvm->regmap);
>  	struct ov2740 *ov2740 = to_ov2740(dev_get_drvdata(dev));
> +	struct v4l2_subdev_state *sd_state;
>  	int ret = 0;
>  
> -	mutex_lock(&ov2740->mutex);
> +	sd_state = v4l2_subdev_lock_and_get_active_state(&ov2740->sd);

This function seems unrelated to the state. What was the lock protecting
against ?

>  
>  	if (nvm->nvm_buffer) {
>  		memcpy(val, nvm->nvm_buffer + off, count);
> @@ -1082,7 +1054,7 @@ static int ov2740_nvmem_read(void *priv, unsigned int off, void *val,
>  
>  	pm_runtime_put(dev);
>  exit:
> -	mutex_unlock(&ov2740->mutex);
> +	v4l2_subdev_unlock_state(sd_state);
>  	return ret;
>  }
>  
> @@ -1153,7 +1125,6 @@ static int ov2740_probe(struct i2c_client *client)
>  			return dev_err_probe(dev, ret, "failed to find sensor\n");
>  	}
>  
> -	mutex_init(&ov2740->mutex);
>  	ov2740->cur_mode = &supported_modes[0];
>  	ret = ov2740_init_controls(ov2740);
>  	if (ret) {
> @@ -1161,7 +1132,7 @@ static int ov2740_probe(struct i2c_client *client)
>  		goto probe_error_v4l2_ctrl_handler_free;
>  	}
>  
> -	ov2740->sd.internal_ops = &ov2740_internal_ops;
> +	ov2740->sd.state_lock = ov2740->ctrl_handler.lock;
>  	ov2740->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>  	ov2740->sd.entity.ops = &ov2740_subdev_entity_ops;
>  	ov2740->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> @@ -1172,6 +1143,10 @@ static int ov2740_probe(struct i2c_client *client)
>  		goto probe_error_v4l2_ctrl_handler_free;
>  	}
>  
> +	ret = v4l2_subdev_init_finalize(&ov2740->sd);
> +	if (ret)
> +		goto probe_error_media_entity_cleanup;
> +
>  	/* Set the device's state to active if it's in D0 state. */
>  	if (full_power)
>  		pm_runtime_set_active(&client->dev);
> @@ -1181,7 +1156,7 @@ static int ov2740_probe(struct i2c_client *client)
>  	ret = v4l2_async_register_subdev_sensor(&ov2740->sd);
>  	if (ret < 0) {
>  		dev_err_probe(dev, ret, "failed to register V4L2 subdev\n");
> -		goto probe_error_media_entity_cleanup;
> +		goto probe_error_v4l2_subdev_cleanup;
>  	}
>  
>  	ret = ov2740_register_nvmem(client, ov2740);
> @@ -1190,6 +1165,9 @@ static int ov2740_probe(struct i2c_client *client)
>  
>  	return 0;
>  
> +probe_error_v4l2_subdev_cleanup:
> +	v4l2_subdev_cleanup(&ov2740->sd);
> +
>  probe_error_media_entity_cleanup:
>  	media_entity_cleanup(&ov2740->sd.entity);
>  	pm_runtime_disable(&client->dev);
> @@ -1197,7 +1175,6 @@ static int ov2740_probe(struct i2c_client *client)
>  
>  probe_error_v4l2_ctrl_handler_free:
>  	v4l2_ctrl_handler_free(ov2740->sd.ctrl_handler);
> -	mutex_destroy(&ov2740->mutex);
>  
>  	return ret;
>  }

-- 
Regards,

Laurent Pinchart
