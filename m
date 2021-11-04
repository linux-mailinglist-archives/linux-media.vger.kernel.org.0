Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 958A3445204
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 12:11:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231402AbhKDLOC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 07:14:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231266AbhKDLOB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Nov 2021 07:14:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7A97C061714
        for <linux-media@vger.kernel.org>; Thu,  4 Nov 2021 04:11:23 -0700 (PDT)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E3E02E52;
        Thu,  4 Nov 2021 12:11:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636024282;
        bh=Vp2CN20V0VTxdbnTkiJCB8UR68LP9bMwZM4flXY2pk4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ZDVIk6Qvw0Dw+fOi96R4B28oY5xIy6P/nhapABNUs8XmPquM4zGnJeR371t4locvO
         VxUl0ODPXmQYH0BD1Wb5UA9bE7timcQBcbmDqi9+rfsc/emnZ3Tkp26/y9DK3PTjJ1
         ddZwmD8KXFYgYPHy+oML7Fkd5rP99kaOfQnjvaPw=
Subject: Re: [PATCH v9 04/36] media: subdev: add subdev state locking
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-5-tomi.valkeinen@ideasonboard.com>
 <5d5bb6b3-cb89-5d20-59cf-e5ce9cfec6b1@xs4all.nl>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <49077a07-1188-0ef3-d131-acbe04d7a2c6@ideasonboard.com>
