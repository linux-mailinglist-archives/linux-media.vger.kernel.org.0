Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAFF52A2DAA
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 16:09:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726070AbgKBPI5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Nov 2020 10:08:57 -0500
Received: from mga07.intel.com ([134.134.136.100]:58334 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725791AbgKBPI5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Nov 2020 10:08:57 -0500
IronPort-SDR: EyUKyWdZRZt/DLahgFCnB/N1SADy4ohXlm/3ywLuebEJ6uYyFj+8M4pViy7RpQ/L2u4OTubeIU
 qLO4SG/0C4og==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="233066361"
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; 
   d="scan'208";a="233066361"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2020 07:08:53 -0800
IronPort-SDR: VZ15W9VfAAbAUWirdaRc7gN9ji0PujZY3NDoErMegNa8TgfAJq8+QCsei5GNT+sBRNge5xy+jb
 KcmC8zbcMXGA==
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; 
   d="scan'208";a="357353251"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2020 07:08:49 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id ED771208F7; Mon,  2 Nov 2020 17:08:47 +0200 (EET)
Date:   Mon, 2 Nov 2020 17:08:47 +0200
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
Subject: Re: [PATCH v5 4/4] media: i2c: imx258: get clock from device
 properties and enable it via runtime PM
Message-ID: <20201102150847.GZ26150@paasikivi.fi.intel.com>
References: <20201019170247.92002-1-krzk@kernel.org>
 <20201019172617.92815-1-krzk@kernel.org>
 <20201019172617.92815-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019172617.92815-3-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krysztof,

On Mon, Oct 19, 2020 at 07:26:17PM +0200, Krzysztof Kozlowski wrote:
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
> Changes since v4:
> 1. Add missing imx258_power_off.
> 
> Changes since v3:
> 1. None
> 
> Changes since v2:
> 1. Do not try to set drvdata, wrap lines.
> 2. Use dev_dbg.
> 
> Changes since v1:
> 1. Use runtime PM for clock toggling
> ---
>  drivers/media/i2c/imx258.c | 73 +++++++++++++++++++++++++++++++++-----
>  1 file changed, 64 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index ae183b0dbba9..038115471f17 100644
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
> @@ -972,6 +978,29 @@ static int imx258_stop_streaming(struct imx258 *imx258)
>  	return 0;
>  }
>  
> +static int imx258_power_on(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct imx258 *imx258 = to_imx258(sd);
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
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct imx258 *imx258 = to_imx258(sd);
> +
> +	clk_disable_unprepare(imx258->clk);
> +
> +	return 0;
> +}
> +
>  static int imx258_set_stream(struct v4l2_subdev *sd, int enable)
>  {
>  	struct imx258 *imx258 = to_imx258(sd);
> @@ -1199,9 +1228,28 @@ static int imx258_probe(struct i2c_client *client)
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
> +	imx258->clk = devm_clk_get_optional(&client->dev, NULL);
> +	if (!imx258->clk) {
> +		dev_dbg(&client->dev,
> +			"no clock provided, using clock-frequency property\n");
> +
> +		device_property_read_u32(&client->dev, "clock-frequency", &val);
> +		if (val != IMX258_INPUT_CLOCK_FREQ)
> +			return -EINVAL;
> +	} else if (IS_ERR(imx258->clk)) {
> +		return dev_err_probe(&client->dev, PTR_ERR(imx258->clk),
> +				     "error getting clock\n");
> +	} else {
> +		if (clk_get_rate(imx258->clk) != IMX258_INPUT_CLOCK_FREQ) {

Please move the check outside the conditional block. May be a separate
patch if you like.

> +			dev_err(&client->dev,
> +				"input clock frequency not supported\n");
> +			return -EINVAL;
> +		}
> +	}
>  
>  	/*
>  	 * Check that the device is mounted upside down. The driver only
> @@ -1211,24 +1259,25 @@ static int imx258_probe(struct i2c_client *client)
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
> @@ -1258,6 +1307,9 @@ static int imx258_probe(struct i2c_client *client)
>  error_handler_free:
>  	imx258_free_controls(imx258);
>  
> +error_identify:
> +	imx258_power_off(&client->dev);
> +
>  	return ret;
>  }
>  
> @@ -1271,6 +1323,8 @@ static int imx258_remove(struct i2c_client *client)
>  	imx258_free_controls(imx258);
>  
>  	pm_runtime_disable(&client->dev);
> +	if (!pm_runtime_status_suspended(&client->dev))
> +		imx258_power_off(&client->dev);
>  	pm_runtime_set_suspended(&client->dev);
>  
>  	return 0;
> @@ -1278,6 +1332,7 @@ static int imx258_remove(struct i2c_client *client)
>  
>  static const struct dev_pm_ops imx258_pm_ops = {
>  	SET_SYSTEM_SLEEP_PM_OPS(imx258_suspend, imx258_resume)
> +	SET_RUNTIME_PM_OPS(imx258_power_off, imx258_power_on, NULL)
>  };
>  
>  #ifdef CONFIG_ACPI

-- 
Kind regards,

Sakari Ailus
