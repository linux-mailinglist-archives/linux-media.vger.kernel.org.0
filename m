Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D432C4D95F2
	for <lists+linux-media@lfdr.de>; Tue, 15 Mar 2022 09:14:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345763AbiCOIPO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Mar 2022 04:15:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237121AbiCOIPN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Mar 2022 04:15:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25FE727B29
        for <linux-media@vger.kernel.org>; Tue, 15 Mar 2022 01:14:02 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 021F1EE;
        Tue, 15 Mar 2022 09:13:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647332040;
        bh=uL7vkvN6RoFWZKuCo9GBqNyqMfqS48rNtStX3wI122g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ssdWfScE4b9hFaahym11EG0wX/HDM8EKLTCk4wruZINv7ODXtS7UAgnNy1MWSgdJx
         qW9S72daKkKxJVDwXvPEbaaHdJcKs/h+3VZ5u7L+rFJ6XAcyFGWsZkBQ+UA0QS3JBA
         VMpm5n/3K87M3tJBOmKHojKRCveszH3q14X3uI20=
Date:   Tue, 15 Mar 2022 10:13:43 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        krzysztof.kozlowski@canonical.com,
        jeanmichel.hautbois@ideasonboard.com,
        paul.kocialkowski@bootlin.com, sakari.ailus@iki.fi,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:OMNIVISION OV5670 SENSOR DRIVER" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 7/8] media: i2c: ov5670: Implement init_cfg
Message-ID: <YjBKtxTdwrf8cp+O@pendragon.ideasonboard.com>
References: <20220314162714.153970-1-jacopo@jmondi.org>
 <20220314162714.153970-8-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220314162714.153970-8-jacopo@jmondi.org>
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

On Mon, Mar 14, 2022 at 05:27:13PM +0100, Jacopo Mondi wrote:
> Implement the .init_cfg() pad operation and initialize the default
> format.
> 
> With .init_cfg() pad operation implemented the deprecated .open()
> internal operation can now be dropped.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/ov5670.c | 46 +++++++++++++++++---------------------
>  1 file changed, 20 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> index c3f773524d5f..9aa82774f8a6 100644
> --- a/drivers/media/i2c/ov5670.c
> +++ b/drivers/media/i2c/ov5670.c
> @@ -1958,27 +1958,6 @@ static int ov5670_write_reg_list(struct ov5670 *ov5670,
>  	return ov5670_write_regs(ov5670, r_list->regs, r_list->num_of_regs);
>  }
>  
> -/* Open sub-device */
> -static int ov5670_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> -{
> -	struct ov5670 *ov5670 = to_ov5670(sd);
> -	struct v4l2_mbus_framefmt *try_fmt =
> -				v4l2_subdev_get_try_format(sd, fh->state, 0);
> -
> -	mutex_lock(&ov5670->mutex);
> -
> -	/* Initialize try_fmt */
> -	try_fmt->width = ov5670->cur_mode->width;
> -	try_fmt->height = ov5670->cur_mode->height;
> -	try_fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> -	try_fmt->field = V4L2_FIELD_NONE;
> -
> -	/* No crop or compose */
> -	mutex_unlock(&ov5670->mutex);
> -
> -	return 0;
> -}
> -
>  static int ov5670_update_digital_gain(struct ov5670 *ov5670, u32 d_gain)
>  {
>  	int ret;
> @@ -2178,6 +2157,25 @@ static int ov5670_init_controls(struct ov5670 *ov5670)
>  	return ret;
>  }
>  
> +static int ov5670_init_cfg(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_mbus_framefmt *fmt =
> +				v4l2_subdev_get_try_format(sd, state, 0);
> +	const struct ov5670_mode *default_mode = &supported_modes[0];
> +
> +	fmt->width = default_mode->width;
> +	fmt->height = default_mode->height;
> +	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> +	fmt->field = V4L2_FIELD_NONE;
> +	fmt->colorspace = V4L2_COLORSPACE_SRGB;
> +	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(V4L2_COLORSPACE_SRGB);
> +	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> +	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_SRGB);
> +
> +	return 0;
> +}
> +
>  static int ov5670_enum_mbus_code(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *sd_state,
>  				 struct v4l2_subdev_mbus_code_enum *code)
> @@ -2499,6 +2497,7 @@ static const struct v4l2_subdev_video_ops ov5670_video_ops = {
>  };
>  
>  static const struct v4l2_subdev_pad_ops ov5670_pad_ops = {
> +	.init_cfg = ov5670_init_cfg,
>  	.enum_mbus_code = ov5670_enum_mbus_code,
>  	.get_fmt = ov5670_get_pad_format,
>  	.set_fmt = ov5670_set_pad_format,
> @@ -2520,10 +2519,6 @@ static const struct media_entity_operations ov5670_subdev_entity_ops = {
>  	.link_validate = v4l2_subdev_link_validate,
>  };
>  
> -static const struct v4l2_subdev_internal_ops ov5670_internal_ops = {
> -	.open = ov5670_open,
> -};
> -
>  static int ov5670_regulators_probe(struct ov5670 *ov5670)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(&ov5670->sd);
> @@ -2629,7 +2624,6 @@ static int ov5670_probe(struct i2c_client *client)
>  		goto error_mutex_destroy;
>  	}
>  
> -	ov5670->sd.internal_ops = &ov5670_internal_ops;
>  	ov5670->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
>  			    V4L2_SUBDEV_FL_HAS_EVENTS;
>  	ov5670->sd.entity.ops = &ov5670_subdev_entity_ops;

-- 
Regards,

Laurent Pinchart
