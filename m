Return-Path: <linux-media+bounces-36634-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF23CAF6A61
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 08:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCF6316B43C
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 06:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 278BA277CA0;
	Thu,  3 Jul 2025 06:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bVYunmd1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798AC1C6B4
	for <linux-media@vger.kernel.org>; Thu,  3 Jul 2025 06:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751524458; cv=none; b=B5cLFDwQJcpMyW/xRFrvluxZkk58sWynw5Cb3AgyymXfmO4IhmDmAiXdxTBkIFm9pkIbLJpv3S7TbkAWOKr49o98YA3IBOBBxjoDsGQvFadlqjrSBwchjPsZiAnoff9C8wFvOBIuxW6ko1T/rKM641VzZlsbwDxph4bF1VRC5ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751524458; c=relaxed/simple;
	bh=vxIZBJkpasZ9Kz3K+ff5SAM1Frfu3/Fk7UEBGFcJ7eQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zz++26nN5P8WDn/EGcHXgRt5f/Ltlme7iP3fys6Jpo6UtMyJmelULaKexEd/3dGG3lCFh75npj+fZC/4l7LMjjHeDxgaetPVI7///Znyo+yMlsr929wnLINLuW1Z/6VCdwx9vcA22KmefEQ/G74iv+zYAnrYlyTt0W81RkNKLt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bVYunmd1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B2A1678C;
	Thu,  3 Jul 2025 08:33:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751524429;
	bh=vxIZBJkpasZ9Kz3K+ff5SAM1Frfu3/Fk7UEBGFcJ7eQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bVYunmd18BpS3tHN5YKl9Qm9VcjPk4OP0BuFJGSvk+NVrxNPGf0Xlxu/DyRJ4L+Zr
	 NlKROGobc1Mqo+OcKzeAgE5vcnk+sePC4PSg/ByL9hb5l4pyDFRI5QqOilqkGpTiQP
	 d4+oNyET9MwzJBNNgPaFYBqxxsNzOySYpzrYgklg=
