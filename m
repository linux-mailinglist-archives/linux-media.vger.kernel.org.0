Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4A2418D53
	for <lists+linux-media@lfdr.de>; Mon, 27 Sep 2021 02:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232243AbhI0AsN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 20:48:13 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:40686 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231593AbhI0AsM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 20:48:12 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6330049A;
        Mon, 27 Sep 2021 02:46:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632703594;
        bh=B9rfLTzY5yeyKq68JdjQrF3WI/Z2ow42efvTaNhip6Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fUUv7yupI8q0o9OPZx8NA+pBGVKhpJa6+43bn75rnGYFVyd426bvNknceRPcSQdm+
         QHczw/Q/Bn3+BfQOiZ59btq1LpN9H+jGYvDLXJlrP6HEBKnVJ/a8cQ/7P+fYDcLM4j
         KFZOgWXqSWw6ki3gyl1mdAAlKTnS062ItYrx8TOQ=
Date:   Mon, 27 Sep 2021 03:46:29 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [PATCH v8 03/36] media: subdev: add 'which' to subdev state
Message-ID: <YVEUZcDzSoBe7MDV@pendragon.ideasonboard.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
 <20210830110116.488338-4-tomi.valkeinen@ideasonboard.com>
 <20210913114154.ovffxjoghgdud4js@uno.localdomain>
 <0733ae28-bcd9-6dc8-fb6a-0fa43beb1191@ideasonboard.com>
 <20210913133841.nck65h2ft4hfnbg5@uno.localdomain>
 <656577a3-b783-0272-4809-20169b84e891@ideasonboard.com>
 <20210916130752.bsdhq3xpsatdfl4a@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210916130752.bsdhq3xpsatdfl4a@uno.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Thu, Sep 16, 2021 at 03:07:52PM +0200, Jacopo Mondi wrote:
> On Mon, Sep 13, 2021 at 05:26:45PM +0300, Tomi Valkeinen wrote:
> > On 13/09/2021 16:38, Jacopo Mondi wrote:
> > > On Mon, Sep 13, 2021 at 03:17:01PM +0300, Tomi Valkeinen wrote:
> > > > On 13/09/2021 14:41, Jacopo Mondi wrote:
> > > > > On Mon, Aug 30, 2021 at 02:00:43PM +0300, Tomi Valkeinen wrote:
> > > > > > The subdev state is passed to functions in the media drivers, and
> > > > > > usually either V4L2_SUBDEV_FORMAT_ACTIVE or V4L2_SUBDEV_FORMAT_TRY is
> > > > > > also given to the function in one way or another.
> > > > > >
> > > > > > One op where this is not the case is v4l2_subdev_pad_ops.init_cfg. One
> > > > > > could argue that the initialization of the state should be the same for
> > > > > > both ACTIVE and TRY cases, but unfortunately that is not the case:
> > > > > >
> > > > > > - Some drivers do also other things than just touch the state when
> > > > > > dealing with ACTIVE, e.g. if there is extra state outside the standard
> > > > > > subdev state.
> > > > > > - Some drivers might need to create, say, struct v4l2_subdev_format
> > > > > > which has 'which' field, and that needs to be filled with either ACTIVE
> > > > > > or TRY.
> > > > > >
> > > > > > Currently init_cfg is only called for TRY case from the v4l2 framework,
> > > > > > passing the TRY state. Some drivers call their own init_cfg, passing
> > > > > > NULL as the state, which is used to indicate ACTIVE case.
> > > > > >
> > > > > > In the future we want to pass subdev's active state from the v4l2
> > > > > > framework side, so we need a solution to this.
> > > > > >
> > > > > > We could change the init_cfg() to include the TRY/ACTIVE value, which
> > > > > > would require changing more or less all the drivers. Instead, I have
> > > > > > added 'which' field to the subdev state itself, filled at state
> > > > > > allocation time, which only requires changes to the drivers that
> > > > > > allocate a state themselves.
> > > > > >
> > > > > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > > > > ---
> > > > > >    drivers/media/platform/rcar-vin/rcar-v4l2.c |  2 +-
> > > > > >    drivers/media/platform/vsp1/vsp1_entity.c   |  2 +-
> > > > > >    drivers/media/v4l2-core/v4l2-subdev.c       | 10 +++++++---
> > > > > >    drivers/staging/media/tegra-video/vi.c      |  2 +-
> > > > > >    include/media/v4l2-subdev.h                 |  7 ++++++-
> > > > > >    5 files changed, 16 insertions(+), 7 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > > > > > index 5f4fa8c48f68..1de30d5b437f 100644
> > > > > > --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > > > > > +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > > > > > @@ -252,7 +252,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
> > > > > >    	u32 width, height;
> > > > > >    	int ret;
> > > > > >
> > > > > > -	sd_state = v4l2_alloc_subdev_state(sd);
> > > > > > +	sd_state = v4l2_alloc_subdev_state(sd, V4L2_SUBDEV_FORMAT_ACTIVE);
> > > > >
> > > > > Shouldn't the 'which' parameters be used to decide if either ACTIVE or
> > > > > TRY have to be used ? this function is also used to set TRY formats,
> > > > > in example...
> > > > >
> > > > > Oh, maybe I got how it works, the state's which is not
> > > > > relevant but the v4l2_subdev_format's which is, as it will be used in
> > > > > the next patch to decide if the subdev's state of the file-handle's
> > > > > state should be passed to the ioctl.
> > > >
> > > > Yes. It's messy, but it's how it worked before also.
> > > >
> > > > The drivers can't really allocate TRY state as it must come from the core,
> > > > based on the filehandle. Now as I say that, makes me wonder why even expose
> > > > the option to drivers. Maybe v4l2_alloc_subdev_state() should take just the
> > > > sd parameter, and always allocate ACTIVE state, and the v4l2 core can use
> > > > another way to create the TRY state.

