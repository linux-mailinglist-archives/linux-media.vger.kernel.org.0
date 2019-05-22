Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62F7A26856
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2019 18:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730034AbfEVQcy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 May 2019 12:32:54 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:50829 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729874AbfEVQcx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 May 2019 12:32:53 -0400
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 96E9F200014;
        Wed, 22 May 2019 16:32:46 +0000 (UTC)
Date:   Wed, 22 May 2019 18:33:49 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        niklas soderlund <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kieran bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: Route lifetime in SUBDEV_[GS]_ROUTING
Message-ID: <20190522163349.n3qh6fgre4hj76sb@uno.localdomain>
References: <20190417104147.zlmbw32dr46vmtrq@paasikivi.fi.intel.com>
 <20190423101932.gszkn4olqatoisde@uno.localdomain>
 <20190423132839.3rybeo4rolzu6cfb@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ufcj6upbyla7ocgx"
Content-Disposition: inline
In-Reply-To: <20190423132839.3rybeo4rolzu6cfb@kekkonen.localdomain>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ufcj6upbyla7ocgx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sakari,
  +cc Niklas, Laurent and Kieran, as I'm testing on a Renesas board
  setup

   Let me add an example based on your smiapp multiplexed support patches
to describe how to model a CSI-2 multiplexed subdevice, such as an image
sensor.

Also, regarding the stream_id semantic which sparkled this discussion, below
there's a proposal to remove it from the table completely, and use the VC
associated to a frame descriptor entry to identify streams on the receiver.

Pardon the wall of text. I went in such a length writing this as I think we
need to describe a multiplexed subdevice layout model in the documentation,
and I wrote this hoping a good part could serve for that purpose.

