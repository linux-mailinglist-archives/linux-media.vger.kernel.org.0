Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAC094191F6
	for <lists+linux-media@lfdr.de>; Mon, 27 Sep 2021 12:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233765AbhI0KIS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Sep 2021 06:08:18 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37758 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233703AbhI0KIR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Sep 2021 06:08:17 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92384B91;
        Mon, 27 Sep 2021 12:06:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632737198;
        bh=AmPABJCjXgYaMq9630arGZP0+2rkbb/7HAUtCbfAZu0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QzaKnSjxAJ+iNj++PV0UZJe+LkYvt6aIUjfeGxym/4gYGQMPuHH19aMdSr0cmy4mw
         MbOZJNbRSjfxvgxYZLL1wNj3/vVjf3Oz+/6YS6KdPUqsyXDgL9F5OV6gPnQ3NtJani
         m3XksL8SyoI2iiYB7Sqaxz0hKKqQGTT6SPk6wWyA=
Date:   Mon, 27 Sep 2021 13:06:31 +0300
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
Message-ID: <YVGXp/VlxBrhMSEo@pendragon.ideasonboard.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
 <20210830110116.488338-6-tomi.valkeinen@ideasonboard.com>
 <YVEf+VRWFcbdUOXm@pendragon.ideasonboard.com>
 <264618fd-30b3-5fcc-1136-f5f2a0cd002f@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <264618fd-30b3-5fcc-1136-f5f2a0cd002f@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Mon, Sep 27, 2021 at 12:49:35PM +0300, Tomi Valkeinen wrote:
> On 27/09/2021 04:35, Laurent Pinchart wrote:
> > On Mon, Aug 30, 2021 at 02:00:45PM +0300, Tomi Valkeinen wrote:
> >> The V4L2 subdevs have managed without centralized locking for the state
> >> (previously pad_config), as the TRY state is supposedly safe (although I
> >> believe two TRY ioctls for the same fd would race), and the ACTIVE
> >> state, and its locking, is managed by the drivers internally.
> >>
> >> We now have ACTIVE state in a centralized position, and need locking.
> >> Strictly speaking the locking is only needed for new drivers that use
> >> the new state, as the current drivers continue behaving as they used to.
> >>
> >> Add a mutex to the struct v4l2_subdev_state, along with a few helper
> >> functions for locking/unlocking.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >>   drivers/media/v4l2-core/v4l2-subdev.c | 43 +++++++++++++++++----
> >>   include/media/v4l2-subdev.h           | 55 +++++++++++++++++++++++++--
> >>   2 files changed, 88 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> >> index b3637cddca58..b1e65488210d 100644
> >> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> >> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> >> @@ -26,9 +26,11 @@
> >>   #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> >>   static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)
> >>   {
> >> +	static struct lock_class_key __key;
> >>   	struct v4l2_subdev_state *state;
> >>   
> >> -	state = v4l2_alloc_subdev_state(sd, V4L2_SUBDEV_FORMAT_TRY);
> >> +	state = __v4l2_alloc_subdev_state(sd, V4L2_SUBDEV_FORMAT_TRY,
> >> +					  "v4l2_subdev_fh->state", &__key);
> > 
> > What's the reason for not using the v4l2_alloc_subdev_state() macro here
> > ?
> 
> It has a different name for the lock. I'm not sure if that's really 
> needed or not, as v4l2_alloc_subdev_state anyway adds a filename and 
> line-number.
> 
> I guess one reason is that at some point v4l2_alloc_subdev_state() was 
> supposed to be only for allocating active configuration. Which is 
> actually what the lock name there refers to "sd->state->lock".
> 
> >>   	if (IS_ERR(state))
> >>   		return PTR_ERR(state);
> >>   
> >> @@ -924,8 +926,10 @@ int v4l2_subdev_link_validate(struct media_link *link)
> >>   EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate);
> >>   
> >>   struct v4l2_subdev_state *
> >> -v4l2_alloc_subdev_state(struct v4l2_subdev *sd,
> >> -			enum v4l2_subdev_format_whence which)
> >> +__v4l2_alloc_subdev_state(struct v4l2_subdev *sd,
> >> +			  enum v4l2_subdev_format_whence which,
> >> +			  const char *lock_name,
> >> +			  struct lock_class_key *lock_key)
> >>   {
> >>   	struct v4l2_subdev_state *state;
> >>   	int ret;
> >> @@ -934,6 +938,8 @@ v4l2_alloc_subdev_state(struct v4l2_subdev *sd,
> >>   	if (!state)
> >>   		return ERR_PTR(-ENOMEM);
> >>   
> >> +	__mutex_init(&state->lock, lock_name, lock_key);
> >> +
> >>   	state->which = which;
> >>   
> >>   	if (sd->entity.num_pads) {
> >> @@ -960,13 +966,15 @@ v4l2_alloc_subdev_state(struct v4l2_subdev *sd,
> >>   
> >>   	return ERR_PTR(ret);
> >>   }
> >> -EXPORT_SYMBOL_GPL(v4l2_alloc_subdev_state);
> >> +EXPORT_SYMBOL_GPL(__v4l2_alloc_subdev_state);
> >>   
> >>   void v4l2_free_subdev_state(struct v4l2_subdev_state *state)
> >>   {
> >>   	if (!state)
> >>   		return;
> >>   
> >> +	mutex_destroy(&state->lock);
> >> +
> >>   	kvfree(state->pads);
> >>   	kfree(state);
> >>   }
> >> @@ -1001,11 +1009,12 @@ void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
> >>   }
> >>   EXPORT_SYMBOL_GPL(v4l2_subdev_notify_event);
> >>   
> >> -int v4l2_subdev_alloc_state(struct v4l2_subdev *sd)
> >> +int __v4l2_subdev_alloc_state(struct v4l2_subdev *sd, const char *name,
> >> +			      struct lock_class_key *key)
> >>   {
> >>   	struct v4l2_subdev_state *state;
> >>   
> >> -	state = v4l2_alloc_subdev_state(sd, V4L2_SUBDEV_FORMAT_ACTIVE);
> >> +	state = __v4l2_alloc_subdev_state(sd, V4L2_SUBDEV_FORMAT_ACTIVE, name, key);
> > 
> > I already know that Sakari will ask for a line wrap at 80 columns, and
> > that would be my preference as well :-) I won't repeat the comment in
> > the rest of the series. Going over 80 columns is fine when it improves
> > readability, but in many places keeping lines short enough would be
> > nicer.
> 
> Hmm... I think I went over all the 80+ lines at some point, but this 
> change probably came afterwards. I'll go through them again.
> 
> A bit of a side topic, but an annoying think about complying to 80 
> columns is that my editor indents with tabs and aligns with spaces. And 
> you (and I guess Sakar) want both be done with tabs, and with only a 
> minimal amount of spaces. I personally like my editor's behavior better, 
> though, as it works fine when changing tab widths too.

The kernel coding style is to use tabs instead of spaces as much as
possible, and even if we don't wrap lines slightly over 80 columns,
there will always be lines that need to be wrapped, so I'm afraid it's
something that you need to handle in any case.

I don't know what editor you use (and I'm sure I don't want to know
:-)), but can't you instruct it to comply with the kernel coding style
by using tabs ?

