Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65AA5418D66
	for <lists+linux-media@lfdr.de>; Mon, 27 Sep 2021 03:13:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231907AbhI0BOr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 21:14:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230174AbhI0BOq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 21:14:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E6EFC061570
        for <linux-media@vger.kernel.org>; Sun, 26 Sep 2021 18:13:09 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A7BAF49A;
        Mon, 27 Sep 2021 03:13:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632705187;
        bh=vMgQBL/D4cwOWXDTanqUbt+atKlt4vzWoHYhQUnbsNk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OCfWmlXfRT73mjd0YPntZlK2xCRExyBWHWknf+lPoIJjaU9YEUbkc89dnE+KaKzD2
         KMOAOmLnp4FY+7WbPJhWSS7022zpn8v9qalF8p9gSw6zvuNBeOPK4T1TBhyeeRARHo
         4M+ZH0cKTWlappxL1YEBGz8/BpG5OD66qM3G7eyI=
Date:   Mon, 27 Sep 2021 04:13:02 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [PATCH v8 04/36] media: subdev: pass also the active state to
 subdevs from ioctls
Message-ID: <YVEanmkSW1lfZOwd@pendragon.ideasonboard.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
 <20210830110116.488338-5-tomi.valkeinen@ideasonboard.com>
 <20210915101747.edpyp6k4sos7jh66@uno.localdomain>
 <0d8e9c9d-c5f6-c653-7ee3-f94bd417c525@ideasonboard.com>
 <20210916080231.pz5zmpck3qa24awh@uno.localdomain>
 <4427a997-62d5-3adb-ef55-4987ba4c9519@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4427a997-62d5-3adb-ef55-4987ba4c9519@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

