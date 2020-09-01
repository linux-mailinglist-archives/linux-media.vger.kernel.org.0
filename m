Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DFF5259C2B
	for <lists+linux-media@lfdr.de>; Tue,  1 Sep 2020 19:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728708AbgIARMJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Sep 2020 13:12:09 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:51632 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732442AbgIARLz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Sep 2020 13:11:55 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BEDBEAF2;
        Tue,  1 Sep 2020 19:11:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1598980304;
        bh=XbYFX8c/6GPHiLG0wZDYD9iOWMXdr5wVGWlmoLJfBIE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eTuL29PDwmowSxqoFRovZdZSomG8HlWCo/3YqbyH74XGDYtlYq0U8ZS4MsDa4snq+
         EbimgTj0zH8pDYh6X7w5hW6XkMTirHRHzOOzoQEcAfUmJntaUIW/8BuCR0WxZqUjdQ
         5W908x1B+id+3Rr9JwuI6loYPujqxC9opzhTRNDA=
Date:   Tue, 1 Sep 2020 20:11:22 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>
Subject: Re: [PATCH v2 04/34] media: bcm2835-unicam: Driver for CCP2/CSI2
 camera interface
Message-ID: <20200901171122.GB6148@pendragon.ideasonboard.com>
References: <20200504092611.9798-5-laurent.pinchart@ideasonboard.com>
 <20200829112028.6sjepiomfudbfkno@uno.localdomain>
 <20200829183237.GB7465@pendragon.ideasonboard.com>
 <20200831073858.ccl2wn6e57hux4fw@uno.localdomain>
 <20200831141704.GE16155@pendragon.ideasonboard.com>
 <20200831144637.b3ac4qwumr3piwm3@uno.localdomain>
 <20200831145654.GH16155@pendragon.ideasonboard.com>
 <CAPY8ntBXqLJM1zm8Ju0kdJtA=a7aDwiGXUV8_QDJFXg_f=+8mw@mail.gmail.com>
 <20200901102251.khxzjlxnupy5h5cz@uno.localdomain>
 <CAPY8ntCLYTCxX616TMqvmJu8iPmZj8aXZ07+g9MSLVjsJpSPCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntCLYTCxX616TMqvmJu8iPmZj8aXZ07+g9MSLVjsJpSPCw@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave and Jacopo,

On Tue, Sep 01, 2020 at 05:37:28PM +0100, Dave Stevenson wrote:
> On Tue, 1 Sep 2020 at 11:19, Jacopo Mondi wrote:
> > On Tue, Sep 01, 2020 at 09:41:20AM +0100, Dave Stevenson wrote:
> >> On Mon, 31 Aug 2020 at 15:57, Laurent Pinchart wrote:
> >>> On Mon, Aug 31, 2020 at 04:46:37PM +0200, Jacopo Mondi wrote:
> >>>> On Mon, Aug 31, 2020 at 05:17:04PM +0300, Laurent Pinchart wrote:
> >>>>> On Mon, Aug 31, 2020 at 09:38:58AM +0200, Jacopo Mondi wrote:
> >>>>>> On Sat, Aug 29, 2020 at 09:32:37PM +0300, Laurent Pinchart wrote:
> >>>>>>> On Sat, Aug 29, 2020 at 01:20:28PM +0200, Jacopo Mondi wrote:
> >>>>>>>> On Mon, May 04, 2020 at 12:25:41PM +0300, Laurent Pinchart wrote:
> >>>>>>>>> From: Naushir Patuck <naush@raspberrypi.com>
> >>>>>>>>>
> >>>>>>>>> Add a driver for the Unicam camera receiver block on BCM283x processors.
> >>>>>>>>> Compared to the bcm2835-camera driver present in staging, this driver
> >>>>>>>>> handles the Unicam block only (CSI-2 receiver), and doesn't depend on
> >>>>>>>>> the VC4 firmware running on the VPU.
> >>>>>>>>>
> >>>>>>>>> The commit is made up of a series of changes cherry-picked from the
> >>>>>>>>> rpi-5.4.y branch of https://github.com/raspberrypi/linux/ with
> >>>>>>>>> additional enhancements, forward-ported to the mainline kernel.
> >>>>>>>>>
> >>>>>>>>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >>>>>>>>> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> >>>>>>>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>>>>>>>> ---
> >>>>>>>>> Changes since v1:
> >>>>>>>>>
> >>>>>>>>> - Re-fetch mbus code from subdev on a g_fmt call
> >>>>>>>>> - Group all ioctl disabling together
> >>>>>>>>> - Fix reference counting in unicam_open
> >>>>>>>>> - Add support for VIDIOC_[S|G]_SELECTION
> >>>>>>>>> ---
> >>>>>>>>
> >>>>>>>> [snip]
> >>>>>>>>
> >>>>>>>>> +
> >>>>>>>>> +static int of_unicam_connect_subdevs(struct unicam_device *dev)
> >>>>>>>>> +{
> >>>>>>>>> +   struct platform_device *pdev = dev->pdev;
> >>>>>>>>> +   struct v4l2_fwnode_endpoint ep = { 0 };
> >>>>>>>>> +   struct device_node *ep_node;
> >>>>>>>>> +   struct device_node *sensor_node;
> >>>>>>>>> +   unsigned int lane;
> >>>>>>>>> +   int ret = -EINVAL;
> >>>>>>>>> +
> >>>>>>>>> +   if (of_property_read_u32(pdev->dev.of_node, "brcm,num-data-lanes",
> >>>>>>>>> +                            &dev->max_data_lanes) < 0) {
> >>>>>>>>> +           unicam_err(dev, "number of data lanes not set\n");
> >>>>>>>>> +           return -EINVAL;
> >>>>>>>>> +   }
> >>>>>>>>
> >>>>>>>> mmm, this seems like a good use case for the newly introduced
> >>>>>>>> get_mbus_config pad operation, isn't it ?
> >>>>>>>>
> >>>>>>>> We could drop the custom "brcm,num-data-lanes" property, use the
> >>>>>>>> standard "num-lanes" to describe the number of wired data lanes, and
> >>>>>>>> get the number of actually used ones at s_stream(1) time with the new pad
> >>>>>>>> operation
> >>>>>>>>
> >>>>>>>> What do you think ? This would require implemeting the operation in
> >>>>>>>> each subdev the UNICAM interface has to work with, but this doesn't
> >>>>>>>> sound too much of a work.
> >>>>>>>>
> >>>>>>>> For reference this is how it happens on rcar+adv748x:
> >>>>>>>> https://patchwork.linuxtv.org/project/linux-media/patch/20200717145324.292820-11-jacopo+renesas@jmondi.org/
> >>>>>>>> https://patchwork.linuxtv.org/project/linux-media/patch/20200717145324.292820-10-jacopo+renesas@jmondi.org/
> >>>>>>>
> >>>>>>> Don't brcm,num-data-lanes and get_mbus_config serve different purposes ?
> >>>>>>> The former tells how many data lanes the unicam IP has (the same IP,
> >>>>>>> with the same compatible string, is instantiated in different SoCs with
> >>>>>>> different number of lanes), while the latter queries at runtime how many
> >>>>>>> data lanes the remote subdev will use for its current configuration. The
> >>>>>>
> >>>>>> Can't we get the number of available data lanes just by parsing the
> >>>>>> endpoint ?
> >>>>>
> >>>>> We can get the number of data lanes routed on the board, which may not
> >>>>> match the number of data lanes available in the IP. I'll let Dave
> >>>>> comment on this, I recall we had a lengthy discussion on this topic in
> >>>>> the past, but I don't remember the details :-S
> >>
> >> Thread "[PATCH 10/10] media: bcm2835-unicam: Simplify OF parsing"
> >> posted to the private libcamera list Sun, 19 Apr. I can forward on if
> >> others have deleted it.
> >
> > Thanks. I've now read the thread again.
> >
> > I think my disagreement is with the fact that data-lanes shall
> > represent the number of data lanes connected between the sensor and the
> > receiver.
> >
> > data-lanes, to me, represents the number (and index) of the lanes
> > instantiated on the silicon, or even exposed on the connector. In
> > plain English: "the number of available data lanes".
> 
> That would be my wish too, but it's not the current usage.

I agree with Dave here. The data-lanes property in the endpoint
describes the board. That is very unlikely to change.

> > The sensor will describe it's own lanes (which might be less than the
> > ones available in the receiver) and at streaming time the receiver
> > gets how many of them shall be used by using get_mbus_config(). This
> > would basically move the notion of "how many lanes are in use" to
> > run-time, leaving the HW description of "what's available in the HW"
> > to DT. It seems a much neater solution to me, also considering the
> > current implementation does not scale if we throw muxes and pluggable
> > devices in the mix.
> 
> Yes, if get_mbus_config() was mandatory for all sensor/source drivers
> to implement then that would work, but currently I think there are
> only about 4 drivers that implement it.

