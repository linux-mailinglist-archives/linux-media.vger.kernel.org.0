Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03A713D3884
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 12:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231704AbhGWJkE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 05:40:04 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:46493 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231857AbhGWJjt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 05:39:49 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id B1E801BF206;
        Fri, 23 Jul 2021 10:20:15 +0000 (UTC)
Date:   Fri, 23 Jul 2021 12:21:02 +0200
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
Message-ID: <20210723102102.6nlozc7jeaaxnm5o@uno.localdomain>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
 <YLwReuwLm7S/4hgz@pendragon.ideasonboard.com>
 <20210709151821.ogra3s2ulnsvkyqa@uno.localdomain>
 <9b6ce019-8e38-886a-0c61-6f437ca9a915@ideasonboard.com>
 <20210710084239.rgksudxtrrocufuc@uno.localdomain>
 <def272e2-6404-7167-b54f-80f49ad7a874@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <def272e2-6404-7167-b54f-80f49ad7a874@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,
   sorry for the late reply

On Mon, Jul 12, 2021 at 11:19:08AM +0300, Tomi Valkeinen wrote:
> Hi,
>
> On 10/07/2021 11:42, Jacopo Mondi wrote:
> > Hi Tomi,
> >     thanks for you reply
> >
> > On Fri, Jul 09, 2021 at 09:26:03PM +0300, Tomi Valkeinen wrote:
> > > Hi Jacopo,
> > >
> > > On 09/07/2021 18:18, Jacopo Mondi wrote:
> > > > Hi Tomi, Laurent,
> > > >
> > > > On Sun, Jun 06, 2021 at 03:06:18AM +0300, Laurent Pinchart wrote:
> > > > > Hi Hans, Sakari,
> > > > >
> > > > > We need your feedback on this series, at least on the general approach.
> > > > > There are quite a few issues to be addressed, and it makes no sense to
> > > > > invest time in this if you don't think this is a good direction.
> > > > >
> > > > > If anyone else wants to give feedback, speak now or forever hold your
> > > > > peace :-)
> > > >
> > > > Since you ask...
> > > >
> > > > Having been involved a bit as the n-th person that tried to bring this
> > > > to completion I spent a bit of time trying to recollect how the
> > > > previous approach worked and how it compares to this one. Sorry if
> > > > this goes in length.
> > > >
> > > > I share Tomi's concern on one part of the previous version:
> > > >
> > > > - The resulting device topology gets complicated in a non-trivial way.
> > > >
> > > >     The typical example of having to model one image sensor that sends
> > > >     embedded data and images with three sub-devices speaks for itself, I
> > > >     presume.
> > > >
> > > >     However in one way, I feel like this is somehow correct and provides
> > > >     a more accurate representation of the actual sensor architecture.
> > > >     Splitting a sensor into components would allow to better handle
> > > >     devices which supports multiple buses (typically CSI-2 and
> > > >     parallel) through the internal routing tables, and allows
> > > >     better control of the components of the image sensor. [1]
> > >
> > > I'm not sure what kind of setup you mean, but nothing prevents you from
> > > splitting devices into multiple subdevs with the new approach if it makes
> > > sense on your HW.
> >
> > Nothing prevents it it from being done today, my point was that having
> > to do so to support mulitplexed streams is an incentive to get to a
> > more precise representation of the sensor architecture, not only a
> > cons :)
> >
> > >
> > > I have a parallel sensor that provides metadata on a line before the actual
> > > frame. I have hard time understanding why that should be split into 3
> > > subdevs.
> > >
> >
> > As I guess there's no way to extract that line of embedded data if not
> > from the frame when already in memory, I won't consider this the best
> > example of a multiplexed bus :)
>
> The FPDLink Deserializer does it, it can mark first N lines with a DT for
> embedded data.
>
> Yes, it's not as fancy as with CSI-2, but it is essentially a multiplexed
> bus, with two streams.
>

I concur that the deser source pad is actually multiplexed then