(Readding the dropped context to reply to all comments in one go, please
avoid dropping it when there's an ongoing conversation)

On Thu, Sep 16, 2021 at 11:43:17AM +0300, Tomi Valkeinen wrote:
> On Thu, Sep 16, 2021 at 10:02:31AM +0200, Jacopo Mondi wrote:
> > On Thu, Sep 16, 2021 at 09:44:23AM +0300, Tomi Valkeinen wrote:
> > > On 15/09/2021 13:17, Jacopo Mondi wrote:
> > > > On Mon, Aug 30, 2021 at 02:00:44PM +0300, Tomi Valkeinen wrote:
> > > > > At the moment when a subdev op is called, the TRY subdev state
> > > > > (subdev_fh->state) is passed as a parameter even for ACTIVE case, or
> > > > > alternatively a NULL can be passed for ACTIVE case. This used to make
> > > > > sense, as the ACTIVE state was handled internally by the subdev drivers.
> > > > >
> > > > > We now have a state for ACTIVE case in a standard place, and can pass
> > > > > that alto to the drivers. This patch changes the subdev ioctls to either
> > > > > pass the TRY or ACTIVE state to the subdev.
> > > > >
> > > > > Unfortunately many drivers call ops from other subdevs, and implicitly
> > > > > pass NULL as the state, so this is just a partial solution. A coccinelle
> > > > > spatch could perhaps be created which fixes the drivers' subdev calls.
> > > > >
> > > > > For all current upstream drivers this doesn't matter, as they do not
> > > > > expect to get a valid state for ACTIVE case. But future drivers which
> > > > > support multiplexed streaming and routing will depend on getting a state
> > > > > for both active and try cases, and the simplest way to avoid this
> > > > > problem is to introduce a helper function, used by the new drivers,
> > > > > which makes sure the driver has either the TRY or ACTIVE state. This
> > > > > helper will be introduced in a follow-up patch.
> > > > >
> > > > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > > > ---
> > > > >   drivers/media/v4l2-core/v4l2-subdev.c | 73 +++++++++++++++++++++++----
> > > > >   1 file changed, 63 insertions(+), 10 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > > index 04ad319fb150..b3637cddca58 100644
> > > > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > > @@ -353,6 +353,53 @@ const struct v4l2_subdev_ops v4l2_subdev_call_wrappers = {
> > > > >   EXPORT_SYMBOL(v4l2_subdev_call_wrappers);
> > > > >
> > > > >   #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> > > > > +
> > > > > +static struct v4l2_subdev_state *
> > > > > +subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
> > > > > +		       unsigned int cmd, void *arg)
> > > > > +{
> > > > > +	u32 which;
> > > > > +
> > > > > +	switch (cmd) {
> > > > > +	default:
> > > > > +		return NULL;
> > > > > +
> > > > > +	case VIDIOC_SUBDEV_G_FMT:
> > > > > +	case VIDIOC_SUBDEV_S_FMT: {
> > > > > +		which = ((struct v4l2_subdev_format *)arg)->which;
> > > > > +		break;
> > > > > +	}
> > > > > +	case VIDIOC_SUBDEV_G_CROP:
> > > > > +	case VIDIOC_SUBDEV_S_CROP: {
> > > > > +		which = ((struct v4l2_subdev_crop *)arg)->which;
> > > > > +		break;
> > > > > +	}
> > > > > +	case VIDIOC_SUBDEV_ENUM_MBUS_CODE: {
> > > > > +		which = ((struct v4l2_subdev_mbus_code_enum *)arg)->which;
> > > > > +		break;
> > > > > +	}
> > > > > +	case VIDIOC_SUBDEV_ENUM_FRAME_SIZE: {
> > > > > +		which = ((struct v4l2_subdev_frame_size_enum *)arg)->which;
> > > > > +		break;
> > > > > +	}
> > > > > +
> > > > > +	case VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL: {
> > > > > +		which = ((struct v4l2_subdev_frame_interval_enum *)arg)->which;
> > > > > +		break;
> > > > > +	}
> > > > > +
> > > > > +	case VIDIOC_SUBDEV_G_SELECTION:
> > > > > +	case VIDIOC_SUBDEV_S_SELECTION: {
> > > > > +		which = ((struct v4l2_subdev_selection *)arg)->which;
> > > > > +		break;
> > > > > +	}
> > > > > +	}
> > > > > +
> > > > > +	return which == V4L2_SUBDEV_FORMAT_TRY ?
> > > > > +			     subdev_fh->state :
> > > > > +			     v4l2_subdev_get_active_state(sd);
> > > >
> > > > Why this additional indirection layer ?
> > > >
> > > > v4l2_subdev_get_active_state(struct v4l2_subdev *sd)
> > > > {
> > > >      return sd->state;
> > > > }
> > >
> > > I wanted to hide all direct accesses to the state to make it easier to
> > > figure out how and where the state is accessed.

And it's an inline function, so it should be totally fine.

> > > > I understand you want to have the core to fish the 'right' state for
> > > > the drivers, but this then requires to protect against bridge drivers
> > > > calling an op through v4l2_subdev_call() with a NULL state by using
> > > > one more indirection like
> > > >
> > > > 	state = v4l2_subdev_validate_state(sd, state);
> > > >
> > > >          static inline struct v4l2_subdev_state *
> > > >          v4l2_subdev_validate_state(struct v4l2_subdev *sd,
> > > >                                     struct v4l2_subdev_state *state)
> > > >          {
> > > >                  return state ? state : sd->state;
> > > >          }
> > > >
> > > > Which I very much don't like as it implicitly changes what state the
> > > > driver receives to work-around a design flaw (the fact that even if
> > > > the core tries to, there's no gurantee state is valid).
> >>
> >> I don't like it either. My idea was that in the future the subdevs would
> >> always get the correct state. In other words, all the subdev drivers calling
> >> ops in other subdevs would be changed to pass the state correctly. Thus the
> >> v4l2_subdev_validate_state() is a helper for the transition period, which
> >> can easily be dropped when the drivers work correctly.
> > 
> > Most of the drivers that call v4l2_subdev_call() with a NULL state are
> > bridge drivers operating in the ACTIVE use case. Even if we get to a
> > point where we remove all calls passing in a NULL state, what are the
> > bridges expected to provide as a state to the subdev they call
> > operations on ? The subdev's state as well ? something like
> > 
> >          v4l2_subdev_call(sd, pad, set_fmt, sd->state, ...)
> 
> Yes. Although we should hide it, so that when calling ops that support 
> state, the subdev drivers do:
> 
> v4l2_subdev_call_state(sd, pad, set_fmt, ...)
> 
> and v4l2_subdev_call_state macro (maybe needs a better name...) uses 
> sd->state as the second parameter to the op.

Even better, we should have a v4l2_subdev_call_pad_set_fmt(sd, &fmt)
(name to be bikeshedded).

> > With your current dynamicaly allocated state, sd->state could very well
> > be NULL.
> 
> Yes, that sounds logical to me. The subdev drivers don't have active 
> state, and th driver code doesn't use it, so they get NULL.
> 
> > I still think this could be way simpler if we assume that the state
> > received as parameter is the file-handle's one (like it was for
> > pad_configs) and in the active case we let driver use their own
> > sd->state.
> 
> I'm kind of okay-ish with that too.
> 
> It doesn't feel logical to me, and afaik the drivers should not touch 
> the file-handle's state when dealing with active case so passing it is 
> kind of wrong, but I agree that it is how things have been.
> 
> I don't think it's any simpler, though. This change wouldn't affect the 
> old drivers, and the new drivers would just use another helper instead 
> of v4l2_subdev_validate_state. And if we change the v4l2_subdev_call() 
> call as discussed above, the new drivers can drop the 
> v4l2_subdev_validate_state().
> 
> So I would argue that the new approach is (will be) simpler, but it's 
> different than what we have now.

I agree with Tomi here, I think passing the correct state will lead to
the best end-result, even if it complicates the transition.

> >>> If feel like it would be much simpler if:
> >>>
> >>> 1) The core passes in a state which always come from the fh (the
> >>>      try_state) when it do_ioctl()
> >>>
> >>> 2) Drivers use their 'active' states embedded in the subdev or the
> >>>      'try' state passed in as parameter and decide
> >>>      which one to use based on the context. It's a pattern we have
> >>>      everywere already when using the per-fh try formats
> >>>
> >>> 	switch (which) {
> >>> 	case V4L2_SUBDEV_FORMAT_TRY:
> >>> 		return v4l2_subdev_get_try_format(&sd, sd_state, pad);
> >>> 	case V4L2_SUBDEV_FORMAT_ACTIVE:
> >>> 		return &sd->fmt;
> >>> 	default:
> >>> 		return NULL;
> >>> 	}
> >>
> >> This is possible, of course. We could do this if we decide we don't want the
> >> subdev drivers to pass the state properly in the future.
> >>
> >> However, if, in my series, I currently call this in a subdev driver:
> >>
> >> state = v4l2_subdev_validate_state(sd, state);
> >>
> >> With the change you suggest I'd just do (possibly with a helper):
> >>
> >> state = which == V4L2_SUBDEV_FORMAT_TRY ? state : sd->state;
> >>
> >> Is it any better?
> >>
> >>> I liked the idea to have the core pass in a state without the driver
> >>> having to care where it comes from, but it requires too many
> >>> indirections and implicities like the above shown
> >>> v4l2_subdev_validate_state().
> >>>
> >>> One middle-ground could be to have the core pass in the 'correct' state as it
> >>> does in your series, and default it to sd->state if a bridge driver
> >>> calls an op through v4l2_subdev_call() with a NULL state, as the
> >>> format is implicitly ACTIVE in that case.
> >>
> >> If you mean changing all the bridge drivers so that they would give the
> >> state properly, yes, that was my plan (I think I mentioned it in a commit
> >> desc, perhaps). It's not a trivial change, though, as v4l2_subdev_call()
> >> cannot handle this at the moment.
> > 
> > Unfortunately this cannot be done automatically in v4l2_subdev_call(),
> > at least not easily.
> > 
> >> I believe it should be doable with coccinelle. Maybe add a new macro,
> >> v4l2_subdev_call_state() or such, which gives the active state in the second
> >> parameter (looks like all the ops have the state as the second param). Then
> >> use coccinelle to find all the v4l2_subdev_call uses which call ops that get
> >> a state, verify that the current caller uses NULL as the state, and change
> >> v4l2_subdev_call to v4l2_subdev_call_state.
> > 
> > Even if we beautify it, I think bridge drivers passing as parameter to
> > a subdev operation a subdev attribute, like in the above shown
> > 
> >          v4l2_subdev_call(sd, pad, set_fmt, sd->state, ...)
> > 
> > is unecessary and a possible source of confusion, with the subdev
> > driver having to infer where the state comes from and the possibility
> 
> Why do the drivers need to infer where the state comes from? Except for 
> the init_cfg case, but that can be fixed other ways
> 
> > of it being NULL anyway if the bridge operates with a non-state aware
> > subdev which has not allocated a state (which is harmelss now, as they
> > won't be interested in 'state').
> 
> Yes, it can be NULL, but it can be NULL already now, and as you say, 
> it's harmless.
> 
> > It could be made easier if we clearly say drivers "if it's TRY, expect
> > a state, if is ACTIVE use your own one (if you want to)". This seems
> > impossible to get wrong to me for subdev drivers.

It makes it more complex for drivers, compared to using the state they
receive without having to care if it's TRY or ACTIVE. It also opens the
door to abuses, by allowing access to a TRY state even when operating on
the ACTIVE configuration (and the other way around). I really like the
idea of simplifying subdev drivers as much as possible by removing the
need to make decisions there. Look at all the subdevs we have, and the
different ways they implement the same thing for no specific reason (and
of course most of them broken in different more or less subtle ways).

> We can write such a clear statement for this new approach also.
> 
> >>> This ofc requires the state to be embedded (ie it's always there) and
> >>> that state-aware drivers to have properly initialized it, but that's a
> >>> given.
> >>
> >> Why does the state need to be embedded? If the subdev driver is not
> >> state-aware, it does not expect to get a state except for the TRY case.
> >> Passing NULL for those drivers should be fine.
> > 
> > It doesn't -need- to be, I just think it avoids allocation and
> > releasing at run-time and offers a place where to store subdev-wide
> > configurations to all drivers as an opt-in feature.
> 
> They do have that option already, they just need to manually allocate 
> the state. If we embed the state, the subdev drivers need to manually 
> initialize the state. It doesn't really change much, except now we have 
> a clear indication (sd->state != NULL) that the driver is state aware. 

I'd prefer embedding it in the long term, but I like the fact that we
have a clear indication that the driver is state-aware. Maybe we can
record the fact that is should be embedded, to transition once drivers
get converted (it should then be a simple change if all accesses to the
state are done in the core, and even more so if they all go through
helper functions).

> And also, 99% of the drivers don't need the state, which might have some 
> memory use impact.

The impact is small, it's the pad and stream arrays that are bigger.
Let's also not forget that drivers should transition to the new model,
so they will end up needing the state. Still, as stated above, a dynamic
allocation may be the best option to start with.

> And the reason for the subdev drivers having to manually allocate/init 
> the state is that there's no place in core to do that. Maybe the various 
> v4l2_*_register_subdev might do it, but it wasn't clear to me if it 
> would work in practice or not.
> 
> So at the moment you have to call the v4l2_subdev_alloc_state() after 
> media_entity_pads_init() but before registering the subdev (or possibly 
> before registering an async notifier).
> 
> > Of course we pay a little price in the size of the subdev, but it's
> > all in-kernel stuff and going forward the state could very wel just
> > become the standard 'subdev_config'
> > 
> >          struct v4l2_subdev {
> >                  ....
> > 
> >                  struct v4l2_subdev_config {
> >                          struct v4l2_subdev_routing routes;
> >                          struct v4l2_subdev_streams streams;
> >                  } config;
> >          };
> > 
> > But yeah, allocated or embedded is tangential and I defer this call to
> > maintainers which know better than me for sure.
> 
> With the wrapper functions, subdev drivers never touch the sd->state 
> directly, and thus changing it from allocated to embedded in the future 
> should be trivial.
> 
> >>> Nonetheless, this considerations do not defeat the purpose of having a
> >>> 'state', as currently we have
> >>>
> >>> struct v4l2_subdev_state {
> >>>           struct v4l2_subdev_krouting; /* Use for TRY and ACTIVE */
> >>>           struct v4l2_stream_configs; /* Use for ACTIVE */
> >>
> >> stream_configs is used for TRY also.
> >>
> >>>           struct v4l2_pad_configs; /* Used for TRY */
> >>
> >> Probably no point in this, but this _could_ also be used for ACTIVE. We
> >> could have state aware drivers that don't use routing or streams, and use
> >> just a plain old pad_configs array. This would allow moving the ACTIVE
> >> pad_configs from the driver to the core.
> > 
> > That would be nice, but it would be better is stream_configs could be
> > used for pad-only drivers (it's just about assuming stream = 0 for all
> > of them, right ?). But yes, my point is about trying to centralize the
> > subdev configuration in one place. But that's probably for later
> > indeed.
> 
> The stream configs require routing to be set first, as routing defines 
> the number of stream configs. There are probably ways to hide the 
> routing part for simple drivers that don't really need routing but would 
> still want to use stream configs.

Unification would be nice, let's try to think about it.

> > > But, as you suggest, probably a better direction is to try to get rid of
> > > pad_configs instead.
> > >
> > > > };
> > > >
> > > > and v4l2_stream_configs is a super-set of v4l2_pad_configs
> > > >
> > > > If we could get to
> > > >
> > > > struct v4l2_subdev_state {
> > > >          struct v4l2_subdev_krouting; /* Use for TRY and ACTIVE */
> > > >          struct v4l2_stream_configs; /* Use for TRY and ACTIVE */
> > > > };
> > > >
> > > > This could turn out to be pretty neat, as it allows 'new' drivers to
> > > > maintain their current formats and routings in a subdev 'state'
> > > > instead of scattering those information in the driver-wide structure
> > > > as they currently do for formats, crops and whatnot. This can ofc go
> > > > on top.
> > >
> > > Yes, that's the long term plan, but it's a huge change. And when I say plan,
> > > I don't mean I'm planning to change all the current drivers, I'm just saying
> > > my series is designed so that it allows these to be done in the future.

Sounds good to me. As mentioned before, setting the direction is
required, but we don't need to get there in one go.

-- 
Regards,

Laurent Pinchart
