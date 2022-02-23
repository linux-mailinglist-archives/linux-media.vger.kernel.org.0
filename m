Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0697B4C12A3
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 13:20:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240420AbiBWMVG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 07:21:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236381AbiBWMVG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 07:21:06 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A5659F6E0
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 04:20:37 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A474BDD;
        Wed, 23 Feb 2022 13:20:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645618835;
        bh=tnwx4lTC0mDnVA0lu1Akuf2nVU1RsCy0abGHi+OkrfU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=koMhlsIdZmiPHFTbrDt5CFaYDvvtmP1VYF2oK+07sR0Uw+7MyE1GuFW659OkORd5o
         s2mUEgIwQqcbRRI3R7++66bnxEbaNzCSZ74rjTZKwvwL2h61C4ynE62cws8GatHWDH
         z+KCFOjjsD9PRehe2U5SYor2FnkwIlY51U44kLYQ=
Date:   Wed, 23 Feb 2022 14:20:25 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 10/27] media: ov5640: Split DVP and CSI-2 timings
Message-ID: <YhYmiUEAlRDPOAyX@pendragon.ideasonboard.com>
References: <20220223104034.91550-1-jacopo@jmondi.org>
 <20220223104034.91550-11-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220223104034.91550-11-jacopo@jmondi.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Wed, Feb 23, 2022 at 11:40:17AM +0100, Jacopo Mondi wrote:
> Separate the timings for the DVP mode from the timings for the CSI-2
> mode in the ov5640 modes definition.
> 
> The CSI-2 timings will deviate from the DVP ones as the clock tree is
> calculated differently.
> 
> In CSI-2 mode change the analog crop rectangles as the OV5640 pixel
> array is composed as:
> - vertically: 16 dummy columns, 2592 valid ones and 16 dummy columns for
>   a total of 2624 columns
> - horizontally: 8 optical black lines, 6 dummy ones, 1944 valid and 6
>   dummies for a total of 1964 lines
> 
> Adjust the analog crop rectangle in CSI-2 mode to:
> - Skip the first 16 dummy columns
> - Skip the first 14 black/dummy lines
> - Pass the whole valid pixel array size to the ISP for all modes except
>   1024x768, 720p and 1080p which are obtained by cropping the valid pixel array.

I'm sorry but I can't review that if you don't split it in two patches,
one that separates the timings, and one that updates the CSI-2 timings.

You can merge it without my review though (I'd actually prefer not
having to review it...)

