Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6EAE69EB38
	for <lists+linux-media@lfdr.de>; Wed, 22 Feb 2023 00:27:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbjBUX1B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 18:27:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjBUX1A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 18:27:00 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76A4230B2D
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 15:26:58 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2FB642B3;
        Wed, 22 Feb 2023 00:26:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677022016;
        bh=xu2EVD++Nqc8alR7ehHKf5hMStgnvnUJ7rOMW+CAiO0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XpCh/vJGdITuYncAjMhQBzP99+tLjn+HGp6MFMfFiEo5raWrH5hO6ckpgjolWuzbo
         fPASrq8sZOJl/tWYPQVFHSHKmLMkZ0YJ3tawojcOgkoCjClg6rYD6K4PhVAoMo1xcI
         3CNUq9/rntStJdGMxxgsPsgXxLQdgfFrNnb6ZhLI=
Date:   Wed, 22 Feb 2023 01:26:54 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Mikhail Rudenko <mike.rudenko@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>
Subject: Re: [PATCH v2 1/2] media: i2c: ov5647: Add test pattern control
Message-ID: <Y/VTPrhkWx1iZj0u@pendragon.ideasonboard.com>
References: <20230221171048.203042-1-jacopo.mondi@ideasonboard.com>
 <20230221171048.203042-2-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230221171048.203042-2-jacopo.mondi@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Feb 21, 2023 at 06:10:47PM +0100, Jacopo Mondi wrote:
> From: Valentine Barshak <valentine.barshak@cogentembedded.com>
> 
> This adds V4L2_CID_TEST_PATTERN control support.
> 
> Signed-off-by: Valentine Barshak <valentine.barshak@cogentembedded.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/ov5647.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 847a7bbb69c5..bde287e00c87 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -58,6 +58,7 @@
>  #define OV5647_REG_MIPI_CTRL00		0x4800
>  #define OV5647_REG_MIPI_CTRL14		0x4814
>  #define OV5647_REG_AWB			0x5001
> +#define OV5647_REG_ISPCTRL3D		0x503d
>  
>  #define REG_TERM 0xfffe
>  #define VAL_TERM 0xfe
> @@ -116,6 +117,20 @@ static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
>  	return container_of(sd, struct ov5647, sd);
>  }
>  
> +static const char * const ov5647_test_pattern_menu[] = {
> +	"Disabled",
> +	"Color Bars",
> +	"Color Squares",
> +	"Random Data",
> +};
> +
> +static u8 ov5647_test_pattern_val[] = {

static const

> +	0x00,	/* Disabled */
> +	0x80,	/* Color Bars */
> +	0x82,	/* Color Squares */
> +	0x81,	/* Random Data */
> +};
> +
>  static const struct regval_list sensor_oe_disable_regs[] = {
>  	{0x3000, 0x00},
>  	{0x3001, 0x00},
> @@ -1242,6 +1257,10 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
>  		ret = ov5647_write16(sd, OV5647_REG_VTS_HI,
>  				     sensor->mode->format.height + ctrl->val);
>  		break;
> +	case V4L2_CID_TEST_PATTERN:
> +		ret = ov5647_write(sd, OV5647_REG_ISPCTRL3D,
> +				   ov5647_test_pattern_val[ctrl->val]);
> +		break;
>  
>  	/* Read-only, but we adjust it based on mode. */
>  	case V4L2_CID_PIXEL_RATE:
> @@ -1270,7 +1289,7 @@ static int ov5647_init_controls(struct ov5647 *sensor)
>  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
>  	int hblank, exposure_max, exposure_def;
>  
> -	v4l2_ctrl_handler_init(&sensor->ctrls, 8);
> +	v4l2_ctrl_handler_init(&sensor->ctrls, 9);
>  
>  	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
>  			  V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
> @@ -1314,6 +1333,11 @@ static int ov5647_init_controls(struct ov5647 *sensor)
>  					   sensor->mode->vts -
>  					   sensor->mode->format.height);
>  
> +	v4l2_ctrl_new_std_menu_items(&sensor->ctrls, &ov5647_ctrl_ops,
> +				     V4L2_CID_TEST_PATTERN,
> +				     ARRAY_SIZE(ov5647_test_pattern_menu) - 1,
> +				     0, 0, ov5647_test_pattern_menu);
> +
>  	if (sensor->ctrls.error)
>  		goto handler_free;
>  

-- 
Regards,

Laurent Pinchart
