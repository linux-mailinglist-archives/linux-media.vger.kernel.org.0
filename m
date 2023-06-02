Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC55072032D
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 15:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235928AbjFBNYU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 09:24:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235284AbjFBNYT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 09:24:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8BCC1B5;
        Fri,  2 Jun 2023 06:24:17 -0700 (PDT)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C04AD27C;
        Fri,  2 Jun 2023 15:23:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685712233;
        bh=wXr9B+/2TD6qaXDSPL6mg0FBE0PAQ3bN3QqjpGnwR90=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fkcGx5XPmTm8C5F33TaMTWty+mnOqsk2HqY0cAYXVSy8jNcBdrtLqsXts16Iuuwmp
         +UiXamB5vOyBzIFbofBgruICC4yQyfqrMcUkTCF7uA8MliacVxWt+rd51QMhWJPwVv
         02AmuNg8urKPe/GTeooulzL8btVDxUbi0y7EQDag=
Date:   Fri, 2 Jun 2023 15:24:12 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 11/21] media: i2c: imx258: Add get_selection for pixel
 array information
Message-ID: <3bbpjluswgkijp67orypgjiygnkmcf5d3w62gaviyxncrt4to4@5lbc5v53wdb6>
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
 <20230530173000.3060865-12-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230530173000.3060865-12-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave

On Tue, May 30, 2023 at 06:29:50PM +0100, Dave Stevenson wrote:
> Libcamera requires the cropping information for each mode, so
> add this information to the driver.
>
Looks good!
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx258.c | 90 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
>
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index 82ffe09e3bdc..1fa83fe82f27 100644
> --- a/drivers/media/i2c/imx258.c
> +++ b/drivers/media/i2c/imx258.c
> @@ -77,6 +77,14 @@
>  #define REG_CONFIG_MIRROR_FLIP		0x03
>  #define REG_CONFIG_FLIP_TEST_PATTERN	0x02
>
> +/* IMX258 native and active pixel array size. */
> +#define IMX258_NATIVE_WIDTH		4224U
> +#define IMX258_NATIVE_HEIGHT		3192U
> +#define IMX258_PIXEL_ARRAY_LEFT		8U
> +#define IMX258_PIXEL_ARRAY_TOP		16U
> +#define IMX258_PIXEL_ARRAY_WIDTH	4208U
> +#define IMX258_PIXEL_ARRAY_HEIGHT	3120U
> +
>  struct imx258_reg {
>  	u16 address;
>  	u8 val;
> @@ -115,6 +123,9 @@ struct imx258_mode {
>  	u32 link_freq_index;
>  	/* Default register values */
>  	struct imx258_reg_list reg_list;
> +
> +	/* Analog crop rectangle. */
> +	struct v4l2_rect crop;
>  };
>
>  /* 4208x3120 needs 1267Mbps/lane, 4 lanes. Use that rate on 2 lanes as well */
> @@ -562,6 +573,12 @@ static const struct imx258_mode supported_modes[] = {
>  			.regs = mode_4208x3120_regs,
>  		},
>  		.link_freq_index = IMX258_LINK_FREQ_1267MBPS,
> +		.crop = {
> +			.left = IMX258_PIXEL_ARRAY_LEFT,
> +			.top = IMX258_PIXEL_ARRAY_TOP,
> +			.width = 4208,
> +			.height = 3120,
> +		},
>  	},
>  	{
>  		.width = 2104,
> @@ -573,6 +590,12 @@ static const struct imx258_mode supported_modes[] = {
>  			.regs = mode_2104_1560_regs,
>  		},
>  		.link_freq_index = IMX258_LINK_FREQ_640MBPS,
> +		.crop = {
> +			.left = IMX258_PIXEL_ARRAY_LEFT,
> +			.top = IMX258_PIXEL_ARRAY_TOP,
> +			.width = 4208,
> +			.height = 3120,
> +		},
>  	},
>  	{
>  		.width = 1048,
> @@ -584,6 +607,12 @@ static const struct imx258_mode supported_modes[] = {
>  			.regs = mode_1048_780_regs,
>  		},
>  		.link_freq_index = IMX258_LINK_FREQ_640MBPS,
> +		.crop = {
> +			.left = IMX258_PIXEL_ARRAY_LEFT,
> +			.top = IMX258_PIXEL_ARRAY_TOP,
> +			.width = 4208,
> +			.height = 3120,
> +		},
>  	},
>  };
>
> @@ -703,6 +732,7 @@ static int imx258_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>  {
>  	struct v4l2_mbus_framefmt *try_fmt =
>  		v4l2_subdev_get_try_format(sd, fh->state, 0);
> +	struct v4l2_rect *try_crop;
>
>  	/* Initialize try_fmt */
>  	try_fmt->width = supported_modes[0].width;
> @@ -710,6 +740,13 @@ static int imx258_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>  	try_fmt->code = MEDIA_BUS_FMT_SBGGR10_1X10;
>  	try_fmt->field = V4L2_FIELD_NONE;
>
> +	/* Initialize try_crop */
> +	try_crop = v4l2_subdev_get_try_crop(sd, fh->state, 0);
> +	try_crop->left = IMX258_PIXEL_ARRAY_LEFT;
> +	try_crop->top = IMX258_PIXEL_ARRAY_TOP;
> +	try_crop->width = IMX258_PIXEL_ARRAY_WIDTH;
> +	try_crop->height = IMX258_PIXEL_ARRAY_HEIGHT;
> +
>  	return 0;
>  }
>
> @@ -958,6 +995,58 @@ static int imx258_set_pad_format(struct v4l2_subdev *sd,
>  	return 0;
>  }
>
> +static const struct v4l2_rect *
> +__imx258_get_pad_crop(struct imx258 *imx258,
> +		      struct v4l2_subdev_state *sd_state,
> +		      unsigned int pad, enum v4l2_subdev_format_whence which)
> +{
> +	switch (which) {
> +	case V4L2_SUBDEV_FORMAT_TRY:
> +		return v4l2_subdev_get_try_crop(&imx258->sd, sd_state, pad);
> +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> +		return &imx258->cur_mode->crop;
> +	}
> +
> +	return NULL;
> +}
> +
> +static int imx258_get_selection(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_state *sd_state,
> +				struct v4l2_subdev_selection *sel)
> +{
> +	switch (sel->target) {
> +	case V4L2_SEL_TGT_CROP: {
> +		struct imx258 *imx258 = to_imx258(sd);
> +
> +		mutex_lock(&imx258->mutex);
> +		sel->r = *__imx258_get_pad_crop(imx258, sd_state, sel->pad,
> +						sel->which);
> +		mutex_unlock(&imx258->mutex);
> +
> +		return 0;
> +	}
> +
> +	case V4L2_SEL_TGT_NATIVE_SIZE:
> +		sel->r.left = 0;
> +		sel->r.top = 0;
> +		sel->r.width = IMX258_NATIVE_WIDTH;
> +		sel->r.height = IMX258_NATIVE_HEIGHT;
> +
> +		return 0;
> +
> +	case V4L2_SEL_TGT_CROP_DEFAULT:
> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> +		sel->r.left = IMX258_PIXEL_ARRAY_LEFT;
> +		sel->r.top = IMX258_PIXEL_ARRAY_TOP;
> +		sel->r.width = IMX258_PIXEL_ARRAY_WIDTH;
> +		sel->r.height = IMX258_PIXEL_ARRAY_HEIGHT;
> +
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  /* Start streaming */
>  static int imx258_start_streaming(struct imx258 *imx258)
>  {
> @@ -1170,6 +1259,7 @@ static const struct v4l2_subdev_pad_ops imx258_pad_ops = {
>  	.get_fmt = imx258_get_pad_format,
>  	.set_fmt = imx258_set_pad_format,
>  	.enum_frame_size = imx258_enum_frame_size,
> +	.get_selection = imx258_get_selection,
>  };
>
>  static const struct v4l2_subdev_ops imx258_subdev_ops = {
> --
> 2.25.1
>
