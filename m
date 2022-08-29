Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3AF85A5302
	for <lists+linux-media@lfdr.de>; Mon, 29 Aug 2022 19:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbiH2RVh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Aug 2022 13:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbiH2RVe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Aug 2022 13:21:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7796B7B29C
        for <linux-media@vger.kernel.org>; Mon, 29 Aug 2022 10:21:33 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0BFCC505;
        Mon, 29 Aug 2022 19:21:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661793691;
        bh=2+LkbWbfuIF2/Y8u1dX3H91z3eq/A9zyEuR5GPbvVgQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Mhu/pFY9Z7+BmGswrfcc2tZKowvIzMnUZkUaSWQjIOnOo4v3Q33F+FyeV6/HJZarL
         h6ar/07PRw0MUWeI/BcdOtTBDmsIn3m4Sf1jWfs1gurHzBd3X1z0iEg8x4MrYfYZPy
         sGEROKlRJ6PMNgocu3326lWYnbHfG+79pVWskkcw=
Date:   Mon, 29 Aug 2022 20:21:22 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v13 16/34] media: mc: convert pipeline funcs to take
 media_pad
Message-ID: <Ywz1kiDmrm0HWeBQ@pendragon.ideasonboard.com>
References: <20220810121122.3149086-1-tomi.valkeinen@ideasonboard.com>
 <20220810121122.3149086-17-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220810121122.3149086-17-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Wed, Aug 10, 2022 at 03:11:04PM +0300, Tomi Valkeinen wrote:
