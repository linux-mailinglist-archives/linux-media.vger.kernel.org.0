Return-Path: <linux-media+bounces-34592-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01615AD6B6F
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 10:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19CDA178655
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 08:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D8520E713;
	Thu, 12 Jun 2025 08:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cjq00Haf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E104F20371F
	for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 08:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749718390; cv=none; b=gB9M6Nf1YuLrIiodEWt9X3LorBpn9qRBmilnKZNFBcY3b2BTQ2LZdB5aAEy06KcB3v6j5/vurzhvIxTZm2ONOeUdP0QxBKE3HF1frsxEGrqKeqGHUACmGqsPaC7UABDJV+MLM1CjfrMmFKHnC9MYjH5PqjagDjow4Ba6RkEdC5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749718390; c=relaxed/simple;
	bh=nAId6XZTDm1AhV6BE/mG1YACrp01spS97UBlWAgHJVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pA/0j3r5/ckEhkgJcZ5DUbTxiC/o5WtjVNG2YrpD3BSpuXVJTOcj4YgcTt0QzylsRJoUDPi7Kqh2hD1B2hHyQZzkWvLywznpeB3dncWsY+K7MKRmXroAutYhR0K+JHqeFAbOoMVJ846hRtGJQk/Oeo3RYKxBjqJkZok9p6MvUfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cjq00Haf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43208D6;
	Thu, 12 Jun 2025 10:52:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749718378;
	bh=nAId6XZTDm1AhV6BE/mG1YACrp01spS97UBlWAgHJVI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cjq00HafoCa08mqclUt6ili3N+oX5cYq/EqH487lstJ+8HsDZ7qfwW54n62MYZZ6/
	 F7h+H40GCsMLcMXGT6GLKPzOwD4h7AcUvysP/wg+CR4vQNiwwlcS5DDU8CGw883fcb
	 EsY3YSnNM5cTSg5bH6iV5y2E8q+zCn4tRM+tM7q8=
Message-ID: <7f52fe39-0c84-47ad-b9b2-e4b4686b902a@ideasonboard.com>
Date: Thu, 12 Jun 2025 09:53:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: mc: entity: Add pipeline_started/stopped ops
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
 laurent.pinchart@ideasonboard.com, mchehab@kernel.org
References: <20250519140403.443915-1-dan.scally@ideasonboard.com>
 <20250519140403.443915-2-dan.scally@ideasonboard.com>
 <wqkgrdijdwbnqltyzbxcy7krktec4xh2p23lov2vayqgls4wmt@gmn2twyhaods>
 <1ed7c9e3-6d83-45dd-bed6-595b8ecbb5d9@ideasonboard.com>
 <7rjyd75yswxyrlh7xkwjsaobwdkkwiliyiba2varx44ctylt52@j55a3xgjlasz>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <7rjyd75yswxyrlh7xkwjsaobwdkkwiliyiba2varx44ctylt52@j55a3xgjlasz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jacopo

