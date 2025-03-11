Return-Path: <linux-media+bounces-28025-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED474A5BFAA
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 12:48:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B28517645E
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 11:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719E1254872;
	Tue, 11 Mar 2025 11:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TjbjQ5Fv"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEA014F6C
	for <linux-media@vger.kernel.org>; Tue, 11 Mar 2025 11:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741693711; cv=none; b=QBKxmgC8J2UwuevlsaXKzH1ZymA+Nde+bE6M7tjEoIxnGnHgeO1dLkmVgCSOxka87apkrzhhCrIA6lJeJCpaj/seRanuxFOeS+4nVME1LdNsJGLXgDuOm45Hfnqz6UczRs6eC4UX4AHTMHpVX23PuDpZn3OoJmBcLpaXY5D2lss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741693711; c=relaxed/simple;
	bh=WsU9s5PmwwsWPqet52SyIlxSP74fQVlpkdfbeumVvXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JTKdWC7+5Oe2h5+pvJvwoHmuIYhslUIoeXsZKp0cXd8d3H1FjDZ34KEExeko1PTzMNNHmrvWdUArWodtBnuEsgjBdIMl3fHnzG2HWk6w/Mq/7hu6ixZd0k+C6a06quCCcgTRFzPRBDJ0zhAZp5Tpxobt2j2WjXseHa9hzWtjx4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TjbjQ5Fv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741693708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HdshspzsLfVJXoD+Y2BoWeiKORZv8kVCD0Jn64cGZHE=;
	b=TjbjQ5FvTy56mDAU6ff3al9169LMEHxQ8G6umiCwqKGaVxqPpmoeJkru0Hg3+RrkMzmNN9
	0sefFXEPpHSWRnPNB6fs0NqHYDwnGkWOSKr2kKiQoBEO1JJxQFSUdk3wL2kHL6NKepWRKU
	eS1SgFeGpdHvDy1MO9DTboIUtaFLWMw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-XwOxt9FkPKW7w1BDTJkZ5g-1; Tue, 11 Mar 2025 07:48:27 -0400
X-MC-Unique: XwOxt9FkPKW7w1BDTJkZ5g-1
X-Mimecast-MFC-AGG-ID: XwOxt9FkPKW7w1BDTJkZ5g_1741693706
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac286ad635bso279371666b.3
        for <linux-media@vger.kernel.org>; Tue, 11 Mar 2025 04:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741693706; x=1742298506;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HdshspzsLfVJXoD+Y2BoWeiKORZv8kVCD0Jn64cGZHE=;
        b=q/xegTMZwXRNXJyq/eo0yiRrrkzVxMCLn9IhxbDtfNtTy/GYcOGv/jLFaDkChAhppM
         Hz1jVMljatqP+/lLUf98KpA4wTGVAklCfl/glUPmfrOsUHrfz8wE9LlChUEVS9NvmTkO
         o66495dXEcHWtnuHDVQpczaXiSCze1jZceL/DYLx0uFS44QKDocPhcvj1ILphTaRCUHN
         muzfY6DHDEzLWEyLUebtQaR8tj4FLFYmYuC0wkkmZo9//7OPQIuc6K/LfB5S5TA76Ihy
         z7jaMlKu6u93LuOEk2hatw0kywSwZKPHkh9VPV+bqzUQ6/kBXmatXvuKgPqdIXALKMp5
         kMgA==
X-Forwarded-Encrypted: i=1; AJvYcCWWjp8HH9W71CfTob6UriZuTaQeiwKkQSJXQZ2UT3zFTNetWA9fp0KbS6SSArSqkgjPO1GK1wrKMeXsIw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7WkrBKZJ3RgRPIFlTaDznZmpqYJoVFhRlle9LaAlSSkeTDfEZ
	v9B8LYIuGcsCTiA+wGxHR7qDBvEdAHyfxl++iVCFTCO8DOlrTBxt89qtSIZp6O0WzSkOv4VBwH/
	w3kmKyShpnhZqIxMbUg5WtE4MVllB4g759OqM+VhFylY8sk+Znyu8HTsmEBZa
