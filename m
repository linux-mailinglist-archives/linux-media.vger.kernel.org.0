Return-Path: <linux-media+bounces-2144-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF1680D513
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 19:15:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FB6F1C20C68
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 18:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F2951007;
	Mon, 11 Dec 2023 18:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GoRnpURY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B556C7;
	Mon, 11 Dec 2023 10:15:20 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC060922;
	Mon, 11 Dec 2023 19:14:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702318475;
	bh=8eSow/3dFTG1DAJOMkS/gxZZoikGXWE51x4cXT/zPqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GoRnpURY/6iclbnSYFnh+4jlqpz91ialh+KlheDfqIjgavbbwopABrkd9RpdD3cIE
	 Owl7/f8IETX30TzkFtqrc+h+7LmnKHeaoqzqfU2eyCNGhGfgpGlR42IC41WTUxf7e1
	 FfP28n4m2pFYTCC/kv+i+zuPsZ54nOA7pMfhveL0=
Date: Mon, 11 Dec 2023 20:15:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mikhail Rudenko <mike.rudenko@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 07/19] media: i2c: ov4689: Use sub-device active state
Message-ID: <20231211181526.GF27535@pendragon.ideasonboard.com>
References: <20231211175023.1680247-1-mike.rudenko@gmail.com>
 <20231211175023.1680247-8-mike.rudenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231211175023.1680247-8-mike.rudenko@gmail.com>

Hi Mikhail,

Thank you for the patch.