> > > > - Multiplexed source pads do not accept a format or any other configuration
> > > >     like crop/composing. Again this might seem odd, and it might be
> > > >     worth considering if those pads shouldn't be made 'special' somehow,
> > > >     but I again think it models a multiplexed bus quite accurately,
> > > >     doesn't it ? It's weird that the format of, in example, a CSI-2
> > > >     receiver source pad has to be propagated from the image sensor
> > > >     entity sink pad, crossing two entities, two routes and one
> > > >     media link. This makes rather complex to automate format propagation along
> > > >     pipelines, not only when done by abusing media-ctl like most people do,
> > > >     but also when done programmatically the task is not easy (I know I'm
> > > >     contradicting my [1] point here :)
> > >
> > > Hmm, but is it easy in the kernel side, then? I didn't feel so with the
> > > previous version. The kernel needed to travel the graph back and forth "all
> > > the time", just to figure out what's going on and where.
> >
> > Not for the core. You see the patch I referenced, I praise Sakari for
> > getting there, the validation is indeed complex.
> >
> > I mean that for drivers it would be easier as the routing management
> > is separate from format management, and drivers do not have to match
> > endpoints by the format they have applied to infer routes.
>
> I'm not sure what you mean here with "do not have to match endpoints by the
> format they have applied to infer routes".
>
> The routing is set with the ioctl, it's not inferred in any way.
>

You are right, the GS_ROUTING ioctls are still in place, so an entity
internal routing is managed as it used to be

> > > If the userspace understands the HW topology (as it more or less must), and
> > > it configures the routes (as it has to), and sets the formats on certain
> > > subdevs, then I don't see that it would have any issues in propagating the
> > > formats.
> > >
> >
> > As I've said the fact that setting up a route is accomplished by
> > setting the same format on two endpoints feels like a layer violation.
> > For userspace traversing a route means matching the formats on a
> > possibly high number of {pad, stream} pairs. It won't be easy without
> > a dedicated API and feels rather error prone for drivers too if they
> > have to configure they internal routing based on format information
>
> Hmm, are you talking about the method I suggested in my earlier mail, where
> I was thinking out loud if the routing endpoint information could be set to
> a (pad, stream) pair? That is not implemented.

Yes, I was referring to the idea of collapsing routing configuration into
format configuration.

>
> This current series version has a routing table, set with the set-routing
> ioctl. When the routing is set, you could think that a set of "virtual" pads
> is created (identified by (pad, stream) pair), where each route endpoint has
> a pad. Those pads can then be configured similarly to the "normal" pads.
>

And that's for routes inside an entity. Am I wrong that in this
version multiplexed (or virtual) pads identified by the (pad, stream)
pair have a format assigned at both ends of a link ?

> > > >     Also link validation is of course a bit more complex as shown by
> > > >     731facccc987 ("v4l: subdev: Take routing information into account in link validation")
> > > >     which was part of the previous series, but it's totally up to the
> > > >     core..
> > > >
> > > > Moving everything to the pads by adding a 'stream' field basically
> > > > makes all pads potentially multiplexed, reducing the problem of format
> > > > configuration/validation to a 1-to-1 {pad, stream} pair validation
> > > > which allows to collapse the topology and maintain the current one.
> > >
> > > Yes. I think I have problem understanding the counter arguments as I don't
> > > really see a difference with a) two subdevs, each with two non-multiplexed
> > > pads, linked 1-to-1 and b) two subdevs, each with one multiplexed pad, with
> > > two routes.
> >
> > My main concerns are:
> >
> > - Usage of format configuration to establish routing as per above.
> >    Format assignment gets a routing semantic associated, which is an
> >    implicit behavior difficult to control and inspect for applications.
>
> Again, either I'm totally misunderstanding what you're saying, or you are
> talking about the method that has not been implemented.
>

For routing internal to entities as you said GS_ROUTING is still in
place, so my argument is moot. However I think it still applies to
multiplexed ends of a cross-entity link (see below).


> > - Userspace is in control of connecting endpoints on the multiplexed
> >    bus by assigning formats, this has two consequences:
> >    - A 1-to-1 mapping between streams on the two sides of the
> >      multiplexed bus which prevents routing multiple streams to the
> >      same endpoint (is this correct ?)
>
> No, you can have multiple streams with the same endpoint (i.e. the same
> (pad, stream) for source/sink side).
>
> >    - As the only information about a 'stream' on the multiplexed bus is
> >      the format it transports, it is required to assign to the stream
> >      identifier a semantic (ie stream 0 = virtual channel 0). The
> >      previous version had the information of what's transported on the
> >      multiplexed bus hidden from userspace and delegated to the
> >      frame_desc kAPI. This way it was possible to describe precisely
> >      what's sent on the bus, with bus-specific structures (ie struct
> >      v4l2_mbus_frame_desc_entry.bus.csi2)
>
> That is how it's in this series too. The difference is that in the previous
> version, when a driver needed to know something about the stream which was
> not in the frame_desc, it had to start traversing the graph to find out a
> non-multiplexed pad. With this version the driver has the information in its
> (pad, stream) pair.