Drivers should not allocate state manually, it should always be done by
the core (when opening a file handle for the TRY states, and when
initializing the subdev in the probe function for the ACTIVE state).

Looking at the three drivers that call v4l2_alloc_subdev_state(), we
have the vsp1 driver that uses it to allocate its own ACTIVE state at
init time. This one is easy, it should be replaced with
v4l2_subdev_alloc_state() (or whatever that function will end up being
named, see comments to 02/36).

The rcar-vin and tegra-video drivers are doing it wrong. rcar-vin has
legacy code to support unfortunate design decisions (everything in the
"V4L2" section in rcar-v4l2.c), and newer code that gets it right (the
"V4L2 Media Controller" section in the same file). The legacy code is
used on older platforms, and the newer code on newer platforms. I know
that Niklas would love to get rid of the legacy code, and I'd also be
happy to see it go. If that's not possible, we'll have to keep exposing
v4l2_alloc_subdev_state() for this driver. Niklas, what do you think,
could we drop the legacy code after all those years ?

The situation in tegra-video is similar. They got it wrong. The driver
is in staging though, so that's fixable.

I'd propose renaming v4l2_subdev_alloc_state() to
__v4l2_subdev_alloc_state() (or something that shows it's internal),
documenting that it must not be used by new drivers, and adding an entry
in the TODO file of the tegra-video driver to fix this.

> > > init_cfg() as well as other operations used to received an
> > > array of per fh's pad_configs, and the sd pointer itself. The fh's pad
> > > configs were allocated by the core, as well as the core now allocates
> > > the per-fh's state.
> > >
> > > Before the introduction of 'state', if the 'which' flags was set to
> > > TRY then information were stored/retrieved/initialized in the per-fh
> > > pad_config, otherwise the active configuration (usually stored in the
> > > driver main structure) was used.

Correct, and the active configuration is in that case stored in a
driver-specific way (except in the vsp1 driver that uses the pad config
structure to store it), with ad-hoc accessors and lots of manual checks
in the code paths.

> > > So we had a clear separation of per-fh information and the active
> > > state. The core didn't care afaict, and passed in both, then driver had
> > > to deal with them doing the right thing by inspecting the 'which' flag.
> > >
> > > The typical pattern was:
> > >
> > >          static int subdev_ops(sd, pad_cfg, which)
> > >          {
> > >                  if (which == TRY)
> > >                          /* Operate on config stored in pad_cfg */
> > >
> > >                  else
> > >                          /*
> > >                           * Operate on config stored in subdev (and
> > >                           * applied to HW)
> > >                           */
> > >          }
> > >
> > > Or am I overlooking some cases or do you agree with my understanding
> > > so far ?
> >
> > More or less, yes. I think there are (used to be) three kinds of ops:
> >
> > - Ops that get pad_cfg and 'which' in an op specific struct. E.g. set_fmt.
> > The pad_cfg is TRY pad_config, even if 'which' == ACTIVE.

And pad_cfg is ignored in those drivers when which == ACTIVE (or it
should be at least, if it's not, it's a driver bug).

> > - Ops that don't get pad_cfg, like s_stream. 'which' is implicitly ACTIVE.

.s_stream() on a TRY configuration would be an interesting concept :-)

