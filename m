Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B426441CDA
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 15:52:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230261AbhKAOzD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 10:55:03 -0400
Received: from mga06.intel.com ([134.134.136.31]:3321 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229826AbhKAOzA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Nov 2021 10:55:00 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10154"; a="291867074"
X-IronPort-AV: E=Sophos;i="5.87,199,1631602800"; 
   d="scan'208";a="291867074"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2021 07:52:27 -0700
X-IronPort-AV: E=Sophos;i="5.87,199,1631602800"; 
   d="scan'208";a="666737604"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2021 07:52:24 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 6901A2015E;
        Mon,  1 Nov 2021 16:52:22 +0200 (EET)
Date:   Mon, 1 Nov 2021 16:52:22 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v4 04/16] media: i2c: Support 19.2MHz input clock in
 ov8865
Message-ID: <YX//JqaiubPXeNey@paasikivi.fi.intel.com>
References: <20211101001119.46056-1-djrscally@gmail.com>
 <20211101001119.46056-5-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211101001119.46056-5-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

Thanks for the set.

On Mon, Nov 01, 2021 at 12:11:07AM +0000, Daniel Scally wrote:
> The ov8865 driver as written expects a 24MHz input clock, but the sensor
> is sometimes found on x86 platforms with a 19.2MHz input clock supplied.
> Add a set of PLL configurations to the driver to support that rate too.
> As ACPI doesn't auto-configure the clock rate, check for a clock-frequency
> during probe and set that rate if one is found.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
>  drivers/media/i2c/ov8865.c | 186 +++++++++++++++++++++++++++----------
>  1 file changed, 135 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> index 9bc8d5d8199b..4ddc1b277cc0 100644
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
> @@ -567,6 +563,25 @@ struct ov8865_sclk_config {
>  	unsigned int sclk_div;
>  };
>  
> +struct ov8865_pll_configs {
> +	const struct ov8865_pll1_config *pll1_config;
> +	const struct ov8865_pll2_config *pll2_config_native;
> +	const struct ov8865_pll2_config *pll2_config_binning;
> +};
> +
> +/* Clock rate */
> +
> +enum extclk_rate {
> +	OV8865_19_2_MHZ,
> +	OV8865_24_MHZ,
> +	OV8865_NUM_SUPPORTED_RATES
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
> @@ -635,9 +650,7 @@ struct ov8865_mode {
>  
>  	struct v4l2_fract frame_interval;
>  
> -	const struct ov8865_pll1_config *pll1_config;
> -	const struct ov8865_pll2_config *pll2_config;
> -	const struct ov8865_sclk_config *sclk_config;
> +	bool pll2_binning;
>  
>  	const struct ov8865_register_value *register_values;
>  	unsigned int register_values_count;
> @@ -665,6 +678,9 @@ struct ov8865_sensor {
>  	struct regulator *avdd;
>  	struct regulator *dvdd;
>  	struct regulator *dovdd;
> +
> +	unsigned long extclk_rate;
> +	const struct ov8865_pll_configs *pll_configs;
>  	struct clk *extclk;
>  
>  	struct v4l2_fwnode_endpoint endpoint;
> @@ -680,43 +696,70 @@ struct ov8865_sensor {
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
> +static const struct ov8865_pll1_config ov8865_pll1_config_native_19_2mhz = {
> +		.pll_pre_div_half	= 1,
> +		.pll_pre_div		= 2,
> +		.pll_mul		= 75,
> +		.m_div			= 1,
> +		.mipi_div		= 3,
> +		.pclk_div		= 1,
> +		.sys_pre_div		= 1,
> +		.sys_div		= 2,
> +};
> +
> +static const struct ov8865_pll1_config ov8865_pll1_config_native_24mhz = {
> +		.pll_pre_div_half	= 1,
> +		.pll_pre_div		= 0,
> +		.pll_mul		= 30,
> +		.m_div			= 1,
> +		.mipi_div		= 3,
> +		.pclk_div		= 1,
> +		.sys_pre_div		= 1,
> +		.sys_div		= 2,
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
> +static const struct ov8865_pll2_config ov8865_pll2_config_native_19_2mhz = {
> +		.pll_pre_div_half	= 1,
> +		.pll_pre_div		= 5,
> +		.pll_mul		= 75,
> +		.dac_div		= 1,
> +		.sys_pre_div		= 1,
> +		.sys_div		= 3,
> +};
> +
> +static const struct ov8865_pll2_config ov8865_pll2_config_native_24mhz = {
> +		.pll_pre_div_half	= 1,
> +		.pll_pre_div		= 0,
> +		.pll_mul		= 30,
> +		.dac_div		= 2,
> +		.sys_pre_div		= 5,
> +		.sys_div		= 0,
>  };
>  
>  /*
> - * EXTCLK = 24 MHz
>   * DAC_CLK = 360 MHz
>   * SCLK = 72 MHz
>   */
>  
> -static const struct ov8865_pll2_config ov8865_pll2_config_binning = {
> +static const struct ov8865_pll2_config ov8865_pll2_config_binning_19_2mhz = {
> +	.pll_pre_div_half	= 1,
> +	.pll_pre_div		= 2,
> +	.pll_mul		= 75,
> +	.dac_div		= 2,
> +	.sys_pre_div		= 10,
> +	.sys_div		= 0,
> +};
> +
> +static const struct ov8865_pll2_config ov8865_pll2_config_binning_24mhz = {
>  	.pll_pre_div_half	= 1,
>  	.pll_pre_div		= 0,
>  	.pll_mul		= 30,
> @@ -725,6 +768,23 @@ static const struct ov8865_pll2_config ov8865_pll2_config_binning = {
>  	.sys_div		= 0,
>  };
>  
> +static struct ov8865_pll_configs ov8865_pll_configs_19_2mhz = {
> +	.pll1_config = &ov8865_pll1_config_native_19_2mhz,
> +	.pll2_config_native = &ov8865_pll2_config_native_19_2mhz,
> +	.pll2_config_binning = &ov8865_pll2_config_binning_19_2mhz,
> +};
> +
> +static struct ov8865_pll_configs ov8865_pll_configs_24mhz = {
> +	.pll1_config = &ov8865_pll1_config_native_24mhz,
> +	.pll2_config_native = &ov8865_pll2_config_native_24mhz,
> +	.pll2_config_binning = &ov8865_pll2_config_binning_24mhz,
> +};

These should be const.

> +
> +static const struct ov8865_pll_configs *ov8865_pll_configs[] = {
> +	&ov8865_pll_configs_19_2mhz,
> +	&ov8865_pll_configs_24mhz,
> +};
> +
>  static const struct ov8865_sclk_config ov8865_sclk_config_native = {
>  	.sys_sel		= 1,
>  	.sclk_sel		= 0,
> @@ -934,9 +994,7 @@ static const struct ov8865_mode ov8865_modes[] = {
>  		.frame_interval			= { 1, 30 },
>  
>  		/* PLL */
> -		.pll1_config			= &ov8865_pll1_config_native,
> -		.pll2_config			= &ov8865_pll2_config_native,
> -		.sclk_config			= &ov8865_sclk_config_native,
> +		.pll2_binning			= false,
>  
>  		/* Registers */
>  		.register_values	= ov8865_register_values_native,
> @@ -990,9 +1048,7 @@ static const struct ov8865_mode ov8865_modes[] = {
>  		.frame_interval			= { 1, 30 },
>  
>  		/* PLL */
> -		.pll1_config			= &ov8865_pll1_config_native,
> -		.pll2_config			= &ov8865_pll2_config_native,
> -		.sclk_config			= &ov8865_sclk_config_native,
> +		.pll2_binning			= false,
>  
>  		/* Registers */
>  		.register_values	= ov8865_register_values_native,
> @@ -1050,9 +1106,7 @@ static const struct ov8865_mode ov8865_modes[] = {
>  		.frame_interval			= { 1, 30 },
>  
>  		/* PLL */
> -		.pll1_config			= &ov8865_pll1_config_native,
> -		.pll2_config			= &ov8865_pll2_config_binning,
> -		.sclk_config			= &ov8865_sclk_config_native,
> +		.pll2_binning			= true,
>  
>  		/* Registers */
>  		.register_values	= ov8865_register_values_binning,
> @@ -1116,9 +1170,7 @@ static const struct ov8865_mode ov8865_modes[] = {
>  		.frame_interval			= { 1, 90 },
>  
>  		/* PLL */
> -		.pll1_config			= &ov8865_pll1_config_native,
> -		.pll2_config			= &ov8865_pll2_config_binning,
> -		.sclk_config			= &ov8865_sclk_config_native,
> +		.pll2_binning			= true,
>  
>  		/* Registers */
>  		.register_values	= ov8865_register_values_binning,
> @@ -1513,12 +1565,11 @@ static int ov8865_isp_configure(struct ov8865_sensor *sensor)
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
> +	config = sensor->pll_configs->pll1_config;
> +	pll1_rate = sensor->extclk_rate * config->pll_mul / config->pll_pre_div_half;
>  
>  	switch (config->pll_pre_div) {
>  	case 0:
> @@ -1552,10 +1603,12 @@ static int ov8865_mode_pll1_configure(struct ov8865_sensor *sensor,
>  				      const struct ov8865_mode *mode,
>  				      u32 mbus_code)
>  {
> -	const struct ov8865_pll1_config *config = mode->pll1_config;
> +	const struct ov8865_pll1_config *config;
>  	u8 value;
>  	int ret;
>  
> +	config = sensor->pll_configs->pll1_config;
> +
>  	switch (mbus_code) {
>  	case MEDIA_BUS_FMT_SBGGR10_1X10:
>  		value = OV8865_MIPI_BIT_SEL(10);
> @@ -1622,9 +1675,12 @@ static int ov8865_mode_pll1_configure(struct ov8865_sensor *sensor,
>  static int ov8865_mode_pll2_configure(struct ov8865_sensor *sensor,
>  				      const struct ov8865_mode *mode)
>  {
> -	const struct ov8865_pll2_config *config = mode->pll2_config;
> +	const struct ov8865_pll2_config *config;
>  	int ret;
>  
> +	config = mode->pll2_binning ? sensor->pll_configs->pll2_config_binning :
> +				      sensor->pll_configs->pll2_config_native;
> +
>  	ret = ov8865_write(sensor, OV8865_PLL_CTRL12_REG,
>  			   OV8865_PLL_CTRL12_PRE_DIV_HALF(config->pll_pre_div_half) |
>  			   OV8865_PLL_CTRL12_DAC_DIV(config->dac_div));
> @@ -1658,7 +1714,7 @@ static int ov8865_mode_pll2_configure(struct ov8865_sensor *sensor,
>  static int ov8865_mode_sclk_configure(struct ov8865_sensor *sensor,
>  				      const struct ov8865_mode *mode)
>  {
> -	const struct ov8865_sclk_config *config = mode->sclk_config;
> +	const struct ov8865_sclk_config *config = &ov8865_sclk_config_native;
>  	int ret;
>  
>  	ret = ov8865_write(sensor, OV8865_CLK_SEL0_REG,
> @@ -2053,9 +2109,11 @@ static int ov8865_mode_configure(struct ov8865_sensor *sensor,
>  static unsigned long ov8865_mode_mipi_clk_rate(struct ov8865_sensor *sensor,
>  					       const struct ov8865_mode *mode)
>  {
> -	const struct ov8865_pll1_config *config = mode->pll1_config;
> +	const struct ov8865_pll1_config *config;
>  	unsigned long pll1_rate;
>  
> +	config = sensor->pll_configs->pll1_config;
> +
>  	pll1_rate = ov8865_mode_pll1_rate(sensor, mode);
>  
>  	return pll1_rate / config->m_div / 2;
> @@ -2783,7 +2841,8 @@ static int ov8865_probe(struct i2c_client *client)
>  	struct ov8865_sensor *sensor;
>  	struct v4l2_subdev *subdev;
>  	struct media_pad *pad;
> -	unsigned long rate;
> +	unsigned int rate;
> +	unsigned int i;
>  	int ret;
>  
>  	sensor = devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
> @@ -2858,13 +2917,38 @@ static int ov8865_probe(struct i2c_client *client)
>  		goto error_endpoint;
>  	}
>  
> -	rate = clk_get_rate(sensor->extclk);
> -	if (rate != OV8865_EXTCLK_RATE) {
> -		dev_err(dev, "clock rate %lu Hz is unsupported\n", rate);
> +	/*
> +	 * We could have either a 24MHz or 19.2MHz clock rate. Check for a
> +	 * clock-frequency property and if found, set that rate. This should
> +	 * cover the ACPI case. If the system uses devicetree then the
> +	 * configured rate should already be set, so we'll have to check it.
> +	 */
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

clk_get_rate() returns 0 if you don't have a clock. But you can still have
clock-frequency property that tells the frequency. This is generally the
case on ACPI based systems apart from some exceptions (which I understand
you're well aware of).

See e.g. drivers/media/i2c/ccs/ccs-core.c .

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
> +	sensor->pll_configs = ov8865_pll_configs[i];
> +
>  	/* Subdev, entity and pad */
>  
>  	subdev = &sensor->subdev;

-- 
Kind regards,

Sakari Ailus
