Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1D574B401
	for <lists+linux-media@lfdr.de>; Fri,  7 Jul 2023 17:20:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232909AbjGGPUq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jul 2023 11:20:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbjGGPUo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jul 2023 11:20:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75CE6AF
        for <linux-media@vger.kernel.org>; Fri,  7 Jul 2023 08:20:34 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-100-11-nat.elisa-mobile.fi [85.76.100.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1DD6F56D;
        Fri,  7 Jul 2023 17:19:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688743185;
        bh=Re5tsNE8YPcthxZU4l+S7fIXDrunonEsilzLtymD1oo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ueDe14LgUay3WzjOJ+Mi1z2ZnlNo5BjdsM1LSV5+hlzScH7Fzp5Vu4ZIS1fNDryII
         /WEV6mAhgdeqYJ5K3Q7qLk6/M2WZeBpRkwWMf9Sg4lMpwK+hGENLV02llx+gvsrS+t
         3LS2VCOV4ToLKeJBgyxovABusSv3CBjYdl0ZEjNo=
Date:   Fri, 7 Jul 2023 18:20:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Subject: Re: [PATCH 2/5] media: i2c: imx219: Switch from open to init_cfg
Message-ID: <20230707152027.GF15801@pendragon.ideasonboard.com>
References: <20230704103611.149631-1-jacopo.mondi@ideasonboard.com>
 <20230704104057.149837-1-jacopo.mondi@ideasonboard.com>
 <20230704104057.149837-3-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230704104057.149837-3-jacopo.mondi@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Jul 04, 2023 at 12:40:54PM +0200, Jacopo Mondi wrote:
> From: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> 
> Use the init_cfg pad level operation instead of the internal subdev
> open operation to set default formats on the pads.
> 
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/i2c/imx219.c | 58 +++++++++++++++++---------------------
>  1 file changed, 26 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 998a673a4290..191cb4a427cc 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -608,34 +608,6 @@ static void imx219_set_default_format(struct imx219 *imx219)
>  	fmt->field = V4L2_FIELD_NONE;
>  }
>  
> -static int imx219_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> -{
> -	struct imx219 *imx219 = to_imx219(sd);
> -	struct v4l2_mbus_framefmt *try_fmt =
> -		v4l2_subdev_get_try_format(sd, fh->state, 0);
> -	struct v4l2_rect *try_crop;
> -
> -	mutex_lock(&imx219->mutex);
> -
> -	/* Initialize try_fmt */
> -	try_fmt->width = supported_modes[0].width;
> -	try_fmt->height = supported_modes[0].height;
> -	try_fmt->code = imx219_get_format_code(imx219,
> -					       MEDIA_BUS_FMT_SRGGB10_1X10);
> -	try_fmt->field = V4L2_FIELD_NONE;
> -
> -	/* Initialize try_crop rectangle. */
> -	try_crop = v4l2_subdev_get_try_crop(sd, fh->state, 0);
> -	try_crop->top = IMX219_PIXEL_ARRAY_TOP;
> -	try_crop->left = IMX219_PIXEL_ARRAY_LEFT;
> -	try_crop->width = IMX219_PIXEL_ARRAY_WIDTH;
> -	try_crop->height = IMX219_PIXEL_ARRAY_HEIGHT;
> -
> -	mutex_unlock(&imx219->mutex);
> -
> -	return 0;
> -}
> -
>  static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct imx219 *imx219 =
> @@ -725,6 +697,31 @@ static const struct v4l2_ctrl_ops imx219_ctrl_ops = {
>  	.s_ctrl = imx219_set_ctrl,
>  };
>  
> +static int imx219_init_cfg(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_state *state)
> +{
> +	struct imx219 *imx219 = to_imx219(sd);
> +	struct v4l2_mbus_framefmt *format;
> +	struct v4l2_rect *try_crop;
> +
> +	/* Initialize try_fmt */
> +	format = v4l2_subdev_get_try_format(sd, state, 0);

This should be v4l2_subdev_get_pad_format(). The two functions are
identical, but v4l2_subdev_get_try_format() implies it access formats in
the try state only, while .init_cfg() will be used for the active state
too later in this series. The comment should also be updated, or just
dropped.

> +	format->width = supported_modes[0].width;
> +	format->height = supported_modes[0].height;
> +	format->code = imx219_get_format_code(imx219,
> +					      MEDIA_BUS_FMT_SRGGB10_1X10);
> +	format->field = V4L2_FIELD_NONE;
> +
> +	/* Initialize try_crop rectangle. */
> +	try_crop = v4l2_subdev_get_try_crop(sd, state, 0);

Same here, an the variable should be renamed to crop.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	try_crop->top = IMX219_PIXEL_ARRAY_TOP;
> +	try_crop->left = IMX219_PIXEL_ARRAY_LEFT;
> +	try_crop->width = IMX219_PIXEL_ARRAY_WIDTH;
> +	try_crop->height = IMX219_PIXEL_ARRAY_HEIGHT;
> +
> +	return 0;
> +}
> +
>  static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *sd_state,
>  				 struct v4l2_subdev_mbus_code_enum *code)
> @@ -1235,6 +1232,7 @@ static const struct v4l2_subdev_video_ops imx219_video_ops = {
>  };
>  
>  static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
> +	.init_cfg = imx219_init_cfg,
>  	.enum_mbus_code = imx219_enum_mbus_code,
>  	.get_fmt = imx219_get_pad_format,
>  	.set_fmt = imx219_set_pad_format,
> @@ -1248,9 +1246,6 @@ static const struct v4l2_subdev_ops imx219_subdev_ops = {
>  	.pad = &imx219_pad_ops,
>  };
>  
> -static const struct v4l2_subdev_internal_ops imx219_internal_ops = {
> -	.open = imx219_open,
> -};
>  
>  static unsigned long imx219_get_pixel_rate(struct imx219 *imx219)
>  {
> @@ -1509,7 +1504,6 @@ static int imx219_probe(struct i2c_client *client)
>  		goto error_power_off;
>  
>  	/* Initialize subdev */
> -	imx219->sd.internal_ops = &imx219_internal_ops;
>  	imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
>  			    V4L2_SUBDEV_FL_HAS_EVENTS;
>  	imx219->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;

-- 
Regards,

Laurent Pinchart
