Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F09DF23492C
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 18:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731140AbgGaQ1Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jul 2020 12:27:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbgGaQ1Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jul 2020 12:27:16 -0400
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC769C061574;
        Fri, 31 Jul 2020 09:27:15 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 44449634C87;
        Fri, 31 Jul 2020 19:26:12 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1k1XrI-0001fn-3a; Fri, 31 Jul 2020 19:26:12 +0300
Date:   Fri, 31 Jul 2020 19:26:12 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, luca@lucaceresoli.net,
        leonl@leopardimaging.com, robh+dt@kernel.org, lgirdwood@gmail.com,
        broonie@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] media: i2c: imx274: Add IMX274 power on and off
 sequence
Message-ID: <20200731162611.GB6401@valkosipuli.retiisi.org.uk>
References: <1595264494-2400-1-git-send-email-skomatineni@nvidia.com>
 <1595264494-2400-3-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1595264494-2400-3-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sowjanya,

Thanks for the patch.

On Mon, Jul 20, 2020 at 10:01:34AM -0700, Sowjanya Komatineni wrote:
> IMX274 has VANA analog 2.8V supply, VDIG digital core 1.8V supply,
> and VDDL digital io 1.2V supply which are optional based on camera
> module design.
> 
> IMX274 also need external 24Mhz clock and is optional based on
> camera module design.

The sensor appears to be able to use other frequencies, too. Could you
check in the driver the frequency is correct? This should be found in DT
bindings, too.

> 
> This patch adds support for IMX274 power on and off to enable and
> disable these supplies and external clock.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/media/i2c/imx274.c | 132 +++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 129 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
> index 55869ff..7157b1d 100644
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
> @@ -131,6 +132,15 @@
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

Please use ARRAY_SIZE() directly.

> +
>  /*
>   * imx274 I2C operation related structure
>   */
> @@ -501,6 +511,8 @@ struct imx274_ctrls {
>   * @frame_rate: V4L2 frame rate structure
>   * @regmap: Pointer to regmap structure
>   * @reset_gpio: Pointer to reset gpio
> + * @supplies: imx274 analog and digital supplies
> + * @inck: input clock to imx274
>   * @lock: Mutex structure
>   * @mode: Parameters for the selected readout mode
>   */
> @@ -514,6 +526,8 @@ struct stimx274 {
>  	struct v4l2_fract frame_interval;
>  	struct regmap *regmap;
>  	struct gpio_desc *reset_gpio;
> +	struct regulator *supplies[IMX274_NUM_SUPPLIES];
> +	struct clk *inck;
>  	struct mutex lock; /* mutex lock for operations */
>  	const struct imx274_mode *mode;
>  };
> @@ -767,6 +781,99 @@ static void imx274_reset(struct stimx274 *priv, int rst)
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
> +		dev_err(&imx274->client->dev,
> +			"Failed to enable input clock: %d\n", ret);
> +		return ret;
> +	}
> +

Could you use regulator_bulk_enable() instead? Same for disable.

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
> +
> +	usleep_range(1, 2);

This is a very low value. Does that 1 µs come from the sensor datasheet?

> +	imx274_reset(imx274, 1);
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
> @@ -1836,6 +1943,14 @@ static int imx274_probe(struct i2c_client *client)
>  
>  	mutex_init(&imx274->lock);
>  
> +	imx274->inck = devm_clk_get_optional(&client->dev, "inck");
> +	ret = imx274_get_regulators(&client->dev, imx274);
> +	if (ret) {
> +		dev_err(&client->dev,
> +			"Failed to get power regulators, err: %d\n", ret);
> +		return ret;
> +	}
> +
>  	/* initialize format */
>  	imx274->mode = &imx274_modes[IMX274_DEFAULT_BINNING];
>  	imx274->crop.width = IMX274_MAX_WIDTH;
> @@ -1883,15 +1998,23 @@ static int imx274_probe(struct i2c_client *client)
>  		goto err_me;
>  	}
>  
> -	/* pull sensor out of reset */
> -	imx274_reset(imx274, 1);
> +	/* keep sensor in reset before power on */
> +	imx274_reset(imx274, 0);
> +
> +	/* power on the sensor */
> +	ret = imx274_power_on(&client->dev);

This driver would really benefit from runtime PM support. I guess you
usually don't want to leave the device powered on when it's not in use?

Please see e.g. the ov8856 driver.

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
> @@ -1958,6 +2081,8 @@ static int imx274_probe(struct i2c_client *client)
>  
>  err_ctrls:
>  	v4l2_ctrl_handler_free(&imx274->ctrls.handler);
> +err_power_off:
> +	imx274_power_off(&client->dev);
>  err_me:
>  	media_entity_cleanup(&sd->entity);
>  err_regmap:
> @@ -1975,6 +2100,7 @@ static int imx274_remove(struct i2c_client *client)
>  
>  	v4l2_async_unregister_subdev(sd);
>  	v4l2_ctrl_handler_free(&imx274->ctrls.handler);
> +	imx274_power_off(&client->dev);
>  	media_entity_cleanup(&sd->entity);
>  	mutex_destroy(&imx274->lock);
>  	return 0;

-- 
Kind regards,

Sakari Ailus