> Now that the pipeline is stored into pads instead of entities, we can
> change the relevant functions to take pads instead of entities.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/mc/mc-entity.c                  | 40 ++++++++-----------
>  .../samsung/s3c-camif/camif-capture.c         |  6 +--
>  drivers/media/usb/au0828/au0828-core.c        |  8 ++--
>  drivers/media/v4l2-core/v4l2-dev.c            | 12 +++---
>  drivers/staging/media/imx/imx-media-utils.c   |  6 +--
>  include/media/media-entity.h                  | 28 ++++++-------
>  6 files changed, 46 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index c89dc782840a..ce72ee749fe6 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -699,29 +699,21 @@ static int media_pipeline_populate(struct media_pipeline *pipe,
>  	return ret;
>  }
>  
> -__must_check int __media_pipeline_start(struct media_entity *entity,
> +__must_check int __media_pipeline_start(struct media_pad *pad,
>  					struct media_pipeline *pipe)
>  {
> -	struct media_device *mdev = entity->graph_obj.mdev;
> +	struct media_device *mdev = pad->entity->graph_obj.mdev;
>  	struct media_pipeline_pad *err_ppad;
>  	struct media_pipeline_pad *ppad;
>  	int ret;
>  
>  	lockdep_assert_held(&mdev->graph_mutex);
>  
> -	/*
> -	 * media_pipeline_start(entity) only makes sense with entities that have
> -	 * a single pad.
> -	 */
> -
> -	if (WARN_ON(entity->num_pads != 1))
> -		return -EINVAL;
> -
>  	/*
>  	 * If the entity is already part of a pipeline, that pipeline must
>  	 * be the same as the pipe given to media_pipeline_start().
>  	 */
> -	if (WARN_ON(entity->pads->pipe && entity->pads->pipe != pipe))
> +	if (WARN_ON(pad->pipe && pad->pipe != pipe))
>  		return -EINVAL;
>  
>  	/*
> @@ -738,7 +730,7 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
>  	 * with media_pipeline_pad instances for each pad found during graph
>  	 * walk.
>  	 */
> -	ret = media_pipeline_populate(pipe, entity->pads);
> +	ret = media_pipeline_populate(pipe, pad);
>  	if (ret)
>  		return ret;
>  
> @@ -855,22 +847,22 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
>  }
>  EXPORT_SYMBOL_GPL(__media_pipeline_start);
>  
> -__must_check int media_pipeline_start(struct media_entity *entity,
> +__must_check int media_pipeline_start(struct media_pad *pad,
>  				      struct media_pipeline *pipe)
>  {
> -	struct media_device *mdev = entity->graph_obj.mdev;
> +	struct media_device *mdev = pad->entity->graph_obj.mdev;
>  	int ret;
>  
>  	mutex_lock(&mdev->graph_mutex);
> -	ret = __media_pipeline_start(entity, pipe);
> +	ret = __media_pipeline_start(pad, pipe);
>  	mutex_unlock(&mdev->graph_mutex);
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(media_pipeline_start);
>  
> -void __media_pipeline_stop(struct media_entity *entity)
> +void __media_pipeline_stop(struct media_pad *pad)
>  {
> -	struct media_pipeline *pipe = entity->pads->pipe;
> +	struct media_pipeline *pipe = pad->pipe;
>  	struct media_pipeline_pad *ppad;
>  
>  	/*
> @@ -893,19 +885,19 @@ void __media_pipeline_stop(struct media_entity *entity)
>  }
>  EXPORT_SYMBOL_GPL(__media_pipeline_stop);
>  
> -void media_pipeline_stop(struct media_entity *entity)
> +void media_pipeline_stop(struct media_pad *pad)
>  {
> -	struct media_device *mdev = entity->graph_obj.mdev;
> +	struct media_device *mdev = pad->entity->graph_obj.mdev;
>  
>  	mutex_lock(&mdev->graph_mutex);
> -	__media_pipeline_stop(entity);
> +	__media_pipeline_stop(pad);
>  	mutex_unlock(&mdev->graph_mutex);
>  }
>  EXPORT_SYMBOL_GPL(media_pipeline_stop);
>  
> -__must_check int media_pipeline_alloc_start(struct media_entity *entity)
> +__must_check int media_pipeline_alloc_start(struct media_pad *pad)
>  {
> -	struct media_device *mdev = entity->graph_obj.mdev;
> +	struct media_device *mdev = pad->entity->graph_obj.mdev;
>  	struct media_pipeline *pipe;
>  	int ret;
>  	bool new_pipe = false;
> @@ -916,7 +908,7 @@ __must_check int media_pipeline_alloc_start(struct media_entity *entity)
>  	 * Is the entity already part of a pipeline? If not, we need to allocate
>  	 * a pipe.
>  	 */
> -	pipe = media_entity_pipeline(entity);
> +	pipe = media_pad_pipeline(pad);
>  	if (!pipe) {
>  		pipe = kzalloc(sizeof(*pipe), GFP_KERNEL);
>  
> @@ -929,7 +921,7 @@ __must_check int media_pipeline_alloc_start(struct media_entity *entity)
>  		pipe->allocated = true;
>  	}
>  
> -	ret = __media_pipeline_start(entity, pipe);
> +	ret = __media_pipeline_start(pad, pipe);
>  	if (ret) {
>  		if (new_pipe)
>  			kfree(pipe);
> diff --git a/drivers/media/platform/samsung/s3c-camif/camif-capture.c b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
> index 140854ab4dd8..0189b8a33032 100644
> --- a/drivers/media/platform/samsung/s3c-camif/camif-capture.c
> +++ b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
> @@ -848,13 +848,13 @@ static int s3c_camif_streamon(struct file *file, void *priv,
>  	if (s3c_vp_active(vp))
>  		return 0;
>  
> -	ret = media_pipeline_start(sensor, camif->m_pipeline);
> +	ret = media_pipeline_start(sensor->pads, camif->m_pipeline);
>  	if (ret < 0)
>  		return ret;
>  
>  	ret = camif_pipeline_validate(camif);
>  	if (ret < 0) {
> -		media_pipeline_stop(sensor);
> +		media_pipeline_stop(sensor->pads);
>  		return ret;
>  	}
>  
> @@ -878,7 +878,7 @@ static int s3c_camif_streamoff(struct file *file, void *priv,
>  
>  	ret = vb2_streamoff(&vp->vb_queue, type);
>  	if (ret == 0)
> -		media_pipeline_stop(&camif->sensor.sd->entity);
> +		media_pipeline_stop(camif->sensor.sd->entity.pads);
>  	return ret;
>  }
>  
> diff --git a/drivers/media/usb/au0828/au0828-core.c b/drivers/media/usb/au0828/au0828-core.c
> index caefac07af92..877e85a451cb 100644
> --- a/drivers/media/usb/au0828/au0828-core.c
> +++ b/drivers/media/usb/au0828/au0828-core.c
> @@ -410,7 +410,7 @@ static int au0828_enable_source(struct media_entity *entity,
>  		goto end;
>  	}
>  
> -	ret = __media_pipeline_start(entity, pipe);
> +	ret = __media_pipeline_start(entity->pads, pipe);
>  	if (ret) {
>  		pr_err("Start Pipeline: %s->%s Error %d\n",
>  			source->name, entity->name, ret);
> @@ -501,12 +501,12 @@ static void au0828_disable_source(struct media_entity *entity)
>  				return;
>  
>  			/* stop pipeline */
> -			__media_pipeline_stop(dev->active_link_owner);
> +			__media_pipeline_stop(dev->active_link_owner->pads);
>  			pr_debug("Pipeline stop for %s\n",
>  				dev->active_link_owner->name);
>  
>  			ret = __media_pipeline_start(
> -					dev->active_link_user,
> +					dev->active_link_user->pads,
>  					dev->active_link_user_pipe);
>  			if (ret) {
>  				pr_err("Start Pipeline: %s->%s %d\n",
> @@ -532,7 +532,7 @@ static void au0828_disable_source(struct media_entity *entity)
>  			return;
>  
>  		/* stop pipeline */
> -		__media_pipeline_stop(dev->active_link_owner);
> +		__media_pipeline_stop(dev->active_link_owner->pads);
>  		pr_debug("Pipeline stop for %s\n",
>  			dev->active_link_owner->name);
>  
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index 945bb867a4c1..397d553177fa 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -1105,7 +1105,7 @@ __must_check int video_device_pipeline_start(struct video_device *vdev,
>  	if (entity->num_pads != 1)
>  		return -ENODEV;
>  
> -	return media_pipeline_start(entity, pipe);
> +	return media_pipeline_start(&entity->pads[0], pipe);
>  }
>  EXPORT_SYMBOL_GPL(video_device_pipeline_start);
>  
> @@ -1117,7 +1117,7 @@ __must_check int __video_device_pipeline_start(struct video_device *vdev,
>  	if (entity->num_pads != 1)
>  		return -ENODEV;
>  
> -	return __media_pipeline_start(entity, pipe);
> +	return __media_pipeline_start(&entity->pads[0], pipe);
>  }
>  EXPORT_SYMBOL_GPL(__video_device_pipeline_start);
>  
> @@ -1128,7 +1128,7 @@ void video_device_pipeline_stop(struct video_device *vdev)
>  	if (WARN_ON(entity->num_pads != 1))
>  		return;
>  
> -	return media_pipeline_stop(entity);
> +	return media_pipeline_stop(&entity->pads[0]);
>  }
>  EXPORT_SYMBOL_GPL(video_device_pipeline_stop);
>  
> @@ -1139,7 +1139,7 @@ void __video_device_pipeline_stop(struct video_device *vdev)
>  	if (WARN_ON(entity->num_pads != 1))
>  		return;
>  
> -	return __media_pipeline_stop(entity);
> +	return __media_pipeline_stop(&entity->pads[0]);
>  }
>  EXPORT_SYMBOL_GPL(__video_device_pipeline_stop);
>  
> @@ -1150,7 +1150,7 @@ __must_check int video_device_pipeline_alloc_start(struct video_device *vdev)
>  	if (entity->num_pads != 1)
>  		return -ENODEV;
>  
> -	return media_pipeline_alloc_start(entity);
> +	return media_pipeline_alloc_start(&entity->pads[0]);
>  }
>  EXPORT_SYMBOL_GPL(video_device_pipeline_alloc_start);
>  
> @@ -1161,7 +1161,7 @@ struct media_pipeline *video_device_pipeline(struct video_device *vdev)
>  	if (WARN_ON(entity->num_pads != 1))
>  		return NULL;
>  
> -	return media_entity_pipeline(entity);
> +	return media_pad_pipeline(&entity->pads[0]);
>  }
>  EXPORT_SYMBOL_GPL(video_device_pipeline);
>  
> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
> index 5d9c6fc6f2e0..3d785b4e8fe7 100644
> --- a/drivers/staging/media/imx/imx-media-utils.c
> +++ b/drivers/staging/media/imx/imx-media-utils.c
> @@ -863,16 +863,16 @@ int imx_media_pipeline_set_stream(struct imx_media_dev *imxmd,
>  	mutex_lock(&imxmd->md.graph_mutex);
>  
>  	if (on) {
> -		ret = __media_pipeline_start(entity, &imxmd->pipe);
> +		ret = __media_pipeline_start(entity->pads, &imxmd->pipe);
>  		if (ret)
>  			goto out;
>  		ret = v4l2_subdev_call(sd, video, s_stream, 1);
>  		if (ret)
> -			__media_pipeline_stop(entity);
> +			__media_pipeline_stop(entity->pads);
>  	} else {
>  		v4l2_subdev_call(sd, video, s_stream, 0);
>  		if (media_entity_pipeline(entity))
> -			__media_pipeline_stop(entity);
> +			__media_pipeline_stop(entity->pads);
>  	}
>  
>  out:
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index beea3f6f12b8..f738d0d81194 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -1048,10 +1048,10 @@ struct media_entity *media_graph_walk_next(struct media_graph *graph);
>  
>  /**
>   * media_pipeline_start - Mark a pipeline as streaming
> - * @entity: Starting entity
> - * @pipe: Media pipeline to be assigned to all entities in the pipeline.
> + * @pad: Starting pad
> + * @pipe: Media pipeline to be assigned to all pads in the pipeline.
>   *
> - * Mark all entities connected to a given entity through enabled links, either
> + * Mark all pads connected to a given pad through enabled links, either
>   * directly or indirectly, as streaming. The given pipeline object is assigned
>   * to every entity in the pipeline and stored in the media_entity pipe field.

s/entity/pad/

>   *
> @@ -1060,24 +1060,24 @@ struct media_entity *media_graph_walk_next(struct media_graph *graph);
>   * pipeline pointer must be identical for all nested calls to
>   * media_pipeline_start().
>   */
> -__must_check int media_pipeline_start(struct media_entity *entity,
> +__must_check int media_pipeline_start(struct media_pad *pad,
>  				      struct media_pipeline *pipe);
>  /**
>   * __media_pipeline_start - Mark a pipeline as streaming
>   *
> - * @entity: Starting entity
> - * @pipe: Media pipeline to be assigned to all entities in the pipeline.
> + * @pad: Starting pad
> + * @pipe: Media pipeline to be assigned to all pads in the pipeline.
>   *
>   * ..note:: This is the non-locking version of media_pipeline_start()
>   */
> -__must_check int __media_pipeline_start(struct media_entity *entity,
> +__must_check int __media_pipeline_start(struct media_pad *pad,
>  					struct media_pipeline *pipe);
>  
>  /**
>   * media_pipeline_stop - Mark a pipeline as not streaming
> - * @entity: Starting entity
> + * @pad: Starting pad
>   *
> - * Mark all entities connected to a given entity through enabled links, either
> + * Mark all pads connected to a given pads through enabled links, either
>   * directly or indirectly, as not streaming. The media_entity pipe field is

This needs to be updated too. Please check the other functions to verify
there's no leftover.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>   * reset to %NULL.
>   *
> @@ -1085,20 +1085,20 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
>   * number of calls to this function are required to mark the pipeline as not
>   * streaming.
>   */
> -void media_pipeline_stop(struct media_entity *entity);
> +void media_pipeline_stop(struct media_pad *pad);
>  
>  /**
>   * __media_pipeline_stop - Mark a pipeline as not streaming
>   *
> - * @entity: Starting entity
> + * @pad: Starting pad
>   *
>   * .. note:: This is the non-locking version of media_pipeline_stop()
>   */
> -void __media_pipeline_stop(struct media_entity *entity);
> +void __media_pipeline_stop(struct media_pad *pad);
>  
>  /**
>   * media_pipeline_alloc_start - Mark a pipeline as streaming
> - * @entity: Starting entity
> + * @pad: Starting pad
>   *
>   * media_pipeline_alloc_start() is similar to media_pipeline_start() but instead
>   * of working on a given pipeline the function will use an existing pipeline if
> @@ -1107,7 +1107,7 @@ void __media_pipeline_stop(struct media_entity *entity);
>   * Calls to media_pipeline_alloc_start() must be matched with
>   * media_pipeline_stop().
>   */
> -__must_check int media_pipeline_alloc_start(struct media_entity *entity);
> +__must_check int media_pipeline_alloc_start(struct media_pad *pad);
>  
>  /**
>   * media_devnode_create() - creates and initializes a device node interface

-- 
Regards,

Laurent Pinchart
