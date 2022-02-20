Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22B0B4BCE84
	for <lists+linux-media@lfdr.de>; Sun, 20 Feb 2022 13:56:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237822AbiBTM5G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Feb 2022 07:57:06 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237087AbiBTM5F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Feb 2022 07:57:05 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCB7739160
        for <linux-media@vger.kernel.org>; Sun, 20 Feb 2022 04:56:44 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9AD6625B;
        Sun, 20 Feb 2022 13:56:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645361802;
        bh=oHK1eCSiOakRYARWZdwnvx7ywb/Ud9ujLJAx8UsNu94=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t8NkD/KH5CrsJJdRs9cwpXpr0yn8SJOigT5ukIY8VhgXmGc5GHGksdcOXOBexLh2b
         CmC1GjfPvA/Tdf/TZy4opJImhZrOR5I0iLMaV8xyzBTp2Xlk4DGmSC4VJ1m4hy9b70
         oPdHy/iRmcLSX1uB+ZA59MDewBngYqwVBbpcFp8g=
Date:   Sun, 20 Feb 2022 14:56:33 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [v2.1] media: ov5640: Rework analog crop rectangles
Message-ID: <YhI6gZUiIbDkiHlf@pendragon.ideasonboard.com>
References: <20220210110458.152494-11-jacopo@jmondi.org>
 <20220211093432.41977-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220211093432.41977-1-jacopo@jmondi.org>
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