Date:   Thu, 4 Nov 2021 13:11:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5d5bb6b3-cb89-5d20-59cf-e5ce9cfec6b1@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/10/2021 17:36, Hans Verkuil wrote:
> On 05/10/2021 10:57, Tomi Valkeinen wrote:
>> The V4L2 subdevs have managed without centralized locking for the state
>> (previously pad_config), as the TRY state is supposedly safe (although I
>> believe two TRY ioctls for the same fd would race), and the ACTIVE
>> state, and its locking, is managed by the drivers internally.
>>
>> We now have ACTIVE state in a centralized position, and need locking.
>> Strictly speaking the locking is only needed for new drivers that use
>> the new state, as the current drivers continue behaving as they used to.
>>
>> Add a mutex to the struct v4l2_subdev_state, along with a few helper
>> functions for locking/unlocking.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/platform/rcar-vin/rcar-v4l2.c |  3 +-
>>   drivers/media/platform/vsp1/vsp1_entity.c   |  4 +-
>>   drivers/media/v4l2-core/v4l2-subdev.c       | 38 +++++++++++++---
>>   drivers/staging/media/tegra-video/vi.c      |  4 +-
>>   include/media/v4l2-subdev.h                 | 49 ++++++++++++++++++++-
>>   5 files changed, 88 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
>> index ba1d16ab1651..e6bd94d63e4f 100644
>> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
>> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
>> @@ -244,6 +244,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
>>   {
>>   	struct v4l2_subdev *sd = vin_to_source(vin);
>>   	struct v4l2_subdev_state *sd_state;
>> +	static struct lock_class_key key;
>>   	struct v4l2_subdev_format format = {
>>   		.which = which,
>>   		.pad = vin->parallel.source_pad,
>> @@ -252,7 +253,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
>>   	u32 width, height;
>>   	int ret;
>>   
>> -	sd_state = __v4l2_subdev_state_alloc(sd);
>> +	sd_state = __v4l2_subdev_state_alloc(sd, "rvin:state->lock", &key);
>>   	if (IS_ERR(sd_state))
>>   		return PTR_ERR(sd_state);
>>   
>> diff --git a/drivers/media/platform/vsp1/vsp1_entity.c b/drivers/media/platform/vsp1/vsp1_entity.c
>> index 869cadc1468d..e607c3ae2520 100644
>> --- a/drivers/media/platform/vsp1/vsp1_entity.c
>> +++ b/drivers/media/platform/vsp1/vsp1_entity.c
>> @@ -613,6 +613,7 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
>>   		     const char *name, unsigned int num_pads,
>>   		     const struct v4l2_subdev_ops *ops, u32 function)
>>   {
>> +	static struct lock_class_key key;
>>   	struct v4l2_subdev *subdev;
>>   	unsigned int i;
>>   	int ret;
>> @@ -675,7 +676,8 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
>>   	 * Allocate the pad configuration to store formats and selection
>>   	 * rectangles.
>>   	 */
>> -	entity->config = __v4l2_subdev_state_alloc(&entity->subdev);
>> +	entity->config = __v4l2_subdev_state_alloc(&entity->subdev,
>> +						   "vsp1:config->lock", &key);
>>   	if (IS_ERR(entity->config)) {
>>   		media_entity_cleanup(&entity->subdev.entity);
>>   		return PTR_ERR(entity->config);
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index aa757cc28879..52309a299b03 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -27,8 +27,9 @@
>>   static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)
>>   {
>>   	struct v4l2_subdev_state *state;
>> +	static struct lock_class_key key;
>>   
>> -	state = __v4l2_subdev_state_alloc(sd);
>> +	state = __v4l2_subdev_state_alloc(sd, "fh->state->lock", &key);
>>   	if (IS_ERR(state))
>>   		return PTR_ERR(state);
>>   
>> @@ -923,7 +924,9 @@ int v4l2_subdev_link_validate(struct media_link *link)
>>   }
>>   EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate);
>>   
>> -struct v4l2_subdev_state *__v4l2_subdev_state_alloc(struct v4l2_subdev *sd)
>> +struct v4l2_subdev_state *
>> +__v4l2_subdev_state_alloc(struct v4l2_subdev *sd, const char *lock_name,
>> +			  struct lock_class_key *lock_key)
>>   {
>>   	struct v4l2_subdev_state *state;
>>   	int ret;
>> @@ -932,6 +935,8 @@ struct v4l2_subdev_state *__v4l2_subdev_state_alloc(struct v4l2_subdev *sd)
>>   	if (!state)
>>   		return ERR_PTR(-ENOMEM);
>>   
>> +	__mutex_init(&state->lock, lock_name, lock_key);
>> +
>>   	if (sd->entity.num_pads) {
>>   		state->pads = kvmalloc_array(sd->entity.num_pads,
>>   					     sizeof(*state->pads),
>> @@ -963,6 +968,8 @@ void __v4l2_subdev_state_free(struct v4l2_subdev_state *state)
>>   	if (!state)
>>   		return;
>>   
>> +	mutex_destroy(&state->lock);
>> +
>>   	kvfree(state->pads);
>>   	kfree(state);
>>   }
>> @@ -997,11 +1004,12 @@ void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
>>   }
>>   EXPORT_SYMBOL_GPL(v4l2_subdev_notify_event);
>>   
>> -int v4l2_subdev_init_finalize(struct v4l2_subdev *sd)
>> +int __v4l2_subdev_init_finalize(struct v4l2_subdev *sd, const char *name,
>> +				struct lock_class_key *key)
>>   {
>>   	struct v4l2_subdev_state *state;
>>   
>> -	state = __v4l2_subdev_state_alloc(sd);
>> +	state = __v4l2_subdev_state_alloc(sd, name, key);
>>   	if (IS_ERR(state))
>>   		return PTR_ERR(state);
>>   
>> @@ -1009,7 +1017,7 @@ int v4l2_subdev_init_finalize(struct v4l2_subdev *sd)
>>   
>>   	return 0;
>>   }
>> -EXPORT_SYMBOL_GPL(v4l2_subdev_init_finalize);
>> +EXPORT_SYMBOL_GPL(__v4l2_subdev_init_finalize);
>>   
>>   void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
>>   {
>> @@ -1017,3 +1025,23 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
>>   	sd->state = NULL;
>>   }
>>   EXPORT_SYMBOL_GPL(v4l2_subdev_cleanup);
>> +
>> +struct v4l2_subdev_state *v4l2_subdev_lock_active_state(struct v4l2_subdev *sd)
>> +{
>> +	mutex_lock(&sd->state->lock);
>> +
>> +	return sd->state;
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_subdev_lock_active_state);
> 
> Why would this function just lock the active state, but...
> 
>> +
>> +void v4l2_subdev_lock_state(struct v4l2_subdev_state *state)
>> +{
>> +	mutex_lock(&state->lock);
> 
> ...this function makes no mention of 'active'.
> 
> The naming is just weird.

The first function locks the active state of the subdev, the second is 
used to lock a state, whether it's active or try.

> Part of the problem is that sd->state doesn't mention in the field name
> that this is the active state. I think the field name and the function
> name should match. So it is either lock_state and state->lock, or it
> is lock_active_state and act_state->lock.

I can rename the field to active_state.

  Tomi
