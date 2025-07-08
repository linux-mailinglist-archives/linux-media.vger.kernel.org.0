Return-Path: <linux-media+bounces-37112-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F18C0AFCC33
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 15:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 690324A044C
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 13:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78CCC2DEA62;
	Tue,  8 Jul 2025 13:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JqJ2duxg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3955F2DCBF7;
	Tue,  8 Jul 2025 13:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751981391; cv=none; b=F6vzMDWrmEAnAKLbhfzAmebyJ6OfCn0dd/sKNMMG/3kRWen5zjfd7jQxQkUaTwetS5KzlAJmO/7V5aK9u88IfJjUldauVbBE/7cbOrxcJNwudwmuoyS2wgQMVaXwIGaZK7mWdF8X1RZDbTR3fOKGhfKRrmG022abIUvXdK8B7/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751981391; c=relaxed/simple;
	bh=A1EKSVabl+qhk3bA2YiacxsRGtRMsWUcQIeCfGtmNdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I/1k4hdnsJeuPFCozF1Z4uaszCRG2C6rnob7g8d5fHcAjqoVM1sF/oEY/Vmkkr67OLDabcmt+XnsWmvYF6vvByW/V/kE11esh6eGUSWHoEFds5WuoUU8t4CK6tj7zWIl1GPxQmjiMgvIYk37VUjDwBkuDgTlSp3PsZc7LiKR9xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JqJ2duxg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-136-241.net.vodafone.it [5.90.136.241])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 48DB68FA;
	Tue,  8 Jul 2025 15:29:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751981360;
	bh=A1EKSVabl+qhk3bA2YiacxsRGtRMsWUcQIeCfGtmNdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JqJ2duxgrsQe8LeEu5tUDxUiCIg2q8v3YETbfTbrW8l5/LRLjknAhXVNoHhDsrSMw
	 nidnBq+xYIH0v90O1FcZ+KWXRGb6nky9HASjB+kdC0vUXpYN+ov+tG6gXPFdpTSdmz
	 /DYDyf8V+IPUHR0Yz3YfY3P2gfeqI3gqZWrX68BQ=
Date: Tue, 8 Jul 2025 15:29:42 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, jacopo.mondi@ideasonboard.com, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v3 1/5] media: mc: entity: Add pipeline_started/stopped
 ops
Message-ID: <3wprfbxjxteat5vxncys2u2zjkhwquxd4wldk2qka4ooz2synk@5n3zn2sqalml>
References: <20250704-ivc-v3-0-5c45d936ef2e@ideasonboard.com>
 <20250704-ivc-v3-1-5c45d936ef2e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250704-ivc-v3-1-5c45d936ef2e@ideasonboard.com>

Hi Dan

