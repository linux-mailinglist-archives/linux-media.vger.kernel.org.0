Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6B7220128C
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 17:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392739AbgFSPxD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 11:53:03 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34112 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405381AbgFSPw5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 11:52:57 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 66FD5552;
        Fri, 19 Jun 2020 17:52:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592581974;
        bh=GUrqTrgTVCr0RV+J3qDtcnq5Cs/2fiFp33b8pLyKc1A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wk7ogkGJFcA+/Cfzb+cg5IjOTqMdnlFTtwRWcDnq/c/WDClo52kLiGPnM6hK5ssHC
         wzSm2D7ngOM7SmKaZHRuK9Wta4TSvdI9pUdM+Y9VwlSNf1aHlhL50Y6mqg0dd77KiY
         x4jEWASea68IBoc25njHjHCrvdMuhgofJCGXixc8=
Date:   Fri, 19 Jun 2020 18:52:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: Re: [PATCH v1 084/107] media: ti-vpe: cal: Create subdev for CAMERARX
Message-ID: <20200619155230.GJ5823@pendragon.ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
 <20200614235944.17716-85-laurent.pinchart@ideasonboard.com>
 <f8fb8096-4497-7108-9906-5a0b8b7c195f@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f8fb8096-4497-7108-9906-5a0b8b7c195f@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Wed, Jun 17, 2020 at 11:10:32AM +0100, Kieran Bingham wrote:
