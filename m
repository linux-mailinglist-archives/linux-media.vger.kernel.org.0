Return-Path: <linux-media+bounces-36242-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E059DAED536
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 09:08:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A91BC3B7243
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 07:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78CF8229B0F;
	Mon, 30 Jun 2025 07:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IkS7JSS4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579322236FD
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 07:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751267200; cv=none; b=Y4GDs1Ny3NjTXaKvbYt1v2p3ulWvjIfnYIP8KVLHOSb54zeX2ldfAGFQEETRIatSbkHU1/nyvzckKQfyFN/iE5/qGPT/uW3J2By4am9sLy62lAlr+Kr4tlC2ZRhMnUXmyaCTo0Iw9bFyYXZTpPs7B2KgknxNrhdcAh1//9WKYFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751267200; c=relaxed/simple;
	bh=VuViEUgt76dfIOrfaUaYuFHkPuh4EPZLbVsmPg4bVJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pFolxhamHVaY7L0y0aNZPBEJ88nHmCxz3kHHLJj3JhiZm3TMkKhK+XZ+eqNMpxkw2nXyq3fwWfxU4tgXhMaz5OY9vRLnTCQANZ0LofV0ZNUuOGXiYuAIs56U8t7LrAz8a5QoICaML8REwoIjushK2usl5d0zJtBEE1aOGTmIdOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IkS7JSS4; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751267199; x=1782803199;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=VuViEUgt76dfIOrfaUaYuFHkPuh4EPZLbVsmPg4bVJQ=;
  b=IkS7JSS4Iybuc9W9x0znunb7E2Ffh9bHjDPwIF3buTMCJii03W05zTMK
   ts4//dBKSwVu0sd4to8M07o5L0opWRHHlQq8xUkIKzX4j56oPp4FE/FPj
   uaL3hNj70rwjbBe4hpHX2XBvamyreAk95Kdel4YfB0/qxdRQNgNaKn/FF
   M37OKgve9cd4r+HO9olod/GE6Ov4sQxz2oCRBirN8yb3ZU2NtVgbYte8x
   y9BPYh1UeqgFPBwomIExMz1AYF1Z/x/acsIHJ/z9IGOYT4UJjpg0BSF6S
   WIOpyPL+Sdc+WSpkchv5iwf9CkaVTtsOHEshgivB+5lyEmbbdw5GOoJ9S
   A==;
X-CSE-ConnectionGUID: Dh1IDPQPT0u/36jQWX7gzg==
X-CSE-MsgGUID: sZIIZbblTJOg3Gshr+h6DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53589127"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53589127"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 00:06:29 -0700
X-CSE-ConnectionGUID: zFn0NK9oSCO5J1nku3g2jQ==
X-CSE-MsgGUID: AnGO7dQTTVybhtk+r1MfDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="152865854"
Received: from agladkov-desk.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.57])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 00:06:26 -0700
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id E8A9B44366;
	Mon, 30 Jun 2025 10:06:23 +0300 (EEST)
Message-ID: <d89e87ed-aa92-4ad1-8cd8-0ede62451eb2@linux.intel.com>
Date: Sun, 29 Jun 2025 10:50:40 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: mc: entity: Add pipeline_started/stopped
 ops
Content-Language: en-US
To: Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, jacopo.mondi@ideasonboard.com
References: <20250624-media-jobs-v2-0-8e649b069a96@ideasonboard.com>
 <20250624-media-jobs-v2-1-8e649b069a96@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
In-Reply-To: <20250624-media-jobs-v2-1-8e649b069a96@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Kieran,

Thanks for the update.

On 6/24/25 10:59, Daniel Scally wrote:
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
> Changes in v2:
> 
> 	- Refactored media_pipeline_started() such that the cleanup
> 	  function for media_pipeline_entity_iter is unconditionally
> 	  called
> 	- Avoided using media_entity_call() helper for operation that
> 	  has return type void to avoid compiler warnings
> ---
>   drivers/media/mc/mc-entity.c | 46 ++++++++++++++++++++++++++++++++++++++++++++
>   include/media/media-entity.h | 24 +++++++++++++++++++++++
>   2 files changed, 70 insertions(+)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 045590905582054c46656e20463271b1f93fa6b4..d3443537d4304e12cb015630101efba22375c011 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -1053,6 +1053,52 @@ __media_pipeline_entity_iter_next(struct media_pipeline *pipe,
>   }
>   EXPORT_SYMBOL_GPL(__media_pipeline_entity_iter_next);
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

What is the caller supposed to do if an error happens here? Could we 
keep the pipeline iteration around for this in struct media_pipeline?

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
>   /* -----------------------------------------------------------------------------
>    * Links management
>    */
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index 64cf590b11343f68a456c5870ca2f32917c122f9..e858326b95cba6612a123f715af6ea7130a86e15 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -269,6 +269,10 @@ struct media_pad {
>    *			media_entity_has_pad_interdep().
>    *			Optional: If the operation isn't implemented all pads
>    *			will be considered as interdependent.
> + * @pipeline_started:	Notify this entity that the pipeline it is a part of has
> + *			been started
> + * @pipeline_stopped:	Notify this entity that the pipeline it is a part of has
> + *			been stopped
>    *
>    * .. note::
>    *
> @@ -284,6 +288,8 @@ struct media_entity_operations {
>   	int (*link_validate)(struct media_link *link);
>   	bool (*has_pad_interdep)(struct media_entity *entity, unsigned int pad0,
>   				 unsigned int pad1);
> +	int (*pipeline_started)(struct media_entity *entity);
> +	void (*pipeline_stopped)(struct media_entity *entity);
>   };
>   
>   /**
> @@ -1261,6 +1267,24 @@ __media_pipeline_entity_iter_next(struct media_pipeline *pipe,
>   	     entity != NULL;							\
>   	     entity = __media_pipeline_entity_iter_next((pipe), iter, entity))
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

Could you also document the return values for both of the functions, please?

> + */
> +int media_pipeline_stopped(struct media_pipeline *pipe);
> +
>   /**
>    * media_pipeline_alloc_start - Mark a pipeline as streaming
>    * @pad: Starting pad
> 

-- 
Kind regards,

Sakari Ailus

