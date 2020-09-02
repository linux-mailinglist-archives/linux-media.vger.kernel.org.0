Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC9B225A6ED
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 09:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbgIBHjt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 03:39:49 -0400
Received: from mga05.intel.com ([192.55.52.43]:58983 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726386AbgIBHjr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 03:39:47 -0400
IronPort-SDR: w+sVhTIR1FU5l1omH1VmLyEgSFzooiCH8IBbgzigadxBZd28xPW40WX5NmM/SbsfTS2YuXWulX
 FDvw2+MkORpw==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="242163301"
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; 
   d="scan'208";a="242163301"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2020 00:39:41 -0700
IronPort-SDR: RgTVMExpPOjXZ/Qzf+arWf4VKdtTDlfMfqNaZTssL6deE9F0GdvBHabkRQdLGrO5SyJn3VJ8tA
 jHWKUDfXq6DQ==
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; 
   d="scan'208";a="282226772"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2020 00:39:37 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 34752207AD; Wed,  2 Sep 2020 10:39:35 +0300 (EEST)
Date:   Wed, 2 Sep 2020 10:39:35 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] media: imx258: Get clock from device properties
 and enable it via runtime PM
Message-ID: <20200902073935.GD32646@paasikivi.fi.intel.com>
References: <1599031090-21608-1-git-send-email-krzk@kernel.org>
 <1599031090-21608-3-git-send-email-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1599031090-21608-3-git-send-email-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

Thanks for the update.

On Wed, Sep 02, 2020 at 09:18:10AM +0200, Krzysztof Kozlowski wrote:
> The IMX258 sensor driver checked in device properties for a
> clock-frequency property which actually does not mean that the clock is
> really running such frequency or is it even enabled.
> 
> Get the provided clock and check it frequency.  If none is provided,
> fall back to old property.
> 
> Enable the clock when accessing the IMX258 registers and when streaming
> starts with runtime PM.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Use runtime PM for clock toggling
> ---
>  drivers/media/i2c/imx258.c | 68 ++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 59 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index c20bac9b00ec..ee38dafb8450 100644
> --- a/drivers/media/i2c/imx258.c
> +++ b/drivers/media/i2c/imx258.c
> @@ -2,6 +2,7 @@
>  // Copyright (C) 2018 Intel Corporation
>  
>  #include <linux/acpi.h>
> +#include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/i2c.h>
>  #include <linux/module.h>
> @@ -68,6 +69,9 @@
>  #define REG_CONFIG_MIRROR_FLIP		0x03
>  #define REG_CONFIG_FLIP_TEST_PATTERN	0x02
>  
> +/* Input clock frequency in Hz */
> +#define IMX258_INPUT_CLOCK_FREQ		19200000
> +
>  struct imx258_reg {
>  	u16 address;
>  	u8 val;
> @@ -610,6 +614,8 @@ struct imx258 {
>  
>  	/* Streaming on/off */
>  	bool streaming;
> +
> +	struct clk *clk;
>  };
>  
>  static inline struct imx258 *to_imx258(struct v4l2_subdev *_sd)
> @@ -972,6 +978,27 @@ static int imx258_stop_streaming(struct imx258 *imx258)
>  	return 0;
>  }
>  
> +static int imx258_power_on(struct device *dev)
> +{
> +	struct imx258 *imx258 = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_prepare_enable(imx258->clk);
> +	if (ret)
> +		dev_err(dev, "failed to enable clock\n");
> +
> +	return ret;
> +}
> +
> +static int imx258_power_off(struct device *dev)
> +{
> +	struct imx258 *imx258 = dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(imx258->clk);
> +
> +	return 0;
> +}
> +
>  static int imx258_set_stream(struct v4l2_subdev *sd, int enable)
>  {
>  	struct imx258 *imx258 = to_imx258(sd);
> @@ -1201,9 +1228,27 @@ static int imx258_probe(struct i2c_client *client)
>  	int ret;
>  	u32 val = 0;
>  
> -	device_property_read_u32(&client->dev, "clock-frequency", &val);
> -	if (val != 19200000)
> -		return -EINVAL;
> +	imx258 = devm_kzalloc(&client->dev, sizeof(*imx258), GFP_KERNEL);
> +	if (!imx258)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(&client->dev, imx258);

This you cannot do --- it'll be overwritten by v4l2_i2c_subdev_init().

> +
> +	imx258->clk = devm_clk_get_optional(&client->dev, NULL);
> +	if (!imx258->clk) {

You can move declaration of val here (I think).

> +		dev_info(&client->dev, "no clock provided, using clock-frequency property\n");

As this is showing up on all ACPI based systems, I guess dev_dbg() would be
more appropriate.

Please also wrap lines over 80 if they reasonably can be.

> +
> +		device_property_read_u32(&client->dev, "clock-frequency", &val);
> +		if (val != IMX258_INPUT_CLOCK_FREQ)
> +			return -EINVAL;
> +	} else if (IS_ERR(imx258->clk)) {
> +		return dev_err_probe(&client->dev, PTR_ERR(imx258->clk), "error getting clock\n");
> +	} else {
> +		if (clk_get_rate(imx258->clk) != IMX258_INPUT_CLOCK_FREQ) {
> +			dev_err(&client->dev, "input clock frequency not supported\n");
> +			return -EINVAL;
> +		}
> +	}
>  
>  	/*
>  	 * Check that the device is mounted upside down. The driver only
> @@ -1213,24 +1258,25 @@ static int imx258_probe(struct i2c_client *client)
>  	if (ret || val != 180)
>  		return -EINVAL;
>  
> -	imx258 = devm_kzalloc(&client->dev, sizeof(*imx258), GFP_KERNEL);
> -	if (!imx258)
> -		return -ENOMEM;
> -
>  	/* Initialize subdev */
>  	v4l2_i2c_subdev_init(&imx258->sd, client, &imx258_subdev_ops);
>  
> +	/* Will be powered off via pm_runtime_idle */
> +	ret = imx258_power_on(&client->dev);
> +	if (ret)
> +		return ret;
> +
>  	/* Check module identity */
>  	ret = imx258_identify_module(imx258);
>  	if (ret)
> -		return ret;
> +		goto error_identify;
>  
>  	/* Set default mode to max resolution */
>  	imx258->cur_mode = &supported_modes[0];
>  
>  	ret = imx258_init_controls(imx258);
>  	if (ret)
> -		return ret;
> +		goto error_identify;
>  
>  	/* Initialize subdev */
>  	imx258->sd.internal_ops = &imx258_internal_ops;
> @@ -1260,6 +1306,9 @@ static int imx258_probe(struct i2c_client *client)
>  error_handler_free:
>  	imx258_free_controls(imx258);
>  
> +error_identify:
> +	imx258_power_off(&client->dev);
> +
>  	return ret;
>  }
>  
> @@ -1280,6 +1329,7 @@ static int imx258_remove(struct i2c_client *client)
>  
>  static const struct dev_pm_ops imx258_pm_ops = {
>  	SET_SYSTEM_SLEEP_PM_OPS(imx258_suspend, imx258_resume)
> +	SET_RUNTIME_PM_OPS(imx258_power_off, imx258_power_on, NULL)
>  };
>  
>  #ifdef CONFIG_ACPI

-- 
Sakari Ailus
