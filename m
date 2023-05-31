Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 383AA7185BB
	for <lists+linux-media@lfdr.de>; Wed, 31 May 2023 17:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233691AbjEaPJP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 May 2023 11:09:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233946AbjEaPJN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 May 2023 11:09:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56392139;
        Wed, 31 May 2023 08:09:08 -0700 (PDT)
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:72c3:346:a663:c82d])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CDD69E79;
        Wed, 31 May 2023 17:08:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685545725;
        bh=lmcfD14FbPz92xoXJXiQHBUZfovXeycBhBz13Mi6tbA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MTMyvIgzwr4Isb0G69rw+xnCqIvpEdGmc83csR0jBVDN7ItHCTFepm+OhBUwtoSeN
         UyEAYCrIiWmS7tf2EIg867oItNdBpU1i82WkMgWTD7MduvQ0h0mpJJvvtVhXYjxntG
         w/ybwywKJlRfOAT/G4YJpJ7a89yHi9pEPWUyZBvM=
Date:   Wed, 31 May 2023 17:09:03 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 02/21] media: i2c: imx258: Make image geometry meet
 sensor requirements
Message-ID: <gmkmehch6uww23ws4sn4o6oxgjsc4x6vvkkaare74edhu3givg@64keyhberued>
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
 <20230530173000.3060865-3-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230530173000.3060865-3-dave.stevenson@raspberrypi.com>
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

