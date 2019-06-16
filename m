Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97AC747664
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2019 20:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbfFPS04 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jun 2019 14:26:56 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:32819 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbfFPS0z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jun 2019 14:26:55 -0400
X-Originating-IP: 5.91.106.249
Received: from uno.localdomain (unknown [5.91.106.249])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 088FB60003;
        Sun, 16 Jun 2019 18:26:36 +0000 (UTC)
Date:   Sun, 16 Jun 2019 20:27:43 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org,
        niklas soderlund <niklas.soderlund@ragnatech.se>,
        kieran bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: Route lifetime in SUBDEV_[GS]_ROUTING
Message-ID: <20190616182743.ewpndyfo7kngwwuk@uno.localdomain>
References: <20190417104147.zlmbw32dr46vmtrq@paasikivi.fi.intel.com>
 <20190423101932.gszkn4olqatoisde@uno.localdomain>
 <20190423132839.3rybeo4rolzu6cfb@kekkonen.localdomain>
 <20190522163349.n3qh6fgre4hj76sb@uno.localdomain>
 <20190616173820.GB5006@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sirn5co3vjmvukqx"
Content-Disposition: inline
In-Reply-To: <20190616173820.GB5006@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--sirn5co3vjmvukqx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,
    thanks for your reply.

On Sun, Jun 16, 2019 at 08:38:20PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> On Wed, May 22, 2019 at 06:33:49PM +0200, Jacopo Mondi wrote:
> > Hi Sakari,
> >   +cc Niklas, Laurent and Kieran, as I'm testing on a Renesas board
> >   setup
> >
> >    Let me add an example based on your smiapp multiplexed support patches
> > to describe how to model a CSI-2 multiplexed subdevice, such as an image
> > sensor.
> >
> > Also, regarding the stream_id semantic which sparkled this discussion, below
> > there's a proposal to remove it from the table completely, and use the VC
> > associated to a frame descriptor entry to identify streams on the receiver.
> >
> > Pardon the wall of text. I went in such a length writing this as I think we
> > need to describe a multiplexed subdevice layout model in the documentation,
> > and I wrote this hoping a good part could serve for that purpose.
> >
> > On Tue, Apr 23, 2019 at 04:28:40PM +0300, Sakari Ailus wrote:
> > > On Tue, Apr 23, 2019 at 12:19:32PM +0200, Jacopo Mondi wrote:
> > > > On Wed, Apr 17, 2019 at 01:41:48PM +0300, Sakari Ailus wrote:
> > > > > Hi Jacopo,
> > > > >
> > > > > I promised to write a bit about the routing problem I attempted to write on
> > > > > #v4l. It's a bit late, but here it is. Let me know if you share my
> > > > > understanding (and especially do so if you don't :)).
> > > >
> > > > Thanks for doing this, and sorry it took me a while to reply!
> > > >
> > > > > A route is identified by the source and sink pads as well as the stream ID
> > > > > on the source and the sink pads. Its flags allow enabling or disabling a
> > > > > route.
> > > > >
> > > > > Most devices that function as transmitters (such as sensors) have a fixed
> > > > > number of routes they can support. These's no need to change them; enabling
> > > > > and disabling them will be enough for the user.
> > > >
> > > > Fine so far.
> > > >
> > > > We indeed define routes as:
> > > > (sink pad - sink stream) -> (source pad - source stream)
> > > >
> > > > > For receivers this is different. What needs to be supported on the receiver
> > > > > side is directing any incoming stream (a 32-bit unsigned integer) to any
> > > > > source pad.
>
> You probably meant that implicitly, but to be explicit we also need to
> support routing the same incoming stream to multiple source pads (if the
> hardware supports so).
>

The current implementation allows that if I'm not wrong. See the below
example routing tables for the receiver as an example.

> > > > > This is because pads are not alike --- one may be connected to a block that
> > > > > further processes the image whereas the others may be connected to a DMA
> > > > > engine, just writing the data to memory.
> > > > >
> > > > > The receivers also may not make assumptions beyond the sub-device API: the
> > > > > stream is a 32-bit unsigned integer, there is currently no API requirement
> > > > > to have the stream IDs on a particular low integer range. In principle we
> > > > > could define that range, but I'd rather try to find better solutions than
> > > > > that: it's hard to come up with a number as it depends on the hardware.
> > > > > Some kind of an upper limit could be the number of CSI-2 channels
> > > > > multiplied by CSI-2 data types. That would be enough for CSI-2. 16 or 32
> > > > > virtual channels and up to 64 data types would mean up to 2048 routes
> > > > > between a demultiplexer's sink pad and *each* of its source pads. And this
> > > > > comes with an assumption that the source pads only support a single
> > > > > stream...
> >
> > Let's use smiapp with on top your patches from you vc branch.
> > The patches add a CSI-2 multiplexed subdevice connected to a pixel source
> > subdevice and an embedded data subdevice.
> >
> > In the below diagram:
> >
> > - a square box is an subdevice
> > - O is a pad
> > - (0, 0) is a pair of (pad_id, stream_id)
> >          in this case pad = 0, stream = 0
> >
> > Let's start
> >
> >
> > Image sensor
> >               CSI-2 mux                           CSI-2 recv (demux)
> >  (DT=0x1e) +------------+                       +------------------+
> >  +-+       |            |                       |                  |
> >  | O------>O (0, 0)     |                       |           (1, 0) O-->
> >  +-+       |            |                       |                  |
> >            |     (2, 0) |                       | (0, 0)           |
> >            |     (2, 1) |                       | (0, 1)    (2, 0) O-->
> >            |     (2, 2) O ----- CSI-2 BUS ----->O (0, 2)           |
> >            |     (2, 3) |                       | (0, 3)           |
> >  (DT=0x12) |            |                       |           (3, 0) O-->
> >  +-+       |            |                       |                  |
> >  | O------>O (1, 0)     |                       |                  |
> >  +-+       |            |                       |           (4, 0) O-->
> >            |            |                       |                  |
> >            +------------+                       +------------------+
> >
> > On the left hand side, a CSI-2 mux subdevice has two sink pads (#0 and
> > #1) where it receives pixel data (DT=0x1e) and embedded data (DT=0x12)
> > from other two subdevices. Together the three of them model an image
> > sensor, which produces pixel data and metadata, and multiplex them on
> > a CSI-2 bus (let's assume CSI-2 + D-PHY and limit the number of
> > possible VC to 4).
>
> I think this is over-complicated on the sensor side, especially the
> subdev that generates metadata. In practice metadata will be gathered
> from a variety of sources, and part of it may be generated as well (such
> as histogram data) from the image content. There's no independent piece
> of hardware separate from the pixel array that generates all the
> metadata.
>
> As explained in private, I think we need to split CSI-2 support in two
> parts. Virtual channels should be handled through stream multiplexing,
> with a routing API within subdevs. Data types should be handled through
> frame descriptors, to expose what data a frame carries. It will need an
> API on the transmitter side to configure generation of the data (it's
> not just about enabling or disabling data types, we will need other
> controls, for instance to control the number of lines of optical black,
> or to select the number of bins of the histogram) and an API on the
> receiver side to control DT filtering.
>
> VCs and DTs are two separate concepts in CSI-2, they're hierarchical,
> designed for two different purposes, and trying to blend them in a
> single API is asking for trouble. We'll end up with something overly
> complex and awkward to use. Let's also not forget that virtual channels
> are independent from each other and can be freely configured (with the
> limitation that they're carried over the same link and thus share the
> same clock rate, and can further be limited by the internal buffers in
> the CSI-2 transmitters and receivers), while data types just tag lines
> that are part of the same virtual channel, so those lines are related to
> each other, which comes with limitations on the line size for instance.
>

I agree with the considerations on the subdevice model: is complicated
to model a CSI-2 sensor with 3 subdevices, and the main reason for
that proposal was being able to selectively route different streams (which
in this case represent different data lines transported in a DT [*])
and because it is a 'better' (not perfect, as you pointed out)
representation of the hardware...

[*] I know this is not the most accurate terminology, but I cannot do
any better without repeating the word 'stream' several times :)

Let's take a step back then:
- a stream in the initial proposal maps to a DT. That's why modeling
  different data types as links directed to a sink pad of the CSI-2
  transmitter allowed to selectively enable/disable transmission of a
  DT using the routing API. Each stream has a stream_id assigned, and
  the stream_id is propagated from transmitter to receiver.
- Sakari noted (in the first email of this thread) that the semantic
  of the stream_id field was ambiugous, and in the end that modeling
  DT with stream_ids resulted in big routing tables, difficult to
  handle and to interpret.
- In my last email I proposed to remove any semantic from the
  stream_id in cross-entities operations, but to maintain DT handling
  modeled as routes to be enabled or disabled in the CSI-2
  transmitter. Re-reading it now, after confronting with you Sakari
  and other this would not fly, as it collapses DT demultiplexing on
  the receiver to VC demultiplexing.
- You're now suggesting to remove DT from the picture and handle them
  with a different API, possibly based on controls. I actually like
  this, as this woul allow to procede forward with the multiplexed
  series, with a few modifications along the lines of what was
  proposed in the last email. The subdevice model would be simplified
  and a 'stream' would actually just be the CSI-2 VC. Easy as pie, as
  long as we don't have to discuss how to handle DT :) Did I get you
  here?

> > The CSI-2 mux subdevice has a source pad (#2) with 4 streams, one per
> > each CSI-2 virtual channel. This is different from smiapp which is
> > simpler and has a single stream on the source pad, let's here assume
> > for the sake of this example that the CSI-2 multiplexer can freely
> > decide on which VC to send each of the two sink streams.
> >
> > The routing table, for the CSI-2 multiplexer will look like:
> >
> >              SINK            SOURCE
> >         (pad    stream)  (pad   stream)
> >         0       0         2     0
> >         0       0         2     1
> >         0       0         2     2
> >         0       0         2     3
> >         1       0         2     0
> >         1       0         2     1
> >         1       0         2     2
> >         1       0         2     3
> >
> > At device init time no route is active. Application could decide to route
> > pixel data on VC=0 and embedded data on VC=1 enabling routes
> > (0,0)->(2,0) and (1,0)->(2,1) through S_ROUTING:
>
> There are likely sensors that transmit image data and embedded data on
> separate virtual channels, but those abuse the CSI-2 specification, and
> are (hopefully ?) more an exception than a rule. We need to support
> them, but the main use case should be transmission of image data and
> embedded data over the same virtual channel. If you agree with my above
> reasoning, it also means over the same stream.

I see. I'm curious to know how you think DT demultiplexing
(like sending embedded data to a DMA-engine and image data to a
different one) would happen on the CSI-2 receiver, if streams will
only represent VC. That's the same issue my previous proposal had...

>
> >              SINK            SOURCE
> >         (pad    stream)  (pad   stream)
> >         0       0         2     0       ACTIVE
> >         0       0         2     1
> >         0       0         2     2
> >         0       0         2     3
> >         1       0         2     0
> >         1       0         2     1       ACTIVE
> >         1       0         2     2
> >         1       0         2     3
> >
> >
> > Now, on the receiver side.
> >
> > The CSI-2 demultiplexer has a single sink pad with 4 stream, one for
> > each VC it can receive data on, and 4 source pads, to direct each of
> > the VC to a different DMA engine or whatever lies behind it.
> >
> > It's -POSSIBLE- routing table will be quite big, and I won't report
> > it entirely here, but for each available stream on the sink pad (4)
> > there is a possible route to a source pad (4) for a total of 16 routes.
> >
> > How should the receiver compute its routing table? It fetches the
> > remote frame descriptor from the transmitter, which reports two
> > entries only (one for each active route)
> >
> >         frame_desc
> >         +---------------------------+
> >         | DT=0x1e, VC=0, stream_id=0|
> >         +---------------------------+
> >         | DT=0x12, VC=1, stream_id=1|
> >         +---------------------------+
>
> That's not a valid frame descriptor. VC 0 and VC 1 are transmitted over
> seperate frames, as CSI-2 handles framing at the CSI-2 level. We can't
> pretend they're part of the same frame.

The frame descriptor is fetched by the CSI-2 receiver from the
transmitter's single source pad. It will describe all the data
multiplexed on the CSI-2 link, which includes data sent on different
virtual channels.

Please note I'm not super-excited about extending the frame descriptor
to support describing CSI-2, as I still would like to be able to
negotiate parameters of the phy link, such as the number of data lanes
and the clock mode, as we discussed already. I would welcome a CSI-2
descriptor and leave the frame_descriptor alone, but I feel like even
if it's a bit an abuse, frame descriptor could serve the purpose, if
anyone (like Sakari how first proposed that) feels strong about
extending it instead of creating a new CSI-2 specific one. What's your
opinion here?

Thanks for your reply
   j


--sirn5co3vjmvukqx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl0Gih8ACgkQcjQGjxah
Vjx/XRAAjXT2Dh88GvE6DO7EW+PPzaFNXpg71TgKDwsOojWsny1aWd/p5yVr9OJ8
4tGA3RukvBMJM/NJb2wNq+mTJPlvD9ZKqzfUz5CD7rXNTR13sNbSyj/C8hrSW5cW
U0Zx8FnxwS8CrTzeUVjNjSkCtXu+ON7rL1Q0VQcKC36MHN13oSZmH/RFIFfE+f2+
jnQmHXohC3GmR+LNLLMhVObDu50mE5R0hlM1wk6Eug9JTaHR7QuoTZCBmJc+IC0Y
Zeti1NuZwciWiHe1L9hzSQqQVgsp3KJU5levWWM11UMWxGwRzI6m/k0sYPtF4uv7
yB2CO7aWssAgLM6gKLbXk3aUnuoOhxJRjywMpRcnRF6KOdHsHk6tEYfXqoVzero+
gwguml8acHXDAYIxOO9lZn6BYYmyYAtz93IohtBiUaOfMujvusfEKcwrMhVRqa0F
8UDrCy1V3OiIPsgu0W5Z+Gn++EeQgRCxWvVeLcnpCCyXZX3C7YFG9lKE6li5gCJ3
WUIVwaBqS0/hr7ZSEdPJLDxfv8lodcSXIFgUdJNtsvID9VFRhPloM2fh72RRt+xP
Z8Mn1gl9i0GRNBQUzlDwpPEIIsfBKEwk6CFGe/OFceLB97OIxPY0K96b0FemxDb5
aQCS27/TgZpinHxslYqO5ocyrdQRdNFqRHMMITZsa/pmoxd4DtA=
=M2Wp
-----END PGP SIGNATURE-----

--sirn5co3vjmvukqx--