We could extend that, but I don't think there's a need to.
.get_mbus_config() is primarly meant to support CSI-2 sources that use
different number of data lanes depending on their configuration. For
sources that will always use the number of data lanes routed on the PCB,
the information available in DT is enough.

> It'd be nice if there was a way for the framework to take care of it
> for the simple drivers that purely take the config from DT, but I'm
> not sure that's feasible.
> 
> > This isn't a discussion on this patch only, and I know Laurent and
> > Sakari already had gone through that multiple times. I see if I have
> > energies to fight that battle, but for this series let's live with the
> > custom property.
> >
> >>>> I think the max number of number of lanes in the IP should come in DT
> >>>> by restricting the number of accepted data-lanes value depending on
> >>>> the compatible string.
> >>>
> >>> Unless I'm mistaken we have a single compatibility string.
> >>
> >> Currently we have a single compatible string.
> >> So you want a "brcm,bcm2835-unicam-2-lane" and "brcm,bcm2835-unicam-4-lane"?
> >
> > No please :) I assumed you had different ones.
> 
> I'm glad you said that :-)
> Other than the number of lanes the IP in all the variations of Pi is
> identical, so adding multiple compatibles seemed excessive. It's the
> same for a fair number of the IP blocks in the SoC such as I2C and
> SPI.

I fully agree. The number of lanes supported by an instance of the
unicam IP core is a property of the core, and should be reported in DT
if the driver needs to access that information.

> >> You can't guarantee that unicam0 is always 2 lane and unicam1 is
> >> always 4 lane forever more - I know there are Broadcom chips with a
> >> unicam2 for a start.
> >> I defer to the DT gatekeepers, but that feels ugly.

It would be ugly, let's not go down that route.

