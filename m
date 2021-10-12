Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 244CF42A797
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 16:46:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237258AbhJLOsx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Oct 2021 10:48:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235294AbhJLOsr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 10:48:47 -0400
Received: from lb1-smtp-cloud8.xs4all.net (lb1-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::1b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3FB9C061570
        for <linux-media@vger.kernel.org>; Tue, 12 Oct 2021 07:46:45 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id aJ3AmsYcUx7rIaJ3DmMOTI; Tue, 12 Oct 2021 16:46:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634050003; bh=4g4lH+blnAg1TziLSAVn3N/Ip+cX7LLzqoAi92VcuVg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=qY1aPJXNTgwJiyN1wtesZpJ2T2o4+jjN7lV2w8uvm2CfhEZmEbbh6NjZwgz7h/Qse
         DJzr4zb6+oOSw3zZfTl7lqXQBg4JvjejYsiMw9WDVskjznnBjGEf8GLuvF6c5Yj1kp
         yk6vDpt2Z9+45hAkLA0mk/9xJarvF0SKaIYaipC3NDX8rlmajs2KJjDPj65BAJR+hI
         stGmxyYCKeZUr8zui2fi3IWNxzHCUlDCBuOA0Pg0ypjZQp9d02UTty6UGTVNFHMyMW
         l6h7gpYCdeTWM23BZD+48FjxSIvgq3uMN3b9+AHV5Za5X6VuEJPFUSlbKaUL7aBtMK
         y5Qw30TAFlL5w==
Subject: Re: [PATCH v9 07/36] media: entity: Use pad as a starting point for
 graph walk
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-8-tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <37cb5066-b6ef-957d-6cdd-62126aa20e7b@xs4all.nl>
Date:   Tue, 12 Oct 2021 16:46:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211005085750.138151-8-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfHpsvQH6d/Ci2JKjj+4Xg8RJbsEoYBEVB21nK5e8ioi8kvTd5RK5LrFMS6hpWMNLtv8kvGPJH+Fw7mVwm578XOkS0OZ9MxofPg54EZHeQbrK7maST5mg
 kb+GmOpE0T/x2WBtWWQop/2TrkTDchzu+m2kyFf7SyuGC4msE/z9UTY35Xe6lKCEGiugox26Z9YmL4xtfQ5S8o+pOM22+OcthVeXJDPqaRs5Q3aueaPPbuKQ
 jDjfclfmtTlTfEEubw5UzSgObsEAfX0516cSU2I8E67sjgESQIXZHSeKI4/IuMoT9ShU6ZcPpeTP94eraZf1aoa3RMKwcfBRzTgGKTXotxNCyS93KnxMUbkw
 hkLfXXZAOIlR4+yr60J6meW+c3q7Id87+AyBD4qW4BXrXxbmpPXLD0aIQK40n9r8U05Xw8BqPpzSV2TMChVdWgOJCozW4Xnv+O6Q12CckVNBR84rAlyWYqr6
 9uPwzJxV+1A0Klkq8s/Sw5PXDogUDo5ixV//fg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

FYI: I'm not reviewing patches 7-23, lots of people looked at those already,
and I trust that code :-)

Regards,

	Hans

