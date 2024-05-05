Return-Path: <linux-media+bounces-10812-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C98658BC3EB
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 23:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B29F1F21D21
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 21:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 078EB762EF;
	Sun,  5 May 2024 21:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MXGfRj/T"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DBF2555B;
	Sun,  5 May 2024 21:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714943744; cv=none; b=NMu7Xpww4eE/uV+wz/A/rvw6H+8r3tC6KV7btp6SHXDCmQc5kBMq12GIFOQFtGKO69w7vrSy04xHSE0K3ZqAxiLx+4cArQORAAJIsYzTMluFsnP8TR19+BR2DZcWolLzL7nNt2ziauk69d9er+rtLOqdbgb3enOi2TEnkFdWAPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714943744; c=relaxed/simple;
	bh=kH6x2OlvoRgcuPvx3pU4GrLxjUX56XhvybB2dmUxZYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rnMQnFr0tq1i5QSWIsCmZt5gMsFFfNexa258cFtnNU5yh5b7/2sKKYN+ceftBIvsEXyigCgcwZ6/OvyO7LPYs/k/GNuw2Qv3A7gGqkvOgqOQbmR8Mzk+xFsRLOs7Tg/IBWKIN94vLZACkCvNfihvq+hTXhB3eNrIKTPqiGeIXxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MXGfRj/T; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C340663B;
	Sun,  5 May 2024 23:15:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714943740;
	bh=kH6x2OlvoRgcuPvx3pU4GrLxjUX56XhvybB2dmUxZYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MXGfRj/Tq5AA/9jvO8QNzNKL25eBNAKHG189Ud7YIYSuGQYUG0eSneaqRd2MymetE
	 Gy4ZGMjXMLIsT6galmm/mBNc687buL0SN5g0QqMhQWhFi3izLXEEhQNYn4sws9yrWj
	 d/b5amKLmkYHq7zCkkr1JHX0ekRKaFVA8Rbq17zw=
Date: Mon, 6 May 2024 00:15:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 08/11] media: adv748x-csi2: Use the subdev active state
Message-ID: <20240505211533.GF23227@pendragon.ideasonboard.com>
References: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
 <20240503155127.105235-9-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240503155127.105235-9-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Fri, May 03, 2024 at 05:51:23PM +0200, Jacopo Mondi wrote:
> Initialize and use the subdev active state to store the subdevice
> format.
> 
> This simplifies the implementation of the get_fmt and set_fmt pad
> operations.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/i2c/adv748x/adv748x-csi2.c | 114 ++++++++---------------
>  drivers/media/i2c/adv748x/adv748x.h      |   1 -
>  2 files changed, 41 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> index 1aae6467ca62..15a77387b32e 100644
> --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> @@ -6,7 +6,6 @@
>   */
>  
>  #include <linux/module.h>
> -#include <linux/mutex.h>
>  
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
> @@ -14,13 +13,6 @@
>  
>  #include "adv748x.h"
>  
> -static const struct v4l2_mbus_framefmt adv748x_csi2_default_fmt = {
> -	.width = 1280,
> -	.height = 720,
> -	.code = MEDIA_BUS_FMT_YUYV8_1X16,
> -	.field = V4L2_FIELD_NONE,
> -};
> -
>  static const unsigned int adv748x_csi2_txa_fmts[] = {
>  	MEDIA_BUS_FMT_YUYV8_1X16,
>  	MEDIA_BUS_FMT_YUYV10_1X20,
> @@ -78,7 +70,32 @@ static int adv748x_csi2_register_link(struct adv748x_csi2 *tx,
>  
>  /* -----------------------------------------------------------------------------
>   * v4l2_subdev_internal_ops
> - *
> + */
> +
> +static int adv748x_csi2_init_state(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_state *state)
> +{
> +	static const struct v4l2_mbus_framefmt adv748x_csi2_default_fmt = {
> +		.width		= 1280,
> +		.height		= 720,
> +		.code		= MEDIA_BUS_FMT_YUYV8_1X16,

I think this should be UYVY8.

> +		.colorspace	= V4L2_COLORSPACE_SRGB,
> +		.field		= V4L2_FIELD_NONE,
> +		.ycbcr_enc	= V4L2_YCBCR_ENC_DEFAULT,
> +		.quantization	= V4L2_QUANTIZATION_DEFAULT,
> +		.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
> +	};
> +	struct v4l2_mbus_framefmt *fmt;
> +
> +	fmt = v4l2_subdev_state_get_format(state, ADV748X_CSI2_SINK);
> +	*fmt = adv748x_csi2_default_fmt;
> +
> +	*v4l2_subdev_state_get_format(state, ADV748X_CSI2_SOURCE) = *fmt;

For consistency, I'd write

	fmt = v4l2_subdev_state_get_format(state, ADV748X_CSI2_SOURCE);
	*fmt = adv748x_csi2_default_fmt;

> +
> +	return 0;
> +}
> +
> +/*
>   * We use the internal registered operation to be able to ensure that our
>   * incremental subdevices (not connected in the forward path) can be registered
>   * against the resulting video path and media device.
> @@ -128,6 +145,7 @@ static int adv748x_csi2_registered(struct v4l2_subdev *sd)
>  }
>  
>  static const struct v4l2_subdev_internal_ops adv748x_csi2_internal_ops = {
> +	.init_state = adv748x_csi2_init_state,
>  	.registered = adv748x_csi2_registered,
>  };
>  
> @@ -180,41 +198,6 @@ static int adv748x_csi2_enum_mbus_code(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> -static struct v4l2_mbus_framefmt *
> -adv748x_csi2_get_pad_format(struct v4l2_subdev *sd,
> -			    struct v4l2_subdev_state *sd_state,
> -			    unsigned int pad, u32 which)
> -{
> -	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
> -
> -	if (which == V4L2_SUBDEV_FORMAT_TRY)
> -		return v4l2_subdev_state_get_format(sd_state, pad);
> -
> -	return &tx->format;
> -}
> -
> -static int adv748x_csi2_get_format(struct v4l2_subdev *sd,
> -				   struct v4l2_subdev_state *sd_state,
> -				   struct v4l2_subdev_format *sdformat)
> -{
> -	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
> -	struct adv748x_state *state = tx->state;
> -	struct v4l2_mbus_framefmt *mbusformat;
> -
> -	mbusformat = adv748x_csi2_get_pad_format(sd, sd_state, sdformat->pad,
> -						 sdformat->which);
> -	if (!mbusformat)
> -		return -EINVAL;
> -
> -	mutex_lock(&state->mutex);
> -
> -	sdformat->format = *mbusformat;
> -
> -	mutex_unlock(&state->mutex);
> -
> -	return 0;
> -}
> -
>  static int adv748x_csi2_is_fmt_supported(struct adv748x_csi2 *tx,
>  					 unsigned int code)
>  {
> @@ -237,10 +220,12 @@ static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
>  				   struct v4l2_subdev_format *sdformat)
>  {
>  	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
> -	struct adv748x_state *state = tx->state;
>  	struct v4l2_mbus_framefmt *mbusformat;
>  	int ret;
>  
> +	if (sdformat->pad == ADV748X_CSI2_SOURCE)
> +		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
> +
>  	/*
>  	 * Make sure the format is supported, if not default it to
>  	 * YUYV8 as it's supported by both TXes.
> @@ -249,34 +234,14 @@ static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
>  	if (ret)
>  		sdformat->format.code = MEDIA_BUS_FMT_YUYV8_1X16;
>  
> -	mbusformat = adv748x_csi2_get_pad_format(sd, sd_state, sdformat->pad,
> -						 sdformat->which);
> -	if (!mbusformat)
> -		return -EINVAL;
> -
> -	mutex_lock(&state->mutex);

The function was locking the device-wide mutex, now it's only locking
the state of this particular subdev. Have you checked this doesn't
introduce any race condition ? If so, please indicate it in the commit
message. If so, please check it :-)

> -
> -	if (sdformat->pad == ADV748X_CSI2_SOURCE) {
> -		const struct v4l2_mbus_framefmt *sink_fmt;
> -
> -		sink_fmt = adv748x_csi2_get_pad_format(sd, sd_state,
> -						       ADV748X_CSI2_SINK,
> -						       sdformat->which);
> -
> -		if (!sink_fmt) {
> -			ret = -EINVAL;
> -			goto unlock;
> -		}
> -
> -		sdformat->format = *sink_fmt;
> -	}
> -
> +	mbusformat = v4l2_subdev_state_get_format(sd_state, sdformat->pad);
>  	*mbusformat = sdformat->format;
>  
> -unlock:
> -	mutex_unlock(&state->mutex);
> +	/* Propagate format to the source pad. */
> +	mbusformat = v4l2_subdev_state_get_format(sd_state, ADV748X_CSI2_SOURCE);
> +	*mbusformat = sdformat->format;
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
> @@ -295,7 +260,7 @@ static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad
>  
>  static const struct v4l2_subdev_pad_ops adv748x_csi2_pad_ops = {
>  	.enum_mbus_code = adv748x_csi2_enum_mbus_code,
> -	.get_fmt = adv748x_csi2_get_format,
> +	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = adv748x_csi2_set_format,
>  	.get_mbus_config = adv748x_csi2_get_mbus_config,
>  };
> @@ -378,8 +343,6 @@ int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx)
>  	if (ret)
>  		return ret;
>  
> -	tx->format = adv748x_csi2_default_fmt;
> -
>  	ret = v4l2_async_subdev_endpoint_add(&tx->sd,
>  					     of_fwnode_handle(state->endpoints[tx->port]));
>  	if (ret)
> @@ -389,6 +352,11 @@ int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx)
>  	if (ret)
>  		goto err_cleanup_subdev;
>  
> +	tx->sd.state_lock = &state->mutex;

Ah, that answers my question above.

Can you also convert the AFE and HDMI subdevs to use the active state ?

> +	ret = v4l2_subdev_init_finalize(&tx->sd);
> +	if (ret)
> +		goto err_free_ctrl;
> +
>  	ret = v4l2_async_register_subdev(&tx->sd);
>  	if (ret)
>  		goto err_free_ctrl;
> diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
> index d2b5e722e997..9bc0121d0eff 100644
> --- a/drivers/media/i2c/adv748x/adv748x.h
> +++ b/drivers/media/i2c/adv748x/adv748x.h
> @@ -75,7 +75,6 @@ enum adv748x_csi2_pads {
>  
>  struct adv748x_csi2 {
>  	struct adv748x_state *state;
> -	struct v4l2_mbus_framefmt format;
>  	unsigned int page;
>  	unsigned int port;
>  	unsigned int num_lanes;

-- 
Regards,

Laurent Pinchart

