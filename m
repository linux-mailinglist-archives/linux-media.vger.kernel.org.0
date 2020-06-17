Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 930741FCA89
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 12:11:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbgFQKKi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 06:10:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48240 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbgFQKKh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 06:10:37 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9AC022BD;
        Wed, 17 Jun 2020 12:10:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592388634;
        bh=RXosiBLG9A7Vjdo0Lbr3hlYCSikPtOtgDL3nT6N1e1U=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=BC0gLQwxRnKk0DhyYnlffFlUzjGJYjjzfnKlWcot8ebKnSm2L4bbibgEwxq0YSsrC
         fgMBHSCX+Bclc5ddMITyLbDjE5wIwlSYf4248Fxhz3AqQPRV1/PizhUT4ZTcSq4boB
         gyc1b5l27FTU3ON8EuIJkRFtUi3P3VHe098qZs14=
Subject: Re: [PATCH v1 084/107] media: ti-vpe: cal: Create subdev for CAMERARX
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
 <20200614235944.17716-85-laurent.pinchart@ideasonboard.com>
Reply-To: kieran.bingham@ideasonboard.com
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <f8fb8096-4497-7108-9906-5a0b8b7c195f@ideasonboard.com>
Date:   Wed, 17 Jun 2020 11:10:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200614235944.17716-85-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 15/06/2020 00:59, Laurent Pinchart wrote:
> Create and register V4L2 sudbevs for the CAMERARX instances, and link

s/sudbevs/subdevs/