On 05/10/2021 10:57, Tomi Valkeinen wrote:
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> With the upcoming use of the recently added has_route() media entity op,
> all the pads in an entity will no longer be considered interconnected.
> This has an effect where the media graph is traversed: the starting pad
> does make a difference.
> 
> Prepare for this change by using pad instead of the entity as an argument
> for the graph walk operations. The actual graph traversal algorithm change
> is in further patches.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  Documentation/driver-api/media/mc-core.rst    |  2 +-
>  drivers/media/mc/mc-entity.c                  | 17 ++++++++---------
>  drivers/media/platform/exynos4-is/media-dev.c |  4 ++--
>  drivers/media/platform/omap3isp/ispvideo.c    |  2 +-
>  drivers/media/platform/vsp1/vsp1_video.c      |  2 +-
>  drivers/media/platform/xilinx/xilinx-dma.c    |  2 +-
>  drivers/media/v4l2-core/v4l2-mc.c             |  6 +++---
>  drivers/staging/media/omap4iss/iss_video.c    |  4 ++--
>  include/media/media-entity.h                  | 10 ++++------
>  9 files changed, 23 insertions(+), 26 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/mc-core.rst b/Documentation/driver-api/media/mc-core.rst
> index 57b5bbba944e..ba0aee982124 100644
> --- a/Documentation/driver-api/media/mc-core.rst
> +++ b/Documentation/driver-api/media/mc-core.rst
> @@ -167,7 +167,7 @@ Drivers initiate a graph traversal by calling
>  :c:func:`media_graph_walk_start()`
>  
>  The graph structure, provided by the caller, is initialized to start graph
> -traversal at the given entity.
> +traversal at the given pad in an entity.
>  
>  Drivers can then retrieve the next entity by calling
>  :c:func:`media_graph_walk_next()`
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index f40f41977142..47cdaa301838 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -291,17 +291,16 @@ void media_graph_walk_cleanup(struct media_graph *graph)
>  }
>  EXPORT_SYMBOL_GPL(media_graph_walk_cleanup);
>  
> -void media_graph_walk_start(struct media_graph *graph,
> -			    struct media_entity *entity)
> +void media_graph_walk_start(struct media_graph *graph, struct media_pad *pad)
>  {
>  	media_entity_enum_zero(&graph->ent_enum);
> -	media_entity_enum_set(&graph->ent_enum, entity);
> +	media_entity_enum_set(&graph->ent_enum, pad->entity);
>  
>  	graph->top = 0;
>  	graph->stack[graph->top].entity = NULL;
> -	stack_push(graph, entity);
> -	dev_dbg(entity->graph_obj.mdev->dev,
> -		"begin graph walk at '%s'\n", entity->name);
> +	stack_push(graph, pad->entity);
> +	dev_dbg(pad->graph_obj.mdev->dev,
> +		"begin graph walk at '%s':%u\n", pad->entity->name, pad->index);
>  }
>  EXPORT_SYMBOL_GPL(media_graph_walk_start);
>  
> @@ -420,7 +419,7 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
>  			goto error_graph_walk_start;
>  	}
>  
> -	media_graph_walk_start(&pipe->graph, entity);
> +	media_graph_walk_start(&pipe->graph, entity->pads);
>  
>  	while ((entity = media_graph_walk_next(graph))) {
>  		DECLARE_BITMAP(active, MEDIA_ENTITY_MAX_PADS);
> @@ -504,7 +503,7 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
>  	 * Link validation on graph failed. We revert what we did and
>  	 * return the error.
>  	 */
> -	media_graph_walk_start(graph, entity_err);
> +	media_graph_walk_start(graph, entity_err->pads);
>  
>  	while ((entity_err = media_graph_walk_next(graph))) {
>  		/* Sanity check for negative stream_count */
> @@ -555,7 +554,7 @@ void __media_pipeline_stop(struct media_entity *entity)
>  	if (WARN_ON(!pipe))
>  		return;
>  
> -	media_graph_walk_start(graph, entity);
> +	media_graph_walk_start(graph, entity->pads);
>  
>  	while ((entity = media_graph_walk_next(graph))) {
>  		/* Sanity check for negative stream_count */
> diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
> index fa648721eaab..4ec7f7a6b0f6 100644
> --- a/drivers/media/platform/exynos4-is/media-dev.c
> +++ b/drivers/media/platform/exynos4-is/media-dev.c
> @@ -1173,7 +1173,7 @@ static int __fimc_md_modify_pipelines(struct media_entity *entity, bool enable,
>  	 * through active links. This is needed as we cannot power on/off the
>  	 * subdevs in random order.
>  	 */
> -	media_graph_walk_start(graph, entity);
> +	media_graph_walk_start(graph, entity->pads);
>  
>  	while ((entity = media_graph_walk_next(graph))) {
>  		if (!is_media_entity_v4l2_video_device(entity))
> @@ -1188,7 +1188,7 @@ static int __fimc_md_modify_pipelines(struct media_entity *entity, bool enable,
>  	return 0;
>  
>  err:
> -	media_graph_walk_start(graph, entity_err);
> +	media_graph_walk_start(graph, entity_err->pads);
>  
>  	while ((entity_err = media_graph_walk_next(graph))) {
>  		if (!is_media_entity_v4l2_video_device(entity_err))
> diff --git a/drivers/media/platform/omap3isp/ispvideo.c b/drivers/media/platform/omap3isp/ispvideo.c
> index 8811d6dd4ee7..3c1485d59404 100644
> --- a/drivers/media/platform/omap3isp/ispvideo.c
> +++ b/drivers/media/platform/omap3isp/ispvideo.c
> @@ -234,7 +234,7 @@ static int isp_video_get_graph_data(struct isp_video *video,
>  		return ret;
>  	}
>  
> -	media_graph_walk_start(&graph, entity);
> +	media_graph_walk_start(&graph, entity->pads);
>  
>  	while ((entity = media_graph_walk_next(&graph))) {
>  		struct isp_video *__video;
> diff --git a/drivers/media/platform/vsp1/vsp1_video.c b/drivers/media/platform/vsp1/vsp1_video.c
> index 044eb5778820..61e4fbaba7b7 100644
> --- a/drivers/media/platform/vsp1/vsp1_video.c
> +++ b/drivers/media/platform/vsp1/vsp1_video.c
> @@ -569,7 +569,7 @@ static int vsp1_video_pipeline_build(struct vsp1_pipeline *pipe,
>  	if (ret)
>  		return ret;
>  
> -	media_graph_walk_start(&graph, entity);
> +	media_graph_walk_start(&graph, entity->pads);
>  
>  	while ((entity = media_graph_walk_next(&graph))) {
>  		struct v4l2_subdev *subdev;
> diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
> index 338c3661d809..af0d55ab6c15 100644
> --- a/drivers/media/platform/xilinx/xilinx-dma.c
> +++ b/drivers/media/platform/xilinx/xilinx-dma.c
> @@ -189,7 +189,7 @@ static int xvip_pipeline_validate(struct xvip_pipeline *pipe,
>  		return ret;
>  	}
>  
> -	media_graph_walk_start(&graph, entity);
> +	media_graph_walk_start(&graph, entity->pads);
>  
>  	while ((entity = media_graph_walk_next(&graph))) {
>  		struct xvip_dma *dma;
> diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
> index b01474717dca..d215fe31b9a2 100644
> --- a/drivers/media/v4l2-core/v4l2-mc.c
> +++ b/drivers/media/v4l2-core/v4l2-mc.c
> @@ -436,7 +436,7 @@ static int pipeline_pm_use_count(struct media_entity *entity,
>  {
>  	int use = 0;
>  
> -	media_graph_walk_start(graph, entity);
> +	media_graph_walk_start(graph, entity->pads);
>  
>  	while ((entity = media_graph_walk_next(graph))) {
>  		if (is_media_entity_v4l2_video_device(entity))
> @@ -499,7 +499,7 @@ static int pipeline_pm_power(struct media_entity *entity, int change,
>  	if (!change)
>  		return 0;
>  
> -	media_graph_walk_start(graph, entity);
> +	media_graph_walk_start(graph, entity->pads);
>  
>  	while (!ret && (entity = media_graph_walk_next(graph)))
>  		if (is_media_entity_v4l2_subdev(entity))
> @@ -508,7 +508,7 @@ static int pipeline_pm_power(struct media_entity *entity, int change,
>  	if (!ret)
>  		return ret;
>  
> -	media_graph_walk_start(graph, first);
> +	media_graph_walk_start(graph, first->pads);
>  
>  	while ((first = media_graph_walk_next(graph))
>  	       && first != entity)
> diff --git a/drivers/staging/media/omap4iss/iss_video.c b/drivers/staging/media/omap4iss/iss_video.c
> index d0da083deed5..760cd0ab1feb 100644
> --- a/drivers/staging/media/omap4iss/iss_video.c
> +++ b/drivers/staging/media/omap4iss/iss_video.c
> @@ -217,7 +217,7 @@ iss_video_far_end(struct iss_video *video)
>  		return NULL;
>  	}
>  
> -	media_graph_walk_start(&graph, entity);
> +	media_graph_walk_start(&graph, entity->pads);
>  
>  	while ((entity = media_graph_walk_next(&graph))) {
>  		if (entity == &video->video.entity)
> @@ -892,7 +892,7 @@ iss_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
>  		goto err_media_pipeline_start;
>  
>  	mutex_lock(&mdev->graph_mutex);
> -	media_graph_walk_start(&graph, entity);
> +	media_graph_walk_start(&graph, entity->pads);
>  	while ((entity = media_graph_walk_next(&graph)))
>  		media_entity_enum_set(&pipe->ent_enum, entity);
>  	mutex_unlock(&mdev->graph_mutex);
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index 09737b47881f..b9bfcf34eb0a 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -902,22 +902,20 @@ __must_check int media_graph_walk_init(
>  void media_graph_walk_cleanup(struct media_graph *graph);
>  
>  /**
> - * media_graph_walk_start - Start walking the media graph at a
> - *	given entity
> + * media_graph_walk_start - Start walking the media graph at a given pad
>   *
>   * @graph: Media graph structure that will be used to walk the graph
> - * @entity: Starting entity
> + * @pad: Starting pad
>   *
>   * Before using this function, media_graph_walk_init() must be
>   * used to allocate resources used for walking the graph. This
>   * function initializes the graph traversal structure to walk the
> - * entities graph starting at the given entity. The traversal
> + * entities graph starting at the given pad. The traversal
>   * structure must not be modified by the caller during graph
>   * traversal. After the graph walk, the resources must be released
>   * using media_graph_walk_cleanup().
>   */
> -void media_graph_walk_start(struct media_graph *graph,
> -			    struct media_entity *entity);
> +void media_graph_walk_start(struct media_graph *graph, struct media_pad *pad);
>  
>  /**
>   * media_graph_walk_next - Get the next entity in the graph
> 

