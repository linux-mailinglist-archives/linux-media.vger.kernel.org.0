Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 334551D8A95
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 00:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728330AbgERWRA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 May 2020 18:17:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbgERWQ7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 18:16:59 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84752C061A0C
        for <linux-media@vger.kernel.org>; Mon, 18 May 2020 15:16:59 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id o5so12417417iow.8
        for <linux-media@vger.kernel.org>; Mon, 18 May 2020 15:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pcLuOULxJyDWoYUN5Djr6L1MBKElhK6pZgevsSE6b7U=;
        b=XGvocsLZK4x2ou7SAaE36DxzHe24RRU4RVZ9Xw9pGR8pxYrNINvdDYRXpSh0pU1qNv
         3uXqiSQA8qSn/ucv6e5+zroQvCJAKCcOT1YLMyYGkEt1DW9AMcmaWEMuzVD8ZqerIzlS
         DIK1jKiKRt1muNBWkD9/vaPu9GKnqq1qxqBihHBE1nBseTWDMqYE4o8Ysa0bbPws3ebc
         in+qKa3QK/zseYkzOKrEj0lJh2U/x35RmrjmInrT6aut5s2IhYWNj3mcWSW2XmHrXS0d
         sa5xzOd+gMd0c8OV02QGrso/aVG407r6nXK8HPHdf4898Gq9j32QtFb56+z4W0Kf49Yp
         7o+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pcLuOULxJyDWoYUN5Djr6L1MBKElhK6pZgevsSE6b7U=;
        b=Xw7uB8F5G5/ccg29iYl5jvBCW9bV3LBhIyxTpkSsNMwsL3bAG/ZLaBuP6/9i6y9uhG
         sOguL9tJccUcp1iwTlWQVMciJ0i/o+zjRNamw1a8TH1UsnLfXtYJV+15DGspMaWRvPCk
         g7N/DEIUIubPFAVu/KlDD86zHiTu6e56DB0BXKuA0yROPT0+kI1S8pCLvduTe1qz1hRN
         MADnS0IvEcgOa+9V6h1UTgFgmfMFXI2m3Pj3Ektp05CejY92ZZLANurR9HfMWhjvzQ0p
         ANIFOD92UaRdy+q7nzNEJRkSoa2Pz8f3/khFeConQR+KtH+dIMZrHPfXoyFF1qpKc9rV
         SCtg==
X-Gm-Message-State: AOAM531f3H7mZOPq9Qg9tlbKjNeEKMQnc0eJRmMLwbjFqPBhQxgDU8Y+
        phCB+eZ5EeRMIzZLHmYxh+rQRL66D00178IJnZD6hE6+
X-Google-Smtp-Source: ABdhPJwVEQuOHN40qZoL8GX3wQdD10rgvE7XG29vr8HRLjNwzEQxJI5w4LJEcdizVvUMZ2RA+hdEC6rYlbNWjGvnh78=
X-Received: by 2002:a05:6638:2bb:: with SMTP id d27mr16629174jaq.66.1589840218605;
 Mon, 18 May 2020 15:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <BYAPR02MB57027075B640D2F530E890E8B00C0@BYAPR02MB5702.namprd02.prod.outlook.com>
 <825d563b-7cb7-5055-d1af-b9b8eba1deb9@xs4all.nl> <CY4PR02MB314231543765B9CC09C0735BA70E0@CY4PR02MB3142.namprd02.prod.outlook.com>
 <589f1e75-8925-3482-38d8-e354a067f1db@xs4all.nl> <20200124120844.GA4996@pendragon.ideasonboard.com>
 <BYAPR02MB57020B91E827ACC33B50B8AFB0050@BYAPR02MB5702.namprd02.prod.outlook.com>
 <57be8b72-c60b-cb65-7fe0-cb82ab49b0d5@xs4all.nl> <BYAPR02MB57027E43976016F724795E86B0040@BYAPR02MB5702.namprd02.prod.outlook.com>
 <20200212164841.GB17926@pendragon.ideasonboard.com> <c2c37353-79f2-b9b8-4150-79a7c3b59884@xs4all.nl>
In-Reply-To: <c2c37353-79f2-b9b8-4150-79a7c3b59884@xs4all.nl>
From:   VDRU VDRU <user.vdr@gmail.com>
Date:   Mon, 18 May 2020 15:16:47 -0700
Message-ID: <CAA7C2qgk-LuuaGfpzr4pZkkjQ0g7qUDFHZBq8xRbKTXwK-sw=w@mail.gmail.com>
Subject: Re: [RFC] V4L HDR Architecture Proposal
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dylan Yip <dylany@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Varunkumar Allagadapa <VARUNKUM@xilinx.com>,
        Madhurkiran Harikrishnan <MADHURKI@xilinx.com>,
        Jianqiang Chen <jianqian@xilinx.com>,
        Hyun Kwon <hyunk@xilinx.com>,
        Cyril Chemparathy <cyrilc@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>,
        Subhransu Sekhar Prusty <sprusty@xilinx.com>,
        Anil Kumar Chimbeti <anilchc@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I was wondering what the current status is on this? Is there any plan