> Also note that operations like s_stream do not take a state as
> parameter. The driver has to fetch it from the subdev anyway
> (this in reply to the idea of having the active state as parameter vs
> retrieving it from the subdev if ACTIVE)

We could pass the state as a parameter, but given that the operation
always operates on the ACTIVE state by definition, I think this is
redundant.

> While porting the R-Car drivers on top of this series I found myself
> in the need to (in the s_stream call chain)
> 
> static int rcsi2_start_receiver(struct rcar_csi2 *priv)
> {
> 	const struct v4l2_subdev_state *state = priv->subdev.state;
> 	const struct v4l2_subdev_stream_configs *configs = &state->stream_configs;
> 
>         ...
> 
> 	/*
> 	 * Configure field handling inspecting the formats of the
> 	 * single sink pad streams.
> 	 */
> 	for (i = 0; i < configs->num_configs; ++i) {
> 		const struct v4l2_subdev_stream_config *config = configs->configs;
> 		if (config->pad != RCAR_CSI2_SINK)
> 			continue;
> 
> 		if (config->fmt.field != V4L2_FIELD_ALTERNATE)
> 			continue;
> 
> 		fld |= FLD_DET_SEL(1);
> 		fld |= FLD_FLD_EN(config->stream);
> 
> 		/* PAL vs NTSC. */
> 		if (config->fmt.height == 240)
> 			fld |= FLD_FLD_NUM(0);
> 		else
> 			fld |= FLD_FLD_NUM(1);
> 	}
> 
>         ...
> 
> }
> 
> Am I doing it wrong, or is this a case for the subdev to have to
> directly access sd->state ?

