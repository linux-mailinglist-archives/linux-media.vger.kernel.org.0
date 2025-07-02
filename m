Return-Path: <linux-media+bounces-36624-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A83CAF62FB
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 22:05:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1802C484196
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 20:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A6882D77E0;
	Wed,  2 Jul 2025 20:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WzknEB0S"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7D9289836
	for <linux-media@vger.kernel.org>; Wed,  2 Jul 2025 20:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751486749; cv=none; b=Gi8SfSzBd0k9SYPyIkLxKXlunMPurS7vM3G+haUJxVF3XZ5ck8GWCEN03jQTRnkDHlInW8pADy5Dfd+ZB19RWyF1RMoYKa/azMVPDGPWvk4wazymPNLwMpIQj8aU4EQ4MtNDrg9IGCT7KVvzTCRECfaOKQ8y+LCoz/og67Um580=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751486749; c=relaxed/simple;
	bh=DGJIIFYZMEc8fMqYAG/sdljdMGw54fG59USE+xOL15I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pQoIe5eWHk199HX1pwLy10ID0ojiPdXSpFGLbdOmBbD4E+f/9P5ZS9G0vUegbh45PTk9TKda0suDgIJVsaXu25kfwgrtJprDJow5SAuxG/7RdU+Droekkv4EKQAvGldYoCKfbMYejNIXodlQnms9ag3ileg85fHgwNiodhmNazU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WzknEB0S; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 45E901D4C;
	Wed,  2 Jul 2025 22:05:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751486716;
	bh=DGJIIFYZMEc8fMqYAG/sdljdMGw54fG59USE+xOL15I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WzknEB0SL27igzhcL95hEMWuzc1ZTdkDJtE/dvNoRyjAoY7Er7TV4ExBLUlmHzU5s
	 kqgVTxE97Ds44TLxeho3D+ir1yzPcGa1uN7WBu/bYZLDeWhy2SrJ+lLU4Q+hNQhX5Z
	 uZ15x9ro0FDN2rggkkIohplbbsodKVNWV7P1pb3w=
Date: Wed, 2 Jul 2025 23:05:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH 2/4] media: mc: entity: Embed entity iterator in pipeline
Message-ID: <20250702200511.GK17819@pendragon.ideasonboard.com>
References: <20250702-pipelines-v1-0-34525973e773@ideasonboard.com>
 <20250702-pipelines-v1-2-34525973e773@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250702-pipelines-v1-2-34525973e773@ideasonboard.com>

Hi Dan,

Thank you for the patch.

On Wed, Jul 02, 2025 at 04:15:03PM +0100, Daniel Scally wrote:
> Embed a struct media_pipeline_entity_iter into struct media_pipeline.
> Init the iterator in _media_pipeline_start() and clean it up during
> media_pipeline_cleanup(). Update call-sites for the related functions
> to not require a pointer to a struct media_pipeline_entity_iter.
> 
> With this change the following functions no longer need to be
> exported; make them static.
> 
> media_pipeline_entity_iter_init()
> media_pipeline_entity_iter_cleanup()

The commit message doesn't explain *why* this is desired. That's the
most important information you need in every commit message.

What will happen if code tries to iterate over entities multiple times,
either in consecutive operations, or as nested operations ?

> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  drivers/media/mc/mc-entity.c                  | 24 ++++++----
>  drivers/media/platform/ti/omap3isp/ispvideo.c |  9 +---
>  include/media/media-entity.h                  | 64 +++++++--------------------
>  3 files changed, 33 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index eef2fd4b73a11eba143243c964852cd494422204..30d15a180ad4525e9438083216ac328a4b76653a 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -704,24 +704,22 @@ static int media_pipeline_explore_next_link(struct media_pipeline *pipe,
>  	return 0;
>  }
>  
> -int media_pipeline_entity_iter_init(struct media_pipeline *pipe,
> -				    struct media_pipeline_entity_iter *iter)
> +static int media_pipeline_entity_iter_init(struct media_pipeline *pipe)
>  {
> -	return media_entity_enum_init(&iter->ent_enum, pipe->mdev);
> +	return media_entity_enum_init(&pipe->entity_iter.ent_enum, pipe->mdev);
>  }
> -EXPORT_SYMBOL_GPL(media_pipeline_entity_iter_init);
>  
> -void media_pipeline_entity_iter_cleanup(struct media_pipeline_entity_iter *iter)
> +static void media_pipeline_entity_iter_cleanup(struct media_pipeline *pipe)
>  {
> -	media_entity_enum_cleanup(&iter->ent_enum);
> +	media_entity_enum_cleanup(&pipe->entity_iter.ent_enum);
>  }
> -EXPORT_SYMBOL_GPL(media_pipeline_entity_iter_cleanup);
>  
>  struct media_entity *
>  __media_pipeline_entity_iter_next(struct media_pipeline *pipe,
> -				  struct media_pipeline_entity_iter *iter,
>  				  struct media_entity *entity)
>  {
> +	struct media_pipeline_entity_iter *iter = &pipe->entity_iter;
> +
>  	if (!entity)
>  		iter->cursor = pipe->pads.next;
>  
> @@ -733,7 +731,7 @@ __media_pipeline_entity_iter_next(struct media_pipeline *pipe,
>  		entity = ppad->pad->entity;
>  		iter->cursor = iter->cursor->next;
>  
> -		if (!media_entity_enum_test_and_set(&iter->ent_enum, entity))
> +		if (!media_entity_enum_test(&iter->ent_enum, entity))
>  			return entity;
>  	}
>  
> @@ -743,6 +741,8 @@ EXPORT_SYMBOL_GPL(__media_pipeline_entity_iter_next);
>  
>  static void media_pipeline_cleanup(struct media_pipeline *pipe)
>  {
> +	media_pipeline_entity_iter_cleanup(pipe);
> +
>  	while (!list_empty(&pipe->pads)) {
>  		struct media_pipeline_pad *ppad;
>  
> @@ -928,6 +928,12 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
>  		pad->pipe = pipe;
>  	}
>  
> +	ret = media_pipeline_entity_iter_init(pipe);
> +	if (ret) {
> +		dev_err(mdev->dev, "Failed to init pipeline iterator\n");
> +		goto error;
> +	}
> +
>  	pipe->start_count++;
>  
>  	return 0;
> diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
> index 78e30298c7ad155c70a2a369daa8c232b97e55b7..54ff16d4a2ef1cb6436de98487851caa6e380d7d 100644
> --- a/drivers/media/platform/ti/omap3isp/ispvideo.c
> +++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
> @@ -221,16 +221,11 @@ isp_video_remote_subdev(struct isp_video *video, u32 *pad)
>  static int isp_video_get_graph_data(struct isp_video *video,
>  				    struct isp_pipeline *pipe)
>  {
> -	struct media_pipeline_entity_iter iter;
>  	struct media_entity *entity;
>  	struct isp_video *far_end = NULL;
>  	int ret;
>  
> -	ret = media_pipeline_entity_iter_init(&pipe->pipe, &iter);
> -	if (ret)
> -		return ret;
> -
> -	media_pipeline_for_each_entity(&pipe->pipe, &iter, entity) {
> +	media_pipeline_for_each_entity(&pipe->pipe, entity) {
>  		struct isp_video *__video;
>  
>  		media_entity_enum_set(&pipe->ent_enum, entity);
> @@ -249,8 +244,6 @@ static int isp_video_get_graph_data(struct isp_video *video,
>  			far_end = __video;
>  	}
>  
> -	media_pipeline_entity_iter_cleanup(&iter);
> -
>  	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
>  		pipe->input = far_end;
>  		pipe->output = video;
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index 64cf590b11343f68a456c5870ca2f32917c122f9..0f3bad2b9c319b1792bd62fff336bf09c1a42c1b 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -97,6 +97,17 @@ struct media_graph {
>  	int top;
>  };
>  
> +/**
> + * struct media_pipeline_entity_iter - Iterator for media_pipeline_for_each_entity
> + *
> + * @ent_enum: The entity enumeration tracker
> + * @cursor: The current element
> + */
> +struct media_pipeline_entity_iter {
> +	struct media_entity_enum ent_enum;
> +	struct list_head *cursor;
> +};
> +
>  /**
>   * struct media_pipeline - Media pipeline related information
>   *
> @@ -104,12 +115,14 @@ struct media_graph {
>   * @mdev:		The media device the pipeline is part of
>   * @pads:		List of media_pipeline_pad
>   * @start_count:	Media pipeline start - stop count
> + * @entity_iter:	Iterator for media_pipeline_for_each_entity()
>   */
>  struct media_pipeline {
>  	bool allocated;
>  	struct media_device *mdev;
>  	struct list_head pads;
>  	int start_count;
> +	struct media_pipeline_entity_iter entity_iter;
>  };
>  
>  /**
> @@ -139,17 +152,6 @@ struct media_pipeline_pad_iter {
>  	struct list_head *cursor;
>  };
>  
> -/**
> - * struct media_pipeline_entity_iter - Iterator for media_pipeline_for_each_entity
> - *
> - * @ent_enum: The entity enumeration tracker
> - * @cursor: The current element
> - */
> -struct media_pipeline_entity_iter {
> -	struct media_entity_enum ent_enum;
> -	struct list_head *cursor;
> -};
> -
>  /**
>   * struct media_link - A link object part of a media graph.
>   *
> @@ -1211,55 +1213,23 @@ __media_pipeline_pad_iter_next(struct media_pipeline *pipe,
>  	     pad != NULL;						\
>  	     pad = __media_pipeline_pad_iter_next((pipe), iter, pad))
>  
> -/**
> - * media_pipeline_entity_iter_init - Initialize a pipeline entity iterator
> - * @pipe: The pipeline
> - * @iter: The iterator
> - *
> - * This function must be called to initialize the iterator before using it in a
> - * media_pipeline_for_each_entity() loop. The iterator must be destroyed by a
> - * call to media_pipeline_entity_iter_cleanup after the loop (including in code
> - * paths that break from the loop).
> - *
> - * The same iterator can be used in multiple consecutive loops without being
> - * destroyed and reinitialized.
> - *
> - * Return: 0 on success or a negative error code otherwise.
> - */
> -int media_pipeline_entity_iter_init(struct media_pipeline *pipe,
> -				    struct media_pipeline_entity_iter *iter);
> -
> -/**
> - * media_pipeline_entity_iter_cleanup - Destroy a pipeline entity iterator
> - * @iter: The iterator
> - *
> - * This function must be called to destroy iterators initialized with
> - * media_pipeline_entity_iter_init().
> - */
> -void media_pipeline_entity_iter_cleanup(struct media_pipeline_entity_iter *iter);
> -
>  struct media_entity *
>  __media_pipeline_entity_iter_next(struct media_pipeline *pipe,
> -				  struct media_pipeline_entity_iter *iter,
>  				  struct media_entity *entity);
>  
>  /**
>   * media_pipeline_for_each_entity - Iterate on all entities in a media pipeline
>   * @pipe: The pipeline
> - * @iter: The iterator (struct media_pipeline_entity_iter)
>   * @entity: The iterator entity
>   *
>   * Iterate on all entities in a media pipeline. This is only valid after the
>   * pipeline has been built with media_pipeline_start() and before it gets
> - * destroyed with media_pipeline_stop(). The iterator must be initialized with
> - * media_pipeline_entity_iter_init() before iteration, and destroyed with
> - * media_pipeline_entity_iter_cleanup() after (including in code paths that
> - * break from the loop).
> + * destroyed with media_pipeline_stop().
>   */
> -#define media_pipeline_for_each_entity(pipe, iter, entity)			\
> -	for (entity = __media_pipeline_entity_iter_next((pipe), iter, NULL);	\
> +#define media_pipeline_for_each_entity(pipe, entity)			\
> +	for (entity = __media_pipeline_entity_iter_next((pipe), NULL);	\
>  	     entity != NULL;							\
> -	     entity = __media_pipeline_entity_iter_next((pipe), iter, entity))
> +	     entity = __media_pipeline_entity_iter_next((pipe), entity))
>  
>  /**
>   * media_pipeline_alloc_start - Mark a pipeline as streaming

-- 
Regards,

Laurent Pinchart

