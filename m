Return-Path: <linux-media+bounces-38899-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B11A6B1AF93
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 09:46:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE4097ADAE9
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 07:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA3F12236F7;
	Tue,  5 Aug 2025 07:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="W0MHZPoW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1522A932;
	Tue,  5 Aug 2025 07:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754379969; cv=none; b=cV0c6E64B4wmoT9Bh/ZIjhNO6aLeLZ5mojVnOjgjRXmGFiPWtrZv0yoEuFHCUNduRp9+sX2qXwGsbYp6OLMKyv/y4UaJ11NFi8AeHhwCqjS3wIz7A9OWeiXnChnweOmab+BpBXtKS+OuZgzMkzn2JINS4vMXS57QyGZGFwHPQX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754379969; c=relaxed/simple;
	bh=gnPMY+bjgJHtePly1Zpr7RSgl4DEQB09mIpl2nUlJXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cj4FUAqK0XvZY0IXGPiDXizyW3EYS9HAgNqvNQvSXbvtYfNcfwPNnDlRKsVdmAVUpK4T7rfs2RPo0zGM4jS2FXk2/uynj0yUr1+LQOfywmgy+tHpu5vGSxbp8Plrb1KTSISIXeDIprxo5eoLfwmhSkdp684vRgg1e/+jVMCkLCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=W0MHZPoW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5DE7E3997;
	Tue,  5 Aug 2025 09:45:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754379914;
	bh=gnPMY+bjgJHtePly1Zpr7RSgl4DEQB09mIpl2nUlJXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W0MHZPoWJxeiDNr6pGXUIx4n+v9t1ZJcFgrD/YrMJtreLAP1CEpy3rPggTEH0sZXe
	 drIdCgE8tK0tQgE/QCvUkfjlMVvh+t9V0+Ny8PSAzSabBY84DuvIyD552iNxIaUFxg
	 lFUun0GQ8vzCJe54NIT4sIjGAd/mRhCVb1lRvkc8=
Date: Tue, 5 Aug 2025 09:45:57 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jerome.forissier@linaro.org, 
	kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v11 01/19] media: mc: entity: Add
 pipeline_started/stopped ops
Message-ID: <wgve5k52jxfiscon77trvg6iyyc3k7ud6agz7czydgefmbvpha@56jbro6w4yqa>
References: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
 <20250714-c55-v11-1-bc20e460e42a@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250714-c55-v11-1-bc20e460e42a@ideasonboard.com>

Hi Dan

On Mon, Jul 14, 2025 at 04:06:27PM +0100, Daniel Scally wrote:
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
> Changes in v5:
>
> 	- Update kerneldoc comments with Optional statement in the
> 	  right place
>
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
> +
> +	return ret;
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

I was sure I asked this already, but I wasn't able to find any
reference to this in the review of the previous version, so I'll
re-ask (sorry if it's the second time):

why can't you use media_entity_call() here as well ?

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
> index 64cf590b11343f68a456c5870ca2f32917c122f9..1e1026f65f2050bb9aa39bde68794da8d2d0a669 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -269,6 +269,10 @@ struct media_pad {
>   *			media_entity_has_pad_interdep().
>   *			Optional: If the operation isn't implemented all pads
>   *			will be considered as interdependent.
> + * @pipeline_started:	Optional: Notify this entity that the pipeline it is a
> + *			part of has been started.
> + * @pipeline_stopped:	Optional: Notify this entity that the pipeline it is a
> + *			part of has been stopped.

Why not use the same style as the other entries ?

 * @get_fwnode_pad:	Return the pad number based on a fwnode endpoint or
 *			a negative value on error. This operation can be used
 *			to map a fwnode to a media pad number. Optional.

 Or
 * @has_pad_interdep:	Return whether two pads of the entity are
 *			interdependent. If two pads are interdependent they are
 *			part of the same pipeline and enabling one of the pads
 *			means that the other pad will become "locked" and
 *			doesn't allow configuration changes. pad0 and pad1 are
 *			guaranteed to not both be sinks or sources. Never call
 *			the .has_pad_interdep() operation directly, always use
 *			media_entity_has_pad_interdep().
 *			Optional: If the operation isn't implemented all pads
 *			will be considered as interdependent.

Also, the existing doc uses "the entity" and not "this entity"


These would then be

* @pipeline_started:	Notify the entity that the pipeline it is a
*			part of has been started. Optional.
* @pipeline_stopped:	Notify the entity that the pipeline it is a
*			part of has been stopped. Optional

Question from a non-native speaker: "it is a part of" or "it is part
of" ?

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
> + * member of media_entity_operations.
> + *
> + * Return: zero on success, or a negative error code passed through from an
> + * entity's .pipeline_started() operation.

If you don't have specific return codes to document you could consider
a simpler

 * Returns zero on success or a negative error code otherwise.

Up to you on this one.

With the above documentation aligned to the existing one and a
clarification on the media_entity_call usage:

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks

> + */
> +int media_pipeline_started(struct media_pipeline *pipe);
> +
> +/**
> + * media_pipeline_stopped - Inform entities in a pipeline that it has stopped
> + * @pipe:	The pipeline
> + *
> + * Iterate on all entities in a media pipeline and call their pipeline_stopped
> + * member of media_entity_operations.
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

