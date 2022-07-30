Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 061D0585A3B
	for <lists+linux-media@lfdr.de>; Sat, 30 Jul 2022 13:21:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232770AbiG3LVb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Jul 2022 07:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231839AbiG3LVb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Jul 2022 07:21:31 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C651822520
        for <linux-media@vger.kernel.org>; Sat, 30 Jul 2022 04:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659180089; x=1690716089;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RfuXdxLJajDZ2ntW4BsOXiE1pFQSZ37JxvSJmgpE5Cg=;
  b=lnhY+zxWZP16grK4TgsI9wicM3jX87TCqMOuxsWzqI3urqiNg5BF85L4
   Pf/1rMGxnNeGNLubwE9QrlQJx/x7K7phYcjn8iobkKPxLKVFwOhq9oAXe
   69tFVVf2m+7PWMYI+SE5cq1Sf20OenBLLCDFTzIR4j0C9LZ7hoZ9upIQp
   fJeFwT5yfNfE20Y81DxSXVZigy/TkHhzc8Ydm55zbJtb+YpC3YlvthqQx
   cdvcB2CpmtHrK13pO82SipRQM+fKW8mzvtbxLNO0QNYh8FTknh14CE8xg
   Fh+e7JyI2jJ5s+AeHig0/11guswRuRgtEXeLPjU5lPT2eVWyflBuAvC6P
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10423"; a="314721774"
X-IronPort-AV: E=Sophos;i="5.93,204,1654585200"; 
   d="scan'208";a="314721774"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2022 04:21:29 -0700
X-IronPort-AV: E=Sophos;i="5.93,204,1654585200"; 
   d="scan'208";a="552005632"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2022 04:21:10 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id A7A04203C4;
        Sat, 30 Jul 2022 14:21:08 +0300 (EEST)
Date:   Sat, 30 Jul 2022 11:21:08 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v12 05/30] media: mc: entity: Add media_entity_pipeline()
 to access the media pipeline
Message-ID: <YuUUJCzM2HC7Tz++@paasikivi.fi.intel.com>
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
 <20220727103639.581567-6-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727103639.581567-6-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Wed, Jul 27, 2022 at 01:36:14PM +0300, Tomi Valkeinen wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Replace direct access to the pipe field in drivers with a new helper
