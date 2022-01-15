Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 028F948F927
	for <lists+linux-media@lfdr.de>; Sat, 15 Jan 2022 21:02:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231128AbiAOUCg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Jan 2022 15:02:36 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:43598 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbiAOUCf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Jan 2022 15:02:35 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8BCBD101E;
        Sat, 15 Jan 2022 21:02:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642276953;
        bh=AoDSoawBBOscx5DcDi6GDKeQOADLuUyIF63RrKwxh+M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qQAzKHXYGgk77nLu29NUOzy1Z+xfM+0p+Hd18Xgw8D6aQuKiZNzb+Sm8VZr97W3kE
         KIwjP/pWsw1dNL7fy5reR4q+RjlMbGgZH7t7trsj9sdTmtHFVHt3iLE9nGYvqcIQWY
         r8K7uEpnxSVnthXybp847pt5j0B9RgbbZ2H2EQC0=
Date:   Sat, 15 Jan 2022 22:02:21 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 2/2] media: media-entity: Simplify media_pipeline_start()
Message-ID: <YeMoTVuO8nbgw9Rr@pendragon.ideasonboard.com>
References: <20220113150042.15630-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220113150042.15630-3-laurent.pinchart+renesas@ideasonboard.com>
 <YeMG1Xgtnq0Qu9ar@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YeMG1Xgtnq0Qu9ar@valkosipuli.retiisi.eu>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Sat, Jan 15, 2022 at 07:39:33PM +0200, Sakari Ailus wrote:
> Moi,
> 
> Thanks for the set.

Ole hyvä.

