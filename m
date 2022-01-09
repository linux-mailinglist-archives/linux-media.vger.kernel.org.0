Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 152B04888BC
	for <lists+linux-media@lfdr.de>; Sun,  9 Jan 2022 11:33:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231259AbiAIKdN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Jan 2022 05:33:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231151AbiAIKdN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Jan 2022 05:33:13 -0500
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97456C06173F;
        Sun,  9 Jan 2022 02:33:12 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id A47E3100005;
        Sun,  9 Jan 2022 10:33:09 +0000 (UTC)
Date:   Sun, 9 Jan 2022 11:34:09 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>
Subject: Re: [PATCH v2 07/11] media: i2c: max9286: Support 12-bit raw bayer
 formats
Message-ID: <20220109103409.dedytvxvchnar7m2@uno.localdomain>
References: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220101182806.19311-8-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220101182806.19311-8-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sat, Jan 01, 2022 at 08:28:02PM +0200, Laurent Pinchart wrote:
> Add support for 12-bit raw bayer formats to the driver, configuring the
> GMSL format accordingly.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/media/i2c/max9286.c | 128 ++++++++++++++++++++++++++----------
>  1 file changed, 95 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 576d9c6fac14..24c2bf4fda53 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -135,6 +135,11 @@
>  #define MAX9286_N_PADS			5
>  #define MAX9286_SRC_PAD			4
>
> +struct max9286_format_info {
> +	u32 code;
> +	u8 datatype;
> +};
> +
>  struct max9286_source {
>  	struct v4l2_subdev *sd;
>  	struct fwnode_handle *fwnode;
> @@ -214,6 +219,34 @@ static inline struct max9286_priv *sd_to_max9286(struct v4l2_subdev *sd)
>  	return container_of(sd, struct max9286_priv, sd);
>  }
>
> +static const struct max9286_format_info max9286_formats[] = {
> +	{
> +		.code = MEDIA_BUS_FMT_UYVY8_1X16,
> +		.datatype = MAX9286_DATATYPE_YUV422_8BIT,
> +	}, {
> +		.code = MEDIA_BUS_FMT_VYUY8_1X16,
> +		.datatype = MAX9286_DATATYPE_YUV422_8BIT,
> +	}, {
> +		.code = MEDIA_BUS_FMT_YUYV8_1X16,
> +		.datatype = MAX9286_DATATYPE_YUV422_8BIT,
> +	}, {
> +		.code = MEDIA_BUS_FMT_YVYU8_1X16,
> +		.datatype = MAX9286_DATATYPE_YUV422_8BIT,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.datatype = MAX9286_DATATYPE_RAW12,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.datatype = MAX9286_DATATYPE_RAW12,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
> +		.datatype = MAX9286_DATATYPE_RAW12,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.datatype = MAX9286_DATATYPE_RAW12,
> +	},
> +};
> +
>  /* -----------------------------------------------------------------------------
>   * I2C IO
>   */
> @@ -475,6 +508,38 @@ static int max9286_check_config_link(struct max9286_priv *priv,
>  	return 0;
>  }
>
> +static void max9286_set_video_format(struct max9286_priv *priv,
> +				     const struct v4l2_mbus_framefmt *format)
> +{
> +	const struct max9286_format_info *info = NULL;
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(max9286_formats); ++i) {
> +		if (max9286_formats[i].code == format->code) {
> +			info = &max9286_formats[i];
> +			break;
> +		}
> +	}
> +
> +	if (WARN_ON(!info))
> +		return;
> +
> +	/*
> +	 * Video format setup:
> +	 * Disable CSI output, VC is set according to Link number.
> +	 */
> +	max9286_write(priv, 0x15, MAX9286_VCTYPE | MAX9286_0X15_RESV);

I'm a bit scared about the fact settnig the video format disables the
CSI-2 output. But for the current usage pattern, it seems ok

