Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59BEB7203D6
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 15:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234705AbjFBN6X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 09:58:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232240AbjFBN6W (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 09:58:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E2AF18C;
        Fri,  2 Jun 2023 06:58:20 -0700 (PDT)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59EF427C;
        Fri,  2 Jun 2023 15:57:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685714276;
        bh=kKzWNKnOH8WxAVwCgFYwfc8YtamZjG2MBr1SAuPTo5A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EDAuRprQFYfmWiHm1bSr2ZfPRxSkiZtBgeYE9Hs2c5XvIU3EeEzDkNc7/kjSQocrJ
         NoxwtJxmCw+lVH3CeA1hSjuUwaMLoNeQIkS7uypjOWSgupW0gY1aT/+vkQIbm1HNKm
         KCzrHMPyg7gYtUk0JhDKJ6Dv53h4mQJ7lXYCNRjM=
Date:   Fri, 2 Jun 2023 15:58:16 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 21/21] media: i2c: imx258: Make HFLIP and VFLIP controls
 writable
Message-ID: <bqz2iyucj3fzprzmouu5genmm4e4h33oeye5cng5bekaqen2t4@tjlftixka3oq>
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
 <20230530173000.3060865-22-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230530173000.3060865-22-dave.stevenson@raspberrypi.com>
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

On Tue, May 30, 2023 at 06:30:00PM +0100, Dave Stevenson wrote:
> The sensor supports H & V flips, but the controls were READ_ONLY.
>
> Note that the Bayer order changes with these flips, therefore
> they set the V4L2_CTRL_FLAG_MODIFY_LAYOUT property.

Nice!

