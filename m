Return-Path: <linux-media+bounces-36625-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78202AF6300
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 22:09:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97B771C44CA7
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 20:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53DDD2DCF49;
	Wed,  2 Jul 2025 20:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B2kY0nU6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C4A2F7D15
	for <linux-media@vger.kernel.org>; Wed,  2 Jul 2025 20:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751486961; cv=none; b=kx2tfxEAXwFwn1uE0m5OkMDdVu58WW4p0VBSPPBaXLMgFdgvMnhmDAITIBPbZ8Otp2U/lLEfPYaPsV7YgXGqiJZJ8QtzkFOQntIgyNl1ZuzxnFuCJbP87G6tlaSo06dVkyG/9An3+utOJuJbx00uz7tsD1pRkj0XNJX5UsNQiGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751486961; c=relaxed/simple;
	bh=L1Inr7/YLN0CUaTqcEs+zl3s6iGD/59iy5j35NVXa70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lfRG++25e6ALvnEBuwhQbhWfv29QpunzpFbSBTaAKddApk30Bgh4sMJBKSzY6iCPBYmhcVGT2myPZ9HCda8qh4h7NmHXNHqutlvCAuNgShDd208U3SCU9OxdPBDngPGE9HNFgzBh0+DWzwt6e0G5+QdzxMOO+vSc9G0wGJgzK5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B2kY0nU6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C58C11D4C;
	Wed,  2 Jul 2025 22:08:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751486935;
	bh=L1Inr7/YLN0CUaTqcEs+zl3s6iGD/59iy5j35NVXa70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B2kY0nU6f+ftGddgCaswHeJaueIzpSZxml6ChE8kwghPJUz4jKnXcyPGhfYr2rNBV
	 eYz89OqM6R4sy3p/wUk8MCaa9zXAqsywqRny0WyDU9d9zddz8JjOtpaDXu92tsMxhB
	 00w8pRhK9Po1pgvVTj5wbnCgfeAMmSYaAjSrkIeY=
Date: Wed, 2 Jul 2025 23:08:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH 3/4] media: mc: entity: Add pipeline_started/stopped ops
Message-ID: <20250702200850.GL17819@pendragon.ideasonboard.com>
References: <20250702-pipelines-v1-0-34525973e773@ideasonboard.com>
 <20250702-pipelines-v1-3-34525973e773@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250702-pipelines-v1-3-34525973e773@ideasonboard.com>

Hi Dan,

Thank you for the patch.

On Wed, Jul 02, 2025 at 04:15:04PM +0100, Daniel Scally wrote:
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

I can't review this patch properly without looking at how it will be
used. I don't think this series should be split out of the media jobs
series.

> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> This commit was originally in the "Add media jobs framework" series
> but will now be dropped from there.
> 
> Changes in this version:
> 
> 	- Dropped the iter variable now that the pipeline entity
> 	  iterator functions don't need it.
> 	- Updated documentation to specify Optional and return
> 	  values
> 
> Changes in the previous version:
> 
> 	- Refactored media_pipeline_started() such that the cleanup
> 	  function for media_pipeline_entity_iter is unconditionally
> 	  called
> 	- Avoided using media_entity_call() helper for operation that
> 	  has return type void to avoid compiler warnings
> ---
>  drivers/media/mc/mc-entity.c | 29 +++++++++++++++++++++++++++++
>  include/media/media-entity.h | 27 +++++++++++++++++++++++++++
>  2 files changed, 56 insertions(+)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 30d15a180ad4525e9438083216ac328a4b76653a..64bacb3197a8a6b4af312abfc1ea9e3dfacdc012 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -1059,6 +1059,35 @@ __media_pipeline_pad_iter_next(struct media_pipeline *pipe,
>  }
>  EXPORT_SYMBOL_GPL(__media_pipeline_pad_iter_next);
>  
> +int media_pipeline_started(struct media_pipeline *pipe)

The name "started" sounds like it's related to media_pipeline_start(),
but it doesn't seem to be the case. That's confusing, we need clearer
names.

> +{
> +	struct media_entity *entity;
> +	int ret;
> +
> +	media_pipeline_for_each_entity(pipe, entity) {
> +		ret = media_entity_call(entity, pipeline_started);
> +		if (ret && ret != -ENOIOCTLCMD)
> +			break;
> +	}
> +
> +	ret = ret == -ENOIOCTLCMD ? 0 : ret;
> +	if (ret)
> +		media_pipeline_stopped(pipe);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(media_pipeline_started);
> +
> +void media_pipeline_stopped(struct media_pipeline *pipe)
> +{
> +	struct media_entity *entity;
> +
> +	media_pipeline_for_each_entity(pipe, entity)
> +		if (entity->ops && entity->ops->pipeline_stopped)
> +			entity->ops->pipeline_stopped(entity);
> +}
> +EXPORT_SYMBOL_GPL(media_pipeline_stopped);
> +
>  /* -----------------------------------------------------------------------------
>   * Links management
>   */
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index 0f3bad2b9c319b1792bd62fff336bf09c1a42c1b..6e3a97183cc44a084581a941a1b5c02bef38b036 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -271,6 +271,10 @@ struct media_pad {
>   *			media_entity_has_pad_interdep().
>   *			Optional: If the operation isn't implemented all pads
>   *			will be considered as interdependent.
> + * @pipeline_started:	Notify this entity that the pipeline it is a part of has
> + *			been started
> + * @pipeline_stopped:	Notify this entity that the pipeline it is a part of has
> + *			been stopped
>   *
>   * .. note::
>   *
> @@ -286,6 +290,8 @@ struct media_entity_operations {
>  	int (*link_validate)(struct media_link *link);
>  	bool (*has_pad_interdep)(struct media_entity *entity, unsigned int pad0,
>  				 unsigned int pad1);
> +	int (*pipeline_started)(struct media_entity *entity);
> +	void (*pipeline_stopped)(struct media_entity *entity);
>  };
>  
>  /**
> @@ -1231,6 +1237,27 @@ __media_pipeline_entity_iter_next(struct media_pipeline *pipe,
>  	     entity != NULL;							\
>  	     entity = __media_pipeline_entity_iter_next((pipe), entity))
>  
> +/**
> + * media_pipeline_started - Inform entities in a pipeline that it has started
> + * @pipe:	The pipeline
> + *
> + * Iterate on all entities in a media pipeline and call their pipeline_started
> + * member of media_entity_operations. Optional.
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
> + */
> +void media_pipeline_stopped(struct media_pipeline *pipe);
> +
>  /**
>   * media_pipeline_alloc_start - Mark a pipeline as streaming
>   * @pad: Starting pad

-- 
Regards,

Laurent Pinchart

