Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8715768CC64
	for <lists+linux-media@lfdr.de>; Tue,  7 Feb 2023 03:00:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbjBGCAy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Feb 2023 21:00:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbjBGCAx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Feb 2023 21:00:53 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC2338A4E;
        Mon,  6 Feb 2023 18:00:52 -0800 (PST)
Received: from pendragon.ideasonboard.com (unknown [109.136.43.56])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A5D64AF;
        Tue,  7 Feb 2023 03:00:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675735251;
        bh=yOfR0ToDYtnjKYA7l1bSxvd0Iihgxen6MrEHql2xprY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BH2xQaC4Ui1BNIqxh5OdKp6XkkFgGkO6e1XqzBPWRfr4HQMpqQkQ8C528u3kCZFAO
         SAYhQ/yFQbkTCTzYNEUthB6zNMsFq/Wr7UWHBmONHvJ44842Xhojw/BUkJ1pQFoPaW
         4oBprdqiH+h4sIuSlwvfzShLdRUb8Md0Kkf3yqso=
Date:   Tue, 7 Feb 2023 04:00:49 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: imx290: Add support for imx327 variant
Message-ID: <Y+Gw0fgdSWTJO//C@pendragon.ideasonboard.com>
References: <20230206131731.548795-1-alexander.stein@ew.tq-group.com>
 <20230206131731.548795-3-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230206131731.548795-3-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

Another comment.

