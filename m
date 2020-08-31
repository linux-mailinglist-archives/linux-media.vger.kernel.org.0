Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00C0C25760D
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 11:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728261AbgHaJJK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 05:09:10 -0400
Received: from mga17.intel.com ([192.55.52.151]:53146 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727979AbgHaJJK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 05:09:10 -0400
IronPort-SDR: D6zlpddwxtVDG3zQ0HRKGNe7bYCF2dDqiSdeeKwq5vWaGMvEGyZpwEMarni7acYfIPWaSwbmkU
 l2NBQZAzCaxw==
X-IronPort-AV: E=McAfee;i="6000,8403,9729"; a="136987660"
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; 
   d="scan'208";a="136987660"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2020 02:09:05 -0700
IronPort-SDR: jixwEQRidF76KpFfUpVyD4e/NMvaG5C6P8VqUv0jvnsAoM6u3tBu2har0K4ncX7ynHHeAI7h7x
 j4GdB1knWwxQ==
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; 
   d="scan'208";a="340588964"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2020 02:09:01 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id D20AB204F9; Mon, 31 Aug 2020 12:08:59 +0300 (EEST)
Date:   Mon, 31 Aug 2020 12:08:59 +0300
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
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        "Yeh, Andy" <andy.yeh@intel.com>,
        "Chiang, Alan" <alanx.chiang@intel.com>,
        "Chen, Jason" <jasonx.z.chen@intel.com>
Subject: Re: [PATCH 3/3] media: imx258: Get clock from device properties and
 enable it
Message-ID: <20200831090859.GF31019@paasikivi.fi.intel.com>
References: <20200828160053.6064-1-krzk@kernel.org>
 <20200828160053.6064-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200828160053.6064-3-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

Thanks for the patchset.

On Fri, Aug 28, 2020 at 06:00:53PM +0200, Krzysztof Kozlowski wrote:
> The IMX258 sensor driver checked in device properties for a
> clock-frequency property which actually does not mean that the clock is
> really running such frequency or is it even enabled.
> 
> Get the provided clock and check it frequency.  If none is provided,
> fall back to old property.
> 
> Enable the clock when accessing the IMX258 registers and when streaming
> starts.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/media/i2c/imx258.c | 107 ++++++++++++++++++++++++++++++-------
>  1 file changed, 87 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index c20bac9b00ec..4d763dcabb1d 100644
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
> @@ -747,6 +753,12 @@ static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
>  	if (pm_runtime_get_if_in_use(&client->dev) == 0)
>  		return 0;
>  
> +	ret = clk_prepare_enable(imx258->clk);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to enable clock\n");
> +		goto out;
> +	}
> +
>  	switch (ctrl->id) {
>  	case V4L2_CID_ANALOGUE_GAIN:
>  		ret = imx258_write_reg(imx258, IMX258_REG_ANALOG_GAIN,
> @@ -779,6 +791,8 @@ static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	}
>  
> +out:
> +	clk_disable_unprepare(imx258->clk);
>  	pm_runtime_put(&client->dev);
>  
>  	return ret;
> @@ -972,10 +986,40 @@ static int imx258_stop_streaming(struct imx258 *imx258)
>  	return 0;
>  }
>  
> +static int imx258_power_on(struct imx258 *imx258)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&imx258->sd);
> +	int ret;
> +
> +	ret = pm_runtime_get_sync(&client->dev);
> +	if (ret < 0)
> +		goto err;

Please continue to use runtime PM directly, and move the clock control to
runtime PM callbacks (apart from probe and remove).

