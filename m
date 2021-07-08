Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8083BF88C
	for <lists+linux-media@lfdr.de>; Thu,  8 Jul 2021 12:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231517AbhGHKuQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jul 2021 06:50:16 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:59485 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231493AbhGHKuP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jul 2021 06:50:15 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id A08E51C0005;
        Thu,  8 Jul 2021 10:47:30 +0000 (UTC)
Date:   Thu, 8 Jul 2021 12:48:19 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [PATCH v7 03/27] media: entity: Walk the graph based on pads
Message-ID: <20210708104819.l37h65l4zedxxq53@uno.localdomain>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
 <20210524104408.599645-4-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210524104408.599645-4-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Mon, May 24, 2021 at 01:43:44PM +0300, Tomi Valkeinen wrote:
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
>
> Instead of iterating over graph entities during the walk, iterate the pads
> through which the entity was first reached. This is required in order to
> make the entity pipeline pad-based rather than entity based.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  Documentation/driver-api/media/mc-core.rst    |  7 ++-
>  drivers/media/mc/mc-entity.c                  | 51 +++++++++++--------
>  drivers/media/platform/exynos4-is/media-dev.c | 20 ++++----
>  drivers/media/platform/omap3isp/ispvideo.c    | 17 ++++---
>  drivers/media/platform/vsp1/vsp1_video.c      | 12 ++---
>  drivers/media/platform/xilinx/xilinx-dma.c    | 12 ++---
>  drivers/media/v4l2-core/v4l2-mc.c             | 24 ++++-----
>  drivers/staging/media/omap4iss/iss_video.c    | 36 ++++++-------
>  include/media/media-entity.h                  |  7 +--
>  9 files changed, 101 insertions(+), 85 deletions(-)
>
> diff --git a/Documentation/driver-api/media/mc-core.rst b/Documentation/driver-api/media/mc-core.rst
> index ba0aee982124..8a13640bed56 100644
> --- a/Documentation/driver-api/media/mc-core.rst
> +++ b/Documentation/driver-api/media/mc-core.rst
> @@ -169,8 +169,11 @@ Drivers initiate a graph traversal by calling
>  The graph structure, provided by the caller, is initialized to start graph
>  traversal at the given pad in an entity.
>
> -Drivers can then retrieve the next entity by calling
> -:c:func:`media_graph_walk_next()`
> +Drivers can then retrieve the next pad by calling
> +:c:func:`media_graph_walk_next()`. Only the pad through which the entity
> +is first reached is returned. If the caller is interested in knowing which
> +further pads would be connected, the :c:func:`media_entity_has_route()`

Not a big deal either, but this will be introduced later too

