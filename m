Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 749CB24A484
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 18:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbgHSQ52 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 12:57:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726731AbgHSQ5H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 12:57:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E7B0C061757;
        Wed, 19 Aug 2020 09:57:06 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8175329E;
        Wed, 19 Aug 2020 18:56:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597856219;
        bh=JSMuV5nAqp9B18iMvO4sKVXd8MjalDF0a0uByYXBzuw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GVLkRIrCYOJf1UNRl4LLIVufPjmaatK0mmlWAGyeaFVSQL+fT9Y4xTVY7bO+30Kbp
         Z6SwSWnw5mdu6D1H5au9CIcWREIVZSs0nFN7euhzh2Cf/NClI8HiwY4hZWppQqaD5U
         ljH7aYtrkszJRobor9w6E4k1Q8NsXRnNtrn6bsA8=
Date:   Wed, 19 Aug 2020 19:56:41 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Vishal Sagar <vsagar@xilinx.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Hyun Kwon <hyunk@xilinx.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Michal Simek <michals@xilinx.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "joe@perches.com" <joe@perches.com>,
        Sandip Kothari <sandipk@xilinx.com>,
        Dinesh Kumar <dineshk@xilinx.com>
Subject: Re: [PATCH v3 3/3] media: v4l: xilinx: Add Xilinx UHD-SDI Rx
 Subsystem driver
Message-ID: <20200819165641.GS6049@pendragon.ideasonboard.com>
References: <20200618053304.14551-1-vishal.sagar@xilinx.com>
 <20200618053304.14551-4-vishal.sagar@xilinx.com>
 <50cc4f4b-e788-c5ad-cd6a-b428b96d5377@xs4all.nl>
 <20200715213315.GF6144@pendragon.ideasonboard.com>
 <BY5PR02MB6867211CA1F22DC01D6A8F15A75D0@BY5PR02MB6867.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BY5PR02MB6867211CA1F22DC01D6A8F15A75D0@BY5PR02MB6867.namprd02.prod.outlook.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vishal,

