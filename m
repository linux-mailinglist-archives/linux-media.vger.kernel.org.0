Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDA9115ADAA
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2020 17:49:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727372AbgBLQtB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Feb 2020 11:49:01 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38178 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726728AbgBLQtB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Feb 2020 11:49:01 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0EB8F808;
        Wed, 12 Feb 2020 17:48:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1581526138;
        bh=MXpYmJwRpRe/BMkABAR68omvUK7oP/moTlZ0WuwDrvY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RoQxot80xrj+/nwgRJDK6mFGRW+CMUuGd4qune1SIwmWQsFUZQ/qV18Y0pPYxYapf
         EW058rLsL9qsTDu6AdfbqmsD0HjfZJIyJOH9fefWn21RnlVzb13SKgiWw8MqdZqMY4
         v1S8wjZuwzG/f6WaumAaKZn+HOD6O3pjDpdr8cnc=
Date:   Wed, 12 Feb 2020 18:48:41 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Dylan Yip <dylany@xilinx.com>, Vishal Sagar <vsagar@xilinx.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Varunkumar Allagadapa <VARUNKUM@xilinx.com>,
        Madhurkiran Harikrishnan <MADHURKI@xilinx.com>,
        Jianqiang Chen <jianqian@xilinx.com>,
        Hyun Kwon <hyunk@xilinx.com>,
        Cyril Chemparathy <cyrilc@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>,
        Subhransu Sekhar Prusty <sprusty@xilinx.com>,
        Anil Kumar Chimbeti <anilchc@xilinx.com>
Subject: Re: [RFC] V4L HDR Architecture Proposal
Message-ID: <20200212164841.GB17926@pendragon.ideasonboard.com>
References: <BYAPR02MB57027075B640D2F530E890E8B00C0@BYAPR02MB5702.namprd02.prod.outlook.com>
 <825d563b-7cb7-5055-d1af-b9b8eba1deb9@xs4all.nl>
 <CY4PR02MB314231543765B9CC09C0735BA70E0@CY4PR02MB3142.namprd02.prod.outlook.com>
 <589f1e75-8925-3482-38d8-e354a067f1db@xs4all.nl>
 <20200124120844.GA4996@pendragon.ideasonboard.com>
 <BYAPR02MB57020B91E827ACC33B50B8AFB0050@BYAPR02MB5702.namprd02.prod.outlook.com>
 <57be8b72-c60b-cb65-7fe0-cb82ab49b0d5@xs4all.nl>
 <BYAPR02MB57027E43976016F724795E86B0040@BYAPR02MB5702.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <BYAPR02MB57027E43976016F724795E86B0040@BYAPR02MB5702.namprd02.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Jan 30, 2020 at 07:00:12AM +0000, Dylan Yip wrote:
