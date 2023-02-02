Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 148F9688983
	for <lists+linux-media@lfdr.de>; Thu,  2 Feb 2023 23:04:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233007AbjBBWEF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Feb 2023 17:04:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232530AbjBBWDu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Feb 2023 17:03:50 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5DEEEC77
        for <linux-media@vger.kernel.org>; Thu,  2 Feb 2023 14:03:27 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 15663505;
        Thu,  2 Feb 2023 23:03:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675375405;
        bh=4AjA/W08hy3c7EGG2Z6zyPRKjQa/Wq4Xp2MtWzobxpc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rkMR0GlBGJ9lJHFAyD9CzVrU2F+nxicLPtLTmjwp0DtPqOhV7EGRXTl8i9A2PvhIP
         lLYi607Oql0R6KG+K1eYwO8I70yMm3DVkSy7Os0BJohnkmZYllN5bGiA9Zx5erfAhz
         YmKuvwmGgmwBoLar5hkEIwaYYeWWjIQNN1W3xJxk=
Date:   Fri, 3 Feb 2023 00:03:23 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 10/11] media: i2c: imx290: Add support for 74.25MHz
 external clock
Message-ID: <Y9wzK0X3witiumpu@pendragon.ideasonboard.com>
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
 <20230131192016.3476937-11-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230131192016.3476937-11-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

Thank you for the patch.

On Tue, Jan 31, 2023 at 07:20:15PM +0000, Dave Stevenson wrote:
> The sensor supports either a 37.125 or 74.25MHz external, but
> the driver only supported 37.125MHz.
> 
> Add the relevant register configuration for either clock
> frequency option.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx290.c | 120 +++++++++++++++++++++++++++++++------
>  1 file changed, 103 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 5202ef3cc3e6..7f6746f74040 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -102,6 +102,7 @@
>  #define IMX290_TCLKPREPARE				IMX290_REG_16BIT(0x3452)
>  #define IMX290_TLPX					IMX290_REG_16BIT(0x3454)
>  #define IMX290_X_OUT_SIZE				IMX290_REG_16BIT(0x3472)
> +#define IMX290_INCKSEL7					IMX290_REG_8BIT(0x3480)
>  
>  #define IMX290_PGCTRL_REGEN				BIT(0)
>  #define IMX290_PGCTRL_THRU				BIT(1)
> @@ -159,11 +160,27 @@
>  
>  #define IMX290_NUM_SUPPLIES				3
>  
> +#define CLK_37_125	0
> +#define CLK_74_25	1
> +#define NUM_CLK		2

Please add an IMX290 prefer to avoid future namespace clashes.