> function. This will allow easier refactoring of media pipeline handling
> in the MC core behind the scenes without affecting drivers.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/mc/mc-entity.c                   |  6 ++++++
>  .../platform/renesas/rcar-vin/rcar-core.c      |  5 ++---
>  .../media/platform/renesas/rcar-vin/rcar-dma.c |  2 +-
>  drivers/media/platform/ti/omap3isp/isp.c       |  4 +---
>  drivers/media/platform/ti/omap3isp/ispvideo.c  |  3 +--
>  drivers/media/platform/ti/omap3isp/ispvideo.h  | 11 +++++++++--
>  drivers/media/platform/xilinx/xilinx-dma.c     |  3 +--
>  drivers/media/platform/xilinx/xilinx-dma.h     |  7 ++++++-
>  drivers/staging/media/imx/imx-media-utils.c    |  2 +-
>  drivers/staging/media/omap4iss/iss.c           |  4 +---
>  drivers/staging/media/omap4iss/iss_video.c     |  3 +--
>  drivers/staging/media/omap4iss/iss_video.h     | 11 +++++++++--
>  include/media/media-entity.h                   | 18 ++++++++++++++++++
>  13 files changed, 57 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 9f4a1c98dc43..50872d953cf9 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -923,6 +923,12 @@ int media_entity_get_fwnode_pad(struct media_entity *entity,
>  }
>  EXPORT_SYMBOL_GPL(media_entity_get_fwnode_pad);
>  
> +struct media_pipeline *media_entity_pipeline(struct media_entity *entity)
> +{
> +	return entity->pipe;

I'd make this an inline function. Or do you plan to add more code later?

> +}
> +EXPORT_SYMBOL_GPL(media_entity_pipeline);
> +
>  static void media_interface_init(struct media_device *mdev,
>  				 struct media_interface *intf,
>  				 u32 gobj_type,
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> index 49bdcfba010b..7b12af3ed8fb 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -786,9 +786,8 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
>  		return 0;
>  
>  	/*
> -	 * Don't allow link changes if any entity in the graph is
> -	 * streaming, modifying the CHSEL register fields can disrupt
> -	 * running streams.
> +	 * Don't allow link changes if any stream in the graph is active as
> +	 * modifying the CHSEL register fields can disrupt running streams.
>  	 */
>  	media_device_for_each_entity(entity, &group->mdev)
>  		if (media_entity_is_streaming(entity))
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> index 6644b498929d..924907b71263 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> @@ -1281,7 +1281,7 @@ static int rvin_set_stream(struct rvin_dev *vin, int on)
>  	 */
>  	mdev = vin->vdev.entity.graph_obj.mdev;
>  	mutex_lock(&mdev->graph_mutex);
> -	pipe = sd->entity.pipe ? sd->entity.pipe : &vin->vdev.pipe;
> +	pipe = media_entity_pipeline(&sd->entity) ? : &vin->vdev.pipe;
>  	ret = __media_pipeline_start(&vin->vdev.entity, pipe);
>  	mutex_unlock(&mdev->graph_mutex);
>  	if (ret)
> diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
> index 4c937f3f323e..2b5310b07bc3 100644
> --- a/drivers/media/platform/ti/omap3isp/isp.c
> +++ b/drivers/media/platform/ti/omap3isp/isp.c
> @@ -937,10 +937,8 @@ static int isp_pipeline_is_last(struct media_entity *me)
>  	struct isp_pipeline *pipe;
>  	struct media_pad *pad;
>  
> -	if (!me->pipe)
> -		return 0;
>  	pipe = to_isp_pipeline(me);
> -	if (pipe->stream_state == ISP_PIPELINE_STREAM_STOPPED)
> +	if (!pipe || pipe->stream_state == ISP_PIPELINE_STREAM_STOPPED)
>  		return 0;
>  	pad = media_entity_remote_pad(&pipe->output->pad);
>  	return pad->entity == me;
> diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
> index 8811d6dd4ee7..44b0d55ee5d8 100644
> --- a/drivers/media/platform/ti/omap3isp/ispvideo.c
> +++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
> @@ -1093,8 +1093,7 @@ isp_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
>  	/* Start streaming on the pipeline. No link touching an entity in the
>  	 * pipeline can be activated or deactivated once streaming is started.
>  	 */
> -	pipe = video->video.entity.pipe
> -	     ? to_isp_pipeline(&video->video.entity) : &video->pipe;
> +	pipe = to_isp_pipeline(&video->video.entity) ? : &video->pipe;
>  
>  	ret = media_entity_enum_init(&pipe->ent_enum, &video->isp->media_dev);
>  	if (ret)
> diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.h b/drivers/media/platform/ti/omap3isp/ispvideo.h
> index a0908670c0cf..1d23df576e6b 100644
> --- a/drivers/media/platform/ti/omap3isp/ispvideo.h
> +++ b/drivers/media/platform/ti/omap3isp/ispvideo.h
> @@ -99,8 +99,15 @@ struct isp_pipeline {
>  	unsigned int external_width;
>  };
>  
> -#define to_isp_pipeline(__e) \
> -	container_of((__e)->pipe, struct isp_pipeline, pipe)
> +static inline struct isp_pipeline *to_isp_pipeline(struct media_entity *entity)
> +{
> +	struct media_pipeline *pipe = media_entity_pipeline(entity);
> +
> +	if (!pipe)
> +		return NULL;
> +
> +	return container_of(pipe, struct isp_pipeline, pipe);
> +}
>  
>  static inline int isp_pipeline_ready(struct isp_pipeline *pipe)
>  {
> diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
> index 338c3661d809..72eff5ef626b 100644
> --- a/drivers/media/platform/xilinx/xilinx-dma.c
> +++ b/drivers/media/platform/xilinx/xilinx-dma.c
> @@ -402,8 +402,7 @@ static int xvip_dma_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	 * Use the pipeline object embedded in the first DMA object that starts
>  	 * streaming.
>  	 */
> -	pipe = dma->video.entity.pipe
> -	     ? to_xvip_pipeline(&dma->video.entity) : &dma->pipe;
> +	pipe = to_xvip_pipeline(&dma->video.entity) ? : &dma->pipe;
>  
>  	ret = media_pipeline_start(&dma->video.entity, &pipe->pipe);
>  	if (ret < 0)
> diff --git a/drivers/media/platform/xilinx/xilinx-dma.h b/drivers/media/platform/xilinx/xilinx-dma.h
> index 2378bdae57ae..3ea10f6b0bb9 100644
> --- a/drivers/media/platform/xilinx/xilinx-dma.h
> +++ b/drivers/media/platform/xilinx/xilinx-dma.h
> @@ -47,7 +47,12 @@ struct xvip_pipeline {
>  
>  static inline struct xvip_pipeline *to_xvip_pipeline(struct media_entity *e)
>  {
> -	return container_of(e->pipe, struct xvip_pipeline, pipe);
> +	struct media_pipeline *pipe = media_entity_pipeline(e);
> +
> +	if (!pipe)
> +		return NULL;
> +
> +	return container_of(pipe, struct xvip_pipeline, pipe);
>  }
>  
>  /**
> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
> index 94bc866ca28c..5d9c6fc6f2e0 100644
> --- a/drivers/staging/media/imx/imx-media-utils.c
> +++ b/drivers/staging/media/imx/imx-media-utils.c
> @@ -871,7 +871,7 @@ int imx_media_pipeline_set_stream(struct imx_media_dev *imxmd,
>  			__media_pipeline_stop(entity);
>  	} else {
>  		v4l2_subdev_call(sd, video, s_stream, 0);
> -		if (entity->pipe)
> +		if (media_entity_pipeline(entity))
>  			__media_pipeline_stop(entity);
>  	}
>  
> diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
> index 68588e9dab0b..77760d913b49 100644
> --- a/drivers/staging/media/omap4iss/iss.c
> +++ b/drivers/staging/media/omap4iss/iss.c
> @@ -548,10 +548,8 @@ static int iss_pipeline_is_last(struct media_entity *me)
>  	struct iss_pipeline *pipe;
>  	struct media_pad *pad;
>  
> -	if (!me->pipe)
> -		return 0;
>  	pipe = to_iss_pipeline(me);
> -	if (pipe->stream_state == ISS_PIPELINE_STREAM_STOPPED)
> +	if (!pipe || pipe->stream_state == ISS_PIPELINE_STREAM_STOPPED)
>  		return 0;
>  	pad = media_entity_remote_pad(&pipe->output->pad);
>  	return pad->entity == me;
> diff --git a/drivers/staging/media/omap4iss/iss_video.c b/drivers/staging/media/omap4iss/iss_video.c
> index d0da083deed5..67d63a400fa2 100644
> --- a/drivers/staging/media/omap4iss/iss_video.c
> +++ b/drivers/staging/media/omap4iss/iss_video.c
> @@ -870,8 +870,7 @@ iss_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
>  	 * Start streaming on the pipeline. No link touching an entity in the
>  	 * pipeline can be activated or deactivated once streaming is started.
>  	 */
> -	pipe = entity->pipe
> -	     ? to_iss_pipeline(entity) : &video->pipe;
> +	pipe = to_iss_pipeline(&video->video.entity) ? : &video->pipe;

s/&video->video\.//

>  	pipe->external = NULL;
>  	pipe->external_rate = 0;
>  	pipe->external_bpp = 0;
> diff --git a/drivers/staging/media/omap4iss/iss_video.h b/drivers/staging/media/omap4iss/iss_video.h
> index 526281bf0051..ca2d5edb6261 100644
> --- a/drivers/staging/media/omap4iss/iss_video.h
> +++ b/drivers/staging/media/omap4iss/iss_video.h
> @@ -90,8 +90,15 @@ struct iss_pipeline {
>  	int external_bpp;
>  };
>  
> -#define to_iss_pipeline(__e) \
> -	container_of((__e)->pipe, struct iss_pipeline, pipe)
> +static inline struct iss_pipeline *to_iss_pipeline(struct media_entity *entity)
> +{
> +	struct media_pipeline *pipe = media_entity_pipeline(entity);
> +
> +	if (!pipe)
> +		return NULL;
> +
> +	return container_of(pipe, struct iss_pipeline, pipe);
> +}
>  
>  static inline int iss_pipeline_ready(struct iss_pipeline *pipe)
>  {
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index 4e4fec60bf97..96f5fcda1985 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -883,6 +883,24 @@ static inline bool media_entity_is_streaming(const struct media_entity *entity)
>  	return entity->pipe;
>  }
>  
> +/**
> + * media_entity_pipeline - Get the media pipeline an entity is part of
> + * @entity: The entity
> + *
> + * This function returns the media pipeline that an entity has been associated
> + * with when constructing the pipeline with media_pipeline_start(). The pointer
> + * remains valid until media_pipeline_stop() is called.
> + *
> + * In general, entities can be part of multiple pipelines, when carrying
> + * multiple streams (either on different pads, or on the same pad using
> + * multiplexed streams). This function is ill-defined in that case. It
> + * currently returns the pipeline associated with the first pad of the entity.
> + *
> + * Return: The media_pipeline the entity is part of, or NULL if the entity is
> + * not part of any pipeline.
> + */
> +struct media_pipeline *media_entity_pipeline(struct media_entity *entity);
> +
>  /**
>   * media_entity_get_fwnode_pad - Get pad number from fwnode
>   *

-- 
Terveisin,

Sakari Ailus
