Return-Path: <linux-media+bounces-18532-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 405B0984E27
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 00:52:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2517280BE5
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 22:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53A417A90F;
	Tue, 24 Sep 2024 22:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fypOK7dN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5379C1459F7;
	Tue, 24 Sep 2024 22:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727218327; cv=none; b=F6s3tIAxGYCo49l81Ky5TBzjy3MB+0hzniWOtwPAEbd6s70YAHC49vqkT9wgFLh2SXEue+qMGRIyGxTtpErMby0N15xXgLqmiUlkbqWFyuF9GC0n38MFEOhwxrXTeESPahbVFmupoFMNpcl8mvnMNevnrdexVU93Bts9pY8tBUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727218327; c=relaxed/simple;
	bh=Ko8uiLSRLuvtEahkAkR8UddgQT7IIieyfCJMAkP3F5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SdYcaMV16PlhPStrx8v5sPufBlPAesqduj0aEOaIYBxwMl+kS9HmgQuQb/qFeVPWAvgI2mFPRg8rVBc63ZQM/WW9ceCxHc9rqTLokRpntBCCc2TkS5jsoSc6IHcLLcGaRCpwEUW90jHvhXlmoZpV1sQ18Aotwg6ayGnZz2tsS1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fypOK7dN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D71B7E2;
	Wed, 25 Sep 2024 00:50:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727218236;
	bh=Ko8uiLSRLuvtEahkAkR8UddgQT7IIieyfCJMAkP3F5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fypOK7dN5y7qhby01OatzSiz0vXTDvAEgNezbH7B22Z3UXYjgmpXRUqdUBM+TOP7f
	 ztzRxbYhaQvlhHjPlvyCTcKeyxQoNsbEONmJ7Vt7i3D91T9YqHtfd/WmVv7GHEOpC3
	 3RkL9XXN0Wae+YaqC4EjVdbb8K08aj1U/JdfPnw0=