to also add Dolby Vision as well?

Thanks

On Wed, Feb 19, 2020 at 2:43 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 2/12/20 5:48 PM, Laurent Pinchart wrote:
> > Hi Hans,
> >
> > On Thu, Jan 30, 2020 at 07:00:12AM +0000, Dylan Yip wrote:
> >> On Tuesday, January 28, 2020 11:31 PM, Hans Verkuil wrote:
> >>> On 1/29/20 7:14 AM, Dylan Yip wrote:
> >>>> On Friday, January 24, 2020 4:09 AM, Laurent Pinchart wrote:
> >>>>> On Fri, Jan 24, 2020 at 11:10:06AM +0100, Hans Verkuil wrote:
> >>>>>> On 1/24/20 10:04 AM, Vishal Sagar wrote:
> >>>>>>> On Thursday, January 23, 2020 6:36 PM, Hans Verkuil wrote:
> >>>>>>>> On 1/22/20 9:13 PM, Dylan Yip wrote:
> >>>>>>>>> Hi All,
> >>>>>>>>>
> >>>>>>>>> We are planning to add HDR10 and HDR10+ metadata support into the
> >>>>>>>>> V4L framework and were hoping for some feedback before we started
> >>>>>>>>> implementation.
> >>>>>>>>
> >>>>>>>> Nice!
> >>>>>>>>
> >>>>>>>>> For context, Xilinx HDMI RX IP currently uses a AXI LITE
> >>>>>>>>> interface where HDR metadata is obtained from a hardware FIFO. To
> >>>>>>>>> access these packets a CPU copy is required.
> >>>>>>>>> We are in the process of migrating towards a AXI MM interface
> >>>>>>>>> where the hardware will directly write HDR metadata into memory.
> >>>>>>>>> Currently the HDMI RX driver (https://github.com/Xilinx/hdmi-
> >>>>>>>>> modules/blob/master/hdmi/xilinx-hdmirx.c) is modeled as a v4l
> >>>>>>>>> subdev. This is linked to a DMA IP which utilizes the DMA engine
> >>>>>>>>> APIs and registers itself as a video node for video data.
> >>>>>>>>>
> >>>>>>>>> HDR10 will only consist of static metadata which will come once
> >>>>>>>>> per stream.
> >>>>>>>>> However, HDR10+ will have dynamic metadata which can potentially
> >>>>>>>>> come once per frame and be up to ~4000 bytes. We would like V4L
> >>>>>>>>> architecture to be flexible to support both.
> >>>>>>>>
> >>>>>>>> The key here is the difference between Extended InfoFrames that
> >>>>>>>> can be long and the others, that have a maximum size. The latter
> >>>>>>>> should be handled by controls, the first is more difficult.
> >>>>>>>
> >>>>>>> Are you suggesting to handle static HDR via read only v4l controls
> >>>>>>> in a meta video node?
> >>>>>>
> >>>>>> Yes. It's very suitable for that purpose.
> >>>>
> >>>> So are you saying we should create a separate metadata node and add the
> >>>> v4l control there or would we add the v4l control to the existing video data
> >>>> node? If it is the former, what's the point of creating the metadata node
> >>>> since we won't qbuf/dqbuf to it?
> >>>
> >>> I'm sorry, I misread your original question. Static HDR should be handled via
> >>> read only v4l controls in the existing video node, not in a meta video node.
> >>
> >> Ah thanks for the clarification.
> >>
> >>>>>>>> Can you tell a bit more about how the hardware operates? Are all
> >>>>>>>> InfoFrames obtained through the hw fifo, or are some stored in
> >>>>>>>> registers and some go through the fifo?
> >>>>>>>
> >>>>>>> In the current implementation of the HDMI Rx IP, all InfoFrames are
> >>>>>>> read from a register byte by byte which has FIFO at the back.
> >>>>>>> The register is accessible by an AXI Lite interface.
> >>>>>>> The FIFO can store maximum 8 packets. Each packet is 36 bytes in
> >>>>>>> size (31 bytes data and 5 bytes ECC calculated by IP).
> >>>>>>> InfoFrames are one type of packets.
> >>>>>>
> >>>>>> Does one packet correspond to one InfoFrame? Or are they all
> >>>>>> concatenated and hacked up into packets for the FIFO?
> >>>>>>
> >>>>>> This probably won't work well for large Extended InfoFrames of 4kB
> >>>>>> or more: the driver would have to be able to read from the FIFO very
> >>>>>> quickly in order to prevent data from being lost, right? Hence the
> >>>>>> development of the AXIMM interface referred to below.
> >>>>>>
> >>>>>>> There are other types like General Control Packet, Audio Clock
> >>>>>>> Regeneration Packet, etc. referred in Table 5-8 packet types in
> >>>>>>> HDMI specification v1.4b)
> >>>>>>>
> >>>>>>> In future we plan on adding an AXIMM interface in the IP to handle
> >>>>>>> Dynamic HDR. The tentative behavior will be as below - The driver
> >>>>>>> will provide a buffer pointer to the IP via a register. The IP will dump
> >>>>>>> the infoframes's extracted data into this buffer.
> >>>>>>> With Frame sync, IP will return the length of the buffer in the
> >>>>>>> provided buffer.
> >>>>>>>
> >>>>>>>> Does the hardware set maximum sizes for specific InfoFrames or the
> >>>>>>>> total size of all InfoFrames combined? Or can it be any size?
> >>>>>>>>
> >>>>>>> Hope the above info about FIFO depth for current HDMI Rx IP answers
> >>>>>>> this.
> >>>>>>
> >>>>>> Right, so the driver will provide the maximum size for all
> >>>>>> InfoFrames that can occur between two video frames.
> >>>>>>
> >>>>>> And the driver will parse the received InfoFrames.
> >>>>>>
> >>>>>> I am strongly leaning towards using a control for the HDR10+
> >>>>>> InfoFrame as well: it fits well with the Request API where controls
> >>>>>> can be cleanly associated with a specific video frame, and the
> >>>>>> amount of data isn't that large.
> >>>>>
> >>>>> This however leads me to a simple question: why do we have a metadata
> >>>>> API in the first place if everything should go through controls ?
> >>
> >> I have the same concern as Laurent here. Why are we supporting HDR
> >> metadata through controls but using the metadata API for other types
> >> of metadata? Wouldn't it be cleaner to follow the existing metadata
> >> API since HDR is a type of metadata?
>
> There is very little need to expose InfoFrames to userspace: most of the
> current InfoFrame data is consumed by the video capture driver. That's
> how it is done in all existing HDMI video receivers. Any relevant data
> for userspace such as colorspace information is exposed via V4L2 data
> structures.
>
> There are only a few InfoFrames whose data needs to be exposed to userspace:
> the SPD InfoFrame (not implemented today in a driver, but perfectly suited
> for controls since this rarely changes), and the HDR metadata that you need.
>
> Also, all InfoFrame hardware implementations that I have seen expose the
> InfoFrame data through registers (often over an i2c bus), and that's
> really not suitable for the metadata API.
>
> Now, the Extended InfoFrame information is different beast, and there
> the metadata API is a reasonable approach. Not the only approach, perhaps,
> but certainly something to consider.
>
> So supposed we support this as a metadata device node, then it is
> an option to just dump all InfoFrames into the buffer. I.e., the pixel
> format used to define the format of the stream would say that it consists
> of all InfoFrames preceding the video frame concatenated together, and
> you have to parse it in userspace to find the InfoFrame types that you
> need. It is up to the driver to decide if all InfoFrames or only a subset
> are copied into the buffer.
>
> But be aware that the video driver always has to parse the data as well
> in order to extract the AVI InfoFrame and a few others in order to
> program the video receiver.
>
> The only reason IMHO to dump all InfoFrames into the buffer is if that's
> how the DMA engine operates. If you need to manually do this, then only
> copy the Extended InfoFrames.
>
> >>
> >> This is why we were originally thinking that a 2 node approach (1 for
> >> video 1 for metadata) would have been cleaner.
> >
> > I would also like to add that the implementation of the request API is
> > currently not able to support inline devices (with a live source). This
>
> For traditional non-MC drivers this is supported in the request API. Only
> for MC drivers is this a problem. I don't know if this upcoming driver is
> going the MC route.
>
> > could be changed, but would require a very significant amount of work if
> > we want to implement it properly. As we already have a metadata capture
> > API, I really don't see why this should go through the control
> > framework.
> >
> > Regarding HDR10 static metadata, while I agree that controls should work
> > for this purpose, I think we also need to take into account API
> > consistency. If we use the metadata API for dynamic metadata, we will
> > end up with two different APIs to cary two different types of metadata.
> > Is this desirable, or, given that we already plan for HDR10+ support,
> > would implementing HDR10 support through the metadata API be a better
> > solution for userspace ?
>
> The Dynamic Range and Mastering InfoFrame also needs to be processed by
> the driver, so it makes much more sense to have the driver expose the
> relevant data through one or more controls.
>
> That does not prevent you from dumping this in the metadata buffer as
> well (as described above), but you really only want to do that if that's
> the most efficient way for the DMA engine. But if the buffer is non
> consistent memory, then you need sync the buffer to the cpu before the
> driver can read it.
>
> So, in conclusion, I think it is OK to use a metadata device for the
> Extended InfoFrames. I don't think it is a good idea to dump *all*
> InfoFrames in the metadata buffer, especially if the driver has to
> sync the buffer to the cpu in order to obtain the non-Extended-InfoFrame
> information.
>
> >
> >>>>>> That said, some work in the control framework is probably needed to
> >>>>>> streamline things a bit:
> >>>>>>
> >>>>>> 1) it should be possible to increase the size of compound controls
> >>>>>> later if new fields are added. This is on the TODO list already since
> >>>>>> it is desired functionality for codecs.
> >>>>>>
> >>>>>> 2) tentative, needs research first: add some sort of mechanism to
> >>>>>> mmap the control payload to avoid mem copies. That would make controls
> >>>>>> much more useful for large metadata.
> >>>>>
> >>>>> Let's not forget that we would then also need to mmap the control per
> >>>>> request, which will become challenging if we want to be able to
> >>>>> pre-map everything like we do for buffers instead of mapping and
> >>>>> unmapping for every request.
> >>
> >> Same concern here. If we want to pre-map everything like buffers,
> >> wouldn't we essentially be replicating the behavior of buffers. Then
> >> the only difference would be that we are doing g_ctrl instead of
> >> qbuf/dqbuf right?
>
> Right. But qbuf/dqbuf has quite a bit of overhead as well (dealing with
> multiple streaming modes, cache management), and while that is perfectly
> acceptable when dealing with large buffers and DMA engines, I wonder if
> a mmap-ed control for mid-sized data (say up to 32/64 kBytes) isn't more
> efficient.
>
> That said, this functionality does not exist, and it would need some
> performance testing as well comparing the two. It's just a gut feeling
> without any hard proof.
>
> Regards,
>
>         Hans
>
> >
> > I couldn't have said that better :-)
> >
> >>>>>> I'm not sure when I will have time to work on that, though.
> >>>>>>
> >>>>>>>> Does it accept any InfoFrame or only specific InfoFrame types? Or
> >>>>>>>> is this programmable?
> >>>>>>>
> >>>>>>> HDMI Rx IP accepts all types of InfoFrames.
> >>>>>>>
> >>>>>>>>> We have 2 different proposals that we believe will work:
> >>>>>>>>>
> >>>>>>>>> A. 2 video node approach (1 for video, 1 for metadata) - This will
> >>>>>>>>>    align with current v4l metadata structure (i.e. uvc) but
> >>>>>>>>>    will require our HDMI RX driver to register a subdev and
> >>>>>>>>>    device node
> >>>>>>>>>       a. Our HDMI RX driver will register a v4l subdev (for
> >>>>>>>>>          video data) and a metadata node
> >>>>>>>>>               i. Is this acceptable?
> >>>>>>>>>       b. Applications will qbuf/dqbuf to both video and metadata nodes
> >>>>>>>>>          for each frame
> >>>>>>>>>
> >>>>>>>>> B. 1 video node approach - This will avoid mixing v4l subdev and
> >>>>>>>>>    v4l device node functionality inside HDMI RX driver but it
> >>>>>>>>>    strays from current v4l metadata architecture and also
> >>>>>>>>>    changes v4l subdev functionality
> >>>>>>>>>       a. We would add a "read" function to v4l subdev's
> >>>>>>>>>               i. This will also require us to add some "capabilities" field
> >>>>>>>>>                  to subdev or be able to query for the "read" function
> >>>>>>>>>       b. HDMI Rx driver will register a v4l subdev with "read"
> >>>>>>>>>          function/capability
> >>>>>>>>>       c. Application can directly pass a buffer in the "read" function
> >>>>>>>>>          to HDMI RX subdev to obtain HDR metadata
> >>>>>>>>>               i. We will need to pass subdev name from application or be able
> >>>>>>>>>                  to query all subdevs for this "read"
> >>>>>>>>>                  capability, is this acceptable?
> >>>>>>>>>
> >>>>>>>>> Please let me know your opinions on which approach is best or
> >>>>>>>>> propose another approach if these 2 are unfit. Thanks
> >
>