On 12/06/2025 09:50, Jacopo Mondi wrote:
> Hi Dan
>    sorry missed the last reply
>
> On Mon, Jun 09, 2025 at 03:57:55PM +0100, Dan Scally wrote:
>> Hi Jacopo
>>
>> On 21/05/2025 16:18, Jacopo Mondi wrote:
>>> Hi Dan
>>>
>>> On Mon, May 19, 2025 at 03:04:01PM +0100, Daniel Scally wrote:
>>>> Add two new members to struct media_entity_operations, along with new
>>>> functions in media-entity.c to traverse a media pipeline and call the
>>>> new operations. The new functions are intended to be used to signal
>>>> to a media pipeline that it has fully started, with the entity ops
>>>> allowing drivers to define some action to be taken when those
>>>> conditions are met.
>>>>
>>>> The combination of the new functions and operations allows drivers
>>>> which are part of a multi-driver pipeline to delay actually starting
>>>> streaming until all of the conditions for streaming succcessfully are
>>>> met across all drivers.
>>> Maybe s/succcessfully are/are successfully/
>>>
>>> Or was this (the three 'c' apart) intentional ?
>>>
>>>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>>>> ---
>>>>    drivers/media/mc/mc-entity.c | 45 ++++++++++++++++++++++++++++++++++++
>>>>    include/media/media-entity.h | 24 +++++++++++++++++++
>>>>    2 files changed, 69 insertions(+)
>>>>
>>>> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
>>>> index 045590905582..e36b1710669d 100644
>>>> --- a/drivers/media/mc/mc-entity.c
>>>> +++ b/drivers/media/mc/mc-entity.c
>>>> @@ -1053,6 +1053,51 @@ __media_pipeline_entity_iter_next(struct media_pipeline *pipe,
>>>>    }
>>>>    EXPORT_SYMBOL_GPL(__media_pipeline_entity_iter_next);
>>>>
>>>> +int media_pipeline_started(struct media_pipeline *pipe)
>>>> +{
>>>> +	struct media_pipeline_entity_iter iter;
>>>> +	struct media_entity *entity;
>>>> +	int ret;
>>>> +
>>>> +	ret = media_pipeline_entity_iter_init(pipe, &iter);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	media_pipeline_for_each_entity(pipe, &iter, entity) {
>>>> +		ret = media_entity_call(entity, pipeline_started);
>>>> +		if (ret && ret != -ENOIOCTLCMD)
>>>> +			goto err_notify_stopped;
>>>> +	}
>>>> +
>>>> +	media_pipeline_entity_iter_cleanup(&iter);
>>>> +
>>>> +	return ret == -ENOIOCTLCMD ? 0 : ret;
>>> Shouldn't you just return 0 ? If a ret < 0 is encoutered in the loop
>>> we just to the below label
>>
>> Actually thinking more I think this is right as-is. The intention is to
>> avoid returning -ENOIOCTLCMD from this function if the last entity in the
>> iterator doesn't have a .pipeline_started operation.
> That was my point actually.
>
> If you encounter a ret != -ENOIOCTLCMD in the above for loop you will
> jump to the label below.
>
> If you get here ret is either 0 or -ENOIOCTLCMD, and you can just
> return 0. Or do I still have to actually wake up ?


Oh I see! Yes sorry, you are right...although in the end I refactored this function a bit so that it 
doesn't have the goto to avoid having to put media_pipeline_entity_iter_cleanup() in there twice so 
it becomes a bit moot.

>
>>>> +
>>>> +err_notify_stopped:
>>>> +	media_pipeline_stopped(pipe);
>>> Do you need to media_pipeline_entity_iter_cleanup() ?
>>>
>>>> +	return ret;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(media_pipeline_started);
>>>> +
>>>> +int media_pipeline_stopped(struct media_pipeline *pipe)
>>>> +{
>>>> +	struct media_pipeline_entity_iter iter;
>>>> +	struct media_entity *entity;
>>>> +	int ret;
>>>> +
>>>> +	ret = media_pipeline_entity_iter_init(pipe, &iter);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	media_pipeline_for_each_entity(pipe, &iter, entity)
>>>> +		media_entity_call(entity, pipeline_stopped);
>>>> +
>>>> +	media_pipeline_entity_iter_cleanup(&iter);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(media_pipeline_stopped);
>>>> +
>>>>    /* -----------------------------------------------------------------------------
>>>>     * Links management
>>>>     */
>>>> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
>>>> index 64cf590b1134..e858326b95cb 100644
>>>> --- a/include/media/media-entity.h
>>>> +++ b/include/media/media-entity.h
>>>> @@ -269,6 +269,10 @@ struct media_pad {
>>>>     *			media_entity_has_pad_interdep().
>>>>     *			Optional: If the operation isn't implemented all pads
>>>>     *			will be considered as interdependent.
>>>> + * @pipeline_started:	Notify this entity that the pipeline it is a part of has
>>>> + *			been started
>>>> + * @pipeline_stopped:	Notify this entity that the pipeline it is a part of has
>>>> + *			been stopped
>>>>     *
>>>>     * .. note::
>>>>     *
>>>> @@ -284,6 +288,8 @@ struct media_entity_operations {
>>>>    	int (*link_validate)(struct media_link *link);
>>>>    	bool (*has_pad_interdep)(struct media_entity *entity, unsigned int pad0,
>>>>    				 unsigned int pad1);
>>>> +	int (*pipeline_started)(struct media_entity *entity);
>>>> +	void (*pipeline_stopped)(struct media_entity *entity);
>>>>    };
>>>>
>>>>    /**
>>>> @@ -1261,6 +1267,24 @@ __media_pipeline_entity_iter_next(struct media_pipeline *pipe,
>>>>    	     entity != NULL;							\
>>>>    	     entity = __media_pipeline_entity_iter_next((pipe), iter, entity))
>>>>
>>>> +/**
>>>> + * media_pipeline_started - Inform entities in a pipeline that it has started
>>>> + * @pipe:	The pipeline
>>>> + *
>>>> + * Iterate on all entities in a media pipeline and call their pipeline_started
>>>> + * member of media_entity_operations.
>>>> + */
>>>> +int media_pipeline_started(struct media_pipeline *pipe);
>>>> +
>>>> +/**
>>>> + * media_pipeline_stopped - Inform entities in a pipeline that it has stopped
>>>> + * @pipe:	The pipeline
>>>> + *
>>>> + * Iterate on all entities in a media pipeline and call their pipeline_stopped
>>>> + * member of media_entity_operations.
>>>> + */
>>>> +int media_pipeline_stopped(struct media_pipeline *pipe);
>>>> +
>>> All good, but I don't see these operations being used at all in this
>>> series ?
>>>
>>>>    /**
>>>>     * media_pipeline_alloc_start - Mark a pipeline as streaming
>>>>     * @pad: Starting pad
>>>> --
>>>> 2.34.1
>>>>
>>>>

