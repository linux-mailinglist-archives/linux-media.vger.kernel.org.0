Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC8D940D43D
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 10:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235005AbhIPIFQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 04:05:16 -0400
Received: from mslow1.mail.gandi.net ([217.70.178.240]:58609 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234988AbhIPIFN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 04:05:13 -0400
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id CB7EFC98F9
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 08:03:13 +0000 (UTC)
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id AF2A7FF81E;
        Thu, 16 Sep 2021 08:01:45 +0000 (UTC)
Date:   Thu, 16 Sep 2021 10:02:31 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [PATCH v8 04/36] media: subdev: pass also the active state to
 subdevs from ioctls
Message-ID: <20210916080231.pz5zmpck3qa24awh@uno.localdomain>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
 <20210830110116.488338-5-tomi.valkeinen@ideasonboard.com>
 <20210915101747.edpyp6k4sos7jh66@uno.localdomain>
 <0d8e9c9d-c5f6-c653-7ee3-f94bd417c525@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0d8e9c9d-c5f6-c653-7ee3-f94bd417c525@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Thu, Sep 16, 2021 at 09:44:23AM +0300, Tomi Valkeinen wrote:
> Hi,
>
> On 15/09/2021 13:17, Jacopo Mondi wrote:
> > Hi Tomi
> >
> > On Mon, Aug 30, 2021 at 02:00:44PM +0300, Tomi Valkeinen wrote:
> > > At the moment when a subdev op is called, the TRY subdev state
> > > (subdev_fh->state) is passed as a parameter even for ACTIVE case, or
> > > alternatively a NULL can be passed for ACTIVE case. This used to make
> > > sense, as the ACTIVE state was handled internally by the subdev drivers.
> > >
> > > We now have a state for ACTIVE case in a standard place, and can pass
> > > that alto to the drivers. This patch changes the subdev ioctls to either
> > > pass the TRY or ACTIVE state to the subdev.
> > >
> > > Unfortunately many drivers call ops from other subdevs, and implicitly
> > > pass NULL as the state, so this is just a partial solution. A coccinelle
> > > spatch could perhaps be created which fixes the drivers' subdev calls.
> > >
> > > For all current upstream drivers this doesn't matter, as they do not
> > > expect to get a valid state for ACTIVE case. But future drivers which
> > > support multiplexed streaming and routing will depend on getting a state
> > > for both active and try cases, and the simplest way to avoid this
> > > problem is to introduce a helper function, used by the new drivers,
> > > which makes sure the driver has either the TRY or ACTIVE state. This
> > > helper will be introduced in a follow-up patch.
> > >
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > ---
> > >   drivers/media/v4l2-core/v4l2-subdev.c | 73 +++++++++++++++++++++++----
> > >   1 file changed, 63 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > index 04ad319fb150..b3637cddca58 100644
> > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > @@ -353,6 +353,53 @@ const struct v4l2_subdev_ops v4l2_subdev_call_wrappers = {
> > >   EXPORT_SYMBOL(v4l2_subdev_call_wrappers);
> > >
> > >   #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> > > +
> > > +static struct v4l2_subdev_state *
> > > +subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
> > > +		       unsigned int cmd, void *arg)
> > > +{
> > > +	u32 which;
> > > +
> > > +	switch (cmd) {
> > > +	default:
> > > +		return NULL;
> > > +
> > > +	case VIDIOC_SUBDEV_G_FMT:
> > > +	case VIDIOC_SUBDEV_S_FMT: {
> > > +		which = ((struct v4l2_subdev_format *)arg)->which;
> > > +		break;
> > > +	}
> > > +	case VIDIOC_SUBDEV_G_CROP:
> > > +	case VIDIOC_SUBDEV_S_CROP: {
> > > +		which = ((struct v4l2_subdev_crop *)arg)->which;
> > > +		break;
> > > +	}
> > > +	case VIDIOC_SUBDEV_ENUM_MBUS_CODE: {
> > > +		which = ((struct v4l2_subdev_mbus_code_enum *)arg)->which;
> > > +		break;
> > > +	}
> > > +	case VIDIOC_SUBDEV_ENUM_FRAME_SIZE: {
> > > +		which = ((struct v4l2_subdev_frame_size_enum *)arg)->which;
> > > +		break;
> > > +	}
> > > +
> > > +	case VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL: {
> > > +		which = ((struct v4l2_subdev_frame_interval_enum *)arg)->which;
> > > +		break;
> > > +	}
> > > +
> > > +	case VIDIOC_SUBDEV_G_SELECTION:
> > > +	case VIDIOC_SUBDEV_S_SELECTION: {
> > > +		which = ((struct v4l2_subdev_selection *)arg)->which;
> > > +		break;
> > > +	}
> > > +	}
> > > +
> > > +	return which == V4L2_SUBDEV_FORMAT_TRY ?
> > > +			     subdev_fh->state :
> > > +			     v4l2_subdev_get_active_state(sd);
> >
> > Why this additional indirection layer ?
> >
> > v4l2_subdev_get_active_state(struct v4l2_subdev *sd)
> > {
> >      return sd->state;
> > }
>
> I wanted to hide all direct accesses to the state to make it easier to
> figure out how and where the state is accessed.
>
> > I understand you want to have the core to fish the 'right' state for
> > the drivers, but this then requires to protect against bridge drivers
> > calling an op through v4l2_subdev_call() with a NULL state by using
> > one more indirection like
> >
> > 	state = v4l2_subdev_validate_state(sd, state);
> >
> >          static inline struct v4l2_subdev_state *
> >          v4l2_subdev_validate_state(struct v4l2_subdev *sd,
> >                                     struct v4l2_subdev_state *state)
> >          {
> >                  return state ? state : sd->state;
> >          }
> >
> > Which I very much don't like as it implicitly changes what state the
> > driver receives to work-around a design flaw (the fact that even if
> > the core tries to, there's no gurantee state is valid).
>
> I don't like it either. My idea was that in the future the subdevs would
> always get the correct state. In other words, all the subdev drivers calling
> ops in other subdevs would be changed to pass the state correctly. Thus the
> v4l2_subdev_validate_state() is a helper for the transition period, which
> can easily be dropped when the drivers work correctly.

Most of the drivers that call v4l2_subdev_call() with a NULL state are
bridge drivers operating in the ACTIVE use case. Even if we get to a
point where we remove all calls passing in a NULL state, what are the
bridges expected to provide as a state to the subdev they call
operations on ? The subdev's state as well ? something like

        v4l2_subdev_call(sd, pad, set_fmt, sd->state, ...)

With your current dynamicaly allocated state, sd->state could very well
be NULL.

I still think this could be way simpler if we assume that the state
received as parameter is the file-handle's one (like it was for
pad_configs) and in the active case we let driver use their own
sd->state.

>
> > If feel like it would be much simpler if:
> >
> > 1) The core passes in a state which always come from the fh (the
> >     try_state) when it do_ioctl()
> >
> > 2) Drivers use their 'active' states embedded in the subdev or the
> >     'try' state passed in as parameter and decide
> >     which one to use based on the context. It's a pattern we have
> >     everywere already when using the per-fh try formats
> >
> > 	switch (which) {
> > 	case V4L2_SUBDEV_FORMAT_TRY:
> > 		return v4l2_subdev_get_try_format(&sd, sd_state, pad);
> > 	case V4L2_SUBDEV_FORMAT_ACTIVE:
> > 		return &sd->fmt;
> > 	default:
> > 		return NULL;
> > 	}
>
> This is possible, of course. We could do this if we decide we don't want the
> subdev drivers to pass the state properly in the future.
>
> However, if, in my series, I currently call this in a subdev driver:
>
> state = v4l2_subdev_validate_state(sd, state);
>
> With the change you suggest I'd just do (possibly with a helper):
>
> state = which == V4L2_SUBDEV_FORMAT_TRY ? state : sd->state;
>
> Is it any better?
>
> > I liked the idea to have the core pass in a state without the driver
> > having to care where it comes from, but it requires too many
> > indirections and implicities like the above shown
> > v4l2_subdev_validate_state().
> >
> > One middle-ground could be to have the core pass in the 'correct' state as it
> > does in your series, and default it to sd->state if a bridge driver
> > calls an op through v4l2_subdev_call() with a NULL state, as the
> > format is implicitly ACTIVE in that case.
>
> If you mean changing all the bridge drivers so that they would give the
> state properly, yes, that was my plan (I think I mentioned it in a commit
> desc, perhaps). It's not a trivial change, though, as v4l2_subdev_call()
> cannot handle this at the moment.

