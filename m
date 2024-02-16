Return-Path: <linux-media+bounces-5246-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E73F85775B
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 09:19:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03AFD282E4E
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 08:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2036E1EB4F;
	Fri, 16 Feb 2024 08:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fKbVpMrO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C941773D
	for <linux-media@vger.kernel.org>; Fri, 16 Feb 2024 08:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708070826; cv=none; b=mwieYsSKOowda+O9RzDkKGgvrG3o1juv18I0mxzQWj5E6oBKD5JqIqlpz2w5PlYwKgNz8//kwyrjODLpZOeoi3t7CvP7M6LTwxUPkGHjMKgfpfC+dtYb2zUElWhVxgITHTfa2StVnTcKepvqDtH9Q1ecQlSdIWhfCzRQDLOYBwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708070826; c=relaxed/simple;
	bh=UiP1Pk0vX8kiO2DMlyu58des/z/ZXvzMS7oGmZUaFx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wx+LpUq/CGW0PbXM8OCf2/69SSWVRryvCbXoE/AniSt+ceZX0GY7gp32BVWOUOXukAXEoPGHpPv/HhX5aHia2jQs2GG25Rk5mGt/vPZpxk1LrwtlBcZeI8VbcRFRD4Enm/FDODWmO4+73eyKCpHCcwzv+MTPRHz3NPjxYCV6CRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fKbVpMrO; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a3d6ea28d46so351822366b.1
        for <linux-media@vger.kernel.org>; Fri, 16 Feb 2024 00:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708070823; x=1708675623; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CWHtr9BiBDxNMhcw+tAJwCWT9s3nxhzbRXAhtlxCu5A=;
        b=fKbVpMrO/cbASJ+kCV8skGu3dgeKzoZsvor+0pTeSBd2mSJSjtVHG4xwLenZyFBt1p
         5DLqPk0Vpk6SUntheXyCdk3/aqlKWhe+NdqfYJr86dV/LGcBykHJgxet7gvZJJyk2Uay
         icdNBiPuiclA2X001gsjSvN2gK5cIEzCCu4me+jUJHroJvHW9Y+VTXPL0J6TI4fRRxl3
         l2R0i0ofiJmkE+IJ5KDf6Dw9F9ET2gbVXMZe0UR20erEuLVdMJwZmutNUC+Y8X2f6t/F
         qNFk02pzizb/brQ+P37Hrt9rYZZEOXbbpJLUDsW+pjVWhTJ3juuGs3f0oCeGVGvSKt89
         bBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708070823; x=1708675623;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CWHtr9BiBDxNMhcw+tAJwCWT9s3nxhzbRXAhtlxCu5A=;
        b=wsJnISV9utQq60j15hWeauUsmoYzLfkOClcdSWS8y5tP6ySs/6hT8/WpxvPnH/g5Mj
         81JmndFQNcbj3UnaLLimIjw2uZ9YCWyUaBV2kwrmJZJ+X5N8mePJU+uZIP0UDty2gvC8
         qlJAqiww5QHxM9kFqENA+5KQTgXDR0TtVuB5InhqkqAkBEVek3tfw/BNapatpHHdlWBM
         /NiOHnCWM4E3ubq+wKrHvwowQiFXobt1j3WDxI8dEgvzTn19rHO/Amojm+zRUWlNUt85
         fJy3adpfBUhoddhXYhJQ27zjeCP3I19Wn6qx3tjcj03gpUmgG6es0hJV+w7uLiEma0Kz
         6CJA==
X-Forwarded-Encrypted: i=1; AJvYcCVY+6BUzH9aW9BhQ+K+71UeDvGkR+n4Q3Q+38K51HNhnJ25rNtMbZW0EIudoCUQXWbFpQBMO8ZO71Azjk7Al6DnQjliIug0K1P6U4U=
X-Gm-Message-State: AOJu0YyZ4jXXTetKJ+5LiIQy9ivaFoYVmQVh0SzxvSk6vAQ8TVoZxX9e
	9l2SkHdeZw8PljYq/p8PmToc1Bsx6/Cp1Hm26rYFA6dqYaAyObK405s/q5GyFhY=
X-Google-Smtp-Source: AGHT+IH3NzSiOrcqfCovz/PxjhcWRES0TR8NtnosztZ3Y5lbU+SrIrJXhfFWoZO3+rBjij1btF9NmA==
X-Received: by 2002:a17:906:d29a:b0:a3d:6950:2d2f with SMTP id ay26-20020a170906d29a00b00a3d69502d2fmr3905755ejb.13.1708070822915;
        Fri, 16 Feb 2024 00:07:02 -0800 (PST)
Received: from [192.168.0.22] ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id s15-20020a17090699cf00b00a3bd8a34b1bsm1319130ejn.164.2024.02.16.00.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 00:07:02 -0800 (PST)
Message-ID: <668dafa8-b537-4fd1-94c6-d1bda732c410@linaro.org>
Date: Fri, 16 Feb 2024 09:07:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: i2c: Add imx283 camera sensor driver
Content-Language: en-US
To: Umang Jain <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 willl will <will@willwhang.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20240215204436.9194-1-umang.jain@ideasonboard.com>
 <20240215204436.9194-3-umang.jain@ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240215204436.9194-3-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/02/2024 21:44, Umang Jain wrote:
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> Add a v4l2 subdevice driver for the Sony IMX283 image sensor.
> 
> The IMX283 is a 20MP Diagonal 15.86 mm (Type 1) CMOS Image Sensor with
> Square Pixel for Color Cameras.
> 