> I can use clang-format to do the indentation instead, but it has the 
> super annoying feature that it likes to do this:
> 
> v4l2_subdev_function_name(
> 	sd, bar, long_argument_here);
> 
> >>   	if (IS_ERR(state))
> >>   		return PTR_ERR(state);
> >>   
> >> @@ -1013,7 +1022,7 @@ int v4l2_subdev_alloc_state(struct v4l2_subdev *sd)
> >>   
> >>   	return 0;
> >>   }
> >> -EXPORT_SYMBOL_GPL(v4l2_subdev_alloc_state);
> >> +EXPORT_SYMBOL_GPL(__v4l2_subdev_alloc_state);
> >>   
> >>   void v4l2_subdev_free_state(struct v4l2_subdev *sd)
> >>   {
> >> @@ -1021,3 +1030,23 @@ void v4l2_subdev_free_state(struct v4l2_subdev *sd)
> >>   	sd->state = NULL;
> >>   }
> >>   EXPORT_SYMBOL_GPL(v4l2_subdev_free_state);
> >> +
> >> +struct v4l2_subdev_state *v4l2_subdev_lock_active_state(struct v4l2_subdev *sd)
> >> +{
> >> +	mutex_lock(&sd->state->lock);
> >> +
> >> +	return sd->state;
> >> +}
> >> +EXPORT_SYMBOL_GPL(v4l2_subdev_lock_active_state);
> >> +
> >> +void v4l2_subdev_lock_state(struct v4l2_subdev_state *state)
> >> +{
> >> +	mutex_lock(&state->lock);
> >> +}
> >> +EXPORT_SYMBOL_GPL(v4l2_subdev_lock_state);
> >> +
> >> +void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state)
> >> +{
> >> +	mutex_unlock(&state->lock);
> >> +}
> >> +EXPORT_SYMBOL_GPL(v4l2_subdev_unlock_state);
> >> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> >> index 5ec78ffda4f5..52a725281b23 100644
> >> --- a/include/media/v4l2-subdev.h
> >> +++ b/include/media/v4l2-subdev.h
> >> @@ -655,6 +655,7 @@ struct v4l2_subdev_pad_config {
> >>   /**
> >>    * struct v4l2_subdev_state - Used for storing subdev state information.
> >>    *
> >> + * @lock: mutex for the state
> >>    * @which: state type (from enum v4l2_subdev_format_whence)
> >>    * @pads: &struct v4l2_subdev_pad_config array
> >>    *
> >> @@ -663,6 +664,7 @@ struct v4l2_subdev_pad_config {
> >>    * %V4L2_SUBDEV_FORMAT_ACTIVE it is safe to pass %NULL.
> >>    */
> >>   struct v4l2_subdev_state {
> >> +	struct mutex lock;
> >>   	u32 which;
> >>   	struct v4l2_subdev_pad_config *pads;
> >>   };
> >> @@ -1147,9 +1149,18 @@ int v4l2_subdev_link_validate(struct media_link *link);
> >>    *
> >>    * Must call v4l2_free_subdev_state() when state is no longer needed.
> >>    */
> >> +#define v4l2_alloc_subdev_state(sd, which)                                     \
> >> +	({                                                                     \
> >> +		static struct lock_class_key __key;                            \
> >> +		const char *name = KBUILD_BASENAME                             \
> >> +			":" __stringify(__LINE__) ":sd->state->lock";          \
> >> +		__v4l2_alloc_subdev_state(sd, which, name, &__key);            \
> >> +	})
> >> +
> >>   struct v4l2_subdev_state *
> >> -v4l2_alloc_subdev_state(struct v4l2_subdev *sd,
> >> -			enum v4l2_subdev_format_whence which);
> >> +__v4l2_alloc_subdev_state(struct v4l2_subdev *sd,
> >> +			  enum v4l2_subdev_format_whence which,
> >> +			  const char *lock_name, struct lock_class_key *key);
> >>   
> >>   /**
> >>    * v4l2_free_subdev_state - free a v4l2_subdev_state
> >> @@ -1234,7 +1245,16 @@ void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
> >>    *
> >>    * Must call v4l2_subdev_free_state() when the state is no longer needed.
> >>    */
> >> -int v4l2_subdev_alloc_state(struct v4l2_subdev *sd);
> >> +#define v4l2_subdev_alloc_state(sd)                                            \
> >> +	({                                                                     \
> >> +		static struct lock_class_key __key;                            \
> >> +		const char *name = KBUILD_BASENAME                             \
> >> +			":" __stringify(__LINE__) ":sd->state->lock";          \
> >> +		__v4l2_subdev_alloc_state(sd, name, &__key);                   \
> >> +	})
> >> +
> >> +int __v4l2_subdev_alloc_state(struct v4l2_subdev *sd, const char *name,
> >> +			      struct lock_class_key *key);
> >>   
> >>   /**
> >>    * v4l2_subdev_free_state() - Free the active subdev state for subdevice
> >> @@ -1258,4 +1278,33 @@ v4l2_subdev_get_active_state(struct v4l2_subdev *sd)
> >>   	return sd->state;
> >>   }
> >>   
> >> +/**
> >> + * v4l2_subdev_lock_active_state() - Lock and return the active subdev state for subdevice
> >> + * @sd: The subdevice
> >> + *
> >> + * Return the locked active state for the subdevice, or NULL if the subdev
> >> + * does not support active state.
> >> + *
> >> + * Must be unlocked with v4l2_subdev_unlock_state() after use.
> >> + */
> >> +struct v4l2_subdev_state *v4l2_subdev_lock_active_state(struct v4l2_subdev *sd);
> >> +
> >> +/**
> >> + * v4l2_subdev_lock_state() - Lock the subdev state
> >> + * @state: The subdevice state
> >> + *
> >> + * Lock the given subdev state.
> >> + *
> >> + * Must be unlocked with v4l2_subdev_unlock_state() after use.
> >> + */
> >> +void v4l2_subdev_lock_state(struct v4l2_subdev_state *state);
> > 
> > This seems to be used only to lock the state passed to the subdev
> > operation by the caller. Could the caller lock the state instead ? This
> > could possibly be done by wrapping the v4l2_subdev_call() calls in
> > dedicated helper functions.
> 
> Maybe, but it's easy to get into problems that way. One of the problems 
> is that subdev drivers already have locks for other things (say, 
> xyz-lock), and the locking order between state-lock and xyz-lock has to 
> be kept the same. And as we have subdev ops that don't get a state 
> (mainly s_stream), those have to do the locking themselves, and also 
> keep the order the same.

I thought about it previously, and wondered at what point we'll have to
introduce ww-mutex :-) Hopefully later, much later. I'm fine keeping the
lock in the drivers if it can help.

> I was hitting lockdep issues constantly when the v4l2-core was taking 
> the lock before calling the ops. I did sort some of those out, but 
> sorting some of those out cleanly wasn't trivial, and it felt like 
> swimming against the current. So I instead decided to go this way.
> 
> It might also introduce deadlocks in drivers. I don't have a real 
> example, but I'm not sure if it's too far fetched to imagine a case with 
> two subdev drivers, part of a single driver module, where, say, subdev A 
> gets a set_fmt call, it then calls set_fmt in subdev B, and B calls 
> get_fmt in subdev A. Yes, it's a contrived example, but are you sure 
> things like that are not done? =)

The best way to avoid this is to avoid subdev drivers calling each other
for anything else than .s_stream() and getting controls.

> I'm sure this can be sorted out, but I have a gut feeling it won't be easy.

-- 
Regards,

Laurent Pinchart
