Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31BB8408F62
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 15:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243368AbhIMNmP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 09:42:15 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:33367 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243114AbhIMNjO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 09:39:14 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id E0C1E60007;
        Mon, 13 Sep 2021 13:37:54 +0000 (UTC)
Date:   Mon, 13 Sep 2021 15:38:41 +0200
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
Subject: Re: [PATCH v8 03/36] media: subdev: add 'which' to subdev state
Message-ID: <20210913133841.nck65h2ft4hfnbg5@uno.localdomain>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
 <20210830110116.488338-4-tomi.valkeinen@ideasonboard.com>
 <20210913114154.ovffxjoghgdud4js@uno.localdomain>
 <0733ae28-bcd9-6dc8-fb6a-0fa43beb1191@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0733ae28-bcd9-6dc8-fb6a-0fa43beb1191@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Mon, Sep 13, 2021 at 03:17:01PM +0300, Tomi Valkeinen wrote:
> On 13/09/2021 14:41, Jacopo Mondi wrote:
> > Hi Tomi,
> >
> > On Mon, Aug 30, 2021 at 02:00:43PM +0300, Tomi Valkeinen wrote:
> > > The subdev state is passed to functions in the media drivers, and
> > > usually either V4L2_SUBDEV_FORMAT_ACTIVE or V4L2_SUBDEV_FORMAT_TRY is
> > > also given to the function in one way or another.
> > >
> > > One op where this is not the case is v4l2_subdev_pad_ops.init_cfg. One
> > > could argue that the initialization of the state should be the same for
> > > both ACTIVE and TRY cases, but unfortunately that is not the case:
> > >
> > > - Some drivers do also other things than just touch the state when
> > > dealing with ACTIVE, e.g. if there is extra state outside the standard
> > > subdev state.
> > > - Some drivers might need to create, say, struct v4l2_subdev_format
> > > which has 'which' field, and that needs to be filled with either ACTIVE
> > > or TRY.
> > >
> > > Currently init_cfg is only called for TRY case from the v4l2 framework,
> > > passing the TRY state. Some drivers call their own init_cfg, passing
> > > NULL as the state, which is used to indicate ACTIVE case.
> > >
> > > In the future we want to pass subdev's active state from the v4l2
> > > framework side, so we need a solution to this.
> > >
> > > We could change the init_cfg() to include the TRY/ACTIVE value, which
> > > would require changing more or less all the drivers. Instead, I have
> > > added 'which' field to the subdev state itself, filled at state
> > > allocation time, which only requires changes to the drivers that
> > > allocate a state themselves.
> > >
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > ---
> > >   drivers/media/platform/rcar-vin/rcar-v4l2.c |  2 +-
> > >   drivers/media/platform/vsp1/vsp1_entity.c   |  2 +-
> > >   drivers/media/v4l2-core/v4l2-subdev.c       | 10 +++++++---
> > >   drivers/staging/media/tegra-video/vi.c      |  2 +-
> > >   include/media/v4l2-subdev.h                 |  7 ++++++-
> > >   5 files changed, 16 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > > index 5f4fa8c48f68..1de30d5b437f 100644
> > > --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > > +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > > @@ -252,7 +252,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
> > >   	u32 width, height;
> > >   	int ret;
> > >
> > > -	sd_state = v4l2_alloc_subdev_state(sd);
> > > +	sd_state = v4l2_alloc_subdev_state(sd, V4L2_SUBDEV_FORMAT_ACTIVE);
> >
> > Shouldn't the 'which' parameters be used to decide if either ACTIVE or
> > TRY have to be used ? this function is also used to set TRY formats,
> > in example...
> >
> > Oh, maybe I got how it works, the state's which is not
> > relevant but the v4l2_subdev_format's which is, as it will be used in
> > the next patch to decide if the subdev's state of the file-handle's
> > state should be passed to the ioctl.
>
> Yes. It's messy, but it's how it worked before also.
>
> The drivers can't really allocate TRY state as it must come from the core,
> based on the filehandle. Now as I say that, makes me wonder why even expose
> the option to drivers. Maybe v4l2_alloc_subdev_state() should take just the
> sd parameter, and always allocate ACTIVE state, and the v4l2 core can use
> another way to create the TRY state.
>

init_cfg() as well as other operations used to received an
array of per fh's pad_configs, and the sd pointer itself. The fh's pad
configs were allocated by the core, as well as the core now allocates
the per-fh's state.

Before the introduction of 'state', if the 'which' flags was set to
TRY then information were stored/retrieved/initialized in the per-fh
pad_config, otherwise the active configuration (usually stored in the
driver main structure) was used.

So we had a clear separation of per-fh information and the active
state. The core didn't care afaict, and passed in both, then driver had
to deal with them doing the right thing by inspecting the 'which' flag.

The typical pattern was:

        static int subdev_ops(sd, pad_cfg, which)
        {
                if (which == TRY)
                        /* Operate on config stored in pad_cfg */

                else
                        /*
                         * Operate on config stored in subdev (and
                         * applied to HW)
                         */
        }

Or am I overlooking some cases or do you agree with my understanding
so far ?

Now we have a 'state' that holds the array of pad_configs and along
the continuation of the series will end up holding per-pad
configurations.

