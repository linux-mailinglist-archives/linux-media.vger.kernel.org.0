Return-Path: <linux-media+bounces-11307-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A5B8C21D1
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 12:14:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E918B235DF
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 10:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE7C16C693;
	Fri, 10 May 2024 10:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tLOBnQLt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6F0165FDC;
	Fri, 10 May 2024 10:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715336038; cv=none; b=l7jwTAIpvJFafkT3PWxRcjiQX8YfuUlmzCR8to0IyxGQm7MhIfRsaaOCtZsCyZn8oQzh1wAtVrbBCedBTiHpC1izzAsMwmgK/A0UmOuEXILG1FRHwOnMwsfiyxDGysA+9CMuz55s2jEltwdxz2kCS3kRBdtvAqxEp3lBH2T9+1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715336038; c=relaxed/simple;
	bh=Zz5xsLLA2yKO/jmoajp3ttU17Tlv0yLtd31mifiBwZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fa1S2PTrcUfmgv15YRkY4gjlyp+hrtufqHQip4PabPV3/gVYxjp+ZoSINW0fBbl2mQ3E51ZGuiHbmxkRaAiIWW8iGabwX0DIh1BV9hYQVZ1EAKEbtFIf9jOqVU1tHtbwQMNiESqNP+IPByAwZwKYDxq+2uKJOZfR46XCMo+iw68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tLOBnQLt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0CAB289;
	Fri, 10 May 2024 12:13:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715336025;
	bh=Zz5xsLLA2yKO/jmoajp3ttU17Tlv0yLtd31mifiBwZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tLOBnQLtBKoc42pAMyWc93bBOxlfWuV2zs/xKdHOrppa+nh5PeOCfUXDDZ0OOr/nH
	 Ny3dSpSt4YGc91v0oaMdOkNL7j34h7H0hSAccasrWC9fdWLbizoMjnWIjTZV6CPFE5
	 wtTkGPufUuv6WGoj9SZ84JjBvRYZJSqFUbofPjsE=
Date: Fri, 10 May 2024 13:13:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: staging: max96712: Store format in subdev active
 state
Message-ID: <20240510101340.GG6407@pendragon.ideasonboard.com>
References: <20240510100347.102392-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240510100347.102392-1-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Fri, May 10, 2024 at 12:03:47PM +0200, Niklas Söderlund wrote:
> Create and store the subdevice format in the subdevices active state.
> This change do not have a huge effect on the driver as it do not yet
> support changing the format.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> Hello,
> 
> This change is mostly to align all driver used in the R-Car VIN pipeline
> to use the same set of API and to make it easier to extend them in
> tandem going forward.
> 
> This should be seen as a compliment to Jacopo's larger work in "[PATCH
> v3 00/11] media: renesas: rcar-csi2: Use the subdev active state" which
> updates other drivers in the VIN pipeline to use the active state.
> ---
>  drivers/staging/media/max96712/max96712.c | 36 +++++++++++++++++------
>  1 file changed, 27 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> index c44145284aa1..2da65ccd2c57 100644
> --- a/drivers/staging/media/max96712/max96712.c
> +++ b/drivers/staging/media/max96712/max96712.c
> @@ -242,21 +242,34 @@ static const struct v4l2_subdev_video_ops max96712_video_ops = {
>  	.s_stream = max96712_s_stream,
>  };
>  
> -static int max96712_get_pad_format(struct v4l2_subdev *sd,
> -				   struct v4l2_subdev_state *sd_state,
> -				   struct v4l2_subdev_format *format)
> +static int max96712_init_state(struct v4l2_subdev *sd,
> +			       struct v4l2_subdev_state *state)
>  {
> -	format->format.width = 1920;
> -	format->format.height = 1080;
> -	format->format.code = MEDIA_BUS_FMT_RGB888_1X24;
> -	format->format.field = V4L2_FIELD_NONE;
> +	static const struct v4l2_mbus_framefmt default_fmt = {
> +		.width          = 1920,
> +		.height         = 1080,
> +		.code           = MEDIA_BUS_FMT_RGB888_1X24,
> +		.colorspace     = V4L2_COLORSPACE_SRGB,
> +		.field          = V4L2_FIELD_NONE,
> +		.ycbcr_enc      = V4L2_YCBCR_ENC_DEFAULT,
> +		.quantization   = V4L2_QUANTIZATION_DEFAULT,
> +		.xfer_func      = V4L2_XFER_FUNC_DEFAULT,
> +	};
> +	struct v4l2_mbus_framefmt *fmt;
> +
> +	fmt = v4l2_subdev_state_get_format(state, 0);
> +	*fmt = default_fmt;
>  
>  	return 0;
>  }
>  
> +static const struct v4l2_subdev_internal_ops max96712_internal_ops = {
> +	.init_state = max96712_init_state,
> +};
> +
>  static const struct v4l2_subdev_pad_ops max96712_pad_ops = {
> -	.get_fmt = max96712_get_pad_format,
> -	.set_fmt = max96712_get_pad_format,
> +	.get_fmt = v4l2_subdev_get_fmt,
> +	.set_fmt = v4l2_subdev_get_fmt,
>  };
>  
>  static const struct v4l2_subdev_ops max96712_subdev_ops = {
> @@ -293,6 +306,7 @@ static int max96712_v4l2_register(struct max96712_priv *priv)
>  	long pixel_rate;
>  	int ret;
>  
> +	priv->sd.internal_ops = &max96712_internal_ops;
>  	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max96712_subdev_ops);
>  	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>  	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> @@ -324,6 +338,10 @@ static int max96712_v4l2_register(struct max96712_priv *priv)
>  
>  	v4l2_set_subdevdata(&priv->sd, priv);
>  

I think it would be nice to already use the control handler lock as the
active state lock. Apart from that, the patch looks good to me.

> +	ret = v4l2_subdev_init_finalize(&priv->sd);
> +	if (ret)
> +		goto error;
> +
>  	ret = v4l2_async_register_subdev(&priv->sd);
>  	if (ret < 0) {
>  		dev_err(&priv->client->dev, "Unable to register subdevice\n");

-- 
Regards,

Laurent Pinchart

