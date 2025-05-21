Return-Path: <linux-media+bounces-33035-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D89BABF909
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 17:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBF4E8C1BFF
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 15:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF771D61A3;
	Wed, 21 May 2025 15:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EXAcoApm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EC519ADBA
	for <linux-media@vger.kernel.org>; Wed, 21 May 2025 15:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747840711; cv=none; b=NCnMv4fgbOZtkL1d0aIZMb8QV1dFvdFsaWYG6lqYrvDHdlfd/jSnzocX8Wss+6kVsvDblKVSj9Db9CHfFpt7kcclJn8tZa4bxz9bNkN2cKbryrj3+Vcebew8y/r3LtdeZlt+31Brio5p2WwmMcb15bOVBsxeWGsmaiFWVjJMUEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747840711; c=relaxed/simple;
	bh=J8UTanf7XdAS+yKNKh2bMzBRRvYjDlo2/fWrftdDQoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ETs0paclcWzWRZb5iIK8bEzuBMTgsh3MYyMnGiOuKZ7VVvir3+IpyUQFVUIowggVV8yqtCCCvFxpizsw+4sLQgQBoCYJhu3HOKqqzdZ3e1k6l3mGA1jWndk26x9cg/dJ/Rx8A3/lSiCoqj1YjESZ4A2ig5U0f5/Qw1Czd/tzSjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EXAcoApm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A1FC6AF;
	Wed, 21 May 2025 17:18:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747840686;
	bh=J8UTanf7XdAS+yKNKh2bMzBRRvYjDlo2/fWrftdDQoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EXAcoApmGxxl2WSq1NYOryhwvig9UIgxv/xkCD3gd1mtkXK1ucFaQnnccJx6zBRM8
	 r3nvB11noTnjMcnasyjOKbfG2fwWB4k6bl+i93h6PzkloTPVhn6ouVB3Sejugf8PRT
	 guhlRNf85Gw/UFFofsesHKEVw1Kn7+PptnNqV2cs=
Date: Wed, 21 May 2025 17:18:23 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, 
	laurent.pinchart@ideasonboard.com, mchehab@kernel.org
Subject: Re: [PATCH 1/3] media: mc: entity: Add pipeline_started/stopped ops
Message-ID: <wqkgrdijdwbnqltyzbxcy7krktec4xh2p23lov2vayqgls4wmt@gmn2twyhaods>
References: <20250519140403.443915-1-dan.scally@ideasonboard.com>
 <20250519140403.443915-2-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250519140403.443915-2-dan.scally@ideasonboard.com>

Hi Dan

On Mon, May 19, 2025 at 03:04:01PM +0100, Daniel Scally wrote:
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

Maybe s/succcessfully are/are successfully/

Or was this (the three 'c' apart) intentional ?

>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  drivers/media/mc/mc-entity.c | 45 ++++++++++++++++++++++++++++++++++++
>  include/media/media-entity.h | 24 +++++++++++++++++++
>  2 files changed, 69 insertions(+)
>
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 045590905582..e36b1710669d 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -1053,6 +1053,51 @@ __media_pipeline_entity_iter_next(struct media_pipeline *pipe,
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
> +			goto err_notify_stopped;
> +	}
> +
> +	media_pipeline_entity_iter_cleanup(&iter);
> +
> +	return ret == -ENOIOCTLCMD ? 0 : ret;

Shouldn't you just return 0 ? If a ret < 0 is encoutered in the loop
we just to the below label

> +
> +err_notify_stopped:
> +	media_pipeline_stopped(pipe);

Do you need to media_pipeline_entity_iter_cleanup() ?

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
> +		media_entity_call(entity, pipeline_stopped);
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
> index 64cf590b1134..e858326b95cb 100644
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
> @@ -1261,6 +1267,24 @@ __media_pipeline_entity_iter_next(struct media_pipeline *pipe,
>  	     entity != NULL;							\
>  	     entity = __media_pipeline_entity_iter_next((pipe), iter, entity))
>
> +/**
> + * media_pipeline_started - Inform entities in a pipeline that it has started
> + * @pipe:	The pipeline
> + *
> + * Iterate on all entities in a media pipeline and call their pipeline_started
> + * member of media_entity_operations.
> + */
> +int media_pipeline_started(struct media_pipeline *pipe);
> +
> +/**
> + * media_pipeline_stopped - Inform entities in a pipeline that it has stopped
> + * @pipe:	The pipeline
> + *
> + * Iterate on all entities in a media pipeline and call their pipeline_stopped
> + * member of media_entity_operations.
> + */
> +int media_pipeline_stopped(struct media_pipeline *pipe);
> +

All good, but I don't see these operations being used at all in this
series ?

>  /**
>   * media_pipeline_alloc_start - Mark a pipeline as streaming
>   * @pad: Starting pad
> --
> 2.34.1
>
>

