Return-Path: <linux-media+bounces-30863-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3FCA99783
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 20:09:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06BF9168BA3
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 18:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC2728DEEF;
	Wed, 23 Apr 2025 18:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XnE3TI2m"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EFE266572;
	Wed, 23 Apr 2025 18:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745431784; cv=none; b=FwPlxZtWmPphTRUg94/lF7f4DP+LK0stL0b6mpF5M9jKd2ooUw25IgRuWiN9gUYwDxLzK4b2Gk4JIOBJHcNHg8bxrRi/xQiERnLNs7dS/DFTO1na7RVZdgUjVBUa2MPUuIsM19xtAO1Gk6GKTLpF4W4dMgqSY/ZrOnH9wU6qj6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745431784; c=relaxed/simple;
	bh=g2dikYIG1Egz8ZzBx+R2k1XUYQW/Cj9DIGZWGk+L8U8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NBZq0dW0wpCXSsNcQgwqj8qs1DKzhTWQAfUpV2JsQJ9hdy+L749aH/OB8bTZrfKf96KVLgx3LVTY3HawKflz86Db/c3M8/VlZ+XpXiuxsSr/oEACF/ApHpRKJZsBgm20AR74ZKpSbgTogwyITYMAjn5tim8AK38Ca/ALqbrXbsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XnE3TI2m; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 010CE1AE2;
	Wed, 23 Apr 2025 20:09:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745431778;
	bh=g2dikYIG1Egz8ZzBx+R2k1XUYQW/Cj9DIGZWGk+L8U8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XnE3TI2mG2rKV0+Eo7MfS7/PL++MrN7lopmj5xV28t75XkaIDKwyi+gFjfnTJXjt4
	 eK+WJlN4Emip1+NAT4Swqa70AZhwbAozslNyCr0RMcO9zQpsiVSFis1khWhu/pfOXm
	 TTatGxo7fO9wNH+lvKCZzF8xlSudxiDtOeAqIjBY=
Date: Wed, 23 Apr 2025 21:09:37 +0300
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
Subject: Re: [PATCH v4 2/6] media: mt9m114: Bypass PLL if required
Message-ID: <20250423180937.GB2675@pendragon.ideasonboard.com>
References: <20250307093140.370061-1-mathis.foerst@mt.com>
 <20250307093140.370061-3-mathis.foerst@mt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250307093140.370061-3-mathis.foerst@mt.com>

Hi Mathis,

Thank you for the patch.

