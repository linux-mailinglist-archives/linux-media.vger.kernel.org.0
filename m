Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF9B347554B
	for <lists+linux-media@lfdr.de>; Wed, 15 Dec 2021 10:37:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231682AbhLOJhy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Dec 2021 04:37:54 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:51149 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236390AbhLOJhy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Dec 2021 04:37:54 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 9F9151BF4C9;
        Wed, 15 Dec 2021 09:37:49 +0000 (UTC)
Date:   Wed, 15 Dec 2021 10:38:43 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v10 02/38] media: subdev: add active state to struct
 v4l2_subdev
Message-ID: <20211215093843.phwp5srphkbooeq2@uno.localdomain>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
 <20211130141536.891878-3-tomi.valkeinen@ideasonboard.com>
 <20211213213033.sr3isjmxvyl47qgl@uno.localdomain>
 <89881e00-e632-2aea-0db4-1dc50195254a@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <89881e00-e632-2aea-0db4-1dc50195254a@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi

On Wed, Dec 15, 2021 at 10:06:16AM +0200, Tomi Valkeinen wrote:
> Hi,
>
> On 13/12/2021 23:30, Jacopo Mondi wrote:
> > Hi Tomi,
> >
> > On Tue, Nov 30, 2021 at 04:15:00PM +0200, Tomi Valkeinen wrote:
> > > Add a new 'active_state' field to struct v4l2_subdev to which we can
> > > store the active state of a subdev. This will place the subdev
> > > configuration into a known place, allowing us to use the state directly
> > > from the v4l2 framework, thus simplifying the drivers.
> > >
> > > Also add functions v4l2_subdev_init_finalize() and
> > > v4l2_subdev_cleanup(), which will allocate and free the active state.
> > > The functions are named in a generic way so that they can be also used
> > > for other subdev initialization work.
> > >
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > ---
> > >   drivers/media/v4l2-core/v4l2-subdev.c | 21 +++++++++++
> > >   include/media/v4l2-subdev.h           | 54 +++++++++++++++++++++++++++
> > >   2 files changed, 75 insertions(+)
> > >
> > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > index fe49c86a9b02..de160140d63b 100644
> > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > @@ -943,3 +943,24 @@ void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
> > >   	v4l2_subdev_notify(sd, V4L2_DEVICE_NOTIFY_EVENT, (void *)ev);
> > >   }
> > >   EXPORT_SYMBOL_GPL(v4l2_subdev_notify_event);
> > > +
> > > +int v4l2_subdev_init_finalize(struct v4l2_subdev *sd)
> > > +{
> > > +	struct v4l2_subdev_state *state;
> > > +
> > > +	state = __v4l2_subdev_state_alloc(sd);
> > > +	if (IS_ERR(state))
> > > +		return PTR_ERR(state);
> > > +
> > > +	sd->active_state = state;
> >
> > You could spare the local var..
>
> I don't like to write error values to storage fields. Here I only touch the
> field when succesfull.
>
> > > +
> > > +	return 0;
> > > +}
> > > +EXPORT_SYMBOL_GPL(v4l2_subdev_init_finalize);
> > > +
> > > +void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
> > > +{
> > > +	__v4l2_subdev_state_free(sd->active_state);
> > > +	sd->active_state = NULL;
> > > +}
> > > +EXPORT_SYMBOL_GPL(v4l2_subdev_cleanup);
> > > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > > index e52bf508c75b..87c3126b2754 100644
> > > --- a/include/media/v4l2-subdev.h
> > > +++ b/include/media/v4l2-subdev.h
> > > @@ -645,6 +645,9 @@ struct v4l2_subdev_ir_ops {
> > >    * This structure only needs to be passed to the pad op if the 'which' field
> > >    * of the main argument is set to %V4L2_SUBDEV_FORMAT_TRY. For
> > >    * %V4L2_SUBDEV_FORMAT_ACTIVE it is safe to pass %NULL.
> > > + *
> > > + * Note: This struct is also used in active state, and the try_ prefix is
> > > + * historical and to be removed.
> > >    */
> > >   struct v4l2_subdev_pad_config {
> > >   	struct v4l2_mbus_framefmt try_fmt;
> > > @@ -898,6 +901,8 @@ struct v4l2_subdev_platform_data {
> > >    * @subdev_notifier: A sub-device notifier implicitly registered for the sub-
> > >    *		     device using v4l2_async_register_subdev_sensor().
> > >    * @pdata: common part of subdevice platform data
> > > + * @active_state: active state for the subdev (NULL for subdevs tracking the
> > > + *                state internally)
> >
> > I would suggest here that init_finalize() should be used
> >
> >   * @active_state: subdev active state. Initialized by calling
> >                    v4l2_subdev_init_finalize() by drivers that support
> >                    state
>
> Ok.
>
> > I would have said "the state API" but then we would need to define
> > what the state API as a concept :)
> >
> > >    *
> > >    * Each instance of a subdev driver should create this struct, either
> > >    * stand-alone or embedded in a larger struct.
> > > @@ -929,6 +934,19 @@ struct v4l2_subdev {
> > >   	struct v4l2_async_notifier *notifier;
> > >   	struct v4l2_async_notifier *subdev_notifier;
> > >   	struct v4l2_subdev_platform_data *pdata;
> > > +
> > > +	/*
> > > +	 * The fields below are private, and should only be accessed via
> > > +	 * appropriate functions.
> > > +	 */
> > > +
> > > +	/*
> > > +	 * TODO: state should most likely be changed from a pointer to an
> > > +	 * embedded field. For the time being it's kept as a pointer to more
> > > +	 * easily catch uses of state in the cases where the driver doesn't
> > > +	 * support it.
> >
> > what about "... For the time being it's kept as a pointer to allow drivers
> > to support state as an opt-in feature."
>
> Well, that's not quite correct. Even if it was an embedded field, it would
> be an opt-in feature. The point with the pointer is only that if an opt-out
> driver accidentally tries to access the field, it'll get NULL, and hopefully
> fail.

Ok, what I mean is that being a pointer, it's easy to identify if a
driver has opted-in. Whatever, we're saying the same thing

>
> > > +	 */
> > > +	struct v4l2_subdev_state *active_state;
> > >   };
> > >
> > >
> > > @@ -1217,4 +1235,40 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
> > >   void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
> > >   			      const struct v4l2_event *ev);
> > >
> > > +/**
> > > + * v4l2_subdev_init_finalize() - Finalize the initialization of the subdevice
> > > + * @sd: The subdev
> > > + *
> > > + * This finalizes the initialization of the subdev, including allocation of
> > > + * the active state for the subdev.
> > > + *
> > > + * This must be called by the subdev drivers that use the centralized active
> > > + * state, after the subdev struct has been initialized and
> > > + * media_entity_pads_init() has been called.
> >
> > Or just "It must be called by subdev drivers that support active state
> > as the last operation before registering the subdev."
>
> That's not quite true either. The driver may do setup operations requiring
> the active state before registering the subdev.

Are there other setup operations on the subdev besides the usual
v4l2_.._subdev_init(), media_pads_init() etc that have to be called
after a function that by its name 'finalizes' the initialization ?
Anyway, just a nit, whatever is fine

> > > + *
> > > + * Must call v4l2_subdev_cleanup() when the subdev is being removed.
> > > + */
> > > +int v4l2_subdev_init_finalize(struct v4l2_subdev *sd);
> > > +
> > > +/**
> > > + * v4l2_subdev_cleanup() - Release the resources needed by the subdevice
> > > + * @sd: The subdevice
> > > + *
> > > + * This will release the resources allocated in v4l2_subdev_init_finalize.
> > > + */
> > > +void v4l2_subdev_cleanup(struct v4l2_subdev *sd);
> > > +
> > > +/**
> > > + * v4l2_subdev_get_active_state() - Return the active subdev state for subdevice
> > > + * @sd: The subdevice
> > > + *
> > > + * Return the active state for the subdevice, or NULL if the subdev does not
> >
> > nit:
> > The other functions in the file are documented with "Returns" (and
> > also "This function" seems to be more commonly used that just "This").
>
> Ok, I'll try to get these consistent.
>
> > > + * support active state.
> > > + */
> > > +static inline struct v4l2_subdev_state *
> > > +v4l2_subdev_get_active_state(struct v4l2_subdev *sd)
> > > +{
> > > +	return sd->active_state;
> > > +}
> > > +
> >
> > This is only used by the core, and by top drivers when doing:
> >
> >        ret = v4l2_subdev_call(sd, pad, enum_frame_size,
> >                               v4l2_subdev_get_active_state(sd), &fse);
> >
> > To pass to the subdev its own state.
> >
> > I wonder if a macro like
> >
> > #define v4l2_subdev_call_state(sd, o, f, args)					\
> > 	({									\
> > 	 struct v4l2_subdev_state *st = v4l2_subdev_get_active_state(sd);	\
> > 	 v4l2_subdev_call(sd, o, f, st, args);					\
> > 	 })
> >
> > Could help simplify the state API.
>
> Possibly, but we need to support the TRY case also. So I would call it
> something more specific, v4l2_subdev_call_active(), or such.
>

If the caller intends to pass is a try state (which it has to allocate
explicitly) shouldn't it just use v4l2_subdev_call() ?

> > Please be patient if I digress a bit more on the API now..
> >
> > Looking forward in the series we'll end up having 5 functions to
> > manage state, if I've not missed any
> >
> > 1) struct v4l2_subdev_state *v4l2_subdev_get_active_state(struct v4l2_subdev *sd);
> >
> > 2) struct v4l2_subdev_state *v4l2_subdev_lock_active_state(struct v4l2_subdev *sd);
> >
> > 3) void v4l2_subdev_lock_state(struct v4l2_subdev_state *state);
> >
> > 4) void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state);
> >
> > 5) struct v4l2_subdev_state *v4l2_subdev_lock_and_return_state(struct v4l2_subdev *sd,
> > 				                               struct v4l2_subdev_state *state)
> >
> > 1) and 2) are helpers to get (locked/unlocked) v4l2_subdevice.state,
> > used in operations which implicitly operates on the active state
> > (s_stream etc)
> >
> > I wonder if we shouldn't just have a locked v4l2_subdev_get_state()
> > and an optional unlocked version which can be used by the core in
> > place of v4l2_subdev_get_active_state() and by drivers which know what
> > they're doing by using the unlocked version
>
> I think we need to always make it clear if we're dealing with the active or
> try state (when it's relevant). And I also want to be clear if a lock is
> taken. v4l2_subdev_get_state() would hide both of those.

It is clear you're dealing with active state if the only argument is
a struct v4l2_subdevice *.

If you do not receive a state as an operation parameter you can only
get the one is the subdev, which is by definition the active one.

When it comes to locked, if the usage pattern is that the state is to
be locked before being accessed, and the unlocked case is the
exception (as it is only used by the core and by the top drivers) then
I don't feel so strongly as you about having _locked() in the name.

Anyway, your code, your names..

>
> > 3) and 4) lock the state at hand (to be used in operations with a
> > 'state' parameter)
> >
> > 5) is currently unused and it still feels a bit ill-defined. If the state
> > passed in as parameter is NULL then deflect it to sd->state, so I
> > guess it assumes that the user is a state-aware subdev driver which
> > needs to protect against in-kernel callers that do no pass in a valid state to
>
> Correct.
>
> > the operation call. This implies that if the caller passes in a NULL
> > state for the TRY format, this gets deflected to the subdev's active
> > state, something which should not happen, right ? I would be tempted
>
> Yes. That's an illegal call, isn't it? Or does it happen and we need to
> protect against it?
>
> > to just fail loud if !state and assume if you're moving your subdev to
> > use state you should be able to fix the caller as well.
>
> That would be nice, but I think it's not realistic. If you convert a sensor
> driver to multiplexed streams, are you going to fix (convert to multiplexed
> streams) all the bridges and SoC drivers that may use that sensor? How do
> you even find all those bridges and SoCs...

Of course no. You fix the one you're using. You're converting a sensor
driver, you can fix the top driver too. Other users of the sensor
driver will probably scream when moving to the next driver release
that has been made state aware, so they'll hopefully fix their top driver
too. After all, this applies equally to downstrems as well and
providing an helper to work around issues is not the best idea in my
opinion. Also the helper should be used in the subdev driver in place
of the regular v4l2_subdev_lock_state() to protect just in case
against legacy callers. When will they be moved to use the regular
v4l2_subdev_lock_state() ?

Once a subdev driver has been moved to be state aware callers that
passes in a NULL state should be fixed. As we can't fix them all,
screaming loud and clearly say what has to be done to move forward is
in my opinion better than introducing a temporary function that
replaces the regular API and that subdev should decide to use just in
case (and which can lead to subtle errors like using the active state
in a TRY context).

If you want to protect against broken callers then what about
doing the "state = state ? : sd->active_state;" dance in
v4l2_subdev_lock_state() with a WARN_ONCE(!state) so that
subdev drivers can use the regular API from day 0 ?

>
>  Tomi
