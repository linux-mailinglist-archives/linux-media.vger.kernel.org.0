Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B523C67B2A4
	for <lists+linux-media@lfdr.de>; Wed, 25 Jan 2023 13:35:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235506AbjAYMfn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Jan 2023 07:35:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235497AbjAYMfm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Jan 2023 07:35:42 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 774E13754D
        for <linux-media@vger.kernel.org>; Wed, 25 Jan 2023 04:35:38 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 061776E0;
        Wed, 25 Jan 2023 13:35:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674650136;
        bh=XfEqXeU2vp6R/lYHIOAu5BtjjjyanRouLppUrV38ktA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WnPDCJv+J2w8uJtgXjs+wzfcZh9sRJuNS7CFT8eUras13SeNbGQoWb9tAEYx70tc1
         CtJ4/ZfEqSzoz9EhRGe3r2jdRDUtkPbUvLY/Gm314nQrNg8sE2r1Wm1kwYijZ4OXWU
         XXC/+hmwDe0h9wqJ8RNDlNE7Vt5JRg14S2yvrh2Y=
Date:   Wed, 25 Jan 2023 14:35:32 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Robert Mader <robert.mader@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/3] media: imx258: Parse and register properties
Message-ID: <Y9EiFOAETqsZZePq@pendragon.ideasonboard.com>
References: <20230117100603.51631-1-jacopo.mondi@ideasonboard.com>
 <20230117100603.51631-2-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230117100603.51631-2-jacopo.mondi@ideasonboard.com>
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

On Tue, Jan 17, 2023 at 11:06:01AM +0100, Jacopo Mondi wrote:
> From: Robert Mader <robert.mader@collabora.com>
> 
> Analogous to e.g. the imx219. This enables propagating
> V4L2_CID_CAMERA_ORIENTATION and V4L2_CID_CAMERA_SENSOR_ROTATION
> values.
> The motivation is to allow libcamera detect these values from the

s/detect/to detect/

> device tree and propagate them further to e.g. Pipewire.
> 
> While at it, reserve space for 3 additional controls even if
> v4l2_ctrl_new_fwnode_properties() can only register 2 of
> them, to fix the existing implementation which reserve space for 8
> controls but actually registers 9.
> 
> Signed-off-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ----
> Changes in v2:
>  - Reserve 11 instead of 10 controls
>  - Change order of variable declaration
>  - Slightly extend description
> ---
>  drivers/media/i2c/imx258.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index eab5fc1ee2f7..3b560865b657 100644
> --- a/drivers/media/i2c/imx258.c
> +++ b/drivers/media/i2c/imx258.c
> @@ -9,6 +9,7 @@
>  #include <linux/pm_runtime.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>
>  #include <asm/unaligned.h>
>  
>  #define IMX258_REG_VALUE_08BIT		1
> @@ -1148,6 +1149,7 @@ static const struct v4l2_subdev_internal_ops imx258_internal_ops = {
>  static int imx258_init_controls(struct imx258 *imx258)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(&imx258->sd);
> +	struct v4l2_fwnode_device_properties props;
>  	struct v4l2_ctrl_handler *ctrl_hdlr;
>  	s64 vblank_def;
>  	s64 vblank_min;
> @@ -1156,7 +1158,7 @@ static int imx258_init_controls(struct imx258 *imx258)
>  	int ret;
>  
>  	ctrl_hdlr = &imx258->ctrl_handler;
> -	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 8);
> +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 11);
>  	if (ret)
>  		return ret;
>  
> @@ -1232,6 +1234,15 @@ static int imx258_init_controls(struct imx258 *imx258)
>  		goto error;
>  	}
>  
> +	ret = v4l2_fwnode_device_parse(&client->dev, &props);
> +	if (ret)
> +		goto error;
> +
> +	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx258_ctrl_ops,
> +					      &props);
> +	if (ret)
> +		goto error;
> +
>  	imx258->sd.ctrl_handler = ctrl_hdlr;
>  
>  	return 0;

-- 
Regards,

Laurent Pinchart
