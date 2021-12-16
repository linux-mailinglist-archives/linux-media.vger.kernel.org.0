Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE80447742D
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 15:14:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232560AbhLPOO5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 09:14:57 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38164 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234543AbhLPOO4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 09:14:56 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B4BB33F6;
        Thu, 16 Dec 2021 15:14:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639664094;
        bh=CzqssA0HWvGX+9Nab3Um6gkFsGfMX+l+LmZETCMJ0Sk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f7x4msgYp/Qf6dXEbHvaxB43gRLBr8hQWXF2g442mA5IcaV2y/4GOSWPtIT1EkyKA
         PN6SJL6S30Kx8NDvXk0alRSDmWr/tKjz2yd6LXeqTCyEdCpCz91R5PN77yEb7RTCnJ
         qExP12yiVrvzVuUcUMaoByBhs1+n7gtJfItdUwqE=
Date:   Thu, 16 Dec 2021 16:14:52 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v10 02/38] media: subdev: add active state to struct
 v4l2_subdev
Message-ID: <YbtJ3O4JXr1WahH+@pendragon.ideasonboard.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
 <20211130141536.891878-3-tomi.valkeinen@ideasonboard.com>
 <20211213213033.sr3isjmxvyl47qgl@uno.localdomain>
 <89881e00-e632-2aea-0db4-1dc50195254a@ideasonboard.com>
 <20211215093843.phwp5srphkbooeq2@uno.localdomain>
 <b10e92f4-75a3-4cc4-8e37-fbdd249a0d17@ideasonboard.com>
 <20211215162512.k6snhw2dg4dn5jft@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211215162512.k6snhw2dg4dn5jft@uno.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Wed, Dec 15, 2021 at 05:25:12PM +0100, Jacopo Mondi wrote:
> On Wed, Dec 15, 2021 at 05:35:53PM +0200, Tomi Valkeinen wrote:
> > On 15/12/2021 11:38, Jacopo Mondi wrote:
> > > On Wed, Dec 15, 2021 at 10:06:16AM +0200, Tomi Valkeinen wrote:
> > > > On 13/12/2021 23:30, Jacopo Mondi wrote:
> > > > > On Tue, Nov 30, 2021 at 04:15:00PM +0200, Tomi Valkeinen wrote:
> > > > > > Add a new 'active_state' field to struct v4l2_subdev to which we can
> > > > > > store the active state of a subdev. This will place the subdev
> > > > > > configuration into a known place, allowing us to use the state directly
> > > > > > from the v4l2 framework, thus simplifying the drivers.
> > > > > >
> > > > > > Also add functions v4l2_subdev_init_finalize() and
> > > > > > v4l2_subdev_cleanup(), which will allocate and free the active state.
> > > > > > The functions are named in a generic way so that they can be also used
> > > > > > for other subdev initialization work.
> > > > > >
> > > > > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > > > > ---
> > > > > >    drivers/media/v4l2-core/v4l2-subdev.c | 21 +++++++++++
> > > > > >    include/media/v4l2-subdev.h           | 54 +++++++++++++++++++++++++++
> > > > > >    2 files changed, 75 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > > > index fe49c86a9b02..de160140d63b 100644
> > > > > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > > > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > > > @@ -943,3 +943,24 @@ void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
> > > > > >    	v4l2_subdev_notify(sd, V4L2_DEVICE_NOTIFY_EVENT, (void *)ev);
> > > > > >    }
> > > > > >    EXPORT_SYMBOL_GPL(v4l2_subdev_notify_event);
> > > > > > +
> > > > > > +int v4l2_subdev_init_finalize(struct v4l2_subdev *sd)
> > > > > > +{
> > > > > > +	struct v4l2_subdev_state *state;
> > > > > > +
> > > > > > +	state = __v4l2_subdev_state_alloc(sd);
> > > > > > +	if (IS_ERR(state))
> > > > > > +		return PTR_ERR(state);
> > > > > > +
> > > > > > +	sd->active_state = state;
> > > > >
> > > > > You could spare the local var..
> > > >
> > > > I don't like to write error values to storage fields. Here I only touch the
> > > > field when succesfull.
> > > >
> > > > > > +
> > > > > > +	return 0;
> > > > > > +}
> > > > > > +EXPORT_SYMBOL_GPL(v4l2_subdev_init_finalize);
> > > > > > +
> > > > > > +void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
> > > > > > +{
> > > > > > +	__v4l2_subdev_state_free(sd->active_state);
> > > > > > +	sd->active_state = NULL;
> > > > > > +}
> > > > > > +EXPORT_SYMBOL_GPL(v4l2_subdev_cleanup);
> > > > > > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > > > > > index e52bf508c75b..87c3126b2754 100644
> > > > > > --- a/include/media/v4l2-subdev.h
> > > > > > +++ b/include/media/v4l2-subdev.h
> > > > > > @@ -645,6 +645,9 @@ struct v4l2_subdev_ir_ops {
> > > > > >     * This structure only needs to be passed to the pad op if the 'which' field
> > > > > >     * of the main argument is set to %V4L2_SUBDEV_FORMAT_TRY. For
> > > > > >     * %V4L2_SUBDEV_FORMAT_ACTIVE it is safe to pass %NULL.
> > > > > > + *
> > > > > > + * Note: This struct is also used in active state, and the try_ prefix is
> > > > > > + * historical and to be removed.
> > > > > >     */
> > > > > >    struct v4l2_subdev_pad_config {
> > > > > >    	struct v4l2_mbus_framefmt try_fmt;
> > > > > > @@ -898,6 +901,8 @@ struct v4l2_subdev_platform_data {
> > > > > >     * @subdev_notifier: A sub-device notifier implicitly registered for the sub-
> > > > > >     *		     device using v4l2_async_register_subdev_sensor().
> > > > > >     * @pdata: common part of subdevice platform data
> > > > > > + * @active_state: active state for the subdev (NULL for subdevs tracking the
> > > > > > + *                state internally)
> > > > >
> > > > > I would suggest here that init_finalize() should be used
> > > > >
> > > > >    * @active_state: subdev active state. Initialized by calling
> > > > >                     v4l2_subdev_init_finalize() by drivers that support
> > > > >                     state
> > > >
> > > > Ok.
> > > >
> > > > > I would have said "the state API" but then we would need to define
> > > > > what the state API as a concept :)
> > > > >
> > > > > >     *
> > > > > >     * Each instance of a subdev driver should create this struct, either
> > > > > >     * stand-alone or embedded in a larger struct.
> > > > > > @@ -929,6 +934,19 @@ struct v4l2_subdev {
> > > > > >    	struct v4l2_async_notifier *notifier;
> > > > > >    	struct v4l2_async_notifier *subdev_notifier;
> > > > > >    	struct v4l2_subdev_platform_data *pdata;
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * The fields below are private, and should only be accessed via
> > > > > > +	 * appropriate functions.
> > > > > > +	 */
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * TODO: state should most likely be changed from a pointer to an
> > > > > > +	 * embedded field. For the time being it's kept as a pointer to more
> > > > > > +	 * easily catch uses of state in the cases where the driver doesn't
> > > > > > +	 * support it.
> > > > >
> > > > > what about "... For the time being it's kept as a pointer to allow drivers
> > > > > to support state as an opt-in feature."
> > > >
> > > > Well, that's not quite correct. Even if it was an embedded field, it would
> > > > be an opt-in feature. The point with the pointer is only that if an opt-out
> > > > driver accidentally tries to access the field, it'll get NULL, and hopefully
> > > > fail.
> > >
> > > Ok, what I mean is that being a pointer, it's easy to identify if a
> > > driver has opted-in. Whatever, we're saying the same thing
> > >
> > > > > > +	 */
> > > > > > +	struct v4l2_subdev_state *active_state;
> > > > > >    };
> > > > > >
> > > > > >
> > > > > > @@ -1217,4 +1235,40 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
> > > > > >    void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
> > > > > >    			      const struct v4l2_event *ev);
> > > > > >
> > > > > > +/**
> > > > > > + * v4l2_subdev_init_finalize() - Finalize the initialization of the subdevice
> > > > > > + * @sd: The subdev
> > > > > > + *
> > > > > > + * This finalizes the initialization of the subdev, including allocation of
> > > > > > + * the active state for the subdev.
> > > > > > + *
> > > > > > + * This must be called by the subdev drivers that use the centralized active
> > > > > > + * state, after the subdev struct has been initialized and
> > > > > > + * media_entity_pads_init() has been called.
> > > > >
> > > > > Or just "It must be called by subdev drivers that support active state
> > > > > as the last operation before registering the subdev."
> > > >
> > > > That's not quite true either. The driver may do setup operations requiring
> > > > the active state before registering the subdev.
> > >
> > > Are there other setup operations on the subdev besides the usual
> > > v4l2_.._subdev_init(), media_pads_init() etc that have to be called
> > > after a function that by its name 'finalizes' the initialization ?
> > > Anyway, just a nit, whatever is fine
> >
> > I was only thinking about the finalization of the state. But as it's now
> > "init finalize", I think it makes sense that it would be just before subdev
> > registration. But I'm actually setting up the notifiers between the
> > v4l2_subdev_init_finalize and v4l2_async_register_subdev... I need to see if
> > there's any reason for that, or can the v4l2_subdev_init_finalize be moved
> > to be just before subdev registration.
> 
> I see, of course there might be other operations going on between
> init_finalize() and subdev_register(), what I meant was to only
> discuss about helper function provided by the core, not driver
> specific functions. Intrpreted this way I understand why my suggestion
> is confusing, feel free to ignore it!
> 
> > > > > > + *
> > > > > > + * Must call v4l2_subdev_cleanup() when the subdev is being removed.
> > > > > > + */
> > > > > > +int v4l2_subdev_init_finalize(struct v4l2_subdev *sd);
> > > > > > +
> > > > > > +/**
> > > > > > + * v4l2_subdev_cleanup() - Release the resources needed by the subdevice
> > > > > > + * @sd: The subdevice
> > > > > > + *
> > > > > > + * This will release the resources allocated in v4l2_subdev_init_finalize.
> > > > > > + */
> > > > > > +void v4l2_subdev_cleanup(struct v4l2_subdev *sd);
> > > > > > +
> > > > > > +/**
> > > > > > + * v4l2_subdev_get_active_state() - Return the active subdev state for subdevice
> > > > > > + * @sd: The subdevice
> > > > > > + *
> > > > > > + * Return the active state for the subdevice, or NULL if the subdev does not
> > > > >
> > > > > nit:
> > > > > The other functions in the file are documented with "Returns" (and
> > > > > also "This function" seems to be more commonly used that just "This").

kerneldoc actually documents usage of "Return:", but seems to support
other syntaxes as well. That's something that should be fixed through
the file first if needed, for now let's just be consistent.

> > > > Ok, I'll try to get these consistent.
> > > >
> > > > > > + * support active state.
> > > > > > + */
> > > > > > +static inline struct v4l2_subdev_state *
> > > > > > +v4l2_subdev_get_active_state(struct v4l2_subdev *sd)
> > > > > > +{
> > > > > > +	return sd->active_state;
> > > > > > +}
> > > > > > +
> > > > >
> > > > > This is only used by the core, and by top drivers when doing:
> > > > >
> > > > >         ret = v4l2_subdev_call(sd, pad, enum_frame_size,
> > > > >                                v4l2_subdev_get_active_state(sd), &fse);
> > > > >
> > > > > To pass to the subdev its own state.
> > > > >
> > > > > I wonder if a macro like
> > > > >
> > > > > #define v4l2_subdev_call_state(sd, o, f, args)					\
> > > > > 	({									\
> > > > > 	 struct v4l2_subdev_state *st = v4l2_subdev_get_active_state(sd);	\
> > > > > 	 v4l2_subdev_call(sd, o, f, st, args);					\
> > > > > 	 })
> > > > >
> > > > > Could help simplify the state API.
> > > >
> > > > Possibly, but we need to support the TRY case also. So I would call it
> > > > something more specific, v4l2_subdev_call_active(), or such.
> > >
> > > If the caller intends to pass is a try state (which it has to allocate
> > > explicitly) shouldn't it just use v4l2_subdev_call() ?
> >
> > Yes. But I think this is pretty confusing already, and in my opinion adding
> > v4l2_subdev_call_state() would confuse this even more =). I think at least
> > it has to make it clear that the subdev is being called using its active
> > state.
> >
> > But maybe just using v4l2_subdev_call() for now and seeing how this evolves
> > is best. It's trivial to add the helper later.

