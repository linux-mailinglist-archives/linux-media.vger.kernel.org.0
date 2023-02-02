Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86C63687252
	for <lists+linux-media@lfdr.de>; Thu,  2 Feb 2023 01:29:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbjBBA36 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 19:29:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjBBA36 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 19:29:58 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE01B70D56
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 16:29:56 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59DBE505;
        Thu,  2 Feb 2023 01:29:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675297795;
        bh=Ij8mA0ZIFqBLJW3xfLSA0rZlgLF/Rm/1p4zchNyzEMg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JSgxnRE/9W0zA/L3Rb3RbYtTZK1lYOesru32J/bdnR2zIMrCKlOo8tM/cUhkoiZAW
         wNxVGdEQRUyp7g1d9iUClhLOdqhYTmT0Q/ewae3LhI5Tz6+hGhpu0u58/TaK2VsfMs
         nryYoxtMHsPJa6F9gT5sZqadGS7819bTBpNSt81k=
Date:   Thu, 2 Feb 2023 02:29:53 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 03/11] media: i2c: imx290: Add V4L2_SUBDEV_FL_HAS_EVENTS
 and subscribe hooks
Message-ID: <Y9sEAeQDXLJhbJEn@pendragon.ideasonboard.com>
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
 <20230131192016.3476937-4-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230131192016.3476937-4-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

Thank you for the patch.

On Tue, Jan 31, 2023 at 07:20:08PM +0000, Dave Stevenson wrote:
> Any V4L2 subdevice that implements controls and declares
> V4L2_SUBDEV_FL_HAS_DEVNODE should also declare V4L2_SUBDEV_FL_HAS_EVENTS
> and implement subscribe_event and unsubscribe_event hooks.
> 
> This driver didn't and would therefore fail v4l2-compliance
> testing.
> 
> Add the relevant hooks.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx290.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index bf96fd914303..12946ca9d8d2 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -20,6 +20,7 @@
>  #include <media/media-entity.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
> +#include <media/v4l2-event.h>
>  #include <media/v4l2-fwnode.h>
>  #include <media/v4l2-subdev.h>
>  
> @@ -977,6 +978,11 @@ static int imx290_entity_init_cfg(struct v4l2_subdev *subdev,
>  	return 0;
>  }
>  
> +static const struct v4l2_subdev_core_ops imx290_core_ops = {
> +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> +};
> +
>  static const struct v4l2_subdev_video_ops imx290_video_ops = {
>  	.s_stream = imx290_set_stream,
>  };
> @@ -991,6 +997,7 @@ static const struct v4l2_subdev_pad_ops imx290_pad_ops = {
>  };
>  
>  static const struct v4l2_subdev_ops imx290_subdev_ops = {
> +	.core = &imx290_core_ops,
>  	.video = &imx290_video_ops,
>  	.pad = &imx290_pad_ops,
>  };
> @@ -1009,7 +1016,8 @@ static int imx290_subdev_init(struct imx290 *imx290)
>  	imx290->current_mode = &imx290_modes_ptr(imx290)[0];
>  
>  	v4l2_i2c_subdev_init(&imx290->sd, client, &imx290_subdev_ops);
> -	imx290->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	imx290->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> +			    V4L2_SUBDEV_FL_HAS_EVENTS;
>  	imx290->sd.dev = imx290->dev;
>  	imx290->sd.entity.ops = &imx290_subdev_entity_ops;
>  	imx290->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;

-- 
Regards,

Laurent Pinchart
