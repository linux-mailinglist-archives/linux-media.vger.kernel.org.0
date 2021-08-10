Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DAF53E5BC9
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 15:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241523AbhHJNez (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 09:34:55 -0400
Received: from mga09.intel.com ([134.134.136.24]:16841 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239818AbhHJNey (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 09:34:54 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="214887868"
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; 
   d="scan'208";a="214887868"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2021 06:34:32 -0700
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; 
   d="scan'208";a="638802747"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2021 06:34:29 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 0049E20364;
        Tue, 10 Aug 2021 16:34:26 +0300 (EEST)
Date:   Tue, 10 Aug 2021 16:34:26 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     paul.kocialkowski@bootlin.com, ezequiel@collabora.com,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        kevin.lhopital@bootlin.com, yang.lee@linux.alibaba.com,
        andy.shevchenko@gmail.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 04/12] media: i2c: Support 19.2MHz input clock in
 ov8865
Message-ID: <20210810133426.GB3@paasikivi.fi.intel.com>
References: <20210809225845.916430-1-djrscally@gmail.com>
 <20210809225845.916430-5-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210809225845.916430-5-djrscally@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

Thanks for the set.

On Mon, Aug 09, 2021 at 11:58:37PM +0100, Daniel Scally wrote:
> The ov8865 driver as written expects a 24MHz input clock, but the sensor
> is sometimes found on x86 platforms with a 19.2MHz input clock supplied.
> Add a set of PLL configurations to the driver to support that rate too.
> As ACPI doesn't auto-configure the clock rate, check for a clock-frequency
> during probe and set that rate if one is found.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes in v2:
> 
> 	- Added an enum defining the possible frequency rates to index the
> 	  array (Andy)
> 
>  drivers/media/i2c/ov8865.c | 164 +++++++++++++++++++++++++++----------
>  1 file changed, 121 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> index fe700787bfb9..1382b16d1a09 100644
> --- a/drivers/media/i2c/ov8865.c
> +++ b/drivers/media/i2c/ov8865.c
> @@ -21,10 +21,6 @@
>  #include <media/v4l2-image-sizes.h>
>  #include <media/v4l2-mediabus.h>
>  
> -/* Clock rate */
> -
> -#define OV8865_EXTCLK_RATE			24000000
> -
>  /* Register definitions */
>  
>  /* System */
> @@ -567,6 +563,19 @@ struct ov8865_sclk_config {
>  	unsigned int sclk_div;
>  };
>  
> +/* Clock rate */
> +
> +enum extclk_rate {
> +	OV8865_19_2_MHZ,
> +	OV8865_24_MHZ,
> +	OV8865_NUM_SUPPORTED_RATES,
> +};
> +
> +static const unsigned long supported_extclk_rates[] = {
> +	[OV8865_19_2_MHZ] = 19200000,
> +	[OV8865_24_MHZ] = 24000000,
> +};
> +
>  /*
>   * General formulas for (array-centered) mode calculation:
>   * - photo_array_width = 3296
> @@ -665,6 +674,9 @@ struct ov8865_sensor {
>  	struct regulator *avdd;
>  	struct regulator *dvdd;
>  	struct regulator *dovdd;
> +
> +	unsigned long extclk_rate;
> +	enum extclk_rate extclk_rate_idx;
>  	struct clk *extclk;
>  
>  	struct v4l2_fwnode_endpoint endpoint;
> @@ -680,49 +692,83 @@ struct ov8865_sensor {
>  /* Static definitions */
>  
>  /*
> - * EXTCLK = 24 MHz
>   * PHY_SCLK = 720 MHz
>   * MIPI_PCLK = 90 MHz
>   */
> -static const struct ov8865_pll1_config ov8865_pll1_config_native = {
> -	.pll_pre_div_half	= 1,
> -	.pll_pre_div		= 0,
> -	.pll_mul		= 30,
> -	.m_div			= 1,
> -	.mipi_div		= 3,
> -	.pclk_div		= 1,
> -	.sys_pre_div		= 1,
> -	.sys_div		= 2,
> +
> +static const struct ov8865_pll1_config ov8865_pll1_configs_native[] = {
> +	{ /* 19.2 MHz input clock */
> +		.pll_pre_div_half	= 1,
> +		.pll_pre_div		= 2,
> +		.pll_mul		= 75,
> +		.m_div			= 1,
> +		.mipi_div		= 3,
> +		.pclk_div		= 1,
> +		.sys_pre_div		= 1,
> +		.sys_div		= 2,
> +	},
> +	{ /* 24MHz input clock */
> +		.pll_pre_div_half	= 1,
> +		.pll_pre_div		= 0,
> +		.pll_mul		= 30,
> +		.m_div			= 1,
> +		.mipi_div		= 3,
> +		.pclk_div		= 1,
> +		.sys_pre_div		= 1,
> +		.sys_div		= 2,
> +	},

Could you instead add a struct specific to the clock frequency with
pointers to these? See e.g. the ov8856 driver how this could otherwise end
up...

>  };
>  
>  /*
> - * EXTCLK = 24 MHz
>   * DAC_CLK = 360 MHz
>   * SCLK = 144 MHz
>   */
>  
> -static const struct ov8865_pll2_config ov8865_pll2_config_native = {
> -	.pll_pre_div_half	= 1,
> -	.pll_pre_div		= 0,
> -	.pll_mul		= 30,
> -	.dac_div		= 2,
> -	.sys_pre_div		= 5,
> -	.sys_div		= 0,
> +static const struct ov8865_pll2_config ov8865_pll2_configs_native[] = {
> +	/* 19.2MHz input clock */
> +	{
> +		.pll_pre_div_half	= 1,
> +		.pll_pre_div		= 5,
> +		.pll_mul		= 75,
> +		.dac_div		= 1,
> +		.sys_pre_div		= 1,
> +		.sys_div		= 3,
> +	},
> +	/* 24MHz input clock */
> +	{
> +		.pll_pre_div_half	= 1,
> +		.pll_pre_div		= 0,
> +		.pll_mul		= 30,
> +		.dac_div		= 2,
> +		.sys_pre_div		= 5,
> +		.sys_div		= 0,
> +	}
>  };
>  
>  /*
> - * EXTCLK = 24 MHz
>   * DAC_CLK = 360 MHz
>   * SCLK = 72 MHz
>   */
>  
> -static const struct ov8865_pll2_config ov8865_pll2_config_binning = {
> +static const struct ov8865_pll2_config ov8865_pll2_configs_binning[] = {
> +	/* 19.2MHz input clock */
> +	{
> +	.pll_pre_div_half	= 1,
> +	.pll_pre_div		= 2,
> +	.pll_mul		= 75,
> +	.dac_div		= 2,
> +	.sys_pre_div		= 10,
> +	.sys_div		= 0,
> +	},
> +	/* 24MHz input clock */
> +	{
>  	.pll_pre_div_half	= 1,
>  	.pll_pre_div		= 0,
>  	.pll_mul		= 30,
>  	.dac_div		= 2,
>  	.sys_pre_div		= 10,
>  	.sys_div		= 0,
> +	}
>  };
>  
>  static const struct ov8865_sclk_config ov8865_sclk_config_native = {
> @@ -934,8 +980,8 @@ static const struct ov8865_mode ov8865_modes[] = {
>  		.frame_interval			= { 1, 30 },
>  
>  		/* PLL */
> -		.pll1_config			= &ov8865_pll1_config_native,
> -		.pll2_config			= &ov8865_pll2_config_native,
> +		.pll1_config			= ov8865_pll1_configs_native,
> +		.pll2_config			= ov8865_pll2_configs_native,
>  		.sclk_config			= &ov8865_sclk_config_native,
>  
>  		/* Registers */
> @@ -990,8 +1036,8 @@ static const struct ov8865_mode ov8865_modes[] = {
>  		.frame_interval			= { 1, 30 },
>  
>  		/* PLL */
> -		.pll1_config			= &ov8865_pll1_config_native,
> -		.pll2_config			= &ov8865_pll2_config_native,
> +		.pll1_config			= ov8865_pll1_configs_native,
> +		.pll2_config			= ov8865_pll2_configs_native,
>  		.sclk_config			= &ov8865_sclk_config_native,
>  
>  		/* Registers */
> @@ -1050,8 +1096,8 @@ static const struct ov8865_mode ov8865_modes[] = {
>  		.frame_interval			= { 1, 30 },
>  
>  		/* PLL */
> -		.pll1_config			= &ov8865_pll1_config_native,
> -		.pll2_config			= &ov8865_pll2_config_binning,
> +		.pll1_config			= ov8865_pll1_configs_native,
> +		.pll2_config			= ov8865_pll2_configs_binning,
>  		.sclk_config			= &ov8865_sclk_config_native,
>  
>  		/* Registers */
> @@ -1116,8 +1162,8 @@ static const struct ov8865_mode ov8865_modes[] = {
>  		.frame_interval			= { 1, 90 },
>  
>  		/* PLL */
> -		.pll1_config			= &ov8865_pll1_config_native,
> -		.pll2_config			= &ov8865_pll2_config_binning,
> +		.pll1_config			= ov8865_pll1_configs_native,
> +		.pll2_config			= ov8865_pll2_configs_binning,
>  		.sclk_config			= &ov8865_sclk_config_native,
>  
>  		/* Registers */
> @@ -1513,12 +1559,11 @@ static int ov8865_isp_configure(struct ov8865_sensor *sensor)
>  static unsigned long ov8865_mode_pll1_rate(struct ov8865_sensor *sensor,
>  					   const struct ov8865_mode *mode)
>  {
> -	const struct ov8865_pll1_config *config = mode->pll1_config;
> -	unsigned long extclk_rate;
> +	const struct ov8865_pll1_config *config;
>  	unsigned long pll1_rate;
>  
> -	extclk_rate = clk_get_rate(sensor->extclk);
> -	pll1_rate = extclk_rate * config->pll_mul / config->pll_pre_div_half;
> +	config = &mode->pll1_config[sensor->extclk_rate_idx];
> +	pll1_rate = sensor->extclk_rate * config->pll_mul / config->pll_pre_div_half;
>  
>  	switch (config->pll_pre_div) {
>  	case 0:
> @@ -1552,10 +1597,12 @@ static int ov8865_mode_pll1_configure(struct ov8865_sensor *sensor,
>  				      const struct ov8865_mode *mode,
>  				      u32 mbus_code)
>  {
> -	const struct ov8865_pll1_config *config = mode->pll1_config;
> +	const struct ov8865_pll1_config *config;
>  	u8 value;
>  	int ret;
>  
> +	config = &mode->pll1_config[sensor->extclk_rate_idx];
> +
>  	switch (mbus_code) {
>  	case MEDIA_BUS_FMT_SBGGR10_1X10:
>  		value = OV8865_MIPI_BIT_SEL(10);
> @@ -1622,9 +1669,11 @@ static int ov8865_mode_pll1_configure(struct ov8865_sensor *sensor,
>  static int ov8865_mode_pll2_configure(struct ov8865_sensor *sensor,
>  				      const struct ov8865_mode *mode)
>  {
> -	const struct ov8865_pll2_config *config = mode->pll2_config;
> +	const struct ov8865_pll2_config *config;
>  	int ret;
>  
> +	config = &mode->pll2_config[sensor->extclk_rate_idx];
> +
>  	ret = ov8865_write(sensor, OV8865_PLL_CTRL12_REG,
>  			   OV8865_PLL_CTRL12_PRE_DIV_HALF(config->pll_pre_div_half) |
>  			   OV8865_PLL_CTRL12_DAC_DIV(config->dac_div));
> @@ -2053,9 +2102,11 @@ static int ov8865_mode_configure(struct ov8865_sensor *sensor,
>  static unsigned long ov8865_mode_mipi_clk_rate(struct ov8865_sensor *sensor,
>  					       const struct ov8865_mode *mode)
>  {
> -	const struct ov8865_pll1_config *config = mode->pll1_config;
> +	const struct ov8865_pll1_config *config;
>  	unsigned long pll1_rate;
>  
> +	config = &mode->pll1_config[sensor->extclk_rate_idx];
> +
>  	pll1_rate = ov8865_mode_pll1_rate(sensor, mode);
>  
>  	return pll1_rate / config->m_div / 2;
> @@ -2783,7 +2834,8 @@ static int ov8865_probe(struct i2c_client *client)
>  	struct ov8865_sensor *sensor;
>  	struct v4l2_subdev *subdev;
>  	struct media_pad *pad;
> -	unsigned long rate;
> +	unsigned int rate;
> +	unsigned int i;
>  	int ret;
>  
>  	sensor = devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
> @@ -2858,13 +2910,39 @@ static int ov8865_probe(struct i2c_client *client)
>  		goto error_endpoint;
>  	}
>  
> -	rate = clk_get_rate(sensor->extclk);
> -	if (rate != OV8865_EXTCLK_RATE) {
> -		dev_err(dev, "clock rate %lu Hz is unsupported\n", rate);
> +	/*
> +	 * We could have either a 24MHz or 19.2MHz clock rate. Check for a
> +	 * clock-frequency property and if found, set that rate. This should
> +	 * cover ACPI case. If the system uses devicetree then the configured
> +	 * rate should already be set, so we'll have to check it.
> +	 */
> +
> +	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> +				       &rate);
> +	if (!ret) {
> +		ret = clk_set_rate(sensor->extclk, rate);
> +		if (ret) {
> +			dev_err(dev, "failed to set clock rate\n");
> +			return ret;
> +		}
> +	}
> +
> +	sensor->extclk_rate = clk_get_rate(sensor->extclk);
> +
> +	for (i = 0; i < ARRAY_SIZE(supported_extclk_rates); i++) {
> +		if (sensor->extclk_rate == supported_extclk_rates[i])
> +			break;
> +	}
> +
> +	if (i == ARRAY_SIZE(supported_extclk_rates)) {
> +		dev_err(dev, "clock rate %lu Hz is unsupported\n",
> +			sensor->extclk_rate);
>  		ret = -EINVAL;
>  		goto error_endpoint;
>  	}
>  
> +	sensor->extclk_rate_idx = i;
> +
>  	/* Subdev, entity and pad */
>  
>  	subdev = &sensor->subdev;

-- 
Kind regards,

Sakari Ailus