As mentioned separately, I think we should have wrappers for individual
operations. We'll see about that later.

> Make sense
> 
> > > > > Please be patient if I digress a bit more on the API now..
> > > > >
> > > > > Looking forward in the series we'll end up having 5 functions to
> > > > > manage state, if I've not missed any
> > > > >
> > > > > 1) struct v4l2_subdev_state *v4l2_subdev_get_active_state(struct v4l2_subdev *sd);
> > > > >
> > > > > 2) struct v4l2_subdev_state *v4l2_subdev_lock_active_state(struct v4l2_subdev *sd);
> > > > >
> > > > > 3) void v4l2_subdev_lock_state(struct v4l2_subdev_state *state);
> > > > >
> > > > > 4) void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state);
> > > > >
> > > > > 5) struct v4l2_subdev_state *v4l2_subdev_lock_and_return_state(struct v4l2_subdev *sd,
> > > > > 				                               struct v4l2_subdev_state *state)
> > > > >
> > > > > 1) and 2) are helpers to get (locked/unlocked) v4l2_subdevice.state,
> > > > > used in operations which implicitly operates on the active state
> > > > > (s_stream etc)
> > > > >
> > > > > I wonder if we shouldn't just have a locked v4l2_subdev_get_state()
> > > > > and an optional unlocked version which can be used by the core in
> > > > > place of v4l2_subdev_get_active_state() and by drivers which know what
> > > > > they're doing by using the unlocked version
> > > >
> > > > I think we need to always make it clear if we're dealing with the active or
> > > > try state (when it's relevant). And I also want to be clear if a lock is
> > > > taken. v4l2_subdev_get_state() would hide both of those.
> > >
> > > It is clear you're dealing with active state if the only argument is
> > > a struct v4l2_subdevice *.
> >
> > Perhaps, if you understand the internals here. I'd rather be more explicit
> > and clear in the function names. Again, we can easily change these later if
> > they don't feel necessary.
> >
> > > If you do not receive a state as an operation parameter you can only
> > > get the one is the subdev, which is by definition the active one.
> > >
> > > When it comes to locked, if the usage pattern is that the state is to
> > > be locked before being accessed, and the unlocked case is the
> > > exception (as it is only used by the core and by the top drivers) then
> > > I don't feel so strongly as you about having _locked() in the name.
> >
> > My reasoning here is that we can have function pairs like get_xxx, put_xxx,
> > and then it's clear that those match and they need to be paired.
> 
> Like:
> 
> v4l2_subdev_lock_state(state)
> v4l2_subdev_unlock_state(state)
> 
> > But if we have just a get_xxx, at least my thinking is that it just returns
> > something, and I'll use it and forget about it when I don't need it anymore.
> >
> > But lock_xxx makes it clear I have to unlock it afterwards.
> 
> so it gets
> 
> state = v4l2_subdev_lock_active_state(sd)
> v4l2_subdev_unlock_state(state)
> 
> > That said, maybe instead of v4l2_subdev_lock_active_state we should have
> > v4l2_subdev_lock_and_get_active_state. But it gets a bit long...
> 
> No no please :)
> 
> You bought me with:
> v4l2_subdev_lock_active_state() + v4l2_subdev_unlock_state()
> 
> > > Anyway, your code, your names..
> > >
> > > > > 3) and 4) lock the state at hand (to be used in operations with a
> > > > > 'state' parameter)
> > > > >
> > > > > 5) is currently unused and it still feels a bit ill-defined. If the state
> > > > > passed in as parameter is NULL then deflect it to sd->state, so I
> > > > > guess it assumes that the user is a state-aware subdev driver which
> > > > > needs to protect against in-kernel callers that do no pass in a valid state to
> > > >
> > > > Correct.
> > > >
> > > > > the operation call. This implies that if the caller passes in a NULL
> > > > > state for the TRY format, this gets deflected to the subdev's active
> > > > > state, something which should not happen, right ? I would be tempted
> > > >
> > > > Yes. That's an illegal call, isn't it? Or does it happen and we need to
> > > > protect against it?
> > > >
> > > > > to just fail loud if !state and assume if you're moving your subdev to
> > > > > use state you should be able to fix the caller as well.
> > > >
> > > > That would be nice, but I think it's not realistic. If you convert a sensor
> > > > driver to multiplexed streams, are you going to fix (convert to multiplexed
> > > > streams) all the bridges and SoC drivers that may use that sensor? How do
> > > > you even find all those bridges and SoCs...
> > >
> > > Of course no. You fix the one you're using. You're converting a sensor
> > > driver, you can fix the top driver too. Other users of the sensor
> > > driver will probably scream when moving to the next driver release
> > > that has been made state aware, so they'll hopefully fix their top driver
> > > too. After all, this applies equally to downstrems as well and
> >
> > Well, I'm not a maintainer in linux-media, but I would nack that approach
> > =). We can't just go breaking other platforms, and hoping other devs will
> > fix them.