That's a (desirable) consequence of the fact multiplexed ends of a
link have a format assigned, right ?

>
> >    - This might seem a bit pedantic, but, setting image formats and
> >      sizes on the endpoints of a multiplexed bus such as CSI-2 is not
> >      technically correct. CSI-2 transports packets tagged with
> >      identifiers for the virtual channel and data type they transport
> >      (and identifiers for the packet type, but that's part of the bus
> >      protocol). The format and size is relevant for configuring the
> >      size of the memory area where the receiver dumps the received
> >      packets, but it's not part of the link configuration itself.
> >      This was better represented by using the information from the
> >      remote side frame_desc.
>
> Why is a multiplexed CSI-2 bus different than a non-multiplexed parallel
> bus? Or more specifically, why is a single stream in a multiplexed CSI-2 bus
> different than the stream in non-multiplexed parallel bus? It's the same
> data, transported in a slightly different manner.
>
> One could, of course, argue that they are not different, and pad
> configuration for non-multiplexed pads should also be removed.

While I get where you're going, I don't completely agree. The format
set on the ends of a non-multiplexed link does not represent what is
transported there but instructs the receiver (less so the transmitter)
about what data it should expects to receive and allows drivers to
prepare for it. The same doesn't apply to multiplexed pads, where
'what is expected to receive' is given by the union of the formats of
the several (pad, stream) endpoints. Assuming my understanding is
correct, that's what I don't like about having formats on multiplexed
pads.