> +
> +	ret = clk_prepare_enable(imx258->clk);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to enable clock\n");
> +		goto err;
> +	}
> +
> +	return 0;
> +
> +err:
> +	pm_runtime_put_noidle(&client->dev);
> +
> +	return ret;
> +}
> +
> +static void imx258_power_off(struct imx258 *imx258)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&imx258->sd);
> +
> +	clk_disable_unprepare(imx258->clk);
> +	pm_runtime_put(&client->dev);
> +}
> +
>  static int imx258_set_stream(struct v4l2_subdev *sd, int enable)
>  {
>  	struct imx258 *imx258 = to_imx258(sd);
> -	struct i2c_client *client = v4l2_get_subdevdata(sd);
>  	int ret = 0;
>  
>  	mutex_lock(&imx258->mutex);
> @@ -985,11 +1029,9 @@ static int imx258_set_stream(struct v4l2_subdev *sd, int enable)
>  	}
>  
>  	if (enable) {
> -		ret = pm_runtime_get_sync(&client->dev);
> -		if (ret < 0) {
> -			pm_runtime_put_noidle(&client->dev);
> +		ret = imx258_power_on(imx258);
> +		if (ret < 0)
>  			goto err_unlock;
> -		}
>  
>  		/*
>  		 * Apply default & customized values
> @@ -997,10 +1039,10 @@ static int imx258_set_stream(struct v4l2_subdev *sd, int enable)
>  		 */
>  		ret = imx258_start_streaming(imx258);
>  		if (ret)
> -			goto err_rpm_put;
> +			goto err_power_off;
>  	} else {
>  		imx258_stop_streaming(imx258);
> -		pm_runtime_put(&client->dev);
> +		imx258_power_off(imx258);
>  	}
>  
>  	imx258->streaming = enable;
> @@ -1008,8 +1050,8 @@ static int imx258_set_stream(struct v4l2_subdev *sd, int enable)
>  
>  	return ret;
>  
> -err_rpm_put:
> -	pm_runtime_put(&client->dev);
> +err_power_off:
> +	imx258_power_off(imx258);
>  err_unlock:
>  	mutex_unlock(&imx258->mutex);
>  
> @@ -1201,21 +1243,41 @@ static int imx258_probe(struct i2c_client *client)
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
> +		dev_info(&client->dev, "no clock provided, using clock-frequency property\n");
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
> +
> +		ret = clk_prepare_enable(imx258->clk);
> +		if (ret) {
> +			dev_err(&client->dev, "failed to enable clock\n");
> +			return ret;
> +		}
> +	}
>  
>  	/*
>  	 * Check that the device is mounted upside down. The driver only
>  	 * supports a single pixel order right now.
>  	 */
>  	ret = device_property_read_u32(&client->dev, "rotation", &val);
> -	if (ret || val != 180)
> -		return -EINVAL;
> -
> -	imx258 = devm_kzalloc(&client->dev, sizeof(*imx258), GFP_KERNEL);
> -	if (!imx258)
> -		return -ENOMEM;
> +	if (ret || val != 180) {
> +		ret = -EINVAL;
> +		goto error_prop_read;
> +	}
>  
>  	/* Initialize subdev */
>  	v4l2_i2c_subdev_init(&imx258->sd, client, &imx258_subdev_ops);
> @@ -1223,14 +1285,14 @@ static int imx258_probe(struct i2c_client *client)
>  	/* Check module identity */
>  	ret = imx258_identify_module(imx258);
>  	if (ret)
> -		return ret;
> +		goto error_prop_read;
>  
>  	/* Set default mode to max resolution */
>  	imx258->cur_mode = &supported_modes[0];
>  
>  	ret = imx258_init_controls(imx258);
>  	if (ret)
> -		return ret;
> +		goto error_prop_read;
>  
>  	/* Initialize subdev */
>  	imx258->sd.internal_ops = &imx258_internal_ops;
> @@ -1252,8 +1314,13 @@ static int imx258_probe(struct i2c_client *client)
>  	pm_runtime_enable(&client->dev);
>  	pm_runtime_idle(&client->dev);
>  
> +	clk_disable_unprepare(imx258->clk);
> +
>  	return 0;
>  
> +error_prop_read:
> +	clk_disable_unprepare(imx258->clk);

How about remove? Think of how this works when runtime PM is disabled.

> +
>  error_media_entity:
>  	media_entity_cleanup(&imx258->sd.entity);
>  

-- 
Kind regards,

Sakari Ailus
