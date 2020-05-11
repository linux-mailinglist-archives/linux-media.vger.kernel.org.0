Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 703191CD868
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 13:29:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729732AbgEKL33 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 07:29:29 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:38711 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729610AbgEKL33 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 07:29:29 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id DE5671C0007;
        Mon, 11 May 2020 11:29:23 +0000 (UTC)
Date:   Mon, 11 May 2020 13:32:39 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/6] media: v4l2-subdv: Introduce get_mbus_config pad
 op
Message-ID: <20200511113239.dlbmr5gi7itjz6g4@uno.localdomain>
References: <20200415105004.2497356-1-jacopo+renesas@jmondi.org>
 <20200415105004.2497356-2-jacopo+renesas@jmondi.org>
 <20200420014457.GA15673@pendragon.ideasonboard.com>
 <20200429135430.GH9190@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200429135430.GH9190@paasikivi.fi.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari, Laurent,

On Wed, Apr 29, 2020 at 04:54:30PM +0300, Sakari Ailus wrote:
> Hi Laurent,
>
> On Mon, Apr 20, 2020 at 04:44:57AM +0300, Laurent Pinchart wrote:
> > Hi Jacopo,
> >
> > Thank you for the patch.
> >
> > On Wed, Apr 15, 2020 at 12:49:58PM +0200, Jacopo Mondi wrote:
> > > Introduce a new pad operation to allow retrieving the media bus
> > > configuration on a subdevice pad.
> > >
> > > The newly introduced operation reassembles the s/g_mbus_config video
> > > operation, which have been on their way to be deprecated since a long
> > > time.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > ---
> > >  include/media/v4l2-subdev.h | 69 +++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 69 insertions(+)
> > >
> > > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > > index a4848de59852..fc16af578471 100644
> > > --- a/include/media/v4l2-subdev.h
> > > +++ b/include/media/v4l2-subdev.h
> > > @@ -350,6 +350,71 @@ struct v4l2_mbus_frame_desc {
> > >  	unsigned short num_entries;
> > >  };
> > >
> > > +/**
> > > + * struct v4l2_mbus_parallel_config - parallel mbus configuration
> > > + * @hsync_active: hsync active state: 1 for high, 0 for low
> > > + * @vsync_active: vsync active state: 1 for high, 0 for low
> > > + * @pclk_rising: pixel clock active edge: 1 for rising, 0 for falling
> >
> > Is this for the driving side or the sampling side ?
>
> Is there a difference? I'd expect the configuration needs to be the same on
> both sides.

I was puzzled as well by this question, mostly because I never found
anything like this in the existing documentation, but actually yes,
the driving side clocks out data on one edge, sampling side samples on
the opposite one ? Is this what you meant Laurent ?

To me this has always been about sampling side though, and the setting
should match on both endpoints of course.

>
> >
> > > + * @data_active: data lines active state: 1 for high, 0 for low
> >
> > I wonder, is there any system with active low data lines ?

As this is part of the standard DT properties for video interfaces, I
added it here.

> >
> > > + */
> > > +struct v4l2_mbus_parallel_config {
> >
> > Is this intended to cover BT.656 too ? Either way I think it should be
> > documented.
>
> I think we should replace what directly refers to Bt.601 with something
> that refers to that, and not "parallel". Both are parallel after all. I
> think the naming is in line with that, assuming this covers both.
>

Currently in v4l2-fwnode BT.656 is selected if no vertical/horizontal
synch and field flags are specified. This implies the following DT
properties are shared between BT.601 and BT.656:
- pclk-sample
- data-active
- slave-mode
- bus-width
- data-shift
- sync-on-green-active
- data-enable-active

with
- hsync-active
- vsync-active
- field-even-active
being BT.601 only.

We could do here do the same and mention which flags apply to 601
only, or more clearly split the config structure by keeping a generic
'parallel' flag structure, with a sub-structure which is 601 specific.
I'm not sure it's worth the extra layer of indirection though.


> >
> > > +	unsigned int hsync_active : 1;
> > > +	unsigned int vsync_active : 1;
> > > +	unsigned int pclk_rising : 1;
> > > +	unsigned int data_active : 1;
> >
> > Shouldn't we reuse the V4L2_MBUS_* flags, given that they're also used
> > in v4l2_fwnode_bus_parallel ? While the v4l2_mbus_config structure is
>
> I'd think it's easier to work with fields in drivers than the flags. This

I find it easier and less error prone to work with fields as well,
provided the space occupation is the same as working with flags.

> isn't uAPI so we don't need to think the ABI. The change could also be done
> to struct v4l2_fwnode_bus_parallel.
>
> > getting deprecated, it doesn't mean we can reuse the same flags if they
> > make sense. Otherwise we'll have to translate between
> > v4l2_fwnode_bus_parallel.flags and the fields here. Ideally

Right, I agree this is not desirable. Every driver should inspect the
fwnode properties and translate to this new config when queryed
through get_mbus_format.

> > v4l2_fwnode_bus_parallel should be replaced with
> > v4l2_mbus_parallel_config (once we add additional fields).

I like this idea

We could indeed expand the .flags structure of v4l2_fwnode_bus_parallel

struct v4l2_fwnode_bus_parallel {
	unsigned int flags;
	unsigned char bus_width;
	unsigned char data_shift;
};

but then we should replace the whole structure.

All in all, working with the same set of flags is the less disruptive
change and would not require translations in drivers... I'm not a fan,
but currently seems the easiest way forward...

What do you think ?

>
> ...
>
> --
> Kind regards,
>
> Sakari Ailus
