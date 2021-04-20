Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 207213657AA
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 13:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231769AbhDTLi4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 07:38:56 -0400
Received: from mga07.intel.com ([134.134.136.100]:40939 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231422AbhDTLiu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 07:38:50 -0400
IronPort-SDR: dEwEJMvrUzecHubf5+2enP27Cdni0IuRcXUaksgfYRA9VSQ6YvRVh45e3CrYyDB8lpDF6k/dQ+
 pUVdOW8T+dmw==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="259445935"
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; 
   d="scan'208";a="259445935"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 04:38:17 -0700
IronPort-SDR: Dxb+YNLs6xjK3mbg4h0py1sPdnMofnHpX/qp8orK1Xtl+XXu+8uki/2NZhmnAQ5+5tPTH2NxAf
 VpmYpRi8spwg==
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; 
   d="scan'208";a="385283522"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 04:38:15 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 66E0C202EC;
        Tue, 20 Apr 2021 14:38:12 +0300 (EEST)
Date:   Tue, 20 Apr 2021 14:38:12 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v5 06/24] media: entity: Move the pipeline from entity to
 pads
Message-ID: <20210420113812.GL3@paasikivi.fi.intel.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
 <20210415130450.421168-7-tomi.valkeinen@ideasonboard.com>
 <YHxztaOVawtJxzIP@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YHxztaOVawtJxzIP@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sun, Apr 18, 2021 at 09:00:21PM +0300, Laurent Pinchart wrote:
> Hi Tomi and Sakari,
> 
> Thank you for the patch.
> 
> On Thu, Apr 15, 2021 at 04:04:32PM +0300, Tomi Valkeinen wrote:
> > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > 
> > This moves the pipe and stream_count fields from struct media_entity to
> > struct media_pad. Effectively streams become pad-specific rather than
> > being entity specific, allowing several independent streams to traverse a
> > single entity and an entity to be part of several streams.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > - Update documentation to use 'pads'
> > - Use the media pad iterator in media_entity.c
> > - Update rcar-dma.c to use the new per-pad stream count
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > 
> > - Fix cleanup in the error path of __media_pipeline_start()
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > ---
> >  drivers/media/mc/mc-entity.c                  | 68 +++++++++++--------
> >  drivers/media/platform/exynos4-is/fimc-isp.c  |  2 +-
> >  drivers/media/platform/exynos4-is/fimc-lite.c |  2 +-
> >  drivers/media/platform/omap3isp/isp.c         |  2 +-
> >  drivers/media/platform/omap3isp/ispvideo.c    |  2 +-
> >  drivers/media/platform/omap3isp/ispvideo.h    |  2 +-
> >  drivers/media/platform/rcar-vin/rcar-core.c   | 16 +++--
> >  drivers/media/platform/rcar-vin/rcar-dma.c    |  2 +-
> >  drivers/media/platform/xilinx/xilinx-dma.c    |  2 +-
> >  drivers/media/platform/xilinx/xilinx-dma.h    |  2 +-
> >  drivers/staging/media/imx/imx-media-utils.c   |  2 +-
> >  drivers/staging/media/omap4iss/iss.c          |  2 +-
> >  drivers/staging/media/omap4iss/iss_video.c    |  2 +-
> >  drivers/staging/media/omap4iss/iss_video.h    |  2 +-
> >  include/media/media-entity.h                  | 21 +++---
> >  15 files changed, 73 insertions(+), 56 deletions(-)
> > 
> > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > index 830841e0cd28..b6e5aa639c26 100644
> > --- a/drivers/media/mc/mc-entity.c
> > +++ b/drivers/media/mc/mc-entity.c
> > @@ -423,24 +423,28 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
> >  
> >  	while ((pad = media_graph_walk_next(graph))) {
> >  		struct media_entity *entity = pad->entity;
> > +		bool skip_validation = pad->pipe;
> 
> I'd write
> 
> 		bool skip_validation = pad->pipe != NULL;
> 
> > +		struct media_pad *iter;
> >  
> >  		DECLARE_BITMAP(active, MEDIA_ENTITY_MAX_PADS);
> >  		DECLARE_BITMAP(has_no_links, MEDIA_ENTITY_MAX_PADS);
> >  
> > -		entity->stream_count++;
> > -
> > -		if (entity->pipe && entity->pipe != pipe) {
> > -			pr_err("Pipe active for %s. Can't start for %s\n",
> > -				entity->name,
> > -				pad_err->entity->name);
> > -			ret = -EBUSY;
> > -			goto error;
> > +		media_entity_for_each_pad(entity, iter) {
> > +			if (iter->pipe && iter->pipe != pipe) {
> > +				pr_err("Pipe active for %s. Can't start for %s\n",
> > +				       entity->name, iter->entity->name);
> > +				ret = -EBUSY;
> > +			} else {
> > +				iter->pipe = pipe;
> > +			}
> > +			iter->stream_count++;
> >  		}
> >  
> > -		entity->pipe = pipe;
> > +		if (ret)
> > +			goto error;
> >  
> > -		/* Already streaming --- no need to check. */
> > -		if (entity->stream_count > 1)
> > +		/* Already part of the pipeline, skip validation. */
> > +		if (skip_validation)
> >  			continue;
> >  
> >  		if (!entity->ops || !entity->ops->link_validate)
> > @@ -509,20 +513,23 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
> >  	media_graph_walk_start(graph, pad_err);
> >  
> >  	while ((pad_err = media_graph_walk_next(graph))) {
> > -		struct media_entity *entity_err = pad_err->entity;
> > -
> > -		/* Sanity check for negative stream_count */
> > -		if (!WARN_ON_ONCE(entity_err->stream_count <= 0)) {
> > -			entity_err->stream_count--;
> > -			if (entity_err->stream_count == 0)
> > -				entity_err->pipe = NULL;
> > +		struct media_entity *entity = pad_err->entity;
> > +		struct media_pad *iter;
> > +
> > +		media_entity_for_each_pad(entity, iter) {
> > +			/* Sanity check for negative stream_count */
> > +			if (!WARN_ON_ONCE(iter->stream_count <= 0)) {
> > +				--iter->stream_count;
> > +				if (iter->stream_count == 0)
> > +					iter->pipe = NULL;
> > +			}
> >  		}
> >  
> >  		/*
> >  		 * We haven't increased stream_count further than this
> >  		 * so we quit here.
> >  		 */
> > -		if (pad_err == pad)
> > +		if (pad_err->entity == pad->entity)
> >  			break;
> >  	}
> >  
> > @@ -549,7 +556,7 @@ EXPORT_SYMBOL_GPL(media_pipeline_start);
> >  
> >  void __media_pipeline_stop(struct media_entity *entity)
> >  {
> > -	struct media_pipeline *pipe = entity->pipe;
> > +	struct media_pipeline *pipe = entity->pads->pipe;
> >  	struct media_graph *graph = &pipe->graph;
> >  	struct media_pad *pad;
> >  
> > @@ -564,12 +571,15 @@ void __media_pipeline_stop(struct media_entity *entity)
> >  
> >  	while ((pad = media_graph_walk_next(graph))) {
> >  		struct media_entity *entity = pad->entity;
> > -
> > -		/* Sanity check for negative stream_count */
> > -		if (!WARN_ON_ONCE(entity->stream_count <= 0)) {
> > -			entity->stream_count--;
> > -			if (entity->stream_count == 0)
> > -				entity->pipe = NULL;
> > +		struct media_pad *iter;
> > +
> > +		media_entity_for_each_pad(entity, iter) {
> > +			/* Sanity check for negative stream_count */
> > +			if (!WARN_ON_ONCE(iter->stream_count <= 0)) {
> > +				iter->stream_count--;
> > +				if (iter->stream_count == 0)
> > +					iter->pipe = NULL;
> > +			}
> >  		}
> >  	}
> >  
> > @@ -839,7 +849,7 @@ int __media_entity_setup_link(struct media_link *link, u32 flags)
> >  {
> >  	const u32 mask = MEDIA_LNK_FL_ENABLED;
> >  	struct media_device *mdev;
> > -	struct media_entity *source, *sink;
> > +	struct media_pad *source, *sink;
> >  	int ret = -EBUSY;
> >  
> >  	if (link == NULL)
> > @@ -855,8 +865,8 @@ int __media_entity_setup_link(struct media_link *link, u32 flags)
> >  	if (link->flags == flags)
> >  		return 0;
> >  
> > -	source = link->source->entity;
> > -	sink = link->sink->entity;
> > +	source = link->source;
> > +	sink = link->sink;
> >  
> >  	if (!(link->flags & MEDIA_LNK_FL_DYNAMIC) &&
> >  	    (source->stream_count || sink->stream_count))
> > diff --git a/drivers/media/platform/exynos4-is/fimc-isp.c b/drivers/media/platform/exynos4-is/fimc-isp.c
> > index a77c49b18511..563d07f630bc 100644
> > --- a/drivers/media/platform/exynos4-is/fimc-isp.c
> > +++ b/drivers/media/platform/exynos4-is/fimc-isp.c
> > @@ -223,7 +223,7 @@ static int fimc_isp_subdev_set_fmt(struct v4l2_subdev *sd,
> >  			}
> >  		}
> >  	} else {
> > -		if (sd->entity.stream_count == 0) {
> > +		if (sd->entity.pads->stream_count == 0) {
> >  			if (fmt->pad == FIMC_ISP_SD_PAD_SINK) {
> >  				struct v4l2_subdev_format format = *fmt;
> >  
> > diff --git a/drivers/media/platform/exynos4-is/fimc-lite.c b/drivers/media/platform/exynos4-is/fimc-lite.c
> > index fe20af3a7178..56773a0be8d9 100644
> > --- a/drivers/media/platform/exynos4-is/fimc-lite.c
> > +++ b/drivers/media/platform/exynos4-is/fimc-lite.c
> > @@ -1070,7 +1070,7 @@ static int fimc_lite_subdev_set_fmt(struct v4l2_subdev *sd,
> >  	mutex_lock(&fimc->lock);
> >  
> >  	if ((atomic_read(&fimc->out_path) == FIMC_IO_ISP &&
> > -	    sd->entity.stream_count > 0) ||
> > +	    sd->entity.pads->stream_count > 0) ||
> >  	    (atomic_read(&fimc->out_path) == FIMC_IO_DMA &&
> >  	    vb2_is_busy(&fimc->vb_queue))) {
> >  		mutex_unlock(&fimc->lock);
> > diff --git a/drivers/media/platform/omap3isp/isp.c b/drivers/media/platform/omap3isp/isp.c
> > index a6bb7d9bf75f..4ef623f10a44 100644
> > --- a/drivers/media/platform/omap3isp/isp.c
> > +++ b/drivers/media/platform/omap3isp/isp.c
> > @@ -930,7 +930,7 @@ static int isp_pipeline_is_last(struct media_entity *me)
> >  	struct isp_pipeline *pipe;
> >  	struct media_pad *pad;
> >  
> > -	if (!me->pipe)
> > +	if (!me->pads->pipe)
> >  		return 0;
> >  	pipe = to_isp_pipeline(me);
> >  	if (pipe->stream_state == ISP_PIPELINE_STREAM_STOPPED)
> > diff --git a/drivers/media/platform/omap3isp/ispvideo.c b/drivers/media/platform/omap3isp/ispvideo.c
> > index 49cde04bfb21..f3bee79cdd85 100644
> > --- a/drivers/media/platform/omap3isp/ispvideo.c
> > +++ b/drivers/media/platform/omap3isp/ispvideo.c
> > @@ -1094,7 +1094,7 @@ isp_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
> >  	/* Start streaming on the pipeline. No link touching an entity in the
> >  	 * pipeline can be activated or deactivated once streaming is started.
> >  	 */
> > -	pipe = video->video.entity.pipe
> > +	pipe = video->video.entity.pads->pipe
> >  	     ? to_isp_pipeline(&video->video.entity) : &video->pipe;
> >  
> >  	ret = media_entity_enum_init(&pipe->ent_enum, &video->isp->media_dev);
> > diff --git a/drivers/media/platform/omap3isp/ispvideo.h b/drivers/media/platform/omap3isp/ispvideo.h
> > index a0908670c0cf..4c9c5b719ec5 100644
> > --- a/drivers/media/platform/omap3isp/ispvideo.h
> > +++ b/drivers/media/platform/omap3isp/ispvideo.h
> > @@ -100,7 +100,7 @@ struct isp_pipeline {
> >  };
> >  
> >  #define to_isp_pipeline(__e) \
> > -	container_of((__e)->pipe, struct isp_pipeline, pipe)
> > +	container_of((__e)->pads->pipe, struct isp_pipeline, pipe)
> >  
> >  static inline int isp_pipeline_ready(struct isp_pipeline *pipe)
> >  {
> > diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> > index cb3025992817..07ec008aacc4 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-core.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> > @@ -132,13 +132,17 @@ static int rvin_group_link_notify(struct media_link *link, u32 flags,
> >  		return 0;
> >  
> >  	/*
> > -	 * Don't allow link changes if any entity in the graph is
> > -	 * streaming, modifying the CHSEL register fields can disrupt
> > -	 * running streams.
> > +	 * Don't allow link changes if any stream in the graph is active as
> > +	 * modifying the CHSEL register fields can disrupt running streams.
> >  	 */
> > -	media_device_for_each_entity(entity, &group->mdev)
> > -		if (entity->stream_count)
> > -			return -EBUSY;
> > +	media_device_for_each_entity(entity, &group->mdev) {
> > +		struct media_pad *iter;
> > +
> > +		media_entity_for_each_pad(entity, iter) {
> > +			if (iter->stream_count)
> > +				return -EBUSY;
> > +		}
> 
> Would it be enough to test entity->pads->stream_count, as the stream
> count should be the same for all pads ?

For now, yes. But once routes are added, it wouldn't be enough anymore,
would it?

> 
> > +	}
> >  
> >  	mutex_lock(&group->lock);
> >  
> > diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> > index f30dafbdf61c..7994262c9b63 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> > @@ -1231,7 +1231,7 @@ static int rvin_set_stream(struct rvin_dev *vin, int on)
> >  	 */
> >  	mdev = vin->vdev.entity.graph_obj.mdev;
> >  	mutex_lock(&mdev->graph_mutex);
> > -	pipe = sd->entity.pipe ? sd->entity.pipe : &vin->vdev.pipe;
> > +	pipe = sd->entity.pads->pipe ? sd->entity.pads->pipe : &vin->vdev.pipe;
> >  	ret = __media_pipeline_start(&vin->vdev.entity, pipe);
> >  	mutex_unlock(&mdev->graph_mutex);
> >  	if (ret)
> > diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
> > index 8df3c43aecbe..7fa0467dddde 100644
> > --- a/drivers/media/platform/xilinx/xilinx-dma.c
> > +++ b/drivers/media/platform/xilinx/xilinx-dma.c
> > @@ -403,7 +403,7 @@ static int xvip_dma_start_streaming(struct vb2_queue *vq, unsigned int count)
> >  	 * Use the pipeline object embedded in the first DMA object that starts
> >  	 * streaming.
> >  	 */
> > -	pipe = dma->video.entity.pipe
> > +	pipe = dma->video.entity.pads->pipe
> >  	     ? to_xvip_pipeline(&dma->video.entity) : &dma->pipe;
> >  
> >  	ret = media_pipeline_start(&dma->video.entity, &pipe->pipe);
> > diff --git a/drivers/media/platform/xilinx/xilinx-dma.h b/drivers/media/platform/xilinx/xilinx-dma.h
> > index 2378bdae57ae..69ced71a5696 100644
> > --- a/drivers/media/platform/xilinx/xilinx-dma.h
> > +++ b/drivers/media/platform/xilinx/xilinx-dma.h
> > @@ -47,7 +47,7 @@ struct xvip_pipeline {
> >  
> >  static inline struct xvip_pipeline *to_xvip_pipeline(struct media_entity *e)
> >  {
> > -	return container_of(e->pipe, struct xvip_pipeline, pipe);
> > +	return container_of(e->pads->pipe, struct xvip_pipeline, pipe);
> >  }
> >  
> >  /**
> > diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
> > index 5128915a5d6f..04b7c6bdcd85 100644
> > --- a/drivers/staging/media/imx/imx-media-utils.c
> > +++ b/drivers/staging/media/imx/imx-media-utils.c
> > @@ -913,7 +913,7 @@ int imx_media_pipeline_set_stream(struct imx_media_dev *imxmd,
> >  			__media_pipeline_stop(entity);
> >  	} else {
> >  		v4l2_subdev_call(sd, video, s_stream, 0);
> > -		if (entity->pipe)
> > +		if (entity->pads->pipe)
> >  			__media_pipeline_stop(entity);
> >  	}
> >  
> > diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
> > index 085397045b36..4f4573219337 100644
> > --- a/drivers/staging/media/omap4iss/iss.c
> > +++ b/drivers/staging/media/omap4iss/iss.c
> > @@ -543,7 +543,7 @@ static int iss_pipeline_is_last(struct media_entity *me)
> >  	struct iss_pipeline *pipe;
> >  	struct media_pad *pad;
> >  
> > -	if (!me->pipe)
> > +	if (!me->pads->pipe)
> >  		return 0;
> >  	pipe = to_iss_pipeline(me);
> >  	if (pipe->stream_state == ISS_PIPELINE_STREAM_STOPPED)
> > diff --git a/drivers/staging/media/omap4iss/iss_video.c b/drivers/staging/media/omap4iss/iss_video.c
> > index 9f3ff5a37d90..9d7bf8c85558 100644
> > --- a/drivers/staging/media/omap4iss/iss_video.c
> > +++ b/drivers/staging/media/omap4iss/iss_video.c
> > @@ -870,7 +870,7 @@ iss_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
> >  	 * Start streaming on the pipeline. No link touching an entity in the
> >  	 * pipeline can be activated or deactivated once streaming is started.
> >  	 */
> > -	pipe = pad->entity->pipe
> > +	pipe = pad->pipe
> >  	     ? to_iss_pipeline(pad->entity) : &video->pipe;
> >  	pipe->external = NULL;
> >  	pipe->external_rate = 0;
> > diff --git a/drivers/staging/media/omap4iss/iss_video.h b/drivers/staging/media/omap4iss/iss_video.h
> > index 526281bf0051..9b8ec27bf87d 100644
> > --- a/drivers/staging/media/omap4iss/iss_video.h
> > +++ b/drivers/staging/media/omap4iss/iss_video.h
> > @@ -91,7 +91,7 @@ struct iss_pipeline {
> >  };
> >  
> >  #define to_iss_pipeline(__e) \
> > -	container_of((__e)->pipe, struct iss_pipeline, pipe)
> > +	container_of((__e)->pads->pipe, struct iss_pipeline, pipe)
> >  
> >  static inline int iss_pipeline_ready(struct iss_pipeline *pipe)
> >  {
> > diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> > index 52b1a1cab57a..b8f94662526c 100644
> > --- a/include/media/media-entity.h
> > +++ b/include/media/media-entity.h
> > @@ -180,15 +180,24 @@ enum media_pad_signal_type {
> >   *
> >   * @graph_obj:	Embedded structure containing the media object common data
> >   * @entity:	Entity this pad belongs to
> > + * @pipe:	Pipeline this pad belongs to.
> > + * @stream_count: Stream count for the pad.
> 
> No period at the end of the lines.
> 
> >   * @index:	Pad index in the entity pads array, numbered from 0 to n
> >   * @sig_type:	Type of the signal inside a media pad
> >   * @flags:	Pad flags, as defined in
> >   *		:ref:`include/uapi/linux/media.h <media_header>`
> >   *		(seek for ``MEDIA_PAD_FL_*``)
> > + * .. note::
> > + *
> > + *    @stream_count reference count must never be negative, but is a signed
> > + *    integer on purpose: a simple ``WARN_ON(<0)`` check can be used to
> > + *    detect reference count bugs that would make them negative.
> 
> s/them/it/
> 
> >   */
> >  struct media_pad {
> >  	struct media_gobj graph_obj;	/* must be first field in struct */
> >  	struct media_entity *entity;
> > +	struct media_pipeline *pipe;
> > +	int stream_count;
> >  	u16 index;
> >  	enum media_pad_signal_type sig_type;
> >  	unsigned long flags;
> > @@ -267,9 +276,7 @@ enum media_entity_type {
> >   * @pads:	Pads array with the size defined by @num_pads.
> >   * @links:	List of data links.
> >   * @ops:	Entity operations.
> > - * @stream_count: Stream count for the entity.
> >   * @use_count:	Use count for the entity.
> > - * @pipe:	Pipeline this entity belongs to.
> >   * @info:	Union with devnode information.  Kept just for backward
> >   *		compatibility.
> >   * @info.dev:	Contains device major and minor info.
> > @@ -282,10 +289,9 @@ enum media_entity_type {
> >   *
> >   * .. note::
> >   *
> > - *    @stream_count and @use_count reference counts must never be
> > - *    negative, but are signed integers on purpose: a simple ``WARN_ON(<0)``
> > - *    check can be used to detect reference count bugs that would make them
> > - *    negative.
> > + *    @use_count reference count must never be negative, but is a signed
> > + *    integer on purpose: a simple ``WARN_ON(<0)`` check can be used to
> > + *    detect reference count bugs that would make them negative.
> 
> s/them/it/
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> >   */
> >  struct media_entity {
> >  	struct media_gobj graph_obj;	/* must be first field in struct */
> > @@ -304,11 +310,8 @@ struct media_entity {
> >  
> >  	const struct media_entity_operations *ops;
> >  
> > -	int stream_count;
> >  	int use_count;
> >  
> > -	struct media_pipeline *pipe;
> > -
> >  	union {
> >  		struct {
> >  			u32 major;
> 

-- 
Sakari Ailus
