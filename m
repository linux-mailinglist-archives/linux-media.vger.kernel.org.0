Return-Path: <linux-media+bounces-36814-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6026CAF8E56
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 11:22:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2C735A798F
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 09:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12F42ED17A;
	Fri,  4 Jul 2025 09:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KmxjaFEN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6BF2EAD11
	for <linux-media@vger.kernel.org>; Fri,  4 Jul 2025 09:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751620420; cv=none; b=h3tM/x13oE0lRyVJEdbKWlG0rgWBOmt/VYKNZbEPy1GfpB/oWZpA5SVXC4k9bmPOzRm8tZvDr1jLNrl75gPES880QMfGb9XKQnZQFtGCkcP4coSN49xfqAYZE0Szsa5/B2GfQlIPrI5OnV5boLV0ahCJPCbF38LL4iD+XKe5Kw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751620420; c=relaxed/simple;
	bh=dGI0NnNP5yex74aAjT3GA9RbRUclWZru8Thz6e1Qb7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H1vKiDxlLyLsdygUpvGO+472WQtMlbZQQyhB7TrpoH6foKVzueqnHv6MzIbkBM7WXPuuypWBvlLlHUuEVcEmafZikh2w8sgV8PpQDbX3SpfHrZ66J/tPqGnGWMRp49SeQJm77tiuJc7HInIMh34qa3H29Rgfye1aI6NIs5CVaoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KmxjaFEN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 819BA465;
	Fri,  4 Jul 2025 11:13:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751620392;
	bh=dGI0NnNP5yex74aAjT3GA9RbRUclWZru8Thz6e1Qb7E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KmxjaFENGAH5VbyQ03pzTYUECYSpYf+hl2bJ8T63LjgLpirG5wkJG9yxOIv+XsusZ
	 M3h1M0sSxmFXFwfqTWCQsD8KCkwd/9nX2hgTL9ruZWyJcRJJmkV+o+6CbmFDVIlD0+
	 LInNWYOfkrtRIAsPPs5extiFaLlh5iLD+aeleKzY=
Message-ID: <f877d3f0-4f62-4785-8f86-87eb1748e87c@ideasonboard.com>
Date: Fri, 4 Jul 2025 10:13:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: mc: entity: Embed entity iterator in pipeline
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20250702-pipelines-v1-0-34525973e773@ideasonboard.com>
 <20250702-pipelines-v1-2-34525973e773@ideasonboard.com>
 <20250702200511.GK17819@pendragon.ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <20250702200511.GK17819@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Morning Laurent

On 02/07/2025 21:05, Laurent Pinchart wrote:
> Hi Dan,
>
> Thank you for the patch.
>
> On Wed, Jul 02, 2025 at 04:15:03PM +0100, Daniel Scally wrote:
>> Embed a struct media_pipeline_entity_iter into struct media_pipeline.
>> Init the iterator in _media_pipeline_start() and clean it up during
>> media_pipeline_cleanup(). Update call-sites for the related functions
>> to not require a pointer to a struct media_pipeline_entity_iter.
>>
>> With this change the following functions no longer need to be
>> exported; make them static.
>>
>> media_pipeline_entity_iter_init()
>> media_pipeline_entity_iter_cleanup()
> The commit message doesn't explain *why* this is desired. That's the
> most important information you need in every commit message.


Ah - my bad. It's a suggestion from Sakari in the C55 series review, which results in a nice 
reduction in the amount of duplicated code between the two drivers.

>
> What will happen if code tries to iterate over entities multiple times,
> either in consecutive operations, or as nested operations ?


Hm well I thought it was alright, but turns out it's just coincidentally working - the cleanup does 
need to happen after each iteration...I will just drop this and the previous patch.


Thanks

Dan

