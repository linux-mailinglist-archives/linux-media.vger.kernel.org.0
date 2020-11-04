Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 635952A646D
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 13:32:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729770AbgKDMc0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 07:32:26 -0500
Received: from mga02.intel.com ([134.134.136.20]:7261 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729227AbgKDMc0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Nov 2020 07:32:26 -0500
IronPort-SDR: WN2j2581Y/d5hu/xp2RQ3eZqagDocSyTFItk8lO5THJW33o5x/Q/l+CTNu76BJHEBjpq3TvZyf
 EHMFdRy+L71Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9794"; a="156197548"
X-IronPort-AV: E=Sophos;i="5.77,450,1596524400"; 
   d="scan'208";a="156197548"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2020 04:32:24 -0800
IronPort-SDR: YHw6fr4NpvYaMsecxJpsx6tDZ4AfP78kSnkfTF+lSC8swYt6M+WFmJRY1TxJ3ktuTFhFbkWT1W
 yX8B6VWv82iw==
X-IronPort-AV: E=Sophos;i="5.77,450,1596524400"; 
   d="scan'208";a="426653312"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2020 04:32:20 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 8131120A2D; Wed,  4 Nov 2020 14:32:18 +0200 (EET)
Date:   Wed, 4 Nov 2020 14:32:18 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        kernel@collabora.com, dafna3@gmail.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: Re: [PATCH v3 1/2] media: uapi: add MEDIA_BUS_FMT_METADATA_FIXED
 media bus format.
Message-ID: <20201104123218.GQ26150@paasikivi.fi.intel.com>
References: <20201030134609.30020-1-dafna.hirschfeld@collabora.com>
 <20201030140241.GQ26150@paasikivi.fi.intel.com>
 <5c8852f5-a803-1bd0-7798-3cca0d7ee9ea@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c8852f5-a803-1bd0-7798-3cca0d7ee9ea@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, Nov 04, 2020 at 01:16:03PM +0100, Hans Verkuil wrote:
> On 30/10/2020 15:02, Sakari Ailus wrote:
> > Hi Dafna,
> > 
> > On Fri, Oct 30, 2020 at 02:46:08PM +0100, Dafna Hirschfeld wrote:
> >> MEDIA_BUS_FMT_METADATA_FIXED should be used when
> >> the same driver handles both sides of the link and
> >> the bus format is a fixed metadata format that is
> >> not configurable from userspace.
> >> The width and height will be set to 0 for this format.
> >>
> >> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> >> Acked-by: Helen Koike <helen.koike@collabora.com>
> >> ---
> >> changes since v2:
> >> added documentation in subdev-formats.rst
> >> changes since v1:
> >> 1. replace "This format may have 0 height and width."
> >> with "Width and height will be set to 0 for this format."
> >> and add it also to the commit log
> >> 2. s/meida:/media:/ in the patch subject line
> >>
> >>  .../media/v4l/subdev-formats.rst              | 27 +++++++++++++++++++
> >>  include/uapi/linux/media-bus-format.h         |  8 ++++++
> >>  2 files changed, 35 insertions(+)
> >>
> >> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> >> index c9b7bb3ca089..7f16cbe46e5c 100644
> >> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> >> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> >> @@ -7899,3 +7899,30 @@ formats.
> >>        - 0x5001
> >>        - Interleaved raw UYVY and JPEG image format with embedded meta-data
> >>  	used by Samsung S3C73MX camera sensors.
> >> +
> >> +.. _v4l2-mbus-metadata-fmts:
> >> +
> >> +Metadata Formats
> >> +^^^^^^^^^^^^^^^^
> >> +
> >> +This section lists all metadata formats.
> >> +
> >> +The following table lists the existing metadata formats.
> >> +
> >> +.. tabularcolumns:: |p{8.0cm}|p{1.4cm}|p{7.7cm}|
> >> +
> >> +.. flat-table:: Metadata formats
> >> +    :header-rows:  1
> >> +    :stub-columns: 0
> >> +
> >> +    * - Identifier
> >> +      - Code
> >> +      - Comments
> >> +    * .. _MEDIA-BUS-FMT-METADATA-FIXED:
> >> +
> >> +      - MEDIA_BUS_FMT_METADATA_FIXED
> >> +      - 0x7001
> >> +      - This format should be used when the same driver handles
> >> +	both sides of the link and the bus format is a fixed
> >> +	metadata format that is not configurable from userspace.
> >> +	Width and height will be set to 0 for this format.
> >> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> >> index 84fa53ffb13f..2ce3d891d344 100644
> >> --- a/include/uapi/linux/media-bus-format.h
> >> +++ b/include/uapi/linux/media-bus-format.h
> >> @@ -156,4 +156,12 @@
> >>  /* HSV - next is	0x6002 */
> >>  #define MEDIA_BUS_FMT_AHSV8888_1X32		0x6001
> >>  
> >> +/*
> >> + * This format should be used when the same driver handles
> >> + * both sides of the link and the bus format is a fixed
> >> + * metadata format that is not configurable from userspace.
> >> + * Width and height will be set to 0 for this format.
> >> + */
> > 
> > Does this mean that metadata with dimensions should not use
> > MEDIA_BUS_FMT_METADATA_FIXED? I guess that's not the intention? For some
> > formats the dimensions would be relevant but for others not. I'd thus
> > replace "will" by "may". Same for the documentation.
> 
> struct v4l2_meta_format as used with VIDIOC_G/S/TRY_FMT doesn't have
> a width or height either. Supporting width and height for metadata
> doesn't really make sense for me for metadata.
> 
> Explicitly specifying the width and height here indicates that the
> data is basically an array of width x height of some sort which makes
> sense for video devices.
> 
> Metadata is more complex data that cannot be represented like that.
> If metadata is actually an array, then I'm not sure I would call it
> metadata, I would probably see it as video with its own pixelformat
> that contains non-video data.

Let's say the metadata is laid out in a similar way than an image; you have
lines of data, followed by some padding at the end, and a line has length
and a buffer has a number of lines. Sensor metadata falls into this
description.

Would you then use struct v4l2_pix_format for it, and use
V4L2_BUF_TYPE_VIDEO_CAPTURE for it?

That would make a few things easier but this is still metadata, not video
data. Albeit I guess it's not important to be so strict about that
interface-wise, indeed this is not a bad fit for such metadata. Still some
fields such as colourspace and quantisation are not relevant, but that
holds also for some pixel formats.

-- 
Regards,

Sakari Ailus