Unfortunately this cannot be done automatically in v4l2_subdev_call(),
at least not easily.

>
> I believe it should be doable with coccinelle. Maybe add a new macro,
> v4l2_subdev_call_state() or such, which gives the active state in the second
> parameter (looks like all the ops have the state as the second param). Then
> use coccinelle to find all the v4l2_subdev_call uses which call ops that get
> a state, verify that the current caller uses NULL as the state, and change
> v4l2_subdev_call to v4l2_subdev_call_state.


Even if we beautify it, I think bridge drivers passing as parameter to
a subdev operation a subdev attribute, like in the above shown

        v4l2_subdev_call(sd, pad, set_fmt, sd->state, ...)

is unecessary and a possible source of confusion, with the subdev
driver having to infer where the state comes from and the possibility
of it being NULL anyway if the bridge operates with a non-state aware
subdev which has not allocated a state (which is harmelss now, as they
won't be interested in 'state').

It could be made easier if we clearly say drivers "if it's TRY, expect
a state, if is ACTIVE use your own one (if you want to)". This seems
impossible to get wrong to me for subdev drivers.

>
> > This ofc requires the state to be embedded (ie it's always there) and
> > that state-aware drivers to have properly initialized it, but that's a
> > given.
>
> Why does the state need to be embedded? If the subdev driver is not
> state-aware, it does not expect to get a state except for the TRY case.
> Passing NULL for those drivers should be fine.
>

It doesn't -need- to be, I just think it avoids allocation and
releasing at run-time and offers a place where to store subdev-wide
configurations to all drivers as an opt-in feature.

Of course we pay a little price in the size of the subdev, but it's
all in-kernel stuff and going forward the state could very wel just
become the standard 'subdev_config'

        struct v4l2_subdev {
                ....

                struct v4l2_subdev_config {
                        struct v4l2_subdev_routing routes;
                        struct v4l2_subdev_streams streams;
                } config;
        };

But yeah, allocated or embedded is tangential and I defer this call to
maintainers which know better than me for sure.

> > Nonetheless, this considerations do not defeat the purpose of having a
> > 'state', as currently we have
> >
> > struct v4l2_subdev_state {
> >          struct v4l2_subdev_krouting; /* Use for TRY and ACTIVE */
> >          struct v4l2_stream_configs; /* Use for ACTIVE */
>
> stream_configs is used for TRY also.
>
> >          struct v4l2_pad_configs; /* Used for TRY */
>
> Probably no point in this, but this _could_ also be used for ACTIVE. We
> could have state aware drivers that don't use routing or streams, and use
> just a plain old pad_configs array. This would allow moving the ACTIVE
> pad_configs from the driver to the core.

That would be nice, but it would be better is stream_configs could be
used for pad-only drivers (it's just about assuming stream = 0 for all
of them, right ?). But yes, my point is about trying to centralize the
subdev configuration in one place. But that's probably for later
indeed.

Thanks
  j

>
> But, as you suggest, probably a better direction is to try to get rid of
> pad_configs instead.
>
> > };
> >
> > and v4l2_stream_configs is a super-set of v4l2_pad_configs
> >
> > If we could get to
> >
> > struct v4l2_subdev_state {
> >          struct v4l2_subdev_krouting; /* Use for TRY and ACTIVE */
> >          struct v4l2_stream_configs; /* Use for TRY and ACTIVE */
> > };
> >
> > This could turn out to be pretty neat, as it allows 'new' drivers to
> > maintain their current formats and routings in a subdev 'state'
> > instead of scattering those information in the driver-wide structure
> > as they currently do for formats, crops and whatnot. This can ofc go
> > on top.
>
> Yes, that's the long term plan, but it's a huge change. And when I say plan,
> I don't mean I'm planning to change all the current drivers, I'm just saying
> my series is designed so that it allows these to be done in the future.
>
>  Tomi
