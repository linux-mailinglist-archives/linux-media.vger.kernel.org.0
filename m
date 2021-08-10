Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 761CA3E858A
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 23:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234828AbhHJViX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 17:38:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234075AbhHJViB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 17:38:01 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92B60C061765
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 14:37:38 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id n11so445841wmd.2
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 14:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=rhhvtGr+c36pe+A64kgn7B1x6iLlH+Rl8KB7LFxnChA=;
        b=cU8OnoFVEFwZOdg3Pof3vVfyFbHSdb/bZEcIvJxtQ02ggG3X8u6kdCsOlgFzTSjWrF
         lQaDzcCLfzyNCu5vZDuqJBQdkC5n9PRcmJspaR51ueag31Zis1ZTcMxDvl8FkyhsEwZl
         AxxxXC9ijkzouqCHbDGoAOtn1rMJt024F9RoKSX2AbcHCYUuafXPCkMi269le5H1yBb9
         ysOTzThZZSsYS1xj7g6hBN8aF66S2syjrrWyItZk0Iie6G5tNpuOxhbnnaliiejeQvSe
         fkR+jKQ3LkKg/gyVj993qBJIzWpqU9YszsszZdMPDwuFEQS7XS7TdGSNHFc7efdn1cku
         xW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=rhhvtGr+c36pe+A64kgn7B1x6iLlH+Rl8KB7LFxnChA=;
        b=MbVXhKl5qfWiRKVPmb5MHUOMPu+1ZNyZ0BUjAU0fWmMEN3aai8J31e61eSEFXDoaw1
         QyzQyKEBSsLsUbUWnWXbUZqTSPmDEEiFW9XWkYefJeHv+dkcdKIsVEsa9v0uX9F+sk+J
         wGwYsmLi7UDZ55z2qjyJgStALg8oeMuEVpU8AWqjFjtQErXo437DtqXQUVH2KyQsCGxc
         MN/q7XJdEzbYA/czEDu9YAwhNqgjXz9W1+XiEc7WjYDJkH039cuNdMZ9djOpTyFGk6af
         3SJXO3fsKf12tr+xdOH5RhVYkLH4bsaIhuOYON/L28gn9S5+1HnySwe+O+/ZWalFigmI
         ci9w==
X-Gm-Message-State: AOAM531C/O2X5dU01PBLARxWOH2LTUk1FZqR8C8bmfLR6WjPhaOCkFRf
        GjjwIwhKsqfBmcpzeZKQkUw=
X-Google-Smtp-Source: ABdhPJxWgykykVoLCctLCqsaxjR+QBT1posSi8DyPQARLkZoxZ5lcA8pdqxz9A0UCSEYHG3aPlojbQ==
X-Received: by 2002:a05:600c:218b:: with SMTP id e11mr6650948wme.185.1628631457175;
        Tue, 10 Aug 2021 14:37:37 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id c1sm3707038wmp.7.2021.08.10.14.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Aug 2021 14:37:36 -0700 (PDT)
Subject: Re: [PATCH v2 04/12] media: i2c: Support 19.2MHz input clock in
 ov8865
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     paul.kocialkowski@bootlin.com, ezequiel@collabora.com,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        kevin.lhopital@bootlin.com, yang.lee@linux.alibaba.com,
        andy.shevchenko@gmail.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
References: <20210809225845.916430-1-djrscally@gmail.com>
 <20210809225845.916430-5-djrscally@gmail.com>
 <20210810133426.GB3@paasikivi.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <711e4f6d-f539-0a69-fe78-d5e32eecb673@gmail.com>
Date:   Tue, 10 Aug 2021 22:37:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210810133426.GB3@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari - thanks for all the comments