I'd love to agree with Jacopo here and break things all the time to get
other people to fix them, but I doubt that I'd make many friends while
doing so :-)

This being said, the more we can push for conversions to happen quickly,
the better. For instance, new sensor drivers should rely on the active
state being passed to all subdev operations, so that any existing host
driver that wants to use them will need to be converted.
v4l2_subdev_lock_and_return_state() in subdev drivers should only be
used as a transition tool.

Similarly, a way to enforce that new host drivers only work with sensor
drivers that have been converted would be good.

We should aim for the removal of v4l2_subdev_lock_and_return_state(). A
WARN_ON() there will be useful at some point, but it's of course too
early. A bit of yak shaving may also help, by asking maintainers and
contributors to sensor and host drivers to migrate to the new API.

> > > providing an helper to work around issues is not the best idea in my
> > > opinion. Also the helper should be used in the subdev driver in place
> > > of the regular v4l2_subdev_lock_state() to protect just in case
> > > against legacy callers. When will they be moved to use the regular
> > > v4l2_subdev_lock_state() ?
> >
> > Note that this is needed only when porting an existing and presumably in-use
> > subdev driver. You don't need this if you write a new driver.
> >
> > The users of v4l2_subdev_lock_and_return_state are easy to find and easy to
> > change to v4l2_subdev_lock_state when we decide a particular driver doesn't
> > need to support legacy subdevs.
> 
> I'm just concerned that as long as we offer an helper to work this
> around (and the helper might introduce subtle issues like mixing
> try/active context) once we
> s/v4l2_subdev_lock_and_return_state/v4l2_subdev_lock_state we'll be
> anyway breaking users.
> 
> > I don't like this at all but, afaics, we can't break the existing platforms.
> > This function is a very simple work-around for the time being, and easy to
> > drop later.
> >
> > > Once a subdev driver has been moved to be state aware callers that
> > > passes in a NULL state should be fixed. As we can't fix them all,
> > > screaming loud and clearly say what has to be done to move forward is
> > > in my opinion better than introducing a temporary function that
> > > replaces the regular API and that subdev should decide to use just in
> > > case (and which can lead to subtle errors like using the active state
> > > in a TRY context).
> > >
> > > If you want to protect against broken callers then what about
> > > doing the "state = state ? : sd->active_state;" dance in
> > > v4l2_subdev_lock_state() with a WARN_ONCE(!state) so that
> > > subdev drivers can use the regular API from day 0 ?
> >
> > Hmm, I think that is an option. I didn't implement "state = state ? :
> > sd->active_state;" in the v4l2_subdev_lock_state() as I didn't want
> > v4l2_subdev_lock_state() to hide an invalid NULL parameter. But adding
> > WARN_ONCE() would warn about it.

