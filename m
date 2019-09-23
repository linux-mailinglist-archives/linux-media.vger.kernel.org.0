Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56324BAF27
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2019 10:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390945AbfIWIRk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 04:17:40 -0400
Received: from mga05.intel.com ([192.55.52.43]:11759 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389470AbfIWIRk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 04:17:40 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Sep 2019 01:17:39 -0700
X-IronPort-AV: E=Sophos;i="5.64,539,1559545200"; 
   d="scan'208";a="363557855"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Sep 2019 01:17:38 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id EAC0F20C9F; Mon, 23 Sep 2019 11:17:35 +0300 (EEST)
Date:   Mon, 23 Sep 2019 11:17:35 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, Vandana BN <bnvandana@gmail.com>
Subject: Re: [PATCHv4 0/3] v4l2-core: Add metadata type to vfl_devnode_type
Message-ID: <20190923081735.GA9467@paasikivi.fi.intel.com>
References: <20190917133647.17533-1-hverkuil-cisco@xs4all.nl>
 <20190920234857.GM12672@pendragon.ideasonboard.com>
 <9ae7713a-c76c-cecd-165d-77dfe8eb0be0@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ae7713a-c76c-cecd-165d-77dfe8eb0be0@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, Laurent,

On Mon, Sep 23, 2019 at 10:11:09AM +0200, Hans Verkuil wrote:
> Hi Laurent,
> 
> On 9/21/19 1:48 AM, Laurent Pinchart wrote:
> > Hi Hans,
> > 
> > On Tue, Sep 17, 2019 at 03:36:44PM +0200, Hans Verkuil wrote:
> >> This is a follow-up series from Vandana's "[v3] v4l2-core: Add metadata type to
> >> vfl_devnode_type" patch: https://patchwork.linuxtv.org/patch/58755/
> >>
> >> While testing that v3 patch with a patched version of vivid that has metadata
> >> capture support, I realized that metadata should be treated the same way as
> >> vbi in determine_valid_ioctls(). That makes sense since vbi *is* effectively
> >> metadata. So I changed Vandana's patch (hence my Co-Developed-by tag) to
> >> correctly validate the ioctls for metadata.
> >>
> >> I also added two follow-up patches to simplify the SDR code in that function,
> >> and to fix the code for v4l-touch devices (too many ioctls were enabled for
> >> such devices). I think the final code is easier to read as well.
> > 
> > Quoting my reply to "[RFC] V4L2 & Metadata: switch to /dev/v4l-metaX
> > instead of /dev/videoX]" as it may have fell through the cracks, and I
> > don't want this series to be merged without addressing the issue,
> > 
> > One of the reason [we didn't introduce a metadata video node type] is
> > CSI-2 sensors and CSI-2 receivers. A CSI-2 link often carries both video
> > and metadata using two different datatypes. From the point of view of
> > the CSI-2 receiver or the DMA engines, video and metadata are not
> > distinguishable, the CSI-2 receiver receives one stream with two data
> > types, demultiplexes them, and passes them to different DMA engines. A
> > sensor could send two video datatypes, or even conceptually two metadata
> > data types, and this would work the exact same way, with each of the two
> > DMA engines capturing data to buffers without caring about the contents.
> > Given that the datatype selection happens at runtime, a given DMA engine
> 
> 'happens at runtime': what decides this? The user-specified topology?
> Something else?
> 
> Is this documented somewhere?

Yes. This ultimately depends on the formats configured by the user. Some of
the formats are metadata, and with sub-stream support, these will be
routable by different video nodes.

I we designate video nodes either "metadata" or "pixel data" nodes, then
this would need to be changed dynamically based on the format selected. I
don't think it's really worth it, as the user space also doesn't expect the
node type to change.

> 
> To my knowledge there are no drivers that can do this in mainline code,
> right? The current drivers all create dedicated metadata devices.

Not right now, no. But it's just a question of when, not if.

> 
> Also, this specific use-case is for capture only. Do you think this
> might be needed for metadata output as well?

As Laurent noted, the DMA engines don't know the data they handle, so in
principle it's possible that this could be relevant for output, too.

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