X-Gm-Gg: ASbGncu3pG/EpPXJtT/0fGuLn8wi1KUWUptvwm5i2kmtOIMcvHSBCeeIJCA9KT3as2J
	YT4QSh3LTL6ti+tdKqWRvQrBqTpkVHbaRqZiXyVx1hBg3lDyQ1P1/AEcK9+motZB81LwVrpBk9v
	BYkrmrL/G5QYOHVxtk3sj0d9bTkixueHlGKMpBTkvNdqauSdZjYreT2kMnGgpV/zwGktViAAQ7K
	pXvYYN6bGe3euTh5jyjCLlltOZmWm27knceGPPYhwrrLPypyvxwYyDFYe0Wi3nUnOfm61qNOLBO
	izZlZWMxnBoYr6vduGORWxBCx5KQz4P2WiNFPzR7LGQ8ImwzmcB0M+5TreC5eU1xP0TjFS2LY4O
	3xIcsgcactGR1BZUrEYAkYvI8tK8i/kFO0oHv2mbSSnaK1F5h9Kw77NwMWoia6PwPiw==
X-Received: by 2002:a17:907:c1c:b0:ac2:63b:6a45 with SMTP id a640c23a62f3a-ac252bab1b1mr2184850766b.30.1741693706298;
        Tue, 11 Mar 2025 04:48:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEFZ+kk+xnRe/ijy+ZkLd0Gvp9LOZ+yIaIUI9uiAw7U/N91y1hCF4zdaZLvWYJBQl3MomRGQ==
X-Received: by 2002:a17:907:c1c:b0:ac2:63b:6a45 with SMTP id a640c23a62f3a-ac252bab1b1mr2184848266b.30.1741693705807;
        Tue, 11 Mar 2025 04:48:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac29c95862dsm356209366b.164.2025.03.11.04.48.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 04:48:25 -0700 (PDT)
Message-ID: <07016d67-7f92-49f5-a07c-e31ed2c13a5e@redhat.com>
Date: Tue, 11 Mar 2025 12:48:24 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: ov08x40: Add OF probe support
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>
References: <20250311114027.25141-1-hdegoede@redhat.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250311114027.25141-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11-Mar-25 12:40 PM, Hans de Goede wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> The ACPI version of this driver "just works" on dts based systems with a
> few extensions to facilitate.
> 
> - Add support for DT based probing
> - Add support for taking the part out of reset via a GPIO reset pin
> - Add in regulator bulk on/off logic for the power rails.
> 
> Once done this sensor works nicely on a Qualcomm X1E80100 CRD.
> 
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e80100-crd
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>

Sorry about sending out this old patch from Bryan, clearly that was
not my intention. Please ignore.

Regards,

Hans



