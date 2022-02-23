Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4511A4C121A
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 13:01:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240254AbiBWMCU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 07:02:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240244AbiBWMCU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 07:02:20 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C4BF985AF
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 04:01:51 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F58EDD;
        Wed, 23 Feb 2022 13:01:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645617709;
        bh=qV95vsdzAp9wHkwxZIwFTZRU0PhKZiqVLIMjlopqCoA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=B2sMccgnisgguo3Ms6YwVHa1McOJSmlDAnfQTN9nkyPLV1brgvHvSwaDQ6Y3fUZhN
         pdx0tM2gN61TpI4NoV9Zfg8dIfdaq7ai2yzWzEzpBGdUy6vHgcjAr30HHZNHsxMu1T
         vgkptD2BMon/RTdwhcO4g3R8ZKSU5SJ8ijRcxx2c=
Date:   Wed, 23 Feb 2022 14:01:39 +0200
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
Subject: Re: [PATCH v3 13/27] media: ov5640: Remove duplicated mode settings
Message-ID: <YhYiI/OTQ2wDWWYZ@pendragon.ideasonboard.com>
References: <20220223104034.91550-1-jacopo@jmondi.org>
 <20220223104034.91550-14-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220223104034.91550-14-jacopo@jmondi.org>
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

On Wed, Feb 23, 2022 at 11:40:20AM +0100, Jacopo Mondi wrote:
> The register tables for all resolutions smaller than 720p are now
> identical.
> 
> Remove the duplicated ones and create a single ov5640_setting_low_res[]
> register table.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

Neat :-)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

If there's any volunteer, it would be nice to take this one step further
and isolate the other changes too.