As we can't WARN() unconditionally yet when encountering a driver that
hasn't been converted, we need to keep v4l2_subdev_lock_and_return_state()
as an alternative that won't WARN. Do I understand that adding
"state = state ? : sd->active_state;" + WARN_ON in
v4l2_subdev_lock_state() would then be used only to catch invalid
combinations with a warning instead of a crash ? What would it help with
?

> > I'm still undecided, though. The WARN_ONCE would come only once for the
> > whole kernel, per boot, wouldn't it? We could have a macro for
> > v4l2_subdev_lock_state, but then we'd get lots of warnings. And a full WARN
> > just because a driver hasn't been updated is a bit harsh. Maybe we can start
> > with just a normal warning print.
> 
> There is a precendet I can think of: async matching on device or
> endpoints. Initially all async subdevs where matched on the remote end
> device node. For more complex setups this didn't scale, as the same
> remote can have multiple endpoints, and matching on the device node
> would have created false positives. So v4l2-async was moved to match on
> endpoints with some legacy compatibility code
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/v4l2-core/v4l2-async.c#n69
> 
> 	if (dev && dev->driver) {
> 		if (sd_fwnode_is_ep)
> 			dev_warn(dev, "Driver %s uses device fwnode, incorrect match may occur\n",
> 				 dev->driver->name);
> 		dev_notice(dev, "Consider updating driver %s to match on endpoints\n",
> 			   dev->driver->name);
> 	}
> 
> Can't we have something like this in v4l2_subdev_lock_state() ?

I think we need to start by being silent first, then move to dev_warn(),
then to WARN(), and finally drop the option. This can be done with
v4l2_subdev_lock_and_return_state() I believe, which would be used by
driver that have been converted but still need to support legacy
combinations. Drivers that don't want to support legacy combinations
would use v4l2_subdev_lock_state(). Usage of
v4l2_subdev_lock_and_return_state() in a driver would indicate more work
is needed, and would be a useful indication of how far we are in our
conversion effort.

-- 
Regards,

Laurent Pinchart