On Fri, Jul 04, 2025 at 12:20:18PM +0100, Daniel Scally wrote:
> Add two new members to struct media_entity_operations, along with new
> functions in media-entity.c to traverse a media pipeline and call the
> new operations. The new functions are intended to be used to signal
> to a media pipeline that it has fully started, with the entity ops
> allowing drivers to define some action to be taken when those
> conditions are met.
>
> The combination of the new functions and operations allows drivers
> which are part of a multi-driver pipeline to delay actually starting
> streaming until all of the conditions for streaming succcessfully are
> met across all drivers.
>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v4:
>
> 	- Reverted to having the iter variable
>
> Changes in v3:
>
> 	- Dropped the iter variable now that the pipeline entity
> 	  iterator functions don't need it.
> 	- Updated documentation to specify Optional and return
> 	  values
>
> Changes in v2:
>
> 	- Refactored media_pipeline_started() such that the cleanup
> 	  function for media_pipeline_entity_iter is unconditionally
> 	  called
> 	- Avoided using media_entity_call() helper for operation that
> 	  has return type void to avoid compiler warnings
> ---
>  drivers/media/mc/mc-entity.c | 46 ++++++++++++++++++++++++++++++++++++++++++++
>  include/media/media-entity.h | 29 ++++++++++++++++++++++++++++
>  2 files changed, 75 insertions(+)
>
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 045590905582054c46656e20463271b1f93fa6b4..d3443537d4304e12cb015630101efba22375c011 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -1053,6 +1053,52 @@ __media_pipeline_entity_iter_next(struct media_pipeline *pipe,
>  }
>  EXPORT_SYMBOL_GPL(__media_pipeline_entity_iter_next);
>
> +int media_pipeline_started(struct media_pipeline *pipe)
> +{
> +	struct media_pipeline_entity_iter iter;
> +	struct media_entity *entity;
> +	int ret;
> +
> +	ret = media_pipeline_entity_iter_init(pipe, &iter);
> +	if (ret)
> +		return ret;
> +
> +	media_pipeline_for_each_entity(pipe, &iter, entity) {
> +		ret = media_entity_call(entity, pipeline_started);
> +		if (ret && ret != -ENOIOCTLCMD)
> +			break;
> +	}
> +
> +	media_pipeline_entity_iter_cleanup(&iter);
> +
> +	ret = ret == -ENOIOCTLCMD ? 0 : ret;
> +	if (ret)
> +		media_pipeline_stopped(pipe);

If you take my suggestion to limit the return value of
video_device_pipeline_started() to three possible error codes, you
could return -EINVAL here

> +
> +	return ret;

and 0 here

> +}
> +EXPORT_SYMBOL_GPL(media_pipeline_started);
> +
> +int media_pipeline_stopped(struct media_pipeline *pipe)
> +{
> +	struct media_pipeline_entity_iter iter;
> +	struct media_entity *entity;
> +	int ret;
> +
> +	ret = media_pipeline_entity_iter_init(pipe, &iter);
> +	if (ret)
> +		return ret;
> +
> +	media_pipeline_for_each_entity(pipe, &iter, entity)
> +		if (entity->ops && entity->ops->pipeline_stopped)
> +			entity->ops->pipeline_stopped(entity);
> +
> +	media_pipeline_entity_iter_cleanup(&iter);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(media_pipeline_stopped);
> +
>  /* -----------------------------------------------------------------------------
>   * Links management
>   */
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index 64cf590b11343f68a456c5870ca2f32917c122f9..ad658f42357ec505c84d9479bbbf18494da7f939 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -269,6 +269,10 @@ struct media_pad {
>   *			media_entity_has_pad_interdep().
>   *			Optional: If the operation isn't implemented all pads
>   *			will be considered as interdependent.
> + * @pipeline_started:	Notify this entity that the pipeline it is a part of has
> + *			been started
> + * @pipeline_stopped:	Notify this entity that the pipeline it is a part of has
> + *			been stopped

The documentation of the other functions end with a full stop.
If the operation is optional, I would specify it here like it's done
for other operations

>   *
>   * .. note::
>   *
> @@ -284,6 +288,8 @@ struct media_entity_operations {
>  	int (*link_validate)(struct media_link *link);
>  	bool (*has_pad_interdep)(struct media_entity *entity, unsigned int pad0,
>  				 unsigned int pad1);
> +	int (*pipeline_started)(struct media_entity *entity);
> +	void (*pipeline_stopped)(struct media_entity *entity);
>  };
>
>  /**
> @@ -1261,6 +1267,29 @@ __media_pipeline_entity_iter_next(struct media_pipeline *pipe,
>  	     entity != NULL;							\
>  	     entity = __media_pipeline_entity_iter_next((pipe), iter, entity))
>
> +/**
> + * media_pipeline_started - Inform entities in a pipeline that it has started
> + * @pipe:	The pipeline
> + *
> + * Iterate on all entities in a media pipeline and call their pipeline_started
> + * member of media_entity_operations. Optional.

I would move "Optional" to the documentation of the media entity

> + *
> + * Return: zero on success, or a negative error code passed through from an
> + * entity's .pipeline_started() operation.
> + */
> +int media_pipeline_started(struct media_pipeline *pipe);
> +
> +/**
> + * media_pipeline_stopped - Inform entities in a pipeline that it has stopped
> + * @pipe:	The pipeline
> + *
> + * Iterate on all entities in a media pipeline and call their pipeline_stopped
> + * member of media_entity_operations. Optional.
> + *
> + * Return: zero on success, or -ENOMEM if the iterator initialisation failed.
> + */
> +int media_pipeline_stopped(struct media_pipeline *pipe);
> +
>  /**
>   * media_pipeline_alloc_start - Mark a pipeline as streaming
>   * @pad: Starting pad
>
> --
> 2.34.1
>
>

