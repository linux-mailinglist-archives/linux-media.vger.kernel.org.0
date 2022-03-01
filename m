Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D023C4C87C1
	for <lists+linux-media@lfdr.de>; Tue,  1 Mar 2022 10:22:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233706AbiCAJWj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Mar 2022 04:22:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233711AbiCAJWi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Mar 2022 04:22:38 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C06680233
        for <linux-media@vger.kernel.org>; Tue,  1 Mar 2022 01:21:57 -0800 (PST)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA809478;
        Tue,  1 Mar 2022 10:21:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646126515;
        bh=bKvXpq3ijLbgLIAlpSewEZSn8s2QBjMFVeI69YHBFao=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=oEzxirLtLY2UiCrALdB+7i2RjYoA2t2Sx+U0EXlHTETIZaKFjFV8sCl+u5rOwf9pB
         a06RVooWN59jmj4h7HbA/Ouq6UE6rEmTbekDRQS8EyRKV5MkvV9eGPBulAZF3bUZ8f
         rviFSSyeOYdQ9l4C9P1V8FtHBF80CPRbaNF7JZ8g=
Message-ID: <9468e09e-24e5-986a-0131-0452537ffe13@ideasonboard.com>
Date:   Tue, 1 Mar 2022 11:21:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 4/7] media: subdev: add subdev state locking
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20220216130049.508664-1-tomi.valkeinen@ideasonboard.com>
 <20220216130049.508664-5-tomi.valkeinen@ideasonboard.com>
 <824c5ed4-26f8-6fe8-a81f-6c303c04dc95@xs4all.nl>
 <Yhygg03+Z9nmwZjh@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Yhygg03+Z9nmwZjh@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 28/02/2022 12:14, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Mon, Feb 28, 2022 at 11:05:09AM +0100, Hans Verkuil wrote:
>> On 2/16/22 14:00, Tomi Valkeinen wrote:
>>> The V4L2 subdevs have managed without centralized locking for the state
>>> (previously pad_config), as the try-state is supposedly safe (although I
>>> believe two TRY ioctls for the same fd would race), and the
>>> active-state, and its locking, is managed by the drivers internally.
>>>
>>> We now have active-state in a centralized position, and need locking.
>>> Strictly speaking the locking is only needed for new drivers that use
>>> the new state, as the current drivers continue behaving as they used to.
>>>
>>> However, active-state locking is complicated by the fact that currently
>>> the real active-state of a subdev is split into multiple parts: the new
>>> v4l2_subdev_state, subdev control state, and subdev's internal state.
>>>
>>> In the future all these three states should be combined into one state
>>> (the v4l2_subdev_state), and then a single lock for the state should be
>>> sufficient.
>>>
>>> But to solve the current split-state situation we need to share locks
>>> between the three states. This is accomplished by using the same lock
>>> management as the control handler does: we use a pointer to a mutex,
>>> allowing the driver to override the default mutex. Thus the driver can
>>> do e.g.:
>>>
>>> sd->state_lock = sd->ctrl_handler->lock;
>>>
>>> before calling v4l2_subdev_init_finalize(), resulting in sharing the
>>> same lock between the states and the controls.
>>>
>>> The locking model for active-state is such that any subdev op that gets
>>> the state as a parameter expects the state to be already locked by the
>>> caller, and expects the caller to release the lock.
>>>
>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>> ---
>>>   drivers/media/platform/rcar-vin/rcar-v4l2.c |  3 +-
>>>   drivers/media/platform/vsp1/vsp1_entity.c   |  4 +-
>>>   drivers/media/v4l2-core/v4l2-subdev.c       | 78 +++++++++++++++----
>>>   drivers/staging/media/tegra-video/vi.c      |  4 +-
>>>   include/media/v4l2-subdev.h                 | 85 ++++++++++++++++++++-
>>>   5 files changed, 155 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
>>> index da88f968c31a..3759f4619a77 100644
>>> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
>>> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
>>> @@ -255,6 +255,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
>>>   {
>>>   	struct v4l2_subdev *sd = vin_to_source(vin);
>>>   	struct v4l2_subdev_state *sd_state;
>>> +	static struct lock_class_key key;
>>>   	struct v4l2_subdev_format format = {
>>>   		.which = which,
>>>   		.pad = vin->parallel.source_pad,
>>> @@ -267,7 +268,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
>>>   	 * FIXME: Drop this call, drivers are not supposed to use
>>>   	 * __v4l2_subdev_state_alloc().
>>>   	 */
>>> -	sd_state = __v4l2_subdev_state_alloc(sd);
>>> +	sd_state = __v4l2_subdev_state_alloc(sd, "rvin:state->lock", &key);
>>>   	if (IS_ERR(sd_state))
>>>   		return PTR_ERR(sd_state);
>>>   
>>> diff --git a/drivers/media/platform/vsp1/vsp1_entity.c b/drivers/media/platform/vsp1/vsp1_entity.c
>>> index c82b3fb7b89a..a116a3362f9e 100644
>>> --- a/drivers/media/platform/vsp1/vsp1_entity.c
>>> +++ b/drivers/media/platform/vsp1/vsp1_entity.c
>>> @@ -613,6 +613,7 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
>>>   		     const char *name, unsigned int num_pads,
>>>   		     const struct v4l2_subdev_ops *ops, u32 function)
>>>   {
>>> +	static struct lock_class_key key;
>>>   	struct v4l2_subdev *subdev;
>>>   	unsigned int i;
>>>   	int ret;
>>> @@ -679,7 +680,8 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
>>>   	 * FIXME: Drop this call, drivers are not supposed to use
>>>   	 * __v4l2_subdev_state_alloc().
>>>   	 */
>>> -	entity->config = __v4l2_subdev_state_alloc(&entity->subdev);
>>> +	entity->config = __v4l2_subdev_state_alloc(&entity->subdev,
>>> +						   "vsp1:config->lock", &key);
>>>   	if (IS_ERR(entity->config)) {
>>>   		media_entity_cleanup(&entity->subdev.entity);
>>>   		return PTR_ERR(entity->config);
>>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>>> index b67bbce82612..0df9bbe1819d 100644
>>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>>> @@ -27,8 +27,9 @@
>>>   static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)
>>>   {
>>>   	struct v4l2_subdev_state *state;
>>> +	static struct lock_class_key key;
>>>   
>>> -	state = __v4l2_subdev_state_alloc(sd);
>>> +	state = __v4l2_subdev_state_alloc(sd, "fh->state->lock", &key);
>>>   	if (IS_ERR(state))
>>>   		return PTR_ERR(state);
>>>   
>>> @@ -383,18 +384,15 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
>>>   			     v4l2_subdev_get_active_state(sd);
>>>   }
>>>   
>>> -static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>>> +static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>>> +			    struct v4l2_subdev_state *state)
>>>   {
>>>   	struct video_device *vdev = video_devdata(file);
>>>   	struct v4l2_subdev *sd = vdev_to_v4l2_subdev(vdev);
>>>   	struct v4l2_fh *vfh = file->private_data;
>>> -	struct v4l2_subdev_fh *subdev_fh = to_v4l2_subdev_fh(vfh);
>>>   	bool ro_subdev = test_bit(V4L2_FL_SUBDEV_RO_DEVNODE, &vdev->flags);
>>> -	struct v4l2_subdev_state *state;
>>>   	int rval;
>>>   
>>> -	state = subdev_ioctl_get_state(sd, subdev_fh, cmd, arg);
>>> -
>>>   	switch (cmd) {
>>>   	case VIDIOC_SUBDEV_QUERYCAP: {
>>>   		struct v4l2_subdev_capability *cap = arg;
>>> @@ -707,8 +705,24 @@ static long subdev_do_ioctl_lock(struct file *file, unsigned int cmd, void *arg)
>>>   
>>>   	if (lock && mutex_lock_interruptible(lock))
>>>   		return -ERESTARTSYS;
>>> -	if (video_is_registered(vdev))
>>> -		ret = subdev_do_ioctl(file, cmd, arg);
>>> +
>>> +	if (video_is_registered(vdev)) {
>>> +		struct v4l2_subdev *sd = vdev_to_v4l2_subdev(vdev);
>>> +		struct v4l2_fh *vfh = file->private_data;
>>> +		struct v4l2_subdev_fh *subdev_fh = to_v4l2_subdev_fh(vfh);
>>> +		struct v4l2_subdev_state *state;
>>> +
>>> +		state = subdev_ioctl_get_state(sd, subdev_fh, cmd, arg);
>>> +
>>> +		if (state)
>>> +			v4l2_subdev_lock_state(state);
>>> +
>>> +		ret = subdev_do_ioctl(file, cmd, arg, state);
>>> +
>>> +		if (state)
>>> +			v4l2_subdev_unlock_state(state);
>>> +	}
>>> +
>>>   	if (lock)
>>>   		mutex_unlock(lock);
>>>   	return ret;
>>> @@ -864,7 +878,7 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad,
>>>   			media_entity_to_v4l2_subdev(pad->entity);
>>>   		struct v4l2_subdev_state *state;
>>>   
>>> -		state = v4l2_subdev_get_active_state(sd);
>>> +		state = v4l2_subdev_get_locked_active_state(sd);
>>>   
>>>   		fmt->which = V4L2_SUBDEV_FORMAT_ACTIVE;
>>>   		fmt->pad = pad->index;
>>> @@ -906,7 +920,9 @@ int v4l2_subdev_link_validate(struct media_link *link)
>>>   }
>>>   EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate);
>>>   
>>> -struct v4l2_subdev_state *__v4l2_subdev_state_alloc(struct v4l2_subdev *sd)
>>> +struct v4l2_subdev_state *
>>> +__v4l2_subdev_state_alloc(struct v4l2_subdev *sd, const char *lock_name,
>>> +			  struct lock_class_key *lock_key)
>>>   {
>>>   	struct v4l2_subdev_state *state;
>>>   	int ret;
>>> @@ -915,6 +931,12 @@ struct v4l2_subdev_state *__v4l2_subdev_state_alloc(struct v4l2_subdev *sd)
>>>   	if (!state)
>>>   		return ERR_PTR(-ENOMEM);
>>>   
>>> +	__mutex_init(&state->_lock, lock_name, lock_key);
>>> +	if (sd->state_lock)
>>> +		state->lock = sd->state_lock;
>>> +	else
>>> +		state->lock = &state->_lock;
>>> +
>>>   	if (sd->entity.num_pads) {
>>>   		state->pads = kvmalloc_array(sd->entity.num_pads,
>>>   					     sizeof(*state->pads),
>>> @@ -925,7 +947,14 @@ struct v4l2_subdev_state *__v4l2_subdev_state_alloc(struct v4l2_subdev *sd)
>>>   		}
>>>   	}
>>>   
>>> +	/*
>>> +	 * There can be no race at this point, but we lock the state anyway to
>>> +	 * satisfy lockdep checks.
>>> +	 */
>>> +	v4l2_subdev_lock_state(state);
>>>   	ret = v4l2_subdev_call(sd, pad, init_cfg, state);
>>> +	v4l2_subdev_unlock_state(state);
>>> +
>>>   	if (ret < 0 && ret != -ENOIOCTLCMD)
>>>   		goto err;
>>>   
>>> @@ -946,16 +975,19 @@ void __v4l2_subdev_state_free(struct v4l2_subdev_state *state)
>>>   	if (!state)
>>>   		return;
>>>   
>>> +	mutex_destroy(&state->_lock);
>>> +
>>>   	kvfree(state->pads);
>>>   	kfree(state);
>>>   }
>>>   EXPORT_SYMBOL_GPL(__v4l2_subdev_state_free);
>>>   
>>> -int v4l2_subdev_init_finalize(struct v4l2_subdev *sd)
>>> +int __v4l2_subdev_init_finalize(struct v4l2_subdev *sd, const char *name,
>>> +				struct lock_class_key *key)
>>>   {
>>>   	struct v4l2_subdev_state *state;
>>>   
>>> -	state = __v4l2_subdev_state_alloc(sd);
>>> +	state = __v4l2_subdev_state_alloc(sd, name, key);
>>>   	if (IS_ERR(state))
>>>   		return PTR_ERR(state);
>>>   
>>> @@ -963,7 +995,7 @@ int v4l2_subdev_init_finalize(struct v4l2_subdev *sd)
>>>   
>>>   	return 0;
>>>   }
>>> -EXPORT_SYMBOL_GPL(v4l2_subdev_init_finalize);
>>> +EXPORT_SYMBOL_GPL(__v4l2_subdev_init_finalize);
>>>   
>>>   void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
>>>   {
>>> @@ -972,6 +1004,26 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
>>>   }
>>>   EXPORT_SYMBOL_GPL(v4l2_subdev_cleanup);
>>>   
>>> +struct v4l2_subdev_state *v4l2_subdev_lock_active_state(struct v4l2_subdev *sd)
>>> +{
>>> +	mutex_lock(sd->active_state->lock);
>>> +
>>> +	return sd->active_state;
>>> +}
>>> +EXPORT_SYMBOL_GPL(v4l2_subdev_lock_active_state);
>>
>> I don't like this function very much. First of all, call v4l2_subdev_lock_state()
>> instead of mutex_lock, that signals that the normal state lock function is used.
>>
>> The naming is poor since this suggests that the active_state is just locked
>> when it actually is also returned. So v4l2_subdev_lock_and_return_active_state()
>> is really the correct name. Long, yes, but at least it is clear what it does.
> 
> I agree the name isn't perfect. How about
> v4l2_subdev_lock_and_get_active_state() ?
> 
>> I also think this is better done as a static inline.
>>
>> But really, I wonder if we need this helper at all. Can't drivers just call
>> v4l2_subdev_lock_state(sd->active_state) and then use sd->active_state?
>>
>> I think that's much more understandable, and it avoids having confusing
>> lock helper functions. More on this below in the header.
> 
> Drivers should never access that active_state field manually, that's a
> hard rule. All accesses should go through accessors. No expection, so
> it's easy to enforce the rule.
> 
> This accessor isn't meant to stay. It is here to help the transition to
> active states, and will also allow quickly identifying through grep
> where more work is required to move drivers to the correct API.

Why wouldn't v4l2_subdev_lock_and_get_active_state() stay? I think it's 
the function to use when e.g. a driver gets a callback from debugfs.

  Tomi
