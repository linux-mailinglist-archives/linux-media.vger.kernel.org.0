Return-Path: <linux-media+bounces-40384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEEBB2DA50
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 12:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C52A01758FA
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 10:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6522E2DD5;
	Wed, 20 Aug 2025 10:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OSrK9gsK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81001C3F0C;
	Wed, 20 Aug 2025 10:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755686880; cv=none; b=a9Y2j4PVjLTTOzbxfE5K6Yx+hi3543VWh6+xZlsuBrnKF4cYrpHgx822Niqe6hbNIRdELwUG03tiLkUfdjMhl7O+O3WMbpeUSEKflN2UxaDurFUQG5Lhd4XwpZbz1ur+WCXMYP0mduvZh0R2VVZib1VfZ4+IQs2jf/q4sI4WRWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755686880; c=relaxed/simple;
	bh=oRmxz6sCrDBEVI9hEkCWNXBiflwkluoQLt2izmd/Pe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RHc27Z+enjdzYaqXih2dsV4TSezfXOU2Jq4Up/b9eL8iUe4nfYnhB4nK/YMY6vMY5tF8pbfolO+XWT/IEsZEinMZzTyzXQn8bdaA8oLv5+gNhMyriSWsjcZI8/ZzHVQ7T77FSDGPhxfvlJKVQ280/IQXHIqPNLMNMHJhbEBvuY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OSrK9gsK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4491B666;
	Wed, 20 Aug 2025 12:46:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755686816;
	bh=oRmxz6sCrDBEVI9hEkCWNXBiflwkluoQLt2izmd/Pe8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OSrK9gsKGfeMtFy9C7KBku9ZgD8imKvIawbMHSncqFmFRIXZwV65F+X9Dla+vK1r+
	 r4ONrT205osLvuQBjjtFfISj4JnusJwYzvI9pDMr8BgvDk22CSH/3GkwC6wDohuFIn
	 hR574FBtfNRiRpIR92OHOxa+7D4K2vdYncKOSn6c=
Message-ID: <cf9bb518-58f9-42bf-bcb8-5727d2f9abef@ideasonboard.com>
Date: Wed, 20 Aug 2025 11:47:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 01/19] media: mc: entity: Add pipeline_started/stopped
 ops
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com,
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
 laurent.pinchart@ideasonboard.com,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
 <20250714-c55-v11-1-bc20e460e42a@ideasonboard.com>
 <wgve5k52jxfiscon77trvg6iyyc3k7ud6agz7czydgefmbvpha@56jbro6w4yqa>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <wgve5k52jxfiscon77trvg6iyyc3k7ud6agz7czydgefmbvpha@56jbro6w4yqa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jacopo

