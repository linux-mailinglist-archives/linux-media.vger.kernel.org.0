Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0D26CEF4A
	for <lists+linux-media@lfdr.de>; Wed, 29 Mar 2023 18:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbjC2QZw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Mar 2023 12:25:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbjC2QZv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Mar 2023 12:25:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31F9635B7
        for <linux-media@vger.kernel.org>; Wed, 29 Mar 2023 09:25:44 -0700 (PDT)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 174BBAD0;
        Wed, 29 Mar 2023 18:25:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1680107142;
        bh=WjLhBrLcxeGlPSrAr0GqvALrn8OcwCa6tho+fziDCDk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gGfcKHObzRFeOWVDIvEgZDs8+VEAiq3p91zEfzaFk6dysuUirT8aEEK6oqVs8PEuU
         C6Q6qXJ3+2x7U20R7LWUEsxsANueg1E9tpBOHvkd9/e/0LnJXqgQAjjvPuGxJ3nd5g
         4wxmjivIOIfvUZ5EIGRP6Dd8hXu5zCk+Kb6wwz6M=
Date:   Wed, 29 Mar 2023 18:25:37 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH 1/2] media: ccs: Align flipping behaviour with other
 drivers
Message-ID: <20230329162537.7t4aqbil7tr4htk2@uno.localdomain>
References: <20230328121625.1472037-1-sakari.ailus@linux.intel.com>
 <20230328121625.1472037-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230328121625.1472037-2-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On Tue, Mar 28, 2023 at 03:16:24PM +0300, Sakari Ailus wrote:
> No longer mirror flipping controls if the sensor is mounted upside down.
> Instead, change the default flip control values.
>
> This way the behaviour of the flipping controls and rotation of the sensor
> are aligned with the rest of the drivers.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ccs/ccs-core.c | 29 ++++-------------------------
>  drivers/media/i2c/ccs/ccs.h      |  1 -
>  2 files changed, 4 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 4a14d7e5d9f2..431dd7d24cdc 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -569,8 +569,6 @@ static u32 ccs_pixel_order(struct ccs_sensor *sensor)
>  			flip |= CCS_IMAGE_ORIENTATION_VERTICAL_FLIP;
>  	}
>
> -	flip ^= sensor->hvflip_inv_mask;
> -
>  	dev_dbg(&client->dev, "flip %u\n", flip);
>  	return sensor->default_pixel_order ^ flip;
>  }
> @@ -632,8 +630,6 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
>  		if (sensor->vflip->val)
>  			orient |= CCS_IMAGE_ORIENTATION_VERTICAL_FLIP;
>
> -		orient ^= sensor->hvflip_inv_mask;
> -
>  		ccs_update_mbus_formats(sensor);
>
>  		break;
> @@ -800,6 +796,8 @@ static const struct v4l2_ctrl_ops ccs_ctrl_ops = {
>  static int ccs_init_controls(struct ccs_sensor *sensor)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
> +	int default_flip sensor->hwcfg.module_board_orient ==

I think there's something wrong here :)

> +		CCS_MODULE_BOARD_ORIENT_180;

I would also be tempted to suggest dropping module_board_orient
completely and store the rotation value directly. But then you would
have to compare it to "180", "0" etc etc. Maybe it's not a good idea.

Or maybe instead of removing hvflip_inv_mask you could keep it and
remove module_board_orient instead, so that v and h flips can be
considered in isolation.

The rest of the patch looks good to me

Thanks
   j

>  	int rval;
>
>  	rval = v4l2_ctrl_handler_init(&sensor->pixel_array->ctrl_handler, 17);
> @@ -948,10 +946,10 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
>
>  	sensor->hflip = v4l2_ctrl_new_std(
>  		&sensor->pixel_array->ctrl_handler, &ccs_ctrl_ops,
> -		V4L2_CID_HFLIP, 0, 1, 1, 0);
> +		V4L2_CID_HFLIP, 0, 1, 1, default_flip);
>  	sensor->vflip = v4l2_ctrl_new_std(
>  		&sensor->pixel_array->ctrl_handler, &ccs_ctrl_ops,
> -		V4L2_CID_VFLIP, 0, 1, 1, 0);
> +		V4L2_CID_VFLIP, 0, 1, 1, default_flip);
>
>  	sensor->vblank = v4l2_ctrl_new_std(
>  		&sensor->pixel_array->ctrl_handler, &ccs_ctrl_ops,
> @@ -3437,25 +3435,6 @@ static int ccs_probe(struct i2c_client *client)
>  	if (rval < 0)
>  		goto out_free_ccs_limits;
>
> -	/*
> -	 * Handle Sensor Module orientation on the board.
> -	 *
> -	 * The application of H-FLIP and V-FLIP on the sensor is modified by
> -	 * the sensor orientation on the board.
> -	 *
> -	 * For CCS_BOARD_SENSOR_ORIENT_180 the default behaviour is to set
> -	 * both H-FLIP and V-FLIP for normal operation which also implies
> -	 * that a set/unset operation for user space HFLIP and VFLIP v4l2
> -	 * controls will need to be internally inverted.
> -	 *
> -	 * Rotation also changes the bayer pattern.
> -	 */
> -	if (sensor->hwcfg.module_board_orient ==
> -	    CCS_MODULE_BOARD_ORIENT_180)
> -		sensor->hvflip_inv_mask =
> -			CCS_IMAGE_ORIENTATION_HORIZONTAL_MIRROR |
> -			CCS_IMAGE_ORIENTATION_VERTICAL_FLIP;
> -
>  	rval = ccs_call_quirk(sensor, limits);
>  	if (rval) {
>  		dev_err(&client->dev, "limits quirks failed\n");
> diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
> index 6beac375cc48..ea8909f011d9 100644
> --- a/drivers/media/i2c/ccs/ccs.h
> +++ b/drivers/media/i2c/ccs/ccs.h
> @@ -243,7 +243,6 @@ struct ccs_sensor {
>  	u8 scale_m;
>  	u8 scaling_mode;
>
> -	u8 hvflip_inv_mask; /* H/VFLIP inversion due to sensor orientation */
>  	u8 frame_skip;
>  	u16 embedded_start; /* embedded data start line */
>  	u16 embedded_end;
> --
> 2.30.2
>
