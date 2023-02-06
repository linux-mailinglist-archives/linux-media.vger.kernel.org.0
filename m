Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C399C68B740
	for <lists+linux-media@lfdr.de>; Mon,  6 Feb 2023 09:24:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbjBFIYn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Feb 2023 03:24:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbjBFIYl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Feb 2023 03:24:41 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7090ACA30
        for <linux-media@vger.kernel.org>; Mon,  6 Feb 2023 00:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675671861; x=1707207861;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PKlx2BhNv8w64UyH6fvY0UFjHS75bWqiCIcNQ3xvV3E=;
  b=EDSb4TLa9QUnuk1wNiJ+2JWs8hgLzKw/H2quaZXYuiror3MBQDOGGh9C
   ySMMhPCSjldcY8ixcVL/BOk6IuaFCRgYJfAAbFSQZmrOaWMb0HmecBp+X
   NQZfL8lZrMBXc0XsHHs/nr9Umr3MAbEmYcl/j1MvV3D4pgJ+lCHdRTP9u
   ssrH+n9bE+P5VcMaRuk/tq8ebAnEHpYbxXjI9ifliqMfVzI3CJuGcGv3H
   Hx4Hp1px8SJH2zXvPithMoY2cbiyB0M+CPdCktzonWNu+rwl4skNLjfWz
   PEO1TjfmCjlSW/B++vVuzRbUXRvvN5SLX7zv5N24hZyP14gvzCqcCmZeZ
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,276,1669071600"; 
   d="scan'208";a="28881020"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 06 Feb 2023 09:24:19 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 06 Feb 2023 09:24:19 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 06 Feb 2023 09:24:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675671859; x=1707207859;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PKlx2BhNv8w64UyH6fvY0UFjHS75bWqiCIcNQ3xvV3E=;
  b=Nk8QnqRRd+1l6iApfl4x5M9bpuGMq6iUHCHu8FeJ4Ouw7EJkYKblzEx7
   pHmPMDM7+5M3yWfKlnn7Ui84JvEw3CtnV6g5w/iEWFTJU2Y2B3sn2hZ3w
   58o1DM8Ypble+YFjEjv0Y+TSUeyvJT1XA8ch3FgKSX7njUy5s5iPENTwo
   +3q2oWswWe5zIAjSodlSUGV/5PbWuZFtq6bmPpdAf5qyVkskzN0stOqQ9
   R5eJbIP6VbFhWU7A071W13g88J/2VCf1KmiwsABeCwMK4Le7HYabdVZra
   htiFDkekYwv2UwtOqrPWszuDexsNErZxSCAsYaWuCxfatKdqyFq6oeTWi
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,276,1669071600"; 
   d="scan'208";a="28881019"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 06 Feb 2023 09:24:19 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6876B280056;
        Mon,  6 Feb 2023 09:24:19 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 11/13] media: i2c: imx290: Add support for 74.25MHz external clock
Date:   Mon, 06 Feb 2023 09:24:17 +0100
Message-ID: <4462384.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230203191811.947697-12-dave.stevenson@raspberrypi.com>
References: <20230203191811.947697-1-dave.stevenson@raspberrypi.com> <20230203191811.947697-12-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

thanks for the update.