> ---
>  drivers/media/i2c/ov08x40.c | 144 +++++++++++++++++++++++++++++++-----
>  1 file changed, 127 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
> index 3ab8b51df157..ff17e09a1f96 100644
> --- a/drivers/media/i2c/ov08x40.c
> +++ b/drivers/media/i2c/ov08x40.c
> @@ -3,10 +3,13 @@
>  
>  #include <asm-generic/unaligned.h>
>  #include <linux/acpi.h>
> +#include <linux/clk.h>
>  #include <linux/i2c.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/module.h>
>  #include <linux/delay.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-fwnode.h>
> @@ -1279,6 +1282,12 @@ static const struct ov08x40_mode supported_modes[] = {
>  	},
>  };
>  
> +static const char * const ov08x40_supply_names[] = {
> +	"dovdd",	/* Digital I/O power */
> +	"avdd",		/* Analog power */
> +	"dvdd",		/* Digital core power */
> +};
> +
>  struct ov08x40 {
>  	struct v4l2_subdev sd;
>  	struct media_pad pad;
> @@ -1291,6 +1300,10 @@ struct ov08x40 {
>  	struct v4l2_ctrl *hblank;
>  	struct v4l2_ctrl *exposure;
>  
> +	struct clk		*xvclk;
> +	struct gpio_desc	*reset_gpio;
> +	struct regulator_bulk_data supplies[ARRAY_SIZE(ov08x40_supply_names)];
> +
>  	/* Current mode */
>  	const struct ov08x40_mode *cur_mode;
>  
> @@ -1303,6 +1316,61 @@ struct ov08x40 {
>  
>  #define to_ov08x40(_sd)	container_of(_sd, struct ov08x40, sd)
>  
> +static int ov08x40_power_on(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov08x40 *ov08x = to_ov08x40(sd);
> +	int ret;
> +
> +	if (is_acpi_node(dev_fwnode(dev)))
> +		return 0;
> +
> +	ret = clk_prepare_enable(ov08x->xvclk);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable xvclk\n");
> +		return ret;
> +	}
> +
> +	if (ov08x->reset_gpio) {
> +		gpiod_set_value_cansleep(ov08x->reset_gpio, 1);
> +		usleep_range(1000, 2000);
> +	}
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ov08x40_supply_names),
> +				    ov08x->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable regulators\n");
> +		goto disable_clk;
> +	}
> +
> +	gpiod_set_value_cansleep(ov08x->reset_gpio, 0);
> +	usleep_range(1500, 1800);
> +
> +	return 0;
> +
> +disable_clk:
> +	gpiod_set_value_cansleep(ov08x->reset_gpio, 1);
> +	clk_disable_unprepare(ov08x->xvclk);
> +
> +	return ret;
> +}
> +
> +static int ov08x40_power_off(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov08x40 *ov08x = to_ov08x40(sd);
> +
> +	if (is_acpi_node(dev_fwnode(dev)))
> +		return 0;
> +
> +	gpiod_set_value_cansleep(ov08x->reset_gpio, 1);
> +	regulator_bulk_disable(ARRAY_SIZE(ov08x40_supply_names),
> +			       ov08x->supplies);
> +	clk_disable_unprepare(ov08x->xvclk);
> +
> +	return 0;
> +}
> +
>  /* Read registers up to 4 at a time */
>  static int ov08x40_read_reg(struct ov08x40 *ov08x,
>  			    u16 reg, u32 len, u32 *val)
> @@ -2072,7 +2140,7 @@ static void ov08x40_free_controls(struct ov08x40 *ov08x)
>  	mutex_destroy(&ov08x->mutex);
>  }
>  
> -static int ov08x40_check_hwcfg(struct device *dev)
> +static int ov08x40_check_hwcfg(struct ov08x40 *ov08x, struct device *dev)
>  {
>  	struct v4l2_fwnode_endpoint bus_cfg = {
>  		.bus_type = V4L2_MBUS_CSI2_DPHY
> @@ -2086,11 +2154,36 @@ static int ov08x40_check_hwcfg(struct device *dev)
>  	if (!fwnode)
>  		return -ENXIO;
>  
> -	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> -				       &xvclk_rate);
> -	if (ret) {
> -		dev_err(dev, "can't get clock frequency");
> -		return ret;
> +	if (!is_acpi_node(fwnode)) {
> +		ov08x->xvclk = devm_clk_get(dev, NULL);
> +		if (IS_ERR(ov08x->xvclk)) {
> +			dev_err(dev, "could not get xvclk clock (%pe)\n",
> +				ov08x->xvclk);
> +			return PTR_ERR(ov08x->xvclk);
> +		}
> +
> +		xvclk_rate = clk_get_rate(ov08x->xvclk);
> +
> +		ov08x->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> +							    GPIOD_OUT_LOW);
> +		if (IS_ERR(ov08x->reset_gpio))
> +			return PTR_ERR(ov08x->reset_gpio);
> +
> +		for (i = 0; i < ARRAY_SIZE(ov08x40_supply_names); i++)
> +			ov08x->supplies[i].supply = ov08x40_supply_names[i];
> +
> +		ret = devm_regulator_bulk_get(dev,
> +					      ARRAY_SIZE(ov08x40_supply_names),
> +					      ov08x->supplies);
> +		if (ret)
> +			return ret;
> +	} else {
> +		ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> +					       &xvclk_rate);
> +		if (ret) {
> +			dev_err(dev, "can't get clock frequency");
> +			return ret;
> +		}
>  	}
>  
>  	if (xvclk_rate != OV08X40_XVCLK) {
> @@ -2143,32 +2236,37 @@ static int ov08x40_check_hwcfg(struct device *dev)
>  }
>  
>  static int ov08x40_probe(struct i2c_client *client)
> -{
> -	struct ov08x40 *ov08x;
> +{	struct ov08x40 *ov08x;
>  	int ret;
>  	bool full_power;
>  
> -	/* Check HW config */
> -	ret = ov08x40_check_hwcfg(&client->dev);
> -	if (ret) {
> -		dev_err(&client->dev, "failed to check hwcfg: %d", ret);
> -		return ret;
> -	}
> -
>  	ov08x = devm_kzalloc(&client->dev, sizeof(*ov08x), GFP_KERNEL);
>  	if (!ov08x)
>  		return -ENOMEM;
>  
> +	/* Check HW config */
> +	ret = ov08x40_check_hwcfg(ov08x, &client->dev);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to check hwcfg: %d", ret);
> +		return ret;
> +	}
> +
>  	/* Initialize subdev */
>  	v4l2_i2c_subdev_init(&ov08x->sd, client, &ov08x40_subdev_ops);
>  
>  	full_power = acpi_dev_state_d0(&client->dev);
>  	if (full_power) {
> +		ret = ov08x40_power_on(&client->dev);
> +		if (ret) {
> +			dev_err(&client->dev, "failed to power on\n");
> +			return ret;
> +		}
> +
>  		/* Check module identity */
>  		ret = ov08x40_identify_module(ov08x);
>  		if (ret) {
>  			dev_err(&client->dev, "failed to find sensor: %d\n", ret);
> -			return ret;
> +			goto probe_power_off;
>  		}
>  	}
>  
> @@ -2177,7 +2275,7 @@ static int ov08x40_probe(struct i2c_client *client)
>  
>  	ret = ov08x40_init_controls(ov08x);
>  	if (ret)
> -		return ret;
> +		goto probe_power_off;
>  
>  	/* Initialize subdev */
>  	ov08x->sd.internal_ops = &ov08x40_internal_ops;
> @@ -2210,6 +2308,9 @@ static int ov08x40_probe(struct i2c_client *client)
>  error_handler_free:
>  	ov08x40_free_controls(ov08x);
>  
> +probe_power_off:
> +	ov08x40_power_off(&client->dev);
> +
>  	return ret;
>  }
>  
> @@ -2224,6 +2325,8 @@ static void ov08x40_remove(struct i2c_client *client)
>  
>  	pm_runtime_disable(&client->dev);
>  	pm_runtime_set_suspended(&client->dev);
> +
> +	ov08x40_power_off(&client->dev);
>  }
>  
>  #ifdef CONFIG_ACPI
> @@ -2235,10 +2338,17 @@ static const struct acpi_device_id ov08x40_acpi_ids[] = {
>  MODULE_DEVICE_TABLE(acpi, ov08x40_acpi_ids);
>  #endif
>  
> +static const struct of_device_id ov08x40_of_match[] = {
> +	{ .compatible = "ovti,ov08x40" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ov08x40_of_match);
> +
>  static struct i2c_driver ov08x40_i2c_driver = {
>  	.driver = {
>  		.name = "ov08x40",
>  		.acpi_match_table = ACPI_PTR(ov08x40_acpi_ids),
> +		.of_match_table = ov08x40_of_match,
>  	},
>  	.probe = ov08x40_probe,
>  	.remove = ov08x40_remove,


