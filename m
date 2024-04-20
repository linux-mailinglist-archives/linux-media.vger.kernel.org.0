Return-Path: <linux-media+bounces-9795-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DC88ABA36
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 10:01:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5E321C20E02
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 08:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A72B14012;
	Sat, 20 Apr 2024 08:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ISdIubNO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369DF13AC5
	for <linux-media@vger.kernel.org>; Sat, 20 Apr 2024 08:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713600079; cv=none; b=eynGaUDy5Tth+gn1S2n5QdfCkVRp0guUoPXvIqLmNl4QrY7FJT8yM6ct5bz/TmHZmjfr6/PZe+Sbl2k337g34wlq7hh9GfHQBoVnH9Ik62z1BSfnO3XOJIIyoRXTazSEZ1kvT1iXm37eUogowtzgjuXeLoiH0Q5VEAGF8Ct/8+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713600079; c=relaxed/simple;
	bh=d0T/peKDHz7Ds8rngxSo/ICPlIsoMFcOH02yppLP8kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V1435NoEumEXp61XejBkoCZ9Oyzm5ZHCynK8wGOY4JuLsT1XJb8NLEhAKTciPfCevUdvnSRtUhiBQtCSn/FcaMcwc82gq9+/AYwpR54MaaeIQ2C3z9KWPRIjqXBnJHpaWG5uLMG4D+9O9/fkv43V9wp0fgIoSLGlq9cQGzxhRtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ISdIubNO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F3AAE673;
	Sat, 20 Apr 2024 10:00:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713600028;
	bh=d0T/peKDHz7Ds8rngxSo/ICPlIsoMFcOH02yppLP8kw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ISdIubNOn8jlSr5SUtNSG/0UcfvG7CTy5Y62+xSbZ3hrmdUXcjTkb4Jk3vWIE/K6h
	 tEr3SzT6UoTzi+BrcF9PDVwIU/qVLtpF1VCymYlaqkyl2MXLkCbeIrgz735LZxUtKl
	 K3d4bZCqxDGy8vxriYDhRoYyqc+PD2ae4iM/cgOo=
Date: Sat, 20 Apr 2024 11:01:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 20/46] media: ccs: Rename out label of
 ccs_start_streaming
Message-ID: <20240420080108.GO6414@pendragon.ideasonboard.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-21-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240416193319.778192-21-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Tue, Apr 16, 2024 at 10:32:53PM +0300, Sakari Ailus wrote:
> In preparation for upcoming changes in the function, rename the out label
> as err_pm_put. The purpose of the label is changed to match its name in
> the next patch.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/ccs/ccs-core.c | 38 ++++++++++++++++----------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index d7bc9418eabb..d14e90f8568a 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -1767,7 +1767,7 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
>  			 (sensor->csi_format->width << 8) |
>  			 sensor->csi_format->compressed);
>  	if (rval)
> -		goto out;
> +		goto err_pm_put;
>  
>  	/* Binning configuration */
>  	if (sensor->binning_horizontal == 1 &&
> @@ -1780,38 +1780,38 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
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
> @@ -1824,22 +1824,22 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
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
> @@ -1847,20 +1847,20 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
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
> @@ -1869,18 +1869,18 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
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
> +err_pm_put:
>  	mutex_unlock(&sensor->mutex);
>  
>  	return rval;

-- 
Regards,

Laurent Pinchart