On Fri, Mar 07, 2025 at 10:31:36AM +0100, Mathis Foerst wrote:
> The MT9M114 sensor has an internal PLL that generates the required SYSCLK
> from EXTCLK. It also has the option to bypass the PLL and use EXTCLK
> directly as SYSCLK.
> The current driver implementation uses a hardcoded PLL configuration that
> requires a specific EXTCLK frequency. Depending on the available clocks,
> it can be desirable to use a different PLL configuration or to bypass it.
> 
> The link-frequency of the output bus (Parallel or MIPI-CSI) is configured
> in the device tree.
> 
> Check if EXTCLK can be used as SYSCLK to achieve this link-frequency. If
> yes, bypass the PLL.
> Otherwise, (as before) check if EXTCLK and the default PLL configuration
> provide the required SYSCLK to achieve the link-frequency. If yes, use the
> PLL. If no, throw an error.
> 
> Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> ---
>  drivers/media/i2c/mt9m114.c | 62 ++++++++++++++++++++++++++-----------
>  1 file changed, 44 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index 5f0b0ad8f885..b06003b69f6f 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -261,6 +261,7 @@
>  #define MT9M114_CAM_PGA_PGA_CONTROL			CCI_REG16(0xc95e)
>  #define MT9M114_CAM_SYSCTL_PLL_ENABLE			CCI_REG8(0xc97e)
>  #define MT9M114_CAM_SYSCTL_PLL_ENABLE_VALUE			BIT(0)
> +#define MT9M114_CAM_SYSCTL_PLL_DISABLE_VALUE			0x00
>  #define MT9M114_CAM_SYSCTL_PLL_DIVIDER_M_N		CCI_REG16(0xc980)
>  #define MT9M114_CAM_SYSCTL_PLL_DIVIDER_VALUE(m, n)		(((n) << 8) | (m))
>  #define MT9M114_CAM_SYSCTL_PLL_DIVIDER_P		CCI_REG16(0xc982)
> @@ -377,6 +378,7 @@ struct mt9m114 {
>  	struct gpio_desc *reset;
>  	struct regulator_bulk_data supplies[3];
>  	struct v4l2_fwnode_endpoint bus_cfg;
> +	bool bypass_pll;
>  
>  	struct {
>  		unsigned int m;
> @@ -743,14 +745,20 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
>  	}
>  
>  	/* Configure the PLL. */
> -	cci_write(sensor->regmap, MT9M114_CAM_SYSCTL_PLL_ENABLE,
> -		  MT9M114_CAM_SYSCTL_PLL_ENABLE_VALUE, &ret);
> -	cci_write(sensor->regmap, MT9M114_CAM_SYSCTL_PLL_DIVIDER_M_N,
> -		  MT9M114_CAM_SYSCTL_PLL_DIVIDER_VALUE(sensor->pll.m,
> -						       sensor->pll.n),
> -		  &ret);
> -	cci_write(sensor->regmap, MT9M114_CAM_SYSCTL_PLL_DIVIDER_P,
> -		  MT9M114_CAM_SYSCTL_PLL_DIVIDER_P_VALUE(sensor->pll.p), &ret);
> +	if (sensor->bypass_pll) {
> +		cci_write(sensor->regmap, MT9M114_CAM_SYSCTL_PLL_ENABLE,
> +			  MT9M114_CAM_SYSCTL_PLL_DISABLE_VALUE, &ret);
> +	} else {
> +		cci_write(sensor->regmap, MT9M114_CAM_SYSCTL_PLL_ENABLE,
> +			  MT9M114_CAM_SYSCTL_PLL_ENABLE_VALUE, &ret);
> +		cci_write(sensor->regmap, MT9M114_CAM_SYSCTL_PLL_DIVIDER_M_N,
> +			  MT9M114_CAM_SYSCTL_PLL_DIVIDER_VALUE(sensor->pll.m,
> +							       sensor->pll.n),
> +			  &ret);
> +		cci_write(sensor->regmap, MT9M114_CAM_SYSCTL_PLL_DIVIDER_P,
> +			  MT9M114_CAM_SYSCTL_PLL_DIVIDER_P_VALUE(sensor->pll.p),
> +			  &ret);
> +	}

You can add a blank line here.

>  	cci_write(sensor->regmap, MT9M114_CAM_SENSOR_CFG_PIXCLK,
>  		  sensor->pixrate, &ret);
>  
> @@ -2235,9 +2243,19 @@ static const struct dev_pm_ops mt9m114_pm_ops = {
>   * Probe & Remove
>   */
>  
> +static int mt9m114_verify_link_frequency(struct mt9m114 *sensor)
> +{
> +	unsigned int link_freq = sensor->bus_cfg.bus_type == V4L2_MBUS_CSI2_DPHY
> +				? sensor->pixrate * 8 : sensor->pixrate * 2;

			       ? sensor->pixrate * 8 : sensor->pixrate * 2;

And missing blank line.

> +	if (sensor->bus_cfg.nr_of_link_frequencies != 1 ||
> +	    sensor->bus_cfg.link_frequencies[0] != link_freq)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
>  static int mt9m114_clk_init(struct mt9m114 *sensor)
>  {
> -	unsigned int link_freq;
>  
>  	/* Hardcode the PLL multiplier and dividers to default settings. */
>  	sensor->pll.m = 32;
> @@ -2249,19 +2267,27 @@ static int mt9m114_clk_init(struct mt9m114 *sensor)
>  	 * for 16-bit per pixel, transmitted in DDR over a single lane. For
>  	 * parallel mode, the sensor ouputs one pixel in two PIXCLK cycles.
>  	 */
> -	sensor->pixrate = clk_get_rate(sensor->clk) * sensor->pll.m
> -			/ ((sensor->pll.n + 1) * (sensor->pll.p + 1));
>  
> -	link_freq = sensor->bus_cfg.bus_type == V4L2_MBUS_CSI2_DPHY
> -		  ? sensor->pixrate * 8 : sensor->pixrate * 2;
> +	/*
> +	 * Check if EXTCLK fits the configured link frequency. Bypass the PLL
> +	 * in this case.
> +	 */
> +	sensor->pixrate = clk_get_rate(sensor->clk) / 2;
> +	if (mt9m114_verify_link_frequency(sensor) == 0) {

I would be cleaner to pass the pixel rate as a parameter to the
function:

	unsigned int pixrate;

	...

	pixrate = clk_get_rate(sensor->clk) / 2;
	if (mt9m114_verify_link_frequency(sensor, pixrate) == 0) {
		sensor->pixrate = pixrate;
		sensor->bypass_pll = true;
		return 0;
	}

> +		sensor->bypass_pll = true;
> +		return 0;
> +	}
>  
> -	if (sensor->bus_cfg.nr_of_link_frequencies != 1 ||
> -	    sensor->bus_cfg.link_frequencies[0] != link_freq) {
> -		dev_err(&sensor->client->dev, "Unsupported DT link-frequencies\n");
> -		return -EINVAL;
> +	/* Check if the PLL configuration fits the configured link frequency */

s/frequency/frequency./

With those small issues addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	sensor->pixrate = clk_get_rate(sensor->clk) * sensor->pll.m
> +			/ ((sensor->pll.n + 1) * (sensor->pll.p + 1));
> +	if (mt9m114_verify_link_frequency(sensor) == 0) {
> +		sensor->bypass_pll = false;
> +		return 0;
>  	}
>  
> -	return 0;
> +	dev_err(&sensor->client->dev, "Unsupported DT link-frequencies\n");
> +	return -EINVAL;
>  }
>  
>  static int mt9m114_identify(struct mt9m114 *sensor)

-- 
Regards,

Laurent Pinchart

