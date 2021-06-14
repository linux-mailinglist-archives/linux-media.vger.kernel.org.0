Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42E603A69E6
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 17:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233427AbhFNPTS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 11:19:18 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:57663 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233299AbhFNPTR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 11:19:17 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id A6A5EE0009;
        Mon, 14 Jun 2021 15:17:09 +0000 (UTC)
Date:   Mon, 14 Jun 2021 17:17:59 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v4 16/17] media: v4l2-subdev: De-deprecate init() subdev
 op
Message-ID: <20210614151759.xwlqaixui6ylcw5p@uno.localdomain>
References: <20210412093451.14198-1-jacopo+renesas@jmondi.org>
 <20210412093451.14198-17-jacopo+renesas@jmondi.org>
 <2ad9747e-7e2d-2c95-a98b-b6b0e7534e42@xs4all.nl>
 <20210614094548.ufd6qczjj5zpkbfb@uno.localdomain>
 <07c42c41-138a-7e48-a320-4a9e8873a168@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <07c42c41-138a-7e48-a320-4a9e8873a168@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi again Hans,
   I pondered a bit on your suggestion and I leave these here as
a potential discussion starter

On Mon, Jun 14, 2021 at 11:55:30AM +0200, Hans Verkuil wrote:
> On 14/06/2021 11:45, Jacopo Mondi wrote:
> > Hi Hans,
> >    thanks for your reply
> >
> > On Mon, Jun 14, 2021 at 10:51:25AM +0200, Hans Verkuil wrote:
> >> On 12/04/2021 11:34, Jacopo Mondi wrote:
> >>> The init() subdev core operation is deemed to be deprecated for new
> >>> subdevice drivers. However it could prove useful for complex
> >>> architectures to defer operation that require access to the
> >>> communication bus if said bus is not available (or fully configured)
> >>> at the time when the subdevice probe() function is run.
> >>>
> >>> As an example, the GMSL architecture requires the GMSL configuration
> >>> link to be configured on the host side after the remote subdevice
> >>> has completed its probe function. After the configuration on the host
> >>> side has been performed, the subdevice registers can be accessed through
> >>> the communication bus.
> >>>
> >>> In particular:
> >>>
> >>> 	HOST			REMOTE
> >>>
> >>> 	probe()
> >>> 	   |
> >>> 	   ---------------------> |
> >>> 				  probe() {
> >>> 				     bus config()
> >>> 				  }
> >>> 	   |<--------------------|
> >>> 	v4l2 async bound {
> >>> 	    bus config()
> >>> 	    call subdev init()
> >>> 	   |-------------------->|
> >>> 				 init() {
> >>> 				     access register on the bus()
> >>> 				}
> >>> 	   |<-------------------
> >>> 	}
> >>>
> >>> In the GMSL use case the bus configuration requires the enablement of the
> >>> noise immunity threshold on the remote side which ensures reliability
> >>> of communications in electrically noisy environments. After the subdevice
> >>> has enabled the threshold at the end of its probe() sequence the host
> >>> side shall compensate it with an higher signal amplitude. Once this
> >>> sequence has completed the bus can be accessed with noise protection
> >>> enabled and all the operations that require a considerable number of
> >>> transactions on the bus (such as the image sensor configuration
> >>> sequence) are run in the subdevice init() operation implementation.
> >>>
> >>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >>> ---
> >>>  include/media/v4l2-subdev.h | 15 ++++++++++++---
> >>>  1 file changed, 12 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> >>> index d0e9a5bdb08b..3068d9940669 100644
> >>> --- a/include/media/v4l2-subdev.h
> >>> +++ b/include/media/v4l2-subdev.h
> >>> @@ -148,9 +148,18 @@ struct v4l2_subdev_io_pin_config {
> >>>   *	each pin being configured.  This function could be called at times
> >>>   *	other than just subdevice initialization.
> >>>   *
> >>> - * @init: initialize the sensor registers to some sort of reasonable default
> >>> - *	values. Do not use for new drivers and should be removed in existing
> >>> - *	drivers.
> >>> + * @init: initialize the subdevice registers to some sort of reasonable default
> >>> + *	values. Do not use for new drivers (and should be removed in existing
> >>> + *	ones) for regular architectures where the image sensor is connected to
> >>> + *	the host receiver. For more complex architectures where the subdevice
> >>> + *	initialization should be deferred to the completion of the probe
> >>> + *	sequence of some intermediate component, or the communication bus
> >>> + *	requires configurations on the host side that depend on the completion
> >>> + *	of the probe sequence of the remote subdevices, the usage of this
> >>> + *	operation could be considered to allow the devices along the pipeline to
> >>> + *	probe and register in the media graph and to defer any operation that
> >>> + *	require actual access to the communication bus to their init() function
> >>> + *	implementation.
> >>
> >> I don't like de-deprecating init. It was deprecated for a good reason, and
> >> I'd like to keep it that way.
> >
> > I see, fair enough :)
> >
> >>
> >> There are two alternatives: one is a bit quick-and-dirty, the other is a hint
> >> towards a more generic solution (just a hint since it will require more research):
> >>
> >> 1) Quick-and-dirty: use the core callback op to create a custom INIT callback.
> >> This depends on this patch:
> >>
> >> https://patchwork.linuxtv.org/project/linux-media/patch/20210610214305.4170835-8-arnd@kernel.org/
> >>
> >> This will make it clear to the reader that this is a highly specific interaction
> >> between two drivers that are tightly coupled. It works in the current situation,
> >> but not if we want to make this more generic.
> >
> > Depends what you mean with 'generic' :) I think such a solution would
> > slightly abuse a generic API like 'command' is, but the GMSL
> > deserializers/serializers are tighly coupled by definition, so this is
> > less a concern, as long as we have a single driver for the whole
> > camera module. If we're going to split it in 3 subdev drivers then
> > yes, they will all have to implement .command() and they can be used
> > with in isolation with a generic receiver driver.
> >
> >>
> >> 2) Subdev drivers can implement the registered() op which is called by
> >> v4l2_device_register_subdev(). This in turn is called from v4l2_async_match_notify().
> >>
> >> What you want is that when max9286 calls v4l2_async_subdev_notifier_register, it
> >> can set a flag or something indicating that initialization has to be postponed.
> >> Then, when v4l2_async_match_notify() calls the register() callback, that flag can
> >> be read. If false, then the register() callback will initialize the device, if
> >> true then that won't happen. Instead, it will do that when the max9286 calls a
> >> post_register() callback.
> >
> > 2 questions to help me better understand this:
> > 1) s/register()/registered() in this paragraph ?
>
> Yes, sorry.
>
> > 2) $ git grep post_register drivers/media/ include/media/
> >    gives me back nothing.
> >
> >    Are you suggesting a new operation ?
>
> Yes, that would be a new op.