We now also have one 'state' per file-handle, and one
per-subdev. As I see this, it would be natual for drivers to receive
one state without knowing where it comes from. In the next patch you
instrument the core to do exactly this: inspect the which flag and
pass in the 'right' state. Ofc drivers need to have access to 'which'
to know if they have to apply settings to the HW or not.

Looking ahead in your series I see these structures:

        struct v4l2_subdev_pad_config {
                struct v4l2_mbus_framefmt try_fmt;
                struct v4l2_rect try_crop;
                struct v4l2_rect try_compose;
        };

        struct v4l2_subdev_stream_config {
                u32 pad;
                u32 stream;

                struct v4l2_mbus_framefmt fmt;
                struct v4l2_rect crop;
                struct v4l2_rect compose;
        };

        struct v4l2_subdev_stream_configs {
                u32 num_configs;
                struct v4l2_subdev_stream_config *configs;
        };

All of them part of state:

struct v4l2_subdev_state {
	struct mutex lock;
	u32 which;
	struct v4l2_subdev_pad_config *pads;
	struct v4l2_subdev_krouting routing;
	struct v4l2_subdev_stream_configs stream_configs;
};

So 'state' will hold 'TRY' information (only used for 'state'
instances allocated in the fh) and 'ACTIVE' ones (used for states
allocated in the sd).

Looking at 'v4l2_subdev_pad_config' and 'v4l2_subdev_stream_config' they
seem to describe more or less the same things: fmt, crop and compose
(per pad-stream in case of stream_config). I wonder if those shouldn't
be unified so that:

1) Drivers receive one state: the core passes in the 'correct' one
(per-fh or per-sd) as you do in next patch
2) The 'which' information is not stored in the state but it's only
'contextual' (as in a parameter to the subdev operation) so that
drivers inspect it to know if they have to apply settings to hw or not
3) v4l2_subdev_pad_config can be re-used and expanded, to maintain per-pad
configurations regardless if they're ACTIVE or TRY, as this only depends
on where the state is stored.

As I immagine it a subdev pad operation could look like:

        static int subdev_op(sd, pad, state, which, ...)
        {
                /* Doesn't matter if state is per-fh or the sd one. */
                state->pads[pad].fmt = ....;

                if (which == TRY)
                        return;

                /* Apply to the HW. */
        }

Does it make any sense to you ? I might have missed some reason why
this is not possible.

> > >   	if (IS_ERR(sd_state))
> > >   		return PTR_ERR(sd_state);
> > >
> > > diff --git a/drivers/media/platform/vsp1/vsp1_entity.c b/drivers/media/platform/vsp1/vsp1_entity.c
> > > index e40bca254b8b..63ea5e472c33 100644
> > > --- a/drivers/media/platform/vsp1/vsp1_entity.c
> > > +++ b/drivers/media/platform/vsp1/vsp1_entity.c
> > > @@ -675,7 +675,7 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
> > >   	 * Allocate the pad configuration to store formats and selection
> > >   	 * rectangles.
> > >   	 */
> > > -	entity->config = v4l2_alloc_subdev_state(&entity->subdev);
> > > +	entity->config = v4l2_alloc_subdev_state(&entity->subdev, V4L2_SUBDEV_FORMAT_ACTIVE);
> > >   	if (IS_ERR(entity->config)) {
> > >   		media_entity_cleanup(&entity->subdev.entity);
> > >   		return PTR_ERR(entity->config);
> > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > index e1a794f69815..04ad319fb150 100644
> > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > @@ -28,7 +28,7 @@ static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)
> > >   {
> > >   	struct v4l2_subdev_state *state;
> > >
> > > -	state = v4l2_alloc_subdev_state(sd);
> > > +	state = v4l2_alloc_subdev_state(sd, V4L2_SUBDEV_FORMAT_TRY);
> >
> > At the same time I'm not sure I get the purpose of this. Don't
> > init_cfg() callback implementations deal with try formats themeselves
> > ? I mean, it's not a fixed rule, they can as well initialize their
> > default 'active' formats, but what matters is that they initialize
> > their per-fh try states ?
>
> That is what they do currently. init_cfg() only deals with TRY state, as
> that's the only "state" (i.e. pad_config) there used to be from v4l2 core's
> perspective.
>
> > Shouldn't init_cfg receive the fh's state so that it can initialize
> > it, and just in case they need to, access their subdev's state and
> > initialize them ? I'm missing what the purpose of the flag is tbh.
>
> Now we have (a possibility to have) state for both TRY and ACTIVE on the
> v4l2 core side. The active state has to be initialized also, and a logical
> way to do that is to use the init_cfg().

The 'ACTIVE' state is stored in the subdev, to which init_cfg() has
access, and it receives the 'TRY' state as a parameter.

It is possible to access both states and initialize them properly if
I'm not mistaken.

>
> So now, for drivers that support the new active state, init_cfg() can get
> either TRY or ACTIVE state. And if you want to call, say, the driver's
> set_routing() to setup the routing in the state, you have to set the 'which'
> in the routing struct to a value. So somehow init_cfg needs to know if it's
> initializing an ACTIVE or TRY state.

I'm not sure I got this part. set_routing() as other ops will receive
a state and 'which'. If my proposal above makes sensem where the state
comes from (aka it's TRY or ACTIVE) it's not relevant for the driver.

Ofc init_cfg() should have initialized both states opportunely, but
that's the case today as well.

Thanks
  j

>
>  Tomi
