Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A6F54971E5
	for <lists+linux-media@lfdr.de>; Sun, 23 Jan 2022 15:12:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236690AbiAWOMP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Jan 2022 09:12:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236678AbiAWOMP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Jan 2022 09:12:15 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1878C06173B;
        Sun, 23 Jan 2022 06:12:14 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD50825E;
        Sun, 23 Jan 2022 15:12:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642947133;
        bh=3E28DxXQd2YpY+sZM2BLQPQxG28x6f1iBlrrj7SfgFo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pN7eKy9knRx4cTdht1WKWjFbjysweZuidzyM8gZgZnhibPlg8Su8WgA06FKS4Dy1l
         +j8/EEwHFtn5Y4jP04PUUIXHmZefJdzUL3cg7dTsekJ69OAnN/iznTRbPZSmwtHhnc
         Cc/QaBTmgTBoq2ZH6ATvz/3Udekp2+gRirFfVDlY=
Date:   Sun, 23 Jan 2022 16:11:56 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        niklas.soderlund@ragnatech.se, kieran.bingham@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 08/13] media: rcar-csi2: Add support for
 v4l2_subdev_state
Message-ID: <Ye1iLKDWseZInfnR@pendragon.ideasonboard.com>
References: <20211017182449.64192-1-jacopo+renesas@jmondi.org>
 <20211017182449.64192-9-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211017182449.64192-9-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Sun, Oct 17, 2021 at 08:24:44PM +0200, Jacopo Mondi wrote:
> Create and initialize the v4l2_subdev_state for the R-Car CSI-2 receiver
> rder to prepare to support routing operations and multiplexed streams.

s/rder/in order/ ?

> 
> Create the subdevice state with v4l2_subdev_init_finalize() and
> implement the init_cfg() operation to guarantee the state is initialized
> correctly with a set of default routes.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 68 ++++++++++++++++++++-
>  1 file changed, 66 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index e28eff039688..a74087b49e71 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -752,11 +752,65 @@ static int rcsi2_get_pad_format(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int rcsi2_init_cfg(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_state *state)

This could be moved before rcsi2_set_pad_format() to match the order in
rcar_csi2_pad_ops. Up to you.

> +{
> +	/* Initialize 4 routes from each source pad to the single sink pad. */
> +	struct v4l2_subdev_route routes[] = {
> +		{
> +			.sink_pad = RCAR_CSI2_SINK,
> +			.sink_stream = 0,
> +			.source_pad = RCAR_CSI2_SOURCE_VC0,
> +			.source_stream = 0,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		},
> +		{
> +			.sink_pad = RCAR_CSI2_SINK,
> +			.sink_stream = 1,
> +			.source_pad = RCAR_CSI2_SOURCE_VC1,
> +			.source_stream = 0,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		},
> +		{
> +			.sink_pad = RCAR_CSI2_SINK,
> +			.sink_stream = 2,
> +			.source_pad = RCAR_CSI2_SOURCE_VC2,
> +			.source_stream = 0,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		},
> +		{
> +			.sink_pad = RCAR_CSI2_SINK,
> +			.sink_stream = 3,
> +			.source_pad = RCAR_CSI2_SOURCE_VC3,
> +			.source_stream = 0,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		},
> +	};
> +
> +	struct v4l2_subdev_krouting routing = {
> +		.num_routes = ARRAY_SIZE(routes),
> +		.routes = routes,
> +	};
> +
> +	int ret = v4l2_routing_simple_verify(&routing);
> +	if (ret)
> +		return ret;
> +
> +	state = v4l2_subdev_validate_and_lock_state(sd, state);
> +
> +	ret = v4l2_subdev_set_routing(sd, state, &routing);
> +
> +	v4l2_subdev_unlock_state(state);

I would squash this with 09/13 to avoid this intermediate state of
dealing with routes manually in the .init_cfg() operation. The patch
otherwise looks good to me.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
> +	return ret;
> +}
> +
>  static const struct v4l2_subdev_video_ops rcar_csi2_video_ops = {
>  	.s_stream = rcsi2_s_stream,
>  };
>  
>  static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
> +	.init_cfg = rcsi2_init_cfg,
>  	.set_fmt = rcsi2_set_pad_format,
>  	.get_fmt = rcsi2_get_pad_format,
>  };
> @@ -1260,7 +1314,8 @@ static int rcsi2_probe(struct platform_device *pdev)
>  	v4l2_set_subdevdata(&priv->subdev, &pdev->dev);
>  	snprintf(priv->subdev.name, V4L2_SUBDEV_NAME_SIZE, "%s %s",
>  		 KBUILD_MODNAME, dev_name(&pdev->dev));
> -	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
> +			     V4L2_SUBDEV_FL_MULTIPLEXED;
>  
>  	priv->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
>  	priv->subdev.entity.ops = &rcar_csi2_entity_ops;
> @@ -1276,14 +1331,22 @@ static int rcsi2_probe(struct platform_device *pdev)
>  
>  	pm_runtime_enable(&pdev->dev);
>  
> +	ret = v4l2_subdev_init_finalize(&priv->subdev);
> +	if (ret)
> +		goto error_pm;
> +
>  	ret = v4l2_async_register_subdev(&priv->subdev);
>  	if (ret < 0)
> -		goto error;
> +		goto error_subdev;
>  
>  	dev_info(priv->dev, "%d lanes found\n", priv->lanes);
>  
>  	return 0;
>  
> +error_subdev:
> +	v4l2_subdev_cleanup(&priv->subdev);
> +error_pm:
> +	pm_runtime_disable(&pdev->dev);
>  error:
>  	v4l2_async_notifier_unregister(&priv->notifier);
>  	v4l2_async_notifier_cleanup(&priv->notifier);
> @@ -1298,6 +1361,7 @@ static int rcsi2_remove(struct platform_device *pdev)
>  	v4l2_async_notifier_unregister(&priv->notifier);
>  	v4l2_async_notifier_cleanup(&priv->notifier);
>  	v4l2_async_unregister_subdev(&priv->subdev);
> +	v4l2_subdev_cleanup(&priv->subdev);
>  
>  	pm_runtime_disable(&pdev->dev);
>  

-- 
Regards,

Laurent Pinchart