On Mon, Dec 11, 2023 at 08:50:10PM +0300, Mikhail Rudenko wrote:
> Use sub-device active state. Employ control handler lock to
> synchronize access to the active state and s_stream.
> 
> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
> ---
>  drivers/media/i2c/ov4689.c | 68 +++++++++++++++-----------------------
>  1 file changed, 27 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov4689.c b/drivers/media/i2c/ov4689.c
> index 5392f650960c..2eef64cd0070 100644
> --- a/drivers/media/i2c/ov4689.c
> +++ b/drivers/media/i2c/ov4689.c
> @@ -86,7 +86,6 @@ struct ov4689 {
>  
>  	u32 clock_rate;
>  
> -	struct mutex mutex; /* lock to protect ctrls and cur_mode */
>  	struct v4l2_ctrl_handler ctrl_handler;
>  	struct v4l2_ctrl *exposure;
>  
> @@ -319,19 +318,6 @@ static int ov4689_set_fmt(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> -static int ov4689_get_fmt(struct v4l2_subdev *sd,
> -			  struct v4l2_subdev_state *sd_state,
> -			  struct v4l2_subdev_format *fmt)
> -{
> -	struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
> -	struct ov4689 *ov4689 = to_ov4689(sd);
> -
> -	/* only one mode supported for now */
> -	ov4689_fill_fmt(ov4689->cur_mode, mbus_fmt);
> -
> -	return 0;
> -}
> -
>  static int ov4689_enum_mbus_code(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *sd_state,
>  				 struct v4l2_subdev_mbus_code_enum *code)
> @@ -405,10 +391,11 @@ static int ov4689_get_selection(struct v4l2_subdev *sd,
>  static int ov4689_s_stream(struct v4l2_subdev *sd, int on)
>  {
>  	struct ov4689 *ov4689 = to_ov4689(sd);
> +	struct v4l2_subdev_state *sd_state;
>  	struct device *dev = ov4689->dev;
>  	int ret = 0;
>  
> -	mutex_lock(&ov4689->mutex);
> +	sd_state = v4l2_subdev_lock_and_get_active_state(&ov4689->subdev);
>  
>  	if (on) {
>  		ret = pm_runtime_resume_and_get(dev);
> @@ -443,7 +430,7 @@ static int ov4689_s_stream(struct v4l2_subdev *sd, int on)
>  	}
>  
>  unlock_and_return:
> -	mutex_unlock(&ov4689->mutex);
> +	v4l2_subdev_unlock_state(sd_state);
>  
>  	return ret;
>  }
> @@ -506,19 +493,15 @@ static int __maybe_unused ov4689_power_off(struct device *dev)
>  	return 0;
>  }
>  
> -static int ov4689_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +static int ov4689_init_cfg(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_state *sd_state)
>  {
> -	struct ov4689 *ov4689 = to_ov4689(sd);
> -	struct v4l2_mbus_framefmt *try_fmt;
> -
> -	mutex_lock(&ov4689->mutex);
> +	struct v4l2_mbus_framefmt *try_fmt =
> +		v4l2_subdev_state_get_format(sd_state, 0);
>  
> -	try_fmt = v4l2_subdev_state_get_format(fh->state, 0);
>  	/* Initialize try_fmt */

It's not necessarily a "try format" anymore, so you cand rop this
comment, and rename the variable from try_fmt to fmt.

>  	ov4689_fill_fmt(&supported_modes[OV4689_MODE_2688_1520], try_fmt);
>  
> -	mutex_unlock(&ov4689->mutex);
> -
>  	return 0;
>  }
>  
> @@ -526,18 +509,15 @@ static const struct dev_pm_ops ov4689_pm_ops = {
>  	SET_RUNTIME_PM_OPS(ov4689_power_off, ov4689_power_on, NULL)
>  };
>  
> -static const struct v4l2_subdev_internal_ops ov4689_internal_ops = {
> -	.open = ov4689_open,
> -};
> -
>  static const struct v4l2_subdev_video_ops ov4689_video_ops = {
>  	.s_stream = ov4689_s_stream,
>  };
>  
>  static const struct v4l2_subdev_pad_ops ov4689_pad_ops = {
> +	.init_cfg = ov4689_init_cfg,

Please rebase on top of the latest media tree for the next version, the
.init_cfg() operation has been renamed to .init_state() and moved to
v4l2_subdev_internal_ops.

Other than that, this patch looks good.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	.enum_mbus_code = ov4689_enum_mbus_code,
>  	.enum_frame_size = ov4689_enum_frame_sizes,
> -	.get_fmt = ov4689_get_fmt,
> +	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = ov4689_set_fmt,
>  	.get_selection = ov4689_get_selection,
>  };
> @@ -649,7 +629,6 @@ static int ov4689_initialize_controls(struct ov4689 *ov4689)
>  	ret = v4l2_ctrl_handler_init(handler, 10);
>  	if (ret)
>  		return ret;
> -	handler->lock = &ov4689->mutex;
>  
>  	ctrl = v4l2_ctrl_new_int_menu(handler, NULL, V4L2_CID_LINK_FREQ, 0, 0,
>  				      link_freq_menu_items);
> @@ -862,13 +841,14 @@ static int ov4689_probe(struct i2c_client *client)
>  		return dev_err_probe(dev, ret,
>  				     "Failed to get power regulators\n");
>  
> -	mutex_init(&ov4689->mutex);
> -
>  	sd = &ov4689->subdev;
>  	v4l2_i2c_subdev_init(sd, client, &ov4689_subdev_ops);
> +
>  	ret = ov4689_initialize_controls(ov4689);
> -	if (ret)
> -		goto err_destroy_mutex;
> +	if (ret) {
> +		dev_err(dev, "Failed to initialize controls\n");
> +		return ret;
> +	}
>  
>  	ret = ov4689_power_on(dev);
>  	if (ret)
> @@ -878,19 +858,26 @@ static int ov4689_probe(struct i2c_client *client)
>  	if (ret)
>  		goto err_power_off;
>  
> -	sd->internal_ops = &ov4689_internal_ops;
>  	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
>  
>  	ov4689->pad.flags = MEDIA_PAD_FL_SOURCE;
> -	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
>  	ret = media_entity_pads_init(&sd->entity, 1, &ov4689->pad);
>  	if (ret < 0)
>  		goto err_power_off;
>  
> +	sd->state_lock = ov4689->ctrl_handler.lock;
> +	ret = v4l2_subdev_init_finalize(sd);
> +
> +	if (ret) {
> +		dev_err(dev, "Could not register v4l2 device\n");
> +		goto err_clean_entity;
> +	}
> +
>  	ret = v4l2_async_register_subdev_sensor(sd);
>  	if (ret) {
>  		dev_err(dev, "v4l2 async register subdev failed\n");
> -		goto err_clean_entity;
> +		goto err_clean_subdev;
>  	}
>  
>  	pm_runtime_set_active(dev);
> @@ -899,14 +886,14 @@ static int ov4689_probe(struct i2c_client *client)
>  
>  	return 0;
>  
> +err_clean_subdev:
> +	v4l2_subdev_cleanup(sd);
>  err_clean_entity:
>  	media_entity_cleanup(&sd->entity);
>  err_power_off:
>  	ov4689_power_off(dev);
>  err_free_handler:
>  	v4l2_ctrl_handler_free(&ov4689->ctrl_handler);
> -err_destroy_mutex:
> -	mutex_destroy(&ov4689->mutex);
>  
>  	return ret;
>  }
> @@ -918,9 +905,8 @@ static void ov4689_remove(struct i2c_client *client)
>  
>  	v4l2_async_unregister_subdev(sd);
>  	media_entity_cleanup(&sd->entity);
> -
> +	v4l2_subdev_cleanup(sd);
>  	v4l2_ctrl_handler_free(&ov4689->ctrl_handler);
> -	mutex_destroy(&ov4689->mutex);
>  
>  	pm_runtime_disable(&client->dev);
>  	if (!pm_runtime_status_suspended(&client->dev))

-- 
Regards,

Laurent Pinchart