> On Thu, Jan 13, 2022 at 05:00:42PM +0200, Laurent Pinchart wrote:
> > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > The media_pipeline_start() function has two purposes: it constructs a
> > pipeline by recording the entities that are part of it, gathered from a
> > graph walk, and validate the media links. The pipeline pointer is stored
> > in the media_entity structure as part of this process, and the entity's
> > stream count is increased, to record that the entity is streaming.
> > 
> > When multiple video nodes are present in a pipeline,
> > media_pipeline_start() is typically called on all of them, with the same
> > pipeline pointer. This is taken into account in media_pipeline_start()
> > by skipping validation for entities that are already part of the
> > pipeline, while returning an error if an entity is part of a different
> > pipeline.
> > 
> > It turns out that this process is overly complicated. When
> > media_pipeline_start() is called for the first time, it constructs the
> > full pipeline, adding all entities and validating all the links.
> > Subsequent calls to media_pipeline_start() are then nearly no-ops, they
> > only increase the stream count on the pipeline and on all entities.
> > 
> > The media_entity stream_count field is used for two purposes: checking
> > if the entity is streaming, and detecting when a call to
> > media_pipeline_stop() balances needs to reset the entity pipe pointer to
> > NULL. The former can easily be replaced by a check of the pipe pointer.
> > 
> > Simplify media_pipeline_start() by avoiding the pipeline walk on all
> > calls but the first one, and drop the media_entity stream_count field.
> > media_pipeline_stop() is updated accordingly.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/mc/mc-entity.c | 52 +++++++++++++++---------------------
> >  include/media/media-entity.h | 11 +++-----
> >  2 files changed, 26 insertions(+), 37 deletions(-)
> > 
> > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > index f83e043f0f3b..8ab0913d8d82 100644
> > --- a/drivers/media/mc/mc-entity.c
> > +++ b/drivers/media/mc/mc-entity.c
> > @@ -396,20 +396,21 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
> >  	struct media_link *link;
> >  	int ret;
> >  
> > -	if (!pipe->streaming_count++) {
> > -		ret = media_graph_walk_init(&pipe->graph, mdev);
> > -		if (ret)
> > -			goto error_graph_walk_start;
> > +	if (pipe->streaming_count) {
> > +		pipe->streaming_count++;
> > +		return 0;
> >  	}
> >  
> > +	ret = media_graph_walk_init(&pipe->graph, mdev);
> > +	if (ret)
> > +		return ret;
> > +
> >  	media_graph_walk_start(&pipe->graph, entity);
> >  
> >  	while ((entity = media_graph_walk_next(graph))) {
> >  		DECLARE_BITMAP(active, MEDIA_ENTITY_MAX_PADS);
> >  		DECLARE_BITMAP(has_no_links, MEDIA_ENTITY_MAX_PADS);
> >  
> > -		entity->stream_count++;
> > -
> >  		if (entity->pipe && entity->pipe != pipe) {
> >  			pr_err("Pipe active for %s. Can't start for %s\n",
> >  				entity->name,
> > @@ -418,12 +419,12 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
> >  			goto error;
> >  		}
> >  
> > -		entity->pipe = pipe;
> > -
> >  		/* Already streaming --- no need to check. */
> > -		if (entity->stream_count > 1)
> > +		if (entity->pipe)
> >  			continue;
> >  
> > +		entity->pipe = pipe;
> > +
> >  		if (!entity->ops || !entity->ops->link_validate)
> >  			continue;
> >  
> > @@ -479,6 +480,8 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
> >  		}
> >  	}
> >  
> > +	pipe->streaming_count++;
> > +
> >  	return 0;
> >  
> >  error:
> > @@ -489,24 +492,17 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
> >  	media_graph_walk_start(graph, entity_err);
> >  
> >  	while ((entity_err = media_graph_walk_next(graph))) {
> > -		/* Sanity check for negative stream_count */
> > -		if (!WARN_ON_ONCE(entity_err->stream_count <= 0)) {
> > -			entity_err->stream_count--;
> > -			if (entity_err->stream_count == 0)
> > -				entity_err->pipe = NULL;
> > -		}
> > +		entity_err->pipe = NULL;
> >  
> >  		/*
> > -		 * We haven't increased stream_count further than this
> > -		 * so we quit here.
> > +		 * We haven't started entities further than this so we quit
> > +		 * here.
> >  		 */
> >  		if (entity_err == entity)
> >  			break;
> >  	}
> >  
> > -error_graph_walk_start:
> > -	if (!--pipe->streaming_count)
> > -		media_graph_walk_cleanup(graph);
> > +	media_graph_walk_cleanup(graph);
> >  
> >  	return ret;
> >  }
> > @@ -537,19 +533,15 @@ void __media_pipeline_stop(struct media_entity *entity)
> >  	if (WARN_ON(!pipe))
> >  		return;
> >  
> > +	if (--pipe->streaming_count)
> > +		return;
> > +
> >  	media_graph_walk_start(graph, entity);
> >  
> > -	while ((entity = media_graph_walk_next(graph))) {
> > -		/* Sanity check for negative stream_count */
> > -		if (!WARN_ON_ONCE(entity->stream_count <= 0)) {
> > -			entity->stream_count--;
> > -			if (entity->stream_count == 0)
> > -				entity->pipe = NULL;
> > -		}
> > -	}
> > +	while ((entity = media_graph_walk_next(graph)))
> > +		entity->pipe = NULL;
> >  
> > -	if (!--pipe->streaming_count)
> > -		media_graph_walk_cleanup(graph);
> > +	media_graph_walk_cleanup(graph);
> >  
> >  }
> >  EXPORT_SYMBOL_GPL(__media_pipeline_stop);
> > diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> > index 8546f13c42a9..e3c4fd1e3623 100644
> > --- a/include/media/media-entity.h
> > +++ b/include/media/media-entity.h
> > @@ -268,7 +268,6 @@ enum media_entity_type {
> >   * @pads:	Pads array with the size defined by @num_pads.
> >   * @links:	List of data links.
> >   * @ops:	Entity operations.
> > - * @stream_count: Stream count for the entity.
> >   * @use_count:	Use count for the entity.
> >   * @pipe:	Pipeline this entity belongs to.
> >   * @info:	Union with devnode information.  Kept just for backward
> > @@ -283,10 +282,9 @@ enum media_entity_type {
> >   *
> >   * .. note::
> >   *
> > - *    @stream_count and @use_count reference counts must never be
> > - *    negative, but are signed integers on purpose: a simple ``WARN_ON(<0)``
> > - *    check can be used to detect reference count bugs that would make them
> > - *    negative.
> > + *    The @use_count reference count must never be negative, but is a signed
> > + *    integer on purpose: a simple ``WARN_ON(<0)`` check can be used to detect
> > + *    reference count bugs that would make it negative.
> >   */
> >  struct media_entity {
> >  	struct media_gobj graph_obj;	/* must be first field in struct */
> > @@ -305,7 +303,6 @@ struct media_entity {
> >  
> >  	const struct media_entity_operations *ops;
> >  
> > -	int stream_count;
> >  	int use_count;
> >  
> >  	struct media_pipeline *pipe;
> > @@ -867,7 +864,7 @@ struct media_pad *media_entity_remote_pad(const struct media_pad *pad);
> >   */
> >  static inline bool media_entity_is_streaming(const struct media_entity *entity)
> >  {
> > -	return entity->stream_count > 0;
> > +	return entity->pipe != NULL;
> 
> I'd drop "!= NULL" part; it's redundant.

I usually use "if (pointer)" or "if (!pointer)" without comparing to
NULL, but for some reason, when returning a bool, it feels more explicit
to me to use a comparison. I'm not sure why, maybe because, unlike with
if (), the implicit cast is only apparent when you read the signature of
the function ? Not that it's far away in this case, it's only two lines
up.

> I'll do that when applying if that's fine.

Fine with me, I don't mind either way. Thanks.

> >  }
> >  
> >  /**

-- 
Regards,

Laurent Pinchart