(Will reply to Tomi's reply on this)

> > - init_cfg which gets pad_cfg, but no which (as 'which' is always implicitly
> > TRY)

As proposed in 02/36, I think .init_cfg() should operate the same way
regardless of whether the state is TRY or ACTIVE, so there's no need for
a 'which' parameter (it would only open the door to abuses).

> > So pad_cfg was TRY state. Drivers could use pad_configs internally to track
> > ACTIVE state, but the core had no knowledge about this.

Correct.

> > > Now we have a 'state' that holds the array of pad_configs and along
> > > the continuation of the series will end up holding per-pad
> > > configurations.
> > >
> > > We now also have one 'state' per file-handle, and one
> > > per-subdev. As I see this, it would be natual for drivers to receive
> > > one state without knowing where it comes from. In the next patch you
> >
> > Note that only subdev's that explicitly support the new state code, and
> > allocate the state, have the subdev active state. Which means only the
> > drivers in my work branch.
> >
> > The "old" drivers work like they used to: they get the state (essentially
> > repackaged pad_cfg) for TRY cases, NULL otherwise.
> >
> > And yes, it would be natural to just get a state, but the subdev drivers
> > need to know if the context is TRY/ACTIVE. As you can see from the bullet
> > list above, the driver knows this in all the other places except init_cfg.

I agree that porting all the drivers as part of this series isn't
feasible, so passing NULL for the state in case the driver hasn't
explicitly opted-in seems fine to me.

> > > instrument the core to do exactly this: inspect the which flag and
> > > pass in the 'right' state. Ofc drivers need to have access to 'which'
> > > to know if they have to apply settings to the HW or not.
> > >
> > > Looking ahead in your series I see these structures:
> > >
> > >          struct v4l2_subdev_pad_config {
> > >                  struct v4l2_mbus_framefmt try_fmt;
> > >                  struct v4l2_rect try_crop;
> > >                  struct v4l2_rect try_compose;
> > >          };
> > >
> > >          struct v4l2_subdev_stream_config {
> > >                  u32 pad;
> > >                  u32 stream;
> > >
> > >                  struct v4l2_mbus_framefmt fmt;
> > >                  struct v4l2_rect crop;
> > >                  struct v4l2_rect compose;
> > >          };
> > >
> > >          struct v4l2_subdev_stream_configs {
> > >                  u32 num_configs;
> > >                  struct v4l2_subdev_stream_config *configs;
> > >          };
> > >
> > > All of them part of state:
> > >
> > > struct v4l2_subdev_state {
> > > 	struct mutex lock;
> > > 	u32 which;
> > > 	struct v4l2_subdev_pad_config *pads;
> > > 	struct v4l2_subdev_krouting routing;
> > > 	struct v4l2_subdev_stream_configs stream_configs;
> > > };
> > >
> > > So 'state' will hold 'TRY' information (only used for 'state'
> > > instances allocated in the fh) and 'ACTIVE' ones (used for states
> > > allocated in the sd).
> >
> > Right.
> >
> > > Looking at 'v4l2_subdev_pad_config' and 'v4l2_subdev_stream_config' they
> > > seem to describe more or less the same things: fmt, crop and compose
> > > (per pad-stream in case of stream_config). I wonder if those shouldn't
> > > be unified so that:
> > >
> > > 1) Drivers receive one state: the core passes in the 'correct' one
> > > (per-fh or per-sd) as you do in next patch
> >
> > Yes. But note that "old" drivers don't have active state.
> >
> > > 2) The 'which' information is not stored in the state but it's only
> > > 'contextual' (as in a parameter to the subdev operation) so that
> > > drivers inspect it to know if they have to apply settings to hw or not
> >
> > Yes, except we have init_cfg...

This sounds like .init_cfg() is the only blocker, which I think is
promissing :-)

> > > 3) v4l2_subdev_pad_config can be re-used and expanded, to maintain per-pad
> > > configurations regardless if they're ACTIVE or TRY, as this only depends
> > > on where the state is stored.
> >
> > pad_config is a static array of per-pad configs. stream_configs is a dynamic
> > per-stream config.

Do I understand correctly that it's both per-stream and per-pad ? I
wonder if it could make sense to store it that way, with an array of
per-pad configurations (v4l2_subdev_pad_config), which will in turn
contain per-stream configuration. I suppose it depends on the usage
patterns, which I'll understand better when reading the rest of the
series.

> > stream_configs is a super-set of pad-configs, so we could
> > drop pad_configs, but it would require changing all the drivers in
> > non-trivial ways.