>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>> ---
>>   drivers/media/mc/mc-entity.c                  | 24 ++++++----
>>   drivers/media/platform/ti/omap3isp/ispvideo.c |  9 +---
>>   include/media/media-entity.h                  | 64 +++++++--------------------
>>   3 files changed, 33 insertions(+), 64 deletions(-)
>>
>> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
>> index eef2fd4b73a11eba143243c964852cd494422204..30d15a180ad4525e9438083216ac328a4b76653a 100644
>> --- a/drivers/media/mc/mc-entity.c
>> +++ b/drivers/media/mc/mc-entity.c
>> @@ -704,24 +704,22 @@ static int media_pipeline_explore_next_link(struct media_pipeline *pipe,
>>   	return 0;
>>   }
>>   
>> -int media_pipeline_entity_iter_init(struct media_pipeline *pipe,
>> -				    struct media_pipeline_entity_iter *iter)
>> +static int media_pipeline_entity_iter_init(struct media_pipeline *pipe)
>>   {
>> -	return media_entity_enum_init(&iter->ent_enum, pipe->mdev);
>> +	return media_entity_enum_init(&pipe->entity_iter.ent_enum, pipe->mdev);
>>   }
>> -EXPORT_SYMBOL_GPL(media_pipeline_entity_iter_init);
>>   
>> -void media_pipeline_entity_iter_cleanup(struct media_pipeline_entity_iter *iter)
>> +static void media_pipeline_entity_iter_cleanup(struct media_pipeline *pipe)
>>   {
>> -	media_entity_enum_cleanup(&iter->ent_enum);
>> +	media_entity_enum_cleanup(&pipe->entity_iter.ent_enum);
>>   }
>> -EXPORT_SYMBOL_GPL(media_pipeline_entity_iter_cleanup);
>>   
>>   struct media_entity *
>>   __media_pipeline_entity_iter_next(struct media_pipeline *pipe,
>> -				  struct media_pipeline_entity_iter *iter,
>>   				  struct media_entity *entity)
>>   {
>> +	struct media_pipeline_entity_iter *iter = &pipe->entity_iter;
>> +
>>   	if (!entity)
>>   		iter->cursor = pipe->pads.next;
>>   
>> @@ -733,7 +731,7 @@ __media_pipeline_entity_iter_next(struct media_pipeline *pipe,
>>   		entity = ppad->pad->entity;
>>   		iter->cursor = iter->cursor->next;
>>   
>> -		if (!media_entity_enum_test_and_set(&iter->ent_enum, entity))
>> +		if (!media_entity_enum_test(&iter->ent_enum, entity))
>>   			return entity;
>>   	}
>>   
>> @@ -743,6 +741,8 @@ EXPORT_SYMBOL_GPL(__media_pipeline_entity_iter_next);
>>   
>>   static void media_pipeline_cleanup(struct media_pipeline *pipe)
>>   {
>> +	media_pipeline_entity_iter_cleanup(pipe);
>> +
>>   	while (!list_empty(&pipe->pads)) {
>>   		struct media_pipeline_pad *ppad;
>>   
>> @@ -928,6 +928,12 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
>>   		pad->pipe = pipe;
>>   	}
>>   
>> +	ret = media_pipeline_entity_iter_init(pipe);
>> +	if (ret) {
>> +		dev_err(mdev->dev, "Failed to init pipeline iterator\n");
>> +		goto error;
>> +	}
>> +
>>   	pipe->start_count++;
>>   
>>   	return 0;
>> diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
>> index 78e30298c7ad155c70a2a369daa8c232b97e55b7..54ff16d4a2ef1cb6436de98487851caa6e380d7d 100644
>> --- a/drivers/media/platform/ti/omap3isp/ispvideo.c
>> +++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
>> @@ -221,16 +221,11 @@ isp_video_remote_subdev(struct isp_video *video, u32 *pad)
>>   static int isp_video_get_graph_data(struct isp_video *video,
>>   				    struct isp_pipeline *pipe)
>>   {
>> -	struct media_pipeline_entity_iter iter;
>>   	struct media_entity *entity;
>>   	struct isp_video *far_end = NULL;
>>   	int ret;
>>   
>> -	ret = media_pipeline_entity_iter_init(&pipe->pipe, &iter);
>> -	if (ret)
>> -		return ret;
>> -
>> -	media_pipeline_for_each_entity(&pipe->pipe, &iter, entity) {
>> +	media_pipeline_for_each_entity(&pipe->pipe, entity) {
>>   		struct isp_video *__video;
>>   
>>   		media_entity_enum_set(&pipe->ent_enum, entity);
>> @@ -249,8 +244,6 @@ static int isp_video_get_graph_data(struct isp_video *video,
>>   			far_end = __video;
>>   	}
>>   
>> -	media_pipeline_entity_iter_cleanup(&iter);
>> -
>>   	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
>>   		pipe->input = far_end;
>>   		pipe->output = video;
>> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
>> index 64cf590b11343f68a456c5870ca2f32917c122f9..0f3bad2b9c319b1792bd62fff336bf09c1a42c1b 100644
>> --- a/include/media/media-entity.h
>> +++ b/include/media/media-entity.h
>> @@ -97,6 +97,17 @@ struct media_graph {
>>   	int top;
>>   };
>>   
>> +/**
>> + * struct media_pipeline_entity_iter - Iterator for media_pipeline_for_each_entity
>> + *
>> + * @ent_enum: The entity enumeration tracker
>> + * @cursor: The current element
>> + */
>> +struct media_pipeline_entity_iter {
>> +	struct media_entity_enum ent_enum;
>> +	struct list_head *cursor;
>> +};
>> +
>>   /**
>>    * struct media_pipeline - Media pipeline related information
>>    *
>> @@ -104,12 +115,14 @@ struct media_graph {
>>    * @mdev:		The media device the pipeline is part of
>>    * @pads:		List of media_pipeline_pad
>>    * @start_count:	Media pipeline start - stop count
>> + * @entity_iter:	Iterator for media_pipeline_for_each_entity()
>>    */
>>   struct media_pipeline {
>>   	bool allocated;
>>   	struct media_device *mdev;
>>   	struct list_head pads;
>>   	int start_count;
>> +	struct media_pipeline_entity_iter entity_iter;
>>   };
>>   
>>   /**
>> @@ -139,17 +152,6 @@ struct media_pipeline_pad_iter {
>>   	struct list_head *cursor;
>>   };
>>   
>> -/**
>> - * struct media_pipeline_entity_iter - Iterator for media_pipeline_for_each_entity
>> - *
>> - * @ent_enum: The entity enumeration tracker
>> - * @cursor: The current element
>> - */
>> -struct media_pipeline_entity_iter {
>> -	struct media_entity_enum ent_enum;
>> -	struct list_head *cursor;
>> -};
>> -
>>   /**
>>    * struct media_link - A link object part of a media graph.
>>    *
>> @@ -1211,55 +1213,23 @@ __media_pipeline_pad_iter_next(struct media_pipeline *pipe,
>>   	     pad != NULL;						\
>>   	     pad = __media_pipeline_pad_iter_next((pipe), iter, pad))
>>   
>> -/**
>> - * media_pipeline_entity_iter_init - Initialize a pipeline entity iterator
>> - * @pipe: The pipeline
>> - * @iter: The iterator
>> - *
>> - * This function must be called to initialize the iterator before using it in a
>> - * media_pipeline_for_each_entity() loop. The iterator must be destroyed by a
>> - * call to media_pipeline_entity_iter_cleanup after the loop (including in code
>> - * paths that break from the loop).
>> - *
>> - * The same iterator can be used in multiple consecutive loops without being
>> - * destroyed and reinitialized.
>> - *
>> - * Return: 0 on success or a negative error code otherwise.
>> - */
>> -int media_pipeline_entity_iter_init(struct media_pipeline *pipe,
>> -				    struct media_pipeline_entity_iter *iter);
>> -
>> -/**
>> - * media_pipeline_entity_iter_cleanup - Destroy a pipeline entity iterator
>> - * @iter: The iterator
>> - *
>> - * This function must be called to destroy iterators initialized with
>> - * media_pipeline_entity_iter_init().
>> - */
>> -void media_pipeline_entity_iter_cleanup(struct media_pipeline_entity_iter *iter);
>> -
>>   struct media_entity *
>>   __media_pipeline_entity_iter_next(struct media_pipeline *pipe,
>> -				  struct media_pipeline_entity_iter *iter,
>>   				  struct media_entity *entity);
>>   
>>   /**
>>    * media_pipeline_for_each_entity - Iterate on all entities in a media pipeline
>>    * @pipe: The pipeline
>> - * @iter: The iterator (struct media_pipeline_entity_iter)
>>    * @entity: The iterator entity
>>    *
>>    * Iterate on all entities in a media pipeline. This is only valid after the
>>    * pipeline has been built with media_pipeline_start() and before it gets
>> - * destroyed with media_pipeline_stop(). The iterator must be initialized with
>> - * media_pipeline_entity_iter_init() before iteration, and destroyed with
>> - * media_pipeline_entity_iter_cleanup() after (including in code paths that
>> - * break from the loop).
>> + * destroyed with media_pipeline_stop().
>>    */
>> -#define media_pipeline_for_each_entity(pipe, iter, entity)			\
>> -	for (entity = __media_pipeline_entity_iter_next((pipe), iter, NULL);	\
>> +#define media_pipeline_for_each_entity(pipe, entity)			\
>> +	for (entity = __media_pipeline_entity_iter_next((pipe), NULL);	\
>>   	     entity != NULL;							\
>> -	     entity = __media_pipeline_entity_iter_next((pipe), iter, entity))
>> +	     entity = __media_pipeline_entity_iter_next((pipe), entity))
>>   
>>   /**
>>    * media_pipeline_alloc_start - Mark a pipeline as streaming

