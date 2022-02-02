Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEAB84A7AA2
	for <lists+linux-media@lfdr.de>; Wed,  2 Feb 2022 22:53:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347717AbiBBVvv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Feb 2022 16:51:51 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:35134 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiBBVvv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Feb 2022 16:51:51 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1284D88;
        Wed,  2 Feb 2022 22:51:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643838709;
        bh=vsKFk7SbG9cbKm9SuJgKuKFizWm3UggPYT6nEx5Zbcc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Zzr3ruD4Hgy0L3EBOkv6ucCXPsn4EqGcfF0Uq+Vqu2HBwkh/K0j6CpP48Wgy3sn/J
         dj1DG/+XUHH1dV5WexQ6bSsV3d7lGG/93J92kOAC9ER5gIKzME/tofb8UXhCDTLR5W
         +WUoKUJHEr8Gz2XSHd5Wf3FkNbrUgzjUl7ItZwLc=
Date:   Wed, 2 Feb 2022 23:51:26 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     slongerbeam@gmail.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        eugen.hristev@microchip.com, jbrunet@baylibre.com,
        mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 13/21] media: ov5640: Initialize try format
Message-ID: <Yfr83tmaJIvWJU5j@pendragon.ideasonboard.com>
References: <20220131143245.128089-1-jacopo@jmondi.org>
 <20220131144444.129036-1-jacopo@jmondi.org>
 <20220131144444.129036-2-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220131144444.129036-2-jacopo@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Jan 31, 2022 at 03:44:41PM +0100, Jacopo Mondi wrote:
> The TRY format is not initialized at device node open time.
> 
> Fix that by implementing the open() subdev internal function and
> initialize the TRY format there with the default sensor format.

The .open() operation is deprecated for this purpose. Could you please
use .init_cfg() instead ?

> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5640.c | 38 ++++++++++++++++++++++++++++----------
>  1 file changed, 28 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 2176fa0b8eae..762bdca83aec 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -354,6 +354,18 @@ static inline bool ov5640_is_mipi(struct ov5640_dev *sensor)
>   * over i2c.
>   */
>  /* YUV422 UYVY VGA@30fps */
> +
> +static struct v4l2_mbus_framefmt ov5640_default_fmt = {

static const

> +	.code = MEDIA_BUS_FMT_UYVY8_2X8,
> +	.width = 640,
> +	.height = 480,
> +	.colorspace = V4L2_COLORSPACE_SRGB,
> +	.ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(V4L2_COLORSPACE_SRGB),
> +	.quantization = V4L2_QUANTIZATION_FULL_RANGE,
> +	.xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_SRGB),
> +	.field = V4L2_FIELD_NONE,
> +};
> +
>  static const struct reg_value ov5640_init_setting[] = {
>  	{0x3103, 0x11, 0, 0}, {0x3008, 0x82, 0, 5}, {0x3008, 0x42, 0, 0},
>  	{0x3103, 0x03, 0, 0}, {0x3630, 0x36, 0, 0},
> @@ -3367,6 +3379,20 @@ static const struct v4l2_subdev_ops ov5640_subdev_ops = {
>  	.pad = &ov5640_pad_ops,
>  };
>  
> +static int ov5640_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +{
> +	struct v4l2_mbus_framefmt *try_fmt =

s/try_fmt/fmt/ (we should really drop the try_ prefix now that we have a
v4l2_subdev_state)

With these small issues fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		v4l2_subdev_get_try_format(sd, fh->state, 0);
> +
> +	*try_fmt = ov5640_default_fmt;
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_internal_ops ov5640_internal_ops = {
> +	.open = &ov5640_open,
> +};
> +
>  static int ov5640_get_regulators(struct ov5640_dev *sensor)
>  {
>  	int i;
> @@ -3412,7 +3438,6 @@ static int ov5640_probe(struct i2c_client *client)
>  	struct device *dev = &client->dev;
>  	struct fwnode_handle *endpoint;
>  	struct ov5640_dev *sensor;
> -	struct v4l2_mbus_framefmt *fmt;
>  	u32 rotation;
>  	int ret;
>  
> @@ -3426,15 +3451,7 @@ static int ov5640_probe(struct i2c_client *client)
>  	 * default init sequence initialize sensor to
>  	 * YUV422 UYVY VGA@30fps
>  	 */
> -	fmt = &sensor->fmt;
> -	fmt->code = MEDIA_BUS_FMT_UYVY8_2X8;
> -	fmt->colorspace = V4L2_COLORSPACE_SRGB;
> -	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
> -	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> -	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
> -	fmt->width = 640;
> -	fmt->height = 480;
> -	fmt->field = V4L2_FIELD_NONE;
> +	sensor->fmt = ov5640_default_fmt;
>  	sensor->frame_interval.numerator = 1;
>  	sensor->frame_interval.denominator = ov5640_framerates[OV5640_30_FPS];
>  	sensor->current_fr = OV5640_30_FPS;
> @@ -3510,6 +3527,7 @@ static int ov5640_probe(struct i2c_client *client)
>  
>  	v4l2_i2c_subdev_init(&sensor->sd, client, &ov5640_subdev_ops);
>  
> +	sensor->sd.internal_ops = &ov5640_internal_ops;
>  	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
>  			    V4L2_SUBDEV_FL_HAS_EVENTS;
>  	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;

-- 
Regards,

Laurent Pinchart