On 05/08/2025 08:45, Jacopo Mondi wrote:
> Hi Dan
> 
> On Mon, Jul 14, 2025 at 04:06:27PM +0100, Daniel Scally wrote:
>> Add two new members to struct media_entity_operations, along with new
>> functions in media-entity.c to traverse a media pipeline and call the
>> new operations. The new functions are intended to be used to signal
>> to a media pipeline that it has fully started, with the entity ops
>> allowing drivers to define some action to be taken when those
>> conditions are met.
>>
>> The combination of the new functions and operations allows drivers
>> which are part of a multi-driver pipeline to delay actually starting
>> streaming until all of the conditions for streaming succcessfully are
>> met across all drivers.
>>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>> ---
>> Changes in v5:
>>
>> 	- Update kerneldoc comments with Optional statement in the
>> 	  right place
>>
>> Changes in v4:
>>
>> 	- Reverted to having the iter variable
>>
>> Changes in v3:
>>
>> 	- Dropped the iter variable now that the pipeline entity
>> 	  iterator functions don't need it.
>> 	- Updated documentation to specify Optional and return
>> 	  values
>>
>> Changes in v2:
>>
>> 	- Refactored media_pipeline_started() such that the cleanup
>> 	  function for media_pipeline_entity_iter is unconditionally
>> 	  called
>> 	- Avoided using media_entity_call() helper for operation that
>> 	  has return type void to avoid compiler warnings
>> ---
>>   drivers/media/mc/mc-entity.c | 46 ++++++++++++++++++++++++++++++++++++++++++++
>>   include/media/media-entity.h | 29 ++++++++++++++++++++++++++++
>>   2 files changed, 75 insertions(+)
>>
>> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
>> index 045590905582054c46656e20463271b1f93fa6b4..d3443537d4304e12cb015630101efba22375c011 100644
>> --- a/drivers/media/mc/mc-entity.c
>> +++ b/drivers/media/mc/mc-entity.c
>> @@ -1053,6 +1053,52 @@ __media_pipeline_entity_iter_next(struct media_pipeline *pipe,
>>   }
>>   EXPORT_SYMBOL_GPL(__media_pipeline_entity_iter_next);
>>
>> +int media_pipeline_started(struct media_pipeline *pipe)
>> +{
>> +	struct media_pipeline_entity_iter iter;
>> +	struct media_entity *entity;
>> +	int ret;
>> +
>> +	ret = media_pipeline_entity_iter_init(pipe, &iter);
>> +	if (ret)
>> +		return ret;
>> +
>> +	media_pipeline_for_each_entity(pipe, &iter, entity) {
>> +		ret = media_entity_call(entity, pipeline_started);
>> +		if (ret && ret != -ENOIOCTLCMD)
>> +			break;
>> +	}
>> +
>> +	media_pipeline_entity_iter_cleanup(&iter);
>> +
>> +	ret = ret == -ENOIOCTLCMD ? 0 : ret;
>> +	if (ret)
>> +		media_pipeline_stopped(pipe);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(media_pipeline_started);
>> +
>> +int media_pipeline_stopped(struct media_pipeline *pipe)
>> +{
>> +	struct media_pipeline_entity_iter iter;
>> +	struct media_entity *entity;
>> +	int ret;
>> +
>> +	ret = media_pipeline_entity_iter_init(pipe, &iter);
>> +	if (ret)
>> +		return ret;
>> +
>> +	media_pipeline_for_each_entity(pipe, &iter, entity)
>> +		if (entity->ops && entity->ops->pipeline_stopped)
>> +			entity->ops->pipeline_stopped(entity);
> 
> I was sure I asked this already, but I wasn't able to find any
> reference to this in the review of the previous version, so I'll
> re-ask (sorry if it's the second time):
> 
> why can't you use media_entity_call() here as well ?

It causes compilation errors because media_entity_call() explicitly assumes that the callback will 
return an integer, and .pipeline_stopped() returns void.

> 
>> +
>> +	media_pipeline_entity_iter_cleanup(&iter);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(media_pipeline_stopped);
>> +
>>   /* -----------------------------------------------------------------------------
>>    * Links management
>>    */
>> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
>> index 64cf590b11343f68a456c5870ca2f32917c122f9..1e1026f65f2050bb9aa39bde68794da8d2d0a669 100644
>> --- a/include/media/media-entity.h
>> +++ b/include/media/media-entity.h
>> @@ -269,6 +269,10 @@ struct media_pad {
>>    *			media_entity_has_pad_interdep().
>>    *			Optional: If the operation isn't implemented all pads
>>    *			will be considered as interdependent.
>> + * @pipeline_started:	Optional: Notify this entity that the pipeline it is a
>> + *			part of has been started.
>> + * @pipeline_stopped:	Optional: Notify this entity that the pipeline it is a
>> + *			part of has been stopped.
> 
> Why not use the same style as the other entries ?

Poor reading comprehension - I thought I had! Thanks, I'll adopt your suggestion.

> 
>   * @get_fwnode_pad:	Return the pad number based on a fwnode endpoint or
>   *			a negative value on error. This operation can be used
>   *			to map a fwnode to a media pad number. Optional.
> 
>   Or
>   * @has_pad_interdep:	Return whether two pads of the entity are
>   *			interdependent. If two pads are interdependent they are
>   *			part of the same pipeline and enabling one of the pads
>   *			means that the other pad will become "locked" and
>   *			doesn't allow configuration changes. pad0 and pad1 are
>   *			guaranteed to not both be sinks or sources. Never call
>   *			the .has_pad_interdep() operation directly, always use
>   *			media_entity_has_pad_interdep().
>   *			Optional: If the operation isn't implemented all pads
>   *			will be considered as interdependent.
> 
> Also, the existing doc uses "the entity" and not "this entity"
> 
> 
> These would then be
> 
> * @pipeline_started:	Notify the entity that the pipeline it is a
> *			part of has been started. Optional.
> * @pipeline_stopped:	Notify the entity that the pipeline it is a
> *			part of has been stopped. Optional
> 
> Question from a non-native speaker: "it is a part of" or "it is part
> of" ?

I think either would be acceptable; I can switch if it's clearer to you?

> 
>>    *
>>    * .. note::
>>    *
>> @@ -284,6 +288,8 @@ struct media_entity_operations {
>>   	int (*link_validate)(struct media_link *link);
>>   	bool (*has_pad_interdep)(struct media_entity *entity, unsigned int pad0,
>>   				 unsigned int pad1);
>> +	int (*pipeline_started)(struct media_entity *entity);
>> +	void (*pipeline_stopped)(struct media_entity *entity);
>>   };
>>
>>   /**
>> @@ -1261,6 +1267,29 @@ __media_pipeline_entity_iter_next(struct media_pipeline *pipe,
>>   	     entity != NULL;							\
>>   	     entity = __media_pipeline_entity_iter_next((pipe), iter, entity))
>>
>> +/**
>> + * media_pipeline_started - Inform entities in a pipeline that it has started
>> + * @pipe:	The pipeline
>> + *
>> + * Iterate on all entities in a media pipeline and call their pipeline_started
>> + * member of media_entity_operations.
>> + *
>> + * Return: zero on success, or a negative error code passed through from an
>> + * entity's .pipeline_started() operation.
> 
> If you don't have specific return codes to document you could consider
> a simpler
> 
>   * Returns zero on success or a negative error code otherwise.
> 
> Up to you on this one.
> 
> With the above documentation aligned to the existing one and a
> clarification on the media_entity_call usage:
> 
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks!
> 
> Thanks
> 
>> + */
>> +int media_pipeline_started(struct media_pipeline *pipe);
>> +
>> +/**
>> + * media_pipeline_stopped - Inform entities in a pipeline that it has stopped
>> + * @pipe:	The pipeline
>> + *
>> + * Iterate on all entities in a media pipeline and call their pipeline_stopped
>> + * member of media_entity_operations.
>> + *
>> + * Return: zero on success, or -ENOMEM if the iterator initialisation failed.
>> + */
>> +int media_pipeline_stopped(struct media_pipeline *pipe);
>> +
>>   /**
>>    * media_pipeline_alloc_start - Mark a pipeline as streaming
>>    * @pad: Starting pad
>>
>> --
>> 2.34.1
>>
>>