> >>>>>> I'm aware of the implication that the 'data-lanes' property
> >>>>>> would differ in the bridge and sensor endpoints, but now that we have
> >>>>>> a mechanism to get that information wihtout parsing the remote
> >>>>>> endpoint it doesn't seem wrong to me.
> >>>>>
> >>>>> That's not the issue at hand. The data-lanes property need to match on
> >>>>> both sides of a link, as it tells how many data lanes are routed on the
> >>>>> board. Of course that becomes problematic when we start using overlays
> >>>>> for pluggable boards, as the two sides can be designed with a different
> >>>>> number of routed lanes.
> >>>>
> >>>> It actually is. As I read the current implementation, UNICAM has 4
> >>>> lanes available, 2 are enabled in the endpoint, and the remote uses 2.
> >>>
> >>> That's because the board has 2 data lanes routed.
> >>>
> >>>> If we set the number of lanes in the endpoint to 4 (the actually
> >>>> available ones) and use only the two required by querying the remote
> >>>> end at s_stream time, we don't need any custom sourcery
> >>>
> >>> That would be incorrect, as there are two data lanes routed, so you
> >>> shouldn't set the data-lanes property to 4 lanes in the endpoint.
> >>>
> >>>>>> And that's not different from what it's done in R-Car (half-true: we
> >>>>>> have the same 'data-lanes' value between rcar-csi2 and adv7482x, and
> >>>>>> as you said the number of active data lanes can be downscaled to
> >>>>>> transmit low resolution streams).
> >>>>>>
> >>>>>> I think Dave already had this conversation in the past, I might dig
> >>>>>> the archive and search for a reference.
> >>
> >> Referenced above.
> >>
> >>>>>>> DT property serves as a sanity check, to ensure to no more than the
> >>>>>>> number of supported data lanes is used, while the subdev operation
> >>>>>>> should be used in the unicam driver to support sources that will
> >>>>>>> transmit over a different number of data lanes depending on the
> >>>>>>> configuration (mostly depending on the resolution). We don't have to
> >>>>>>
> >>>>>> I think reading the remote's mbus configuration might also help in
> >>>>>> support connecting pluggable devices with a different number of wired
> >>>>>> data lanes than the bridge's available ones.
> >>>>>
> >>>>> No, that we shouldn't do. DT properties need to be interpreted within
> >>>>> the context of a compatible string, reading properties of a remote node
> >>>>> is a no-go in most cases. It's really really something that must not be
> >>>>> done without careful consideration, and is never a simple way to work
> >>>>> around a problem.
> >>>>
> >>>> What I mean is that get_mbus_config() allows you to retrieve those
> >>>> information -without- having to read the remote endpoint, which has
> >>>> always been a blocker for this kind of operations (and I agree it
> >>>> shouldn't be done).
> >>
> >> I like get_mbus_config as far as it goes.
> >> When it last came up I mentioned that it doesn't convey things like
> >> the continuous clock setting, so you have to have the DT endpoints
> >> configured identically for that to avoid issues, and if you start to
> >> involve CSI2 mux chips then both sources have to have the same
> >> requirements.
> >
> > The merged version of get_mbus_config supports describing
> > non-continuous and continuous clock, as we're currently re-using the
> > same V4L2_MBUS_ flags the legacy g|s_mbus_config operations used.
> 
> OK, I missed that then - sounds good.
> My potentially faulty memory said that Hans objected to the older
> version passing the continuous clocks flags through as it was all
> supposed to be part of DT, but if we're allowed to pass it through
> g|s_mbus_config now then all is good.

The clock mode is something that shouldn't have been in DT in the first
place I believe (with the exception of describing what modes a
particular instance of a device supports, the same way we do for the
number of data lanes, but that would be at the device level, not the
endpoint level), it should have been negotiated at runtime between the
source and sink. With .get_mbus_config() we can possibly start moving in
that direction.

> >> Personally I'd love to see get_mbus_config being the correct way of
> >> configuring all receiver parameters as you'd then be guaranteed to
> >> have source and receiver matching. Drop back to the receiver's DT
> >> endpoint when get_mbus_config isn't supported.
> >
> > As said, I tend to agree, even if it's a bit freagile having receivers
> > and sources agree to -what- has to come from get_mbus_config and from
> > DT. But moving forward that would be my preference indeed.

We can't fully rely on .get_mbus_config() though. At the least clock and
data lanes mapping needs to be specified in DT on the receiver side (for
receivers that support configurable mappings), as it's a description of
the board for the receiver side, so the transmitter should need to care
(the transmitter however needs to handle the same on its side, if it
supports configurable mappings).

> >>>>>> Am I missing something maybe? The non-connected lanes on the bride
> >>>>>> will simply stay unused, can't they ?
> >>>>>>
> >>>>>>> implement support for get_mbus_config just yet, it can be delayed until
> >>>>>>> we have a source that requires it.
> >>>>>>
> >>>>>> I sketched a few patches yesterday basically appling what's done in
> >>>>>> 5cef0785362ed and a61b1b5d41735. Is a custom property better in your
> >>>>>> opinion ?
> >>>>>
> >>>>> Again, the custom property only specifies the number of data lanes
> >>>>> implemented in the unicam IP core. It's nothing else than that, and does
> >>>>> *not* convey any information about how many data lanes the sensor will
> >>>>> use.
> >>>>
> >>>> It shouldn't, and to me that information should come from DT as we do
> >>>> for all other platforms.
> >>>>
> >>>> Let's see, if feels a bit a waste to use a custom property for
> >>>> something we can do without, and usage of get_mbus_config() would
> >>>> allow to support switching devices at run-time with a different number
> >>>> of data-lanes, as use case I know Dave has downstream.
> >>>
> >>> This is *still* not what brcm,num-lanes is about... get_mbus_config()
> >>> will not tell you how many data lanes the unicam IP supports.
> >>
> >> Use case of a TC358743 HDMI to CSI2 bridge connected to Unicam0 (2 lane).
> >> TC358743 supports get_mbus_config and says it wants 4 lanes for 1080p60 RGB888.
> >> Unicam calls get_mbus_config and gets told 4.
> >> So how do we detect and reject that invalid configuration? It can't
> >
> > unicam0 will have data-lanes=<1 2> and such it's max number of data
> > lanes is 2, and if you get 4 from get_mbus_config() you refuse that.
> 
> I'd fully back that!
> 
> Currently a DT overlay for the 4 lane TC358743 has to set data-lanes
> on both TC358743 and Unicam endpoints, so you've now lost the
> information on how many lanes Unicam really supports. Changing the
> overlay to only update the TC358743 endpoint and Unicam get the config
> from get_mbus_config() make life cleaner in my book.

The whole issue here is I believe a side effect of using overlays.
Without overlays, you would simply set data-lanes = <1 2> on both sides,
as that's what is routed on the PCB. With overlays, if you want a
generic overlay for the TC358743 module, we start having issues.

Even with .get_mbus_config() we don't have a full solution for this
problem. The TC358743 needs to know that only two lanes are routed to
the receiver in order to configure itself correctly (and reject invalid
configurations). If we don't provide that through DT (as data-lanes is
set to <1 2 3 4> in the TC358743 overlay), then the information would
need to be provided to the TC358743 driver at runtime.

I would like to explore a technical solution to have data-lanes set to
<1 2> on both sides as the result of merging the overlay with the base
DT file. That would solve the issue, and keep drivers simple(r). I'm not
sure how it could be achieved though.

> > I now wonder about lane reordering, we can express it in DT but not
> > with V4L2_MBUS_* flags. One more reason to supersed these flags with
> > more expressive fields, even if lane re-ordering seems to be a corner
> > case really.
> 
> To my mind the lane order in either sensor or receiver would come from
> data-lanes, and the number of active lanes truncates that array to the
> specified length.

Lane ordering should be a local configuration on both sides (the CSI-2
receiver doesn't need to know how the lanes are reordered on the
transmitter side, and vice-versa, as long as they share an understanding
of how lanes are numbered on the PCB).

> Are there really use cases where we need to dynamically reorder? I
> know some SoCs do mux lanes between multiple receive channels, but I'd
> be surprised if there is really a case for doing that on the fly. What
> would arbitrate on the lane assignments to avoid conflicts? (Hastily
> puts the can of worms back on the shelf as I don't want to get
> sidetracked).

I think there's a theoretical use case, and I'd like to keep it
theoretical :-)

> > Anyway, I'm a bit sad of upstreaming this with a custom property, but
> > this is a broader discussion and I don't want it to block unicam
> > acceptance.

I'm sorry, but I see nothing wrong with this property. It describes one
of the synthesis parameters for the IP core, and DT is the perfect place
to specify this. Look at the Xilinx bindings for instance, they specify
lots of synthesis parameters in DT. It's the perfect example of a
hardware description for an IP core.

> We could work without the property, but it removes potential for
> validating the configuration.

This point I'm certainly willing to discuss. We could omit the
brcm,num-data-lanes property if we considered that there would be no use
for this information in drivers. At the moment the value is used for
validation, and I think it makes sense as a use case, but I'm open to
reconsidering this if the consensus is that this feature isn't very
useful.

> Seeing as we use DT overlays heavily,
> and the platforms do support different numbers of lanes, I can see
> some really odd bug reports being raised because people don't fully
> understand what they are doing.
> Migrating away from the custom property as and when the discussions
> are concluded shouldn't be too huge a task so I'm happy to go with the
> majority.

I agree with you, I think the validation is useful at the moment. I
however don't think brcm,num-data-lanes should be used to lower the
number of lanes at runtime, as the CSI-2 source wouldn't know about
that. Let's see if we can find a solution to set the endpoint data-lanes
property to reference two lanes on both sides while keeping overlays
generic.

