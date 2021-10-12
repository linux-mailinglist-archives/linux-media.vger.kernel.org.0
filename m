Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A96FC42A75B
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 16:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237322AbhJLOiU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Oct 2021 10:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237399AbhJLOiS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 10:38:18 -0400
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA930C061570
        for <linux-media@vger.kernel.org>; Tue, 12 Oct 2021 07:36:15 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id aIt1msV4mx7rIaIt4mMMgq; Tue, 12 Oct 2021 16:36:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634049374; bh=Fgb+mLl1mRYoCEE2FfQz0CEunW4VE/Gu4QlA5VWkOXA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=nAqx7wV8HwRI2keh7AikDH+6HQuebekoz+MSsyFqXyYNBBii8kGJkruEphvS1zaAb
         1Zbh6gBbpIlxmdXErqTwiXLGCxyc4JoSeOhAZRqfzgA1kb0TnXhAXtmiZGM8+X8736
         Ar03h6rTA3gQNdhYOniRSVZL1RUdWL/mFHCzLcWB5sLYDVZGo0pYo5S2pPxHi53nDR
         1S9ccPYt4yDEVpLS8/Edvl382tmeqt0hl8MEbs1G6K1jhSkSBshlI+MNG6oSoneEC1
         ZvrmmGBx1dAqmBFtK7MrB3KpbzshhiZAEaI0vX5gF9gKrezwkxNQDZg8qQug/oM+8X
         Du9bJK75iaq9g==
Subject: Re: [PATCH v9 04/36] media: subdev: add subdev state locking
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-5-tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <5d5bb6b3-cb89-5d20-59cf-e5ce9cfec6b1@xs4all.nl>
Date:   Tue, 12 Oct 2021 16:36:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211005085750.138151-5-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfClwwcHnwzHJs9Hb0X9w74vR+FHI1q9wxqduDpD76En5Vqq7DDwdJxagCDoK/3NnH47ESh5+dqINTnrHPnSjJZQO2Lk33jlvUwRgf2485V7zr4y4Wuhg
 55MMsVSNR7N4ZLWr+C4BO1ikv9CEvT4B/BundqmHYokW1cZRy2PjW2YtJkOGaJMHJg35fsmsF6MnBQAla8wiVDXLglAU3ceZM7sRodGRElvtu1dX2nOXxQ+7
 lJNKnIchzKV5ABkUmrm0wMySQ5NUFP1zQrpQ6nytlvhSODX60MeuGZaX6ZNSprNostGJHEiL/KoQssfVUFAmLYdntXYtNO0V+PLXu8bpECQE1cc1tzSOrsoV
 c3vy3eLOOXneVGsJkDoYiJeq26Na64mQTAcR2w3RvKoTGvyzcJ/zPjnwQGGtLW6hx93FgBpTwcVRrA7w5vd2OPYhR734lMWoGWAi4uc2hF7tabzDYGF5WdnQ
 QfsRn5elm0W+S+8AM5Pk3J8+I3fZF+GvXQOP8w==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/10/2021 10:57, Tomi Valkeinen wrote:
> The V4L2 subdevs have managed without centralized locking for the state
> (previously pad_config), as the TRY state is supposedly safe (although I
> believe two TRY ioctls for the same fd would race), and the ACTIVE
> state, and its locking, is managed by the drivers internally.
> 
> We now have ACTIVE state in a centralized position, and need locking.
> Strictly speaking the locking is only needed for new drivers that use
> the new state, as the current drivers continue behaving as they used to.
> 
> Add a mutex to the struct v4l2_subdev_state, along with a few helper
> functions for locking/unlocking.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c |  3 +-
>  drivers/media/platform/vsp1/vsp1_entity.c   |  4 +-
>  drivers/media/v4l2-core/v4l2-subdev.c       | 38 +++++++++++++---
>  drivers/staging/media/tegra-video/vi.c      |  4 +-
>  include/media/v4l2-subdev.h                 | 49 ++++++++++++++++++++-
>  5 files changed, 88 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index ba1d16ab1651..e6bd94d63e4f 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -244,6 +244,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
>  {
>  	struct v4l2_subdev *sd = vin_to_source(vin);
>  	struct v4l2_subdev_state *sd_state;
> +	static struct lock_class_key key;
>  	struct v4l2_subdev_format format = {
>  		.which = which,
>  		.pad = vin->parallel.source_pad,
> @@ -252,7 +253,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
>  	u32 width, height;
>  	int ret;
>  
> -	sd_state = __v4l2_subdev_state_alloc(sd);
> +	sd_state = __v4l2_subdev_state_alloc(sd, "rvin:state->lock", &key);
>  	if (IS_ERR(sd_state))
>  		return PTR_ERR(sd_state);
>  
> diff --git a/drivers/media/platform/vsp1/vsp1_entity.c b/drivers/media/platform/vsp1/vsp1_entity.c
> index 869cadc1468d..e607c3ae2520 100644
> --- a/drivers/media/platform/vsp1/vsp1_entity.c
> +++ b/drivers/media/platform/vsp1/vsp1_entity.c
> @@ -613,6 +613,7 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
>  		     const char *name, unsigned int num_pads,
>  		     const struct v4l2_subdev_ops *ops, u32 function)
>  {
> +	static struct lock_class_key key;
>  	struct v4l2_subdev *subdev;
>  	unsigned int i;
>  	int ret;
> @@ -675,7 +676,8 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
>  	 * Allocate the pad configuration to store formats and selection
>  	 * rectangles.
>  	 */
> -	entity->config = __v4l2_subdev_state_alloc(&entity->subdev);
> +	entity->config = __v4l2_subdev_state_alloc(&entity->subdev,
> +						   "vsp1:config->lock", &key);
>  	if (IS_ERR(entity->config)) {
>  		media_entity_cleanup(&entity->subdev.entity);
>  		return PTR_ERR(entity->config);
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index aa757cc28879..52309a299b03 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -27,8 +27,9 @@
>  static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)
>  {
>  	struct v4l2_subdev_state *state;
> +	static struct lock_class_key key;
>  
> -	state = __v4l2_subdev_state_alloc(sd);
> +	state = __v4l2_subdev_state_alloc(sd, "fh->state->lock", &key);
>  	if (IS_ERR(state))
>  		return PTR_ERR(state);
>  
> @@ -923,7 +924,9 @@ int v4l2_subdev_link_validate(struct media_link *link)
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate);
>  
> -struct v4l2_subdev_state *__v4l2_subdev_state_alloc(struct v4l2_subdev *sd)
> +struct v4l2_subdev_state *
> +__v4l2_subdev_state_alloc(struct v4l2_subdev *sd, const char *lock_name,
> +			  struct lock_class_key *lock_key)
>  {
>  	struct v4l2_subdev_state *state;
>  	int ret;
> @@ -932,6 +935,8 @@ struct v4l2_subdev_state *__v4l2_subdev_state_alloc(struct v4l2_subdev *sd)
>  	if (!state)
>  		return ERR_PTR(-ENOMEM);
>  
> +	__mutex_init(&state->lock, lock_name, lock_key);
> +
>  	if (sd->entity.num_pads) {
>  		state->pads = kvmalloc_array(sd->entity.num_pads,
>  					     sizeof(*state->pads),
> @@ -963,6 +968,8 @@ void __v4l2_subdev_state_free(struct v4l2_subdev_state *state)
>  	if (!state)
>  		return;
>  
> +	mutex_destroy(&state->lock);
> +
>  	kvfree(state->pads);
>  	kfree(state);
>  }
> @@ -997,11 +1004,12 @@ void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_notify_event);
>  
> -int v4l2_subdev_init_finalize(struct v4l2_subdev *sd)
> +int __v4l2_subdev_init_finalize(struct v4l2_subdev *sd, const char *name,
> +				struct lock_class_key *key)
>  {
>  	struct v4l2_subdev_state *state;
>  
> -	state = __v4l2_subdev_state_alloc(sd);
> +	state = __v4l2_subdev_state_alloc(sd, name, key);
>  	if (IS_ERR(state))
>  		return PTR_ERR(state);
>  
> @@ -1009,7 +1017,7 @@ int v4l2_subdev_init_finalize(struct v4l2_subdev *sd)
>  
>  	return 0;
>  }
> -EXPORT_SYMBOL_GPL(v4l2_subdev_init_finalize);
> +EXPORT_SYMBOL_GPL(__v4l2_subdev_init_finalize);
>  
>  void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
>  {
> @@ -1017,3 +1025,23 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
>  	sd->state = NULL;
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_cleanup);
> +
> +struct v4l2_subdev_state *v4l2_subdev_lock_active_state(struct v4l2_subdev *sd)
> +{
> +	mutex_lock(&sd->state->lock);
> +
> +	return sd->state;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_lock_active_state);

Why would this function just lock the active state, but...

> +
> +void v4l2_subdev_lock_state(struct v4l2_subdev_state *state)
> +{
> +	mutex_lock(&state->lock);

...this function makes no mention of 'active'.

The naming is just weird.

Part of the problem is that sd->state doesn't mention in the field name
that this is the active state. I think the field name and the function
name should match. So it is either lock_state and state->lock, or it
is lock_active_state and act_state->lock.

Either works, but this odd mix of names is confusing.

Regards,

	Hans

> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_lock_state);
> +
> +void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state)
> +{
> +	mutex_unlock(&state->lock);
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_unlock_state);
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
> index 66b9ce160472..3516735f0cad 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -491,6 +491,7 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
>  				      struct v4l2_pix_format *pix)
>  {
>  	const struct tegra_video_format *fmtinfo;
> +	static struct lock_class_key key;
>  	struct v4l2_subdev *subdev;
>  	struct v4l2_subdev_format fmt;
>  	struct v4l2_subdev_state *sd_state;
> @@ -507,7 +508,8 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
>  	if (!subdev)
>  		return -ENODEV;
>  
> -	sd_state = __v4l2_subdev_state_alloc(subdev);
> +	sd_state = __v4l2_subdev_state_alloc(subdev, "tegra:state->lock",
> +					     &key);
>  	if (IS_ERR(sd_state))
>  		return PTR_ERR(sd_state);
>  	/*
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 3aaa7146e5ff..a6e8f531a396 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -655,6 +655,7 @@ struct v4l2_subdev_pad_config {
>  /**
>   * struct v4l2_subdev_state - Used for storing subdev state information.
>   *
> + * @lock: mutex for the state
>   * @pads: &struct v4l2_subdev_pad_config array
>   *
>   * This structure only needs to be passed to the pad op if the 'which' field
> @@ -662,6 +663,7 @@ struct v4l2_subdev_pad_config {
>   * %V4L2_SUBDEV_FORMAT_ACTIVE it is safe to pass %NULL.
>   */
>  struct v4l2_subdev_state {
> +	struct mutex lock;
>  	struct v4l2_subdev_pad_config *pads;
>  };
>  
> @@ -1153,10 +1155,14 @@ int v4l2_subdev_link_validate(struct media_link *link);
>   * __v4l2_subdev_state_alloc - allocate v4l2_subdev_state
>   *
>   * @sd: pointer to &struct v4l2_subdev for which the state is being allocated.
> + * @lock_name: name of the state lock
> + * @key: lock_class_key for the lock
>   *
>   * Must call __v4l2_subdev_state_free() when state is no longer needed.
>   */
> -struct v4l2_subdev_state *__v4l2_subdev_state_alloc(struct v4l2_subdev *sd);
> +struct v4l2_subdev_state *__v4l2_subdev_state_alloc(struct v4l2_subdev *sd,
> +						    const char *lock_name,
> +						    struct lock_class_key *key);
>  
>  /**
>   * __v4l2_subdev_state_free - free a v4l2_subdev_state
> @@ -1245,7 +1251,16 @@ void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
>   *
>   * Must call v4l2_subdev_cleanup() when the subdev is being removed.
>   */
> -int v4l2_subdev_init_finalize(struct v4l2_subdev *sd);
> +#define v4l2_subdev_init_finalize(sd)                                          \
> +	({                                                                     \
> +		static struct lock_class_key __key;                            \
> +		const char *name = KBUILD_BASENAME                             \
> +			":" __stringify(__LINE__) ":subdev->state->lock";      \
> +		__v4l2_subdev_init_finalize(sd, name, &__key);                 \
> +	})
> +
> +int __v4l2_subdev_init_finalize(struct v4l2_subdev *sd, const char *name,
> +				struct lock_class_key *key);
>  
>  /**
>   * v4l2_subdev_cleanup() - Release the resources needed by the subdevice
> @@ -1268,4 +1283,34 @@ v4l2_subdev_get_active_state(struct v4l2_subdev *sd)
>  	return sd->state;
>  }
>  
> +/**
> + * v4l2_subdev_lock_active_state() - Lock and return the active subdev state for
> + *				     subdevice
> + * @sd: The subdevice
> + *
> + * Return the locked active state for the subdevice, or NULL if the subdev
> + * does not support active state.
> + *
> + * Must be unlocked with v4l2_subdev_unlock_state() after use.
> + */
> +struct v4l2_subdev_state *v4l2_subdev_lock_active_state(struct v4l2_subdev *sd);
> +
> +/**
> + * v4l2_subdev_lock_state() - Lock the subdev state
> + * @state: The subdevice state
> + *
> + * Lock the given subdev state.
> + *
> + * Must be unlocked with v4l2_subdev_unlock_state() after use.
> + */
> +void v4l2_subdev_lock_state(struct v4l2_subdev_state *state);
> +
> +/**
> + * v4l2_subdev_unlock_state() - Unlock the subdev state
> + * @state: The subdevice state
> + *
> + * Unlock the given subdev state.
> + */
> +void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state);
> +
>  #endif
> 