(Hans, there's a question for you below)

On Wed, Aug 19, 2020 at 01:47:49PM +0000, Vishal Sagar wrote:
> On Thursday, July 16, 2020 3:03 AM Laurent Pinchart wrote:
> > On Thu, Jun 25, 2020 at 11:43:01AM +0200, Hans Verkuil wrote:
> > > On 18/06/2020 07:33, Vishal Sagar wrote:
> > > > The Xilinx UHD-SDI Rx subsystem soft IP is used to capture native SDI
> > > > streams from SDI sources like SDI broadcast equipment like cameras and
> > > > mixers. This block outputs either native SDI, native video or
> > > > AXI4-Stream compliant data stream for further processing. Please refer
> > > > to PG290 for details.
> > > >
> > > > The driver is used to configure the IP to add framer, search for
> > > > specific modes, get the detected mode, stream parameters, errors, etc.
> > > > It also generates events for video lock/unlock, bridge over/under flow.
> > > >
> > > > The driver supports 10/12 bpc YUV 422 media bus format currently. It
> > > > also decodes the stream parameters based on the ST352 packet embedded in the
> > > > stream. In case the ST352 packet isn't present in the stream, the core's
> > > > detected properties are used to set stream properties.
> > > >
> > > > The driver currently supports only the AXI4-Stream IP configuration.
> > > >
> > > > Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
> > > > ---
> > > > v3
> > > > - fixed KConfig with better description
> > > > - removed unnecessary header files
> > > > - converted uppercase to lowercase for all hex values
> > > > - merged core struct to state struct
> > > > - removed most one line functions and replaced with direct reg
> > > >   read/write or macros
> > > > - dt property bpp to bpc. default 10. not mandatory.
> > > > - fixed subscribe events, log_status, s_stream
> > > > - merged overflow/underflow to one event
> > > > - moved all controls to xilinx-sdirxss.h
> > > > - max events from 128 to 8
> > > > - used FIELD_GET() instead of custom macro
> > > > - updated the controls documentation
> > > > - added spinlock
> > > > - removed 3GB control and added mode to detect bitmask
> > > > - fixed format for (width, height, colorspace, xfer func, etc)
> > > > - added dv_timings_cap, s/g_dv_timings
> > > > - fixed set/get_format
> > > > - fix v4l control registrations
> > > > - fix order of registration / deregistration in probe() remove()
> > > > - fixed other comments from Hyun, Laurent and Hans
> > > > - things yet to close
> > > >   - adding source port for connector (Laurent's suggestion)
> > > >   - adding new FIELD type for Transport Stream V4L2_FIELD_ALTERNATE_PROG (Han's suggestion)
> > > >   - Update / remove EDH or CRC related controls
> > > >
> > > > v2
> > > > - Added DV timing support based on Hans Verkuilś feedback
> > > > - More documentation to custom v4l controls and events
> > > > - Fixed Hyunś comments
> > > > - Added macro for masking and shifting as per Joe Perches comments
> > > > - Updated to latest as per Xilinx github repo driver like
> > > >   adding new DV timings not in mainline yet uptill 03/21/20
> > > >
> > > >  drivers/media/platform/xilinx/Kconfig         |   11 +
> > > >  drivers/media/platform/xilinx/Makefile        |    1 +
> > > >  .../media/platform/xilinx/xilinx-sdirxss.c    | 2121 +++++++++++++++++
> > > >  include/uapi/linux/v4l2-controls.h            |    6 +
> > > >  include/uapi/linux/xilinx-sdirxss.h           |  283 +++
> > > >  5 files changed, 2422 insertions(+)
> > > >  create mode 100644 drivers/media/platform/xilinx/xilinx-sdirxss.c
> > > >  create mode 100644 include/uapi/linux/xilinx-sdirxss.h

[snip]

> > > > diff --git a/drivers/media/platform/xilinx/xilinx-sdirxss.c b/drivers/media/platform/xilinx/xilinx-sdirxss.c
> > > > new file mode 100644
> > > > index 000000000000..e39aab7c656a
> > > > --- /dev/null
> > > > +++ b/drivers/media/platform/xilinx/xilinx-sdirxss.c
> > > > @@ -0,0 +1,2121 @@

[snip]

> > > > +	case V4L2_CID_XILINX_SDIRX_TS_IS_INTERLACED:
> > > > +		ctrl->val = xsdirxss->ts_is_interlaced;
> > > > +		break;
> > >
> > > I assume this control will disappear once you added support for
> > > FIELD_ALTERNATE_PROG?
> > 
> > I'm not sure FIELD_ALTERNATE_PROG is a good idea. The v4l2_field
> > specifies today how frames are split into multiple buffers. There's an
> > implicit assumption that a frame split into two buffers is captured with
> > interlacing. In the SDI case, the two concepts get decoupled, a
> > progressive frame can be transmitted (and captured) in two separate
> > parts. If we add a *_PROG field, we'll need to duplicate most of the
> > v4l2_field values with a _PROG suffix, as the progressive frame can be
> > captured in alternate buffers on a video node, but also in separate odd
> > and even buffers on two video nodes. Tt the hardware level, data is
> > transmitted with odd lines on one link, and even lines on a second link.
> > There are then two instances of this IP core, one for each link. One
> > instance would receive and process the even lines, the other instance
> > the odd lines. The output of the two instances can then be connected to
> > two separate DMA engines, or combined in the FPGA fabric, depending on
> > how the user designs the system.
> 
> My apologies to give incorrect info regarding this.
> In the progressive segmented frame, a progressive captured frame is sent
> across to receiver over an interlaced transport. The 2 fields received
> are similar to how V4L2_FIELD_ALTERNATE is except that the fields weren't
> captured at 2 different times.

I've now read more about progressive segmented frames, and I was indeed
wrong about the fact that the two segments are transported over
different links.

I still wonder, however, if a _PROG suffix is the best option. Wouldn't
we need to also add V4L2_FIELD_TOP_PROG, V4L2_FIELD_BOTTOM_PROG,
V4L2_FIELD_SEQ_TB_PROG and V4L2_FIELD_SEQ_BT_PROG, not necessarily for
this driver, but for other devices that would support capturing the
odd/even segments only, or support capturing both segments in a single
buffer, one after the other ?

Maybe that's unavoidable, as enum v4l2_field combines both the buffer
layout and the fact that the frame is interlaced or progressive. If we
had to redesign it we could do better, but having to keep backward
compatibility, duplicating most values with a _PROG suffix may be the
best option.

Hans, any opinion ?

> So I will add the V4L2_FIELD_ALTERNATE_PROG in next patch version.

[snip]

-- 
Regards,

Laurent Pinchart