Thanks for the clarification. Let me start this by setting up the
goals I would like to reach:

- Conditionally allow to run later parts of the probe/initialization
  routine of a subdevice: a subdevice driver should be made capable to
  post-pone the execution of parts (if not all) of its
  probe/initialization routines to a later point in time, in example,
  when all other subdevices on the same bus have been probed.

  In the context of the use case at hand (GMSL) this means deferring
  the completion of the camera devices initialization sequence that
  heavily access the i2c-over-GMSL channel to a later time when all
  others camera modules have probed and have enabled their high-noise
  immunity so that the deserializer can now increase the channel signal
  amplitude.

- Initialization deferring should be made conditional so that when
  used when host receivers that has not deferring requirements the
  subdevice drivers work without changes

Implementing such a solution requires two mechanisms in place:
A) A way to discern if initialization should be deferred
b) A callback mechanism that automatically executes at the end of the
   probe sequences

In detail:

A)
Can be made protocol dependent. I haven't been able to figure out a
generic way for a host receiver to set a flag on the subdev to be
inspected at probe/registered() time. Assuming such a generic mechanism
does not exist, a per-use-case solution can be considered. In example
for GMSL we have a deserializer property that specifies the initial
amplitude of the control channel. If it's lower that a certain
threshold it has to be increased at 'complete' time. The property can
be duplicated on the camera module side such that:
- If the channel amplitude is low, we know initialization should be
  post-poned
- If it's high already (or not present for non-GMSL use case)
  initialization can be performed at probe() time.

This is a very good match for GMSL. The initial deserializer channel
amplitude only depend on the connected camera module. In example
RDACM20 comes pre-programmed by an on-board MCU such that the deser
can be started with high amplitude and the camera module can be
programmed at probe() time. RDACM21 requires the deser to be started
with low amp, all camera modules have to complete probe and enable
their noise threshold so that the deser amplitude can be increased.
The only drawback I see is that the same property should be specified
in both endpoints. This happens already, in example, for the media bus
configuration endpoint properties.

B)
The registered() internal callback is executed immediately once the
async subdev has been matched against a notifier. For the use case at
hand it is not useful as it does not allow to return control to the
host driver before calling into the subdev.  The "right" time to
trigger deferred initialization could be once the whole chain of async
subdev and notifiers has completed, and we already have notifier ops
complete() callback for that purpose, only executed on the root
notifier. Adding a 'complete()' internal operation to be called on the
list of the top v4l2_dev subdevices at the same time (or replace the
complete notifier operation completely) might a good way forward ?

Sorry for the long email, it mostly served me to clarify my thoughts.

Thanks
   j

>
> Regards,
>
> 	Hans
>
> >
> > Thanks
> >    j
> >
> >>
> >> This is a lot more work (and research, since this is just a brainstorm from my
> >> side), but it is a way towards making this a generic solution.
> >>
> >> Regards,
> >>
> >> 	Hans
> >>
> >>>   *
> >>>   * @load_fw: load firmware.
> >>>   *
> >>> --
> >>> 2.31.1
> >>>
> >>
>