> >> rely on the Unicam data-lanes as that is supposed to reflect the
> >> number of active lanes, but it's not something that can be otherwise
> >> detected and blocked. Start streaming and it'll just sit there dumbly
> >> doing nothing.
> >>
> >> Yes we did discuss that most of the Pi boards have only 2 of the 4
> >> data lanes from Unicam1 wired out to the camera connector, so whilst
> >> technically not what the binding says, it is possible to then drop
> >> num-data-lanes down to 2 (though the IP has 4 lanes) and get
> >> validation of the config in that case as well.
> >>
> >>>>>>>> +
> >>>>>>>>> +   /* Get the local endpoint and remote device. */
> >>>>>>>>> +   ep_node = of_graph_get_next_endpoint(pdev->dev.of_node, NULL);
> >>>>>>>>> +   if (!ep_node) {
> >>>>>>>>> +           unicam_dbg(3, dev, "can't get next endpoint\n");
> >>>>>>>>> +           return -EINVAL;
> >>>>>>>>> +   }
> >>>>>>>>> +
> >>>>>>>>> +   unicam_dbg(3, dev, "ep_node is %pOF\n", ep_node);
> >>>>>>>>> +
> >>>>>>>>> +   sensor_node = of_graph_get_remote_port_parent(ep_node);
> >>>>>>>>> +   if (!sensor_node) {
> >>>>>>>>> +           unicam_dbg(3, dev, "can't get remote parent\n");
> >>>>>>>>> +           goto cleanup_exit;
> >>>>>>>>> +   }
> >>>>>>>>> +
> >>>>>>>>> +   unicam_dbg(1, dev, "found subdevice %pOF\n", sensor_node);
> >>>>>>>>> +
> >>>>>>>>> +   /* Parse the local endpoint and validate its configuration. */
> >>>>>>>>> +   v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep_node), &ep);
> >>>>>>>>> +
> >>>>>>>>> +   unicam_dbg(3, dev, "parsed local endpoint, bus_type %u\n",
> >>>>>>>>> +              ep.bus_type);
> >>>>>>>>> +
> >>>>>>>>> +   dev->bus_type = ep.bus_type;
> >>>>>>>>> +
> >>>>>>>>> +   switch (ep.bus_type) {
> >>>>>>>>> +   case V4L2_MBUS_CSI2_DPHY:
> >>>>>>>>> +           switch (ep.bus.mipi_csi2.num_data_lanes) {
> >>>>>>>>> +           case 1:
> >>>>>>>>> +           case 2:
> >>>>>>>>> +           case 4:
> >>>>>>>>> +                   break;
> >>>>>>>>> +
> >>>>>>>>> +           default:
> >>>>>>>>> +                   unicam_err(dev, "subdevice %pOF: %u data lanes not supported\n",
> >>>>>>>>> +                              sensor_node,
> >>>>>>>>> +                              ep.bus.mipi_csi2.num_data_lanes);
> >>>>>>>>> +                   goto cleanup_exit;
> >>>>>>>>> +           }
> >>>>>>>>> +
> >>>>>>>>> +           for (lane = 0; lane < ep.bus.mipi_csi2.num_data_lanes; lane++) {
> >>>>>>>>> +                   if (ep.bus.mipi_csi2.data_lanes[lane] != lane + 1) {
> >>>>>>>>> +                           unicam_err(dev, "subdevice %pOF: data lanes reordering not supported\n",
> >>>>>>>>> +                                      sensor_node);
> >>>>>>>>> +                           goto cleanup_exit;
> >>>>>>>>> +                   }
> >>>>>>>>> +           }
> >>>>>>>>> +
> >>>>>>>>> +           if (ep.bus.mipi_csi2.num_data_lanes > dev->max_data_lanes) {
> >>>>>>>>> +                   unicam_err(dev, "subdevice requires %u data lanes when %u are supported\n",
> >>>>>>>>> +                              ep.bus.mipi_csi2.num_data_lanes,
> >>>>>>>>> +                              dev->max_data_lanes);
> >>>>>>>>> +           }
> >>>>>>>>> +
> >>>>>>>>> +           dev->max_data_lanes = ep.bus.mipi_csi2.num_data_lanes;
> >>>>>>>>> +           dev->bus_flags = ep.bus.mipi_csi2.flags;
> >>>>>>>>> +
> >>>>>>>>> +           break;
> >>>>>>>>> +
> >>>>>>>>> +   case V4L2_MBUS_CCP2:
> >>>>>>>>> +           if (ep.bus.mipi_csi1.clock_lane != 0 ||
> >>>>>>>>> +               ep.bus.mipi_csi1.data_lane != 1) {
> >>>>>>>>> +                   unicam_err(dev, "subdevice %pOF: unsupported lanes configuration\n",
> >>>>>>>>> +                              sensor_node);
> >>>>>>>>> +                   goto cleanup_exit;
> >>>>>>>>> +           }
> >>>>>>>>> +
> >>>>>>>>> +           dev->max_data_lanes = 1;
> >>>>>>>>> +           dev->bus_flags = ep.bus.mipi_csi1.strobe;
> >>>>>>>>> +           break;
> >>>>>>>>> +
> >>>>>>>>> +   default:
> >>>>>>>>> +           /* Unsupported bus type */
> >>>>>>>>> +           unicam_err(dev, "subdevice %pOF: unsupported bus type %u\n",
> >>>>>>>>> +                      sensor_node, ep.bus_type);
> >>>>>>>>> +           goto cleanup_exit;
> >>>>>>>>> +   }
> >>>>>>>>> +
> >>>>>>>>> +   unicam_dbg(3, dev, "subdevice %pOF: %s bus, %u data lanes, flags=0x%08x\n",
> >>>>>>>>> +              sensor_node,
> >>>>>>>>> +              dev->bus_type == V4L2_MBUS_CSI2_DPHY ? "CSI-2" : "CCP2",
> >>>>>>>>> +              dev->max_data_lanes, dev->bus_flags);
> >>>>>>>>> +
> >>>>>>>>> +   /* Initialize and register the async notifier. */
> >>>>>>>>> +   v4l2_async_notifier_init(&dev->notifier);
> >>>>>>>>> +   dev->notifier.ops = &unicam_async_ops;
> >>>>>>>>> +
> >>>>>>>>> +   dev->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
> >>>>>>>>> +   dev->asd.match.fwnode = of_fwnode_handle(sensor_node);
> >>>>>>>>> +   ret = v4l2_async_notifier_add_subdev(&dev->notifier, &dev->asd);
> >>>>>>>>> +   if (ret) {
> >>>>>>>>> +           unicam_err(dev, "Error adding subdevice: %d\n", ret);
> >>>>>>>>> +           goto cleanup_exit;
> >>>>>>>>> +   }
> >>>>>>>>> +
> >>>>>>>>> +   ret = v4l2_async_notifier_register(&dev->v4l2_dev, &dev->notifier);
> >>>>>>>>> +   if (ret) {
> >>>>>>>>> +           unicam_err(dev, "Error registering async notifier: %d\n", ret);
> >>>>>>>>> +           ret = -EINVAL;
> >>>>>>>>> +   }
> >>>>>>>>> +
> >>>>>>>>> +cleanup_exit:
> >>>>>>>>> +   of_node_put(sensor_node);
> >>>>>>>>> +   of_node_put(ep_node);
> >>>>>>>>> +
> >>>>>>>>> +   return ret;
> >>>>>>>>> +}
> >>>>>>>>> +
> >>>>>>>>> +static int unicam_probe(struct platform_device *pdev)
> >>>>>>>>> +{
> >>>>>>>>> +   struct unicam_device *unicam;
> >>>>>>>>> +   int ret;
> >>>>>>>>> +
> >>>>>>>>> +   unicam = kzalloc(sizeof(*unicam), GFP_KERNEL);
> >>>>>>>>> +   if (!unicam)
> >>>>>>>>> +           return -ENOMEM;
> >>>>>>>>> +
> >>>>>>>>> +   kref_init(&unicam->kref);
> >>>>>>>>> +   unicam->pdev = pdev;
> >>>>>>>>> +
> >>>>>>>>> +   unicam->base = devm_platform_ioremap_resource(pdev, 0);
> >>>>>>>>> +   if (IS_ERR(unicam->base)) {
> >>>>>>>>> +           unicam_err(unicam, "Failed to get main io block\n");
> >>>>>>>>> +           ret = PTR_ERR(unicam->base);
> >>>>>>>>> +           goto err_unicam_put;
> >>>>>>>>> +   }
> >>>>>>>>> +
> >>>>>>>>> +   unicam->clk_gate_base = devm_platform_ioremap_resource(pdev, 1);
> >>>>>>>>> +   if (IS_ERR(unicam->clk_gate_base)) {
> >>>>>>>>> +           unicam_err(unicam, "Failed to get 2nd io block\n");
> >>>>>>>>> +           ret = PTR_ERR(unicam->clk_gate_base);
> >>>>>>>>> +           goto err_unicam_put;
> >>>>>>>>> +   }
> >>>>>>>>> +
> >>>>>>>>> +   unicam->clock = devm_clk_get(&pdev->dev, "lp");
> >>>>>>>>> +   if (IS_ERR(unicam->clock)) {
> >>>>>>>>> +           unicam_err(unicam, "Failed to get clock\n");
> >>>>>>>>> +           ret = PTR_ERR(unicam->clock);
> >>>>>>>>> +           goto err_unicam_put;
> >>>>>>>>> +   }
> >>>>>>>>> +
> >>>>>>>>> +   ret = platform_get_irq(pdev, 0);
> >>>>>>>>> +   if (ret <= 0) {
> >>>>>>>>> +           dev_err(&pdev->dev, "No IRQ resource\n");
> >>>>>>>>> +           ret = -EINVAL;
> >>>>>>>>> +           goto err_unicam_put;
> >>>>>>>>> +   }
> >>>>>>>>> +
> >>>>>>>>> +   ret = devm_request_irq(&pdev->dev, ret, unicam_isr, 0,
> >>>>>>>>> +                          "unicam_capture0", unicam);
> >>>>>>>>> +   if (ret) {
> >>>>>>>>> +           dev_err(&pdev->dev, "Unable to request interrupt\n");
> >>>>>>>>> +           ret = -EINVAL;
> >>>>>>>>> +           goto err_unicam_put;
> >>>>>>>>> +   }
> >>>>>>>>> +
> >>>>>>>>> +   unicam->mdev.dev = &pdev->dev;
> >>>>>>>>> +   strscpy(unicam->mdev.model, UNICAM_MODULE_NAME,
> >>>>>>>>> +           sizeof(unicam->mdev.model));
> >>>>>>>>> +   strscpy(unicam->mdev.serial, "", sizeof(unicam->mdev.serial));
> >>>>>>>>> +   snprintf(unicam->mdev.bus_info, sizeof(unicam->mdev.bus_info),
> >>>>>>>>> +            "platform:%s", dev_name(&pdev->dev));
> >>>>>>>>> +   unicam->mdev.hw_revision = 0;
> >>>>>>>>> +
> >>>>>>>>> +   media_device_init(&unicam->mdev);
> >>>>>>>>> +
> >>>>>>>>> +   unicam->v4l2_dev.mdev = &unicam->mdev;
> >>>>>>>>> +
> >>>>>>>>> +   ret = v4l2_device_register(&pdev->dev, &unicam->v4l2_dev);
> >>>>>>>>> +   if (ret) {
> >>>>>>>>> +           unicam_err(unicam,
> >>>>>>>>> +                      "Unable to register v4l2 device.\n");
> >>>>>>>>> +           goto err_unicam_put;
> >>>>>>>>> +   }
> >>>>>>>>> +
> >>>>>>>>> +   ret = media_device_register(&unicam->mdev);
> >>>>>>>>> +   if (ret < 0) {
> >>>>>>>>> +           unicam_err(unicam,
> >>>>>>>>> +                      "Unable to register media-controller device.\n");
> >>>>>>>>> +           goto err_v4l2_unregister;
> >>>>>>>>> +   }
> >>>>>>>>> +
> >>>>>>>>> +   /* Reserve space for the controls */
> >>>>>>>>> +   ret = v4l2_ctrl_handler_init(&unicam->ctrl_handler, 16);
> >>>>>>>>> +   if (ret < 0)
> >>>>>>>>> +           goto err_media_unregister;
> >>>>>>>>> +
> >>>>>>>>> +   /* set the driver data in platform device */
> >>>>>>>>> +   platform_set_drvdata(pdev, unicam);
> >>>>>>>>> +
> >>>>>>>>> +   ret = of_unicam_connect_subdevs(unicam);
> >>>>>>>>> +   if (ret) {
> >>>>>>>>> +           dev_err(&pdev->dev, "Failed to connect subdevs\n");
> >>>>>>>>> +           goto err_media_unregister;
> >>>>>>>>> +   }
> >>>>>>>>> +
> >>>>>>>>> +   /* Enable the block power domain */
> >>>>>>>>> +   pm_runtime_enable(&pdev->dev);
> >>>>>>>>> +
> >>>>>>>>> +   return 0;
> >>>>>>>>> +
> >>>>>>>>> +err_media_unregister:
> >>>>>>>>> +   media_device_unregister(&unicam->mdev);
> >>>>>>>>> +err_v4l2_unregister:
> >>>>>>>>> +   v4l2_device_unregister(&unicam->v4l2_dev);
> >>>>>>>>> +err_unicam_put:
> >>>>>>>>> +   unicam_put(unicam);
> >>>>>>>>> +
> >>>>>>>>> +   return ret;
> >>>>>>>>> +}
> >>>>>>>>> +
> >>>>>>>>> +static int unicam_remove(struct platform_device *pdev)
> >>>>>>>>> +{
> >>>>>>>>> +   struct unicam_device *unicam = platform_get_drvdata(pdev);
> >>>>>>>>> +
> >>>>>>>>> +   unicam_dbg(2, unicam, "%s\n", __func__);
> >>>>>>>>> +
> >>>>>>>>> +   v4l2_async_notifier_unregister(&unicam->notifier);
> >>>>>>>>> +   v4l2_device_unregister(&unicam->v4l2_dev);
> >>>>>>>>> +   media_device_unregister(&unicam->mdev);
> >>>>>>>>> +   unregister_nodes(unicam);
> >>>>>>>>> +
> >>>>>>>>> +   pm_runtime_disable(&pdev->dev);
> >>>>>>>>> +
> >>>>>>>>> +   return 0;
> >>>>>>>>> +}
> >>>>>>>>> +
> >>>>>>>>> +static const struct of_device_id unicam_of_match[] = {
> >>>>>>>>> +   { .compatible = "brcm,bcm2835-unicam", },
> >>>>>>>>> +   { /* sentinel */ },
> >>>>>>>>> +};
> >>>>>>>>> +MODULE_DEVICE_TABLE(of, unicam_of_match);
> >>>>>>>>> +
> >>>>>>>>> +static struct platform_driver unicam_driver = {
> >>>>>>>>> +   .probe          = unicam_probe,
> >>>>>>>>> +   .remove         = unicam_remove,
> >>>>>>>>> +   .driver = {
> >>>>>>>>> +           .name   = UNICAM_MODULE_NAME,
> >>>>>>>>> +           .of_match_table = of_match_ptr(unicam_of_match),
> >>>>>>>>> +   },
> >>>>>>>>> +};
> >>>>>>>>> +
> >>>>>>>>> +module_platform_driver(unicam_driver);
> >>>>>>>>> +
> >>>>>>>>> +MODULE_AUTHOR("Dave Stevenson <dave.stevenson@raspberrypi.com>");
> >>>>>>>>> +MODULE_DESCRIPTION("BCM2835 Unicam driver");
> >>>>>>>>> +MODULE_LICENSE("GPL");
> >>>>>>>>> +MODULE_VERSION(UNICAM_VERSION);
> >>>>>>>>> diff --git a/drivers/media/platform/bcm2835/vc4-regs-unicam.h b/drivers/media/platform/bcm2835/vc4-regs-unicam.h
> >>>>>>>>> new file mode 100644
> >>>>>>>>> index 000000000000..ae059a171d0f
> >>>>>>>>> --- /dev/null
> >>>>>>>>> +++ b/drivers/media/platform/bcm2835/vc4-regs-unicam.h
> >>>>>>>>> @@ -0,0 +1,253 @@
> >>>>>>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
> >>>>>>>>> +
> >>>>>>>>> +/*
> >>>>>>>>> + * Copyright (C) 2017-2020 Raspberry Pi Trading.
> >>>>>>>>> + * Dave Stevenson <dave.stevenson@raspberrypi.com>
> >>>>>>>>> + */
> >>>>>>>>> +
> >>>>>>>>> +#ifndef VC4_REGS_UNICAM_H
> >>>>>>>>> +#define VC4_REGS_UNICAM_H
> >>>>>>>>> +
> >>>>>>>>> +/*
> >>>>>>>>> + * The following values are taken from files found within the code drop
> >>>>>>>>> + * made by Broadcom for the BCM21553 Graphics Driver, predominantly in
> >>>>>>>>> + * brcm_usrlib/dag/vmcsx/vcinclude/hardware_vc4.h.
> >>>>>>>>> + * They have been modified to be only the register offset.
> >>>>>>>>> + */
> >>>>>>>>> +#define UNICAM_CTRL        0x000
> >>>>>>>>> +#define UNICAM_STA 0x004
> >>>>>>>>> +#define UNICAM_ANA 0x008
> >>>>>>>>> +#define UNICAM_PRI 0x00c
> >>>>>>>>> +#define UNICAM_CLK 0x010
> >>>>>>>>> +#define UNICAM_CLT 0x014
> >>>>>>>>> +#define UNICAM_DAT0        0x018
> >>>>>>>>> +#define UNICAM_DAT1        0x01c
> >>>>>>>>> +#define UNICAM_DAT2        0x020
> >>>>>>>>> +#define UNICAM_DAT3        0x024
> >>>>>>>>> +#define UNICAM_DLT 0x028
> >>>>>>>>> +#define UNICAM_CMP0        0x02c
> >>>>>>>>> +#define UNICAM_CMP1        0x030
> >>>>>>>>> +#define UNICAM_CAP0        0x034
> >>>>>>>>> +#define UNICAM_CAP1        0x038
> >>>>>>>>> +#define UNICAM_ICTL        0x100
> >>>>>>>>> +#define UNICAM_ISTA        0x104
> >>>>>>>>> +#define UNICAM_IDI0        0x108
> >>>>>>>>> +#define UNICAM_IPIPE       0x10c
> >>>>>>>>> +#define UNICAM_IBSA0       0x110
> >>>>>>>>> +#define UNICAM_IBEA0       0x114
> >>>>>>>>> +#define UNICAM_IBLS        0x118
> >>>>>>>>> +#define UNICAM_IBWP        0x11c
> >>>>>>>>> +#define UNICAM_IHWIN       0x120
> >>>>>>>>> +#define UNICAM_IHSTA       0x124
> >>>>>>>>> +#define UNICAM_IVWIN       0x128
> >>>>>>>>> +#define UNICAM_IVSTA       0x12c
> >>>>>>>>> +#define UNICAM_ICC 0x130
> >>>>>>>>> +#define UNICAM_ICS 0x134
> >>>>>>>>> +#define UNICAM_IDC 0x138
> >>>>>>>>> +#define UNICAM_IDPO        0x13c
> >>>>>>>>> +#define UNICAM_IDCA        0x140
> >>>>>>>>> +#define UNICAM_IDCD        0x144
> >>>>>>>>> +#define UNICAM_IDS 0x148
> >>>>>>>>> +#define UNICAM_DCS 0x200
> >>>>>>>>> +#define UNICAM_DBSA0       0x204
> >>>>>>>>> +#define UNICAM_DBEA0       0x208
> >>>>>>>>> +#define UNICAM_DBWP        0x20c
> >>>>>>>>> +#define UNICAM_DBCTL       0x300
> >>>>>>>>> +#define UNICAM_IBSA1       0x304
> >>>>>>>>> +#define UNICAM_IBEA1       0x308
> >>>>>>>>> +#define UNICAM_IDI1        0x30c
> >>>>>>>>> +#define UNICAM_DBSA1       0x310
> >>>>>>>>> +#define UNICAM_DBEA1       0x314
> >>>>>>>>> +#define UNICAM_MISC        0x400
> >>>>>>>>> +
> >>>>>>>>> +/*
> >>>>>>>>> + * The following bitmasks are from the kernel released by Broadcom
> >>>>>>>>> + * for Android - https://android.googlesource.com/kernel/bcm/
> >>>>>>>>> + * The Rhea, Hawaii, and Java chips all contain the same VideoCore4
> >>>>>>>>> + * Unicam block as BCM2835, as defined in eg
> >>>>>>>>> + * arch/arm/mach-rhea/include/mach/rdb_A0/brcm_rdb_cam.h and similar.
> >>>>>>>>> + * Values reworked to use the kernel BIT and GENMASK macros.
> >>>>>>>>> + *
> >>>>>>>>> + * Some of the bit mnenomics have been amended to match the datasheet.
> >>>>>>>>> + */
> >>>>>>>>> +/* UNICAM_CTRL Register */
> >>>>>>>>> +#define UNICAM_CPE         BIT(0)
> >>>>>>>>> +#define UNICAM_MEM         BIT(1)
> >>>>>>>>> +#define UNICAM_CPR         BIT(2)
> >>>>>>>>> +#define UNICAM_CPM_MASK            GENMASK(3, 3)
> >>>>>>>>> +#define UNICAM_CPM_CSI2            0
> >>>>>>>>> +#define UNICAM_CPM_CCP2            1
> >>>>>>>>> +#define UNICAM_SOE         BIT(4)
> >>>>>>>>> +#define UNICAM_DCM_MASK            GENMASK(5, 5)
> >>>>>>>>> +#define UNICAM_DCM_STROBE  0
> >>>>>>>>> +#define UNICAM_DCM_DATA            1
> >>>>>>>>> +#define UNICAM_SLS         BIT(6)
> >>>>>>>>> +#define UNICAM_PFT_MASK            GENMASK(11, 8)
> >>>>>>>>> +#define UNICAM_OET_MASK            GENMASK(20, 12)
> >>>>>>>>> +
> >>>>>>>>> +/* UNICAM_STA Register */
> >>>>>>>>> +#define UNICAM_SYN         BIT(0)
> >>>>>>>>> +#define UNICAM_CS          BIT(1)
> >>>>>>>>> +#define UNICAM_SBE         BIT(2)
> >>>>>>>>> +#define UNICAM_PBE         BIT(3)
> >>>>>>>>> +#define UNICAM_HOE         BIT(4)
> >>>>>>>>> +#define UNICAM_PLE         BIT(5)
> >>>>>>>>> +#define UNICAM_SSC         BIT(6)
> >>>>>>>>> +#define UNICAM_CRCE                BIT(7)
> >>>>>>>>> +#define UNICAM_OES         BIT(8)
> >>>>>>>>> +#define UNICAM_IFO         BIT(9)
> >>>>>>>>> +#define UNICAM_OFO         BIT(10)
> >>>>>>>>> +#define UNICAM_BFO         BIT(11)
> >>>>>>>>> +#define UNICAM_DL          BIT(12)
> >>>>>>>>> +#define UNICAM_PS          BIT(13)
> >>>>>>>>> +#define UNICAM_IS          BIT(14)
> >>>>>>>>> +#define UNICAM_PI0         BIT(15)
> >>>>>>>>> +#define UNICAM_PI1         BIT(16)
> >>>>>>>>> +#define UNICAM_FSI_S               BIT(17)
> >>>>>>>>> +#define UNICAM_FEI_S               BIT(18)
> >>>>>>>>> +#define UNICAM_LCI_S               BIT(19)
> >>>>>>>>> +#define UNICAM_BUF0_RDY            BIT(20)
> >>>>>>>>> +#define UNICAM_BUF0_NO             BIT(21)
> >>>>>>>>> +#define UNICAM_BUF1_RDY            BIT(22)
> >>>>>>>>> +#define UNICAM_BUF1_NO             BIT(23)
> >>>>>>>>> +#define UNICAM_DI          BIT(24)
> >>>>>>>>> +
> >>>>>>>>> +#define UNICAM_STA_MASK_ALL \
> >>>>>>>>> +           (UNICAM_DL + \
> >>>>>>>>> +           UNICAM_SBE + \
> >>>>>>>>> +           UNICAM_PBE + \
> >>>>>>>>> +           UNICAM_HOE + \
> >>>>>>>>> +           UNICAM_PLE + \
> >>>>>>>>> +           UNICAM_SSC + \
> >>>>>>>>> +           UNICAM_CRCE + \
> >>>>>>>>> +           UNICAM_IFO + \
> >>>>>>>>> +           UNICAM_OFO + \
> >>>>>>>>> +           UNICAM_PS + \
> >>>>>>>>> +           UNICAM_PI0 + \
> >>>>>>>>> +           UNICAM_PI1)
> >>>>>>>>> +
> >>>>>>>>> +/* UNICAM_ANA Register */
> >>>>>>>>> +#define UNICAM_APD         BIT(0)
> >>>>>>>>> +#define UNICAM_BPD         BIT(1)
> >>>>>>>>> +#define UNICAM_AR          BIT(2)
> >>>>>>>>> +#define UNICAM_DDL         BIT(3)
> >>>>>>>>> +#define UNICAM_CTATADJ_MASK        GENMASK(7, 4)
> >>>>>>>>> +#define UNICAM_PTATADJ_MASK        GENMASK(11, 8)
> >>>>>>>>> +
> >>>>>>>>> +/* UNICAM_PRI Register */
> >>>>>>>>> +#define UNICAM_PE          BIT(0)
> >>>>>>>>> +#define UNICAM_PT_MASK             GENMASK(2, 1)
> >>>>>>>>> +#define UNICAM_NP_MASK             GENMASK(7, 4)
> >>>>>>>>> +#define UNICAM_PP_MASK             GENMASK(11, 8)
> >>>>>>>>> +#define UNICAM_BS_MASK             GENMASK(15, 12)
> >>>>>>>>> +#define UNICAM_BL_MASK             GENMASK(17, 16)
> >>>>>>>>> +
> >>>>>>>>> +/* UNICAM_CLK Register */
> >>>>>>>>> +#define UNICAM_CLE         BIT(0)
> >>>>>>>>> +#define UNICAM_CLPD                BIT(1)
> >>>>>>>>> +#define UNICAM_CLLPE               BIT(2)
> >>>>>>>>> +#define UNICAM_CLHSE               BIT(3)
> >>>>>>>>> +#define UNICAM_CLTRE               BIT(4)
> >>>>>>>>> +#define UNICAM_CLAC_MASK   GENMASK(8, 5)
> >>>>>>>>> +#define UNICAM_CLSTE               BIT(29)
> >>>>>>>>> +
> >>>>>>>>> +/* UNICAM_CLT Register */
> >>>>>>>>> +#define UNICAM_CLT1_MASK   GENMASK(7, 0)
> >>>>>>>>> +#define UNICAM_CLT2_MASK   GENMASK(15, 8)
> >>>>>>>>> +
> >>>>>>>>> +/* UNICAM_DATn Registers */
> >>>>>>>>> +#define UNICAM_DLE         BIT(0)
> >>>>>>>>> +#define UNICAM_DLPD                BIT(1)
> >>>>>>>>> +#define UNICAM_DLLPE               BIT(2)
> >>>>>>>>> +#define UNICAM_DLHSE               BIT(3)
> >>>>>>>>> +#define UNICAM_DLTRE               BIT(4)
> >>>>>>>>> +#define UNICAM_DLSM                BIT(5)
> >>>>>>>>> +#define UNICAM_DLFO                BIT(28)
> >>>>>>>>> +#define UNICAM_DLSTE               BIT(29)
> >>>>>>>>> +
> >>>>>>>>> +#define UNICAM_DAT_MASK_ALL (UNICAM_DLSTE + UNICAM_DLFO)
> >>>>>>>>> +
> >>>>>>>>> +/* UNICAM_DLT Register */
> >>>>>>>>> +#define UNICAM_DLT1_MASK   GENMASK(7, 0)
> >>>>>>>>> +#define UNICAM_DLT2_MASK   GENMASK(15, 8)
> >>>>>>>>> +#define UNICAM_DLT3_MASK   GENMASK(23, 16)
> >>>>>>>>> +
> >>>>>>>>> +/* UNICAM_ICTL Register */
> >>>>>>>>> +#define UNICAM_FSIE                BIT(0)
> >>>>>>>>> +#define UNICAM_FEIE                BIT(1)
> >>>>>>>>> +#define UNICAM_IBOB                BIT(2)
> >>>>>>>>> +#define UNICAM_FCM         BIT(3)
> >>>>>>>>> +#define UNICAM_TFC         BIT(4)
> >>>>>>>>> +#define UNICAM_LIP_MASK            GENMASK(6, 5)
> >>>>>>>>> +#define UNICAM_LCIE_MASK   GENMASK(28, 16)
> >>>>>>>>> +
> >>>>>>>>> +/* UNICAM_IDI0/1 Register */
> >>>>>>>>> +#define UNICAM_ID0_MASK            GENMASK(7, 0)
> >>>>>>>>> +#define UNICAM_ID1_MASK            GENMASK(15, 8)
> >>>>>>>>> +#define UNICAM_ID2_MASK            GENMASK(23, 16)
> >>>>>>>>> +#define UNICAM_ID3_MASK            GENMASK(31, 24)
> >>>>>>>>> +
> >>>>>>>>> +/* UNICAM_ISTA Register */
> >>>>>>>>> +#define UNICAM_FSI         BIT(0)
> >>>>>>>>> +#define UNICAM_FEI         BIT(1)
> >>>>>>>>> +#define UNICAM_LCI         BIT(2)
> >>>>>>>>> +
> >>>>>>>>> +#define UNICAM_ISTA_MASK_ALL (UNICAM_FSI + UNICAM_FEI + UNICAM_LCI)
> >>>>>>>>> +
> >>>>>>>>> +/* UNICAM_IPIPE Register */
> >>>>>>>>> +#define UNICAM_PUM_MASK            GENMASK(2, 0)
> >>>>>>>>> +           /* Unpacking modes */
> >>>>>>>>> +           #define UNICAM_PUM_NONE         0
> >>>>>>>>> +           #define UNICAM_PUM_UNPACK6      1
> >>>>>>>>> +           #define UNICAM_PUM_UNPACK7      2
> >>>>>>>>> +           #define UNICAM_PUM_UNPACK8      3
> >>>>>>>>> +           #define UNICAM_PUM_UNPACK10     4
> >>>>>>>>> +           #define UNICAM_PUM_UNPACK12     5
> >>>>>>>>> +           #define UNICAM_PUM_UNPACK14     6
> >>>>>>>>> +           #define UNICAM_PUM_UNPACK16     7
> >>>>>>>>> +#define UNICAM_DDM_MASK            GENMASK(6, 3)
> >>>>>>>>> +#define UNICAM_PPM_MASK            GENMASK(9, 7)
> >>>>>>>>> +           /* Packing modes */
> >>>>>>>>> +           #define UNICAM_PPM_NONE         0
> >>>>>>>>> +           #define UNICAM_PPM_PACK8        1
> >>>>>>>>> +           #define UNICAM_PPM_PACK10       2
> >>>>>>>>> +           #define UNICAM_PPM_PACK12       3
> >>>>>>>>> +           #define UNICAM_PPM_PACK14       4
> >>>>>>>>> +           #define UNICAM_PPM_PACK16       5
> >>>>>>>>> +#define UNICAM_DEM_MASK            GENMASK(11, 10)
> >>>>>>>>> +#define UNICAM_DEBL_MASK   GENMASK(14, 12)
> >>>>>>>>> +#define UNICAM_ICM_MASK            GENMASK(16, 15)
> >>>>>>>>> +#define UNICAM_IDM_MASK            GENMASK(17, 17)
> >>>>>>>>> +
> >>>>>>>>> +/* UNICAM_ICC Register */
> >>>>>>>>> +#define UNICAM_ICFL_MASK   GENMASK(4, 0)
> >>>>>>>>> +#define UNICAM_ICFH_MASK   GENMASK(9, 5)
> >>>>>>>>> +#define UNICAM_ICST_MASK   GENMASK(12, 10)
> >>>>>>>>> +#define UNICAM_ICLT_MASK   GENMASK(15, 13)
> >>>>>>>>> +#define UNICAM_ICLL_MASK   GENMASK(31, 16)
> >>>>>>>>> +
> >>>>>>>>> +/* UNICAM_DCS Register */
> >>>>>>>>> +#define UNICAM_DIE         BIT(0)
> >>>>>>>>> +#define UNICAM_DIM         BIT(1)
> >>>>>>>>> +#define UNICAM_DBOB                BIT(3)
> >>>>>>>>> +#define UNICAM_FDE         BIT(4)
> >>>>>>>>> +#define UNICAM_LDP         BIT(5)
> >>>>>>>>> +#define UNICAM_EDL_MASK            GENMASK(15, 8)
> >>>>>>>>> +
> >>>>>>>>> +/* UNICAM_DBCTL Register */
> >>>>>>>>> +#define UNICAM_DBEN                BIT(0)
> >>>>>>>>> +#define UNICAM_BUF0_IE             BIT(1)
> >>>>>>>>> +#define UNICAM_BUF1_IE             BIT(2)
> >>>>>>>>> +
> >>>>>>>>> +/* UNICAM_CMP[0,1] register */
> >>>>>>>>> +#define UNICAM_PCE         BIT(31)
> >>>>>>>>> +#define UNICAM_GI          BIT(9)
> >>>>>>>>> +#define UNICAM_CPH         BIT(8)
> >>>>>>>>> +#define UNICAM_PCVC_MASK   GENMASK(7, 6)
> >>>>>>>>> +#define UNICAM_PCDT_MASK   GENMASK(5, 0)
> >>>>>>>>> +
> >>>>>>>>> +/* UNICAM_MISC register */
> >>>>>>>>> +#define UNICAM_FL0         BIT(6)
> >>>>>>>>> +#define UNICAM_FL1         BIT(9)
> >>>>>>>>> +
> >>>>>>>>> +#endif

-- 
Regards,

Laurent Pinchart