On Mon, Feb 06, 2023 at 02:17:31PM +0100, Alexander Stein wrote:
> Both sensors are quite similar. Their specs only differ regarding LVDS
> and parallel output but are identical regarding MIPI-CSI-2 interface.
> But they use a different init setting of hard-coded values, taken from
> the datasheet.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Note: The call to v4l2_i2c_subdev_set_name will change the device name
> shown to userspace. So now 'imx290lqr' will be shown instead of 'imx290'.
> 
>  drivers/media/i2c/imx290.c | 58 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 55 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 1cfdd700bca5..0bfbce8853e6 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -173,10 +173,13 @@ enum imx290_colour_variant {
>  enum imx290_model {
>  	IMX290_MODEL_IMX290LQR,
>  	IMX290_MODEL_IMX290LLR,
> +	IMX290_MODEL_IMX327LQR,
>  };
>  
>  struct imx290_model_info {
>  	enum imx290_colour_variant colour_variant;
> +	enum imx290_model model;
> +	const char *name;
>  };
>  
>  enum imx290_clk_freq {
> @@ -272,10 +275,14 @@ static const struct imx290_regval imx290_global_init_settings[] = {
>  	{ IMX290_WINWV, 1097 },
>  	{ IMX290_XSOUTSEL, IMX290_XSOUTSEL_XVSOUTSEL_VSYNC |
>  			   IMX290_XSOUTSEL_XHSOUTSEL_HSYNC },
> -	{ IMX290_REG_8BIT(0x300f), 0x00 },
> -	{ IMX290_REG_8BIT(0x3010), 0x21 },
> +	{ IMX290_REG_8BIT(0x3011), 0x02 },
>  	{ IMX290_REG_8BIT(0x3012), 0x64 },
>  	{ IMX290_REG_8BIT(0x3013), 0x00 },
> +};
> +
> +static const struct imx290_regval imx290_global_init_settings_290[] = {
> +	{ IMX290_REG_8BIT(0x300f), 0x00 },
> +	{ IMX290_REG_8BIT(0x3010), 0x21 },
>  	{ IMX290_REG_8BIT(0x3016), 0x09 },
>  	{ IMX290_REG_8BIT(0x3070), 0x02 },
>  	{ IMX290_REG_8BIT(0x3071), 0x11 },
> @@ -328,6 +335,12 @@ static const struct imx290_regval xclk_regs[][IMX290_NUM_CLK_REGS] = {
>  	},
>  };
>  
> +static const struct imx290_regval imx290_global_init_settings_327[] = {
> +	{ IMX290_REG_8BIT(0x309e), 0x4A },
> +	{ IMX290_REG_8BIT(0x309f), 0x4A },
> +	{ IMX290_REG_8BIT(0x313b), 0x61 },
> +};

I wonder what the impact of those different init sequences is, as I've
run my IMX327 with this driver without your changes for quite some time
:-)

> +
>  static const struct imx290_regval imx290_1080p_settings[] = {
>  	/* mode settings */
>  	{ IMX290_WINWV_OB, 12 },
> @@ -999,9 +1012,11 @@ static int imx290_start_streaming(struct imx290 *imx290,
>  				  struct v4l2_subdev_state *state)
>  {
>  	const struct v4l2_mbus_framefmt *format;
> +	const struct imx290_regval *regs;
> +	unsigned int reg_num;
>  	int ret;
>  
> -	/* Set init register settings */
> +	/* Set common init register settings */
>  	ret = imx290_set_register_array(imx290, imx290_global_init_settings,
>  					ARRAY_SIZE(imx290_global_init_settings));
>  	if (ret < 0) {
> @@ -1009,6 +1024,28 @@ static int imx290_start_streaming(struct imx290 *imx290,
>  		return ret;
>  	}
>  
> +	switch (imx290->model->model) {
> +	case IMX290_MODEL_IMX290LQR:
> +	case IMX290_MODEL_IMX290LLR:
> +		regs = imx290_global_init_settings_290;
> +		reg_num = ARRAY_SIZE(imx290_global_init_settings_290);
> +		break;
> +	case IMX290_MODEL_IMX327LQR:
> +		regs = imx290_global_init_settings_327;
> +		reg_num = ARRAY_SIZE(imx290_global_init_settings_327);
> +		break;
> +	default:
> +		dev_err(imx290->dev, "Invalid model: %u\n", imx290->model->model);
> +		return -EINVAL;
> +	}
> +
> +	/* Set init register settings */
> +	ret = imx290_set_register_array(imx290, regs, reg_num);
> +	if (ret < 0) {
> +		dev_err(imx290->dev, "Could not set init registers\n");
> +		return ret;
> +	}
> +
>  	/* Set clock parameters based on mode and xclk */
>  	ret = imx290_set_clock(imx290);
>  	if (ret < 0) {
> @@ -1479,9 +1516,18 @@ static s64 imx290_check_link_freqs(const struct imx290 *imx290,
>  static const struct imx290_model_info imx290_models[] = {
>  	[IMX290_MODEL_IMX290LQR] = {
>  		.colour_variant = IMX290_VARIANT_COLOUR,
> +		.model = IMX290_MODEL_IMX290LQR,
> +		.name = "imx290lqr",
>  	},
>  	[IMX290_MODEL_IMX290LLR] = {
>  		.colour_variant = IMX290_VARIANT_MONO,
> +		.model = IMX290_MODEL_IMX290LLR,
> +		.name = "imx290llr",
> +	},
> +	[IMX290_MODEL_IMX327LQR] = {
> +		.colour_variant = IMX290_VARIANT_COLOUR,
> +		.model = IMX290_MODEL_IMX327LQR,
> +		.name = "imx327lqr",
>  	},
>  };
>  
> @@ -1496,6 +1542,9 @@ static const struct of_device_id imx290_of_match[] = {
>  	}, {
>  		.compatible = "sony,imx290llr",
>  		.data = &imx290_models[IMX290_MODEL_IMX290LLR],
> +	}, {
> +		.compatible = "sony,imx327lqr",
> +		.data = &imx290_models[IMX290_MODEL_IMX327LQR],
>  	},
>  	{ /* sentinel */ },
>  };
> @@ -1630,6 +1679,9 @@ static int imx290_probe(struct i2c_client *client)
>  	if (ret)
>  		goto err_pm;
>  
> +	v4l2_i2c_subdev_set_name(&imx290->sd, client,
> +				 imx290->model->name, NULL);
> +
>  	/*
>  	 * Finally, register the V4L2 subdev. This must be done after
>  	 * initializing everything as the subdev can be used immediately after

-- 
Regards,

Laurent Pinchart
