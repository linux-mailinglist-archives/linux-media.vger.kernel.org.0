Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC8B05A525C
	for <lists+linux-media@lfdr.de>; Mon, 29 Aug 2022 18:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231142AbiH2Q5h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Aug 2022 12:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231150AbiH2Q5a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Aug 2022 12:57:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B0469A992
        for <linux-media@vger.kernel.org>; Mon, 29 Aug 2022 09:57:29 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A912505;
        Mon, 29 Aug 2022 18:57:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661792247;
        bh=85P26/eQ7K2BKktQekiq9GIPNLy9PEhW96AjhyZsYcU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UED1bNceuI+D+NtJrHHAwOTTNADO2AwdE00eeldv3eCFnxSi7LJJShxKgEKtnJrb5
         F2D16pPrSLeevyx92sPZKD2ULPdkKq2uAKjsPwv/kBrft5RgmIzrbzOUTj+KVQfNZm
         ZiYyQBdYC4SwwC2THVkryBsBcpRYhdcY+TC+KJ1c=
Date:   Mon, 29 Aug 2022 19:57:18 +0300
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
Subject: Re: [PATCH v13 12/34] media: mc: entity: add alloc variant of
 pipeline_start
Message-ID: <Ywzv7oCiubQwqSdK@pendragon.ideasonboard.com>
References: <20220810121122.3149086-1-tomi.valkeinen@ideasonboard.com>
 <20220810121122.3149086-13-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220810121122.3149086-13-tomi.valkeinen@ideasonboard.com>
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

On Wed, Aug 10, 2022 at 03:11:00PM +0300, Tomi Valkeinen wrote:
> Add new variant of media_pipeline_start(), media_pipeline_alloc_start().
> 
> media_pipeline_alloc_start() can be used by drivers that do not need to
> extend the media_pipeline. The function will either use the pipeline
> already associated with the entity, if such exists, or allocate a new
> pipeline.
> 
> When media_pipeline_stop() is called and the pipeline's use count drops
> to zero, the pipeline is automatically freed.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/mc/mc-entity.c       | 41 ++++++++++++++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-dev.c | 11 ++++++++
>  include/media/media-entity.h       | 14 ++++++++++
>  include/media/v4l2-dev.h           | 14 ++++++++++
>  4 files changed, 80 insertions(+)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index b1abaa333d13..d277eed11caf 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -529,6 +529,8 @@ void __media_pipeline_stop(struct media_entity *entity)
>  
>  	media_graph_walk_cleanup(graph);
>  
> +	if (pipe->allocated)
> +		kfree(pipe);
>  }
>  EXPORT_SYMBOL_GPL(__media_pipeline_stop);
>  
> @@ -542,6 +544,45 @@ void media_pipeline_stop(struct media_entity *entity)
>  }
>  EXPORT_SYMBOL_GPL(media_pipeline_stop);
>  
> +__must_check int media_pipeline_alloc_start(struct media_entity *entity)
> +{
> +	struct media_device *mdev = entity->graph_obj.mdev;
> +	struct media_pipeline *pipe;
> +	int ret;
> +	bool new_pipe = false;
> +
> +	mutex_lock(&mdev->graph_mutex);
> +
> +	/*
> +	 * Is the entity already part of a pipeline? If not, we need to allocate
> +	 * a pipe.
> +	 */
> +	pipe = media_entity_pipeline(entity);
> +	if (!pipe) {
> +		pipe = kzalloc(sizeof(*pipe), GFP_KERNEL);
> +

You can drop the blank line.

> +		if (!pipe) {
> +			ret = -ENOMEM;
> +			goto out;
> +		}
> +
> +		new_pipe = true;
> +		pipe->allocated = true;
> +	}
> +
> +	ret = __media_pipeline_start(entity, pipe);
> +	if (ret) {
> +		if (new_pipe)
> +			kfree(pipe);

If new_pipe was a media_pipeline pointer, initialized to NULL and set to
pipe when you allocate the pipe, you could write this

	if (ret)
		kfree(new_pipe);

I don't mind much either way.

I have no objection against this patch, but I don't think it aligns well
with what I was imagining as further evolutions of the API. I would like
the pipe to be turned into an object similar to a DRM atomic commit.
There will thus never be a need for drivers to allocate the pipeline, it
will be done by the framework. We can rework (and likely drop) this
function when that happens.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	}
> +
> +out:
> +	mutex_unlock(&mdev->graph_mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(media_pipeline_alloc_start);
> +
>  /* -----------------------------------------------------------------------------
>   * Links management
>   */
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index 7f933ff89fd4..945bb867a4c1 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -1143,6 +1143,17 @@ void __video_device_pipeline_stop(struct video_device *vdev)
>  }
>  EXPORT_SYMBOL_GPL(__video_device_pipeline_stop);
>  
> +__must_check int video_device_pipeline_alloc_start(struct video_device *vdev)
> +{
> +	struct media_entity *entity = &vdev->entity;
> +
> +	if (entity->num_pads != 1)
> +		return -ENODEV;
> +
> +	return media_pipeline_alloc_start(entity);
> +}
> +EXPORT_SYMBOL_GPL(video_device_pipeline_alloc_start);
> +
>  struct media_pipeline *video_device_pipeline(struct video_device *vdev)
>  {
>  	struct media_entity *entity = &vdev->entity;
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index 3438954892b7..3d0d5e3c3333 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -104,6 +104,7 @@ struct media_graph {
>   * @graph:		Media graph walk during pipeline start / stop
>   */
>  struct media_pipeline {
> +	bool allocated;

This should be documented.

>  	int start_count;
>  	struct media_graph graph;
>  };
> @@ -1028,6 +1029,19 @@ void media_pipeline_stop(struct media_entity *entity);
>   */
>  void __media_pipeline_stop(struct media_entity *entity);
>  
> +/**
> + * media_pipeline_alloc_start - Mark a pipeline as streaming
> + * @entity: Starting entity
> + *
> + * media_pipeline_alloc_start() is similar to media_pipeline_start() but instead
> + * of working on a given pipeline the function will use an existing pipeline if
> + * the entity is already part of a pipeline, or allocate a new pipeline.
> + *
> + * Calls to media_pipeline_alloc_start() must be matched with
> + * media_pipeline_stop().
> + */
> +__must_check int media_pipeline_alloc_start(struct media_entity *entity);
> +
>  /**
>   * media_devnode_create() - creates and initializes a device node interface
>   *
> diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> index 4ccc24f5918a..29eb61244d1f 100644
> --- a/include/media/v4l2-dev.h
> +++ b/include/media/v4l2-dev.h
> @@ -609,6 +609,20 @@ void video_device_pipeline_stop(struct video_device *vdev);
>   */
>  void __video_device_pipeline_stop(struct video_device *vdev);
>  
> +/**
> + * video_device_pipeline_alloc_start - Mark a pipeline as streaming
> + * @vdev: Starting video device
> + *
> + * video_device_pipeline_alloc_start() is similar to video_device_pipeline_start()
> + * but instead of working on a given pipeline the function will use an
> + * existing pipeline if the video device is already part of a pipeline, or
> + * allocate a new pipeline.
> + *
> + * Calls to video_device_pipeline_alloc_start() must be matched with
> + * video_device_pipeline_stop().
> + */
> +__must_check int video_device_pipeline_alloc_start(struct video_device *vdev);
> +
>  /**
>   * video_device_pipeline - Get the media pipeline a video device is part of
>   * @vdev: The video device

-- 
Regards,

Laurent Pinchart
