Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85347688990
	for <lists+linux-media@lfdr.de>; Thu,  2 Feb 2023 23:10:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232360AbjBBWKi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Feb 2023 17:10:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230144AbjBBWKh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Feb 2023 17:10:37 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3B56646BF
        for <linux-media@vger.kernel.org>; Thu,  2 Feb 2023 14:10:36 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3168F505;
        Thu,  2 Feb 2023 23:10:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675375835;
        bh=ZyVua0mlLbTbmFDbObfi6KZ9zebEcHYe1EDqr1c3QyU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c3glDZcTkeIB2+Va2ZvPySIh+EMCi15OpUKv6rkYcqt7RMXLwK0WYAXGluPQLVnME
         xhs48u+08wxGMBM1Q6mqAmT3m5eVOBM5hmlhU7Vd2PVtN36rDBzrckJdfEXoaaROf3
         rppJlX5s85JQyNfb8ne3rRwOw1JIR5ZOaRny0Z8o=
Date:   Fri, 3 Feb 2023 00:10:32 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 11/11] media: i2c: imx290: Add support for H & V Flips
Message-ID: <Y9w02OHdYDniISTB@pendragon.ideasonboard.com>
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
 <20230131192016.3476937-12-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230131192016.3476937-12-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_PDS_OTHER_BAD_TLD autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

Thank you for the patch.

On Tue, Jan 31, 2023 at 07:20:16PM +0000, Dave Stevenson wrote:
> The sensor supports H & V flips, so add the relevant hooks for
> V4L2_CID_HFLIP and V4L2_CID_VFLIP to configure them.
> 
> Note that the Bayer order is maintained as the readout area
> shifts by 1 pixel in the appropriate direction (note the
> comment about the top margin being 8 pixels whilst the bottom
> margin is 9).

That's why ! Now it makes sense to me.

> The V4L2_SEL_TGT_CROP region is therefore
> adjusted appropriately.

I'm not sure I like when sensors try to be clever... Out of curiosity,
do you know if this automatic shift of the crop rectangle can be
disabled ?

> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx290.c | 37 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 34 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 7f6746f74040..d2b7534f2c51 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -227,6 +227,8 @@ struct imx290 {
>  	struct v4l2_ctrl *hblank;
>  	struct v4l2_ctrl *vblank;
>  	struct v4l2_ctrl *exposure;
> +	struct v4l2_ctrl *hflip;
> +	struct v4l2_ctrl *vflip;
>  };
>  
>  static inline struct imx290 *to_imx290(struct v4l2_subdev *_sd)
> @@ -801,6 +803,24 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
>  				   NULL);
>  		break;
>  
> +	case V4L2_CID_HFLIP:
> +	case V4L2_CID_VFLIP:
> +	{
> +		u32 reg;
> +
> +		/* WINMODE is in bits [6:4], so need to read-modify-write */

You could also cache the value of the register in struct imx290 to avoid
the read.

> +		ret = imx290_read(imx290, IMX290_CTRL_07, &reg);
> +		if (ret)
> +			break;
> +		reg &= ~(IMX290_HREVERSE | IMX290_VREVERSE);
> +		if (imx290->hflip->val)
> +			reg |= IMX290_HREVERSE;
> +		if (imx290->vflip->val)
> +			reg |= IMX290_VREVERSE;
> +		ret = imx290_write(imx290, IMX290_CTRL_07, reg, NULL);
> +		break;

As you always write those two controls together, they should be put in a
cluster to have a single call to imx290_set_ctrl() when both are set in
the same VIDIOC_S_EXT_CTRLS call.

> +	}
> +
>  	default:
>  		ret = -EINVAL;
>  		break;
> @@ -853,7 +873,7 @@ static int imx290_ctrl_init(struct imx290 *imx290)
>  	if (ret < 0)
>  		return ret;
>  
> -	v4l2_ctrl_handler_init(&imx290->ctrls, 9);
> +	v4l2_ctrl_handler_init(&imx290->ctrls, 11);
>  
>  	/*
>  	 * The sensor has an analog gain and a digital gain, both controlled
> @@ -909,6 +929,11 @@ static int imx290_ctrl_init(struct imx290 *imx290)
>  	imx290->vblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
>  					   V4L2_CID_VBLANK, 1, 1, 1, 1);
>  
> +	imx290->hflip = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> +					  V4L2_CID_HFLIP, 0, 1, 1, 0);
> +	imx290->vflip = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> +					  V4L2_CID_VFLIP, 0, 1, 1, 0);
> +
>  	v4l2_ctrl_new_fwnode_properties(&imx290->ctrls, &imx290_ctrl_ops,
>  					&props);
>  
> @@ -1030,6 +1055,9 @@ static int imx290_set_stream(struct v4l2_subdev *sd, int enable)
>  		pm_runtime_put_autosuspend(imx290->dev);
>  	}
>  
> +	/* vflip and hflip cannot change during streaming */
> +	__v4l2_ctrl_grab(imx290->vflip, enable);
> +	__v4l2_ctrl_grab(imx290->hflip, enable);

A blank line would be nice.

>  unlock:
>  	v4l2_subdev_unlock_state(state);
>  	return ret;
> @@ -1115,6 +1143,7 @@ static int imx290_get_selection(struct v4l2_subdev *sd,
>  				struct v4l2_subdev_state *sd_state,
>  				struct v4l2_subdev_selection *sel)
>  {
> +	struct imx290 *imx290 = to_imx290(sd);
>  	struct v4l2_mbus_framefmt *format;
>  
>  	switch (sel->target) {
> @@ -1122,9 +1151,11 @@ static int imx290_get_selection(struct v4l2_subdev *sd,
>  		format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
>  

A comment to explain here why the crop rectangle is adjusted would be
nice.

>  		sel->r.top = IMX920_PIXEL_ARRAY_MARGIN_TOP
> -			   + (IMX290_PIXEL_ARRAY_RECORDING_HEIGHT - format->height) / 2;
> +			   + (IMX290_PIXEL_ARRAY_RECORDING_HEIGHT - format->height) / 2
> +			   + imx290->vflip->val;
>  		sel->r.left = IMX920_PIXEL_ARRAY_MARGIN_LEFT
> -			    + (IMX290_PIXEL_ARRAY_RECORDING_WIDTH - format->width) / 2;
> +			    + (IMX290_PIXEL_ARRAY_RECORDING_WIDTH - format->width) / 2
> +			    + imx290->hflip->val;
>  		sel->r.width = format->width;
>  		sel->r.height = format->height;
>  

-- 
Regards,

Laurent Pinchart