> ---
>  drivers/media/i2c/ov5640.c | 120 +++++--------------------------------
>  1 file changed, 15 insertions(+), 105 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index ab17ac79f936..a85e10a8118f 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -482,7 +482,7 @@ static const struct reg_value ov5640_init_setting_30fps_VGA[] = {
>  	{0x3a1f, 0x14, 0, 0}, {0x3008, 0x02, 0, 0}, {0x3c00, 0x04, 0, 300},
>  };
>  
> -static const struct reg_value ov5640_setting_QQVGA_160_120[] = {
> +static const struct reg_value ov5640_setting_low_res[] = {
>  	{0x3c07, 0x08, 0, 0},
>  	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
>  	{0x3814, 0x31, 0, 0},
> @@ -496,96 +496,6 @@ static const struct reg_value ov5640_setting_QQVGA_160_120[] = {
>  	{0x4407, 0x04, 0, 0}, {0x5001, 0xa3, 0, 0},
>  };
>  
> -static const struct reg_value ov5640_setting_QCIF_176_144[] = {
> -	{0x3c07, 0x08, 0, 0},
> -	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
> -	{0x3814, 0x31, 0, 0},
> -	{0x3815, 0x31, 0, 0},
> -	{0x3618, 0x00, 0, 0}, {0x3612, 0x29, 0, 0}, {0x3708, 0x64, 0, 0},
> -	{0x3709, 0x52, 0, 0}, {0x370c, 0x03, 0, 0}, {0x3a02, 0x03, 0, 0},
> -	{0x3a03, 0xd8, 0, 0}, {0x3a08, 0x01, 0, 0}, {0x3a09, 0x27, 0, 0},
> -	{0x3a0a, 0x00, 0, 0}, {0x3a0b, 0xf6, 0, 0}, {0x3a0e, 0x03, 0, 0},
> -	{0x3a0d, 0x04, 0, 0}, {0x3a14, 0x03, 0, 0}, {0x3a15, 0xd8, 0, 0},
> -	{0x4001, 0x02, 0, 0}, {0x4004, 0x02, 0, 0},
> -	{0x4407, 0x04, 0, 0}, {0x460b, 0x35, 0, 0}, {0x460c, 0x22, 0, 0},
> -	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
> -};
> -
> -static const struct reg_value ov5640_setting_QVGA_320_240[] = {
> -	{0x3c07, 0x08, 0, 0},
> -	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
> -	{0x3814, 0x31, 0, 0},
> -	{0x3815, 0x31, 0, 0},
> -	{0x3618, 0x00, 0, 0}, {0x3612, 0x29, 0, 0}, {0x3708, 0x64, 0, 0},
> -	{0x3709, 0x52, 0, 0}, {0x370c, 0x03, 0, 0}, {0x3a02, 0x03, 0, 0},
> -	{0x3a03, 0xd8, 0, 0}, {0x3a08, 0x01, 0, 0}, {0x3a09, 0x27, 0, 0},
> -	{0x3a0a, 0x00, 0, 0}, {0x3a0b, 0xf6, 0, 0}, {0x3a0e, 0x03, 0, 0},
> -	{0x3a0d, 0x04, 0, 0}, {0x3a14, 0x03, 0, 0}, {0x3a15, 0xd8, 0, 0},
> -	{0x4001, 0x02, 0, 0}, {0x4004, 0x02, 0, 0},
> -	{0x4407, 0x04, 0, 0}, {0x460b, 0x35, 0, 0}, {0x460c, 0x22, 0, 0},
> -	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
> -};
> -
> -static const struct reg_value ov5640_setting_VGA_640_480[] = {
> -	{0x3c07, 0x08, 0, 0},
> -	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
> -	{0x3814, 0x31, 0, 0},
> -	{0x3815, 0x31, 0, 0},
> -	{0x3618, 0x00, 0, 0}, {0x3612, 0x29, 0, 0}, {0x3708, 0x64, 0, 0},
> -	{0x3709, 0x52, 0, 0}, {0x370c, 0x03, 0, 0}, {0x3a02, 0x03, 0, 0},
> -	{0x3a03, 0xd8, 0, 0}, {0x3a08, 0x01, 0, 0}, {0x3a09, 0x27, 0, 0},
> -	{0x3a0a, 0x00, 0, 0}, {0x3a0b, 0xf6, 0, 0}, {0x3a0e, 0x03, 0, 0},
> -	{0x3a0d, 0x04, 0, 0}, {0x3a14, 0x03, 0, 0}, {0x3a15, 0xd8, 0, 0},
> -	{0x4001, 0x02, 0, 0}, {0x4004, 0x02, 0, 0},
> -	{0x4407, 0x04, 0, 0}, {0x460b, 0x35, 0, 0}, {0x460c, 0x22, 0, 0},
> -	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
> -};
> -
> -static const struct reg_value ov5640_setting_NTSC_720_480[] = {
> -	{0x3c07, 0x08, 0, 0},
> -	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
> -	{0x3814, 0x31, 0, 0},
> -	{0x3815, 0x31, 0, 0},
> -	{0x3618, 0x00, 0, 0}, {0x3612, 0x29, 0, 0}, {0x3708, 0x64, 0, 0},
> -	{0x3709, 0x52, 0, 0}, {0x370c, 0x03, 0, 0}, {0x3a02, 0x03, 0, 0},
> -	{0x3a03, 0xd8, 0, 0}, {0x3a08, 0x01, 0, 0}, {0x3a09, 0x27, 0, 0},
> -	{0x3a0a, 0x00, 0, 0}, {0x3a0b, 0xf6, 0, 0}, {0x3a0e, 0x03, 0, 0},
> -	{0x3a0d, 0x04, 0, 0}, {0x3a14, 0x03, 0, 0}, {0x3a15, 0xd8, 0, 0},
> -	{0x4001, 0x02, 0, 0}, {0x4004, 0x02, 0, 0},
> -	{0x4407, 0x04, 0, 0}, {0x460b, 0x35, 0, 0}, {0x460c, 0x22, 0, 0},
> -	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
> -};
> -
> -static const struct reg_value ov5640_setting_PAL_720_576[] = {
> -	{0x3c07, 0x08, 0, 0},
> -	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
> -	{0x3814, 0x31, 0, 0},
> -	{0x3815, 0x31, 0, 0},
> -	{0x3618, 0x00, 0, 0}, {0x3612, 0x29, 0, 0}, {0x3708, 0x64, 0, 0},
> -	{0x3709, 0x52, 0, 0}, {0x370c, 0x03, 0, 0}, {0x3a02, 0x03, 0, 0},
> -	{0x3a03, 0xd8, 0, 0}, {0x3a08, 0x01, 0, 0}, {0x3a09, 0x27, 0, 0},
> -	{0x3a0a, 0x00, 0, 0}, {0x3a0b, 0xf6, 0, 0}, {0x3a0e, 0x03, 0, 0},
> -	{0x3a0d, 0x04, 0, 0}, {0x3a14, 0x03, 0, 0}, {0x3a15, 0xd8, 0, 0},
> -	{0x4001, 0x02, 0, 0}, {0x4004, 0x02, 0, 0},
> -	{0x4407, 0x04, 0, 0}, {0x460b, 0x35, 0, 0}, {0x460c, 0x22, 0, 0},
> -	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
> -};
> -
> -static const struct reg_value ov5640_setting_XGA_1024_768[] = {
> -	{0x3c07, 0x08, 0, 0},
> -	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
> -	{0x3814, 0x31, 0, 0},
> -	{0x3815, 0x31, 0, 0},
> -	{0x3618, 0x00, 0, 0}, {0x3612, 0x29, 0, 0}, {0x3708, 0x64, 0, 0},
> -	{0x3709, 0x52, 0, 0}, {0x370c, 0x03, 0, 0}, {0x3a02, 0x03, 0, 0},
> -	{0x3a03, 0xd8, 0, 0}, {0x3a08, 0x01, 0, 0}, {0x3a09, 0x27, 0, 0},
> -	{0x3a0a, 0x00, 0, 0}, {0x3a0b, 0xf6, 0, 0}, {0x3a0e, 0x03, 0, 0},
> -	{0x3a0d, 0x04, 0, 0}, {0x3a14, 0x03, 0, 0}, {0x3a15, 0xd8, 0, 0},
> -	{0x4001, 0x02, 0, 0}, {0x4004, 0x02, 0, 0},
> -	{0x4407, 0x04, 0, 0}, {0x460b, 0x35, 0, 0}, {0x460c, 0x22, 0, 0},
> -	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
> -};
> -
>  static const struct reg_value ov5640_setting_720P_1280_720[] = {
>  	{0x3c07, 0x07, 0, 0},
>  	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
> @@ -727,8 +637,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
>  			.htot		= 1896,
>  			.vblank_def	= 864,
>  		},
> -		.reg_data	= ov5640_setting_QQVGA_160_120,
> -		.reg_data_size	= ARRAY_SIZE(ov5640_setting_QQVGA_160_120),
> +		.reg_data	= ov5640_setting_low_res,
> +		.reg_data_size	= ARRAY_SIZE(ov5640_setting_low_res),
>  	}, {
>  		/* 176x144 */
>  		.id		= OV5640_MODE_QCIF_176_144,
> @@ -771,8 +681,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
>  			.htot		= 1896,
>  			.vblank_def	= 840,
>  		},
> -		.reg_data	= ov5640_setting_QCIF_176_144,
> -		.reg_data_size	= ARRAY_SIZE(ov5640_setting_QCIF_176_144),
> +		.reg_data	= ov5640_setting_low_res,
> +		.reg_data_size	= ARRAY_SIZE(ov5640_setting_low_res),
>  	}, {
>  		/* 320x240 */
>  		.id		= OV5640_MODE_QVGA_320_240,
> @@ -815,8 +725,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
>  			.htot		= 1896,
>  			.vblank_def	= 744,
>  		},
> -		.reg_data	= ov5640_setting_QVGA_320_240,
> -		.reg_data_size	= ARRAY_SIZE(ov5640_setting_QVGA_320_240),
> +		.reg_data	= ov5640_setting_low_res,
> +		.reg_data_size	= ARRAY_SIZE(ov5640_setting_low_res),
>  	}, {
>  		/* 640x480 */
>  		.id		= OV5640_MODE_VGA_640_480,
> @@ -859,8 +769,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
>  			.htot		= 1896,
>  			.vblank_def	= 600,
>  		},
> -		.reg_data	= ov5640_setting_VGA_640_480,
> -		.reg_data_size	= ARRAY_SIZE(ov5640_setting_VGA_640_480),
> +		.reg_data	= ov5640_setting_low_res,
> +		.reg_data_size	= ARRAY_SIZE(ov5640_setting_low_res),
>  	}, {
>  		/* 720x480 */
>  		.id		= OV5640_MODE_NTSC_720_480,
> @@ -903,8 +813,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
>  			.htot		= 1896,
>  			.vblank_def	= 504,
>  		},
> -		.reg_data	= ov5640_setting_NTSC_720_480,
> -		.reg_data_size	= ARRAY_SIZE(ov5640_setting_NTSC_720_480),
> +		.reg_data	= ov5640_setting_low_res,
> +		.reg_data_size	= ARRAY_SIZE(ov5640_setting_low_res),
>  	}, {
>  		/* 720x576 */
>  		.id		= OV5640_MODE_PAL_720_576,
> @@ -947,8 +857,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
>  			.htot		= 1896,
>  			.vblank_def	= 408,
>  		},
> -		.reg_data	= ov5640_setting_PAL_720_576,
> -		.reg_data_size	= ARRAY_SIZE(ov5640_setting_PAL_720_576),
> +		.reg_data	= ov5640_setting_low_res,
> +		.reg_data_size	= ARRAY_SIZE(ov5640_setting_low_res),
>  	}, {
>  		/* 1024x768 */
>  		.id		= OV5640_MODE_XGA_1024_768,
> @@ -989,8 +899,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
>  			.htot		= 1896,
>  			.vblank_def	= 312,
>  		},
> -		.reg_data	= ov5640_setting_XGA_1024_768,
> -		.reg_data_size	= ARRAY_SIZE(ov5640_setting_XGA_1024_768),
> +		.reg_data	= ov5640_setting_low_res,
> +		.reg_data_size	= ARRAY_SIZE(ov5640_setting_low_res),
>  	}, {
>  		/* 1280x720 */
>  		.id		= OV5640_MODE_720P_1280_720,

-- 
Regards,

Laurent Pinchart