I like Jacopo's proposal to unify the two, but I do agree that it's not
trivial. Here again I think it falls in the category of setting a long
term goal and trying to go in that direction, without necessarily
reaching it just yet. I wonder if we could have helper functions (maybe
they're already included later in the series ?) to abstract the
pad_config/stream_configs difference for drivers. This would also make
further reworks easier (such as storing the per-stream configuration in
v4l2_subdev_pad_config as proposed above) if we decide to address some
of the changes later.

> > v4l2_subdev_pad_config is not used or even allocated by the "new" drivers.
> > And routing & stream_configs are not used by the "old" drivers.
> >
> > > As I immagine it a subdev pad operation could look like:
> > >
> > >          static int subdev_op(sd, pad, state, which, ...)
> > >          {
> > >                  /* Doesn't matter if state is per-fh or the sd one. */
> > >                  state->pads[pad].fmt = ....;
> > >
> > >                  if (which == TRY)
> > >                          return;
> > >
> > >                  /* Apply to the HW. */
> > >          }
> > >
> > > Does it make any sense to you ? I might have missed some reason why
> > > this is not possible.
> >
> > It makes sense, but there are the buts =). I've tried to explain these in
> > the commit messages, but it's kind of confusing.
> >
> > One but I haven't mentioned in the emails is that when subdev drivers call
> > ops in other subdev drivers they pass NULL in the state.

We should really really try to avoid that. s_stream() is the obvious
main exception. Other subdev operations, such as .get_fmt() or
.set_fmt(), shouldn't be called cross-subdevs. A subdev should only care
about its own configuration, not about its neighbours. Are there
blockers here ?

