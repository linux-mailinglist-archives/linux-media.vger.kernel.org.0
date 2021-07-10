Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E809F3C33BF
	for <lists+linux-media@lfdr.de>; Sat, 10 Jul 2021 10:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232004AbhGJIok (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 10 Jul 2021 04:44:40 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:35195 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231877AbhGJIok (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Jul 2021 04:44:40 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 66E3E1C0003;
        Sat, 10 Jul 2021 08:41:51 +0000 (UTC)
Date:   Sat, 10 Jul 2021 10:42:39 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [PATCH v7 00/27] v4l: subdev internal routing and streams
Message-ID: <20210710084239.rgksudxtrrocufuc@uno.localdomain>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
 <YLwReuwLm7S/4hgz@pendragon.ideasonboard.com>
 <20210709151821.ogra3s2ulnsvkyqa@uno.localdomain>
 <9b6ce019-8e38-886a-0c61-6f437ca9a915@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9b6ce019-8e38-886a-0c61-6f437ca9a915@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,
   thanks for you reply

On Fri, Jul 09, 2021 at 09:26:03PM +0300, Tomi Valkeinen wrote:
> Hi Jacopo,
>
> On 09/07/2021 18:18, Jacopo Mondi wrote:
> > Hi Tomi, Laurent,
> >
> > On Sun, Jun 06, 2021 at 03:06:18AM +0300, Laurent Pinchart wrote:
> > > Hi Hans, Sakari,
> > >
> > > We need your feedback on this series, at least on the general approach.
> > > There are quite a few issues to be addressed, and it makes no sense to
> > > invest time in this if you don't think this is a good direction.
> > >
> > > If anyone else wants to give feedback, speak now or forever hold your
> > > peace :-)
> >
> > Since you ask...
> >
> > Having been involved a bit as the n-th person that tried to bring this
> > to completion I spent a bit of time trying to recollect how the
> > previous approach worked and how it compares to this one. Sorry if
> > this goes in length.
> >
> > I share Tomi's concern on one part of the previous version:
> >
> > - The resulting device topology gets complicated in a non-trivial way.
> >
> >    The typical example of having to model one image sensor that sends
> >    embedded data and images with three sub-devices speaks for itself, I
> >    presume.
> >
> >    However in one way, I feel like this is somehow correct and provides
> >    a more accurate representation of the actual sensor architecture.
> >    Splitting a sensor into components would allow to better handle
> >    devices which supports multiple buses (typically CSI-2 and
> >    parallel) through the internal routing tables, and allows
> >    better control of the components of the image sensor. [1]
>
> I'm not sure what kind of setup you mean, but nothing prevents you from
> splitting devices into multiple subdevs with the new approach if it makes
> sense on your HW.

Nothing prevents it it from being done today, my point was that having
to do so to support mulitplexed streams is an incentive to get to a
more precise representation of the sensor architecture, not only a
cons :)

>
> I have a parallel sensor that provides metadata on a line before the actual
> frame. I have hard time understanding why that should be split into 3
> subdevs.
>

As I guess there's no way to extract that line of embedded data if not
from the frame when already in memory, I won't consider this the best
example of a multiplexed bus :)

> > - Multiplexed source pads do not accept a format or any other configuration
> >    like crop/composing. Again this might seem odd, and it might be
> >    worth considering if those pads shouldn't be made 'special' somehow,
> >    but I again think it models a multiplexed bus quite accurately,
> >    doesn't it ? It's weird that the format of, in example, a CSI-2
> >    receiver source pad has to be propagated from the image sensor
> >    entity sink pad, crossing two entities, two routes and one
> >    media link. This makes rather complex to automate format propagation along
> >    pipelines, not only when done by abusing media-ctl like most people do,
> >    but also when done programmatically the task is not easy (I know I'm
> >    contradicting my [1] point here :)
>
> Hmm, but is it easy in the kernel side, then? I didn't feel so with the
> previous version. The kernel needed to travel the graph back and forth "all
> the time", just to figure out what's going on and where.

Not for the core. You see the patch I referenced, I praise Sakari for
getting there, the validation is indeed complex.

I mean that for drivers it would be easier as the routing management
is separate from format management, and drivers do not have to match
endpoints by the format they have applied to infer routes.

>
> If the userspace understands the HW topology (as it more or less must), and
> it configures the routes (as it has to), and sets the formats on certain
> subdevs, then I don't see that it would have any issues in propagating the
> formats.
>

As I've said the fact that setting up a route is accomplished by
setting the same format on two endpoints feels like a layer violation.
For userspace traversing a route means matching the formats on a
possibly high number of {pad, stream} pairs. It won't be easy without
a dedicated API and feels rather error prone for drivers too if they
have to configure they internal routing based on format information

> >    Also link validation is of course a bit more complex as shown by
> >    731facccc987 ("v4l: subdev: Take routing information into account in link validation")
> >    which was part of the previous series, but it's totally up to the
> >    core..
> >
> > Moving everything to the pads by adding a 'stream' field basically
> > makes all pads potentially multiplexed, reducing the problem of format
> > configuration/validation to a 1-to-1 {pad, stream} pair validation
> > which allows to collapse the topology and maintain the current one.
>
> Yes. I think I have problem understanding the counter arguments as I don't
> really see a difference with a) two subdevs, each with two non-multiplexed
> pads, linked 1-to-1 and b) two subdevs, each with one multiplexed pad, with
> two routes.

My main concerns are:

- Usage of format configuration to establish routing as per above.
  Format assignment gets a routing semantic associated, which is an
  implicit behavior difficult to control and inspect for applications.

- Userspace is in control of connecting endpoints on the multiplexed
  bus by assigning formats, this has two consequences:
  - A 1-to-1 mapping between streams on the two sides of the
    multiplexed bus which prevents routing multiple streams to the
    same endpoint (is this correct ?)
  - As the only information about a 'stream' on the multiplexed bus is
    the format it transports, it is required to assign to the stream
    identifier a semantic (ie stream 0 = virtual channel 0). The
    previous version had the information of what's transported on the
    multiplexed bus hidden from userspace and delegated to the
    frame_desc kAPI. This way it was possible to describe precisely
    what's sent on the bus, with bus-specific structures (ie struct
    v4l2_mbus_frame_desc_entry.bus.csi2)
  - This might seem a bit pedantic, but, setting image formats and
    sizes on the endpoints of a multiplexed bus such as CSI-2 is not
    technically correct. CSI-2 transports packets tagged with
    identifiers for the virtual channel and data type they transport
    (and identifiers for the packet type, but that's part of the bus
    protocol). The format and size is relevant for configuring the
    size of the memory area where the receiver dumps the received
    packets, but it's not part of the link configuration itself.
    This was better represented by using the information from the
    remote side frame_desc.

>
> There is one particular issue I had with the previous version, which I think
> is a big reason I like the new approach:
>
> I'm using TI CAL driver, which already exists in upstreams and supports both
> non-MC and MC-without-streams. Adding support for streams, i.e supporting
> non-MC, MC-without-streams and MC-with-streams made the driver an unholy
> mess (including a new module parameter to enable streams). With the new
> approach, the changes were relatively minor, as MC with and without streams
> are really the same thing.

I can only agree about the fact your solution is indeed simpler
regarding the topology handling.

>
> With the previous approach you couldn't e.g. have a CSI2-RX bridge driver
> that would support both old, non-multiplexed CSI2 sensor drivers and
> multiplexed CSI2 sensor drivers. Unless you had something like the module
> parameter mentioned above. Or perhaps a DT property to define which mode the
> pad is in.

Agreed again, with the previous version a new subdev would have been
required, right ?

>
> Also, one problem is that I really only have a single multiplexed HW setup,
> which limits my testing and the way I see multiplexed streams. That setup is
> "luckily" not the simplest one:

Luckily, yes :)

>
> SoC CSI-2 RX <-> FPDLink Deserializer <-> FPDLink Serializer <-> Sensor
>
> 4 serializer+sensor cameras can be connected to the deserializer. Each
> sensor provides 2 streams (pixel and metadata). So I have 8 streams coming
> in to the SoC.

That's great, we have a very similar GMSL setup we could use to
compare. I had not considered metadata in my mental picture of how to
handle this kind of setups so far. For the simpler case I imagine it could
have been handled by making the deserializer source pad a multiplexed
pad with 4 endpoints (one for each virtual channel) where to route the
streams received on the 4 sink pads (one for each stream serialized on
the GMSL/FDP bus).

Userspace configures routing on the deser, directing each input stream
to one stream on the multiplexed source pad, effectively configuring
on which VC each stream is put on the multiplexed bus. Please note
that in your example, unless your deser can do demuxing on DT, each
stream at this stage will contain 2 datatypes, images and metadata.

The CSI-2 receiver would fetch the frame descriptor to learn what is
about to be sent on the bus and creates its routing table accordingly.
In the simplest example it can simply route stream n to its n-th
source pad. If your CSI-2 receiver can route VC differently the
routing table can be manipulated by userspace. If your CSI-2 receiver
can do DT demultiplexing (not even sure if a CSI-2 receiver could do
so or it happens at a later stage in the pipeline) each {VC, DT} pair will be
represented as an endpoint in your multiplexed sink pad to be routed to
a different source pad (or whatever is next in your pipeline).

I wish someone could disprove my understanding of how the previous version
worked as it is based on my mental picture only, which might of course
be faulty.

How would you model that with stream formats, for a comparison ?

>
> > Apart from the concerns expressed by Laurent (which I share but only
> > partially understand, as the implications of bulk moving the
> > v4l2-subdev configuration API to be stream-aware are not totally clear
> > to me yet) what I'm not convinced of is that now cross-entities
> > "routes" (or "streams") on a multiplexed bus do require a format
> > assigned, effectively exposing them to userspace, with the consequence
> > that the format configuration influences the routes setup up to the
> > point the two have to be kept consistent. The concept
> > could even be extended to inter-entities routes, as you suggested the
> > routing tables could even be dropped completely in this case, but I
> > feel mixing routing and format setup is a bit a layer violation and
> > forbids, in example, routing two streams to the same endpoint, which I
> > feel will be required to perform DT multiplexing on the same virtual
> > channel. The previous version had the multiplexed link configuration
> > completely hidden from userspace and controlled solely by the routing API,
> > which seems a tad more linear and offers more flexibility for drivers.
> >
> > I'm not strongly pushing for one solution over the other, the only use
> > case I can reason on at the moment is a simple single-stream VC
> > multiplexing and both solutions works equally fine for that. This one
> > is certainly simpler regarding the required device topology.
> >
> > Btw Tomi, do you have examples of drivers ported to your new proposal ?
>
> Yes. They're a bit messy, but I can share them with the next version. I'm
> currently fixing a lot of things, and making full use of the new
> v4l2_subdev_state.

Thanks, it would help!

>
>   Tomi
>
>