> Tested in RGB565, UYVY and RGB888 modes in CSI-2 mode.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5640.c | 610 ++++++++++++++++++++++++++-----------
>  1 file changed, 434 insertions(+), 176 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 594adaf93c9d..4040ace2fd55 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -29,6 +29,13 @@
>  #define OV5640_XCLK_MIN  6000000
>  #define OV5640_XCLK_MAX 54000000
>  
> +#define OV5640_NATIVE_WIDTH		2624
> +#define OV5640_NATIVE_HEIGHT		1964
> +#define OV5640_PIXEL_ARRAY_TOP		14
> +#define OV5640_PIXEL_ARRAY_LEFT		16
> +#define OV5640_PIXEL_ARRAY_WIDTH	2592
> +#define OV5640_PIXEL_ARRAY_HEIGHT	1944
> +
>  #define OV5640_DEFAULT_SLAVE_ID 0x3c
>  
>  #define OV5640_LINK_RATE_MAX		490000000U
> @@ -281,24 +288,34 @@ struct reg_value {
>  	u32 delay_ms;
>  };
>  
> -struct ov5640_mode_info {
> -	enum ov5640_mode_id id;
> -	enum ov5640_downsize_mode dn_mode;
> -	enum ov5640_pixel_rate_id pixel_rate;
> +struct ov5640_timings {
>  	/* Analog crop rectangle. */
>  	struct v4l2_rect analog_crop;
>  	/* Visibile crop: from analog crop top-left corner. */
>  	struct v4l2_rect crop;
> -	/* Total pixels per line: crop.width + fixed hblank. */
> +	/* Total pixels per line: width + fixed hblank. */
>  	u32 htot;
> -	/* Default vertical blanking: frame height = crop.height + vblank. */
> +	/* Default vertical blanking: frame height = height + vblank. */
>  	u32 vblank_def;
> -	const struct reg_value *reg_data;
> -	u32 reg_data_size;
>  	/* DVP only; ignored in MIPI mode. */
>  	u32 max_fps;
>  };
>  
> +struct ov5640_mode_info {
> +	enum ov5640_mode_id id;
> +	enum ov5640_downsize_mode dn_mode;
> +	enum ov5640_pixel_rate_id pixel_rate;
> +
> +	unsigned int width;
> +	unsigned int height;
> +
> +	struct ov5640_timings dvp_timings;
> +	struct ov5640_timings csi2_timings;
> +
> +	const struct reg_value *reg_data;
> +	u32 reg_data_size;
> +};
> +
>  struct ov5640_ctrls {
>  	struct v4l2_ctrl_handler handler;
>  	struct v4l2_ctrl *pixel_rate;
> @@ -628,247 +645,481 @@ static const struct ov5640_mode_info ov5640_mode_init_data = {
>  		.id		= 0,
>  		.dn_mode	= SUBSAMPLING,
>  		.pixel_rate	= OV5640_PIXEL_RATE_96M,
> -		.analog_crop = {
> -			.left	= 0,
> -			.top	= 4,
> -			.width	= 2624,
> -			.height	= 1944,
> +		.width	= 640,
> +		.height	= 480,
> +		.dvp_timings = {
> +			.analog_crop = {
> +				.left	= 0,
> +				.top	= 4,
> +				.width	= 2624,
> +				.height	= 1944,
> +			},
> +			.crop = {
> +				.left	= 16,
> +				.top	= 6,
> +				.width	= 640,
> +				.height	= 480,
> +			},
> +			.htot		= 1896,
> +			.vblank_def	= 504,
> +			.max_fps	= OV5640_30_FPS
>  		},
> -		.crop = {
> -			.left	= 16,
> -			.top	= 6,
> -			.width	= 640,
> -			.height	= 480,
> +		.csi2_timings = {
> +			.analog_crop = {
> +				.left	= OV5640_PIXEL_ARRAY_LEFT,
> +				.top	= OV5640_PIXEL_ARRAY_TOP,
> +				.width	= OV5640_PIXEL_ARRAY_WIDTH,
> +				.height	= OV5640_PIXEL_ARRAY_HEIGHT,
> +			},
> +			.crop = {
> +				.left	= 2,
> +				.top	= 4,
> +				.width	= 640,
> +				.height	= 480,
> +			},
> +			.htot		= 1896,
> +			.vblank_def	= 504,
>  		},
> -		.htot		= 1896,
> -		.vblank_def	= 504,
>  		.reg_data	= ov5640_init_setting_30fps_VGA,
>  		.reg_data_size	= ARRAY_SIZE(ov5640_init_setting_30fps_VGA),
> -		.max_fps	= OV5640_30_FPS
>  };
>  
> -static const struct ov5640_mode_info
> -ov5640_mode_data[OV5640_NUM_MODES] = {
> +static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
>  	{
>  		/* 160x120 */
>  		.id		= OV5640_MODE_QQVGA_160_120,
>  		.dn_mode	= SUBSAMPLING,
>  		.pixel_rate	= OV5640_PIXEL_RATE_48M,
> -		.analog_crop = {
> -			.left	= 0,
> -			.top	= 4,
> -			.width	= 2624,
> -			.height	= 1944,
> +		.width		= 160,
> +		.height		= 120,
> +		.dvp_timings = {
> +			.analog_crop = {
> +				.left	= 0,
> +				.top	= 4,
> +				.width	= 2624,
> +				.height	= 1944,
> +			},
> +			.crop = {
> +				.left	= 16,
> +				.top	= 6,
> +				.width	= 160,
> +				.height	= 120,
> +			},
> +			.htot		= 1896,
> +			.vblank_def	= 864,
> +			.max_fps	= OV5640_30_FPS
>  		},
> -		.crop = {
> -			.left	= 16,
> -			.top	= 6,
> -			.width	= 160,
> -			.height	= 120,
> +		.csi2_timings = {
> +			.analog_crop = {
> +				/* Feed the full valid pixel array to the ISP. */
> +				.left	= OV5640_PIXEL_ARRAY_LEFT,
> +				.top	= OV5640_PIXEL_ARRAY_TOP,
> +				.width	= OV5640_PIXEL_ARRAY_WIDTH,
> +				.height	= OV5640_PIXEL_ARRAY_HEIGHT,
> +			},
> +			.crop = {
> +				/* Maintain a minimum digital crop processing margins. */
> +				.left	= 2,
> +				.top	= 4,
> +				.width	= 160,
> +				.height	= 120,
> +			},
> +			.htot		= 1896,
> +			.vblank_def	= 864,
>  		},
> -		.htot		= 1896,
> -		.vblank_def	= 864,
>  		.reg_data	= ov5640_setting_QQVGA_160_120,
>  		.reg_data_size	= ARRAY_SIZE(ov5640_setting_QQVGA_160_120),
> -		.max_fps	= OV5640_30_FPS
>  	}, {
>  		/* 176x144 */
>  		.id		= OV5640_MODE_QCIF_176_144,
>  		.dn_mode	= SUBSAMPLING,
>  		.pixel_rate	= OV5640_PIXEL_RATE_48M,
> -		.analog_crop = {
> -			.left	= 0,
> -			.top	= 4,
> -			.width	= 2624,
> -			.height	= 1944,
> +		.width		= 176,
> +		.height		= 144,
> +		.dvp_timings = {
> +			.analog_crop = {
> +				.left	= 0,
> +				.top	= 4,
> +				.width	= 2624,
> +				.height	= 1944,
> +			},
> +			.crop = {
> +				.left	= 16,
> +				.top	= 6,
> +				.width	= 176,
> +				.height	= 144,
> +			},
> +			.htot		= 1896,
> +			.vblank_def	= 840,
> +			.max_fps	= OV5640_30_FPS
>  		},
> -		.crop = {
> -			.left	= 16,
> -			.top	= 6,
> -			.width	= 176,
> -			.height	= 144,
> +		.csi2_timings = {
> +			.analog_crop = {
> +				/* Feed the full valid pixel array to the ISP. */
> +				.left	= OV5640_PIXEL_ARRAY_LEFT,
> +				.top	= OV5640_PIXEL_ARRAY_TOP,
> +				.width	= OV5640_PIXEL_ARRAY_WIDTH,
> +				.height	= OV5640_PIXEL_ARRAY_HEIGHT,
> +			},
> +			.crop = {
> +				/* Maintain a minimum digital crop processing margins. */
> +				.left	= 2,
> +				.top	= 4,
> +				.width	= 176,
> +				.height	= 144,
> +			},
> +			.htot		= 1896,
> +			.vblank_def	= 840,
>  		},
> -		.htot		= 1896,
> -		.vblank_def	= 840,
>  		.reg_data	= ov5640_setting_QCIF_176_144,
>  		.reg_data_size	= ARRAY_SIZE(ov5640_setting_QCIF_176_144),
> -		.max_fps	= OV5640_30_FPS
>  	}, {
>  		/* 320x240 */
>  		.id		= OV5640_MODE_QVGA_320_240,
>  		.dn_mode	= SUBSAMPLING,
> +		.width		= 320,
> +		.height		= 240,
>  		.pixel_rate	= OV5640_PIXEL_RATE_48M,
> -		.analog_crop = {
> -			.left	= 0,
> -			.top	= 4,
> -			.width	= 2624,
> -			.height	= 1944,
> +		.dvp_timings = {
> +			.analog_crop = {
> +				.left	= 0,
> +				.top	= 4,
> +				.width	= 2624,
> +				.height	= 1944,
> +			},
> +			.crop = {
> +				.left	= 16,
> +				.top	= 6,
> +				.width	= 320,
> +				.height	= 240,
> +			},
> +			.htot		= 1896,
> +			.vblank_def	= 744,
> +			.max_fps	= OV5640_30_FPS
>  		},
> -		.crop = {
> -			.left	= 16,
> -			.top	= 6,
> -			.width	= 320,
> -			.height	= 240,
> +		.csi2_timings = {
> +			.analog_crop = {
> +				/* Feed the full valid pixel array to the ISP. */
> +				.left	= OV5640_PIXEL_ARRAY_LEFT,
> +				.top	= OV5640_PIXEL_ARRAY_TOP,
> +				.width	= OV5640_PIXEL_ARRAY_WIDTH,
> +				.height	= OV5640_PIXEL_ARRAY_HEIGHT,
> +			},
> +			.crop = {
> +				/* Maintain a minimum digital crop processing margins. */
> +				.left	= 2,
> +				.top	= 4,
> +				.width	= 320,
> +				.height	= 240,
> +			},
> +			.htot		= 1896,
> +			.vblank_def	= 744,
>  		},
> -		.htot		= 1896,
> -		.vblank_def	= 744,
>  		.reg_data	= ov5640_setting_QVGA_320_240,
>  		.reg_data_size	= ARRAY_SIZE(ov5640_setting_QVGA_320_240),
> -		.max_fps	= OV5640_30_FPS
>  	}, {
>  		/* 640x480 */
>  		.id		= OV5640_MODE_VGA_640_480,
>  		.dn_mode	= SUBSAMPLING,
>  		.pixel_rate	= OV5640_PIXEL_RATE_48M,
> -		.analog_crop = {
> -			.left	= 0,
> -			.top	= 4,
> -			.width	= 2624,
> -			.height	= 1944,
> +		.width		= 640,
> +		.height		= 480,
> +		.dvp_timings = {
> +			.analog_crop = {
> +				.left	= 0,
> +				.top	= 4,
> +				.width	= 2624,
> +				.height	= 1944,
> +			},
> +			.crop = {
> +				.left	= 16,
> +				.top	= 6,
> +				.width	= 640,
> +				.height	= 480,
> +			},
> +			.htot		= 1896,
> +			.vblank_def	= 600,
> +			.max_fps	= OV5640_60_FPS
>  		},
> -		.crop = {
> -			.left	= 16,
> -			.top	= 6,
> -			.width	= 640,
> -			.height	= 480,
> +		.csi2_timings = {
> +			.analog_crop = {
> +				/* Feed the full valid pixel array to the ISP. */
> +				.left	= OV5640_PIXEL_ARRAY_LEFT,
> +				.top	= OV5640_PIXEL_ARRAY_TOP,
> +				.width	= OV5640_PIXEL_ARRAY_WIDTH,
> +				.height	= OV5640_PIXEL_ARRAY_HEIGHT,
> +			},
> +			.crop = {
> +				/* Maintain a minimum digital crop processing margins. */
> +				.left	= 2,
> +				.top	= 4,
> +				.width	= 640,
> +				.height	= 480,
> +			},
> +			.htot		= 1896,
> +			.vblank_def	= 600,
>  		},
> -		.htot		= 1896,
> -		.vblank_def	= 600,
>  		.reg_data	= ov5640_setting_VGA_640_480,
>  		.reg_data_size	= ARRAY_SIZE(ov5640_setting_VGA_640_480),
> -		.max_fps	= OV5640_60_FPS
>  	}, {
>  		/* 720x480 */
>  		.id		= OV5640_MODE_NTSC_720_480,
>  		.dn_mode	= SUBSAMPLING,
> +		.width		= 720,
> +		.height		= 480,
>  		.pixel_rate	= OV5640_PIXEL_RATE_96M,
> -		.analog_crop = {
> -			.left	= 0,
> -			.top	= 4,
> -			.width	= 2624,
> -			.height	= 1944,
> +		.dvp_timings = {
> +			.analog_crop = {
> +				.left	= 0,
> +				.top	= 4,
> +				.width	= 2624,
> +				.height	= 1944,
> +			},
> +			.crop = {
> +				.left	= 56,
> +				.top	= 60,
> +				.width	= 720,
> +				.height	= 480,
> +			},
> +			.htot		= 1896,
> +			.vblank_def	= 504,
> +			.max_fps	= OV5640_30_FPS
>  		},
> -		.crop = {
> -			.left	= 56,
> -			.top	= 60,
> -			.width	= 720,
> -			.height	= 480,
> +		.csi2_timings = {
> +			.analog_crop = {
> +				/* Feed the full valid pixel array to the ISP. */
> +				.left	= OV5640_PIXEL_ARRAY_LEFT,
> +				.top	= OV5640_PIXEL_ARRAY_TOP,
> +				.width	= OV5640_PIXEL_ARRAY_WIDTH,
> +				.height	= OV5640_PIXEL_ARRAY_HEIGHT,
> +			},
> +			.crop = {
> +				/* Maintain a minimum digital crop processing margins. */
> +				.left	= 56,
> +				.top	= 60,
> +				.width	= 720,
> +				.height	= 480,
> +			},
> +			.htot		= 1896,
> +			.vblank_def	= 504,
>  		},
> -		.htot		= 1896,
> -		.vblank_def	= 504,
>  		.reg_data	= ov5640_setting_NTSC_720_480,
>  		.reg_data_size	= ARRAY_SIZE(ov5640_setting_NTSC_720_480),
> -		.max_fps	= OV5640_30_FPS
>  	}, {
>  		/* 720x576 */
>  		.id		= OV5640_MODE_PAL_720_576,
>  		.dn_mode	= SUBSAMPLING,
> +		.width		= 720,
> +		.height		= 576,
>  		.pixel_rate	= OV5640_PIXEL_RATE_96M,
> -		.analog_crop = {
> -			.left	= 0,
> -			.top	= 4,
> -			.width	= 2624,
> -			.height	= 1944,
> +		.dvp_timings = {
> +			.analog_crop = {
> +				.left	= 0,
> +				.top	= 4,
> +				.width	= 2624,
> +				.height	= 1944,
> +			},
> +			.crop = {
> +				.left	= 56,
> +				.top	= 6,
> +				.width	= 720,
> +				.height	= 576,
> +			},
> +			.htot		= 1896,
> +			.vblank_def	= 408,
> +			.max_fps	= OV5640_30_FPS
>  		},
> -		.crop = {
> -			.left	= 56,
> -			.top	= 6,
> -			.width	= 720,
> -			.height	= 576,
> +		.csi2_timings = {
> +			.analog_crop = {
> +				/* Feed the full valid pixel array to the ISP. */
> +				.left	= OV5640_PIXEL_ARRAY_LEFT,
> +				.top	= OV5640_PIXEL_ARRAY_TOP,
> +				.width	= OV5640_PIXEL_ARRAY_WIDTH,
> +				.height	= OV5640_PIXEL_ARRAY_HEIGHT,
> +			},
> +			.crop = {
> +				/* Maintain a minimum digital crop processing margins. */
> +				.left	= 56,
> +				.top	= 6,
> +				.width	= 720,
> +				.height	= 576,
> +			},
> +			.htot		= 1896,
> +			.vblank_def	= 408,
>  		},
> -		.htot		= 1896,
> -		.vblank_def	= 408,
>  		.reg_data	= ov5640_setting_PAL_720_576,
>  		.reg_data_size	= ARRAY_SIZE(ov5640_setting_PAL_720_576),
> -		.max_fps	= OV5640_30_FPS
>  	}, {
>  		/* 1024x768 */
>  		.id		= OV5640_MODE_XGA_1024_768,
>  		.dn_mode	= SUBSAMPLING,
>  		.pixel_rate	= OV5640_PIXEL_RATE_96M,
> -		.analog_crop = {
> -			.left	= 0,
> -			.top	= 4,
> -			.width	= 2624,
> -			.height	= 1944,
> +		.width		= 1024,
> +		.height		= 768,
> +		.dvp_timings = {
> +			.analog_crop = {
> +				.left	= 0,
> +				.top	= 4,
> +				.width	= 2624,
> +				.height	= 1944,
> +			},
> +			.crop = {
> +				.left	= 16,
> +				.top	= 6,
> +				.width	= 1024,
> +				.height	= 768,
> +			},
> +			.htot		= 1896,
> +			.vblank_def	= 312,
> +			.max_fps	= OV5640_30_FPS
>  		},
> -		.crop = {
> -			.left	= 16,
> -			.top	= 6,
> -			.width	= 1024,
> -			.height	= 768,
> +		.csi2_timings = {
> +			.analog_crop = {
> +				.left	= 0,
> +				.top	= 4,
> +				.width	= OV5640_NATIVE_WIDTH,
> +				.height	= OV5640_PIXEL_ARRAY_HEIGHT,
> +			},
> +			.crop = {
> +				.left	= 16,
> +				.top	= 6,
> +				.width	= 1024,
> +				.height	= 768,
> +			},
> +			.htot		= 1896,
> +			.vblank_def	= 312,
>  		},
> -		.htot		= 1896,
> -		.vblank_def	= 312,
>  		.reg_data	= ov5640_setting_XGA_1024_768,
>  		.reg_data_size	= ARRAY_SIZE(ov5640_setting_XGA_1024_768),
> -		.max_fps	= OV5640_30_FPS
>  	}, {
>  		/* 1280x720 */
>  		.id		= OV5640_MODE_720P_1280_720,
>  		.dn_mode	= SUBSAMPLING,
>  		.pixel_rate	= OV5640_PIXEL_RATE_124M,
> -		.analog_crop = {
> -			.left	= 0,
> -			.top	= 250,
> -			.width	= 2624,
> -			.height	= 1456,
> +		.width		= 1280,
> +		.height		= 720,
> +		.dvp_timings = {
> +			.analog_crop = {
> +				.left	= 0,
> +				.top	= 250,
> +				.width	= 2624,
> +				.height	= 1456,
> +			},
> +			.crop = {
> +				.left	= 16,
> +				.top	= 4,
> +				.width	= 1280,
> +				.height	= 720,
> +			},
> +			.htot		= 1892,
> +			.vblank_def	= 20,
> +			.max_fps	= OV5640_30_FPS
>  		},
> -		.crop = {
> -			.left	= 16,
> -			.top	= 4,
> -			.width	= 1280,
> -			.height	= 720,
> +		.csi2_timings = {
> +			.analog_crop = {
> +				.left	= 0,
> +				.top	= 250,
> +				.width	= 2624,
> +				.height	= 1456,
> +			},
> +			.crop = {
> +				.left	= 16,
> +				.top	= 4,
> +				.width	= 1280,
> +				.height	= 720,
> +			},
> +			.htot		= 1892,
> +			.vblank_def	= 20,
>  		},
> -		.htot		= 1892,
> -		.vblank_def	= 20,
>  		.reg_data	= ov5640_setting_720P_1280_720,
>  		.reg_data_size	= ARRAY_SIZE(ov5640_setting_720P_1280_720),
> -		.max_fps	= OV5640_30_FPS
>  	}, {
>  		/* 1920x1080 */
>  		.id		= OV5640_MODE_1080P_1920_1080,
>  		.dn_mode	= SCALING,
>  		.pixel_rate	= OV5640_PIXEL_RATE_148M,
> -		.analog_crop = {
> -			.left	= 336,
> -			.top	= 434,
> -			.width	= 1952,
> -			.height	= 1088,
> +		.width		= 1920,
> +		.height		= 1080,
> +		.dvp_timings = {
> +			.analog_crop = {
> +				.left	= 336,
> +				.top	= 434,
> +				.width	= 1952,
> +				.height	= 1088,
> +			},
> +			.crop = {
> +				.left	= 16,
> +				.top	= 4,
> +				.width	= 1920,
> +				.height	= 1080,
> +			},
> +			.htot		= 2500,
> +			.vblank_def	= 40,
> +			.max_fps	= OV5640_30_FPS
>  		},
> -		.crop = {
> -			.left	= 16,
> -			.top	= 4,
> -			.width	= 1920,
> -			.height	= 1080,
> +		.csi2_timings = {
> +			.analog_crop = {
> +				/* Crop the full valid pixel array in the center. */
> +				.left	= 336,
> +				.top	= 434,
> +				.width	= 1952,
> +				.height	= 1088,
> +			},
> +			.crop = {
> +				/* Maintain a larger digital crop processing margins. */
> +				.left	= 16,
> +				.top	= 4,
> +				.width	= 1920,
> +				.height	= 1080,
> +			},
> +			.htot		= 2500,
> +			.vblank_def	= 40,
>  		},
> -		.htot		= 2500,
> -		.vblank_def	= 40,
>  		.reg_data	= ov5640_setting_1080P_1920_1080,
>  		.reg_data_size	= ARRAY_SIZE(ov5640_setting_1080P_1920_1080),
> -		.max_fps	= OV5640_30_FPS
>  	}, {
>  		/* 2592x1944 */
>  		.id		= OV5640_MODE_QSXGA_2592_1944,
>  		.dn_mode	= SCALING,
>  		.pixel_rate	= OV5640_PIXEL_RATE_168M,
> -		.analog_crop = {
> -			.left	= 0,
> -			.top	= 0,
> -			.width	= 2624,
> -			.height	= 1952,
> +		.width		= OV5640_PIXEL_ARRAY_WIDTH,
> +		.height		= OV5640_PIXEL_ARRAY_HEIGHT,
> +		.dvp_timings = {
> +			.analog_crop = {
> +				.left	= 0,
> +				.top	= 0,
> +				.width	= 2624,
> +				.height	= 1952,
> +			},
> +			.crop = {
> +				.left	= 16,
> +				.top	= 4,
> +				.width	= 2592,
> +				.height	= 1944,
> +			},
> +			.htot		= 2844,
> +			.vblank_def	= 24,
> +			.max_fps	= OV5640_15_FPS
>  		},
> -		.crop = {
> -			.left	= 16,
> -			.top	= 4,
> -			.width	= 2592,
> -			.height	= 1944,
> +		.csi2_timings = {
> +			.analog_crop = {
> +				/* Give more processing margin to full resolution. */
> +				.left	= 0,
> +				.top	= 0,
> +				.width	= OV5640_NATIVE_WIDTH,
> +				.height	= 1952,
> +			},
> +			.crop = {
> +				.left	= 16,
> +				.top	= 4,
> +				.width	= 2592,
> +				.height	= 1944,
> +			},
> +			.htot		= 2844,
> +			.vblank_def	= 24,
>  		},
> -		.htot		= 2844,
> -		.vblank_def	= 24,
>  		.reg_data	= ov5640_setting_QSXGA_2592_1944,
>  		.reg_data_size	= ARRAY_SIZE(ov5640_setting_QSXGA_2592_1944),
> -		.max_fps	= OV5640_15_FPS
>  	},
>  };
>  
> @@ -1270,10 +1521,10 @@ static int ov5640_set_mipi_pclk(struct ov5640_dev *sensor)
>  
>  static u32 ov5640_calc_pixel_rate(struct ov5640_dev *sensor)
>  {
> +	const struct ov5640_timings *timings = &sensor->current_mode->dvp_timings;
>  	u32 rate;
>  
> -	rate = sensor->current_mode->htot
> -	     * (sensor->current_mode->crop.height + sensor->current_mode->vblank_def);
> +	rate = timings->htot * (timings->crop.height + timings->vblank_def);
>  	rate *= ov5640_framerates[sensor->current_fr];
>  
>  	return rate;
> @@ -1357,21 +1608,20 @@ static int ov5640_set_jpeg_timings(struct ov5640_dev *sensor,
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = ov5640_write_reg16(sensor, OV5640_REG_VFIFO_HSIZE,
> -				 mode->crop.width);
> +	ret = ov5640_write_reg16(sensor, OV5640_REG_VFIFO_HSIZE, mode->width);
>  	if (ret < 0)
>  		return ret;
>  
> -	return ov5640_write_reg16(sensor, OV5640_REG_VFIFO_VSIZE,
> -				  mode->crop.height);
> +	return ov5640_write_reg16(sensor, OV5640_REG_VFIFO_VSIZE, mode->height);
>  }
>  
>  /* download ov5640 settings to sensor through i2c */
>  static int ov5640_set_timings(struct ov5640_dev *sensor,
>  			      const struct ov5640_mode_info *mode)
>  {
> -	const struct v4l2_rect *analog_crop = &mode->analog_crop;
> -	const struct v4l2_rect *crop = &mode->crop;
> +	const struct ov5640_timings *timings;
> +	const struct v4l2_rect *analog_crop;
> +	const struct v4l2_rect *crop;
>  	int ret;
>  
>  	if (sensor->fmt.code == MEDIA_BUS_FMT_JPEG_1X8) {
> @@ -1380,6 +1630,14 @@ static int ov5640_set_timings(struct ov5640_dev *sensor,
>  			return ret;
>  	}
>  
> +	if (ov5640_is_csi2(sensor))
> +		timings = &mode->csi2_timings;
> +	else
> +		timings = &mode->dvp_timings;
> +
> +	analog_crop = &timings->analog_crop;
> +	crop = &timings->crop;
> +
>  	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_HS, analog_crop->left);
>  	if (ret < 0)
>  		return ret;
> @@ -1406,20 +1664,20 @@ static int ov5640_set_timings(struct ov5640_dev *sensor,
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_DVPHO, crop->width);
> +	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_DVPHO, mode->width);
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_DVPVO, crop->height);
> +	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_DVPVO, mode->height);
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_HTS, mode->htot);
> +	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_HTS, timings->htot);
>  	if (ret < 0)
>  		return ret;
>  
>  	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_VTS,
> -				 crop->height + mode->vblank_def);
> +				 mode->height + timings->vblank_def);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -1851,15 +2109,15 @@ ov5640_find_mode(struct ov5640_dev *sensor, enum ov5640_frame_rate fr,
>  
>  	mode = v4l2_find_nearest_size(ov5640_mode_data,
>  				      ARRAY_SIZE(ov5640_mode_data),
> -				      crop.width, crop.height, width, height);
> +				      width, height, width, height);
>  
>  	if (!mode ||
>  	    (!nearest &&
> -	     (mode->crop.width != width || mode->crop.height != height)))
> +	     (mode->width != width || mode->height != height)))
>  		return NULL;
>  
>  	/* Check to see if the current mode exceeds the max frame rate */
> -	if (ov5640_framerates[fr] > ov5640_framerates[mode->max_fps])
> +	if (ov5640_framerates[fr] > ov5640_framerates[mode->dvp_timings.max_fps])
>  		return NULL;
>  
>  	return mode;
> @@ -2539,8 +2797,8 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
>  	mode = ov5640_find_mode(sensor, fr, fmt->width, fmt->height, true);
>  	if (!mode)
>  		return -EINVAL;
> -	fmt->width = mode->crop.width;
> -	fmt->height = mode->crop.height;
> +	fmt->width = mode->width;
> +	fmt->height = mode->height;
>  
>  	if (new_mode)
>  		*new_mode = mode;
> @@ -3173,9 +3431,9 @@ static int ov5640_enum_frame_size(struct v4l2_subdev *sd,
>  	if (fse->index >= OV5640_NUM_MODES)
>  		return -EINVAL;
>  
> -	fse->min_width = ov5640_mode_data[fse->index].crop.width;
> +	fse->min_width = ov5640_mode_data[fse->index].width;
>  	fse->max_width = fse->min_width;
> -	fse->min_height = ov5640_mode_data[fse->index].crop.height;
> +	fse->min_height = ov5640_mode_data[fse->index].height;
>  	fse->max_height = fse->min_height;
>  
>  	return 0;
> @@ -3239,16 +3497,16 @@ static int ov5640_s_frame_interval(struct v4l2_subdev *sd,
>  	mode = sensor->current_mode;
>  
>  	frame_rate = ov5640_try_frame_interval(sensor, &fi->interval,
> -					       mode->crop.width,
> -					       mode->crop.height);
> +					       mode->width,
> +					       mode->height);
>  	if (frame_rate < 0) {
>  		/* Always return a valid frame interval value */
>  		fi->interval = sensor->frame_interval;
>  		goto out;
>  	}
>  
> -	mode = ov5640_find_mode(sensor, frame_rate, mode->crop.width,
> -				mode->crop.height, true);
> +	mode = ov5640_find_mode(sensor, frame_rate, mode->width,
> +				mode->height, true);
>  	if (!mode) {
>  		ret = -EINVAL;
>  		goto out;

-- 
Regards,

Laurent Pinchart