> +
>  struct imx290_regval {
>  	u32 reg;
>  	u32 val;
>  };
>  
> +/*
> + * Clock configuration for registers INCKSEL1 to INCKSEL6.
> + */
> +struct imx290_clk_cfg {
> +	u8 incksel1;
> +	u8 incksel2;
> +	u8 incksel3;
> +	u8 incksel4;
> +	u8 incksel5;
> +	u8 incksel6;
> +};
> +
>  struct imx290_mode {
>  	u32 width;
>  	u32 height;
> @@ -173,6 +190,8 @@ struct imx290_mode {
>  
>  	const struct imx290_regval *data;
>  	u32 data_size;
> +
> +	const struct imx290_clk_cfg *clk_cfg;
>  };
>  
>  struct imx290_csi_cfg {
> @@ -191,6 +210,7 @@ struct imx290 {
>  	struct device *dev;
>  	struct clk *xclk;
>  	struct regmap *regmap;
> +	u32 xclk_freq;
>  	u8 nlanes;
>  	u8 mono;
>  
> @@ -219,7 +239,6 @@ static inline struct imx290 *to_imx290(struct v4l2_subdev *_sd)
>   */
>  
>  static const struct imx290_regval imx290_global_init_settings[] = {
> -	{ IMX290_EXTCK_FREQ, 0x2520 },
>  	{ IMX290_WINWV_OB, 12 },
>  	{ IMX290_WINPH, 0 },
>  	{ IMX290_WINPV, 0 },
> @@ -269,7 +288,16 @@ static const struct imx290_regval imx290_global_init_settings[] = {
>  	{ IMX290_REG_8BIT(0x33b0), 0x50 },
>  	{ IMX290_REG_8BIT(0x33b2), 0x1a },
>  	{ IMX290_REG_8BIT(0x33b3), 0x04 },
> -	{ IMX290_REG_8BIT(0x3480), 0x49 },

One less unnamed register, only 42 to go :-D

> +};
> +
> +static const struct imx290_regval imx290_37_125mhz_clock[] = {
> +	{ IMX290_EXTCK_FREQ, 0x2520 },
> +	{ IMX290_INCKSEL7, 0x49 },
> +};
> +
> +static const struct imx290_regval imx290_74_25mhz_clock[] = {
> +	{ IMX290_EXTCK_FREQ, 0x4a40 },
> +	{ IMX290_INCKSEL7, 0x92 },
>  };

Those two arrays are not used, which I assume is not normal :-) A rebase
problem maybe ?

How about moving the INCKSEL7 value to the imx290_clk_cfg structure for
consistency ?

>  
>  static const struct imx290_regval imx290_1080p_settings[] = {
> @@ -279,12 +307,6 @@ static const struct imx290_regval imx290_1080p_settings[] = {
>  	{ IMX290_OPB_SIZE_V, 10 },
>  	{ IMX290_X_OUT_SIZE, 1920 },
>  	{ IMX290_Y_OUT_SIZE, 1080 },
> -	{ IMX290_INCKSEL1, 0x18 },
> -	{ IMX290_INCKSEL2, 0x03 },
> -	{ IMX290_INCKSEL3, 0x20 },
> -	{ IMX290_INCKSEL4, 0x01 },
> -	{ IMX290_INCKSEL5, 0x1a },
> -	{ IMX290_INCKSEL6, 0x1a },
>  };
>  
>  static const struct imx290_regval imx290_720p_settings[] = {
> @@ -294,12 +316,6 @@ static const struct imx290_regval imx290_720p_settings[] = {
>  	{ IMX290_OPB_SIZE_V, 4 },
>  	{ IMX290_X_OUT_SIZE, 1280 },
>  	{ IMX290_Y_OUT_SIZE, 720 },
> -	{ IMX290_INCKSEL1, 0x20 },
> -	{ IMX290_INCKSEL2, 0x00 },
> -	{ IMX290_INCKSEL3, 0x20 },
> -	{ IMX290_INCKSEL4, 0x01 },
> -	{ IMX290_INCKSEL5, 0x1a },
> -	{ IMX290_INCKSEL6, 0x1a },
>  };
>  
>  static const struct imx290_regval imx290_10bit_settings[] = {
> @@ -405,6 +421,48 @@ static inline int imx290_link_freqs_num(const struct imx290 *imx290)
>  		return ARRAY_SIZE(imx290_link_freq_4lanes);
>  }
>  
> +static const struct imx290_clk_cfg imx290_1080p_clock_config[NUM_CLK] = {
> +	[CLK_37_125] = {
> +		/* 37.125MHz clock config */
> +		.incksel1 = 0x18,
> +		.incksel2 = 0x03,
> +		.incksel3 = 0x20,
> +		.incksel4 = 0x01,
> +		.incksel5 = 0x1a,
> +		.incksel6 = 0x1a,
> +	},

As the incksel[0-6] fields are only used in one place, to write all 6 of
them to the device, you could also drop the imx290_clk_cfg structure and
turn this into a imx290_regval array. Entirely up to you.

> +	[CLK_74_25] = {
> +		/* 74.25MHz clock config */
> +		.incksel1 = 0x0c,
> +		.incksel2 = 0x03,
> +		.incksel3 = 0x10,
> +		.incksel4 = 0x01,
> +		.incksel5 = 0x1b,
> +		.incksel6 = 0x1b,
> +	},
> +};
> +
> +static const struct imx290_clk_cfg imx290_720p_clock_config[NUM_CLK] = {
> +	[CLK_37_125] = {
> +		/* 37.125MHz clock config */
> +		.incksel1 = 0x20,
> +		.incksel2 = 0x00,
> +		.incksel3 = 0x20,
> +		.incksel4 = 0x01,
> +		.incksel5 = 0x1a,
> +		.incksel6 = 0x1a,
> +	},
> +	[CLK_74_25] = {
> +		/* 74.25MHz clock config */
> +		.incksel1 = 0x10,
> +		.incksel2 = 0x00,
> +		.incksel3 = 0x10,
> +		.incksel4 = 0x01,
> +		.incksel5 = 0x1b,
> +		.incksel6 = 0x1b,
> +	},
> +};
> +
>  /* Mode configs */
>  static const struct imx290_mode imx290_modes_2lanes[] = {
>  	{
> @@ -415,6 +473,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
>  		.link_freq_index = FREQ_INDEX_1080P,
>  		.data = imx290_1080p_settings,
>  		.data_size = ARRAY_SIZE(imx290_1080p_settings),
> +		.clk_cfg = imx290_1080p_clock_config,
>  	},
>  	{
>  		.width = 1280,
> @@ -424,6 +483,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
>  		.link_freq_index = FREQ_INDEX_720P,
>  		.data = imx290_720p_settings,
>  		.data_size = ARRAY_SIZE(imx290_720p_settings),
> +		.clk_cfg = imx290_720p_clock_config,
>  	},
>  };
>  
> @@ -436,6 +496,7 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
>  		.link_freq_index = FREQ_INDEX_1080P,
>  		.data = imx290_1080p_settings,
>  		.data_size = ARRAY_SIZE(imx290_1080p_settings),
> +		.clk_cfg = imx290_1080p_clock_config,
>  	},
>  	{
>  		.width = 1280,
> @@ -445,6 +506,7 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
>  		.link_freq_index = FREQ_INDEX_720P,
>  		.data = imx290_720p_settings,
>  		.data_size = ARRAY_SIZE(imx290_720p_settings),
> +		.clk_cfg = imx290_720p_clock_config,
>  	},
>  };
>  
> @@ -563,6 +625,23 @@ static int imx290_set_register_array(struct imx290 *imx290,
>  	return 0;
>  }
>  
> +static int imx290_set_clock(struct imx290 *imx290)
> +{
> +	int clk_idx = (imx290->xclk_freq == 37125000) ? 0 : 1;
> +	const struct imx290_mode *mode = imx290->current_mode;
> +	const struct imx290_clk_cfg *clk_cfg = &mode->clk_cfg[clk_idx];
> +	int ret = 0;

How about turning the clock freq macros into an enum:

enum imx290_clk_freq {
	IMX290_CLK_37_125 = 0,
	IMX290_CLK_74_25 = 1,
};

and replacing in struct imx290

-	u32 xclk_freq;
+	enum imx290_clk_freq xclk_freq;

? Then you could could simply write

	const struct imx290_clk_cfg *clk_cfg = &mode->clk_cfg[imx290->xclk_freq];

(you could also name the field xclk_freq_idx if desired). Up to you, if
you find that messier you can ignore the comment.

> +
> +	imx290_write(imx290, IMX290_INCKSEL1, clk_cfg->incksel1, &ret);
> +	imx290_write(imx290, IMX290_INCKSEL2, clk_cfg->incksel2, &ret);
> +	imx290_write(imx290, IMX290_INCKSEL3, clk_cfg->incksel3, &ret);
> +	imx290_write(imx290, IMX290_INCKSEL4, clk_cfg->incksel4, &ret);
> +	imx290_write(imx290, IMX290_INCKSEL5, clk_cfg->incksel5, &ret);
> +	imx290_write(imx290, IMX290_INCKSEL6, clk_cfg->incksel6, &ret);
> +
> +	return ret;
> +}
> +
>  static int imx290_set_data_lanes(struct imx290 *imx290)
>  {
>  	int ret = 0;
> @@ -863,6 +942,13 @@ static int imx290_start_streaming(struct imx290 *imx290,
>  		return ret;
>  	}
>  
> +	/* Set clock parameters based on mode and xclk */
> +	ret = imx290_set_clock(imx290);
> +	if (ret < 0) {
> +		dev_err(imx290->dev, "Could not set clocks\n");
> +		return ret;
> +	}
> +
>  	/* Set data lane count */
>  	ret = imx290_set_data_lanes(imx290);
>  	if (ret < 0) {
> @@ -1259,14 +1345,14 @@ static int imx290_init_clk(struct imx290 *imx290)
>  	int ret;
>  
>  	ret = fwnode_property_read_u32(dev_fwnode(imx290->dev),
> -				       "clock-frequency", &xclk_freq);
> +				       "clock-frequency", &imx290->xclk_freq);
>  	if (ret) {
>  		dev_err(imx290->dev, "Could not get xclk frequency\n");
>  		return ret;
>  	}
>  
> -	/* external clock must be 37.125 MHz */
> -	if (xclk_freq != 37125000) {
> +	/* external clock must be 37.125 MHz or 74.25MHz */
> +	if (imx290->xclk_freq != 37125000 && imx290->xclk_freq != 74250000) {
>  		dev_err(imx290->dev, "External clock frequency %u is not supported\n",
>  			xclk_freq);
>  		return -EINVAL;

-- 
Regards,

Laurent Pinchart
