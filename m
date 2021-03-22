Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72E673443A9
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 13:55:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231365AbhCVMxZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 08:53:25 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:60287 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232118AbhCVMvS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 08:51:18 -0400
X-Originating-IP: 82.63.7.72
Received: from uno.localdomain (host-82-63-7-72.business.telecomitalia.it [82.63.7.72])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 1D170E0010;
        Mon, 22 Mar 2021 12:51:12 +0000 (UTC)
Date:   Mon, 22 Mar 2021 13:51:44 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/19] media: v4l2-subdev: De-deprecate init() subdev
 op
Message-ID: <20210322125144.xd4yky6jmaw56x4a@uno.localdomain>
References: <20210319164148.199192-1-jacopo+renesas@jmondi.org>
 <20210319164148.199192-6-jacopo+renesas@jmondi.org>
 <YFYX1KHi74XPEWLi@pendragon.ideasonboard.com>
 <20210321205256.GE3@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210321205256.GE3@valkosipuli.retiisi.eu>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Sun, Mar 21, 2021 at 10:52:56PM +0200, Sakari Ailus wrote:
> Hi Laurent and Jacopo,
>
> Thanks for cc'ing me.
>
> On Sat, Mar 20, 2021 at 05:42:12PM +0200, Laurent Pinchart wrote:
> > Hi Jacopo,
> >
> > Thank you for the patch.
> >
> > CC'ing Sakari on v3 to get feedback.
> >
> > On Fri, Mar 19, 2021 at 05:41:34PM +0100, Jacopo Mondi wrote:
> > > The init() subdev core operation is deemed to be deprecated for new
> > > subdevice drivers. However it could prove useful for complex
> > > architectures to defer operation that require access to the
> > > communication bus if said bus is not available (or fully configured)
> > > at the time when the subdevice probe() function is run.
> > >
> > > As an example, the GMSL architecture requires the GMSL configuration
> > > link to be configured on the host side after the remote subdevice
> > > has completed its probe function. After the configuration on the host
> > > side has been performed, the subdevice registers can be accessed through
> > > the communication bus.
>
> What does the remote device's probe do that needs to be done before bus
> config on the host side?

A few lines here below:

 In the GMSL use case the bus configuration requires the enablement of the
 noise immunity threshold on the remote side which ensures reliability
 of communications in electrically noisy environments. After the subdevice
 has enabled the threshold at the end of its probe() sequence the host
 side shall compensate it with an higher signal amplitude. Once this
 sequence has completed the bus can be accessed with noise protection
 enabled and all the operations that require a considerable number of
 transactions on the bus (such as the image sensor configuration
 sequence) are run in the subdevice init() operation implementation.

>
> Alternatively, could the remote init() work be done at the time streaming
> is started?

That would require programing the sensor, the embedded ISP at s_stream
time which would take some time.

I'll take this suggestion into account though and run some more tests.

Thanks
  j

>
> > >
> > > In particular:
> > >
> > > 	HOST			REMOTE
> > >
> > > 	probe()
> > > 	   |
> > > 	   ---------------------> |
> > > 				  probe() {
> > > 				     bus config()
> > > 				  }
> > > 	   |<--------------------|
> > > 	v4l2 async bound {
> > > 	    bus config()
> > > 	    call subdev init()
> > > 	   |-------------------->|
> > > 				 init() {
> > > 				     access register on the bus()
> > > 				}
> > > 	   |<-------------------
> > > 	}
> > >
> > > In the GMSL use case the bus configuration requires the enablement of the
> > > noise immunity threshold on the remote side which ensures reliability
> > > of communications in electrically noisy environments. After the subdevice
> > > has enabled the threshold at the end of its probe() sequence the host
> > > side shall compensate it with an higher signal amplitude. Once this
> > > sequence has completed the bus can be accessed with noise protection
> > > enabled and all the operations that require a considerable number of
> > > transactions on the bus (such as the image sensor configuration
> > > sequence) are run in the subdevice init() operation implementation.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > ---
> > >  include/media/v4l2-subdev.h | 15 ++++++++++++---
> > >  1 file changed, 12 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > > index d0e9a5bdb08b..3068d9940669 100644
> > > --- a/include/media/v4l2-subdev.h
> > > +++ b/include/media/v4l2-subdev.h
> > > @@ -148,9 +148,18 @@ struct v4l2_subdev_io_pin_config {
> > >   *	each pin being configured.  This function could be called at times
> > >   *	other than just subdevice initialization.
> > >   *
> > > - * @init: initialize the sensor registers to some sort of reasonable default
> > > - *	values. Do not use for new drivers and should be removed in existing
> > > - *	drivers.
> > > + * @init: initialize the subdevice registers to some sort of reasonable default
> > > + *	values. Do not use for new drivers (and should be removed in existing
> > > + *	ones) for regular architectures where the image sensor is connected to
> > > + *	the host receiver. For more complex architectures where the subdevice
> > > + *	initialization should be deferred to the completion of the probe
> > > + *	sequence of some intermediate component, or the communication bus
> > > + *	requires configurations on the host side that depend on the completion
> > > + *	of the probe sequence of the remote subdevices, the usage of this
> > > + *	operation could be considered to allow the devices along the pipeline to
> > > + *	probe and register in the media graph and to defer any operation that
> > > + *	require actual access to the communication bus to their init() function
> > > + *	implementation.
> > >   *
> > >   * @load_fw: load firmware.
> > >   *
>
> --
> Kind regards,
>
> Sakari Ailus