...

> +
> +static int imx283_power_off(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct imx283 *imx283 = to_imx283(sd);
> +
> +	gpiod_set_value_cansleep(imx283->reset_gpio, 0);

That's odd. It is reset GPIO, so 0 means deassert means "stop resetting
device". You have wrong handling of the GPIO.

> +	regulator_bulk_disable(ARRAY_SIZE(imx283_supply_name), imx283->supplies);
> +	clk_disable_unprepare(imx283->xclk);
> +
> +	return 0;
> +}
> +
> +static int imx283_get_regulators(struct imx283 *imx283)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(imx283_supply_name); i++)
> +		imx283->supplies[i].supply = imx283_supply_name[i];
> +
> +	return devm_regulator_bulk_get(imx283->dev,
> +				       ARRAY_SIZE(imx283_supply_name),
> +				       imx283->supplies);
> +}

...

> +static const struct of_device_id imx283_dt_ids[] = {
> +	{ .compatible = "sony,imx283", },
> +	{ /* sentinel */ }
> +};

This goes next to driver structure. You also miss module device table.

> +
> +static int imx283_parse_endpoint(struct imx283 *imx283)
> +{
> +	struct fwnode_handle *fwnode = dev_fwnode(imx283->dev);
> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY
> +	};
> +	struct fwnode_handle *ep;
> +	int ret;
> +
> +	if (!fwnode)
> +		return -ENXIO;
> +
> +	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> +	if (!ep) {
> +		dev_err(imx283->dev, "Failed to get next endpoint\n");
> +		return -ENXIO;
> +	}
> +
> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	fwnode_handle_put(ep);
> +	if (ret)
> +		return ret;
> +
> +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
> +		dev_err(imx283->dev,
> +			"number of CSI2 data lanes %d is not supported\n",
> +			bus_cfg.bus.mipi_csi2.num_data_lanes);
> +		ret = -EINVAL;
> +		goto done_endpoint_free;
> +	}
> +
> +	ret = v4l2_link_freq_to_bitmap(imx283->dev, bus_cfg.link_frequencies,
> +				       bus_cfg.nr_of_link_frequencies,
> +				       link_frequencies, ARRAY_SIZE(link_frequencies),
> +				       &imx283->link_freq_bitmap);
> +
> +done_endpoint_free:
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +
> +	return ret;
> +};
> +
> +static int imx283_probe(struct i2c_client *client)
> +{
> +	struct imx283 *imx283;
> +	int ret;
> +	unsigned int i;
> +	unsigned int xclk_freq;
> +
> +	imx283 = devm_kzalloc(&client->dev, sizeof(*imx283), GFP_KERNEL);
> +	if (!imx283)
> +		return -ENOMEM;
> +
> +	imx283->dev = &client->dev;
> +
> +	v4l2_i2c_subdev_init(&imx283->sd, client, &imx283_subdev_ops);
> +
> +	imx283->cci = devm_cci_regmap_init_i2c(client, 16);
> +	if (IS_ERR(imx283->cci)) {
> +		ret = PTR_ERR(imx283->cci);
> +		dev_err(imx283->dev, "failed to initialize CCI: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Get system clock (xclk) */
> +	imx283->xclk = devm_clk_get(imx283->dev, NULL);
> +	if (IS_ERR(imx283->xclk)) {
> +		dev_err(imx283->dev, "failed to get xclk\n");

Syntax is: return dev_err_probe()

> +		return PTR_ERR(imx283->xclk);
> +	}
> +
> +	xclk_freq = clk_get_rate(imx283->xclk);
> +	for (i = 0; i < ARRAY_SIZE(imx283_frequencies); i++) {
> +		if (xclk_freq == imx283_frequencies[i].mhz) {
> +			imx283->freq = &imx283_frequencies[i];
> +			break;
> +		}
> +	}
> +	if (!imx283->freq) {
> +		dev_err(imx283->dev, "xclk frequency unsupported: %d Hz\n", xclk_freq);
> +		return -EINVAL;
> +	}
> +
> +	ret = imx283_get_regulators(imx283);
> +	if (ret) {
> +		dev_err(imx283->dev, "failed to get regulators\n");
> +		return ret;

return dev_err_probe()

> +	}
> +
> +	ret = imx283_parse_endpoint(imx283);
> +	if (ret) {
> +		dev_err(imx283->dev, "failed to parse endpoint configuration\n");
> +		return ret;
> +	}
> +
> +	/* Request optional enable pin */
> +	imx283->reset_gpio = devm_gpiod_get_optional(imx283->dev, "reset",
> +						     GPIOD_OUT_HIGH);

No, that's not allowed in your binding. Don't add undocumented properties.

> +
> +	mutex_init(&imx283->mutex);
> +
> +	/*
> +	 * The sensor must be powered for imx283_identify_module()
> +	 * to be able to read the CHIP_ID register
> +	 */
> +	ret = imx283_power_on(imx283->dev);
> +	if (ret)
> +		return ret;
> +


Best regards,
Krzysztof


