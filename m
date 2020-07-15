Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4479D2213AF
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 19:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725992AbgGORqt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 13:46:49 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:48947 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725861AbgGORqt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 13:46:49 -0400
Received: from [78.134.114.177] (port=60602 helo=[192.168.77.67])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <luca@lucaceresoli.net>)
        id 1jvlUQ-0006SP-MT; Wed, 15 Jul 2020 19:46:42 +0200
Subject: Re: [PATCH v1 3/3] media: i2c: imx274: Add IMX274 power on and off
 sequence
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, leonl@leopardimaging.com, robh+dt@kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1594787096-26685-1-git-send-email-skomatineni@nvidia.com>
 <1594787096-26685-3-git-send-email-skomatineni@nvidia.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <5dbcb8cf-8122-9147-c1f6-8e006ac4a81f@lucaceresoli.net>
Date:   Wed, 15 Jul 2020 19:46:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594787096-26685-3-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sowjanya,

your patch looks good, but I have a few comments about the coding style,
see below.

On 15/07/20 06:24, Sowjanya Komatineni wrote:
> IMX274 has VANA analog 2.8V supply, VDIG digital core 1.8V supply,
> and VDDL digital io 1.2V supply which are optional based on camera
> module design.
> 
> IMX274 also need external 24Mhz clock and is optional based on
> camera module design.
> 
> This patch adds support for IMX274 power on and off to enable and
> disable these supplies and external clock.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/media/i2c/imx274.c | 170 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 167 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
> index 55869ff..8a34c07 100644
> --- a/drivers/media/i2c/imx274.c
> +++ b/drivers/media/i2c/imx274.c
> @@ -19,6 +19,7 @@
>  #include <linux/module.h>
>  #include <linux/of_gpio.h>
>  #include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
>  #include <linux/v4l2-mediabus.h>
>  #include <linux/videodev2.h>
> @@ -27,6 +28,8 @@
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-subdev.h>
>  
> +#define IMX274_DEFAULT_CLK_FREQ			24000000
> +
>  /*
>   * See "SHR, SVR Setting" in datasheet
>   */
> @@ -501,6 +504,10 @@ struct imx274_ctrls {
>   * @frame_rate: V4L2 frame rate structure
>   * @regmap: Pointer to regmap structure
>   * @reset_gpio: Pointer to reset gpio
> + * @vana_supply: VANA analog supply regulator
> + * @vdig_supply: VDIG digital core supply regulator
> + * @vddl_supply: VDDL digital io supply regulator
> + * @xclk: system clock to imx274
>   * @lock: Mutex structure
>   * @mode: Parameters for the selected readout mode
>   */
> @@ -514,6 +521,10 @@ struct stimx274 {
>  	struct v4l2_fract frame_interval;
>  	struct regmap *regmap;
>  	struct gpio_desc *reset_gpio;
> +	struct regulator *vana_supply;
> +	struct regulator *vdig_supply;
> +	struct regulator *vddl_supply;
> +	struct clk *xclk;
>  	struct mutex lock; /* mutex lock for operations */
>  	const struct imx274_mode *mode;
>  };
> @@ -767,6 +778,138 @@ static void imx274_reset(struct stimx274 *priv, int rst)
>  	usleep_range(IMX274_RESET_DELAY1, IMX274_RESET_DELAY2);
>  }
>  
> +/*
> + * imx274_power_on - Function called to power on the sensor
> + * @imx274: Pointer to device structure
> + */
> +static int imx274_power_on(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct stimx274 *imx274 = to_imx274(sd);
> +	int ret;
> +
> +	ret = clk_prepare_enable(imx274->xclk);
> +	if (ret) {
> +		dev_err(&imx274->client->dev, "Failed to enable clock\n");
> +		return ret;
> +	}
> +
> +	if (imx274->vana_supply) {
> +		ret = regulator_enable(imx274->vana_supply);
> +		if (ret < 0) {
> +			dev_err(&imx274->client->dev,
> +				"Failed to enable VANA supply: %d\n", ret);
> +			goto disable_clk;
> +		}
> +	}
> +
> +	if (imx274->vdig_supply) {
> +		ret = regulator_enable(imx274->vdig_supply);
> +		if (ret < 0) {
> +			dev_err(&imx274->client->dev,
> +				"Failed to enable VDIG supply: %d\n", ret);
> +			goto disable_vana_reg;
> +		}
> +	}
> +
> +	if (imx274->vddl_supply) {
> +		ret = regulator_enable(imx274->vddl_supply);
> +		if (ret < 0) {
> +			dev_err(&imx274->client->dev,
> +				"Failed to enable VDDL supply: %d\n", ret);
> +			goto disable_vdig_reg;
> +		}
> +	}
> +
> +	usleep_range(1, 2);
> +	imx274_reset(imx274, 1);
> +
> +	return 0;
> +
> +disable_vdig_reg:
> +	if (imx274->vdig_supply)
> +		regulator_disable(imx274->vdig_supply);
> +disable_vana_reg:
> +	if (imx274->vana_supply)
> +		regulator_disable(imx274->vana_supply);
> +disable_clk:
> +	clk_disable_unprepare(imx274->xclk);
> +	return ret;
> +}
> +
> +/*
> + * imx274_power_off - Function called to power off the sensor
> + * @imx274: Pointer to device structure
> + */
> +static int imx274_power_off(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct stimx274 *imx274 = to_imx274(sd);
> +
> +	imx274_reset(imx274, 0);
> +
> +	if (imx274->vddl_supply)
> +		regulator_disable(imx274->vddl_supply);
> +
> +	if (imx274->vdig_supply)
> +		regulator_disable(imx274->vdig_supply);
> +
> +	if (imx274->vana_supply)
> +		regulator_disable(imx274->vana_supply);
> +
> +	clk_disable_unprepare(imx274->xclk);
> +
> +	return 0;
> +}
> +
> +static int imx274_get_regulators(struct device *dev, struct stimx274 *imx274)
> +{

To make code much more readable:

  int err;

> +	int i;
> +
> +	imx274->vana_supply = devm_regulator_get_optional(dev, "VANA");
> +	if (IS_ERR(imx274->vana_supply)) {

  err = PTR_ERR(imx274->vana_supply)

and then use 'err' everywhere in place of PTR_ERR(imx274->vana_supply).

> +		if (PTR_ERR(imx274->vana_supply) != -ENODEV) {
> +			if (PTR_ERR(imx274->vana_supply) != -EPROBE_DEFER)
> +				dev_err(&imx274->client->dev,
> +					"Failed to get VANA supply: %ld\n",
> +					PTR_ERR(imx274->vana_supply));
> +			return PTR_ERR(imx274->vana_supply);
> +		}
> +
> +		imx274->vana_supply = NULL;
> +	}
> +
> +	imx274->vdig_supply = devm_regulator_get_optional(dev, "VDIG");
> +	if (IS_ERR(imx274->vdig_supply)) {
> +		if (PTR_ERR(imx274->vdig_supply) != -ENODEV) {
> +			if (PTR_ERR(imx274->vdig_supply) != -EPROBE_DEFER)
> +				dev_err(&imx274->client->dev,
> +					"Failed to get VDIG supply: %ld\n",
> +					PTR_ERR(imx274->vdig_supply));
> +			return PTR_ERR(imx274->vdig_supply);
> +		}
> +
> +		imx274->vdig_supply = NULL;
> +	}
> +
> +	imx274->vddl_supply = devm_regulator_get_optional(dev, "VDDL");
> +	if (IS_ERR(imx274->vddl_supply)) {
> +		if (PTR_ERR(imx274->vddl_supply) != -ENODEV) {
> +			if (PTR_ERR(imx274->vddl_supply) != -EPROBE_DEFER)
> +				dev_err(&imx274->client->dev,
> +					"Failed to get VDIG supply: %ld\n",
> +					PTR_ERR(imx274->vddl_supply));
> +			return PTR_ERR(imx274->vddl_supply);
> +		}
> +
> +		imx274->vddl_supply = NULL;
> +	}

Here, as well as in imx274_power_on(), you have 3 identical sections for
the 3 regulators. Why not having an array of 3 elements in struct
stimx274 and then access them in a loop? You'll need also the names:

  static const char* regulator_name[3] = { "VANA", "VDIG", "VDDL" };

>  /**
>   * imx274_s_ctrl - This is used to set the imx274 V4L2 controls
>   * @ctrl: V4L2 control to be set
> @@ -1836,6 +1979,19 @@ static int imx274_probe(struct i2c_client *client)
>  
>  	mutex_init(&imx274->lock);
>  
> +	imx274->xclk = devm_clk_get_optional(&client->dev, "xclk");
> +	ret = clk_set_rate(imx274->xclk, IMX274_DEFAULT_CLK_FREQ);

Nitpicking, but I'd move this line closer to the end of the function in
order to set the clock rate only if all the get operations succeeded.

> +	if (ret < 0) {
> +		dev_err(&client->dev, "Failed to set xclk rate\n");
> +		return ret;
> +	}
> +
> +	ret = imx274_get_regulators(&client->dev, imx274);
> +	if (ret) {
> +		dev_err(&client->dev, "Failed to get power regulators, err: %d\n", ret);
> +		return ret;
> +	}
> +
>  	/* initialize format */
>  	imx274->mode = &imx274_modes[IMX274_DEFAULT_BINNING];
>  	imx274->crop.width = IMX274_MAX_WIDTH;
> @@ -1883,15 +2039,20 @@ static int imx274_probe(struct i2c_client *client)
>  		goto err_me;
>  	}
>  
> -	/* pull sensor out of reset */
> -	imx274_reset(imx274, 1);
> +	/* power on the sensor */
> +	ret = imx274_power_on(&client->dev);
> +	if (ret < 0) {
> +		dev_err(&client->dev,
> +			"%s : imx274 power on failed\n", __func__);
> +		goto err_me;
> +	}
>  
>  	/* initialize controls */
>  	ret = v4l2_ctrl_handler_init(&imx274->ctrls.handler, 4);
>  	if (ret < 0) {
>  		dev_err(&client->dev,
>  			"%s : ctrl handler init Failed\n", __func__);
> -		goto err_me;
> +		goto err_power_off;
>  	}
>  
>  	imx274->ctrls.handler.lock = &imx274->lock;
> @@ -1958,6 +2119,8 @@ static int imx274_probe(struct i2c_client *client)
>  
>  err_ctrls:
>  	v4l2_ctrl_handler_free(&imx274->ctrls.handler);
> +err_power_off:
> +	imx274_power_off(&client->dev);
>  err_me:
>  	media_entity_cleanup(&sd->entity);
>  err_regmap:
> @@ -1975,6 +2138,7 @@ static int imx274_remove(struct i2c_client *client)
>  
>  	v4l2_async_unregister_subdev(sd);
>  	v4l2_ctrl_handler_free(&imx274->ctrls.handler);
> +	imx274_power_off(&client->dev);
>  	media_entity_cleanup(&sd->entity);
>  	mutex_destroy(&imx274->lock);
>  	return 0;
> 


-- 
Luca
