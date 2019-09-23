Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECA4EBB00D
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2019 10:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390539AbfIWIyz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 04:54:55 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:40056 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731941AbfIWIyz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 04:54:55 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1AC5C53B;
        Mon, 23 Sep 2019 10:54:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1569228893;
        bh=zkPXkeY7G9/M6fZKlqBx/0dwIG0ZHHZpQeUCeh/CrmY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Vs8SDsg6Smte7LsDHjNH3yW5U5RPBnysuf4aWHcXxTfpAT/TXKcIYCpr1yrHWRDeQ
         IQKygUId7QgeNGdKcj2BhAthZHAhHloD3JkkhcIQaimZzTg5Hz7bntcNt+Q8tCS9dk
         uE4zTTKsGXsNnMg3LgeUkTEqE20UL/4OQJuvs6qY=
Date:   Mon, 23 Sep 2019 11:54:44 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Vandana BN <bnvandana@gmail.com>
Subject: Re: [PATCHv4 0/3] v4l2-core: Add metadata type to vfl_devnode_type
Message-ID: <20190923085444.GB5056@pendragon.ideasonboard.com>
References: <20190917133647.17533-1-hverkuil-cisco@xs4all.nl>
 <20190920234857.GM12672@pendragon.ideasonboard.com>
 <9ae7713a-c76c-cecd-165d-77dfe8eb0be0@xs4all.nl>
 <20190923081735.GA9467@paasikivi.fi.intel.com>
 <e3103d71-48ed-1966-3bd3-c81d642098c5@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e3103d71-48ed-1966-3bd3-c81d642098c5@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 23, 2019 at 10:47:56AM +0200, Hans Verkuil wrote:
> On 9/23/19 10:17 AM, Sakari Ailus wrote:
> > On Mon, Sep 23, 2019 at 10:11:09AM +0200, Hans Verkuil wrote:
> >> On 9/21/19 1:48 AM, Laurent Pinchart wrote:
> >>> On Tue, Sep 17, 2019 at 03:36:44PM +0200, Hans Verkuil wrote:
> >>>> This is a follow-up series from Vandana's "[v3] v4l2-core: Add metadata type to
> >>>> vfl_devnode_type" patch: https://patchwork.linuxtv.org/patch/58755/
> >>>>
> >>>> While testing that v3 patch with a patched version of vivid that has metadata
> >>>> capture support, I realized that metadata should be treated the same way as
> >>>> vbi in determine_valid_ioctls(). That makes sense since vbi *is* effectively
> >>>> metadata. So I changed Vandana's patch (hence my Co-Developed-by tag) to
> >>>> correctly validate the ioctls for metadata.
> >>>>
> >>>> I also added two follow-up patches to simplify the SDR code in that function,
> >>>> and to fix the code for v4l-touch devices (too many ioctls were enabled for
> >>>> such devices). I think the final code is easier to read as well.
> >>>
> >>> Quoting my reply to "[RFC] V4L2 & Metadata: switch to /dev/v4l-metaX
> >>> instead of /dev/videoX]" as it may have fell through the cracks, and I
> >>> don't want this series to be merged without addressing the issue,
> >>>
> >>> One of the reason [we didn't introduce a metadata video node type] is
> >>> CSI-2 sensors and CSI-2 receivers. A CSI-2 link often carries both video
> >>> and metadata using two different datatypes. From the point of view of
> >>> the CSI-2 receiver or the DMA engines, video and metadata are not
> >>> distinguishable, the CSI-2 receiver receives one stream with two data
> >>> types, demultiplexes them, and passes them to different DMA engines. A
> >>> sensor could send two video datatypes, or even conceptually two metadata
> >>> data types, and this would work the exact same way, with each of the two
> >>> DMA engines capturing data to buffers without caring about the contents.
> >>> Given that the datatype selection happens at runtime, a given DMA engine
> >>
> >> 'happens at runtime': what decides this? The user-specified topology?
> >> Something else?
> >>
> >> Is this documented somewhere?
> > 
> > Yes. This ultimately depends on the formats configured by the user. Some of
> > the formats are metadata, and with sub-stream support, these will be
> > routable by different video nodes.
> > 
> > I we designate video nodes either "metadata" or "pixel data" nodes, then
> > this would need to be changed dynamically based on the format selected. I
> > don't think it's really worth it, as the user space also doesn't expect the
> > node type to change.
> 
> So these video device nodes will need to have both VIDEO_CAPTURE and METADATA_CAPTURE
> set in the device_caps field as returned by VIDIOC_QUERYCAP. Both are needed,
> otherwise userspace wouldn't know that it can call ENUM_FMT with both buf types.
> 
> When the format is changed from video to metadata or vice versa, then the driver
> will have to change the type field in the vb2_queue struct to correspond with the
> chosen format.
> 
> This also means that in determine_valid_ioctls() in v4l2-dev.c I will have to
> check vdev->device_caps if this is a video node that can switch between video
> and metadata mode dynamically.
> 
> Is this correct?

There's a bit of a chicken-and-egg problem though, as the queue type
would need to be changed in response to a VIDIO_S_FMT call...

> >> To my knowledge there are no drivers that can do this in mainline code,
> >> right? The current drivers all create dedicated metadata devices.
> > 
> > Not right now, no. But it's just a question of when, not if.
> 
> This should be emulated by vivid or possibly vimc. That way we can ensure that
> the API is correct and that v4l2-compliance can check this properly.
> 
> Next time we MUST have proper emulation and tests in place before we add
> such features.
> 
> >> Also, this specific use-case is for capture only. Do you think this
> >> might be needed for metadata output as well?
> > 
> > As Laurent noted, the DMA engines don't know the data they handle, so in
> > principle it's possible that this could be relevant for output, too.

-- 
Regards,

Laurent Pinchart