Date: Wed, 25 Sep 2024 01:51:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 07/11] media: i2c: ov5645: Use subdev active state
Message-ID: <20240924225129.GP7165@pendragon.ideasonboard.com>
References: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910170610.226189-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240910170610.226189-8-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Tue, Sep 10, 2024 at 06:06:06PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Port the ov5645 sensor driver to use the subdev active state.
> 
> Move all the format configuration to the subdevice state and simplify
> the format handling, locking and initialization.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/ov5645.c | 109 +++++++++++++------------------------
>  1 file changed, 39 insertions(+), 70 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index 25c60afcc0ec..9497ec737cb7 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -89,7 +89,6 @@ struct ov5645 {
>  	struct v4l2_subdev sd;
>  	struct media_pad pad;
>  	struct v4l2_fwnode_endpoint ep;
> -	struct v4l2_mbus_framefmt fmt;
>  	struct v4l2_rect crop;
>  	struct clk *xclk;
>  
> @@ -850,49 +849,6 @@ static int ov5645_enum_frame_size(struct v4l2_subdev *subdev,
>  	return 0;
>  }
>  
> -static struct v4l2_mbus_framefmt *
> -__ov5645_get_pad_format(struct ov5645 *ov5645,
> -			struct v4l2_subdev_state *sd_state,
> -			unsigned int pad,
> -			enum v4l2_subdev_format_whence which)
> -{
> -	switch (which) {
> -	case V4L2_SUBDEV_FORMAT_TRY:
> -		return v4l2_subdev_state_get_format(sd_state, pad);
> -	case V4L2_SUBDEV_FORMAT_ACTIVE:
> -		return &ov5645->fmt;
> -	default:
> -		return NULL;
> -	}
> -}
> -
> -static int ov5645_get_format(struct v4l2_subdev *sd,
> -			     struct v4l2_subdev_state *sd_state,
> -			     struct v4l2_subdev_format *format)
> -{
> -	struct ov5645 *ov5645 = to_ov5645(sd);
> -
> -	format->format = *__ov5645_get_pad_format(ov5645, sd_state,
> -						  format->pad,
> -						  format->which);
> -	return 0;
> -}
> -
> -static struct v4l2_rect *
> -__ov5645_get_pad_crop(struct ov5645 *ov5645,
> -		      struct v4l2_subdev_state *sd_state,
> -		      unsigned int pad, enum v4l2_subdev_format_whence which)
> -{
> -	switch (which) {
> -	case V4L2_SUBDEV_FORMAT_TRY:
> -		return v4l2_subdev_state_get_crop(sd_state, pad);
> -	case V4L2_SUBDEV_FORMAT_ACTIVE:
> -		return &ov5645->crop;
> -	default:
> -		return NULL;
> -	}
> -}
> -
>  static int ov5645_set_format(struct v4l2_subdev *sd,
>  			     struct v4l2_subdev_state *sd_state,
>  			     struct v4l2_subdev_format *format)
> @@ -903,33 +859,30 @@ static int ov5645_set_format(struct v4l2_subdev *sd,
>  	const struct ov5645_mode_info *new_mode;
>  	int ret;
>  
> -	__crop = __ov5645_get_pad_crop(ov5645, sd_state, format->pad,
> -				       format->which);
> -
> +	__crop = v4l2_subdev_state_get_crop(sd_state, 0);
>  	new_mode = v4l2_find_nearest_size(ov5645_mode_info_data,
> -			       ARRAY_SIZE(ov5645_mode_info_data),
> -			       width, height,
> -			       format->format.width, format->format.height);
> +					  ARRAY_SIZE(ov5645_mode_info_data),
> +					  width, height, format->format.width,
> +					  format->format.height);
>  
>  	__crop->width = new_mode->width;
>  	__crop->height = new_mode->height;
>  
>  	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> -		ret = v4l2_ctrl_s_ctrl_int64(ov5645->pixel_clock,
> -					     new_mode->pixel_clock);
> +		ret = __v4l2_ctrl_s_ctrl_int64(ov5645->pixel_clock,
> +					       new_mode->pixel_clock);
>  		if (ret < 0)
>  			return ret;
>  
> -		ret = v4l2_ctrl_s_ctrl(ov5645->link_freq,
> -				       new_mode->link_freq);
> +		ret = __v4l2_ctrl_s_ctrl(ov5645->link_freq,
> +					 new_mode->link_freq);
>  		if (ret < 0)
>  			return ret;
>  
>  		ov5645->current_mode = new_mode;
>  	}
>  
> -	__format = __ov5645_get_pad_format(ov5645, sd_state, format->pad,
> -					   format->which);
> +	__format = v4l2_subdev_state_get_format(sd_state, 0);
>  	__format->width = __crop->width;
>  	__format->height = __crop->height;
>  	__format->code = MEDIA_BUS_FMT_UYVY8_1X16;
> @@ -944,11 +897,15 @@ static int ov5645_set_format(struct v4l2_subdev *sd,
>  static int ov5645_init_state(struct v4l2_subdev *subdev,
>  			     struct v4l2_subdev_state *sd_state)
>  {
> -	struct v4l2_subdev_format fmt = { 0 };
> -
> -	fmt.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
> -	fmt.format.width = 1920;
> -	fmt.format.height = 1080;
> +	struct v4l2_subdev_format fmt = {
> +		.which = V4L2_SUBDEV_FORMAT_TRY,
> +		.pad = 0,
> +		.format = {
> +			.code = MEDIA_BUS_FMT_UYVY8_1X16,
> +			.width = ov5645_mode_info_data[1].width,
> +			.height = ov5645_mode_info_data[1].height,
> +		},
> +	};
>  
>  	ov5645_set_format(subdev, sd_state, &fmt);
>  
> @@ -959,25 +916,27 @@ static int ov5645_get_selection(struct v4l2_subdev *sd,
>  			   struct v4l2_subdev_state *sd_state,
>  			   struct v4l2_subdev_selection *sel)
>  {
> -	struct ov5645 *ov5645 = to_ov5645(sd);
> -
>  	if (sel->target != V4L2_SEL_TGT_CROP)
>  		return -EINVAL;
>  
> -	sel->r = *__ov5645_get_pad_crop(ov5645, sd_state, sel->pad,
> -					sel->which);
> +	sel->r = *v4l2_subdev_state_get_crop(sd_state, 0);
>  	return 0;
>  }
>  
>  static int ov5645_s_stream(struct v4l2_subdev *subdev, int enable)
>  {
>  	struct ov5645 *ov5645 = to_ov5645(subdev);
> +	struct v4l2_subdev_state *state;
>  	int ret;
>  
> +	state = v4l2_subdev_lock_and_get_active_state(&ov5645->sd);
> +
>  	if (enable) {
>  		ret = pm_runtime_resume_and_get(ov5645->dev);
> -		if (ret < 0)
> +		if (ret < 0) {
> +			v4l2_subdev_unlock_state(state);
>  			return ret;
> +		}
>  
>  		ret = ov5645_set_register_array(ov5645,
>  					ov5645->current_mode->data,
> @@ -988,7 +947,7 @@ static int ov5645_s_stream(struct v4l2_subdev *subdev, int enable)
>  				ov5645->current_mode->height);
>  			goto err_rpm_put;
>  		}
> -		ret = v4l2_ctrl_handler_setup(&ov5645->ctrls);
> +		ret = __v4l2_ctrl_handler_setup(&ov5645->ctrls);
>  		if (ret < 0) {
>  			dev_err(ov5645->dev, "could not sync v4l2 controls\n");
>  			goto err_rpm_put;
> @@ -1013,6 +972,7 @@ static int ov5645_s_stream(struct v4l2_subdev *subdev, int enable)
>  		goto stream_off_rpm_put;
>  	}
>  
> +	v4l2_subdev_unlock_state(state);
>  	return 0;
>  
>  err_rpm_put:
> @@ -1022,6 +982,7 @@ static int ov5645_s_stream(struct v4l2_subdev *subdev, int enable)
>  stream_off_rpm_put:
>  	pm_runtime_mark_last_busy(ov5645->dev);
>  	pm_runtime_put_autosuspend(ov5645->dev);
> +	v4l2_subdev_unlock_state(state);
>  	return ret;
>  }
>  
> @@ -1032,7 +993,7 @@ static const struct v4l2_subdev_video_ops ov5645_video_ops = {
>  static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
>  	.enum_mbus_code = ov5645_enum_mbus_code,
>  	.enum_frame_size = ov5645_enum_frame_size,
> -	.get_fmt = ov5645_get_format,
> +	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = ov5645_set_format,
>  	.get_selection = ov5645_get_selection,
>  };
> @@ -1213,12 +1174,17 @@ static int ov5645_probe(struct i2c_client *client)
>  		goto power_down;
>  	}
>  
> -	ov5645_init_state(&ov5645->sd, NULL);
> +	ov5645->sd.state_lock = ov5645->ctrls.lock;
> +	ret = v4l2_subdev_init_finalize(&ov5645->sd);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret, "subdev init error\n");
> +		goto power_down;
> +	}
>  
>  	ret = v4l2_async_register_subdev_sensor(&ov5645->sd);
>  	if (ret < 0) {
>  		dev_err_probe(dev, ret, "could not register v4l2 device\n");
> -		goto power_down;
> +		goto error_subdev_cleanup;
>  	}
>  
>  	pm_runtime_set_active(dev);
> @@ -1231,6 +1197,8 @@ static int ov5645_probe(struct i2c_client *client)
>  
>  	return 0;
>  
> +error_subdev_cleanup:
> +	v4l2_subdev_cleanup(&ov5645->sd);
>  power_down:
>  	ov5645_set_power_off(dev);
>  free_entity:
> @@ -1247,6 +1215,7 @@ static void ov5645_remove(struct i2c_client *client)
>  	struct ov5645 *ov5645 = to_ov5645(sd);
>  
>  	v4l2_async_unregister_subdev(&ov5645->sd);
> +	v4l2_subdev_cleanup(sd);
>  	media_entity_cleanup(&ov5645->sd.entity);
>  	v4l2_ctrl_handler_free(&ov5645->ctrls);
>  	pm_runtime_disable(ov5645->dev);

-- 
Regards,

Laurent Pinchart

