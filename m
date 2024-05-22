Return-Path: <linux-media+bounces-11723-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9942E8CC119
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 14:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5B36B22E5B
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 12:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A5C113D8A4;
	Wed, 22 May 2024 12:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RyeKqYOA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1A013D62D;
	Wed, 22 May 2024 12:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716380490; cv=none; b=PZfl56PpCzQ7k01ZBwAaSYzJuUN/GIavtK3TXIoLaTfZs395QLQfUoTPvGyVaLBy7sm5uefIW8BJNXYiGfxTfJrwoclqJZSXZCnc7cD2zrcQYx+JzSm/0ih9snbtY4LETcku4JPpocFycpThzSMN2jX+mb8cYhR022XDLJk+7+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716380490; c=relaxed/simple;
	bh=hzDqcEVZczl67qDnlsWcKq7XBZk+9h4IydSU9s+R7sA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nCbCs28fEs5Wy2ebrqK3Qedvj8o+bYFMokkYHHEGf+XmxXzAnSuAt/+9ecjykcsMD3BHbo/gSOs4vkDvA3Hcv/9NXmf6y8FhTBRdEJG1qqCseWESNiVT/HGRuuFFYdwYKLDqiqbOVk0JtAQxnN5NrmZH7hZyM1mJ4h7bY7e6dYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RyeKqYOA; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716380488; x=1747916488;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hzDqcEVZczl67qDnlsWcKq7XBZk+9h4IydSU9s+R7sA=;
  b=RyeKqYOAHhIOHJkG8DWopysFJ+fGWdgUeB10atmw879HfmwY5qaPl7yP
   gJDoLbjfVZjuDnyVC1yB+xsrmnHAiNUR1CuY26K2MBxd/4oTvDw5NEXVv
   JE4ciE1HsE7ZgCtiyP7hLjCNKC1aPbjr/rBVH+jUF/+FU09jMQdqKQ3LT
   rZIEQUsEkVSfQDMu0yTrVXxBbQZEp+fsWQfEJCmzUjMq0F7vVeYh+m5Ze
   B7tF304a0JtZd+L28JudW0g0yCD+c+054zMkadfdQRX5EjhA0XGMe6/Mv
   NRVuQv5Pf0bBcvdquZNr1cuYyqQjQwpOue9LOtRMeV1LLY9jVYnfSEytN
   A==;
X-CSE-ConnectionGUID: kzOa2pOOR5S+z++Wb9/w+A==
X-CSE-MsgGUID: VMAQUb/2R2yOUnkgWvqffw==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="12479968"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="12479968"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 05:21:27 -0700
X-CSE-ConnectionGUID: h0jhHJLvT8uMCyeb+KKllQ==
X-CSE-MsgGUID: zY3mlADhSbetoiQu5W0hoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="33181950"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 05:21:24 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E0FE211F82A;
	Wed, 22 May 2024 15:21:21 +0300 (EEST)
Date: Wed, 22 May 2024 12:21:21 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Cc: Alain Volmat <alain.volmat@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
	Pavel Machek <pavel@ucw.cz>,
	Arnaud Ferraris <arnaud.ferraris@collabora.com>
Subject: Re: [PATCH v3 2/2] media: gc2145: implement basic dvp bus support
Message-ID: <Zk3jQQDrgVqOnoQk@kekkonen.localdomain>
References: <20240504164115.64603-1-andrej.skvortzov@gmail.com>
 <20240504164115.64603-3-andrej.skvortzov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240504164115.64603-3-andrej.skvortzov@gmail.com>

Hi Andrey,

Thanks for the update.

On Sat, May 04, 2024 at 07:41:15PM +0300, Andrey Skvortsov wrote:
> That was tested on PinePhone with libcamera-based GNOME
> screenshot (45.2).
> 
> Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> ---
>  drivers/media/i2c/gc2145.c | 112 ++++++++++++++++++++++++++++---------
>  1 file changed, 86 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/media/i2c/gc2145.c b/drivers/media/i2c/gc2145.c
> index bef7b0e056a8..9808bd0ab6ae 100644
> --- a/drivers/media/i2c/gc2145.c
> +++ b/drivers/media/i2c/gc2145.c
> @@ -39,6 +39,10 @@
>  #define GC2145_REG_ANALOG_MODE1	CCI_REG8(0x17)
>  #define GC2145_REG_OUTPUT_FMT	CCI_REG8(0x84)
>  #define GC2145_REG_SYNC_MODE	CCI_REG8(0x86)
> +#define GC2145_SYNC_MODE_VSYNC_POL	BIT(0)
> +#define GC2145_SYNC_MODE_HSYNC_POL	BIT(1)
> +#define GC2145_SYNC_MODE_OPCLK_POL	BIT(2)
> +#define GC2145_SYNC_MODE_OPCLK_GATE	BIT(3)
>  #define GC2145_SYNC_MODE_COL_SWITCH	BIT(4)
>  #define GC2145_SYNC_MODE_ROW_SWITCH	BIT(5)
>  #define GC2145_REG_BYPASS_MODE	CCI_REG8(0x89)
> @@ -598,6 +602,7 @@ struct gc2145 {
>  	struct v4l2_subdev sd;
>  	struct media_pad pad;
>  
> +	struct v4l2_fwnode_endpoint ep; /* the parsed DT endpoint info */
>  	struct regmap *regmap;
>  	struct clk *xclk;
>  
> @@ -773,6 +778,36 @@ static int gc2145_set_pad_format(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int gc2145_config_dvp_mode(struct gc2145 *gc2145,
> +				  const struct gc2145_format *gc2145_format)
> +{
> +	int ret = 0;
> +	u64 sync_mode;
> +	int flags = gc2145->ep.bus.parallel.flags;
> +
> +	ret = cci_read(gc2145->regmap, GC2145_REG_SYNC_MODE, &sync_mode, NULL);
> +	if (ret)
> +		return ret;
> +
> +	sync_mode &= ~(GC2145_SYNC_MODE_VSYNC_POL |
> +		       GC2145_SYNC_MODE_HSYNC_POL |
> +		       GC2145_SYNC_MODE_OPCLK_POL);
> +
> +	if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
> +		sync_mode |= GC2145_SYNC_MODE_VSYNC_POL;
> +
> +	if (flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)
> +		sync_mode |= GC2145_SYNC_MODE_HSYNC_POL;
> +
> +	if (flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)
> +		sync_mode |= GC2145_SYNC_MODE_OPCLK_POL;
> +
> +	cci_write(gc2145->regmap, GC2145_REG_SYNC_MODE, sync_mode, &ret);
> +	cci_write(gc2145->regmap, GC2145_REG_PAD_IO, 0x0f, &ret);
> +
> +	return ret;
> +}
> +
>  static const struct cci_reg_sequence gc2145_common_mipi_regs[] = {
>  	{GC2145_REG_PAGE_SELECT, 0x03},
>  	{GC2145_REG_DPHY_ANALOG_MODE1, GC2145_DPHY_MODE_PHY_CLK_EN |
> @@ -895,10 +930,13 @@ static int gc2145_start_streaming(struct gc2145 *gc2145,
>  		goto err_rpm_put;
>  	}
>  
> -	/* Perform MIPI specific configuration */
> -	ret = gc2145_config_mipi_mode(gc2145, gc2145_format);
> +	/* Perform interface specific configuration */
> +	if (gc2145->ep.bus_type == V4L2_MBUS_CSI2_DPHY)
> +		ret = gc2145_config_mipi_mode(gc2145, gc2145_format);
> +	else
> +		ret = gc2145_config_dvp_mode(gc2145, gc2145_format);
>  	if (ret) {
> -		dev_err(&client->dev, "%s failed to write mipi conf\n",
> +		dev_err(&client->dev, "%s failed to write interface conf\n",
>  			__func__);
>  		goto err_rpm_put;
>  	}
> @@ -924,6 +962,9 @@ static void gc2145_stop_streaming(struct gc2145 *gc2145)
>  			GC2145_CSI2_MODE_EN | GC2145_CSI2_MODE_MIPI_EN, 0,
>  			&ret);
>  	cci_write(gc2145->regmap, GC2145_REG_PAGE_SELECT, 0x00, &ret);
> +
> +	/* Disable dvp streaming */
> +	cci_write(gc2145->regmap, GC2145_REG_PAD_IO, 0x00, &ret);
>  	if (ret)
>  		dev_err(&client->dev, "%s failed to write regs\n", __func__);
>  
> @@ -1233,9 +1274,8 @@ static int gc2145_init_controls(struct gc2145 *gc2145)
>  static int gc2145_check_hwcfg(struct device *dev)
>  {
>  	struct fwnode_handle *endpoint;
> -	struct v4l2_fwnode_endpoint ep_cfg = {
> -		.bus_type = V4L2_MBUS_CSI2_DPHY
> -	};
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct gc2145 *gc2145 = to_gc2145(sd);

As the bindings default to bus-type 4, you should reflect that here. I.e.
try parsing the endpoint with bus_type set to 4 first before setting it to
V4L2_MBUS_UNKNOWN.

You'll also need to set the parallel defaults here before parsing the
endpoint.

>  	int ret;
>  
>  	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
> @@ -1244,36 +1284,55 @@ static int gc2145_check_hwcfg(struct device *dev)
>  		return -EINVAL;
>  	}
>  
> -	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep_cfg);
> +	gc2145->ep.bus_type = V4L2_MBUS_CSI2_DPHY;
> +	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &gc2145->ep);
> +	if (ret) {
> +		gc2145->ep.bus_type = V4L2_MBUS_PARALLEL;
> +		ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &gc2145->ep);
> +	}
>  	fwnode_handle_put(endpoint);
> -	if (ret)
> +	if (ret) {
> +		dev_err(dev, "could not parse endpoint\n");
>  		return ret;
> -
> -	/* Check the number of MIPI CSI2 data lanes */
> -	if (ep_cfg.bus.mipi_csi2.num_data_lanes != 2) {
> -		dev_err(dev, "only 2 data lanes are currently supported\n");
> -		ret = -EINVAL;
> -		goto out;
>  	}
>  
> -	/* Check the link frequency set in device tree */
> -	if (!ep_cfg.nr_of_link_frequencies) {
> -		dev_err(dev, "link-frequency property not found in DT\n");
> +	switch (gc2145->ep.bus_type) {
> +	case V4L2_MBUS_CSI2_DPHY:
> +		/* Check the number of MIPI CSI2 data lanes */
> +		if (gc2145->ep.bus.mipi_csi2.num_data_lanes != 2) {
> +			dev_err(dev, "only 2 data lanes are currently supported\n");
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		/* Check the link frequency set in device tree */
> +		if (!gc2145->ep.nr_of_link_frequencies) {
> +			dev_err(dev, "link-frequencies property not found in DT\n");
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		if (gc2145->ep.nr_of_link_frequencies != 3 ||
> +		    gc2145->ep.link_frequencies[0] != GC2145_640_480_LINKFREQ ||
> +		    gc2145->ep.link_frequencies[1] != GC2145_1280_720_LINKFREQ ||
> +		    gc2145->ep.link_frequencies[2] != GC2145_1600_1200_LINKFREQ) {

I guess this works as long as all the ghree frequencies are what the driver
expects but the driver implementation could be improved. Nearly all other
drivers use the available frequencies only.

> +			dev_err(dev, "Invalid link-frequencies provided\n");
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +		break;
> +	case V4L2_MBUS_PARALLEL:
> +		break;
> +	default:
> +		dev_err(dev, "unsupported bus type %u\n", gc2145->ep.bus_type);
>  		ret = -EINVAL;
>  		goto out;
>  	}
>  
> -	if (ep_cfg.nr_of_link_frequencies != 3 ||
> -	    ep_cfg.link_frequencies[0] != GC2145_640_480_LINKFREQ ||
> -	    ep_cfg.link_frequencies[1] != GC2145_1280_720_LINKFREQ ||
> -	    ep_cfg.link_frequencies[2] != GC2145_1600_1200_LINKFREQ) {
> -		dev_err(dev, "Invalid link-frequencies provided\n");
> -		ret = -EINVAL;
> -	}
> +	return 0;
>  
>  out:
> -	v4l2_fwnode_endpoint_free(&ep_cfg);
> -
> +	v4l2_fwnode_endpoint_free(&gc2145->ep);

A newline would be nice here.

>  	return ret;
>  }
>  
> @@ -1421,6 +1480,7 @@ static void gc2145_remove(struct i2c_client *client)
>  	if (!pm_runtime_status_suspended(&client->dev))
>  		gc2145_power_off(&client->dev);
>  	pm_runtime_set_suspended(&client->dev);
> +	v4l2_fwnode_endpoint_free(&gc2145->ep);
>  }
>  
>  static const struct of_device_id gc2145_dt_ids[] = {

-- 
Kind regards,

Sakari Ailus

