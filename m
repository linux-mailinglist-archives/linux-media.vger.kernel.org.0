Return-Path: <linux-media+bounces-30864-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA027A99794
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 20:14:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDE431B83370
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 18:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD93828DEEF;
	Wed, 23 Apr 2025 18:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GaEWD2JM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8BD28D846;
	Wed, 23 Apr 2025 18:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745432083; cv=none; b=dODeAI6aShJr+YKNGUuXCnVWOctpMdZjKrqNyi2v9V08MfwrzP1aKVgKyVAvzUwVIgZzRVM0LHf7rle46XMYtR6cCqt9HA2LiAbEV+O+CLJRWrVFcQbxTNxandzQ7OMNW7xYmZjNw/d46sTgS7m9Ql8wN0ZNJdgbs3oqlM0worU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745432083; c=relaxed/simple;
	bh=tsWUiI/pJWVNER6fjpf9OzcFhaS6tefvjd8Xc3CN6ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BeTlj+GSbo3jCtMs/mLhwzIEbyjLzlkd/cnwN7ywM+kdSgN7uGhK0PHb9SfulNCMpoqvX+cDyRylehtn4Vp8sLK+7ygKKKFU2+9AIriUHR+sZKu0iRHAFLcd1SupcH/8SlL0a/nVsr40ydyRpTdnLvmz9Fc/oOuFky0Gead3Yc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GaEWD2JM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1DD631AE2;
	Wed, 23 Apr 2025 20:14:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745432078;
	bh=tsWUiI/pJWVNER6fjpf9OzcFhaS6tefvjd8Xc3CN6ps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GaEWD2JMy/jzjEq8eypSr4sbfUKydHYaJq3EBf4fyS2I5gvNhTobJlDCeHMbsotCW
	 dZXvjXW0iM7SeTUVWX9TrSdaqElNVe1Dbobq/BEJtdpcwxgXYvTK2V28zk1cwH891U
	 ZVZGYn2HxrKWZn6L99x8SGpHPACD4kIwcXtcTHWg=
Date: Wed, 23 Apr 2025 21:14:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mathis Foerst <mathis.foerst@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	manuel.traut@mt.com, mathis.foerst@zuehlke.com
Subject: Re: [PATCH v4 3/6] media: mt9m114: Factor out mt9m114_configure_pa
Message-ID: <20250423181437.GC2675@pendragon.ideasonboard.com>
References: <20250307093140.370061-1-mathis.foerst@mt.com>
 <20250307093140.370061-4-mathis.foerst@mt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250307093140.370061-4-mathis.foerst@mt.com>

Hi Mathis,

Thank you for the patch.

On Fri, Mar 07, 2025 at 10:31:37AM +0100, Mathis Foerst wrote:
> The function mt9m114_configure writes the configuration registers of both,
> the pixel array (pa) and the image flow processor (ifp).
> This is undesirable if only the config of the pa should be changed without
> affecting the ifp.

I assume I'll see in a later patch why this is needed.

> Factor out the function mt9m114_configure_pa() that just writes the
> pa-configuration.
> 
> Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> ---
>  drivers/media/i2c/mt9m114.c | 49 +++++++++++++++++++++++--------------
>  1 file changed, 30 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index b06003b69f6f..9a49dab65180 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -789,39 +789,22 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
>  	return 0;
>  }
>  
> -static int mt9m114_configure(struct mt9m114 *sensor,
> -			     struct v4l2_subdev_state *pa_state,
> -			     struct v4l2_subdev_state *ifp_state)
> +static int mt9m114_configure_pa(struct mt9m114 *sensor, struct v4l2_subdev_state *pa_state)

You can name the variable 'state' now that there's a single one.

static int mt9m114_configure_pa(struct mt9m114 *sensor,
				struct v4l2_subdev_state *state)

>  {
>  	const struct v4l2_mbus_framefmt *pa_format;
>  	const struct v4l2_rect *pa_crop;

Similarly, these can be renamed to format and crop.

> -	const struct mt9m114_format_info *ifp_info;
> -	const struct v4l2_mbus_framefmt *ifp_format;
> -	const struct v4l2_rect *ifp_crop;
> -	const struct v4l2_rect *ifp_compose;
> -	unsigned int hratio, vratio;
> -	u64 output_format;
>  	u64 read_mode;
> +	unsigned int hratio, vratio;

You can keep the order of the variables unchanged.

>  	int ret = 0;
>  
>  	pa_format = v4l2_subdev_state_get_format(pa_state, 0);
>  	pa_crop = v4l2_subdev_state_get_crop(pa_state, 0);
>  
> -	ifp_format = v4l2_subdev_state_get_format(ifp_state, 1);
> -	ifp_info = mt9m114_format_info(sensor, 1, ifp_format->code);
> -	ifp_crop = v4l2_subdev_state_get_crop(ifp_state, 0);
> -	ifp_compose = v4l2_subdev_state_get_compose(ifp_state, 0);
> -
>  	ret = cci_read(sensor->regmap, MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
>  		       &read_mode, NULL);
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = cci_read(sensor->regmap, MT9M114_CAM_OUTPUT_FORMAT,
> -		       &output_format, NULL);
> -	if (ret < 0)
> -		return ret;
> -
>  	hratio = pa_crop->width / pa_format->width;
>  	vratio = pa_crop->height / pa_format->height;
>  
> @@ -853,6 +836,34 @@ static int mt9m114_configure(struct mt9m114 *sensor,
>  	cci_write(sensor->regmap, MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
>  		  read_mode, &ret);
>  
> +	return ret;
> +}
> +
> +static int mt9m114_configure(struct mt9m114 *sensor,
> +			     struct v4l2_subdev_state *pa_state,
> +			     struct v4l2_subdev_state *ifp_state)
> +{
> +	const struct mt9m114_format_info *ifp_info;
> +	const struct v4l2_mbus_framefmt *ifp_format;
> +	const struct v4l2_rect *ifp_crop;
> +	const struct v4l2_rect *ifp_compose;

And here you can also drop the ifp_ prefix.

> +	u64 output_format;
> +	int ret = 0;

No need to initialize ret to 0.

> +
> +	ifp_format = v4l2_subdev_state_get_format(ifp_state, 1);
> +	ifp_info = mt9m114_format_info(sensor, 1, ifp_format->code);
> +	ifp_crop = v4l2_subdev_state_get_crop(ifp_state, 0);
> +	ifp_compose = v4l2_subdev_state_get_compose(ifp_state, 0);
> +
> +	ret = cci_read(sensor->regmap, MT9M114_CAM_OUTPUT_FORMAT,
> +		       &output_format, NULL);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = mt9m114_configure_pa(sensor, pa_state);
> +	if (ret < 0)
> +		return ret;
> +
>  	/*
>  	 * Color pipeline (IFP) cropping and scaling. Subtract 4 from the left
>  	 * and top coordinates to compensate for the lines and columns removed

For symmetry, could you call this mt9m114_configure_ifp() and move the
call to mt9m114_configure_pa() to mt9m114_start_streaming() ?

With those issues addressed, and assuming that the rationale for this
patch is good,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart

