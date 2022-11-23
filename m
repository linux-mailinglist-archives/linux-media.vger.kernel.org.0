Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68A25635352
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 09:54:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236424AbiKWIyF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 03:54:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236402AbiKWIyD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 03:54:03 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E9FCEA114
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 00:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669193640; x=1700729640;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VM8mnqiwNPJ/7eOXtP1nN7lzwvrwjh7gy0KEgWAzGWg=;
  b=A2UMugYDQO7Zh2sgI3tWrqn17prVQBO/iFsWdOssDPyqiqoThXvTbUEj
   jlCOG322IVgq+Yhrn1OW3JYkblVLXm96PMSImSzp9GglaIImgqmtSScHI
   o44IcTsBy29smKd7K5n1y3RhAm5+r5wuGDNdtwraLRyVsjDXBhawJJh0P
   wNzB8Na2SfOxC0GGh1nS+ZQl9BTedm2Ns9TgY3lONmjNTO68KfrnLE8qq
   9eBnvE+/MXijVOdxFkc4oJOS13+xHytl6Ky5OijhhyQGGv2634vxVxser
   CLg7h2qjBl3x3kjbzlDR+/0UF07WPdELv+t3vPLEbrMU+zMhatnaUoefm
   A==;
X-IronPort-AV: E=Sophos;i="5.96,186,1665439200"; 
   d="scan'208";a="27528798"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 23 Nov 2022 09:53:58 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 23 Nov 2022 09:53:58 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 23 Nov 2022 09:53:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669193638; x=1700729638;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VM8mnqiwNPJ/7eOXtP1nN7lzwvrwjh7gy0KEgWAzGWg=;
  b=jbyIdptKoV0fD0lL26CyuvbfQ0WWzEKKk805BB8QEDFasDKJdhK0sS86
   Y0cGhsvCZhdMdgkQTfRYzTH3bUlc6H/Eo4SOm3v/0hbB8xP13wxFFdFpe
   kHuBF52tUER50sggqdBdN1Fg34DciWDAzduYFgsjGejuySgFkn10X5+O2
   p9wgQZGQJ/Z4kB8UyKD3FEzvW0LanmA91IZhIZBzHYsSEZ2iM+32a0grr
   oW0uBYACTDtvHBbEC64B3mUSonlOvZq250oGTjHRExyKXOfw9JRZ84wh7
   VdEt0OuAqX7dvhbeNhz3AM9qhP3CrwzOvigNoPBbbIDQb8AsloHTHaX2A
   A==;
X-IronPort-AV: E=Sophos;i="5.96,186,1665439200"; 
   d="scan'208";a="27528797"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 23 Nov 2022 09:53:58 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 74807280056;
        Wed, 23 Nov 2022 09:53:58 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v1 12/15] media: i2c: imx290: Rename, extend and expand usage of imx290_pixfmt
Date:   Wed, 23 Nov 2022 09:53:58 +0100
Message-ID: <3529218.R56niFO833@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20221122223250.21233-13-laurent.pinchart@ideasonboard.com>
References: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com> <20221122223250.21233-13-laurent.pinchart@ideasonboard.com>
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

Hello Laurent,

thanks for the patch.

Am Dienstag, 22. November 2022, 23:32:47 CET schrieb Laurent Pinchart:
> The imx290_pixfmt structure contains information about formats,
> currently limited to the bpp value. Extend it with the register settings
> for each format, and rename it to imx290_format_info to make its purpose
> clearer. Add a function named imx290_format_info() to look up format
> info for a media bus code, and use it through the code. This allows
> dropping the imx290 bpp field as the value is now looked up dynamically.
> 
> The error handling in imx290_setup_format() can also be dropped, as the
> format is guaranteed by imx290_set_fmt() to be valid.