> On Tuesday, January 28, 2020 11:31 PM, Hans Verkuil wrote:
> > On 1/29/20 7:14 AM, Dylan Yip wrote:
> >> On Friday, January 24, 2020 4:09 AM, Laurent Pinchart wrote:
> >>> On Fri, Jan 24, 2020 at 11:10:06AM +0100, Hans Verkuil wrote:
> >>>> On 1/24/20 10:04 AM, Vishal Sagar wrote:
> >>>>> On Thursday, January 23, 2020 6:36 PM, Hans Verkuil wrote:
> >>>>>> On 1/22/20 9:13 PM, Dylan Yip wrote:
> >>>>>>> Hi All,
> >>>>>>>
> >>>>>>> We are planning to add HDR10 and HDR10+ metadata support into the
> >>>>>>> V4L framework and were hoping for some feedback before we started
> >>>>>>> implementation.
> >>>>>>
> >>>>>> Nice!
> >>>>>>
> >>>>>>> For context, Xilinx HDMI RX IP currently uses a AXI LITE
> >>>>>>> interface where HDR metadata is obtained from a hardware FIFO. To
> >>>>>>> access these packets a CPU copy is required.
> >>>>>>> We are in the process of migrating towards a AXI MM interface
> >>>>>>> where the hardware will directly write HDR metadata into memory.
> >>>>>>> Currently the HDMI RX driver (https://github.com/Xilinx/hdmi-
> >>>>>>> modules/blob/master/hdmi/xilinx-hdmirx.c) is modeled as a v4l
> >>>>>>> subdev. This is linked to a DMA IP which utilizes the DMA engine
> >>>>>>> APIs and registers itself as a video node for video data.
> >>>>>>>
> >>>>>>> HDR10 will only consist of static metadata which will come once
> >>>>>>> per stream.
> >>>>>>> However, HDR10+ will have dynamic metadata which can potentially
> >>>>>>> come once per frame and be up to ~4000 bytes. We would like V4L
> >>>>>>> architecture to be flexible to support both.
> >>>>>>
> >>>>>> The key here is the difference between Extended InfoFrames that
> >>>>>> can be long and the others, that have a maximum size. The latter
> >>>>>> should be handled by controls, the first is more difficult.
> >>>>>
> >>>>> Are you suggesting to handle static HDR via read only v4l controls
> >>>>> in a meta video node?
> >>>>
> >>>> Yes. It's very suitable for that purpose.
> >>
> >> So are you saying we should create a separate metadata node and add the
> >> v4l control there or would we add the v4l control to the existing video data
> >> node? If it is the former, what's the point of creating the metadata node
> >> since we won't qbuf/dqbuf to it?
> > 
> > I'm sorry, I misread your original question. Static HDR should be handled via
> > read only v4l controls in the existing video node, not in a meta video node.
> 
> Ah thanks for the clarification.
>
> >>>>>> Can you tell a bit more about how the hardware operates? Are all
> >>>>>> InfoFrames obtained through the hw fifo, or are some stored in
> >>>>>> registers and some go through the fifo?
> >>>>>
> >>>>> In the current implementation of the HDMI Rx IP, all InfoFrames are
> >>>>> read from a register byte by byte which has FIFO at the back.
> >>>>> The register is accessible by an AXI Lite interface.
> >>>>> The FIFO can store maximum 8 packets. Each packet is 36 bytes in
> >>>>> size (31 bytes data and 5 bytes ECC calculated by IP).
> >>>>> InfoFrames are one type of packets.
> >>>>
> >>>> Does one packet correspond to one InfoFrame? Or are they all
> >>>> concatenated and hacked up into packets for the FIFO?
> >>>>
> >>>> This probably won't work well for large Extended InfoFrames of 4kB
> >>>> or more: the driver would have to be able to read from the FIFO very
> >>>> quickly in order to prevent data from being lost, right? Hence the
> >>>> development of the AXIMM interface referred to below.
> >>>>
> >>>>> There are other types like General Control Packet, Audio Clock
> >>>>> Regeneration Packet, etc. referred in Table 5-8 packet types in
> >>>>> HDMI specification v1.4b)
> >>>>>
> >>>>> In future we plan on adding an AXIMM interface in the IP to handle
> >>>>> Dynamic HDR. The tentative behavior will be as below - The driver
> >>>>> will provide a buffer pointer to the IP via a register. The IP will dump
> >>>>> the infoframes's extracted data into this buffer.
> >>>>> With Frame sync, IP will return the length of the buffer in the
> >>>>> provided buffer.
> >>>>>
> >>>>>> Does the hardware set maximum sizes for specific InfoFrames or the
> >>>>>> total size of all InfoFrames combined? Or can it be any size?
> >>>>>>
> >>>>> Hope the above info about FIFO depth for current HDMI Rx IP answers
> >>>>> this.
> >>>>
> >>>> Right, so the driver will provide the maximum size for all
> >>>> InfoFrames that can occur between two video frames.
> >>>>
> >>>> And the driver will parse the received InfoFrames.
> >>>>
> >>>> I am strongly leaning towards using a control for the HDR10+
> >>>> InfoFrame as well: it fits well with the Request API where controls
> >>>> can be cleanly associated with a specific video frame, and the
> >>>> amount of data isn't that large.
> >>>
> >>> This however leads me to a simple question: why do we have a metadata
> >>> API in the first place if everything should go through controls ?
> 
> I have the same concern as Laurent here. Why are we supporting HDR
> metadata through controls but using the metadata API for other types
> of metadata? Wouldn't it be cleaner to follow the existing metadata
> API since HDR is a type of metadata?
> 
> This is why we were originally thinking that a 2 node approach (1 for
> video 1 for metadata) would have been cleaner. 