Am Freitag, 3. Februar 2023, 20:18:09 CET schrieb Dave Stevenson:
> The sensor supports either a 37.125 or 74.25MHz external, but
> the driver only supported 37.125MHz.
> 
> Add the relevant register configuration for either clock
> frequency option.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  drivers/media/i2c/imx290.c | 132 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 116 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index a74930e86a6c..045d27b4d31b 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -102,6 +102,7 @@
>  #define IMX290_TCLKPREPARE				
IMX290_REG_16BIT(0x3452)
>  #define IMX290_TLPX					
IMX290_REG_16BIT(0x3454)
>  #define IMX290_X_OUT_SIZE				
IMX290_REG_16BIT(0x3472)
> +#define IMX290_INCKSEL7					
IMX290_REG_8BIT(0x3480)
> 
>  #define IMX290_PGCTRL_REGEN				BIT(0)
>  #define IMX290_PGCTRL_THRU				BIT(1)
> @@ -178,11 +179,29 @@ struct imx290_model_info {
>  	enum imx290_colour_variant colour_variant;
>  };
> 
> +enum imx290_clk_freq {
> +	IMX290_CLK_37_125,
> +	IMX290_CLK_74_25,
> +	IMX290_NUM_CLK
> +};
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
> @@ -192,6 +211,8 @@ struct imx290_mode {
> 
>  	const struct imx290_regval *data;
>  	u32 data_size;
> +
> +	const struct imx290_clk_cfg *clk_cfg;
>  };
> 
>  struct imx290_csi_cfg {
> @@ -210,6 +231,7 @@ struct imx290 {
>  	struct device *dev;
>  	struct clk *xclk;
>  	struct regmap *regmap;
> +	enum imx290_clk_freq xclk_idx;
>  	u8 nlanes;
>  	const struct imx290_model_info *model;
> 
> @@ -238,7 +260,6 @@ static inline struct imx290 *to_imx290(struct
> v4l2_subdev *_sd) */
> 
>  static const struct imx290_regval imx290_global_init_settings[] = {
> -	{ IMX290_EXTCK_FREQ, 0x2520 },
>  	{ IMX290_WINWV_OB, 12 },
>  	{ IMX290_WINPH, 0 },
>  	{ IMX290_WINPV, 0 },
> @@ -288,7 +309,18 @@ static const struct imx290_regval
> imx290_global_init_settings[] = { { IMX290_REG_8BIT(0x33b0), 0x50 },
>  	{ IMX290_REG_8BIT(0x33b2), 0x1a },
>  	{ IMX290_REG_8BIT(0x33b3), 0x04 },
> -	{ IMX290_REG_8BIT(0x3480), 0x49 },
> +};
> +
> +#define IMX290_NUM_CLK_REGS	2
> +static const struct imx290_regval xclk_regs[][IMX290_NUM_CLK_REGS] = {
> +	[IMX290_CLK_37_125] = {
> +		{ IMX290_EXTCK_FREQ, (37125 * 256) / 1000 },
> +		{ IMX290_INCKSEL7, 0x49 },
> +	},
> +	[IMX290_CLK_74_25] = {
> +		{ IMX290_EXTCK_FREQ, (74250 * 256) / 1000 },
> +		{ IMX290_INCKSEL7, 0x92 },
> +	},
>  };
> 
>  static const struct imx290_regval imx290_1080p_settings[] = {
> @@ -298,12 +330,6 @@ static const struct imx290_regval
> imx290_1080p_settings[] = { { IMX290_OPB_SIZE_V, 10 },
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
> @@ -313,12 +339,6 @@ static const struct imx290_regval
> imx290_720p_settings[] = { { IMX290_OPB_SIZE_V, 4 },
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
> @@ -424,6 +444,48 @@ static inline int imx290_link_freqs_num(const struct
> imx290 *imx290) return ARRAY_SIZE(imx290_link_freq_4lanes);
>  }
> 
> +static const struct imx290_clk_cfg imx290_1080p_clock_config[] = {
> +	[IMX290_CLK_37_125] = {
> +		/* 37.125MHz clock config */
> +		.incksel1 = 0x18,
> +		.incksel2 = 0x03,
> +		.incksel3 = 0x20,
> +		.incksel4 = 0x01,
> +		.incksel5 = 0x1a,
> +		.incksel6 = 0x1a,
> +	},
> +	[IMX290_CLK_74_25] = {
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
> +static const struct imx290_clk_cfg imx290_720p_clock_config[] = {
> +	[IMX290_CLK_37_125] = {
> +		/* 37.125MHz clock config */
> +		.incksel1 = 0x20,
> +		.incksel2 = 0x00,
> +		.incksel3 = 0x20,
> +		.incksel4 = 0x01,
> +		.incksel5 = 0x1a,
> +		.incksel6 = 0x1a,
> +	},
> +	[IMX290_CLK_74_25] = {
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
> @@ -434,6 +496,7 @@ static const struct imx290_mode imx290_modes_2lanes[] =
> { .link_freq_index = FREQ_INDEX_1080P,
>  		.data = imx290_1080p_settings,
>  		.data_size = ARRAY_SIZE(imx290_1080p_settings),
> +		.clk_cfg = imx290_1080p_clock_config,
>  	},
>  	{
>  		.width = 1280,
> @@ -443,6 +506,7 @@ static const struct imx290_mode imx290_modes_2lanes[] =
> { .link_freq_index = FREQ_INDEX_720P,
>  		.data = imx290_720p_settings,
>  		.data_size = ARRAY_SIZE(imx290_720p_settings),
> +		.clk_cfg = imx290_720p_clock_config,
>  	},
>  };
> 
> @@ -455,6 +519,7 @@ static const struct imx290_mode imx290_modes_4lanes[] =
> { .link_freq_index = FREQ_INDEX_1080P,
>  		.data = imx290_1080p_settings,
>  		.data_size = ARRAY_SIZE(imx290_1080p_settings),
> +		.clk_cfg = imx290_1080p_clock_config,
>  	},
>  	{
>  		.width = 1280,
> @@ -464,6 +529,7 @@ static const struct imx290_mode imx290_modes_4lanes[] =
> { .link_freq_index = FREQ_INDEX_720P,
>  		.data = imx290_720p_settings,
>  		.data_size = ARRAY_SIZE(imx290_720p_settings),
> +		.clk_cfg = imx290_720p_clock_config,
>  	},
>  };
> 
> @@ -587,6 +653,26 @@ static int imx290_set_register_array(struct imx290
> *imx290, return 0;
>  }
> 
> +static int imx290_set_clock(struct imx290 *imx290)
> +{
> +	const struct imx290_mode *mode = imx290->current_mode;
> +	enum imx290_clk_freq clk_idx = imx290->xclk_idx;
> +	const struct imx290_clk_cfg *clk_cfg = &mode->clk_cfg[clk_idx];
> +	int ret;
> +
> +	ret = imx290_set_register_array(imx290, xclk_regs[clk_idx],
> +					IMX290_NUM_CLK_REGS);
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
> @@ -891,6 +977,13 @@ static int imx290_start_streaming(struct imx290
> *imx290, return ret;
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
> @@ -1290,8 +1383,15 @@ static int imx290_init_clk(struct imx290 *imx290)
>  		return ret;
>  	}
> 
> -	/* external clock must be 37.125 MHz */
> -	if (xclk_freq != 37125000) {
> +	/* external clock must be 37.125 MHz or 74.25MHz */
> +	switch (xclk_freq) {
> +	case 37125000:
> +		imx290->xclk_idx = IMX290_CLK_37_125;
> +		break;
> +	case 74250000:
> +		imx290->xclk_idx = IMX290_CLK_74_25;
> +		break;
> +	default:
>  		dev_err(imx290->dev, "External clock frequency %u is not 
supported\n",
>  			xclk_freq);
>  		return -EINVAL;