On Fri, Feb 11, 2022 at 10:34:32AM +0100, Jacopo Mondi wrote:
> The OV5640 pixel array is composed as:
> - vertically: 16 dummy columns, 2592 valid ones and 16 dummy columns for
>   a total of 2624 columns
> - horizontally: 8 optical black lines, 6 dummy ones, 1944 valid and 6
>   dummies for a total of 1964 lines
> 
> Adjust the analog crop rectangle in all modes to:
> - Skip the first 16 dummy columns
> - Skip the first 14 black/dummy lines
> - Pass the whole valid pixel array size to the ISP for all modes except
>   1024x768, 720p and 1080p which are obtained by cropping the valid pixel array.
> 
> Adjust how timings is programmed to comply with the new definitions.
> 
> Tested in RGB565, UYVY, RGB565 and RGB888 modes.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5640.c | 120 +++++++++++++++++++++----------------
>  1 file changed, 68 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index f817f865ad16..232afd4d906a 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -626,14 +626,14 @@ static const struct ov5640_mode_info ov5640_mode_init_data = {
>  		.dn_mode	= SUBSAMPLING,
>  		.pixel_rate	= OV5640_PIXEL_RATE_96M,
>  		.analog_crop = {
> -			.left	= 0,
> -			.top	= 4,
> -			.width	= 2623,
> -			.height	= 1947,
> +			.left	= OV5640_PIXEL_ARRAY_LEFT,
> +			.top	= OV5640_PIXEL_ARRAY_TOP,
> +			.width	= OV5640_PIXEL_ARRAY_WIDTH,
> +			.height	= OV5640_PIXEL_ARRAY_HEIGHT,

These macros are added in 17/23.

>  		},
>  		.crop = {
> -			.left	= 16,
> -			.top	= 6,
> +			.left	= 2,
> +			.top	= 4,
>  			.width	= 640,
>  			.height	= 480,
>  		},
> @@ -644,22 +644,23 @@ static const struct ov5640_mode_info ov5640_mode_init_data = {
>  		.max_fps	= OV5640_30_FPS
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
>  		.analog_crop = {
> -			.left	= 0,
> -			.top	= 4,
> -			.width	= 2623,
> -			.height	= 1947,
> +			/* Feed the full valid pixel array to the ISP. */
> +			.left	= OV5640_PIXEL_ARRAY_LEFT,
> +			.top	= OV5640_PIXEL_ARRAY_TOP,
> +			.width	= OV5640_PIXEL_ARRAY_WIDTH,
> +			.height	= OV5640_PIXEL_ARRAY_HEIGHT,
>  		},
>  		.crop = {
> -			.left	= 16,
> -			.top	= 6,
> +			/* Maintain a minimum digital crop processing margins. */
> +			.left	= 2,
> +			.top	= 4,
>  			.width	= 160,
>  			.height	= 120,
>  		},
> @@ -674,14 +675,16 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
>  		.dn_mode	= SUBSAMPLING,
>  		.pixel_rate	= OV5640_PIXEL_RATE_48M,
>  		.analog_crop = {
> -			.left	= 0,
> -			.top	= 4,
> -			.width	= 2623,
> -			.height	= 1947,
> +			/* Feed the full valid pixel array to the ISP. */
> +			.left	= OV5640_PIXEL_ARRAY_LEFT,
> +			.top	= OV5640_PIXEL_ARRAY_TOP,
> +			.width	= OV5640_PIXEL_ARRAY_WIDTH,
> +			.height	= OV5640_PIXEL_ARRAY_HEIGHT,
>  		},
>  		.crop = {
> -			.left	= 16,
> -			.top	= 6,
> +			/* Maintain a minimum digital crop processing margins. */
> +			.left	= 2,
> +			.top	= 4,
>  			.width	= 176,
>  			.height	= 144,
>  		},
> @@ -696,14 +699,16 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
>  		.dn_mode	= SUBSAMPLING,
>  		.pixel_rate	= OV5640_PIXEL_RATE_48M,
>  		.analog_crop = {
> -			.left	= 0,
> -			.top	= 4,
> -			.width	= 2623,
> -			.height	= 1947,
> +			/* Feed the full valid pixel array to the ISP. */
> +			.left	= OV5640_PIXEL_ARRAY_LEFT,
> +			.top	= OV5640_PIXEL_ARRAY_TOP,
> +			.width	= OV5640_PIXEL_ARRAY_WIDTH,
> +			.height	= OV5640_PIXEL_ARRAY_HEIGHT,
>  		},
>  		.crop = {
> -			.left	= 16,
> -			.top	= 6,
> +			/* Maintain a minimum digital crop processing margins. */
> +			.left	= 2,
> +			.top	= 4,
>  			.width	= 320,
>  			.height	= 240,
>  		},
> @@ -718,14 +723,16 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
>  		.dn_mode	= SUBSAMPLING,
>  		.pixel_rate	= OV5640_PIXEL_RATE_48M,
>  		.analog_crop = {
> -			.left	= 0,
> -			.top	= 4,
> -			.width	= 2623,
> -			.height	= 1947,
> +			/* Feed the full valid pixel array to the ISP. */
> +			.left	= OV5640_PIXEL_ARRAY_LEFT,
> +			.top	= OV5640_PIXEL_ARRAY_TOP,
> +			.width	= OV5640_PIXEL_ARRAY_WIDTH,
> +			.height	= OV5640_PIXEL_ARRAY_HEIGHT,
>  		},
>  		.crop = {
> -			.left	= 16,
> -			.top	= 6,
> +			/* Maintain a minimum digital crop processing margins. */
> +			.left	= 2,
> +			.top	= 4,
>  			.width	= 640,
>  			.height	= 480,
>  		},
> @@ -740,12 +747,14 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
>  		.dn_mode	= SUBSAMPLING,
>  		.pixel_rate	= OV5640_PIXEL_RATE_96M,
>  		.analog_crop = {
> -			.left	= 0,
> -			.top	= 4,
> -			.width	= 2623,
> -			.height	= 1947,
> +			/* Feed the full valid pixel array to the ISP. */
> +			.left	= OV5640_PIXEL_ARRAY_LEFT,
> +			.top	= OV5640_PIXEL_ARRAY_TOP,
> +			.width	= OV5640_PIXEL_ARRAY_WIDTH,
> +			.height	= OV5640_PIXEL_ARRAY_HEIGHT,
>  		},
>  		.crop = {
> +			/* Maintain a minimum digital crop processing margins. */
>  			.left	= 56,
>  			.top	= 60,
>  			.width	= 720,
> @@ -762,12 +771,14 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
>  		.dn_mode	= SUBSAMPLING,
>  		.pixel_rate	= OV5640_PIXEL_RATE_96M,
>  		.analog_crop = {
> -			.left	= 0,
> -			.top	= 4,
> -			.width	= 2623,
> -			.height	= 1947,
> +			/* Feed the full valid pixel array to the ISP. */
> +			.left	= OV5640_PIXEL_ARRAY_LEFT,
> +			.top	= OV5640_PIXEL_ARRAY_TOP,
> +			.width	= OV5640_PIXEL_ARRAY_WIDTH,
> +			.height	= OV5640_PIXEL_ARRAY_HEIGHT,
>  		},
>  		.crop = {
> +			/* Maintain a minimum digital crop processing margins. */
>  			.left	= 56,
>  			.top	= 6,
>  			.width	= 720,
> @@ -786,8 +797,8 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
>  		.analog_crop = {
>  			.left	= 0,
>  			.top	= 4,
> -			.width	= 2623,
> -			.height	= 1947,
> +			.width	= OV5640_NATIVE_WIDTH,
> +			.height	= OV5640_PIXEL_ARRAY_HEIGHT,
>  		},
>  		.crop = {
>  			.left	= 16,
> @@ -808,8 +819,8 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
>  		.analog_crop = {
>  			.left	= 0,
>  			.top	= 250,
> -			.width	= 2623,
> -			.height	= 1705,
> +			.width	= 2624,
> +			.height	= 1456,
>  		},
>  		.crop = {
>  			.left	= 16,
> @@ -828,12 +839,14 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
>  		.dn_mode	= SCALING,
>  		.pixel_rate	= OV5640_PIXEL_RATE_148M,
>  		.analog_crop = {
> +			/* Crop the full valid pixel array in the center. */
>  			.left	= 336,
>  			.top	= 434,
> -			.width	= 2287,
> -			.height	= 1521,
> +			.width	= 1952,
> +			.height	= 1088,
>  		},
>  		.crop = {
> +			/* Maintain a larger digital crop processing margins. */
>  			.left	= 16,
>  			.top	= 4,
>  			.width	= 1920,
> @@ -850,16 +863,17 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
>  		.dn_mode	= SCALING,
>  		.pixel_rate	= OV5640_PIXEL_RATE_168M,
>  		.analog_crop = {
> +			/* Give more processing margin to full resolution. */
>  			.left	= 0,
>  			.top	= 0,
> -			.width	= 2623,
> -			.height	= 1951,
> +			.width	= OV5640_NATIVE_WIDTH,
> +			.height	= 1952,
>  		},
>  		.crop = {
>  			.left	= 16,
>  			.top	= 4,
> -			.width	= 2592,
> -			.height	= 1944,
> +			.width	= OV5640_PIXEL_ARRAY_WIDTH,
> +			.height	= OV5640_PIXEL_ARRAY_HEIGHT,
>  		},
>  		.htot		= 2844,
>  		.vblank_def	= 24,
> @@ -1384,11 +1398,13 @@ static int ov5640_set_timings(struct ov5640_dev *sensor,
>  	if (ret < 0)
>  		return ret;
> 
> -	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_HW, analog_crop->width);
> +	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_HW,
> +				 analog_crop->width + analog_crop->left - 1);
>  	if (ret < 0)
>  		return ret;
> 
> -	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_VH, analog_crop->height);
> +	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_VH,
> +				 analog_crop->height + analog_crop->top - 1);

I'd move this to 08/23 as mentioned in the review of that patch.

>  	if (ret < 0)
>  		return ret;
> 

-- 
Regards,

Laurent Pinchart