I would also like to add that the implementation of the request API is
currently not able to support inline devices (with a live source). This
could be changed, but would require a very significant amount of work if
we want to implement it properly. As we already have a metadata capture
API, I really don't see why this should go through the control
framework.

Regarding HDR10 static metadata, while I agree that controls should work
for this purpose, I think we also need to take into account API
consistency. If we use the metadata API for dynamic metadata, we will
end up with two different APIs to cary two different types of metadata.
Is this desirable, or, given that we already plan for HDR10+ support,
would implementing HDR10 support through the metadata API be a better
solution for userspace ?

> >>>> That said, some work in the control framework is probably needed to
> >>>> streamline things a bit: 
> >>>>
> >>>> 1) it should be possible to increase the size of compound controls
> >>>> later if new fields are added. This is on the TODO list already since
> >>>> it is desired functionality for codecs.
> >>>>
> >>>> 2) tentative, needs research first: add some sort of mechanism to
> >>>> mmap the control payload to avoid mem copies. That would make controls
> >>>> much more useful for large metadata.
> >>>
> >>> Let's not forget that we would then also need to mmap the control per
> >>> request, which will become challenging if we want to be able to
> >>> pre-map everything like we do for buffers instead of mapping and
> >>> unmapping for every request.
> 
> Same concern here. If we want to pre-map everything like buffers,
> wouldn't we essentially be replicating the behavior of buffers. Then
> the only difference would be that we are doing g_ctrl instead of
> qbuf/dqbuf right?

I couldn't have said that better :-)

> >>>> I'm not sure when I will have time to work on that, though.
> >>>>
> >>>>>> Does it accept any InfoFrame or only specific InfoFrame types? Or
> >>>>>> is this programmable?
> >>>>>
> >>>>> HDMI Rx IP accepts all types of InfoFrames.
> >>>>>
> >>>>>>> We have 2 different proposals that we believe will work:
> >>>>>>>
> >>>>>>> A. 2 video node approach (1 for video, 1 for metadata) - This will
> >>>>>>>    align with current v4l metadata structure (i.e. uvc) but
> >>>>>>>    will require our HDMI RX driver to register a subdev and
> >>>>>>>    device node
> >>>>>>> 	a. Our HDMI RX driver will register a v4l subdev (for
> >>>>>>> 	   video data) and a metadata node
> >>>>>>> 		i. Is this acceptable?
> >>>>>>> 	b. Applications will qbuf/dqbuf to both video and metadata nodes
> >>>>>>> 	   for each frame
> >>>>>>>
> >>>>>>> B. 1 video node approach - This will avoid mixing v4l subdev and
> >>>>>>>    v4l device node functionality inside HDMI RX driver but it
> >>>>>>>    strays from current v4l metadata architecture and also
> >>>>>>>    changes v4l subdev functionality
> >>>>>>> 	a. We would add a "read" function to v4l subdev's
> >>>>>>> 		i. This will also require us to add some "capabilities" field
> >>>>>>> 		   to subdev or be able to query for the "read" function
> >>>>>>> 	b. HDMI Rx driver will register a v4l subdev with "read"
> >>>>>>> 	   function/capability
> >>>>>>> 	c. Application can directly pass a buffer in the "read" function
> >>>>>>> 	   to HDMI RX subdev to obtain HDR metadata
> >>>>>>> 		i. We will need to pass subdev name from application or be able
> >>>>>>> 		   to query all subdevs for this "read"
> >>>>>>> 		   capability, is this acceptable?
> >>>>>>>
> >>>>>>> Please let me know your opinions on which approach is best or
> >>>>>>> propose another approach if these 2 are unfit. Thanks

-- 
Regards,

Laurent Pinchart