On 10/08/2021 14:34, Sakari Ailus wrote:
> Hi Daniel,
>
> Thanks for the set.
>
> On Mon, Aug 09, 2021 at 11:58:37PM +0100, Daniel Scally wrote:
>> The ov8865 driver as written expects a 24MHz input clock, but the sensor
>> is sometimes found on x86 platforms with a 19.2MHz input clock supplied.
>> Add a set of PLL configurations to the driver to support that rate too.
>> As ACPI doesn't auto-configure the clock rate, check for a clock-frequency
>> during probe and set that rate if one is found.
>>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>> Changes in v2:
>>
>> 	- Added an enum defining the possible frequency rates to index the
>> 	  array (Andy)
>>
>>  drivers/media/i2c/ov8865.c | 164 +++++++++++++++++++++++++++----------
>>  1 file changed, 121 insertions(+), 43 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
>> index fe700787bfb9..1382b16d1a09 100644
>> --- a/drivers/media/i2c/ov8865.c
>> +++ b/drivers/media/i2c/ov8865.c
>> @@ -21,10 +21,6 @@
>>  #include <media/v4l2-image-sizes.h>
>>  #include <media/v4l2-mediabus.h>
>>  
>> -/* Clock rate */
>> -
>> -#define OV8865_EXTCLK_RATE			24000000
>> -
>>  /* Register definitions */
>>  
>>  /* System */
>> @@ -567,6 +563,19 @@ struct ov8865_sclk_config {
>>  	unsigned int sclk_div;
>>  };
>>  
>> +/* Clock rate */
>> +
>> +enum extclk_rate {
>> +	OV8865_19_2_MHZ,
>> +	OV8865_24_MHZ,
>> +	OV8865_NUM_SUPPORTED_RATES,
>> +};
>> +
>> +static const unsigned long supported_extclk_rates[] = {
>> +	[OV8865_19_2_MHZ] = 19200000,
>> +	[OV8865_24_MHZ] = 24000000,
>> +};
>> +
>>  /*
>>   * General formulas for (array-centered) mode calculation:
>>   * - photo_array_width = 3296
>> @@ -665,6 +674,9 @@ struct ov8865_sensor {
>>  	struct regulator *avdd;
>>  	struct regulator *dvdd;
>>  	struct regulator *dovdd;
>> +
>> +	unsigned long extclk_rate;
>> +	enum extclk_rate extclk_rate_idx;
>>  	struct clk *extclk;
>>  
>>  	struct v4l2_fwnode_endpoint endpoint;
>> @@ -680,49 +692,83 @@ struct ov8865_sensor {
>>  /* Static definitions */
>>  
>>  /*
>> - * EXTCLK = 24 MHz
>>   * PHY_SCLK = 720 MHz
>>   * MIPI_PCLK = 90 MHz
>>   */
>> -static const struct ov8865_pll1_config ov8865_pll1_config_native = {
>> -	.pll_pre_div_half	= 1,
>> -	.pll_pre_div		= 0,
>> -	.pll_mul		= 30,
>> -	.m_div			= 1,
>> -	.mipi_div		= 3,
>> -	.pclk_div		= 1,
>> -	.sys_pre_div		= 1,
>> -	.sys_div		= 2,
>> +
>> +static const struct ov8865_pll1_config ov8865_pll1_configs_native[] = {
>> +	{ /* 19.2 MHz input clock */
>> +		.pll_pre_div_half	= 1,
>> +		.pll_pre_div		= 2,
>> +		.pll_mul		= 75,
>> +		.m_div			= 1,
>> +		.mipi_div		= 3,
>> +		.pclk_div		= 1,
>> +		.sys_pre_div		= 1,
>> +		.sys_div		= 2,
>> +	},
>> +	{ /* 24MHz input clock */
>> +		.pll_pre_div_half	= 1,
>> +		.pll_pre_div		= 0,
>> +		.pll_mul		= 30,
>> +		.m_div			= 1,
>> +		.mipi_div		= 3,
>> +		.pclk_div		= 1,
>> +		.sys_pre_div		= 1,
>> +		.sys_div		= 2,
>> +	},
> Could you instead add a struct specific to the clock frequency with
> pointers to these? See e.g. the ov8856 driver how this could otherwise end
> up...


You mean something like


static struct ov8865_pll_configs_19_2_mhz {

    .pll1_config_native = &ov8865_pll1_config_native,

    ...

};



static struct ov8865_pll_configs_24_mhz {

    .pll1_config_native = &ov8865_pll1_config_native,

    ...

};


or am I misunderstanding?

>
>>  };
>>  
>>  /*
>> - * EXTCLK = 24 MHz
>>   * DAC_CLK = 360 MHz
>>   * SCLK = 144 MHz
>>   */
>>  
>> -static const struct ov8865_pll2_config ov8865_pll2_config_native = {
>> -	.pll_pre_div_half	= 1,
>> -	.pll_pre_div		= 0,
>> -	.pll_mul		= 30,
>> -	.dac_div		= 2,
>> -	.sys_pre_div		= 5,
>> -	.sys_div		= 0,
>> +static const struct ov8865_pll2_config ov8865_pll2_configs_native[] = {
>> +	/* 19.2MHz input clock */
>> +	{
>> +		.pll_pre_div_half	= 1,
>> +		.pll_pre_div		= 5,
>> +		.pll_mul		= 75,
>> +		.dac_div		= 1,
>> +		.sys_pre_div		= 1,
>> +		.sys_div		= 3,
>> +	},
>> +	/* 24MHz input clock */
>> +	{
>> +		.pll_pre_div_half	= 1,
>> +		.pll_pre_div		= 0,
>> +		.pll_mul		= 30,
>> +		.dac_div		= 2,
>> +		.sys_pre_div		= 5,
>> +		.sys_div		= 0,
>> +	}
>>  };
>>  
>>  /*
>> - * EXTCLK = 24 MHz
>>   * DAC_CLK = 360 MHz
>>   * SCLK = 72 MHz
>>   */
>>  
>> -static const struct ov8865_pll2_config ov8865_pll2_config_binning = {
>> +static const struct ov8865_pll2_config ov8865_pll2_configs_binning[] = {
>> +	/* 19.2MHz input clock */
>> +	{
>> +	.pll_pre_div_half	= 1,
>> +	.pll_pre_div		= 2,
>> +	.pll_mul		= 75,
>> +	.dac_div		= 2,
>> +	.sys_pre_div		= 10,
>> +	.sys_div		= 0,
>> +	},
>> +	/* 24MHz input clock */
>> +	{
>>  	.pll_pre_div_half	= 1,
>>  	.pll_pre_div		= 0,
>>  	.pll_mul		= 30,
>>  	.dac_div		= 2,
>>  	.sys_pre_div		= 10,
>>  	.sys_div		= 0,
>> +	}
>>  };
>>  
>>  static const struct ov8865_sclk_config ov8865_sclk_config_native = {
>> @@ -934,8 +980,8 @@ static const struct ov8865_mode ov8865_modes[] = {
>>  		.frame_interval			= { 1, 30 },
>>  
>>  		/* PLL */
>> -		.pll1_config			= &ov8865_pll1_config_native,
>> -		.pll2_config			= &ov8865_pll2_config_native,
>> +		.pll1_config			= ov8865_pll1_configs_native,
>> +		.pll2_config			= ov8865_pll2_configs_native,
>>  		.sclk_config			= &ov8865_sclk_config_native,
>>  
>>  		/* Registers */
>> @@ -990,8 +1036,8 @@ static const struct ov8865_mode ov8865_modes[] = {
>>  		.frame_interval			= { 1, 30 },
>>  
>>  		/* PLL */
>> -		.pll1_config			= &ov8865_pll1_config_native,
>> -		.pll2_config			= &ov8865_pll2_config_native,
>> +		.pll1_config			= ov8865_pll1_configs_native,
>> +		.pll2_config			= ov8865_pll2_configs_native,
>>  		.sclk_config			= &ov8865_sclk_config_native,
>>  
>>  		/* Registers */
>> @@ -1050,8 +1096,8 @@ static const struct ov8865_mode ov8865_modes[] = {
>>  		.frame_interval			= { 1, 30 },
>>  
>>  		/* PLL */
>> -		.pll1_config			= &ov8865_pll1_config_native,
>> -		.pll2_config			= &ov8865_pll2_config_binning,
>> +		.pll1_config			= ov8865_pll1_configs_native,
>> +		.pll2_config			= ov8865_pll2_configs_binning,
>>  		.sclk_config			= &ov8865_sclk_config_native,
>>  
>>  		/* Registers */
>> @@ -1116,8 +1162,8 @@ static const struct ov8865_mode ov8865_modes[] = {
>>  		.frame_interval			= { 1, 90 },
>>  
>>  		/* PLL */
>> -		.pll1_config			= &ov8865_pll1_config_native,
>> -		.pll2_config			= &ov8865_pll2_config_binning,
>> +		.pll1_config			= ov8865_pll1_configs_native,
>> +		.pll2_config			= ov8865_pll2_configs_binning,
>>  		.sclk_config			= &ov8865_sclk_config_native,
>>  
>>  		/* Registers */
>> @@ -1513,12 +1559,11 @@ static int ov8865_isp_configure(struct ov8865_sensor *sensor)
>>  static unsigned long ov8865_mode_pll1_rate(struct ov8865_sensor *sensor,
>>  					   const struct ov8865_mode *mode)
>>  {
>> -	const struct ov8865_pll1_config *config = mode->pll1_config;
>> -	unsigned long extclk_rate;
>> +	const struct ov8865_pll1_config *config;
>>  	unsigned long pll1_rate;
>>  
>> -	extclk_rate = clk_get_rate(sensor->extclk);
>> -	pll1_rate = extclk_rate * config->pll_mul / config->pll_pre_div_half;
>> +	config = &mode->pll1_config[sensor->extclk_rate_idx];
>> +	pll1_rate = sensor->extclk_rate * config->pll_mul / config->pll_pre_div_half;
>>  
>>  	switch (config->pll_pre_div) {
>>  	case 0:
>> @@ -1552,10 +1597,12 @@ static int ov8865_mode_pll1_configure(struct ov8865_sensor *sensor,
>>  				      const struct ov8865_mode *mode,
>>  				      u32 mbus_code)
>>  {
>> -	const struct ov8865_pll1_config *config = mode->pll1_config;
>> +	const struct ov8865_pll1_config *config;
>>  	u8 value;
>>  	int ret;
>>  
>> +	config = &mode->pll1_config[sensor->extclk_rate_idx];
>> +
>>  	switch (mbus_code) {
>>  	case MEDIA_BUS_FMT_SBGGR10_1X10:
>>  		value = OV8865_MIPI_BIT_SEL(10);
>> @@ -1622,9 +1669,11 @@ static int ov8865_mode_pll1_configure(struct ov8865_sensor *sensor,
>>  static int ov8865_mode_pll2_configure(struct ov8865_sensor *sensor,
>>  				      const struct ov8865_mode *mode)
>>  {
>> -	const struct ov8865_pll2_config *config = mode->pll2_config;
>> +	const struct ov8865_pll2_config *config;
>>  	int ret;
>>  
>> +	config = &mode->pll2_config[sensor->extclk_rate_idx];
>> +
>>  	ret = ov8865_write(sensor, OV8865_PLL_CTRL12_REG,
>>  			   OV8865_PLL_CTRL12_PRE_DIV_HALF(config->pll_pre_div_half) |
>>  			   OV8865_PLL_CTRL12_DAC_DIV(config->dac_div));
>> @@ -2053,9 +2102,11 @@ static int ov8865_mode_configure(struct ov8865_sensor *sensor,
>>  static unsigned long ov8865_mode_mipi_clk_rate(struct ov8865_sensor *sensor,
>>  					       const struct ov8865_mode *mode)
>>  {
>> -	const struct ov8865_pll1_config *config = mode->pll1_config;
>> +	const struct ov8865_pll1_config *config;
>>  	unsigned long pll1_rate;
>>  
>> +	config = &mode->pll1_config[sensor->extclk_rate_idx];
>> +
>>  	pll1_rate = ov8865_mode_pll1_rate(sensor, mode);
>>  
>>  	return pll1_rate / config->m_div / 2;
>> @@ -2783,7 +2834,8 @@ static int ov8865_probe(struct i2c_client *client)
>>  	struct ov8865_sensor *sensor;
>>  	struct v4l2_subdev *subdev;
>>  	struct media_pad *pad;
>> -	unsigned long rate;
>> +	unsigned int rate;
>> +	unsigned int i;
>>  	int ret;
>>  
>>  	sensor = devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
>> @@ -2858,13 +2910,39 @@ static int ov8865_probe(struct i2c_client *client)
>>  		goto error_endpoint;
>>  	}
>>  
>> -	rate = clk_get_rate(sensor->extclk);
>> -	if (rate != OV8865_EXTCLK_RATE) {
>> -		dev_err(dev, "clock rate %lu Hz is unsupported\n", rate);
>> +	/*
>> +	 * We could have either a 24MHz or 19.2MHz clock rate. Check for a
>> +	 * clock-frequency property and if found, set that rate. This should
>> +	 * cover ACPI case. If the system uses devicetree then the configured
>> +	 * rate should already be set, so we'll have to check it.
>> +	 */
>> +
>> +	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
>> +				       &rate);
>> +	if (!ret) {
>> +		ret = clk_set_rate(sensor->extclk, rate);
>> +		if (ret) {
>> +			dev_err(dev, "failed to set clock rate\n");
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	sensor->extclk_rate = clk_get_rate(sensor->extclk);
>> +
>> +	for (i = 0; i < ARRAY_SIZE(supported_extclk_rates); i++) {
>> +		if (sensor->extclk_rate == supported_extclk_rates[i])
>> +			break;
>> +	}
>> +
>> +	if (i == ARRAY_SIZE(supported_extclk_rates)) {
>> +		dev_err(dev, "clock rate %lu Hz is unsupported\n",
>> +			sensor->extclk_rate);
>>  		ret = -EINVAL;
>>  		goto error_endpoint;
>>  	}
>>  
>> +	sensor->extclk_rate_idx = i;
>> +
>>  	/* Subdev, entity and pad */
>>  
>>  	subdev = &sensor->subdev;
