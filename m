Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3A4712426
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2019 23:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726231AbfEBVcY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 May 2019 17:32:24 -0400
Received: from mga06.intel.com ([134.134.136.31]:29953 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726128AbfEBVcY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 May 2019 17:32:24 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 May 2019 14:32:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,423,1549958400"; 
   d="scan'208";a="136359276"
Received: from navneet1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.252.48.157])
  by orsmga007.jf.intel.com with ESMTP; 02 May 2019 14:32:08 -0700
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
        id F17F521DD2; Fri,  3 May 2019 00:32:02 +0300 (EEST)
Date:   Fri, 3 May 2019 00:32:02 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: Route lifetime in SUBDEV_[GS]_ROUTING
Message-ID: <20190502213202.62sglrhgdgqiujsp@kekkonen.localdomain>
References: <20190417104147.zlmbw32dr46vmtrq@paasikivi.fi.intel.com>
 <20190423101932.gszkn4olqatoisde@uno.localdomain>
 <20190423132839.3rybeo4rolzu6cfb@kekkonen.localdomain>
 <20190426230042.soeb7wqxd56grn72@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190426230042.soeb7wqxd56grn72@uno.localdomain>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Sat, Apr 27, 2019 at 01:00:42AM +0200, Jacopo Mondi wrote:
> HI Sakari,
> 
> On Tue, Apr 23, 2019 at 04:28:40PM +0300, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > On Tue, Apr 23, 2019 at 12:19:32PM +0200, Jacopo Mondi wrote:
> > > Hi Sakari,
> > >
> > > On Wed, Apr 17, 2019 at 01:41:48PM +0300, Sakari Ailus wrote:
> > > > Hi Jacopo,
> > > >
> > > > I promised to write a bit about the routing problem I attempted to write on
> > > > #v4l. It's a bit late, but here it is. Let me know if you share my
> > > > understanding (and especially do so if you don't :)).
> > >
> > > Thanks for doing this, and sorry it took me a while to reply!
> > >
> > > >
> > > > A route is identified by the source and sink pads as well as the stream ID
> > > > on the source and the sink pads. Its flags allow enabling or disabling a
> > > > route.
> > > >
> > > > Most devices that function as transmitters (such as sensors) have a fixed
> > > > number of routes they can support. These's no need to change them; enabling
> > > > and disabling them will be enough for the user.
> > > >
> > >
> > > Fine so far.
> > >
> > > We indeed define routes as:
> > > (sink pad - sink stream) -> (source pad - source stream)
> > >
> > > > For receivers this is different. What needs to be supported on the receiver
> > > > side is directing any incoming stream (a 32-bit unsigned integer) to any
> > > > source pad.
> > > >
> > > > This is because pads are not alike --- one may be connected to a block that
> > > > further processes the image whereas the others may be connected to a DMA
> > > > engine, just writing the data to memory.
> > > >
> > > > The receivers also may not make assumptions beyond the sub-device API: the
> > > > stream is a 32-bit unsigned integer, there is currently no API requirement
> > > > to have the stream IDs on a particular low integer range. In principle we
> > > > could define that range, but I'd rather try to find better solutions than
> > > > that: it's hard to come up with a number as it depends on the hardware.
> > > > Some kind of an upper limit could be the number of CSI-2 channels
> > > > multiplied by CSI-2 data types. That would be enough for CSI-2. 16 or 32
> > > > virtual channels and up to 64 data types would mean up to 2048 routes
> > > > between a demultiplexer's sink pad and *each* of its source pads. And this
> > > > comes with an assumption that the source pads only support a single
> > > > stream...
> > >
> > > I lost you here.
> > >
> > > My mental model was far more (too?) simple:
> > >
> > > - Routing tables inside an entity might have an arbitrary size, as how
> > >   that configuration depends on the device and the driver
> > >   implementation. As an example, the adv748x accepts 7 analogue
> > >   inputs to chose from and route to a CSI-2 source pad.
> > >   depending on the implementation, those 7 inputs could be modeled as
> > >   7 pads with one stream each, or a single pad with 7 channels or
> > >   whatever else, and I agree the 'stream_id' values range is totally
> > >   up to the driver implementation -inside an entity-.
> > >
> > > - The cross-entity (sorry, I lack a better term here) multiplexing
> > >   happens on physical bus that allows so, and I can only think of
> > >   CSI-2 at the moment. Sure, you could share the lines of a parallel
> > >   bus playing with enables/disables of the transmitters, but this
> > >   is a custom hack that does not play well in this model.
> > >   Each CSI-2 source pad has up to 4 streams (one per VC) and the
> > >   content of those streams is retrieved from the transmitter by the
> > >   receiver through the remote frame_desc operation [*], as receivers
> > >   might need to be setup using to filter on particular VC/DT combinations
> > >   to receive the stream.
> >
> > Note that the concept of a "stream" is different in our proposed API and in
> > CSI-2 (virtual channel): on CSI-2 virtual channels can carry multiple data
> > types but in our definition they do not. That means there will be more
> > streams on SUBDEV_[GS]_ROUTING API than there are on a CSI-2 bus.
> >
> > We also do not limit the use of the new API to old CSI-2 D-PHYs that
> > only support four virtual channels. Therefore we need to think how this
> > would work on 16 or 32 virtual channels, and preferrably not posing
> > problems with larger numbers either.
> >
> 
> Indeed, each stream carries one DT and can be sent in one VC, so at least
> 64*4 possible routes (per source pad) for what is currently specified by
> CSI-2 and maybe up to 64*32 to have space for future extensions as you
> explained below.
> 
> I agree, 2048 routes per source pad is not an easily manageable number
> of entries for a routing table.
> 
> > >
> > > - Each CSI-2 receiver sink pad supports 4 streams (the CSI-2 VCs) and any
> > >   of those streams can be directed to any of its source pads, to
> > >   implement what you have described (one pad connected to an ISP-like
> > >   device, on other to the DMA engine directly etc)
> > >
> > > - DT negotiation is still a bit vague. The example we have on the
> > >   series (adv748x and r-car csi2) configure the receiver's accepted DT
> > >   inspecting the remote frame_desc. Again, as per [*] this migh be
> > >   limitied to 1 DT for VC, which might not be enough and would require
> > >   re-thinking the operation used for the negotiation.
> > >
> > > - Configuring a multiplexed source pad image format is today not
> > >   possible, the format is always propagated from the sink pad to which
> > >   a route is enabled to the source pad. Might this be a limitation on
> > >   how we control which DTs are multiplexed inside a VC and won't allow
> > >   to model any format conversion that might happen at the source pad
> > >   output. I was toying myself with the idea of a stream-aware set
> > >   format operation for multiplexed source pads, not sure it might work
> > >   though.
> > >
> > > Can I ask you why:
> > > - you mention 16 or 32 VCs ? Each CSI-2 link supports up to 4.
> >
> > See above.
> >
> > > - you put DT in the routing mix, and I suspect it is here where our
> > >   disconnection happens. I always assume DT configuration as a result
> > >   of a format configuration operation, which currently has limitations
> > >   as noted here above.
> >
> > Yes; DT comes from the format and is generally determined by the
> > transmitting driver. Nothing else limits the number of DTs on a VC except
> > the number of DTs --- which is currently 64.
> >
> > >
> > >
> > > [*] I would later like to talk about if this is the most appropriate
> > > operation to handle this negotiation, as I'm not sure we can handle DT
> > > negotiation properly with that, but that's for later.
> > >
> > > >
> > > > CSI-2 receivers support a number of simultaneous streams, and as the stream
> > > > is demultiplexed there, this means there will be as many source pads as
> > > > there are supported simultaneous streams. This heavily depe`nds on the
> > > > hardware, but the number could be e.g. 1, 4 or 8. Much smaller than 2048 in
> > > > any case.
> > > >
> > >
> > > Why 8? Is this related to DT multiplexing again?
> >
> > Yes and no. It's just a random number between 1 and 2048. :-)
> >
> > >
> > > > Another option could be creating no routes at all at device init time, and
> > > > letting the user create them. We could add a new flag for routes telling
> > > > that a route is dynamic: disabling a dynamic route would simply delete it.
> > > > Likewise, a SUBDEV_G_ROUTING returning no routes (but no error either)
> > > > would also tell the user only dynamic routes are supported.
> > > >
> 
> I see your point, but I cannot see how one would easily map a stream_id to a
> DT/VC combination. One way would be:
>         DT = stream_id % 64; VC = stream_id / 64;
> 
> Just to make sure we're on the same page, how would you enable/disable
> transmitting, say, embedded data (DT=18) on VC=2? By enabling/disabling
> the stream_id 146 ( = 18 + 64 * 2) ?

The stream ID that is used by the receiver must match that used on the
transmitter. So presumably the transmitter will use a reasonable small
integer number for that stream. The number of streams on the transmitter
side is typically small, even if the maximum possible value is large. All
the user needs to do is to use the same integer on the receiver's routing
setup. The virtual channel or the data type aren't visible in the uAPI
anyway.

Does this answer the question? We could try discussing this on #v4l to
converge faster. :-)

-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
