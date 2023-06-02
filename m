Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9087720326
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 15:23:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235775AbjFBNXN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 09:23:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235284AbjFBNXM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 09:23:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7431FE50;
        Fri,  2 Jun 2023 06:23:07 -0700 (PDT)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 39C5327C;
        Fri,  2 Jun 2023 15:22:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685712163;
        bh=XK2XffpZRfvtC3aYGk8DJ/mgAYaqWfSlj01L36yjtX8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r31dilDoc187T4/yWLrlW2hqxRebYSRlbnSewcld0qyxmKuTZZBt7UzJJARs+a5Z4
         Vue3yo0u1uPg11JSEa9Zua6j1qUnGQLETgB2JOgfhvRWXyGi+Oy7w4XiamtEMuO7sR
         wEcbbGeXown6O3TORpIlfgROIz1jZmc9+ekt6dbQ=
Date:   Fri, 2 Jun 2023 15:23:02 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 09/21] media: i2c: imx258: Add support for running on 2
 CSI data lanes
Message-ID: <3gk6ucxfrz3nlqmkhkz2dd4cmb6fkgyumbrajn6hlz7qymqgbd@zasdnnq5djbt>
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
 <20230530173000.3060865-10-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230530173000.3060865-10-dave.stevenson@raspberrypi.com>
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

On Tue, May 30, 2023 at 06:29:48PM +0100, Dave Stevenson wrote:
> Extends the driver to also support 2 data lanes.
> Frame rates are obviously more restricted on 2 lanes, but some
> hardware simply hasn't wired more up.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx258.c | 211 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 187 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index d40521f9a3c6..433dff7f1fa0 100644
> --- a/drivers/media/i2c/imx258.c
> +++ b/drivers/media/i2c/imx258.c
> @@ -86,13 +86,17 @@ struct imx258_reg_list {
>  	const struct imx258_reg *regs;
>  };
>
> +#define IMX258_LANE_CONFIGS	2
> +#define IMX258_2_LANE_MODE	0
> +#define IMX258_4_LANE_MODE	1
> +

nit: This might be better expressed as an enum...