> +
> +	/* Enable CSI-2 Lane D0-D3 only, DBL mode. */
> +	max9286_write(priv, 0x12, MAX9286_CSIDBL | MAX9286_DBL |
> +		      MAX9286_CSILANECNT(priv->csi2_data_lanes) |
> +		      info->datatype);
> +
> +	/* Enable HS/VS encoding, use D14/15 for HS/VS, invert VS. */
> +	max9286_write(priv, 0x0c, MAX9286_HVEN | MAX9286_INVVS |
> +		      MAX9286_HVSRC_D14);
> +}
> +
>  static void max9286_set_fsync_period(struct max9286_priv *priv)
>  {
>  	u32 fsync;
> @@ -693,6 +758,15 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
>  	int ret;
>
>  	if (enable) {
> +		const struct v4l2_mbus_framefmt *format;
> +
> +		/*
> +		 * Get the format from the first used sink pad, as all sink
> +		 * formats must be identical.
> +		 */
> +		format = &priv->fmt[__ffs(priv->bound_sources)];
> +
> +		max9286_set_video_format(priv, format);
>  		max9286_set_fsync_period(priv);
>
>  		/*
> @@ -813,22 +887,20 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
>  {
>  	struct max9286_priv *priv = sd_to_max9286(sd);
>  	struct v4l2_mbus_framefmt *cfg_fmt;
> +	unsigned int i;
>
>  	if (format->pad == MAX9286_SRC_PAD)
>  		return -EINVAL;
>
> -	/* Refuse non YUV422 formats as we hardcode DT to 8 bit YUV422 */
> -	switch (format->format.code) {
> -	case MEDIA_BUS_FMT_UYVY8_1X16:
> -	case MEDIA_BUS_FMT_VYUY8_1X16:
> -	case MEDIA_BUS_FMT_YUYV8_1X16:
> -	case MEDIA_BUS_FMT_YVYU8_1X16:
> -		break;
> -	default:
> -		format->format.code = MEDIA_BUS_FMT_UYVY8_1X16;
> -		break;
> +	/* Validate the format. */
> +	for (i = 0; i < ARRAY_SIZE(max9286_formats); ++i) {
> +		if (max9286_formats[i].code == format->format.code)
> +			break;
>  	}
>
> +	if (i == ARRAY_SIZE(max9286_formats))
> +		format->format.code = max9286_formats[i].code;

Isn't i past the end of the array now ?

> +
>  	cfg_fmt = max9286_get_pad_format(priv, sd_state, format->pad,
>  					 format->which);
>  	if (!cfg_fmt)
> @@ -886,16 +958,20 @@ static const struct v4l2_subdev_ops max9286_subdev_ops = {
>  	.pad		= &max9286_pad_ops,
>  };
>
> +static const struct v4l2_mbus_framefmt max9286_default_format = {
> +	.width		= 1280,
> +	.height		= 800,
> +	.code		= MEDIA_BUS_FMT_UYVY8_1X16,
> +	.colorspace	= V4L2_COLORSPACE_SRGB,
> +	.field		= V4L2_FIELD_NONE,
> +	.ycbcr_enc	= V4L2_YCBCR_ENC_DEFAULT,
> +	.quantization	= V4L2_QUANTIZATION_DEFAULT,
> +	.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
> +};
> +
>  static void max9286_init_format(struct v4l2_mbus_framefmt *fmt)
>  {
> -	fmt->width		= 1280;
> -	fmt->height		= 800;
> -	fmt->code		= MEDIA_BUS_FMT_UYVY8_1X16;
> -	fmt->colorspace		= V4L2_COLORSPACE_SRGB;
> -	fmt->field		= V4L2_FIELD_NONE;
> -	fmt->ycbcr_enc		= V4L2_YCBCR_ENC_DEFAULT;
> -	fmt->quantization	= V4L2_QUANTIZATION_DEFAULT;
> -	fmt->xfer_func		= V4L2_XFER_FUNC_DEFAULT;
> +	*fmt = max9286_default_format;
>  }
>
>  static int max9286_open(struct v4l2_subdev *subdev, struct v4l2_subdev_fh *fh)
> @@ -1054,23 +1130,9 @@ static int max9286_setup(struct max9286_priv *priv)
>  	max9286_write(priv, 0x0b, link_order[priv->route_mask]);
>  	max9286_write(priv, 0x69, (0xf & ~priv->route_mask));
>
> -	/*
> -	 * Video format setup:
> -	 * Disable CSI output, VC is set according to Link number.
> -	 */
> -	max9286_write(priv, 0x15, MAX9286_VCTYPE | MAX9286_0X15_RESV);
> -
> -	/* Enable CSI-2 Lane D0-D3 only, DBL mode, YUV422 8-bit. */
> -	max9286_write(priv, 0x12, MAX9286_CSIDBL | MAX9286_DBL |
> -		      MAX9286_CSILANECNT(priv->csi2_data_lanes) |
> -		      MAX9286_DATATYPE_YUV422_8BIT);
> -
> +	max9286_set_video_format(priv, &max9286_default_format);
>  	max9286_set_fsync_period(priv);
>
> -	/* Enable HS/VS encoding, use D14/15 for HS/VS, invert VS. */
> -	max9286_write(priv, 0x0c, MAX9286_HVEN | MAX9286_INVVS |
> -		      MAX9286_HVSRC_D14);
> -
>  	/*
>  	 * The overlap window seems to provide additional validation by tracking
>  	 * the delay between vsync and frame sync, generating an error if the
> --
> Regards,
>
> Laurent Pinchart
>
