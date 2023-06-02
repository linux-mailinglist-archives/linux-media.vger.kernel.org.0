Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91F8F72027C
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 14:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234982AbjFBM7v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 08:59:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235760AbjFBM7u (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 08:59:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ABB91A5;
        Fri,  2 Jun 2023 05:59:47 -0700 (PDT)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16FF67FC;
        Fri,  2 Jun 2023 14:59:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685710763;
        bh=tI7wkUtWJRaI5H+3x7g9/+fEQYWpOE2UlMAHSf6BcBM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vjHLmn/4RTKW9yll6hykch4/gPCU3VsqkaiafdJP2GMBYdszWEGYVN3wRksc+ACk7
         ootYeX0kIUN95529XZcq0Yai8Y33H6tCgw7ElrKrjokE5NbsZ59yN+3ZrUW+7nvUiM
         guhfjQAC8WG8O5YnOqQTfzYmIMm2pgUmQXPO4U9k=
Date:   Fri, 2 Jun 2023 14:59:41 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 08/21] media: i2c: imx258: Add support for 24MHz clock
Message-ID: <x4clzqhxlckjgd2ktflzp5chmmhjvz6r6xnmbqdte5wbgjfseg@ua36hcb3nbny>
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
 <20230530173000.3060865-9-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230530173000.3060865-9-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave

On Tue, May 30, 2023 at 06:29:47PM +0100, Dave Stevenson wrote:
> There's no reason why only a clock of 19.2MHz is supported.
> Indeed this isn't even a frequency listed in the datasheet.
>
> Add support for 24MHz as well.
> The PLL settings result in slightly different link frequencies,
> so parameterise those.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx258.c | 137 ++++++++++++++++++++++++++++++-------
>  1 file changed, 111 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index 5a57d0b5fcd8..d40521f9a3c6 100644
> --- a/drivers/media/i2c/imx258.c
> +++ b/drivers/media/i2c/imx258.c
> @@ -76,9 +76,6 @@
>  #define REG_CONFIG_MIRROR_FLIP		0x03
>  #define REG_CONFIG_FLIP_TEST_PATTERN	0x02
>
> -/* Input clock frequency in Hz */
> -#define IMX258_INPUT_CLOCK_FREQ		19200000
> -
>  struct imx258_reg {
>  	u16 address;
>  	u8 val;
> @@ -91,6 +88,7 @@ struct imx258_reg_list {
>
>  /* Link frequency config */
>  struct imx258_link_freq_config {
> +	u64 link_frequency;

Is this used ?

>  	u32 pixels_per_line;

Also this seems to be set a fixed value of IMX258_PPL_DEFAULT

>
>  	/* PLL registers for this link frequency */
> @@ -115,7 +113,9 @@ struct imx258_mode {
>  };
>
>  /* 4208x3120 needs 1267Mbps/lane, 4 lanes */
> -static const struct imx258_reg mipi_data_rate_1267mbps[] = {
> +static const struct imx258_reg mipi_1267mbps_19_2mhz[] = {
> +	{ 0x0136, 0x13 },
> +	{ 0x0137, 0x33 },
>  	{ 0x0301, 0x05 },
>  	{ 0x0303, 0x02 },
>  	{ 0x0305, 0x03 },
> @@ -133,7 +133,29 @@ static const struct imx258_reg mipi_data_rate_1267mbps[] = {
>  	{ 0x0823, 0xCC },
>  };
>
> -static const struct imx258_reg mipi_data_rate_640mbps[] = {
> +static const struct imx258_reg mipi_1272mbps_24mhz[] = {
> +	{ 0x0136, 0x18 },
> +	{ 0x0137, 0x00 },
> +	{ 0x0301, 0x05 },
> +	{ 0x0303, 0x02 },
> +	{ 0x0305, 0x04 },
> +	{ 0x0306, 0x00 },
> +	{ 0x0307, 0xD4 },
> +	{ 0x0309, 0x0A },
> +	{ 0x030B, 0x01 },
> +	{ 0x030D, 0x02 },
> +	{ 0x030E, 0x00 },
> +	{ 0x030F, 0xD8 },
> +	{ 0x0310, 0x00 },
> +	{ 0x0820, 0x13 },
> +	{ 0x0821, 0x4C },
> +	{ 0x0822, 0xCC },
> +	{ 0x0823, 0xCC },
> +};

I'll assume that if this work as intended, the register sequence is
correct (ie: I've not checked the registers configuration)

> +
> +static const struct imx258_reg mipi_640mbps_19_2mhz[] = {
> +	{ 0x0136, 0x13 },
> +	{ 0x0137, 0x33 },
>  	{ 0x0301, 0x05 },
>  	{ 0x0303, 0x02 },
>  	{ 0x0305, 0x03 },
> @@ -151,9 +173,27 @@ static const struct imx258_reg mipi_data_rate_640mbps[] = {
>  	{ 0x0823, 0x00 },
>  };
>
> +static const struct imx258_reg mipi_642mbps_24mhz[] = {
> +	{ 0x0136, 0x18 },
> +	{ 0x0137, 0x00 },
> +	{ 0x0301, 0x05 },
> +	{ 0x0303, 0x02 },
> +	{ 0x0305, 0x04 },
> +	{ 0x0306, 0x00 },
> +	{ 0x0307, 0x6B },
> +	{ 0x0309, 0x0A },
> +	{ 0x030B, 0x01 },
> +	{ 0x030D, 0x02 },
> +	{ 0x030E, 0x00 },
> +	{ 0x030F, 0xD8 },
> +	{ 0x0310, 0x00 },
> +	{ 0x0820, 0x0A },
> +	{ 0x0821, 0x00 },
> +	{ 0x0822, 0x00 },
> +	{ 0x0823, 0x00 },
> +};
> +
>  static const struct imx258_reg mode_common_regs[] = {
> -	{ 0x0136, 0x13 },
> -	{ 0x0137, 0x33 },
>  	{ 0x3051, 0x00 },
>  	{ 0x3052, 0x00 },
>  	{ 0x4E21, 0x14 },
> @@ -313,10 +353,6 @@ static const char * const imx258_supply_name[] = {
>
>  #define IMX258_NUM_SUPPLIES ARRAY_SIZE(imx258_supply_name)
>
> -/* Configurations for supported link frequencies */
> -#define IMX258_LINK_FREQ_634MHZ	633600000ULL
> -#define IMX258_LINK_FREQ_320MHZ	320000000ULL
> -
>  enum {
>  	IMX258_LINK_FREQ_1267MBPS,
>  	IMX258_LINK_FREQ_640MBPS,
> @@ -335,25 +371,55 @@ static u64 link_freq_to_pixel_rate(u64 f)
>  }
>
>  /* Menu items for LINK_FREQ V4L2 control */
> -static const s64 link_freq_menu_items[] = {
> +/* Configurations for supported link frequencies */
> +#define IMX258_LINK_FREQ_634MHZ	633600000ULL
> +#define IMX258_LINK_FREQ_320MHZ	320000000ULL
> +
> +static const s64 link_freq_menu_items_19_2[] = {
>  	IMX258_LINK_FREQ_634MHZ,
>  	IMX258_LINK_FREQ_320MHZ,
>  };
>
> +/* Configurations for supported link frequencies */
> +#define IMX258_LINK_FREQ_636MHZ	636000000ULL
> +#define IMX258_LINK_FREQ_321MHZ	321000000ULL
> +
> +static const s64 link_freq_menu_items_24[] = {
> +	IMX258_LINK_FREQ_636MHZ,
> +	IMX258_LINK_FREQ_321MHZ,
> +};
> +
>  /* Link frequency configs */
> -static const struct imx258_link_freq_config link_freq_configs[] = {
> +static const struct imx258_link_freq_config link_freq_configs_19_2[] = {
> +	[IMX258_LINK_FREQ_1267MBPS] = {
> +		.pixels_per_line = IMX258_PPL_DEFAULT,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(mipi_1267mbps_19_2mhz),
> +			.regs = mipi_1267mbps_19_2mhz,
> +		}
> +	},
> +	[IMX258_LINK_FREQ_640MBPS] = {
> +		.pixels_per_line = IMX258_PPL_DEFAULT,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(mipi_640mbps_19_2mhz),
> +			.regs = mipi_640mbps_19_2mhz,
> +		}
> +	},
> +};
> +
> +static const struct imx258_link_freq_config link_freq_configs_24[] = {
>  	[IMX258_LINK_FREQ_1267MBPS] = {

This doesn't match anymore the actual bus freq, I don't think it's
a real issue, but I wonder if simply indexing with '0' and '1'
wouldn't be less confusing..

>  		.pixels_per_line = IMX258_PPL_DEFAULT,
>  		.reg_list = {
> -			.num_of_regs = ARRAY_SIZE(mipi_data_rate_1267mbps),
> -			.regs = mipi_data_rate_1267mbps,
> +			.num_of_regs = ARRAY_SIZE(mipi_1272mbps_24mhz),
> +			.regs = mipi_1272mbps_24mhz,
>  		}
>  	},
>  	[IMX258_LINK_FREQ_640MBPS] = {
>  		.pixels_per_line = IMX258_PPL_DEFAULT,
>  		.reg_list = {
> -			.num_of_regs = ARRAY_SIZE(mipi_data_rate_640mbps),
> -			.regs = mipi_data_rate_640mbps,
> +			.num_of_regs = ARRAY_SIZE(mipi_642mbps_24mhz),
> +			.regs = mipi_642mbps_24mhz,
>  		}
>  	},
>  };
> @@ -410,6 +476,9 @@ struct imx258 {
>  	/* Current mode */
>  	const struct imx258_mode *cur_mode;
>
> +	const struct imx258_link_freq_config *link_freq_configs;
> +	const s64 *link_freq_menu_items;
> +
>  	/*
>  	 * Mutex for serialized access:
>  	 * Protect sensor module set pad format and start/stop streaming safely.
> @@ -717,7 +786,7 @@ static int imx258_set_pad_format(struct v4l2_subdev *sd,
>  		imx258->cur_mode = mode;
>  		__v4l2_ctrl_s_ctrl(imx258->link_freq, mode->link_freq_index);
>
> -		link_freq = link_freq_menu_items[mode->link_freq_index];
> +		link_freq = imx258->link_freq_menu_items[mode->link_freq_index];
>  		pixel_rate = link_freq_to_pixel_rate(link_freq);
>  		__v4l2_ctrl_s_ctrl_int64(imx258->pixel_rate, pixel_rate);
>  		/* Update limits and set FPS to default */
> @@ -731,7 +800,7 @@ static int imx258_set_pad_format(struct v4l2_subdev *sd,
>  			vblank_def);
>  		__v4l2_ctrl_s_ctrl(imx258->vblank, vblank_def);
>  		h_blank =
> -			link_freq_configs[mode->link_freq_index].pixels_per_line
> +			imx258->link_freq_configs[mode->link_freq_index].pixels_per_line
>  			 - imx258->cur_mode->width;
>  		__v4l2_ctrl_modify_range(imx258->hblank, h_blank,
>  					 h_blank, 1, h_blank);
> @@ -751,7 +820,7 @@ static int imx258_start_streaming(struct imx258 *imx258)
>
>  	/* Setup PLL */
>  	link_freq_index = imx258->cur_mode->link_freq_index;
> -	reg_list = &link_freq_configs[link_freq_index].reg_list;
> +	reg_list = &imx258->link_freq_configs[link_freq_index].reg_list;
>  	ret = imx258_write_regs(imx258, reg_list->regs, reg_list->num_of_regs);
>  	if (ret) {
>  		dev_err(&client->dev, "%s failed to set plls\n", __func__);
> @@ -986,9 +1055,9 @@ static int imx258_init_controls(struct imx258 *imx258)
>  	imx258->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr,
>  				&imx258_ctrl_ops,
>  				V4L2_CID_LINK_FREQ,
> -				ARRAY_SIZE(link_freq_menu_items) - 1,
> +				ARRAY_SIZE(link_freq_menu_items_19_2) - 1,
>  				0,
> -				link_freq_menu_items);
> +				imx258->link_freq_menu_items);
>
>  	if (imx258->link_freq)
>  		imx258->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> @@ -1004,8 +1073,10 @@ static int imx258_init_controls(struct imx258 *imx258)
>  	if (vflip)
>  		vflip->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>
> -	pixel_rate_max = link_freq_to_pixel_rate(link_freq_menu_items[0]);
> -	pixel_rate_min = link_freq_to_pixel_rate(link_freq_menu_items[1]);
> +	pixel_rate_max =
> +		link_freq_to_pixel_rate(imx258->link_freq_menu_items[0]);
> +	pixel_rate_min =
> +		link_freq_to_pixel_rate(imx258->link_freq_menu_items[1]);
>  	/* By default, PIXEL_RATE is read only */
>  	imx258->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &imx258_ctrl_ops,
>  				V4L2_CID_PIXEL_RATE,
> @@ -1123,11 +1194,25 @@ static int imx258_probe(struct i2c_client *client)
>  			"no clock provided, using clock-frequency property\n");
>
>  		device_property_read_u32(&client->dev, "clock-frequency", &val);
> +	} else if (IS_ERR(imx258->clk)) {
> +		return dev_err_probe(&client->dev, PTR_ERR(imx258->clk),
> +				     "error getting clock\n");

Maybe a copy&paste error, as I see the IS_ERR(imx258->clk) condition
being handled just after getting the clock

>  	} else {
>  		val = clk_get_rate(imx258->clk);
>  	}
> -	if (val != IMX258_INPUT_CLOCK_FREQ) {
> -		dev_err(&client->dev, "input clock frequency not supported\n");
> +
> +	switch (val) {
> +	case 19200000:
> +		imx258->link_freq_configs = link_freq_configs_19_2;
> +		imx258->link_freq_menu_items = link_freq_menu_items_19_2;
> +		break;
> +	case 24000000:
> +		imx258->link_freq_configs = link_freq_configs_24;
> +		imx258->link_freq_menu_items = link_freq_menu_items_24;
> +		break;
> +	default:
> +		dev_err(&client->dev, "input clock frequency of %u not supported\n",
> +			val);
>  		return -EINVAL;
>  	}
>
> --
> 2.25.1
>