On Tue, Apr 23, 2019 at 04:28:40PM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Tue, Apr 23, 2019 at 12:19:32PM +0200, Jacopo Mondi wrote:
> > Hi Sakari,
> >
> > On Wed, Apr 17, 2019 at 01:41:48PM +0300, Sakari Ailus wrote:
> > > Hi Jacopo,
> > >
> > > I promised to write a bit about the routing problem I attempted to wr=
ite on
> > > #v4l. It's a bit late, but here it is. Let me know if you share my
> > > understanding (and especially do so if you don't :)).
> >
> > Thanks for doing this, and sorry it took me a while to reply!
> >
> > >
> > > A route is identified by the source and sink pads as well as the stre=
am ID
> > > on the source and the sink pads. Its flags allow enabling or disablin=
g a
> > > route.
> > >
> > > Most devices that function as transmitters (such as sensors) have a f=
ixed
> > > number of routes they can support. These's no need to change them; en=
abling
> > > and disabling them will be enough for the user.
> > >
> >
> > Fine so far.
> >
> > We indeed define routes as:
> > (sink pad - sink stream) -> (source pad - source stream)
> >
> > > For receivers this is different. What needs to be supported on the re=
ceiver
> > > side is directing any incoming stream (a 32-bit unsigned integer) to =
any
> > > source pad.
> > >
> > > This is because pads are not alike --- one may be connected to a bloc=
k that
> > > further processes the image whereas the others may be connected to a =
DMA
> > > engine, just writing the data to memory.
> > >
> > > The receivers also may not make assumptions beyond the sub-device API=
: the
> > > stream is a 32-bit unsigned integer, there is currently no API requir=
ement
> > > to have the stream IDs on a particular low integer range. In principl=
e we
> > > could define that range, but I'd rather try to find better solutions =
than
> > > that: it's hard to come up with a number as it depends on the hardwar=
e.
> > > Some kind of an upper limit could be the number of CSI-2 channels
> > > multiplied by CSI-2 data types. That would be enough for CSI-2. 16 or=
 32
> > > virtual channels and up to 64 data types would mean up to 2048 routes
> > > between a demultiplexer's sink pad and *each* of its source pads. And=
 this
> > > comes with an assumption that the source pads only support a single
> > > stream...
> >

Let's use smiapp with on top your patches from you vc branch.
The patches add a CSI-2 multiplexed subdevice connected to a pixel source
subdevice and an embedded data subdevice.

In the below diagram:

- a square box is an subdevice
- O is a pad
- (0, 0) is a pair of (pad_id, stream_id)
         in this case pad =3D 0, stream =3D 0

Let's start


Image sensor
              CSI-2 mux                           CSI-2 recv (demux)
 (DT=3D0x1e) +------------+                       +------------------+
 +-+       |            |                       |                  |
 | O------>O (0, 0)     |                       |           (1, 0) O-->
 +-+       |            |                       |                  |
           |     (2, 0) |                       | (0, 0)           |
           |     (2, 1) |                       | (0, 1)    (2, 0) O-->
           |     (2, 2) O ----- CSI-2 BUS ----->O (0, 2)           |
           |     (2, 3) |                       | (0, 3)           |
 (DT=3D0x12) |            |                       |           (3, 0) O-->
 +-+       |            |                       |                  |
 | O------>O (1, 0)     |                       |                  |
 +-+       |            |                       |           (4, 0) O-->
           |            |                       |                  |
           +------------+                       +------------------+

On the left hand side, a CSI-2 mux subdevice has two sink pads (#0 and
#1) where it receives pixel data (DT=3D0x1e) and embedded data (DT=3D0x12)
=66rom other two subdevices. Together the three of them model an image
sensor, which produces pixel data and metadata, and multiplex them on
a CSI-2 bus (let's assume CSI-2 + D-PHY and limit the number of
possible VC to 4).

The CSI-2 mux subdevice has a source pad (#2) with 4 streams, one per
each CSI-2 virtual channel. This is different from smiapp which is
simpler and has a single stream on the source pad, let's here assume
for the sake of this example that the CSI-2 multiplexer can freely
decide on which VC to send each of the two sink streams.

The routing table, for the CSI-2 multiplexer will look like:

             SINK            SOURCE
        (pad    stream)  (pad   stream)
        0       0         2     0
        0       0         2     1
        0       0         2     2
        0       0         2     3
        1       0         2     0
        1       0         2     1
        1       0         2     2
        1       0         2     3

At device init time no route is active. Application could decide to route
pixel data on VC=3D0 and embedded data on VC=3D1 enabling routes
(0,0)->(2,0) and (1,0)->(2,1) through S_ROUTING:

             SINK            SOURCE
        (pad    stream)  (pad   stream)
        0       0         2     0       ACTIVE
        0       0         2     1
        0       0         2     2
        0       0         2     3
        1       0         2     0
        1       0         2     1       ACTIVE
        1       0         2     2
        1       0         2     3


Now, on the receiver side.

The CSI-2 demultiplexer has a single sink pad with 4 stream, one for
each VC it can receive data on, and 4 source pads, to direct each of
the VC to a different DMA engine or whatever lies behind it.

It's -POSSIBLE- routing table will be quite big, and I won't report
it entirely here, but for each available stream on the sink pad (4)
there is a possible route to a source pad (4) for a total of 16 routes.

How should the receiver compute its routing table? It fetches the
remote frame descriptor from the transmitter, which reports two
entries only (one for each active route)

        frame_desc
        +---------------------------+
        | DT=3D0x1e, VC=3D0, stream_id=3D0|
        +---------------------------+
        | DT=3D0x12, VC=3D1, stream_id=3D1|
        +---------------------------+

=46rom the frame desc, the receiver would actually compute it's routing
table using the reported entries. This mean if no route is active on
the transmitter, no route will show up in the receiver.

Also, we can use the VC reported in frame_desc to identify the sink stream
id on the receiver, so [DT=3D0x1e, VC=3D0] will go to the receiver (0, 0) a=
nd
[DT=3D0x12, VC=3D1] will go to the receiver (0, 1).

This removes any semantic associated with the stream_id reported in the
frame_desc, as the stream_id value has only meaning inside a
subdevice (I would also say it could be dropped completely from frame_desc).

Assuming on the receiver all the sink streams can be directed to any
source pad, the routing table size would now be 8 (2 x 4). In general
the receiver routing table size will be:

        (#active_sink_stream * source_pads)

Of course, removing semantic from stream_id and using the VC
reported in the frame desc to identify the sink stream id on the
receiver implies that if both DT=3D0x1e and DT=3D0x12 are sent in the same
VC, they would be reported as a single stream in the receiver's
routing table. I -guess- this is fine, as demultiplexing between the sink
pad and the sources happens on VC, while if both pixels and embedded data
are sent on the same VC they would likely be directed to the same
DMA-engine to be demultiplexed by specialized user space, if that's
desired. If demultiplexing happens at CSI-2 receiver level, it
happens on VC, so it makes sense to expose a single route for a stream
which contains multiple DTs. This won't prevent the receiver driver to
setup the interface to filter those DTs opportunely, as they are anyway
reported on the frame descriptor entries. They would only be associated
together for the purpose of routing them to a source pad. Is my assumption
that this is acceptable correct?

Then, if we move to assume extensions to the CSI-2 VC number, such as when
using C-PHY, they could now range up to 32, and we indeed have a notable
increase of the size of both routing tables: 32 on transmitter side, and 64
on the receiver (assuming 2 active streams). These are indeed big numbers,
but I'm a bit skeptical about introducing volatile routes as this would
hide limitations of the routing abilities of the receiver. Let's suppose
VC=3D0 can only go to source pad #0, how would an application know that if
not by trying to enable a route from (0,0)->(1,0) (and then to (2,0) and
(3,0) and receive back errors?

Thanks, please pardon the wall of text
   j

PS
Last note: please note that the suggested "use VC to identify sink streams
on receiver" is actually what is implemented in the adv748x+rcar-csi2
multiplexed version in Niklas patches I have posted in my last v4. Those
patches still use the stream_id reported by the frame_desc entry to set
sink_stream, but in that setup it corresponds exactly to the virtual
channel. True that in that case the CSI-2 transmitter is quite trivial, as
it allows to direct a single stream (on one VC) to the receiver. With more
complex setups, like the one described above, where multiple streams could
be directed to different (or same) VC, the above described limitation of
having a single route per VC has to be considered.


> > I lost you here.
> >
> > My mental model was far more (too?) simple:
> >
> > - Routing tables inside an entity might have an arbitrary size, as how
> >   that configuration depends on the device and the driver
> >   implementation. As an example, the adv748x accepts 7 analogue
> >   inputs to chose from and route to a CSI-2 source pad.
> >   depending on the implementation, those 7 inputs could be modeled as
> >   7 pads with one stream each, or a single pad with 7 channels or
> >   whatever else, and I agree the 'stream_id' values range is totally
> >   up to the driver implementation -inside an entity-.
> >
> > - The cross-entity (sorry, I lack a better term here) multiplexing
> >   happens on physical bus that allows so, and I can only think of
> >   CSI-2 at the moment. Sure, you could share the lines of a parallel
> >   bus playing with enables/disables of the transmitters, but this
> >   is a custom hack that does not play well in this model.
> >   Each CSI-2 source pad has up to 4 streams (one per VC) and the
> >   content of those streams is retrieved from the transmitter by the
> >   receiver through the remote frame_desc operation [*], as receivers
> >   might need to be setup using to filter on particular VC/DT combinatio=
ns
> >   to receive the stream.
>
> Note that the concept of a "stream" is different in our proposed API and =
in
> CSI-2 (virtual channel): on CSI-2 virtual channels can carry multiple data
> types but in our definition they do not. That means there will be more
> streams on SUBDEV_[GS]_ROUTING API than there are on a CSI-2 bus.
>
> We also do not limit the use of the new API to old CSI-2 D-PHYs that
> only support four virtual channels. Therefore we need to think how this
> would work on 16 or 32 virtual channels, and preferrably not posing
> problems with larger numbers either.
>
> >
> > - Each CSI-2 receiver sink pad supports 4 streams (the CSI-2 VCs) and a=
ny
> >   of those streams can be directed to any of its source pads, to
> >   implement what you have described (one pad connected to an ISP-like
> >   device, on other to the DMA engine directly etc)
> >
> > - DT negotiation is still a bit vague. The example we have on the
> >   series (adv748x and r-car csi2) configure the receiver's accepted DT
> >   inspecting the remote frame_desc. Again, as per [*] this migh be
> >   limitied to 1 DT for VC, which might not be enough and would require
> >   re-thinking the operation used for the negotiation.
> >
> > - Configuring a multiplexed source pad image format is today not
> >   possible, the format is always propagated from the sink pad to which
> >   a route is enabled to the source pad. Might this be a limitation on
> >   how we control which DTs are multiplexed inside a VC and won't allow
> >   to model any format conversion that might happen at the source pad
> >   output. I was toying myself with the idea of a stream-aware set
> >   format operation for multiplexed source pads, not sure it might work
> >   though.
> >
> > Can I ask you why:
> > - you mention 16 or 32 VCs ? Each CSI-2 link supports up to 4.
>
> See above.
>
> > - you put DT in the routing mix, and I suspect it is here where our
> >   disconnection happens. I always assume DT configuration as a result
> >   of a format configuration operation, which currently has limitations
> >   as noted here above.
>
> Yes; DT comes from the format and is generally determined by the
> transmitting driver. Nothing else limits the number of DTs on a VC except
> the number of DTs --- which is currently 64.
>
> >
> >
> > [*] I would later like to talk about if this is the most appropriate
> > operation to handle this negotiation, as I'm not sure we can handle DT
> > negotiation properly with that, but that's for later.
> >
> > >
> > > CSI-2 receivers support a number of simultaneous streams, and as the =
stream
> > > is demultiplexed there, this means there will be as many source pads =
as
> > > there are supported simultaneous streams. This heavily depe`nds on the
> > > hardware, but the number could be e.g. 1, 4 or 8. Much smaller than 2=
048 in
> > > any case.
> > >
> >
> > Why 8? Is this related to DT multiplexing again?
>
> Yes and no. It's just a random number between 1 and 2048. :-)
>
> >
> > > Another option could be creating no routes at all at device init time=
, and
> > > letting the user create them. We could add a new flag for routes tell=
ing
> > > that a route is dynamic: disabling a dynamic route would simply delet=
e it.
> > > Likewise, a SUBDEV_G_ROUTING returning no routes (but no error either)
> > > would also tell the user only dynamic routes are supported.
> > >
> > > We should document this and change the driver implementation accordin=
gly.
> > > No API changes are needed (apart from adding the dynamic flag --- or =
rather
> > > call it "volatile", to avoid confusing with routes that can be enable=
d or
> > > disabled while streaming).
> > >
> >
> > I have v5 of the series ready. Do you want me to post it to progress
> > discussion, or should we clarify this first?
>
> Feel free to post it. But to merge the series, I think we need to address
> this.
>
> --
> Regards,
>
> Sakari Ailus
> sakari.ailus@linux.intel.com

--ufcj6upbyla7ocgx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlzleecACgkQcjQGjxah
VjxfEg//SX+WuLq3oOwZlC1krse8S2vlA0lj7nd0jom8y1eV2k+IpZVGnlXLqKoN
JMI7pO2uljieCFCpI2yYYjijaVisfGUpo1fX33wA/qM7a/G+hGLm8KGE0N4hF2x4
NuPubh12d0A6277mftyqts/O5yLPmTFXzei11a3LISvMHBI4YIloo1utDDVFN+5l
BFvxCbDdXG3epaPfCGm2SBTMQOdAfaQi5ckQLO4ham6FvMYdIx45lBDYEMI6G708
7kMuzeve3B5SDf4NZC2FpavyCJpL6U6aejUa66pTgbp3CFaTTmennZVuo37d6boD
1NWFXKC18bfGA2NqdfOXFxSo2yt6YtEv3eRxcxuQIkUVLOLr01xefnMinMURSOvi
dj2mPa/MEya8ECayCkTXDwMZ3x/xzUzOj+NDl/ytkrpWysqDkxDyCawnQx3UxuUE
ZYOIwpuz5A5GnxvnhKHoCo2n0VCglUGa3Xrlngzt2t2cJO/eGJY9v+MfdMF38pmM
Rc+11dBul8bAeUlw6P6Y6IA4CNhy7f53MI1yy9JH9Wa8F/d3Om7VMOozkL0NnWVg
pO7WirplDtzRt6aaUD+K7bSQZGK55afTbSX1+NdbhnMf+B3bN7Wuhwj7WRQdfaRG
lYUvhUPgX65IsrHR23F0mvagsa384gEOord9E0sk2hQrWIcGkJM=
=0iF7
-----END PGP SIGNATURE-----

--ufcj6upbyla7ocgx--
