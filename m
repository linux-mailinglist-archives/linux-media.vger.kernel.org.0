Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF3B418D81
	for <lists+linux-media@lfdr.de>; Mon, 27 Sep 2021 03:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232246AbhI0Bhi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 21:37:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230174AbhI0Bhh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 21:37:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C14EC061570
        for <linux-media@vger.kernel.org>; Sun, 26 Sep 2021 18:36:00 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 659A449A;
        Mon, 27 Sep 2021 03:35:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632706558;
        bh=Cs/JvfF+mUu5uazIkM6XmKqF6MsBqbcD5fw5wH4Hyyo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OOuB0Eo2OYOqK/FX1bx8ScbBKOZnFLNZlPE0OA6L3DBkMjwAnk01RAgjYIqJQ//vD
         7/MJuvlwEX2uv96DHP+INbUzXLAmksFP4Zup3YAuknxvvlakoxW/aCyHgPg2X11fzK
         ZbNKitvHSNLGgd++UhqZJlQt+nJOkOx6KWPLJLtY=
Date:   Mon, 27 Sep 2021 04:35:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [PATCH v8 05/36] media: subdev: add subdev state locking
Message-ID: <YVEf+VRWFcbdUOXm@pendragon.ideasonboard.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
 <20210830110116.488338-6-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210830110116.488338-6-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Aug 30, 2021 at 02:00:45PM +0300, Tomi Valkeinen wrote:
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
>  drivers/media/v4l2-core/v4l2-subdev.c | 43 +++++++++++++++++----
>  include/media/v4l2-subdev.h           | 55 +++++++++++++++++++++++++--
>  2 files changed, 88 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index b3637cddca58..b1e65488210d 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -26,9 +26,11 @@
>  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>  static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)
>  {
> +	static struct lock_class_key __key;
>  	struct v4l2_subdev_state *state;
>  
> -	state = v4l2_alloc_subdev_state(sd, V4L2_SUBDEV_FORMAT_TRY);
> +	state = __v4l2_alloc_subdev_state(sd, V4L2_SUBDEV_FORMAT_TRY,
> +					  "v4l2_subdev_fh->state", &__key);

What's the reason for not using the v4l2_alloc_subdev_state() macro here
?

>  	if (IS_ERR(state))
>  		return PTR_ERR(state);
>  
> @@ -924,8 +926,10 @@ int v4l2_subdev_link_validate(struct media_link *link)
>  EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate);
>  
>  struct v4l2_subdev_state *
> -v4l2_alloc_subdev_state(struct v4l2_subdev *sd,
> -			enum v4l2_subdev_format_whence which)
> +__v4l2_alloc_subdev_state(struct v4l2_subdev *sd,
> +			  enum v4l2_subdev_format_whence which,
> +			  const char *lock_name,
> +			  struct lock_class_key *lock_key)
>  {
>  	struct v4l2_subdev_state *state;
>  	int ret;
> @@ -934,6 +938,8 @@ v4l2_alloc_subdev_state(struct v4l2_subdev *sd,
>  	if (!state)
>  		return ERR_PTR(-ENOMEM);
>  
> +	__mutex_init(&state->lock, lock_name, lock_key);
> +
>  	state->which = which;
>  
>  	if (sd->entity.num_pads) {
> @@ -960,13 +966,15 @@ v4l2_alloc_subdev_state(struct v4l2_subdev *sd,
>  
>  	return ERR_PTR(ret);
>  }
> -EXPORT_SYMBOL_GPL(v4l2_alloc_subdev_state);
> +EXPORT_SYMBOL_GPL(__v4l2_alloc_subdev_state);
>  
>  void v4l2_free_subdev_state(struct v4l2_subdev_state *state)
>  {
>  	if (!state)
>  		return;
>  
> +	mutex_destroy(&state->lock);
> +
>  	kvfree(state->pads);
>  	kfree(state);
>  }
> @@ -1001,11 +1009,12 @@ void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_notify_event);
>  
> -int v4l2_subdev_alloc_state(struct v4l2_subdev *sd)
> +int __v4l2_subdev_alloc_state(struct v4l2_subdev *sd, const char *name,
> +			      struct lock_class_key *key)
>  {
>  	struct v4l2_subdev_state *state;
>  
> -	state = v4l2_alloc_subdev_state(sd, V4L2_SUBDEV_FORMAT_ACTIVE);
> +	state = __v4l2_alloc_subdev_state(sd, V4L2_SUBDEV_FORMAT_ACTIVE, name, key);

I already know that Sakari will ask for a line wrap at 80 columns, and
that would be my preference as well :-) I won't repeat the comment in
the rest of the series. Going over 80 columns is fine when it improves
readability, but in many places keeping lines short enough would be
nicer.

>  	if (IS_ERR(state))
>  		return PTR_ERR(state);
>  
> @@ -1013,7 +1022,7 @@ int v4l2_subdev_alloc_state(struct v4l2_subdev *sd)
>  
>  	return 0;
>  }
> -EXPORT_SYMBOL_GPL(v4l2_subdev_alloc_state);
> +EXPORT_SYMBOL_GPL(__v4l2_subdev_alloc_state);
>  
>  void v4l2_subdev_free_state(struct v4l2_subdev *sd)
>  {
> @@ -1021,3 +1030,23 @@ void v4l2_subdev_free_state(struct v4l2_subdev *sd)
>  	sd->state = NULL;
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_free_state);
> +
> +struct v4l2_subdev_state *v4l2_subdev_lock_active_state(struct v4l2_subdev *sd)
> +{
> +	mutex_lock(&sd->state->lock);
> +
> +	return sd->state;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_lock_active_state);
> +
> +void v4l2_subdev_lock_state(struct v4l2_subdev_state *state)
> +{
> +	mutex_lock(&state->lock);
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_lock_state);
> +
> +void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state)
> +{
> +	mutex_unlock(&state->lock);
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_unlock_state);
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 5ec78ffda4f5..52a725281b23 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -655,6 +655,7 @@ struct v4l2_subdev_pad_config {
>  /**
>   * struct v4l2_subdev_state - Used for storing subdev state information.
>   *
> + * @lock: mutex for the state
>   * @which: state type (from enum v4l2_subdev_format_whence)
>   * @pads: &struct v4l2_subdev_pad_config array
>   *
> @@ -663,6 +664,7 @@ struct v4l2_subdev_pad_config {
>   * %V4L2_SUBDEV_FORMAT_ACTIVE it is safe to pass %NULL.
>   */
>  struct v4l2_subdev_state {
> +	struct mutex lock;
>  	u32 which;
>  	struct v4l2_subdev_pad_config *pads;
>  };
> @@ -1147,9 +1149,18 @@ int v4l2_subdev_link_validate(struct media_link *link);
>   *
>   * Must call v4l2_free_subdev_state() when state is no longer needed.
>   */
> +#define v4l2_alloc_subdev_state(sd, which)                                     \
> +	({                                                                     \
> +		static struct lock_class_key __key;                            \
> +		const char *name = KBUILD_BASENAME                             \
> +			":" __stringify(__LINE__) ":sd->state->lock";          \
> +		__v4l2_alloc_subdev_state(sd, which, name, &__key);            \
> +	})
> +
>  struct v4l2_subdev_state *
> -v4l2_alloc_subdev_state(struct v4l2_subdev *sd,
> -			enum v4l2_subdev_format_whence which);
> +__v4l2_alloc_subdev_state(struct v4l2_subdev *sd,
> +			  enum v4l2_subdev_format_whence which,
> +			  const char *lock_name, struct lock_class_key *key);
>  
>  /**
>   * v4l2_free_subdev_state - free a v4l2_subdev_state
> @@ -1234,7 +1245,16 @@ void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
>   *
>   * Must call v4l2_subdev_free_state() when the state is no longer needed.
>   */
> -int v4l2_subdev_alloc_state(struct v4l2_subdev *sd);
> +#define v4l2_subdev_alloc_state(sd)                                            \
> +	({                                                                     \
> +		static struct lock_class_key __key;                            \
> +		const char *name = KBUILD_BASENAME                             \
> +			":" __stringify(__LINE__) ":sd->state->lock";          \
> +		__v4l2_subdev_alloc_state(sd, name, &__key);                   \
> +	})
> +
> +int __v4l2_subdev_alloc_state(struct v4l2_subdev *sd, const char *name,
> +			      struct lock_class_key *key);
>  
>  /**
>   * v4l2_subdev_free_state() - Free the active subdev state for subdevice
> @@ -1258,4 +1278,33 @@ v4l2_subdev_get_active_state(struct v4l2_subdev *sd)
>  	return sd->state;
>  }
>  
> +/**
> + * v4l2_subdev_lock_active_state() - Lock and return the active subdev state for subdevice
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

This seems to be used only to lock the state passed to the subdev
operation by the caller. Could the caller lock the state instead ? This
could possibly be done by wrapping the v4l2_subdev_call() calls in
dedicated helper functions.

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

-- 
Regards,

Laurent Pinchart
