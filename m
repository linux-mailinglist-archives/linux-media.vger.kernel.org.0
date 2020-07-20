Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51C482259D4
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 10:18:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbgGTISI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 04:18:08 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:58360 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726015AbgGTISI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 04:18:08 -0400
Received: from [78.134.114.177] (port=42436 helo=[192.168.77.62])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <luca@lucaceresoli.net>)
        id 1jxQzs-0006mt-3H; Mon, 20 Jul 2020 10:18:04 +0200
Subject: Re: [PATCH v2 3/3] media: i2c: imx274: Add IMX274 power on and off
 sequence
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, leonl@leopardimaging.com, robh+dt@kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1595013322-15077-1-git-send-email-skomatineni@nvidia.com>
 <1595013322-15077-3-git-send-email-skomatineni@nvidia.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <57414535-ba36-6a59-a5aa-cd10a233dccc@lucaceresoli.net>
Date:   Mon, 20 Jul 2020 10:18:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595013322-15077-3-git-send-email-skomatineni@nvidia.com>
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

Hi,

On 17/07/20 21:15, Sowjanya Komatineni wrote:
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
>  drivers/media/i2c/imx274.c | 135 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 132 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
> index 55869ff..c3f7bcd 100644
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
> @@ -131,6 +134,15 @@
>  #define IMX274_TABLE_WAIT_MS			0
>  #define IMX274_TABLE_END			1
>  
> +/* regulator supplies */
> +static const char * const imx274_supply_names[] = {
> +	"VDDL",  /* IF (1.2V) supply */
> +	"VDIG",  /* Digital Core (1.8V) supply */
> +	"VANA",  /* Analog (2.8V) supply */
> +};
> +
> +#define IMX274_NUM_SUPPLIES ARRAY_SIZE(imx274_supply_names)
> +
>  /*
>   * imx274 I2C operation related structure
>   */
> @@ -501,6 +513,8 @@ struct imx274_ctrls {
>   * @frame_rate: V4L2 frame rate structure
>   * @regmap: Pointer to regmap structure
>   * @reset_gpio: Pointer to reset gpio
> + * @supplies: imx274 analog and digital supplies
> + * @inck: input clock to imx274
>   * @lock: Mutex structure
>   * @mode: Parameters for the selected readout mode
>   */
> @@ -514,6 +528,8 @@ struct stimx274 {
>  	struct v4l2_fract frame_interval;
>  	struct regmap *regmap;
>  	struct gpio_desc *reset_gpio;
> +	struct regulator *supplies[IMX274_NUM_SUPPLIES];
> +	struct clk *inck;
>  	struct mutex lock; /* mutex lock for operations */
>  	const struct imx274_mode *mode;
>  };
> @@ -767,6 +783,98 @@ static void imx274_reset(struct stimx274 *priv, int rst)
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
> +	int i, ret;
> +
> +	ret = clk_prepare_enable(imx274->inck);
> +	if (ret) {
> +		dev_err(&imx274->client->dev, "Failed to enable clock\n");
> +		return ret;
> +	}
> +
> +	for (i = 0; i < IMX274_NUM_SUPPLIES; i++) {
> +		if (imx274->supplies[i]) {
> +			ret = regulator_enable(imx274->supplies[i]);
> +			if (ret < 0) {
> +				dev_err(&imx274->client->dev,
> +					"Failed to enable %s supply: %d\n",
> +					imx274_supply_names[i], ret);
> +				goto fail_reg;
> +			}
> +		}
> +	}

To me it looks a lot better now, thanks!

> +
> +	usleep_range(1, 2);
> +	imx274_reset(imx274, 1);

With your patch, the first time you enable the imx274 the reset pin is
in an unknown state. It would be probably nicer to keep the chip under
reset while enabling the clocks and deassert reset after they are all
up. Some datasheets require or suggest that, and even when not required
it seems a wise idea.

> +
> +	return 0;
> +
> +fail_reg:
> +	for (--i; i >= 0; i--) {
> +		if (imx274->supplies[i])
> +			regulator_disable(imx274->supplies[i]);
> +	}
> +
> +	clk_disable_unprepare(imx274->inck);
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
> +	int i;
> +
> +	imx274_reset(imx274, 0);
> +
> +	for (i = 0; i < IMX274_NUM_SUPPLIES; i++) {
> +		if (imx274->supplies[i])
> +			regulator_disable(imx274->supplies[i]);
> +	}
> +
> +	clk_disable_unprepare(imx274->inck);
> +
> +	return 0;
> +}
> +
> +static int imx274_get_regulators(struct device *dev, struct stimx274 *imx274)
> +{
> +	int i, err;
> +	const char *supply;
> +
> +	for (i = 0; i < IMX274_NUM_SUPPLIES; i++) {
> +		supply = imx274_supply_names[i];
> +		imx274->supplies[i] = devm_regulator_get_optional(dev, supply);
> +		if (!IS_ERR(imx274->supplies[i]))
> +			continue;
> +		err = PTR_ERR(imx274->supplies[i]);
> +		if (err != -ENODEV) {
> +			if (err != -EPROBE_DEFER)
> +				dev_err(&imx274->client->dev,
> +					"Failed to get %s supply: %d\n",
> +					supply, err);
> +			return err;
> +		}
> +
> +		imx274->supplies[i] = NULL;
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * imx274_s_ctrl - This is used to set the imx274 V4L2 controls
>   * @ctrl: V4L2 control to be set
> @@ -1836,6 +1944,13 @@ static int imx274_probe(struct i2c_client *client)
>  
>  	mutex_init(&imx274->lock);
>  
> +	imx274->inck = devm_clk_get_optional(&client->dev, "inck");
> +	ret = imx274_get_regulators(&client->dev, imx274);
> +	if (ret) {
> +		dev_err(&client->dev, "Failed to get power regulators, err: %d\n", ret);
> +		return ret;
> +	}
> +
>  	/* initialize format */
>  	imx274->mode = &imx274_modes[IMX274_DEFAULT_BINNING];
>  	imx274->crop.width = IMX274_MAX_WIDTH;
> @@ -1883,15 +1998,26 @@ static int imx274_probe(struct i2c_client *client)
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
> +
> +	ret = clk_set_rate(imx274->inck, IMX274_DEFAULT_CLK_FREQ);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "Failed to set INCK clock rate\n");
> +		return ret;
> +	}

I don't think it is _wrong_ (some drivers do than), but I think
clk_set_rate() is better called before enabling the clock, in order to
avoid glitches.

-- 
Luca