> them in the media graph to the sensors and video nodes. The subdev API
> is not exposed to userspace at this point, and no subdev operation is
> implemented, but the media controller graph is visible to applications.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal-camerarx.c | 42 +++++++++++++++++++-
>  drivers/media/platform/ti-vpe/cal-video.c    | 12 ++++++
>  drivers/media/platform/ti-vpe/cal.c          | 31 ++++++++++++---
>  drivers/media/platform/ti-vpe/cal.h          |  9 ++++-
>  4 files changed, 86 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
> index a7e4b81c9734..9be432ff87b2 100644
> --- a/drivers/media/platform/ti-vpe/cal-camerarx.c
> +++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
> @@ -526,8 +526,8 @@ static int cal_camerarx_regmap_init(struct cal_dev *cal,
>  static int cal_camerarx_parse_dt(struct cal_camerarx *phy)
>  {
>  	struct v4l2_fwnode_endpoint *endpoint = &phy->endpoint;
> -	struct device_node *ep_node;
>  	char data_lanes[V4L2_FWNODE_CSI2_MAX_DATA_LANES * 2];
> +	struct device_node *ep_node;
>  	unsigned int i;
>  	int ret;
>  
> @@ -571,7 +571,8 @@ static int cal_camerarx_parse_dt(struct cal_camerarx *phy)
>  		endpoint->bus.mipi_csi2.flags);
>  
>  	/* Retrieve the connected device and store it for later use. */
> -	phy->sensor_node = of_graph_get_remote_port_parent(ep_node);
> +	phy->sensor_ep_node = of_graph_get_remote_endpoint(ep_node);
> +	phy->sensor_node = of_graph_get_port_parent(phy->sensor_ep_node);
>  	if (!phy->sensor_node) {
>  		phy_dbg(3, phy, "Can't get remote parent\n");
>  		goto done;
> @@ -580,15 +581,30 @@ static int cal_camerarx_parse_dt(struct cal_camerarx *phy)
>  	phy_dbg(1, phy, "Found connected device %pOFn\n", phy->sensor_node);
>  
>  done:
> +	of_node_put(phy->sensor_ep_node);
>  	of_node_put(ep_node);
>  	return ret;
>  }
>  
> +/* ------------------------------------------------------------------
> + *	V4L2 Subdev Operations
> + * ------------------------------------------------------------------
> + */
> +
> +static const struct v4l2_subdev_ops cal_camerarx_subdev_ops = {
> +};
> +
> +/* ------------------------------------------------------------------
> + *	Create and Destroy
> + * ------------------------------------------------------------------
> + */
> +
>  struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>  					 unsigned int instance)
>  {
>  	struct platform_device *pdev = to_platform_device(cal->dev);
>  	struct cal_camerarx *phy;
> +	struct v4l2_subdev *sd;
>  	int ret;
>  
>  	phy = kzalloc(sizeof(*phy), GFP_KERNEL);
> @@ -620,9 +636,28 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>  	if (ret)
>  		goto error;
>  
> +	/* Initialize the V4L2 subdev and media entity. */
> +	sd = &phy->subdev;
> +	v4l2_subdev_init(sd, &cal_camerarx_subdev_ops);
> +	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> +	snprintf(sd->name, sizeof(sd->name), "CAMERARX%u", instance);
> +	sd->dev = cal->dev;
> +
> +	phy->pads[CAL_CAMERARX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
> +	phy->pads[CAL_CAMERARX_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&sd->entity, ARRAY_SIZE(phy->pads),
> +				     phy->pads);
> +	if (ret)
> +		goto error;
> +
> +	ret = v4l2_device_register_subdev(&cal->v4l2_dev, sd);
> +	if (ret)
> +		goto error;
> +
>  	return phy;
>  
>  error:
> +	media_entity_cleanup(&phy->subdev.entity);
>  	kfree(phy);
>  	return ERR_PTR(ret);
>  }
> @@ -632,6 +667,9 @@ void cal_camerarx_destroy(struct cal_camerarx *phy)
>  	if (!phy)
>  		return;
>  
> +	v4l2_device_unregister_subdev(&phy->subdev);
> +	media_entity_cleanup(&phy->subdev.entity);
> +	of_node_put(phy->sensor_ep_node);
>  	of_node_put(phy->sensor_node);
>  	kfree(phy);
>  }
> diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
> index df472a175e83..0a1a11692208 100644
> --- a/drivers/media/platform/ti-vpe/cal-video.c
> +++ b/drivers/media/platform/ti-vpe/cal-video.c
> @@ -809,6 +809,18 @@ int cal_ctx_v4l2_register(struct cal_ctx *ctx)
>  		return ret;
>  	}
>  
> +	ret = media_create_pad_link(&ctx->phy->subdev.entity,
> +				    CAL_CAMERARX_PAD_SOURCE,
> +				    &vfd->entity, 0,
> +				    MEDIA_LNK_FL_IMMUTABLE |
> +				    MEDIA_LNK_FL_ENABLED);
> +	if (ret) {
> +		ctx_err(ctx, "Failed to create media link for context %u\n",
> +			ctx->index);
> +		video_unregister_device(vfd);
> +		return ret;
> +	}
> +
>  	ctx_info(ctx, "V4L2 device registered as %s\n",
>  		 video_device_node_name(vfd));
>  
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index ca8576aa2646..bf1734d4d800 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -416,6 +416,8 @@ static int cal_async_notifier_bound(struct v4l2_async_notifier *notifier,
>  				    struct v4l2_async_subdev *asd)
>  {
>  	struct cal_camerarx *phy = to_cal_asd(asd)->phy;
> +	int pad;
> +	int ret;
>  
>  	if (phy->sensor) {
>  		phy_info(phy, "Rejecting subdev %s (Already set!!)",
> @@ -426,6 +428,25 @@ static int cal_async_notifier_bound(struct v4l2_async_notifier *notifier,
>  	phy->sensor = subdev;
>  	phy_dbg(1, phy, "Using sensor %s for capture\n", subdev->name);
>  
> +	pad = media_entity_get_fwnode_pad(&subdev->entity,
> +					  of_fwnode_handle(phy->sensor_ep_node),
> +					  MEDIA_PAD_FL_SOURCE);
> +	if (pad < 0) {
> +		phy_err(phy, "Sensor %s has no connected source pad\n",
> +			subdev->name);
> +		return pad;
> +	}
> +
> +	ret = media_create_pad_link(&subdev->entity, pad,
> +				    &phy->subdev.entity, CAL_CAMERARX_PAD_SINK,
> +				    MEDIA_LNK_FL_IMMUTABLE |
> +				    MEDIA_LNK_FL_ENABLED);
> +	if (ret) {
> +		phy_err(phy, "Failed to create media link for sensor %s\n",
> +			subdev->name);
> +		return ret;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -796,6 +817,11 @@ static int cal_probe(struct platform_device *pdev)
>  	cal_get_hwinfo(cal);
>  	pm_runtime_put_sync(&pdev->dev);
>  
> +	/* Initialize the media device. */
> +	ret = cal_media_init(cal);
> +	if (ret < 0)
> +		goto error_camerarx;

This code moves now uses the wrong error label.

Moreover, moving it - now means that the loop creating the CAMERARX PHYs
should now also cleanup the media device upon failure.

I have the following fixup patch which you could squash in here if you wish.


From e6fc5364d92d0ded26f3d8bb6c06a650fcb1ba84 Mon Sep 17 00:00:00 2001
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Tue, 16 Jun 2020 15:00:19 +0100
Subject: [PATCH] media: ti-vpe: cal: Fix error path jumps

The error paths in cal_probe() incorrectly called through the
error_camerarx before the camerarx instances were created, and neglected
to call the error_media/cal_media_cleanup() paths if a camera failed to
be created.

Tidy up the error paths, removing the now redundant error_media label.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c
b/drivers/media/platform/ti-vpe/cal.c
index caea3e129c87..d00dc241804b 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1026,14 +1026,14 @@ static int cal_probe(struct platform_device *pdev)
        /* Initialize the media device. */
        ret = cal_media_init(cal);
        if (ret < 0)
-               goto error_camerarx;
+               goto error_pm_runtime;

        /* Create CAMERARX PHYs. */
        for (i = 0; i < cal_data_get_num_csi2_phy(cal); ++i) {
                cal->phy[i] = cal_camerarx_create(cal, i);
                if (IS_ERR(cal->phy[i])) {
                        ret = PTR_ERR(cal->phy[i]);
-                       goto error_camerarx;
+                       goto error_media;
                }
        }

@@ -1063,8 +1063,6 @@ static int cal_probe(struct platform_device *pdev)

 error_media:
        cal_media_cleanup(cal);
-
-error_camerarx:
        for (i = 0; i < cal->data->num_csi2_phy; i++)
                cal_camerarx_destroy(cal->phy[i]);

-- 
2.25.1



With that fixed,

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>


> +
>  	/* Create CAMERARX PHYs. */
>  	for (i = 0; i < cal_data_get_num_csi2_phy(cal); ++i) {
>  		cal->phy[i] = cal_camerarx_create(cal, i);
> @@ -805,11 +831,6 @@ static int cal_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	/* Initialize the media device. */
> -	ret = cal_media_init(cal);
> -	if (ret < 0)
> -		goto error_camerarx;
> -
>  	/* Create contexts. */
>  	for (i = 0; i < cal_data_get_num_csi2_phy(cal); ++i)
>  		cal->ctx[i] = cal_ctx_create(cal, i);
> diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
> index cb167bfc2773..bf31dbf24523 100644
> --- a/drivers/media/platform/ti-vpe/cal.h
> +++ b/drivers/media/platform/ti-vpe/cal.h
> @@ -24,6 +24,7 @@
>  #include <media/v4l2-dev.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-fwnode.h>
> +#include <media/v4l2-subdev.h>
>  #include <media/videobuf2-v4l2.h>
>  
>  #define CAL_MODULE_NAME			"cal"
> @@ -33,12 +34,14 @@
>  #define MAX_WIDTH_BYTES			(8192 * 8)
>  #define MAX_HEIGHT_LINES		16383
>  
> +#define CAL_CAMERARX_PAD_SINK		0
> +#define CAL_CAMERARX_PAD_SOURCE		1
> +
>  struct device;
>  struct device_node;
>  struct resource;
>  struct regmap;
>  struct regmap_fied;
> -struct v4l2_subdev;
>  
>  /* CTRL_CORE_CAMERRX_CONTROL register field id */
>  enum cal_camerarx_field {
> @@ -108,8 +111,12 @@ struct cal_camerarx {
>  	unsigned int		instance;
>  
>  	struct v4l2_fwnode_endpoint	endpoint;
> +	struct device_node	*sensor_ep_node;
>  	struct device_node	*sensor_node;
>  	struct v4l2_subdev	*sensor;
> +
> +	struct v4l2_subdev	subdev;
> +	struct media_pad	pads[2];
>  };
>  
>  struct cal_dev {
> 


-- 
Regards
--
Kieran