Message-ID: <cf30a311-dccb-4add-871e-eb41e109c99b@ideasonboard.com>
Date: Thu, 3 Jul 2025 07:34:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] media: mc: entity: Add pipeline_started/stopped ops
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20250702-pipelines-v1-0-34525973e773@ideasonboard.com>
 <20250702-pipelines-v1-3-34525973e773@ideasonboard.com>
 <20250702200850.GL17819@pendragon.ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 xsFNBGLydlEBEADa5O2s0AbUguprfvXOQun/0a8y2Vk6BqkQALgeD6KnXSWwaoCULp18etYW
 B31bfgrdphXQ5kUQibB0ADK8DERB4wrzrUb5CMxLBFE7mQty+v5NsP0OFNK9XTaAOcmD+Ove
 eIjYvqurAaro91jrRVrS1gBRxIFqyPgNvwwL+alMZhn3/2jU2uvBmuRrgnc/e9cHKiuT3Dtq
 MHGPKL2m+plk+7tjMoQFfexoQ1JKugHAjxAhJfrkXh6uS6rc01bYCyo7ybzg53m1HLFJdNGX
 sUKR+dQpBs3SY4s66tc1sREJqdYyTsSZf80HjIeJjU/hRunRo4NjRIJwhvnK1GyjOvvuCKVU
 RWpY8dNjNu5OeAfdrlvFJOxIE9M8JuYCQTMULqd1NuzbpFMjc9524U3Cngs589T7qUMPb1H1
 NTA81LmtJ6Y+IV5/kiTUANflpzBwhu18Ok7kGyCq2a2jsOcVmk8gZNs04gyjuj8JziYwwLbf
 vzABwpFVcS8aR+nHIZV1HtOzyw8CsL8OySc3K9y+Y0NRpziMRvutrppzgyMb9V+N31mK9Mxl
 1YkgaTl4ciNWpdfUe0yxH03OCuHi3922qhPLF4XX5LN+NaVw5Xz2o3eeWklXdouxwV7QlN33
 u4+u2FWzKxDqO6WLQGjxPE0mVB4Gh5Pa1Vb0ct9Ctg0qElvtGQARAQABzShEYW4gU2NhbGx5
 IDxkYW4uc2NhbGx5QGlkZWFzb25ib2FyZC5jb20+wsGNBBMBCAA3FiEEsdtt8OWP7+8SNfQe
 kiQuh/L+GMQFAmLydlIFCQWjmoACGwMECwkIBwUVCAkKCwUWAgMBAAAKCRCSJC6H8v4YxDI2
 EAC2Gz0iyaXJkPInyshrREEWbo0CA6v5KKf3I/HlMPqkZ48bmGoYm4mEQGFWZJAT3K4ir8bg
 cEfs9V54gpbrZvdwS4abXbUK4WjKwEs8HK3XJv1WXUN2bsz5oEJWZUImh9gD3naiLLI9QMMm
 w/aZkT+NbN5/2KvChRWhdcha7+2Te4foOY66nIM+pw2FZM6zIkInLLUik2zXOhaZtqdeJZQi
 HSPU9xu7TRYN4cvdZAnSpG7gQqmLm5/uGZN1/sB3kHTustQtSXKMaIcD/DMNI3JN/t+RJVS7
 c0Jh/ThzTmhHyhxx3DRnDIy7kwMI4CFvmhkVC2uNs9kWsj1DuX5kt8513mvfw2OcX9UnNKmZ
 nhNCuF6DxVrL8wjOPuIpiEj3V+K7DFF1Cxw1/yrLs8dYdYh8T8vCY2CHBMsqpESROnTazboh
 AiQ2xMN1cyXtX11Qwqm5U3sykpLbx2BcmUUUEAKNsM//Zn81QXKG8vOx0ZdMfnzsCaCzt8f6
 9dcDBBI3tJ0BI9ByiocqUoL6759LM8qm18x3FYlxvuOs4wSGPfRVaA4yh0pgI+ModVC2Pu3y
 ejE/IxeatGqJHh6Y+iJzskdi27uFkRixl7YJZvPJAbEn7kzSi98u/5ReEA8Qhc8KO/B7wprj
 xjNMZNYd0Eth8+WkixHYj752NT5qshKJXcyUU87BTQRi8nZSARAAx0BJayh1Fhwbf4zoY56x
 xHEpT6DwdTAYAetd3yiKClLVJadYxOpuqyWa1bdfQWPb+h4MeXbWw/53PBgn7gI2EA7ebIRC
 PJJhAIkeym7hHZoxqDQTGDJjxFEL11qF+U3rhWiL2Zt0Pl+zFq0eWYYVNiXjsIS4FI2+4m16
 tPbDWZFJnSZ828VGtRDQdhXfx3zyVX21lVx1bX4/OZvIET7sVUufkE4hrbqrrufre7wsjD1t
 8MQKSapVrr1RltpzPpScdoxknOSBRwOvpp57pJJe5A0L7+WxJ+vQoQXj0j+5tmIWOAV1qBQp
 hyoyUk9JpPfntk2EKnZHWaApFp5TcL6c5LhUvV7F6XwOjGPuGlZQCWXee9dr7zym8iR3irWT
 +49bIh5PMlqSLXJDYbuyFQHFxoiNdVvvf7etvGfqFYVMPVjipqfEQ38ST2nkzx+KBICz7uwj
 JwLBdTXzGFKHQNckGMl7F5QdO/35An/QcxBnHVMXqaSd12tkJmoRVWduwuuoFfkTY5mUV3uX
 xGj3iVCK4V+ezOYA7c2YolfRCNMTza6vcK/P4tDjjsyBBZrCCzhBvd4VVsnnlZhVaIxoky4K
 aL+AP+zcQrUZmXmgZjXOLryGnsaeoVrIFyrU6ly90s1y3KLoPsDaTBMtnOdwxPmo1xisH8oL
 a/VRgpFBfojLPxMAEQEAAcLBfAQYAQgAJhYhBLHbbfDlj+/vEjX0HpIkLofy/hjEBQJi8nZT
 BQkFo5qAAhsMAAoJEJIkLofy/hjEXPcQAMIPNqiWiz/HKu9W4QIf1OMUpKn3YkVIj3p3gvfM
 Res4fGX94Ji599uLNrPoxKyaytC4R6BTxVriTJjWK8mbo9jZIRM4vkwkZZ2bu98EweSucxbp
 vjESsvMXGgxniqV/RQ/3T7LABYRoIUutARYq58p5HwSP0frF0fdFHYdTa2g7MYZl1ur2JzOC
 FHRpGadlNzKDE3fEdoMobxHB3Lm6FDml5GyBAA8+dQYVI0oDwJ3gpZPZ0J5Vx9RbqXe8RDuR
 du90hvCJkq7/tzSQ0GeD3BwXb9/R/A4dVXhaDd91Q1qQXidI+2jwhx8iqiYxbT+DoAUkQRQy
 xBtoCM1CxH7u45URUgD//fxYr3D4B1SlonA6vdaEdHZOGwECnDpTxecENMbz/Bx7qfrmd901
 D+N9SjIwrbVhhSyUXYnSUb8F+9g2RDY42Sk7GcYxIeON4VzKqWM7hpkXZ47pkK0YodO+dRKM
 yMcoUWrTK0Uz6UzUGKoJVbxmSW/EJLEGoI5p3NWxWtScEVv8mO49gqQdrRIOheZycDmHnItt
 9Qjv00uFhEwv2YfiyGk6iGF2W40s2pH2t6oeuGgmiZ7g6d0MEK8Ql/4zPItvr1c1rpwpXUC1
 u1kQWgtnNjFHX3KiYdqjcZeRBiry1X0zY+4Y24wUU0KsEewJwjhmCKAsju1RpdlPg2kC
