Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B09E84ADDE4
	for <lists+linux-media@lfdr.de>; Tue,  8 Feb 2022 17:02:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382648AbiBHQC6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Feb 2022 11:02:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382657AbiBHQC5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Feb 2022 11:02:57 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD82CC0613CA;
        Tue,  8 Feb 2022 08:02:53 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D889A04;
        Tue,  8 Feb 2022 17:02:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644336172;
        bh=0cc2//snbG0OnksSVHXbODbklqWF3sODe3pV7e7B780=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fimH7Afc9aZHjdF3QXgVtx/rzHZonxJMB0K3UjJIb4lCdubRwyHHvzil1LqR/IbBp
         fiPEWbRF0LB0TPdtlWPGnvz3DwZ7xXBlKC4+YLmwqEQAATGPd+KyaYDavj708ZnRYm
         a1UP8s2FKWh2lUj7hSwjs0/bWUsBgzgCFieOAG/0=
Date:   Tue, 8 Feb 2022 18:02:49 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Cc:     dave.stevenson@raspberrypi.com, devicetree@vger.kernel.org,
        kernel-list@raspberrypi.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org, lukasz@jany.st,
        mchehab@kernel.org, naush@raspberrypi.com, robh@kernel.org,
        tomi.valkeinen@ideasonboard.com,
        bcm-kernel-feedback-list@broadcom.com, stefan.wahren@i2se.com
Subject: Re: [PATCH v5 08/11] media: imx219: Switch from open to init_cfg
Message-ID: <YgKUKauDwCIBFovX@pendragon.ideasonboard.com>
References: <20220208155027.891055-1-jeanmichel.hautbois@ideasonboard.com>
 <20220208155027.891055-9-jeanmichel.hautbois@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220208155027.891055-9-jeanmichel.hautbois@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jean-Michel,

Thank you for the patch.

On Tue, Feb 08, 2022 at 04:50:24PM +0100, Jean-Michel Hautbois wrote:
> Use the init_cfg pad level operation instead of the internal subdev
> open operation to set default formats on the pads.
> While at it, make the imx219_pad_ops more easier to read.

It could have been useful to explain here why there's a separate
imx219_init_formats() function, as reviewers could wonder. It's clear
when reviewing the next patches though.

> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> ---
>  drivers/media/i2c/imx219.c | 63 +++++++++++++++-----------------------
>  1 file changed, 25 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 74dba5e61201..abcaee15c4a0 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -685,34 +685,6 @@ static void imx219_set_default_format(struct imx219 *imx219)
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

The crop rectangle initialization is removed here, but not added below.

> -
> -	mutex_unlock(&imx219->mutex);
> -
> -	return 0;
> -}
> -
>  static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct imx219 *imx219 =
> @@ -802,6 +774,25 @@ static const struct v4l2_ctrl_ops imx219_ctrl_ops = {
>  	.s_ctrl = imx219_set_ctrl,
>  };
>  
> +static void imx219_init_formats(struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_mbus_framefmt *format;
> +
> +	format = v4l2_state_get_stream_format(state, 0, 0);
> +	format->code = imx219_mbus_formats[0];
> +	format->width = supported_modes[0].width;
> +	format->height = supported_modes[0].height;
> +	format->field = V4L2_FIELD_NONE;
> +	format->colorspace = V4L2_COLORSPACE_RAW;
> +}
> +
> +static int imx219_init_cfg(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_state *state)
> +{
> +	imx219_init_formats(state);
> +	return 0;
> +}
> +
>  static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *sd_state,
>  				 struct v4l2_subdev_mbus_code_enum *code)
> @@ -1255,11 +1246,12 @@ static const struct v4l2_subdev_video_ops imx219_video_ops = {
>  };
>  
>  static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
> -	.enum_mbus_code = imx219_enum_mbus_code,
> -	.get_fmt = imx219_get_pad_format,
> -	.set_fmt = imx219_set_pad_format,
> -	.get_selection = imx219_get_selection,
> -	.enum_frame_size = imx219_enum_frame_size,
> +	.init_cfg		= imx219_init_cfg,
> +	.enum_mbus_code		= imx219_enum_mbus_code,
> +	.get_fmt		= imx219_get_pad_format,
> +	.set_fmt		= imx219_set_pad_format,
> +	.get_selection		= imx219_get_selection,
> +	.enum_frame_size	= imx219_enum_frame_size,
>  };
>  
>  static const struct v4l2_subdev_ops imx219_subdev_ops = {
> @@ -1268,10 +1260,6 @@ static const struct v4l2_subdev_ops imx219_subdev_ops = {
>  	.pad = &imx219_pad_ops,
>  };
>  
> -static const struct v4l2_subdev_internal_ops imx219_internal_ops = {
> -	.open = imx219_open,
> -};
> -
>  /* Initialize control handlers */
>  static int imx219_init_controls(struct imx219 *imx219)
>  {
> @@ -1520,7 +1508,6 @@ static int imx219_probe(struct i2c_client *client)
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
