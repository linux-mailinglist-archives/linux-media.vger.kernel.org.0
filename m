Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBEE23A5F55
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 11:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232774AbhFNJrF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 05:47:05 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:16155 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232658AbhFNJrF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 05:47:05 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 6DF0B240018;
        Mon, 14 Jun 2021 09:44:58 +0000 (UTC)
Date:   Mon, 14 Jun 2021 11:45:48 +0200
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
Message-ID: <20210614094548.ufd6qczjj5zpkbfb@uno.localdomain>
References: <20210412093451.14198-1-jacopo+renesas@jmondi.org>
 <20210412093451.14198-17-jacopo+renesas@jmondi.org>
 <2ad9747e-7e2d-2c95-a98b-b6b0e7534e42@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2ad9747e-7e2d-2c95-a98b-b6b0e7534e42@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,
   thanks for your reply

On Mon, Jun 14, 2021 at 10:51:25AM +0200, Hans Verkuil wrote:
> On 12/04/2021 11:34, Jacopo Mondi wrote:
> > The init() subdev core operation is deemed to be deprecated for new
> > subdevice drivers. However it could prove useful for complex
> > architectures to defer operation that require access to the
> > communication bus if said bus is not available (or fully configured)
> > at the time when the subdevice probe() function is run.
> >
> > As an example, the GMSL architecture requires the GMSL configuration
> > link to be configured on the host side after the remote subdevice
> > has completed its probe function. After the configuration on the host
> > side has been performed, the subdevice registers can be accessed through
> > the communication bus.
> >
> > In particular:
> >
> > 	HOST			REMOTE
> >
> > 	probe()
> > 	   |
> > 	   ---------------------> |
> > 				  probe() {
> > 				     bus config()
> > 				  }
> > 	   |<--------------------|
> > 	v4l2 async bound {
> > 	    bus config()
> > 	    call subdev init()
> > 	   |-------------------->|
> > 				 init() {
> > 				     access register on the bus()
> > 				}
> > 	   |<-------------------
> > 	}
> >
> > In the GMSL use case the bus configuration requires the enablement of the
> > noise immunity threshold on the remote side which ensures reliability
> > of communications in electrically noisy environments. After the subdevice
> > has enabled the threshold at the end of its probe() sequence the host
> > side shall compensate it with an higher signal amplitude. Once this
> > sequence has completed the bus can be accessed with noise protection
> > enabled and all the operations that require a considerable number of
> > transactions on the bus (such as the image sensor configuration
> > sequence) are run in the subdevice init() operation implementation.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  include/media/v4l2-subdev.h | 15 ++++++++++++---
> >  1 file changed, 12 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index d0e9a5bdb08b..3068d9940669 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -148,9 +148,18 @@ struct v4l2_subdev_io_pin_config {
> >   *	each pin being configured.  This function could be called at times
> >   *	other than just subdevice initialization.
> >   *
> > - * @init: initialize the sensor registers to some sort of reasonable default
> > - *	values. Do not use for new drivers and should be removed in existing
> > - *	drivers.
> > + * @init: initialize the subdevice registers to some sort of reasonable default
> > + *	values. Do not use for new drivers (and should be removed in existing
> > + *	ones) for regular architectures where the image sensor is connected to
> > + *	the host receiver. For more complex architectures where the subdevice
> > + *	initialization should be deferred to the completion of the probe
> > + *	sequence of some intermediate component, or the communication bus
> > + *	requires configurations on the host side that depend on the completion
> > + *	of the probe sequence of the remote subdevices, the usage of this
> > + *	operation could be considered to allow the devices along the pipeline to
> > + *	probe and register in the media graph and to defer any operation that
> > + *	require actual access to the communication bus to their init() function
> > + *	implementation.
>
> I don't like de-deprecating init. It was deprecated for a good reason, and
> I'd like to keep it that way.

I see, fair enough :)

>
> There are two alternatives: one is a bit quick-and-dirty, the other is a hint
> towards a more generic solution (just a hint since it will require more research):
>
> 1) Quick-and-dirty: use the core callback op to create a custom INIT callback.
> This depends on this patch:
>
> https://patchwork.linuxtv.org/project/linux-media/patch/20210610214305.4170835-8-arnd@kernel.org/
>
> This will make it clear to the reader that this is a highly specific interaction
> between two drivers that are tightly coupled. It works in the current situation,
> but not if we want to make this more generic.

Depends what you mean with 'generic' :) I think such a solution would
slightly abuse a generic API like 'command' is, but the GMSL
deserializers/serializers are tighly coupled by definition, so this is
less a concern, as long as we have a single driver for the whole
camera module. If we're going to split it in 3 subdev drivers then
yes, they will all have to implement .command() and they can be used
with in isolation with a generic receiver driver.

>
> 2) Subdev drivers can implement the registered() op which is called by
> v4l2_device_register_subdev(). This in turn is called from v4l2_async_match_notify().
>
> What you want is that when max9286 calls v4l2_async_subdev_notifier_register, it
> can set a flag or something indicating that initialization has to be postponed.
> Then, when v4l2_async_match_notify() calls the register() callback, that flag can
> be read. If false, then the register() callback will initialize the device, if
> true then that won't happen. Instead, it will do that when the max9286 calls a
> post_register() callback.

2 questions to help me better understand this:
1) s/register()/registered() in this paragraph ?
2) $ git grep post_register drivers/media/ include/media/
   gives me back nothing.

   Are you suggesting a new operation ?

Thanks
   j

>
> This is a lot more work (and research, since this is just a brainstorm from my
> side), but it is a way towards making this a generic solution.
>
> Regards,
>
> 	Hans
>
> >   *
> >   * @load_fw: load firmware.
> >   *
> > --
> > 2.31.1
> >
>