>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx258.c | 99 ++++++++++++++++++++++++--------------
>  1 file changed, 64 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index 98b5c1e3abff..cf90ac66e14c 100644
> --- a/drivers/media/i2c/imx258.c
> +++ b/drivers/media/i2c/imx258.c
> @@ -83,8 +83,8 @@
>
>  /* Orientation */
>  #define REG_MIRROR_FLIP_CONTROL		0x0101
> -#define REG_CONFIG_MIRROR_FLIP		0x03
> -#define REG_CONFIG_FLIP_TEST_PATTERN	0x02
> +#define REG_CONFIG_MIRROR_HFLIP		0x01
> +#define REG_CONFIG_MIRROR_VFLIP		0x02
>
>  /* IMX258 native and active pixel array size. */
>  #define IMX258_NATIVE_WIDTH		4224U
> @@ -484,6 +484,23 @@ static const struct imx258_variant_cfg imx258_pdaf_cfg = {
>  	.num_regs = ARRAY_SIZE(imx258_pdaf_cfg_regs),
>  };
>
> +/*
> + * The supported formats.
> + * This table MUST contain 4 entries per format, to cover the various flip
> + * combinations in the order
> + * - no flip
> + * - h flip
> + * - v flip
> + * - h&v flips
> + */
> +static const u32 codes[] = {
> +	/* 10-bit modes. */
> +	MEDIA_BUS_FMT_SRGGB10_1X10,
> +	MEDIA_BUS_FMT_SGRBG10_1X10,
> +	MEDIA_BUS_FMT_SGBRG10_1X10,
> +	MEDIA_BUS_FMT_SBGGR10_1X10
> +};
> +
>  static const char * const imx258_test_pattern_menu[] = {
>  	"Disabled",
>  	"Solid Colour",
> @@ -677,6 +694,8 @@ struct imx258 {
>  	struct v4l2_ctrl *vblank;
>  	struct v4l2_ctrl *hblank;
>  	struct v4l2_ctrl *exposure;
> +	struct v4l2_ctrl *hflip;
> +	struct v4l2_ctrl *vflip;
>  	/* Current long exposure factor in use. Set through V4L2_CID_VBLANK */
>  	unsigned int long_exp_shift;
>
> @@ -780,9 +799,22 @@ static int imx258_write_regs(struct imx258 *imx258,
>  	return 0;
>  }
>
> +/* Get bayer order based on flip setting. */
> +static u32 imx258_get_format_code(struct imx258 *imx258)

can struct imx258 be const ?

> +{
> +	unsigned int i;
> +
> +	lockdep_assert_held(&imx258->mutex);
> +
> +	i = (imx258->vflip->val ? 2 : 0) |
> +	    (imx258->hflip->val ? 1 : 0);
> +
> +	return codes[i];
> +}

An empty line wouldn't hurt

>  /* Open sub-device */
>  static int imx258_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>  {
> +	struct imx258 *imx258 = to_imx258(sd);
>  	struct v4l2_mbus_framefmt *try_fmt =
>  		v4l2_subdev_get_try_format(sd, fh->state, 0);
>  	struct v4l2_rect *try_crop;
> @@ -790,7 +822,7 @@ static int imx258_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>  	/* Initialize try_fmt */
>  	try_fmt->width = supported_modes[0].width;
>  	try_fmt->height = supported_modes[0].height;
> -	try_fmt->code = MEDIA_BUS_FMT_SBGGR10_1X10;
> +	try_fmt->code = imx258_get_format_code(imx258);
>  	try_fmt->field = V4L2_FIELD_NONE;
>
>  	/* Initialize try_crop */
> @@ -903,10 +935,6 @@ static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
>  		ret = imx258_write_reg(imx258, IMX258_REG_TEST_PATTERN,
>  				IMX258_REG_VALUE_16BIT,
>  				ctrl->val);
> -		ret = imx258_write_reg(imx258, REG_MIRROR_FLIP_CONTROL,
> -				IMX258_REG_VALUE_08BIT,
> -				!ctrl->val ? REG_CONFIG_MIRROR_FLIP :
> -				REG_CONFIG_FLIP_TEST_PATTERN);
>  		break;
>  	case V4L2_CID_WIDE_DYNAMIC_RANGE:
>  		if (!ctrl->val) {
> @@ -928,6 +956,15 @@ static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
>  		ret = imx258_set_frame_length(imx258,
>  					      imx258->cur_mode->height + ctrl->val);
>  		break;
> +	case V4L2_CID_VFLIP:
> +	case V4L2_CID_HFLIP:
> +		ret = imx258_write_reg(imx258, REG_MIRROR_FLIP_CONTROL,
> +				       IMX258_REG_VALUE_08BIT,
> +				       (imx258->hflip->val ?
> +					REG_CONFIG_MIRROR_HFLIP : 0) |
> +				       (imx258->vflip->val ?
> +					REG_CONFIG_MIRROR_VFLIP : 0));
> +		break;
>  	default:
>  		dev_info(&client->dev,
>  			 "ctrl(id:0x%x,val:0x%x) is not handled\n",
> @@ -949,11 +986,13 @@ static int imx258_enum_mbus_code(struct v4l2_subdev *sd,
>  				  struct v4l2_subdev_state *sd_state,
>  				  struct v4l2_subdev_mbus_code_enum *code)
>  {
> -	/* Only one bayer order(GRBG) is supported */
> +	struct imx258 *imx258 = to_imx258(sd);
> +
> +	/* Only one bayer format (10 bit) is supported */
>  	if (code->index > 0)
>  		return -EINVAL;
>
> -	code->code = MEDIA_BUS_FMT_SBGGR10_1X10;
> +	code->code = imx258_get_format_code(imx258);
>
>  	return 0;
>  }
> @@ -962,10 +1001,11 @@ static int imx258_enum_frame_size(struct v4l2_subdev *sd,
>  				  struct v4l2_subdev_state *sd_state,
>  				  struct v4l2_subdev_frame_size_enum *fse)
>  {
> +	struct imx258 *imx258 = to_imx258(sd);
>  	if (fse->index >= ARRAY_SIZE(supported_modes))
>  		return -EINVAL;
>
> -	if (fse->code != MEDIA_BUS_FMT_SBGGR10_1X10)
> +	if (fse->code != imx258_get_format_code(imx258))
>  		return -EINVAL;
>
>  	fse->min_width = supported_modes[fse->index].width;
> @@ -976,12 +1016,13 @@ static int imx258_enum_frame_size(struct v4l2_subdev *sd,
>  	return 0;
>  }
>
> -static void imx258_update_pad_format(const struct imx258_mode *mode,
> +static void imx258_update_pad_format(struct imx258 *imx258,
> +				     const struct imx258_mode *mode,

Can't you get mode from imx258->cur_mode ?

>  				     struct v4l2_subdev_format *fmt)
>  {
>  	fmt->format.width = mode->width;
>  	fmt->format.height = mode->height;
> -	fmt->format.code = MEDIA_BUS_FMT_SBGGR10_1X10;
> +	fmt->format.code = imx258_get_format_code(imx258);
>  	fmt->format.field = V4L2_FIELD_NONE;
>  }
>
> @@ -994,7 +1035,7 @@ static int __imx258_get_pad_format(struct imx258 *imx258,
>  							  sd_state,
>  							  fmt->pad);
>  	else
> -		imx258_update_pad_format(imx258->cur_mode, fmt);
> +		imx258_update_pad_format(imx258, imx258->cur_mode, fmt);
>
>  	return 0;
>  }
> @@ -1030,13 +1071,12 @@ static int imx258_set_pad_format(struct v4l2_subdev *sd,
>
>  	mutex_lock(&imx258->mutex);
>
> -	/* Only one raw bayer(GBRG) order is supported */
> -	fmt->format.code = MEDIA_BUS_FMT_SBGGR10_1X10;
> +	fmt->format.code = imx258_get_format_code(imx258);
>
>  	mode = v4l2_find_nearest_size(supported_modes,
>  		ARRAY_SIZE(supported_modes), width, height,
>  		fmt->format.width, fmt->format.height);
> -	imx258_update_pad_format(mode, fmt);
> +	imx258_update_pad_format(imx258, mode, fmt);
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
>  		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
>  		*framefmt = fmt->format;
> @@ -1186,15 +1226,6 @@ static int imx258_start_streaming(struct imx258 *imx258)
>  		return ret;
>  	}
>
> -	/* Set Orientation be 180 degree */
> -	ret = imx258_write_reg(imx258, REG_MIRROR_FLIP_CONTROL,
> -			       IMX258_REG_VALUE_08BIT, REG_CONFIG_MIRROR_FLIP);
> -	if (ret) {
> -		dev_err(&client->dev, "%s failed to set orientation\n",
> -			__func__);
> -		return ret;
> -	}
> -
>  	/* Apply customized values from user */
>  	ret =  __v4l2_ctrl_handler_setup(imx258->sd.ctrl_handler);
>  	if (ret)
> @@ -1383,7 +1414,6 @@ static int imx258_init_controls(struct imx258 *imx258)
>  	struct i2c_client *client = v4l2_get_subdevdata(&imx258->sd);
>  	const struct imx258_link_freq_config *link_freq_cfgs;
>  	struct v4l2_fwnode_device_properties props;
> -	struct v4l2_ctrl *vflip, *hflip;
>  	struct v4l2_ctrl_handler *ctrl_hdlr;
>  	const struct imx258_link_cfg *link_cfg;
>  	s64 vblank_def;
> @@ -1408,16 +1438,15 @@ static int imx258_init_controls(struct imx258 *imx258)
>  	if (imx258->link_freq)
>  		imx258->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>
> -	/* The driver only supports one bayer order and flips by default. */
> -	hflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx258_ctrl_ops,
> -				  V4L2_CID_HFLIP, 1, 1, 1, 1);
> -	if (hflip)
> -		hflip->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +	imx258->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx258_ctrl_ops,
> +					  V4L2_CID_HFLIP, 0, 1, 1, 1);
> +	if (imx258->hflip)
> +		imx258->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>
> -	vflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx258_ctrl_ops,
> -				  V4L2_CID_VFLIP, 1, 1, 1, 1);
> -	if (vflip)
> -		vflip->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +	imx258->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx258_ctrl_ops,
> +					  V4L2_CID_VFLIP, 0, 1, 1, 1);
> +	if (imx258->vflip)
> +		imx258->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;

if flips are now writable, should they be enabled by default ?

>
>  	link_freq_cfgs = &imx258->link_freq_configs[0];
>  	link_cfg = link_freq_cfgs[imx258->lane_mode_idx].link_cfg;
> --
> 2.25.1
>