In-Reply-To: <20250702200850.GL17819@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Morning Laurent

On 02/07/2025 21:08, Laurent Pinchart wrote:
> Hi Dan,
>
> Thank you for the patch.
>
> On Wed, Jul 02, 2025 at 04:15:04PM +0100, Daniel Scally wrote:
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
> I can't review this patch properly without looking at how it will be
> used. I don't think this series should be split out of the media jobs
> series.

Well, it's first used in the IVC / ISP series; I could include these patches in one of those sets 
instead? They weren't used in the media jobs series either, I was bundling them together as 
precursors to the other two.

>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>> ---
>> This commit was originally in the "Add media jobs framework" series
>> but will now be dropped from there.
>>
>> Changes in this version:
>>
>> 	- Dropped the iter variable now that the pipeline entity
>> 	  iterator functions don't need it.
>> 	- Updated documentation to specify Optional and return
>> 	  values
>>
>> Changes in the previous version:
>>
>> 	- Refactored media_pipeline_started() such that the cleanup
>> 	  function for media_pipeline_entity_iter is unconditionally
>> 	  called
>> 	- Avoided using media_entity_call() helper for operation that
>> 	  has return type void to avoid compiler warnings
>> ---
>>   drivers/media/mc/mc-entity.c | 29 +++++++++++++++++++++++++++++
>>   include/media/media-entity.h | 27 +++++++++++++++++++++++++++
>>   2 files changed, 56 insertions(+)
>>
>> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
>> index 30d15a180ad4525e9438083216ac328a4b76653a..64bacb3197a8a6b4af312abfc1ea9e3dfacdc012 100644
>> --- a/drivers/media/mc/mc-entity.c
>> +++ b/drivers/media/mc/mc-entity.c
>> @@ -1059,6 +1059,35 @@ __media_pipeline_pad_iter_next(struct media_pipeline *pipe,
>>   }
>>   EXPORT_SYMBOL_GPL(__media_pipeline_pad_iter_next);
>>   
>> +int media_pipeline_started(struct media_pipeline *pipe)
> The name "started" sounds like it's related to media_pipeline_start(),
> but it doesn't seem to be the case. That's confusing, we need clearer
> names.
Yes, the naming of this area is a bit confusing. They're related in that the expectation would be 
for this media_pipeline_started() function to be called once media_pipeline_start() had been called 
for each of the video devices (through video_device_pipeline_start())....I think Jacopo proposed 
renaming the existing functions to "media_pipeline_prepare()" and that might work, with this 
becoming media_pipeline_start()?
>> +{
>> +	struct media_entity *entity;
>> +	int ret;
>> +
>> +	media_pipeline_for_each_entity(pipe, entity) {
>> +		ret = media_entity_call(entity, pipeline_started);
>> +		if (ret && ret != -ENOIOCTLCMD)
>> +			break;
>> +	}
>> +
>> +	ret = ret == -ENOIOCTLCMD ? 0 : ret;
>> +	if (ret)
>> +		media_pipeline_stopped(pipe);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(media_pipeline_started);
>> +
>> +void media_pipeline_stopped(struct media_pipeline *pipe)
>> +{
>> +	struct media_entity *entity;
>> +
>> +	media_pipeline_for_each_entity(pipe, entity)
>> +		if (entity->ops && entity->ops->pipeline_stopped)
>> +			entity->ops->pipeline_stopped(entity);
>> +}
>> +EXPORT_SYMBOL_GPL(media_pipeline_stopped);
>> +
>>   /* -----------------------------------------------------------------------------
>>    * Links management
>>    */
>> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
>> index 0f3bad2b9c319b1792bd62fff336bf09c1a42c1b..6e3a97183cc44a084581a941a1b5c02bef38b036 100644
>> --- a/include/media/media-entity.h
>> +++ b/include/media/media-entity.h
>> @@ -271,6 +271,10 @@ struct media_pad {
>>    *			media_entity_has_pad_interdep().
>>    *			Optional: If the operation isn't implemented all pads
>>    *			will be considered as interdependent.
>> + * @pipeline_started:	Notify this entity that the pipeline it is a part of has
>> + *			been started
>> + * @pipeline_stopped:	Notify this entity that the pipeline it is a part of has
>> + *			been stopped
>>    *
>>    * .. note::
>>    *
>> @@ -286,6 +290,8 @@ struct media_entity_operations {
>>   	int (*link_validate)(struct media_link *link);
>>   	bool (*has_pad_interdep)(struct media_entity *entity, unsigned int pad0,
>>   				 unsigned int pad1);
>> +	int (*pipeline_started)(struct media_entity *entity);
>> +	void (*pipeline_stopped)(struct media_entity *entity);
>>   };
>>   
>>   /**
>> @@ -1231,6 +1237,27 @@ __media_pipeline_entity_iter_next(struct media_pipeline *pipe,
>>   	     entity != NULL;							\
>>   	     entity = __media_pipeline_entity_iter_next((pipe), entity))
>>   
>> +/**
>> + * media_pipeline_started - Inform entities in a pipeline that it has started
>> + * @pipe:	The pipeline
>> + *
>> + * Iterate on all entities in a media pipeline and call their pipeline_started
>> + * member of media_entity_operations. Optional.
>> + *
>> + * Return: zero on success, or a negative error code passed through from an
>> + * entity's .pipeline_started() operation.
>> + */
>> +int media_pipeline_started(struct media_pipeline *pipe);
>> +
>> +/**
>> + * media_pipeline_stopped - Inform entities in a pipeline that it has stopped
>> + * @pipe:	The pipeline
>> + *
>> + * Iterate on all entities in a media pipeline and call their pipeline_stopped
>> + * member of media_entity_operations. Optional.
>> + */
>> +void media_pipeline_stopped(struct media_pipeline *pipe);
>> +
>>   /**
>>    * media_pipeline_alloc_start - Mark a pipeline as streaming
>>    * @pad: Starting pad