This looks a bit weird accessing pointers returned by imx290_format_info() 
unconditionally at some places, while imx290_format_info() might return NULL.
But AFAICS the cases where this might happen, due to userspace interactions, 
are checked.

Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 87 ++++++++++++++++++++------------------
>  1 file changed, 45 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index cd2154983341..d279d6dd0cb4 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -182,7 +182,6 @@ struct imx290 {
>  	struct media_pad pad;
> 
>  	const struct imx290_mode *current_mode;
> -	u8 bpp;
> 
>  	struct regulator_bulk_data supplies[IMX290_NUM_SUPPLIES];
>  	struct gpio_desc *rst_gpio;
> @@ -414,16 +413,41 @@ static inline int imx290_modes_num(const struct imx290
> *imx290) return ARRAY_SIZE(imx290_modes_4lanes);
>  }
> 
> -struct imx290_pixfmt {
> +struct imx290_format_info {
>  	u32 code;
>  	u8 bpp;
> +	const struct imx290_regval *regs;
> +	unsigned int num_regs;
>  };
> 
> -static const struct imx290_pixfmt imx290_formats[] = {
> -	{ MEDIA_BUS_FMT_SRGGB10_1X10, 10 },
> -	{ MEDIA_BUS_FMT_SRGGB12_1X12, 12 },
> +static const struct imx290_format_info imx290_formats[] = {
> +	{
> +		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.bpp = 10,
> +		.regs = imx290_10bit_settings,
> +		.num_regs = ARRAY_SIZE(imx290_10bit_settings),
> +	}, {
> +		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.bpp = 12,
> +		.regs = imx290_12bit_settings,
> +		.num_regs = ARRAY_SIZE(imx290_12bit_settings),
> +	}
>  };
> 
> +static const struct imx290_format_info *imx290_format_info(u32 code)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(imx290_formats); ++i) {
> +		const struct imx290_format_info *info = 
&imx290_formats[i];
> +
> +		if (info->code == code)
> +			return info;
> +	}
> +
> +	return NULL;
> +}
> +
>  /*
> ---------------------------------------------------------------------------
> -- * Register access
>   */
> @@ -516,43 +540,31 @@ static int imx290_set_data_lanes(struct imx290
> *imx290) }
> 
>  static int imx290_set_black_level(struct imx290 *imx290,
> +				  const struct v4l2_mbus_framefmt 
*format,
>  				  unsigned int black_level, int *err)
>  {
> +	unsigned int bpp = imx290_format_info(format->code)->bpp;
> +
>  	return imx290_write(imx290, IMX290_BLKLEVEL,
> -			    black_level >> (16 - imx290->bpp), err);
> +			    black_level >> (16 - bpp), err);
>  }
> 
>  static int imx290_setup_format(struct imx290 *imx290,
>  			       const struct v4l2_mbus_framefmt *format)
>  {
> -	const struct imx290_regval *regs;
> -	unsigned int num_regs;
> -	unsigned int bpp;
> +	const struct imx290_format_info *info;
>  	int ret;
> 
> -	switch (format->code) {
> -	case MEDIA_BUS_FMT_SRGGB10_1X10:
> -		regs = imx290_10bit_settings;
> -		num_regs = ARRAY_SIZE(imx290_10bit_settings);
> -		bpp = 10;
> -		break;
> -	case MEDIA_BUS_FMT_SRGGB12_1X12:
> -		regs = imx290_12bit_settings;
> -		num_regs = ARRAY_SIZE(imx290_12bit_settings);
> -		bpp = 12;
> -		break;
> -	default:
> -		dev_err(imx290->dev, "Unknown pixel format\n");
> -		return -EINVAL;
> -	}
> +	info = imx290_format_info(format->code);
> 
> -	ret = imx290_set_register_array(imx290, regs, num_regs);
> +	ret = imx290_set_register_array(imx290, info->regs, info->num_regs);
>  	if (ret < 0) {
>  		dev_err(imx290->dev, "Could not set format registers\n");
>  		return ret;
>  	}
> 
> -	return imx290_set_black_level(imx290, IMX290_BLACK_LEVEL_DEFAULT, 
&ret);
> +	return imx290_set_black_level(imx290, format,
> +				      IMX290_BLACK_LEVEL_DEFAULT, 
&ret);
>  }
> 
>  /*
> ---------------------------------------------------------------------------
> - @@ -586,7 +598,7 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
> 
>  	case V4L2_CID_TEST_PATTERN:
>  		if (ctrl->val) {
> -			imx290_set_black_level(imx290, 0, &ret);
> +			imx290_set_black_level(imx290, format, 0, &ret);
>  			usleep_range(10000, 11000);
>  			imx290_write(imx290, IMX290_PGCTRL,
>  				     (u8)(IMX290_PGCTRL_REGEN |
> @@ -595,8 +607,8 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
>  		} else {
>  			imx290_write(imx290, IMX290_PGCTRL, 0x00, &ret);
>  			usleep_range(10000, 11000);
> -			imx290_set_black_level(imx290, 
IMX290_BLACK_LEVEL_DEFAULT,
> -					       &ret);
> +			imx290_set_black_level(imx290, format,
> +					       
IMX290_BLACK_LEVEL_DEFAULT, &ret);
>  		}
>  		break;
>  	default:
> @@ -635,7 +647,7 @@ static void imx290_ctrl_update(struct imx290 *imx290,
> 
>  	/* pixel rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
>  	pixel_rate = link_freq * 2 * imx290->nlanes;
> -	do_div(pixel_rate, imx290->bpp);
> +	do_div(pixel_rate, imx290_format_info(format->code)->bpp);
> 
>  	__v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
>  	__v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate, pixel_rate);
> @@ -837,8 +849,7 @@ static int imx290_enum_frame_size(struct v4l2_subdev
> *sd, const struct imx290 *imx290 = to_imx290(sd);
>  	const struct imx290_mode *imx290_modes = imx290_modes_ptr(imx290);
> 
> -	if ((fse->code != imx290_formats[0].code) &&
> -	    (fse->code != imx290_formats[1].code))
> +	if (!imx290_format_info(fse->code))
>  		return -EINVAL;
> 
>  	if (fse->index >= imx290_modes_num(imx290))
> @@ -859,7 +870,6 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
>  	struct imx290 *imx290 = to_imx290(sd);
>  	const struct imx290_mode *mode;
>  	struct v4l2_mbus_framefmt *format;
> -	unsigned int i;
> 
>  	mode = v4l2_find_nearest_size(imx290_modes_ptr(imx290),
>  				      imx290_modes_num(imx290), width, 
height,
> @@ -868,21 +878,15 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
>  	fmt->format.width = mode->width;
>  	fmt->format.height = mode->height;
> 
> -	for (i = 0; i < ARRAY_SIZE(imx290_formats); i++)
> -		if (imx290_formats[i].code == fmt->format.code)
> -			break;
> +	if (!imx290_format_info(fmt->format.code))
> +		fmt->format.code = imx290_formats[0].code;
> 
> -	if (i >= ARRAY_SIZE(imx290_formats))
> -		i = 0;
> -
> -	fmt->format.code = imx290_formats[i].code;
>  	fmt->format.field = V4L2_FIELD_NONE;
> 
>  	format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
> 
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>  		imx290->current_mode = mode;
> -		imx290->bpp = imx290_formats[i].bpp;
> 
>  		imx290_ctrl_update(imx290, &fmt->format, mode);
>  	}
> @@ -980,7 +984,6 @@ static int imx290_subdev_init(struct imx290 *imx290)
>  	int ret;
> 
>  	imx290->current_mode = &imx290_modes_ptr(imx290)[0];
> -	imx290->bpp = imx290_formats[0].bpp;
> 
>  	v4l2_i2c_subdev_init(&imx290->sd, client, &imx290_subdev_ops);
>  	imx290->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;