>  /* Link frequency config */
>  struct imx258_link_freq_config {
>  	u64 link_frequency;
>  	u32 pixels_per_line;
>
>  	/* PLL registers for this link frequency */
> -	struct imx258_reg_list reg_list;
> +	struct imx258_reg_list reg_list[IMX258_LANE_CONFIGS];
>  };
>
>  /* Mode : resolution and related config&values */
> @@ -112,8 +116,30 @@ struct imx258_mode {
>  	struct imx258_reg_list reg_list;
>  };
>
> -/* 4208x3120 needs 1267Mbps/lane, 4 lanes */
> -static const struct imx258_reg mipi_1267mbps_19_2mhz[] = {
> +/* 4208x3120 needs 1267Mbps/lane, 4 lanes. Use that rate on 2 lanes as well */

I might be missing how the same link freq (and thus lane bandwidth)
gives the same frame rate on 4 and 2 data lanes setup..

I get a total bandwidth with default VTS and PPL for 10bpp mode at 30
fps of

        vts * ppl * bpp * fps =
        3152 * 5352 * 10 * 30 = 5060851200 bit/sec

The resulting lane bandwidth for 4 lanes is
        1.265.212.800 which ~= 1267 Mbps/lane you have above
and results in a link frequency of
        632606400 which matches your 634MHz/636MHz

With 2 lanes either you double the bandwidth or you halve the frame
rate. Seeing that now link_freq_to_pixel_rate() will give you a *2
result in 4 lanes configuration, I presume full res mode runs at 15FPS
on 2 lanes ? If that's the case, should you remove '30FPS' from the
VTS default value defines ?


> +static const struct imx258_reg mipi_1267mbps_19_2mhz_2l[] = {
> +	{ 0x0136, 0x13 },
> +	{ 0x0137, 0x33 },
> +	{ 0x0301, 0x0A },
> +	{ 0x0303, 0x02 },
> +	{ 0x0305, 0x03 },
> +	{ 0x0306, 0x00 },
> +	{ 0x0307, 0xC6 },
> +	{ 0x0309, 0x0A },
> +	{ 0x030B, 0x01 },
> +	{ 0x030D, 0x02 },
> +	{ 0x030E, 0x00 },
> +	{ 0x030F, 0xD8 },
> +	{ 0x0310, 0x00 },
> +
> +	{ 0x0114, 0x01 },
> +	{ 0x0820, 0x09 },
> +	{ 0x0821, 0xa6 },
> +	{ 0x0822, 0x66 },
> +	{ 0x0823, 0x66 },
> +};
> +
> +static const struct imx258_reg mipi_1267mbps_19_2mhz_4l[] = {
>  	{ 0x0136, 0x13 },
>  	{ 0x0137, 0x33 },
>  	{ 0x0301, 0x05 },
> @@ -127,16 +153,18 @@ static const struct imx258_reg mipi_1267mbps_19_2mhz[] = {
>  	{ 0x030E, 0x00 },
>  	{ 0x030F, 0xD8 },
>  	{ 0x0310, 0x00 },
> +
> +	{ 0x0114, 0x03 },
>  	{ 0x0820, 0x13 },
>  	{ 0x0821, 0x4C },
>  	{ 0x0822, 0xCC },
>  	{ 0x0823, 0xCC },
>  };
>
> -static const struct imx258_reg mipi_1272mbps_24mhz[] = {
> +static const struct imx258_reg mipi_1272mbps_24mhz_2l[] = {
>  	{ 0x0136, 0x18 },
>  	{ 0x0137, 0x00 },
> -	{ 0x0301, 0x05 },
> +	{ 0x0301, 0x0a },
>  	{ 0x0303, 0x02 },
>  	{ 0x0305, 0x04 },
>  	{ 0x0306, 0x00 },
> @@ -147,13 +175,59 @@ static const struct imx258_reg mipi_1272mbps_24mhz[] = {
>  	{ 0x030E, 0x00 },
>  	{ 0x030F, 0xD8 },
>  	{ 0x0310, 0x00 },
> +
> +	{ 0x0114, 0x01 },
>  	{ 0x0820, 0x13 },
>  	{ 0x0821, 0x4C },
>  	{ 0x0822, 0xCC },
>  	{ 0x0823, 0xCC },
>  };
>
> -static const struct imx258_reg mipi_640mbps_19_2mhz[] = {
> +static const struct imx258_reg mipi_1272mbps_24mhz_4l[] = {
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
> +
> +	{ 0x0114, 0x03 },
> +	{ 0x0820, 0x13 },
> +	{ 0x0821, 0xE0 },
> +	{ 0x0822, 0x00 },
> +	{ 0x0823, 0x00 },
> +};
> +
> +static const struct imx258_reg mipi_640mbps_19_2mhz_2l[] = {
> +	{ 0x0136, 0x13 },
> +	{ 0x0137, 0x33 },
> +	{ 0x0301, 0x05 },
> +	{ 0x0303, 0x02 },
> +	{ 0x0305, 0x03 },
> +	{ 0x0306, 0x00 },
> +	{ 0x0307, 0x64 },
> +	{ 0x0309, 0x0A },
> +	{ 0x030B, 0x01 },
> +	{ 0x030D, 0x02 },
> +	{ 0x030E, 0x00 },
> +	{ 0x030F, 0xD8 },
> +	{ 0x0310, 0x00 },
> +
> +	{ 0x0114, 0x01 },
> +	{ 0x0820, 0x05 },
> +	{ 0x0821, 0x00 },
> +	{ 0x0822, 0x00 },
> +	{ 0x0823, 0x00 },
> +};
> +
> +static const struct imx258_reg mipi_640mbps_19_2mhz_4l[] = {
>  	{ 0x0136, 0x13 },
>  	{ 0x0137, 0x33 },
>  	{ 0x0301, 0x05 },
> @@ -167,13 +241,37 @@ static const struct imx258_reg mipi_640mbps_19_2mhz[] = {
>  	{ 0x030E, 0x00 },
>  	{ 0x030F, 0xD8 },
>  	{ 0x0310, 0x00 },
> +
> +	{ 0x0114, 0x03 },
>  	{ 0x0820, 0x0A },
>  	{ 0x0821, 0x00 },
>  	{ 0x0822, 0x00 },
>  	{ 0x0823, 0x00 },
>  };
>
> -static const struct imx258_reg mipi_642mbps_24mhz[] = {
> +static const struct imx258_reg mipi_642mbps_24mhz_2l[] = {
> +	{ 0x0136, 0x18 },
> +	{ 0x0137, 0x00 },
> +	{ 0x0301, 0x0A },
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
> +
> +	{ 0x0114, 0x01 },
> +	{ 0x0820, 0x0A },
> +	{ 0x0821, 0x00 },
> +	{ 0x0822, 0x00 },
> +	{ 0x0823, 0x00 },
> +};
> +
> +static const struct imx258_reg mipi_642mbps_24mhz_4l[] = {
>  	{ 0x0136, 0x18 },
>  	{ 0x0137, 0x00 },
>  	{ 0x0301, 0x05 },
> @@ -187,6 +285,8 @@ static const struct imx258_reg mipi_642mbps_24mhz[] = {
>  	{ 0x030E, 0x00 },
>  	{ 0x030F, 0xD8 },
>  	{ 0x0310, 0x00 },
> +
> +	{ 0x0114, 0x03 },
>  	{ 0x0820, 0x0A },
>  	{ 0x0821, 0x00 },
>  	{ 0x0822, 0x00 },
> @@ -241,7 +341,6 @@ static const struct imx258_reg mode_common_regs[] = {
>  	{ 0x5F05, 0xED },
>  	{ 0x0112, 0x0A },
>  	{ 0x0113, 0x0A },
> -	{ 0x0114, 0x03 },
>  	{ 0x0342, 0x14 },
>  	{ 0x0343, 0xE8 },
>  	{ 0x0344, 0x00 },
> @@ -360,11 +459,13 @@ enum {
>
>  /*
>   * pixel_rate = link_freq * data-rate * nr_of_lanes / bits_per_sample
> - * data rate => double data rate; number of lanes => 4; bits per pixel => 10
> + * data rate => double data rate;
> + * number of lanes => (configurable 2 or 4);
> + * bits per pixel => 10
>   */
> -static u64 link_freq_to_pixel_rate(u64 f)
> +static u64 link_freq_to_pixel_rate(u64 f, unsigned int nlanes)
>  {
> -	f *= 2 * 4;
> +	f *= 2 * nlanes;
>  	do_div(f, 10);
>
>  	return f;
> @@ -394,15 +495,27 @@ static const struct imx258_link_freq_config link_freq_configs_19_2[] = {
>  	[IMX258_LINK_FREQ_1267MBPS] = {
>  		.pixels_per_line = IMX258_PPL_DEFAULT,
>  		.reg_list = {
> -			.num_of_regs = ARRAY_SIZE(mipi_1267mbps_19_2mhz),
> -			.regs = mipi_1267mbps_19_2mhz,
> +			[IMX258_2_LANE_MODE] = {
> +				.num_of_regs = ARRAY_SIZE(mipi_1267mbps_19_2mhz_2l),
> +				.regs = mipi_1267mbps_19_2mhz_2l,
> +			},
> +			[IMX258_4_LANE_MODE] = {
> +				.num_of_regs = ARRAY_SIZE(mipi_1267mbps_19_2mhz_4l),
> +				.regs = mipi_1267mbps_19_2mhz_4l,
> +			},
>  		}
>  	},
>  	[IMX258_LINK_FREQ_640MBPS] = {
>  		.pixels_per_line = IMX258_PPL_DEFAULT,
>  		.reg_list = {
> -			.num_of_regs = ARRAY_SIZE(mipi_640mbps_19_2mhz),
> -			.regs = mipi_640mbps_19_2mhz,
> +			[IMX258_2_LANE_MODE] = {
> +				.num_of_regs = ARRAY_SIZE(mipi_640mbps_19_2mhz_2l),
> +				.regs = mipi_640mbps_19_2mhz_2l,
> +			},
> +			[IMX258_4_LANE_MODE] = {
> +				.num_of_regs = ARRAY_SIZE(mipi_640mbps_19_2mhz_4l),
> +				.regs = mipi_640mbps_19_2mhz_4l,
> +			},
>  		}
>  	},
>  };
> @@ -411,15 +524,27 @@ static const struct imx258_link_freq_config link_freq_configs_24[] = {
>  	[IMX258_LINK_FREQ_1267MBPS] = {
>  		.pixels_per_line = IMX258_PPL_DEFAULT,
>  		.reg_list = {
> -			.num_of_regs = ARRAY_SIZE(mipi_1272mbps_24mhz),
> -			.regs = mipi_1272mbps_24mhz,
> +			[IMX258_2_LANE_MODE] = {
> +				.num_of_regs = ARRAY_SIZE(mipi_1272mbps_24mhz_2l),
> +				.regs = mipi_1272mbps_24mhz_2l,
> +			},
> +			[IMX258_4_LANE_MODE] = {
> +				.num_of_regs = ARRAY_SIZE(mipi_1272mbps_24mhz_4l),
> +				.regs = mipi_1272mbps_24mhz_4l,
> +			},
>  		}
>  	},
>  	[IMX258_LINK_FREQ_640MBPS] = {
>  		.pixels_per_line = IMX258_PPL_DEFAULT,
>  		.reg_list = {
> -			.num_of_regs = ARRAY_SIZE(mipi_642mbps_24mhz),
> -			.regs = mipi_642mbps_24mhz,
> +			[IMX258_2_LANE_MODE] = {
> +				.num_of_regs = ARRAY_SIZE(mipi_642mbps_24mhz_2l),
> +				.regs = mipi_642mbps_24mhz_2l,
> +			},
> +			[IMX258_4_LANE_MODE] = {
> +				.num_of_regs = ARRAY_SIZE(mipi_642mbps_24mhz_4l),
> +				.regs = mipi_642mbps_24mhz_4l,
> +			},
>  		}
>  	},
>  };
> @@ -478,6 +603,7 @@ struct imx258 {
>
>  	const struct imx258_link_freq_config *link_freq_configs;
>  	const s64 *link_freq_menu_items;
> +	unsigned int nlanes;
>
>  	/*
>  	 * Mutex for serialized access:
> @@ -787,7 +913,7 @@ static int imx258_set_pad_format(struct v4l2_subdev *sd,
>  		__v4l2_ctrl_s_ctrl(imx258->link_freq, mode->link_freq_index);
>
>  		link_freq = imx258->link_freq_menu_items[mode->link_freq_index];
> -		pixel_rate = link_freq_to_pixel_rate(link_freq);
> +		pixel_rate = link_freq_to_pixel_rate(link_freq, imx258->nlanes);
>  		__v4l2_ctrl_s_ctrl_int64(imx258->pixel_rate, pixel_rate);
>  		/* Update limits and set FPS to default */
>  		vblank_def = imx258->cur_mode->vts_def -
> @@ -816,11 +942,13 @@ static int imx258_start_streaming(struct imx258 *imx258)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(&imx258->sd);
>  	const struct imx258_reg_list *reg_list;
> +	const struct imx258_link_freq_config *link_freq_cfg;
>  	int ret, link_freq_index;
>
>  	/* Setup PLL */
>  	link_freq_index = imx258->cur_mode->link_freq_index;
> -	reg_list = &imx258->link_freq_configs[link_freq_index].reg_list;
> +	link_freq_cfg = &imx258->link_freq_configs[link_freq_index];
> +	reg_list = &link_freq_cfg->reg_list[imx258->nlanes == 2 ? 0 : 1];
>  	ret = imx258_write_regs(imx258, reg_list->regs, reg_list->num_of_regs);
>  	if (ret) {
>  		dev_err(&client->dev, "%s failed to set plls\n", __func__);
> @@ -1074,9 +1202,11 @@ static int imx258_init_controls(struct imx258 *imx258)
>  		vflip->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>
>  	pixel_rate_max =
> -		link_freq_to_pixel_rate(imx258->link_freq_menu_items[0]);
> +		link_freq_to_pixel_rate(imx258->link_freq_menu_items[0],
> +					imx258->nlanes);
>  	pixel_rate_min =
> -		link_freq_to_pixel_rate(imx258->link_freq_menu_items[1]);
> +		link_freq_to_pixel_rate(imx258->link_freq_menu_items[1],
> +					imx258->nlanes);
>  	/* By default, PIXEL_RATE is read only */
>  	imx258->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &imx258_ctrl_ops,
>  				V4L2_CID_PIXEL_RATE,
> @@ -1174,6 +1304,10 @@ static int imx258_get_regulators(struct imx258 *imx258,
>  static int imx258_probe(struct i2c_client *client)
>  {
>  	struct imx258 *imx258;
> +	struct fwnode_handle *endpoint;
> +	struct v4l2_fwnode_endpoint ep = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY
> +	};
>  	int ret;
>  	u32 val = 0;
>
> @@ -1216,13 +1350,38 @@ static int imx258_probe(struct i2c_client *client)
>  		return -EINVAL;
>  	}
>
> +	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev), NULL);
> +	if (!endpoint) {
> +		dev_err(&client->dev, "Endpoint node not found\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep);
> +	fwnode_handle_put(endpoint);
> +	if (ret == -ENXIO) {

Doesn't the core warns you already ? Anywy, doesn't hurt I suppose

> +		dev_err(&client->dev, "Unsupported bus type, should be CSI2\n");
> +		goto error_endpoint_poweron;
> +	} else if (ret) {
> +		dev_err(&client->dev, "Parsing endpoint node failed\n");
> +		goto error_endpoint_poweron;

It's a pretty peculiar name :) Why not 'error_endpoint_free' ?

Anyway, if parsing fails, I don't think you need to v4l2_fwnode_endpoint_free()
as the core should take care of doing so.

> +	}
> +
> +	/* Get number of data lanes */
> +	imx258->nlanes = ep.bus.mipi_csi2.num_data_lanes;
> +	if (imx258->nlanes != 2 && imx258->nlanes != 4) {
> +		dev_err(&client->dev, "Invalid data lanes: %u\n",
> +			imx258->nlanes);
> +		ret = -EINVAL;
> +		goto error_endpoint_poweron;
> +	}
> +
>  	/* Initialize subdev */
>  	v4l2_i2c_subdev_init(&imx258->sd, client, &imx258_subdev_ops);
>
>  	/* Will be powered off via pm_runtime_idle */
>  	ret = imx258_power_on(&client->dev);
>  	if (ret)
> -		return ret;
> +		goto error_endpoint_poweron;
>
>  	/* Check module identity */
>  	ret = imx258_identify_module(imx258);
> @@ -1255,6 +1414,7 @@ static int imx258_probe(struct i2c_client *client)
>  	pm_runtime_set_active(&client->dev);
>  	pm_runtime_enable(&client->dev);
>  	pm_runtime_idle(&client->dev);
> +	v4l2_fwnode_endpoint_free(&endpoint);

Do you need to free in _remove() too ?

>
>  	return 0;
>
> @@ -1267,6 +1427,9 @@ static int imx258_probe(struct i2c_client *client)
>  error_identify:
>  	imx258_power_off(&client->dev);
>
> +error_endpoint_poweron:
> +	v4l2_fwnode_endpoint_free(&ep);
> +
>  	return ret;
>  }
>
> --
> 2.25.1
>