>
> This reminds me of one more problem I had in the previous version:
> supporting TRY. I couldn't implement TRY support as the subdevs didn't have
> the information needed. With this version, they do have the information, and
> can independently say if the subdev's routing + format configuration is
> valid or not.
>
> > > There is one particular issue I had with the previous version, which I think
> > > is a big reason I like the new approach:
> > >
> > > I'm using TI CAL driver, which already exists in upstreams and supports both
> > > non-MC and MC-without-streams. Adding support for streams, i.e supporting
> > > non-MC, MC-without-streams and MC-with-streams made the driver an unholy
> > > mess (including a new module parameter to enable streams). With the new
> > > approach, the changes were relatively minor, as MC with and without streams
> > > are really the same thing.
> >
> > I can only agree about the fact your solution is indeed simpler
> > regarding the topology handling.
> >
> > >
> > > With the previous approach you couldn't e.g. have a CSI2-RX bridge driver
> > > that would support both old, non-multiplexed CSI2 sensor drivers and
> > > multiplexed CSI2 sensor drivers. Unless you had something like the module
> > > parameter mentioned above. Or perhaps a DT property to define which mode the
> > > pad is in.
> >
> > Agreed again, with the previous version a new subdev would have been
> > required, right ?
>
> The previous version needed some way to create or set up the pads
> differently based on the future usage. The subdev's pad had to be in either
> non-multiplexed or multiplexed mode, and this choice had to be made "early",
> before using the subdev.
>
> Or, yes, I guess one option would have been to split the device into
> multiple subdevs, one subdev with multiplexed pads, the other with
> non-multiplexed pads. That would have been horribly confusing.
>
> > > Also, one problem is that I really only have a single multiplexed HW setup,
> > > which limits my testing and the way I see multiplexed streams. That setup is
> > > "luckily" not the simplest one:
> >
> > Luckily, yes :)
> >
> > >
> > > SoC CSI-2 RX <-> FPDLink Deserializer <-> FPDLink Serializer <-> Sensor
> > >
> > > 4 serializer+sensor cameras can be connected to the deserializer. Each
> > > sensor provides 2 streams (pixel and metadata). So I have 8 streams coming
> > > in to the SoC.
> >
> > That's great, we have a very similar GMSL setup we could use to
> > compare. I had not considered metadata in my mental picture of how to
> > handle this kind of setups so far. For the simpler case I imagine it could
> > have been handled by making the deserializer source pad a multiplexed
> > pad with 4 endpoints (one for each virtual channel) where to route the
> > streams received on the 4 sink pads (one for each stream serialized on
> > the GMSL/FDP bus).
> >
> > Userspace configures routing on the deser, directing each input stream
> > to one stream on the multiplexed source pad, effectively configuring
> > on which VC each stream is put on the multiplexed bus. Please note
> > that in your example, unless your deser can do demuxing on DT, each
> > stream at this stage will contain 2 datatypes, images and metadata.
>
> No, a "stream" is an independent set of data. Pixel data is its own stream,
> and metadata is its own stream, even if they're on the same CSI-2 link (or
> parallel link).
>
> > The CSI-2 receiver would fetch the frame descriptor to learn what is
> > about to be sent on the bus and creates its routing table accordingly.
> > In the simplest example it can simply route stream n to its n-th
> > source pad. If your CSI-2 receiver can route VC differently the
> > routing table can be manipulated by userspace. If your CSI-2 receiver
> > can do DT demultiplexing (not even sure if a CSI-2 receiver could do
> > so or it happens at a later stage in the pipeline) each {VC, DT} pair will be
> > represented as an endpoint in your multiplexed sink pad to be routed to
> > a different source pad (or whatever is next in your pipeline).
> >
> > I wish someone could disprove my understanding of how the previous version
> > worked as it is based on my mental picture only, which might of course
> > be faulty.
> >
> > How would you model that with stream formats, for a comparison ?
>
> I've attached a picture that perhaps helps.
>
> On the left side it has the previous version, on the right side this new
> version. Note that the picture is just partially drawn to avoid needless
> repetition. The second CAL RX doesn't have anything connected, I haven't
> drawn all the links between CAL RX0 and CAL Video nodes, and I have drawn
> only a few of the optional routes/links (drawn in dotted lines).
>
> The picture is also missing the serializers. I should add them, but they are
> just pass-through components and do not bring much into the picture.
>
> On the left side, the blue-ish pads are multiplexed pads (i.e. they cannot
> be configured). The sensor is also split only into two subdevs, as it was
> easier to implement than a three-subdev-model.
>
> Also note that e.g. the link between UB960 pad4 and CAL RX0 pad0 is drawn
> instead using streams. In other words, there is only one media link between
> those pads, but in that link there are 8 streams, which are drawn here.
>
> The CAL videoX nodes are the /dev/videoX nodes. CAL has 8 dma engines, so
> there are 8 video nodes. Any of the video nodes can be connected to any one
> of the source pads on either CAL RX subdev.
>
> The UB960 routes all inputs into the output port, and tags first N lines
> with embedded DT, the rest with pixel data DT. And VC is set matching the
> input port.
>
> CAL will route each stream, based on the DT and VC, to a separate DMA
> engine, which then goes to memory buffers.
>
> The differences between the old and new model look minor in the picture, but
> in the code they are quite huge.
>

Thanks, this helps. Do we concur that the main difference between the
two version (let's call them v0 and v1) at least from an uAPI perspective,
is basically that the ends of a multiplexed link:

- in v0 had no formats assigned, configuration of the receiver end was
  performed in-kernel through get_frame_desc()

- in v1 each (pad, stream) has a format assigned by userspace and the
  receiver configuration is deduced from the formats assigned to the
  several endpoints ?

I would like to thank you for having bear with me so far and clarify my
doubts, I hope you'll find energy to clarify my last questions
here and I hope my understanding is not completely wrong, this is a
non-easy topic to deal with.

However, I don't want to continue to argue because what I care about
is getting to have some solution merged, and I feel this discussion is
not getting any productive for that. What I can offer, if anyway
helpful, is in the next weeks (or months?) rebase the work we've done
on R-Car in the past to support VC multiplexing on your series to have
more material for comparison. Then the ideal solution would be to pick
a conference/event most of the interested parties could attend, sit
down for a few days and find a way to move forward. The linux-media
mini conferences held around ELC/plumbers had this purpose and helped
finalize direction for other topics in the past. Considering the
current situation that's very unlikely to happen, but a virtual
version of the same could be considered.

Alternatively if the majority of maintainers reach consensus earlier
on this version I'll be happy to shut up, but that requires to rope
them in to review this series :)

Thanks
   j


>  Tomi