On Tue, May 30, 2023 at 06:29:41PM +0100, Dave Stevenson wrote:
> The output image is defined as being 4208x3118 pixels in size.
> Y_ADD_STA register was set to 0, and Y_ADD_END to 3118, giving
> 3119 lines total.
>
> The datasheet lists a requirement for Y_ADD_STA to be a multiple
> of a power of 2 depending on binning/scaling mode (2 for full pixel,
> 4 for x2-bin/scale, 8 for (x2-bin)+(x2-subsample) or x4-bin, or 16
> for (x4-bin)+(x2-subsample)).
> (Y_ADD_END – Y_ADD_STA + 1) also has to be a similar power of 2.
>
> The current configuration for the full res modes breaks that second
> requirement, and we can't increase Y_ADD_STA to 1 to retain exactly
> the same field of view as that then breaks the first requirement.
> For the binned modes, they are worse off as 3118 is not a multiple of
> 4.
>
> Increase the main mode to 4208x3120 so that it is the same FOV as the
> binned modes, with Y_ADD_STA at 0.
> Fix Y_ADD_STA and Y_ADD_END for the binned modes so that they meet the
> sensor requirements.
>
> This does change the Bayer order as the default configuration is for
> H&V flips to be enabled, so readout is from Y_STA_END to Y_ADD_STA,
> and this patch has changed Y_STA_END.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Good catch!
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  drivers/media/i2c/imx258.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index 6028579393b5..946b1a12971d 100644
> --- a/drivers/media/i2c/imx258.c
> +++ b/drivers/media/i2c/imx258.c
> @@ -111,7 +111,7 @@ struct imx258_mode {
>  	struct imx258_reg_list reg_list;
>  };
>
> -/* 4208x3118 needs 1267Mbps/lane, 4 lanes */
> +/* 4208x3120 needs 1267Mbps/lane, 4 lanes */
>  static const struct imx258_reg mipi_data_rate_1267mbps[] = {
>  	{ 0x0301, 0x05 },
>  	{ 0x0303, 0x02 },
> @@ -148,7 +148,7 @@ static const struct imx258_reg mipi_data_rate_640mbps[] = {
>  	{ 0x0823, 0x00 },
>  };
>
> -static const struct imx258_reg mode_4208x3118_regs[] = {
> +static const struct imx258_reg mode_4208x3120_regs[] = {
>  	{ 0x0136, 0x13 },
>  	{ 0x0137, 0x33 },
>  	{ 0x3051, 0x00 },
> @@ -210,7 +210,7 @@ static const struct imx258_reg mode_4208x3118_regs[] = {
>  	{ 0x0348, 0x10 },
>  	{ 0x0349, 0x6F },
>  	{ 0x034A, 0x0C },
> -	{ 0x034B, 0x2E },
> +	{ 0x034B, 0x2F },
>  	{ 0x0381, 0x01 },
>  	{ 0x0383, 0x01 },
>  	{ 0x0385, 0x01 },
> @@ -329,7 +329,7 @@ static const struct imx258_reg mode_2104_1560_regs[] = {
>  	{ 0x0348, 0x10 },
>  	{ 0x0349, 0x6F },
>  	{ 0x034A, 0x0C },
> -	{ 0x034B, 0x2E },
> +	{ 0x034B, 0x2F },
>  	{ 0x0381, 0x01 },
>  	{ 0x0383, 0x01 },
>  	{ 0x0385, 0x01 },
> @@ -448,7 +448,7 @@ static const struct imx258_reg mode_1048_780_regs[] = {
>  	{ 0x0348, 0x10 },
>  	{ 0x0349, 0x6F },
>  	{ 0x034A, 0x0C },
> -	{ 0x034B, 0x2E },
> +	{ 0x034B, 0x2F },
>  	{ 0x0381, 0x01 },
>  	{ 0x0383, 0x01 },
>  	{ 0x0385, 0x01 },
> @@ -562,12 +562,12 @@ static const struct imx258_link_freq_config link_freq_configs[] = {
>  static const struct imx258_mode supported_modes[] = {
>  	{
>  		.width = 4208,
> -		.height = 3118,
> +		.height = 3120,
>  		.vts_def = IMX258_VTS_30FPS,
>  		.vts_min = IMX258_VTS_30FPS,
>  		.reg_list = {
> -			.num_of_regs = ARRAY_SIZE(mode_4208x3118_regs),
> -			.regs = mode_4208x3118_regs,
> +			.num_of_regs = ARRAY_SIZE(mode_4208x3120_regs),
> +			.regs = mode_4208x3120_regs,
>  		},
>  		.link_freq_index = IMX258_LINK_FREQ_1267MBPS,
>  	},
> @@ -710,7 +710,7 @@ static int imx258_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>  	/* Initialize try_fmt */
>  	try_fmt->width = supported_modes[0].width;
>  	try_fmt->height = supported_modes[0].height;
> -	try_fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> +	try_fmt->code = MEDIA_BUS_FMT_SBGGR10_1X10;
>  	try_fmt->field = V4L2_FIELD_NONE;
>
>  	return 0;
> @@ -822,7 +822,7 @@ static int imx258_enum_mbus_code(struct v4l2_subdev *sd,
>  	if (code->index > 0)
>  		return -EINVAL;
>
> -	code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> +	code->code = MEDIA_BUS_FMT_SBGGR10_1X10;
>
>  	return 0;
>  }
> @@ -834,7 +834,7 @@ static int imx258_enum_frame_size(struct v4l2_subdev *sd,
>  	if (fse->index >= ARRAY_SIZE(supported_modes))
>  		return -EINVAL;
>
> -	if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
> +	if (fse->code != MEDIA_BUS_FMT_SBGGR10_1X10)
>  		return -EINVAL;
>
>  	fse->min_width = supported_modes[fse->index].width;
> @@ -850,7 +850,7 @@ static void imx258_update_pad_format(const struct imx258_mode *mode,
>  {
>  	fmt->format.width = mode->width;
>  	fmt->format.height = mode->height;
> -	fmt->format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
> +	fmt->format.code = MEDIA_BUS_FMT_SBGGR10_1X10;
>  	fmt->format.field = V4L2_FIELD_NONE;
>  }
>
> @@ -898,7 +898,7 @@ static int imx258_set_pad_format(struct v4l2_subdev *sd,
>  	mutex_lock(&imx258->mutex);
>
>  	/* Only one raw bayer(GBRG) order is supported */
> -	fmt->format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
> +	fmt->format.code = MEDIA_BUS_FMT_SBGGR10_1X10;
>
>  	mode = v4l2_find_nearest_size(supported_modes,
>  		ARRAY_SIZE(supported_modes), width, height,
> --
> 2.25.1
>