> +function can be used for that.
>
>  When the graph traversal is complete the function will return ``NULL``.
>
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 0d58634b6fa8..32045671eaff 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -341,9 +341,9 @@ static void media_graph_walk_iter(struct media_graph *graph)
>  	lockdep_assert_held(&next->graph_obj.mdev->graph_mutex);
>  }
>
> -struct media_entity *media_graph_walk_next(struct media_graph *graph)
> +struct media_pad *media_graph_walk_next(struct media_graph *graph)
>  {
> -	struct media_entity *entity;
> +	struct media_pad *pad;
>
>  	if (stack_top(graph) == NULL)
>  		return NULL;
> @@ -356,11 +356,11 @@ struct media_entity *media_graph_walk_next(struct media_graph *graph)
>  	while (link_top(graph) != &stack_top(graph)->entity->links)
>  		media_graph_walk_iter(graph);
>
> -	entity = stack_pop(graph)->entity;
> -	dev_dbg(entity->graph_obj.mdev->dev,
> -		"walk: returning entity '%s'\n", entity->name);
> +	pad = stack_pop(graph);
> +	dev_dbg(pad->graph_obj.mdev->dev,
> +		"walk: returning pad '%s':%u\n", pad->entity->name, pad->index);
>
> -	return entity;
> +	return pad;
>  }
>  EXPORT_SYMBOL_GPL(media_graph_walk_next);
>
> @@ -408,7 +408,8 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
>  {
>  	struct media_device *mdev = entity->graph_obj.mdev;
>  	struct media_graph *graph = &pipe->graph;
> -	struct media_entity *entity_err = entity;
> +	struct media_pad *pad = entity->pads;
> +	struct media_pad *pad_err = pad;
>  	struct media_link *link;
>  	int ret;
>
> @@ -418,9 +419,11 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
>  			goto error_graph_walk_start;
>  	}
>
> -	media_graph_walk_start(&pipe->graph, entity->pads);
> +	media_graph_walk_start(&pipe->graph, pad);
> +
> +	while ((pad = media_graph_walk_next(graph))) {
> +		struct media_entity *entity = pad->entity;
>
> -	while ((entity = media_graph_walk_next(graph))) {
>  		DECLARE_BITMAP(active, MEDIA_ENTITY_MAX_PADS);
>  		DECLARE_BITMAP(has_no_links, MEDIA_ENTITY_MAX_PADS);
>
> @@ -429,7 +432,7 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
>  		if (entity->pipe && entity->pipe != pipe) {
>  			pr_err("Pipe active for %s. Can't start for %s\n",
>  				entity->name,
> -				entity_err->name);
> +				pad_err->entity->name);
>  			ret = -EBUSY;
>  			goto error;
>  		}
> @@ -447,26 +450,27 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
>  		bitmap_fill(has_no_links, entity->num_pads);
>
>  		list_for_each_entry(link, &entity->links, list) {
> -			struct media_pad *pad = link->sink->entity == entity
> -						? link->sink : link->source;
> +			struct media_pad *other_pad =
> +				link->sink->entity == entity ?
> +				link->sink : link->source;
>
>  			/* Mark that a pad is connected by a link. */
> -			bitmap_clear(has_no_links, pad->index, 1);
> +			bitmap_clear(has_no_links, other_pad->index, 1);
>
>  			/*
>  			 * Pads that either do not need to connect or
>  			 * are connected through an enabled link are
>  			 * fine.
>  			 */
> -			if (!(pad->flags & MEDIA_PAD_FL_MUST_CONNECT) ||
> +			if (!(other_pad->flags & MEDIA_PAD_FL_MUST_CONNECT) ||
>  			    link->flags & MEDIA_LNK_FL_ENABLED)
> -				bitmap_set(active, pad->index, 1);
> +				bitmap_set(active, other_pad->index, 1);
>
>  			/*
>  			 * Link validation will only take place for
>  			 * sink ends of the link that are enabled.
>  			 */
> -			if (link->sink != pad ||
> +			if (link->sink != other_pad ||
>  			    !(link->flags & MEDIA_LNK_FL_ENABLED))
>  				continue;
>
> @@ -502,9 +506,11 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
>  	 * Link validation on graph failed. We revert what we did and
>  	 * return the error.
>  	 */
> -	media_graph_walk_start(graph, entity_err->pads);
> +	media_graph_walk_start(graph, pad_err);
> +
> +	while ((pad_err = media_graph_walk_next(graph))) {
> +		struct media_entity *entity_err = pad_err->entity;
>
> -	while ((entity_err = media_graph_walk_next(graph))) {
>  		/* Sanity check for negative stream_count */
>  		if (!WARN_ON_ONCE(entity_err->stream_count <= 0)) {
>  			entity_err->stream_count--;
> @@ -516,7 +522,7 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
>  		 * We haven't increased stream_count further than this
>  		 * so we quit here.
>  		 */
> -		if (entity_err == entity)
> +		if (pad_err == pad)
>  			break;
>  	}
>
> @@ -543,8 +549,9 @@ EXPORT_SYMBOL_GPL(media_pipeline_start);
>
>  void __media_pipeline_stop(struct media_entity *entity)
>  {
> -	struct media_graph *graph = &entity->pipe->graph;
>  	struct media_pipeline *pipe = entity->pipe;
> +	struct media_graph *graph = &pipe->graph;
> +	struct media_pad *pad;
>
>  	/*
>  	 * If the following check fails, the driver has performed an
> @@ -555,7 +562,9 @@ void __media_pipeline_stop(struct media_entity *entity)
>
>  	media_graph_walk_start(graph, entity->pads);
>
> -	while ((entity = media_graph_walk_next(graph))) {
> +	while ((pad = media_graph_walk_next(graph))) {
> +		struct media_entity *entity = pad->entity;
> +
>  		/* Sanity check for negative stream_count */
>  		if (!WARN_ON_ONCE(entity->stream_count <= 0)) {
>  			entity->stream_count--;
> diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
> index 5aaecdf92c53..8938a6367703 100644
> --- a/drivers/media/platform/exynos4-is/media-dev.c
> +++ b/drivers/media/platform/exynos4-is/media-dev.c
> @@ -1164,7 +1164,7 @@ static int __fimc_md_modify_pipeline(struct media_entity *entity, bool enable)
>  static int __fimc_md_modify_pipelines(struct media_entity *entity, bool enable,
>  				      struct media_graph *graph)
>  {
> -	struct media_entity *entity_err = entity;
> +	struct media_pad *pad, *pad_err = entity->pads;
>  	int ret;
>
>  	/*
> @@ -1173,13 +1173,13 @@ static int __fimc_md_modify_pipelines(struct media_entity *entity, bool enable,
>  	 * through active links. This is needed as we cannot power on/off the
>  	 * subdevs in random order.
>  	 */
> -	media_graph_walk_start(graph, entity->pads);
> +	media_graph_walk_start(graph, pad_err);
>
> -	while ((entity = media_graph_walk_next(graph))) {
> -		if (!is_media_entity_v4l2_video_device(entity))
> +	while ((pad = media_graph_walk_next(graph))) {
> +		if (!is_media_entity_v4l2_video_device(pad->entity))
>  			continue;
>
> -		ret  = __fimc_md_modify_pipeline(entity, enable);
> +		ret  = __fimc_md_modify_pipeline(pad->entity, enable);
>
>  		if (ret < 0)
>  			goto err;
> @@ -1188,15 +1188,15 @@ static int __fimc_md_modify_pipelines(struct media_entity *entity, bool enable,
>  	return 0;
>
>  err:
> -	media_graph_walk_start(graph, entity_err->pads);
> +	media_graph_walk_start(graph, pad_err);
>
> -	while ((entity_err = media_graph_walk_next(graph))) {
> -		if (!is_media_entity_v4l2_video_device(entity_err))
> +	while ((pad_err = media_graph_walk_next(graph))) {
> +		if (!is_media_entity_v4l2_video_device(pad_err->entity))
>  			continue;
>
> -		__fimc_md_modify_pipeline(entity_err, !enable);
> +		__fimc_md_modify_pipeline(pad_err->entity, !enable);
>
> -		if (entity_err == entity)
> +		if (pad_err == pad)
>  			break;
>  	}
>
> diff --git a/drivers/media/platform/omap3isp/ispvideo.c b/drivers/media/platform/omap3isp/ispvideo.c
> index 3c1485d59404..5c1cbb1a9003 100644
> --- a/drivers/media/platform/omap3isp/ispvideo.c
> +++ b/drivers/media/platform/omap3isp/ispvideo.c
> @@ -222,8 +222,8 @@ static int isp_video_get_graph_data(struct isp_video *video,
>  				    struct isp_pipeline *pipe)
>  {
>  	struct media_graph graph;
> -	struct media_entity *entity = &video->video.entity;
> -	struct media_device *mdev = entity->graph_obj.mdev;
> +	struct media_pad *pad = video->video.entity.pads;
> +	struct media_device *mdev = video->video.entity.graph_obj.mdev;
>  	struct isp_video *far_end = NULL;
>  	int ret;
>
> @@ -234,23 +234,24 @@ static int isp_video_get_graph_data(struct isp_video *video,
>  		return ret;
>  	}
>
> -	media_graph_walk_start(&graph, entity->pads);
> +	media_graph_walk_start(&graph, pad);
>
> -	while ((entity = media_graph_walk_next(&graph))) {
> +	while ((pad = media_graph_walk_next(&graph))) {
>  		struct isp_video *__video;
>
> -		media_entity_enum_set(&pipe->ent_enum, entity);
> +		media_entity_enum_set(&pipe->ent_enum, pad->entity);
>
>  		if (far_end != NULL)
>  			continue;
>
> -		if (entity == &video->video.entity)
> +		if (pad == video->video.entity.pads)
>  			continue;
>
> -		if (!is_media_entity_v4l2_video_device(entity))
> +		if (!is_media_entity_v4l2_video_device(pad->entity))
>  			continue;
>
> -		__video = to_isp_video(media_entity_to_video_device(entity));
> +		__video = to_isp_video(media_entity_to_video_device(
> +					       pad->entity));
>  		if (__video->type != video->type)
>  			far_end = __video;
>  	}
> diff --git a/drivers/media/platform/vsp1/vsp1_video.c b/drivers/media/platform/vsp1/vsp1_video.c
> index 61e4fbaba7b7..f2c36f2fdf53 100644
> --- a/drivers/media/platform/vsp1/vsp1_video.c
> +++ b/drivers/media/platform/vsp1/vsp1_video.c
> @@ -559,8 +559,8 @@ static int vsp1_video_pipeline_build(struct vsp1_pipeline *pipe,
>  				     struct vsp1_video *video)
>  {
>  	struct media_graph graph;
> -	struct media_entity *entity = &video->video.entity;
> -	struct media_device *mdev = entity->graph_obj.mdev;
> +	struct media_pad *pad = video->video.entity.pads;
> +	struct media_device *mdev = video->video.entity.graph_obj.mdev;
>  	unsigned int i;
>  	int ret;
>
> @@ -569,17 +569,17 @@ static int vsp1_video_pipeline_build(struct vsp1_pipeline *pipe,
>  	if (ret)
>  		return ret;
>
> -	media_graph_walk_start(&graph, entity->pads);
> +	media_graph_walk_start(&graph, pad);
>
> -	while ((entity = media_graph_walk_next(&graph))) {
> +	while ((pad = media_graph_walk_next(&graph))) {
>  		struct v4l2_subdev *subdev;
>  		struct vsp1_rwpf *rwpf;
>  		struct vsp1_entity *e;
>
> -		if (!is_media_entity_v4l2_subdev(entity))
> +		if (!is_media_entity_v4l2_subdev(pad->entity))
>  			continue;
>
> -		subdev = media_entity_to_v4l2_subdev(entity);
> +		subdev = media_entity_to_v4l2_subdev(pad->entity);
>  		e = to_vsp1_entity(subdev);
>  		list_add_tail(&e->list_pipe, &pipe->entities);
>  		e->pipe = pipe;
> diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
> index d64c3bee8b95..8df3c43aecbe 100644
> --- a/drivers/media/platform/xilinx/xilinx-dma.c
> +++ b/drivers/media/platform/xilinx/xilinx-dma.c
> @@ -175,8 +175,8 @@ static int xvip_pipeline_validate(struct xvip_pipeline *pipe,
>  				  struct xvip_dma *start)
>  {
>  	struct media_graph graph;
> -	struct media_entity *entity = &start->video.entity;
> -	struct media_device *mdev = entity->graph_obj.mdev;
> +	struct media_pad *pad = start->video.entity.pads;
> +	struct media_device *mdev = pad->entity->graph_obj.mdev;
>  	unsigned int num_inputs = 0;
>  	unsigned int num_outputs = 0;
>  	int ret;
> @@ -190,15 +190,15 @@ static int xvip_pipeline_validate(struct xvip_pipeline *pipe,
>  		return ret;
>  	}
>
> -	media_graph_walk_start(&graph, entity->pads);
> +	media_graph_walk_start(&graph, pad);
>
> -	while ((entity = media_graph_walk_next(&graph))) {
> +	while ((pad = media_graph_walk_next(&graph))) {
>  		struct xvip_dma *dma;
>
> -		if (entity->function != MEDIA_ENT_F_IO_V4L)
> +		if (pad->entity->function != MEDIA_ENT_F_IO_V4L)
>  			continue;
>
> -		dma = to_xvip_dma(media_entity_to_video_device(entity));
> +		dma = to_xvip_dma(media_entity_to_video_device(pad->entity));
>
>  		if (dma->pad.flags & MEDIA_PAD_FL_SINK) {
>  			pipe->output = dma;
> diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
> index d215fe31b9a2..cbeb580c6754 100644
> --- a/drivers/media/v4l2-core/v4l2-mc.c
> +++ b/drivers/media/v4l2-core/v4l2-mc.c
> @@ -434,13 +434,14 @@ EXPORT_SYMBOL_GPL(v4l2_create_fwnode_links);
>  static int pipeline_pm_use_count(struct media_entity *entity,
>  	struct media_graph *graph)
>  {
> +	struct media_pad *pad;
>  	int use = 0;
>
>  	media_graph_walk_start(graph, entity->pads);
>
> -	while ((entity = media_graph_walk_next(graph))) {
> -		if (is_media_entity_v4l2_video_device(entity))
> -			use += entity->use_count;
> +	while ((pad = media_graph_walk_next(graph))) {
> +		if (is_media_entity_v4l2_video_device(pad->entity))
> +			use += pad->entity->use_count;
>  	}
>
>  	return use;
> @@ -493,7 +494,7 @@ static int pipeline_pm_power_one(struct media_entity *entity, int change)
>  static int pipeline_pm_power(struct media_entity *entity, int change,
>  	struct media_graph *graph)
>  {
> -	struct media_entity *first = entity;
> +	struct media_pad *tmp_pad, *pad;
>  	int ret = 0;
>
>  	if (!change)
> @@ -501,19 +502,18 @@ static int pipeline_pm_power(struct media_entity *entity, int change,
>
>  	media_graph_walk_start(graph, entity->pads);
>
> -	while (!ret && (entity = media_graph_walk_next(graph)))
> -		if (is_media_entity_v4l2_subdev(entity))
> -			ret = pipeline_pm_power_one(entity, change);
> +	while (!ret && (pad = media_graph_walk_next(graph)))
> +		if (is_media_entity_v4l2_subdev(pad->entity))
> +			ret = pipeline_pm_power_one(pad->entity, change);
>
>  	if (!ret)
>  		return ret;
>
> -	media_graph_walk_start(graph, first->pads);
> +	media_graph_walk_start(graph, entity->pads);
>
> -	while ((first = media_graph_walk_next(graph))
> -	       && first != entity)
> -		if (is_media_entity_v4l2_subdev(first))
> -			pipeline_pm_power_one(first, -change);
> +	while ((tmp_pad = media_graph_walk_next(graph)) && tmp_pad != pad)
> +		if (is_media_entity_v4l2_subdev(tmp_pad->entity))
> +			pipeline_pm_power_one(tmp_pad->entity, -change);
>
>  	return ret;
>  }
> diff --git a/drivers/staging/media/omap4iss/iss_video.c b/drivers/staging/media/omap4iss/iss_video.c
> index 760cd0ab1feb..8c25ad73a81e 100644
> --- a/drivers/staging/media/omap4iss/iss_video.c
> +++ b/drivers/staging/media/omap4iss/iss_video.c
> @@ -206,8 +206,8 @@ static struct iss_video *
>  iss_video_far_end(struct iss_video *video)
>  {
>  	struct media_graph graph;
> -	struct media_entity *entity = &video->video.entity;
> -	struct media_device *mdev = entity->graph_obj.mdev;
> +	struct media_pad *pad = video->video.entity.pads;
> +	struct media_device *mdev = video->video.entity.graph_obj.mdev;
>  	struct iss_video *far_end = NULL;
>
>  	mutex_lock(&mdev->graph_mutex);
> @@ -217,16 +217,17 @@ iss_video_far_end(struct iss_video *video)
>  		return NULL;
>  	}
>
> -	media_graph_walk_start(&graph, entity->pads);
> +	media_graph_walk_start(&graph, pad);
>
> -	while ((entity = media_graph_walk_next(&graph))) {
> -		if (entity == &video->video.entity)
> +	while ((pad = media_graph_walk_next(&graph))) {
> +		if (pad->entity == &video->video.entity)
>  			continue;
>
> -		if (!is_media_entity_v4l2_video_device(entity))
> +		if (!is_media_entity_v4l2_video_device(pad->entity))
>  			continue;
>
> -		far_end = to_iss_video(media_entity_to_video_device(entity));
> +		far_end = to_iss_video(media_entity_to_video_device(
> +						pad->entity));
>  		if (far_end->type != video->type)
>  			break;
>
> @@ -853,8 +854,8 @@ iss_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
>  	struct iss_video_fh *vfh = to_iss_video_fh(fh);
>  	struct iss_video *video = video_drvdata(file);
>  	struct media_graph graph;
> -	struct media_entity *entity = &video->video.entity;
> -	struct media_device *mdev = entity->graph_obj.mdev;
> +	struct media_pad *pad = video->video.entity.pads;
> +	struct media_device *mdev = video->video.entity.graph_obj.mdev;
>  	enum iss_pipeline_state state;
>  	struct iss_pipeline *pipe;
>  	struct iss_video *far_end;
> @@ -870,31 +871,32 @@ iss_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
>  	 * Start streaming on the pipeline. No link touching an entity in the
>  	 * pipeline can be activated or deactivated once streaming is started.
>  	 */
> -	pipe = entity->pipe
> -	     ? to_iss_pipeline(entity) : &video->pipe;
> +	pipe = pad->entity->pipe
> +	     ? to_iss_pipeline(pad->entity) : &video->pipe;
>  	pipe->external = NULL;
>  	pipe->external_rate = 0;
>  	pipe->external_bpp = 0;
>
> -	ret = media_entity_enum_init(&pipe->ent_enum, entity->graph_obj.mdev);
> +	ret = media_entity_enum_init(&pipe->ent_enum,
> +				     pad->entity->graph_obj.mdev);
>  	if (ret)
>  		goto err_graph_walk_init;
>
> -	ret = media_graph_walk_init(&graph, entity->graph_obj.mdev);
> +	ret = media_graph_walk_init(&graph, pad->entity->graph_obj.mdev);
>  	if (ret)
>  		goto err_graph_walk_init;
>
>  	if (video->iss->pdata->set_constraints)
>  		video->iss->pdata->set_constraints(video->iss, true);
>
> -	ret = media_pipeline_start(entity, &pipe->pipe);
> +	ret = media_pipeline_start(pad->entity, &pipe->pipe);
>  	if (ret < 0)
>  		goto err_media_pipeline_start;
>
>  	mutex_lock(&mdev->graph_mutex);
> -	media_graph_walk_start(&graph, entity->pads);
> -	while ((entity = media_graph_walk_next(&graph)))
> -		media_entity_enum_set(&pipe->ent_enum, entity);
> +	media_graph_walk_start(&graph, pad);
> +	while ((pad = media_graph_walk_next(&graph)))
> +		media_entity_enum_set(&pipe->ent_enum, pad->entity);
>  	mutex_unlock(&mdev->graph_mutex);
>
>  	/*
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index 5b55d6179e13..926fd201eae3 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -926,10 +926,11 @@ void media_graph_walk_start(struct media_graph *graph, struct media_pad *pad);
>   * The graph structure must have been previously initialized with a call to
>   * media_graph_walk_start().
>   *
> - * Return: returns the next entity in the graph or %NULL if the whole graph
> - * have been traversed.
> + * Return: returns the next entity in the graph, identified by the pad through
> + * which it has been reached. If the whole graph has been traversed, return
> + * %NULL.
>   */
> -struct media_entity *media_graph_walk_next(struct media_graph *graph);
> +struct media_pad *media_graph_walk_next(struct media_graph *graph);
>
>  /**
>   * media_pipeline_start - Mark a pipeline as streaming
> --
> 2.25.1
>