> > This is fine for
> > the "old" drivers, as they expect a state only for TRY case. However, the
> > "new" drivers unfortunately expect to get a state on both TRY and ACTIVE
> > cases, and the only sensible way I figured out to handle this was the
> > v4l2_subdev_validate_state() function (patch 6).
> >
> > So, all this could be much neater, but would require modifying all subdev
> > drivers in non-trivial ways. I think this is something that can be done
> > slowly in the future.
> >
> > > > > >    	if (IS_ERR(sd_state))
> > > > > >    		return PTR_ERR(sd_state);
> > > > > >
> > > > > > diff --git a/drivers/media/platform/vsp1/vsp1_entity.c b/drivers/media/platform/vsp1/vsp1_entity.c
> > > > > > index e40bca254b8b..63ea5e472c33 100644
> > > > > > --- a/drivers/media/platform/vsp1/vsp1_entity.c
> > > > > > +++ b/drivers/media/platform/vsp1/vsp1_entity.c
> > > > > > @@ -675,7 +675,7 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
> > > > > >    	 * Allocate the pad configuration to store formats and selection
> > > > > >    	 * rectangles.
> > > > > >    	 */
> > > > > > -	entity->config = v4l2_alloc_subdev_state(&entity->subdev);
> > > > > > +	entity->config = v4l2_alloc_subdev_state(&entity->subdev, V4L2_SUBDEV_FORMAT_ACTIVE);
> > > > > >    	if (IS_ERR(entity->config)) {
> > > > > >    		media_entity_cleanup(&entity->subdev.entity);
> > > > > >    		return PTR_ERR(entity->config);
> > > > > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > > > index e1a794f69815..04ad319fb150 100644
> > > > > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > > > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > > > @@ -28,7 +28,7 @@ static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)
> > > > > >    {
> > > > > >    	struct v4l2_subdev_state *state;
> > > > > >
> > > > > > -	state = v4l2_alloc_subdev_state(sd);
> > > > > > +	state = v4l2_alloc_subdev_state(sd, V4L2_SUBDEV_FORMAT_TRY);
> > > > >
> > > > > At the same time I'm not sure I get the purpose of this. Don't
> > > > > init_cfg() callback implementations deal with try formats themeselves
> > > > > ? I mean, it's not a fixed rule, they can as well initialize their
> > > > > default 'active' formats, but what matters is that they initialize
> > > > > their per-fh try states ?
> > > >
> > > > That is what they do currently. init_cfg() only deals with TRY state, as
> > > > that's the only "state" (i.e. pad_config) there used to be from v4l2 core's
> > > > perspective.
> > > >
> > > > > Shouldn't init_cfg receive the fh's state so that it can initialize
> > > > > it, and just in case they need to, access their subdev's state and
> > > > > initialize them ? I'm missing what the purpose of the flag is tbh.
> > > >
> > > > Now we have (a possibility to have) state for both TRY and ACTIVE on the
> > > > v4l2 core side. The active state has to be initialized also, and a logical
> > > > way to do that is to use the init_cfg().
> > >
> > > The 'ACTIVE' state is stored in the subdev, to which init_cfg() has
> > > access, and it receives the 'TRY' state as a parameter.
> >
> > No, init_cfg gets either ACTIVE or TRY state, whichever is being allocated.
> > For "old" drivers, ACTIVE state is never allocated so they don't get
> > init_cfg calls for ACTIVE at all.
> >
> > Aaand while writing that, I realized that some drivers manually do allocate
> > ACTIVE state temporarily, which would cause init_cfg with ACTIVE state to be
> > called. I wonder if they explode... Need to check.

Is this only rcar-vin and tegra-video (vsp1 also allocates an ACTIVE
state, but it's not temporary), or are there other drivers ?

> > > It is possible to access both states and initialize them properly if
> > > I'm not mistaken.
> > >
> > > > So now, for drivers that support the new active state, init_cfg() can get
> > > > either TRY or ACTIVE state. And if you want to call, say, the driver's
> > > > set_routing() to setup the routing in the state, you have to set the 'which'
> > > > in the routing struct to a value. So somehow init_cfg needs to know if it's
> > > > initializing an ACTIVE or TRY state.
> > >
> > > I'm not sure I got this part. set_routing() as other ops will receive
> > > a state and 'which'. If my proposal above makes sensem where the state
> >
> > Yes, but if it's init_cfg calling set_routing, init_cfg has to figure out
> > the 'which' from somewhere.
> >
> > E.g. init_cfg from ub913 driver:
> >
> > static int ub913_init_cfg(struct v4l2_subdev *sd,
> > 			  struct v4l2_subdev_state *state)
> > {
> > 	u32 which = state->which;
> >
> > 	struct v4l2_subdev_route routes[] = {
> > 		{
> > 			.sink_pad = 0,
> > 			.sink_stream = 0,
> > 			.source_pad = 1,
> > 			.source_stream = 0,
> > 			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> > 		},
> > 	};
> >
> > 	struct v4l2_subdev_krouting routing = {
> > 		.which = which,
> > 		.num_routes = ARRAY_SIZE(routes),
> > 		.routes = routes,
> > 	};
> >
> > 	return ub913_set_routing(sd, state, &routing);
> > }
> >
> > It uses set_routing to setup a default routing (and set_routing in turn also
> > initializes the formats), but set_routing needs 'which'.

Could we avoid such patterns, by either initializing the routing
manually here, or splitting the logic of ub913_set_routing() in two
functions, with common code called by ub913_set_routing() and
ub913_init_cfg() ? I think calling set functions from .init_cfg() opens
the door to abuses or just bugs, and I increasingly think it should be
discouraged. I know I've written quite a few drivers that call
.set_fmt() from .init_cfg() though, it does make things easier to some
extent, but I wonder if we could do better.

This leads to the question of where to initialize the hardware state,
which is the part of the set functions that is only executed in the
ACTIVE case. I don't think this should be done at probe time in general,
but at .s_stream() time. Only drivers that allow changing formats or
routing while streaming would need to perform any hardware configutation
in the set functions, and I'm not even sure we have a single driver in
the kernel that allows this (or, to be precise, if we have a single
driver that knowingly allows this, I'm sure we have a bunch of drivers
that don't prevent this situation and will crash or behave in other bad
ways if userspace tried to change the configuration while streaming).
Maybe we should split .set_fmt() and .set_routing() in two for these
very uncommon cases, with the hardware configuration moved to separate
functions ? It has the potential to simplify the set operations and make
them safer.

-- 
Regards,

Laurent Pinchart
