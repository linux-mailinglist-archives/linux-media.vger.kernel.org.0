Return-Path: <linux-media+bounces-30866-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F39A997CA
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 20:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 544481B84382
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 18:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D33C28E600;
	Wed, 23 Apr 2025 18:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Zin839r2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F45285401;
	Wed, 23 Apr 2025 18:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745432618; cv=none; b=sIBwM7+7h1yJncIXv9lqckoPvo9Wq+Q1LWCaMSpMJhithyDtn6y/W1Lmmr2RmRTs00QLK3PicI6r4/ZsEVSw28ky2jUvNECUs8VNEMGlx1DdZ2zbiYVili6/4aAxnSOvrHZ3WPYeaO7wOyHM4Mp66ts+Ezj21EhdLgD/fr0dIZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745432618; c=relaxed/simple;
	bh=0LUBeef6xrlXs1nsTaXFb3OvfS2lrB8cuZ2f25cjJqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVlcCUs3tGjOMBlH7q5HnZPXVk3IadKyiRnrzg8S08F9igo5dZHmEvjnf8V4giaiov0yeemYCx7/KLE2W3oHIZ3/G27+dBWwNAWJKpDptWVPil7Z27kBurX/pl427xwbDe5VdXBHbtNyr++MRBR7uau158Eth3c+4lGzYNg3S2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Zin839r2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 34E811AE2;
	Wed, 23 Apr 2025 20:23:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745432613;
	bh=0LUBeef6xrlXs1nsTaXFb3OvfS2lrB8cuZ2f25cjJqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zin839r2ha3Nqip/xCVgPMtbd0uyKQCtF4Xr8JHx8sB4sZ+7qPcSwG75qUL0dIvsc
	 krJMCkJKf24JvSHzUewTvGiyhycNJzlFFpLxmz2GDPnqF9O79wC/wEhN2R5sj+2c0v
	 nUBMgqRb7refHC7ZiUaaH4ALhBdRFWBb26iPEsfE=
Date: Wed, 23 Apr 2025 21:23:32 +0300
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
Subject: Re: [PATCH v4 6/6] media: mt9m114: Set pad-slew-rate
Message-ID: <20250423182332.GE2675@pendragon.ideasonboard.com>
References: <20250307093140.370061-1-mathis.foerst@mt.com>
 <20250307093140.370061-7-mathis.foerst@mt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250307093140.370061-7-mathis.foerst@mt.com>

Hi Mathis,

Thank you for the patch.

On Fri, Mar 07, 2025 at 10:31:40AM +0100, Mathis Foerst wrote:
> The MT9M114 supports the different slew rates (0 to 7) on the output pads.
> At the moment, this is hardcoded to 7 (the fastest rate).
> The user might want to change this values due to EMC requirements.
> 
> Read the 'slew-rate' from the DT and configure the pad slew rates of
> the output pads accordingly in mt9m114_initialize().
> Remove the hardcoded slew rate setting from the mt9m114_init table.
> 
> Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> ---
>  drivers/media/i2c/mt9m114.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index 79c97ab19be9..fce24c587782 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -42,6 +42,9 @@
>  #define MT9M114_RESET_AND_MISC_CONTROL			CCI_REG16(0x001a)
>  #define MT9M114_RESET_SOC					BIT(0)
>  #define MT9M114_PAD_SLEW				CCI_REG16(0x001e)
> +#define MT9M114_PAD_SLEW_MIN					0x00
> +#define MT9M114_PAD_SLEW_MAX					0x07
> +#define MT9M114_PAD_SLEW_DEFAULT				0x07

You can use decimal values here.

>  #define MT9M114_PAD_CONTROL				CCI_REG16(0x0032)
>  
>  /* XDMA registers */
> @@ -388,6 +391,7 @@ struct mt9m114 {
>  
>  	unsigned int pixrate;
>  	bool streaming;
> +	u32 pad_slew_rate;
>  
>  	/* Pixel Array */
>  	struct {
> @@ -645,9 +649,6 @@ static const struct cci_reg_sequence mt9m114_init[] = {
>  	{ MT9M114_CAM_SENSOR_CFG_FINE_INTEG_TIME_MAX,	1459 },
>  	{ MT9M114_CAM_SENSOR_CFG_FINE_CORRECTION,	96 },
>  	{ MT9M114_CAM_SENSOR_CFG_REG_0_DATA,		32 },
> -
> -	/* Miscellaneous settings */
> -	{ MT9M114_PAD_SLEW,				0x0777 },
>  };
>  
>  /* -----------------------------------------------------------------------------
> @@ -778,6 +779,13 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
>  	if (ret < 0)
>  		return ret;
>  
> +	value = (sensor->pad_slew_rate & 0xF)
> +	      | (sensor->pad_slew_rate & 0xF) << 4
> +	      |	(sensor->pad_slew_rate & 0xF) << 8;

No need for ' & 0xF' as you've ensured the slew rate value is in the
valid [0, 7] range.

> +	cci_write(sensor->regmap, MT9M114_PAD_SLEW, value, &ret);
> +	if (ret < 0)
> +		return ret;
> +
>  	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
>  	if (ret < 0)
>  		return ret;
> @@ -2357,6 +2365,8 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
>  {
>  	struct fwnode_handle *fwnode = dev_fwnode(&sensor->client->dev);
>  	struct fwnode_handle *ep;
> +	struct device_node *dev_node = sensor->client->dev.of_node;
> +	u32 slew_rate;
>  	int ret;
>  
>  	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> @@ -2385,6 +2395,11 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
>  		goto error;
>  	}
>  
> +	ret = of_property_read_u32(dev_node, "slew-rate", &slew_rate);

Direct usage of OF functions is discouraged. Use
device_property_read_u32() instead, which abstracts the firmware backend
(OF, ACPI, ...). Don't forget to include linux/property.h.

> +	if (ret || slew_rate < MT9M114_PAD_SLEW_MIN || slew_rate > MT9M114_PAD_SLEW_MAX)
> +		slew_rate = MT9M114_PAD_SLEW_DEFAULT;

If the value is erroneous, it indicates the DT is incorrect. I'd log a
message and return an error. As the DT property is optional, you can do
something like

	sensor->slew_rate = MT9M114_PAD_SLEW_DEFAULT;
	device_property_read_u32(&sensor->client.dev, "slew-rate",
				 &sensor->slew_rate);

	if (sensor->slew_rate < MT9M114_PAD_SLEW_MIN ||
	    sensor->slew_rate > MT9M114_PAD_SLEW_MAX) {
	    	dev_err(&sensor->client.dev, "Invalid slew-rate %u\n",
			sensor->slew_rate);
		return -EINVAL;
	}

With this,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	sensor->pad_slew_rate = slew_rate;
> +
>  	return 0;
>  
>  error:

-- 
Regards,

Laurent Pinchart

