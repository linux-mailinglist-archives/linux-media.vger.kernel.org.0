Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9312E7471F7
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 14:57:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231511AbjGDM5a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 08:57:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231544AbjGDM5Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 08:57:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A360D10E0
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 05:57:21 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-160-42-71.reb.o2.cz [85.160.42.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21F096DF;
        Tue,  4 Jul 2023 14:56:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688475396;
        bh=E6o3Xci9mSk1ykAJGqDbZS5XOLJ65xy0QJKZVB9ECMw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BbRrQ1uFD237Rb5n8j5Qgvn4UbQUVXRWscs4TNAcvU6J92PKXT9jkhb1AknvnG1ov
         gPsY8RnWwzctHc++LRo9gzYsBNXaGMD4tvj8lj86kY8Do38J79F13Hn2L5MlGjTtqF
         /DvNnOLxGn+iS/Z1Z69plUmhxnVXe4kdX7pm5QI4=
Date:   Tue, 4 Jul 2023 15:57:20 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl
Subject: Re: [PATCH 0/7] Generic line based metadata support, internal pads
Message-ID: <20230704125720.GA24035@pendragon.ideasonboard.com>
References: <20230630204338.126583-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230630204338.126583-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Fri, Jun 30, 2023 at 11:43:31PM +0300, Sakari Ailus wrote:
> Hi folks,
> 
> Here are a few patches to add support generic, line based metadata as well
> as internal source pads. While the amount of code is not very large, to
> the contrary it is quite small actually IMO, I presume what this is about
> and why it is being proposed requires some explaining.
> 
> Metadata mbus codes and formats have existed for some time in V4L2. They
> however have been only used by drivers that produce the data itself and
> effectively this metadata has always been statistics of some sort (at
> least when it comes to ISPs). What is different here is that we intend to
> add support for metadata originating from camera sensors.

I've just realized that, unless I'm mistaken, we've never documented
which of the v4l2_mbus_framefmt fields are valid for metadata formats.
Should this be fixed as part of this series ?

> Camera sensors produce different kinds of metadata, embedded data (usually
> register address--value pairs used to capture the frame, in a more or less
> sensor specific format), histograms (in a very sensor specific format),
> dark pixels etc. The number of these formats is probably going to be about
> as large as image data formats if not larger, as the image data formats
> are much better standardised but a smaller subset of them will be
> supported by V4L2, at least initially but possibly much more in the long
> run.
> 
> Having this many device specific formats would be a major problem for all
> the other drivers along that pipeline (not to mention the users of those
> drivers), including bridge (e.g. CSI-2 to parallel) but especially CSI-2
> receiver drivers that have DMA: the poor driver developer would not only
> need to know camera sensor specific formats but to choose the specific
> packing of that format suitable for the DMA used by the hardware. It is
> unlikely many of these would ever get tested while being present on the
> driver API. Also adding new sensors with new embedded data formats would
> involve updating all bridge and CSI-2 receiver drivers. I don't expect
> this to be a workable approach.
> 
> Instead what I'm proposing is to use specific metadata formats on the
> sensor devices only, on internal pads (more about those soon) of the
> sensors, only visible in the UAPI, and then generic mbus formats along the
> pipeline and finally generic V4L2 metadata formats on the DMAs (specific
> to bit depth and packing). This would unsnarl the two, defining what data
> there is (specific mbus code) and how that is transported and packed
> (generic mbus codes and V4L2 formats).
> 
> The user space would be required to "know" the path of that data from the
> sensor's internal pad to the V4L2 video node. I do not see this as these
> devices require at least some knowledge of the pipeline, i.e. hardware at
> hand. Separating what the data means and how it is packed may even be
> beneficial: it allows separating code that interprets the data (sensor
> internal mbus code) from the code that accesses it (packing).
> 
> These formats are in practice line based, meaning that there may be
> padding at the end of the line, depending on the bus as well as the DMA.
> If non-line based formats are needed, it is always possible to set the
> "height" field to 1.
> 
> The internal (source) pads are an alternative to source routes [1]. The
> source routes were not universally liked and I do have to say I like
> re-using existing interface concepts (pads and everything you can do with
> pads, including access format, selections etc.) wherever it makes sense,
> instead of duplicating functionality.
> 
> Effectively internal source pads behave mostly just like sink pads, but
> they describe a flow of data that originates from a sub-device instead of
> arriving to a sub-device. The SUBDEV_S_ROUTING IOCTLs are used to enable
> and disable routes from internal source pads to sub-device's source pads.
> The subdev format IOCTLs are usable, too, so one can find which subdev
> format is available on given internal source pad.
> 
> This set depends on these patches:
> 
> <URL:https://lore.kernel.org/linux-media/20230505205416.55002-1-sakari.ailus@linux.intel.com/T/#t>
> 
> I've also pushed these here and I'll keep updating the branch:
> 
> <URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata>
> 
> Questions and comments are most welcome.
> 
> Driver support is to be added, as well as an example.

Jacopo and I are working on this, including libcamera support.

> [1] <URL:https://lore.kernel.org/linux-media/20220831141357.1396081-20-tomi.valkeinen@ideasonboard.com/>
> 
> since v1:
> 
> - Make the new pad flag just "INTERNAL", requiring either SINK or SOURCE
>   pad flag to accompany it. Removed the union in struct v4l2_subdev_route.
> 
> - Add the term "stream" to MC glossary.
> 
> - Improved and fixed documentation (according to comments).
> 
> - Note these formats are little endian.
> 
> - Remove 1X8 from the names of the mbus codes. These formats have generally
>   8 bits per pixel.
> 
> - Fix mbus code numbering (had holes in RFC).
> 
> - Add new metadata fields to debug prints.
> 
> - Fix a minor documentation build issue.
> 
> Sakari Ailus (7):
>   media: mc: Check pad flag validity
>   media: mc: Add INTERNAL pad flag
>   media: v4l: subdev: Support INTERNAL pads in routing IOCTLs
>   media: uapi: v4l: Document source routes
>   media: uapi: Add generic serial metadata mbus formats
>   media: uapi: Add generic 8-bit metadata format definitions
>   media: v4l: Support line-based metadata capture
> 
>  .../userspace-api/media/glossary.rst          |   6 +
>  .../media/mediactl/media-types.rst            |   6 +
>  .../userspace-api/media/v4l/dev-meta.rst      |  15 +
>  .../userspace-api/media/v4l/dev-subdev.rst    |  20 ++
>  .../userspace-api/media/v4l/meta-formats.rst  |   1 +
>  .../media/v4l/metafmt-generic.rst             | 331 ++++++++++++++++++
>  .../media/v4l/subdev-formats.rst              | 257 ++++++++++++++
>  .../media/v4l/vidioc-enum-fmt.rst             |   7 +
>  .../media/videodev2.h.rst.exceptions          |   1 +
>  drivers/media/mc/mc-entity.c                  |  17 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  13 +-
>  drivers/media/v4l2-core/v4l2-subdev.c         |   3 +-
>  include/uapi/linux/media-bus-format.h         |   9 +
>  include/uapi/linux/media.h                    |   1 +
>  include/uapi/linux/videodev2.h                |  19 +
>  15 files changed, 701 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/userspace-api/media/v4l/metafmt-generic.rst

-- 
Regards,

Laurent Pinchart