> On 15/06/2020 00:59, Laurent Pinchart wrote:
> > Create and register V4L2 sudbevs for the CAMERARX instances, and link
> 
> s/sudbevs/subdevs/
> 
> > them in the media graph to the sensors and video nodes. The subdev API
> > is not exposed to userspace at this point, and no subdev operation is
> > implemented, but the media controller graph is visible to applications.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/platform/ti-vpe/cal-camerarx.c | 42 +++++++++++++++++++-
> >  drivers/media/platform/ti-vpe/cal-video.c    | 12 ++++++
> >  drivers/media/platform/ti-vpe/cal.c          | 31 ++++++++++++---
> >  drivers/media/platform/ti-vpe/cal.h          |  9 ++++-
> >  4 files changed, 86 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
> > index a7e4b81c9734..9be432ff87b2 100644
> > --- a/drivers/media/platform/ti-vpe/cal-camerarx.c
> > +++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
> > @@ -526,8 +526,8 @@ static int cal_camerarx_regmap_init(struct cal_dev *cal,
> >  static int cal_camerarx_parse_dt(struct cal_camerarx *phy)
> >  {
> >  	struct v4l2_fwnode_endpoint *endpoint = &phy->endpoint;
> > -	struct device_node *ep_node;
> >  	char data_lanes[V4L2_FWNODE_CSI2_MAX_DATA_LANES * 2];
> > +	struct device_node *ep_node;
> >  	unsigned int i;
> >  	int ret;
> >  
> > @@ -571,7 +571,8 @@ static int cal_camerarx_parse_dt(struct cal_camerarx *phy)
> >  		endpoint->bus.mipi_csi2.flags);
> >  
> >  	/* Retrieve the connected device and store it for later use. */
> > -	phy->sensor_node = of_graph_get_remote_port_parent(ep_node);
> > +	phy->sensor_ep_node = of_graph_get_remote_endpoint(ep_node);
> > +	phy->sensor_node = of_graph_get_port_parent(phy->sensor_ep_node);
> >  	if (!phy->sensor_node) {
> >  		phy_dbg(3, phy, "Can't get remote parent\n");
> >  		goto done;
> > @@ -580,15 +581,30 @@ static int cal_camerarx_parse_dt(struct cal_camerarx *phy)
> >  	phy_dbg(1, phy, "Found connected device %pOFn\n", phy->sensor_node);
> >  
> >  done:
> > +	of_node_put(phy->sensor_ep_node);
> >  	of_node_put(ep_node);
> >  	return ret;
> >  }
> >  
> > +/* ------------------------------------------------------------------
> > + *	V4L2 Subdev Operations
> > + * ------------------------------------------------------------------
> > + */
> > +
> > +static const struct v4l2_subdev_ops cal_camerarx_subdev_ops = {
> > +};
> > +
> > +/* ------------------------------------------------------------------
> > + *	Create and Destroy
> > + * ------------------------------------------------------------------
> > + */
> > +
> >  struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
> >  					 unsigned int instance)
> >  {
> >  	struct platform_device *pdev = to_platform_device(cal->dev);
> >  	struct cal_camerarx *phy;
> > +	struct v4l2_subdev *sd;
> >  	int ret;
> >  
> >  	phy = kzalloc(sizeof(*phy), GFP_KERNEL);
> > @@ -620,9 +636,28 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
> >  	if (ret)
> >  		goto error;
> >  
> > +	/* Initialize the V4L2 subdev and media entity. */
> > +	sd = &phy->subdev;
> > +	v4l2_subdev_init(sd, &cal_camerarx_subdev_ops);
> > +	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> > +	snprintf(sd->name, sizeof(sd->name), "CAMERARX%u", instance);
> > +	sd->dev = cal->dev;
> > +
> > +	phy->pads[CAL_CAMERARX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
> > +	phy->pads[CAL_CAMERARX_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
> > +	ret = media_entity_pads_init(&sd->entity, ARRAY_SIZE(phy->pads),
> > +				     phy->pads);
> > +	if (ret)
> > +		goto error;
> > +
> > +	ret = v4l2_device_register_subdev(&cal->v4l2_dev, sd);
> > +	if (ret)
> > +		goto error;
> > +
> >  	return phy;
> >  
> >  error:
> > +	media_entity_cleanup(&phy->subdev.entity);
> >  	kfree(phy);
> >  	return ERR_PTR(ret);
> >  }
> > @@ -632,6 +667,9 @@ void cal_camerarx_destroy(struct cal_camerarx *phy)
> >  	if (!phy)
> >  		return;
> >  
> > +	v4l2_device_unregister_subdev(&phy->subdev);
> > +	media_entity_cleanup(&phy->subdev.entity);
> > +	of_node_put(phy->sensor_ep_node);
> >  	of_node_put(phy->sensor_node);
> >  	kfree(phy);
> >  }
> > diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
> > index df472a175e83..0a1a11692208 100644
> > --- a/drivers/media/platform/ti-vpe/cal-video.c
> > +++ b/drivers/media/platform/ti-vpe/cal-video.c
> > @@ -809,6 +809,18 @@ int cal_ctx_v4l2_register(struct cal_ctx *ctx)
> >  		return ret;
> >  	}
> >  
> > +	ret = media_create_pad_link(&ctx->phy->subdev.entity,
> > +				    CAL_CAMERARX_PAD_SOURCE,
> > +				    &vfd->entity, 0,
> > +				    MEDIA_LNK_FL_IMMUTABLE |
> > +				    MEDIA_LNK_FL_ENABLED);
> > +	if (ret) {
> > +		ctx_err(ctx, "Failed to create media link for context %u\n",
> > +			ctx->index);
> > +		video_unregister_device(vfd);
> > +		return ret;
> > +	}
> > +
> >  	ctx_info(ctx, "V4L2 device registered as %s\n",
> >  		 video_device_node_name(vfd));
> >  
> > diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> > index ca8576aa2646..bf1734d4d800 100644
> > --- a/drivers/media/platform/ti-vpe/cal.c
> > +++ b/drivers/media/platform/ti-vpe/cal.c
> > @@ -416,6 +416,8 @@ static int cal_async_notifier_bound(struct v4l2_async_notifier *notifier,
> >  				    struct v4l2_async_subdev *asd)
> >  {
> >  	struct cal_camerarx *phy = to_cal_asd(asd)->phy;
> > +	int pad;
> > +	int ret;
> >  
> >  	if (phy->sensor) {
> >  		phy_info(phy, "Rejecting subdev %s (Already set!!)",
> > @@ -426,6 +428,25 @@ static int cal_async_notifier_bound(struct v4l2_async_notifier *notifier,
> >  	phy->sensor = subdev;
> >  	phy_dbg(1, phy, "Using sensor %s for capture\n", subdev->name);
> >  
> > +	pad = media_entity_get_fwnode_pad(&subdev->entity,
> > +					  of_fwnode_handle(phy->sensor_ep_node),
> > +					  MEDIA_PAD_FL_SOURCE);
> > +	if (pad < 0) {
> > +		phy_err(phy, "Sensor %s has no connected source pad\n",
> > +			subdev->name);
> > +		return pad;
> > +	}
> > +
> > +	ret = media_create_pad_link(&subdev->entity, pad,
> > +				    &phy->subdev.entity, CAL_CAMERARX_PAD_SINK,
> > +				    MEDIA_LNK_FL_IMMUTABLE |
> > +				    MEDIA_LNK_FL_ENABLED);
> > +	if (ret) {
> > +		phy_err(phy, "Failed to create media link for sensor %s\n",
> > +			subdev->name);
> > +		return ret;
> > +	}
> > +
> >  	return 0;
> >  }
> >  
> > @@ -796,6 +817,11 @@ static int cal_probe(struct platform_device *pdev)
> >  	cal_get_hwinfo(cal);
> >  	pm_runtime_put_sync(&pdev->dev);
> >  
> > +	/* Initialize the media device. */
> > +	ret = cal_media_init(cal);
> > +	if (ret < 0)
> > +		goto error_camerarx;
> 
> This code moves now uses the wrong error label.
> 
> Moreover, moving it - now means that the loop creating the CAMERARX PHYs
> should now also cleanup the media device upon failure.
> 
> I have the following fixup patch which you could squash in here if you wish.
> 
> 
> From e6fc5364d92d0ded26f3d8bb6c06a650fcb1ba84 Mon Sep 17 00:00:00 2001
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Date: Tue, 16 Jun 2020 15:00:19 +0100
> Subject: [PATCH] media: ti-vpe: cal: Fix error path jumps
> 
> The error paths in cal_probe() incorrectly called through the
> error_camerarx before the camerarx instances were created, and neglected
> to call the error_media/cal_media_cleanup() paths if a camera failed to
> be created.
> 
> Tidy up the error paths, removing the now redundant error_media label.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c
> b/drivers/media/platform/ti-vpe/cal.c
> index caea3e129c87..d00dc241804b 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -1026,14 +1026,14 @@ static int cal_probe(struct platform_device *pdev)
>         /* Initialize the media device. */
>         ret = cal_media_init(cal);
>         if (ret < 0)
> -               goto error_camerarx;
> +               goto error_pm_runtime;
> 
>         /* Create CAMERARX PHYs. */
>         for (i = 0; i < cal_data_get_num_csi2_phy(cal); ++i) {
>                 cal->phy[i] = cal_camerarx_create(cal, i);
>                 if (IS_ERR(cal->phy[i])) {
>                         ret = PTR_ERR(cal->phy[i]);
> -                       goto error_camerarx;
> +                       goto error_media;
>                 }
>         }
> 
> @@ -1063,8 +1063,6 @@ static int cal_probe(struct platform_device *pdev)
> 
>  error_media:
>         cal_media_cleanup(cal);
> -
> -error_camerarx:
>         for (i = 0; i < cal->data->num_csi2_phy; i++)
>                 cal_camerarx_destroy(cal->phy[i]);

Good catch. I'll fix the second issues slightly differently, by moving
cal_media_cleanup() below the cal_camerarx_destroy() loop, and keeping
the error_camerarx label, as it's best to perform cleanups in the
reverse order of the inits (unless there's a specific reason not to do
so).

> With that fixed,
> 
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Please let me know if you see problems in the proposed change, otherwise
I'll add your tag.

> > +
> >  	/* Create CAMERARX PHYs. */
> >  	for (i = 0; i < cal_data_get_num_csi2_phy(cal); ++i) {
> >  		cal->phy[i] = cal_camerarx_create(cal, i);
> > @@ -805,11 +831,6 @@ static int cal_probe(struct platform_device *pdev)
> >  		}
> >  	}
> >  
> > -	/* Initialize the media device. */
> > -	ret = cal_media_init(cal);
> > -	if (ret < 0)
> > -		goto error_camerarx;
> > -
> >  	/* Create contexts. */
> >  	for (i = 0; i < cal_data_get_num_csi2_phy(cal); ++i)
> >  		cal->ctx[i] = cal_ctx_create(cal, i);
> > diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
> > index cb167bfc2773..bf31dbf24523 100644
> > --- a/drivers/media/platform/ti-vpe/cal.h
> > +++ b/drivers/media/platform/ti-vpe/cal.h
> > @@ -24,6 +24,7 @@
> >  #include <media/v4l2-dev.h>
> >  #include <media/v4l2-device.h>
> >  #include <media/v4l2-fwnode.h>
> > +#include <media/v4l2-subdev.h>
> >  #include <media/videobuf2-v4l2.h>
> >  
> >  #define CAL_MODULE_NAME			"cal"
> > @@ -33,12 +34,14 @@
> >  #define MAX_WIDTH_BYTES			(8192 * 8)
> >  #define MAX_HEIGHT_LINES		16383
> >  
> > +#define CAL_CAMERARX_PAD_SINK		0
> > +#define CAL_CAMERARX_PAD_SOURCE		1
> > +
> >  struct device;
> >  struct device_node;
> >  struct resource;
> >  struct regmap;
> >  struct regmap_fied;
> > -struct v4l2_subdev;
> >  
> >  /* CTRL_CORE_CAMERRX_CONTROL register field id */
> >  enum cal_camerarx_field {
> > @@ -108,8 +111,12 @@ struct cal_camerarx {
> >  	unsigned int		instance;
> >  
> >  	struct v4l2_fwnode_endpoint	endpoint;
> > +	struct device_node	*sensor_ep_node;
> >  	struct device_node	*sensor_node;
> >  	struct v4l2_subdev	*sensor;
> > +
> > +	struct v4l2_subdev	subdev;
> > +	struct media_pad	pads[2];
> >  };
> >  
> >  struct cal_dev {

-- 
Regards,

Laurent Pinchart
