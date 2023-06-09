Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7290729B7A
	for <lists+linux-media@lfdr.de>; Fri,  9 Jun 2023 15:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238814AbjFINVV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jun 2023 09:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231821AbjFINVU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jun 2023 09:21:20 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C3F230E4
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 06:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686316867; x=1717852867;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sMWnuJs3qIWUzgLB/d+qNgQ/4htMFuf9t1CoTwQIKCc=;
  b=JAGaTvbGL2bCdNtmTZuWj/xZnEEFTQhI3XxNLooWNazIkAAg3Utn+lc9
   xEDWXFpqSOYJya//3d4hlNrnlui+uFr2YMH0kyTlOYBJOqHgtKsoQnLSI
   uCQPp6zNZAz0lnX3dqTdXJK3iuTy0orWLv+2YRkJuWL6juCCvcq2NzRXj
   T3M+29v4he2Yf4cJzd3SIT7ZKfS2Ut4+/+/KKSIiys0Pj7JEEM8+gpWt8
   bK42xgo3aKu9odnxVA28zb646KU0jFcfKW1xVQNVs5Uan3Hy5lEV3zvMF
   P1CVAOap2l3C0maWKH/3qeyPVAvpnnQKhH64JIIaboKvKhM+FMnkD7EwF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="337229860"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="scan'208";a="337229860"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 06:21:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="834643924"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="scan'208";a="834643924"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 06:21:02 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 3282C11F9D2;
        Fri,  9 Jun 2023 16:20:59 +0300 (EEST)
Date:   Fri, 9 Jun 2023 13:20:59 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Naushir Patuck <naush@raspberrypi.com>,
        linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [RFC 0/7] Generic line based metadata support, internal pads
Message-ID: <ZIMnOyRykKamFvlo@kekkonen.localdomain>
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
 <CAEmqJPp_3e248mKRMK2fY2vwQi=HzqCsP6zTyWfOXFYbOFC0_Q@mail.gmail.com>
 <20230602091226.GD19463@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230602091226.GD19463@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Jun 02, 2023 at 12:12:26PM +0300, Laurent Pinchart wrote:
> Hello,
> 
> On Fri, Jun 02, 2023 at 08:54:35AM +0100, Naushir Patuck wrote:
> > Hi Sakari,
> > 
> > Thank you for working on this.  Sensor metadata is something that Raspberry Pi
> > do make extensive use of, and our downstream changes to support it, although a
> > bit hacky, are not too dissimilar to your proposal here.
> > 
> > On Fri, 5 May 2023 at 22:53, Sakari Ailus wrote:
> > >
> > > Hi folks,
> > >
> > > Here are a few patches to add support generic, line based metadata as well
> > > as internal source pads. While the amount of code is not very large, to
> > > the contrary it is quite small actually IMO, I presume what this is about
> > > and why it is being proposed requires some explaining.
> > >
> > > Metadata mbus codes and formats have existed for some time in V4L2. They
> > > however have been only used by drivers that produce the data itself and
> > > effectively this metadata has always been statistics of some sort (at
> > > least when it comes to ISPs). What is different here is that we intend to
> > > add support for metadata originating from camera sensors.
> > >
> > > Camera sensors produce different kinds of metadata, embedded data (usually
> > > register address--value pairs used to capture the frame, in a more or less
> > > sensor specific format), histograms (in a very sensor specific format),
> > > dark pixels etc.
> 
> Optical dark pixels are image data, I wouldn't include them in the
> "metadata" category. They can of course be transmitted over a different
> stream, so they're relevant to the API being designed.

Good point, I'll address this for v2.

> 
> > > The number of these formats is probably going to be about
> > > as large as image data formats if not larger, as the image data formats
> > > are much better standardised but a smaller subset of them will be
> > > supported by V4L2, at least initially but possibly much more in the long
> > > run.
> 
> Strictly speaking, the number of metadata formats depends on how we
> define "format". Today, we can use the GREY pixel format to capture
> greyscale images in the visible spectrum, but also IR images, thermal
> images, or even depth images. They're all one pixel format. On the other
> hand, we have Y16 for greyscale visible and IR images, and Z16 for depth
> maps. It's already a mess, even without metadata :-)

Yes.

> 
> > > Having this many device specific formats would be a major problem for all
> > > the other drivers along that pipeline (not to mention the users of those
> > > drivers), including bridge (e.g. CSI-2 to parallel) but especially CSI-2
> > > receiver drivers that have DMA: the poor driver developer would not only
> > > need to know camera sensor specific formats but to choose the specific
> > > packing of that format suitable for the DMA used by the hardware. It is
> > > unlikely many of these would ever get tested while being present on the
> > > driver API. Also adding new sensors with new embedded data formats would
> > > involve updating all bridge and CSI-2 receiver drivers. I don't expect
> > > this to be a workable approach.
> 
> I'm glad we agree on this.

Well, there are alternatives, but this is probably easier in the long run.

We'll just need more documentation than usually for the metadata mbus
codes.

> 
> > > Instead what I'm proposing is to use specific metadata formats on the
> > > sensor devices only, on internal pads (more about those soon) of the
> > > sensors, only visible in the UAPI, and then generic mbus formats along the
> > > pipeline and finally generic V4L2 metadata formats on the DMAs (specific
> > > to bit depth and packing). This would unsnarl the two, defining what data
> > > there is (specific mbus code) and how that is transported and packed
> > > (generic mbus codes and V4L2 formats).
> 
> Decoupling the information needed by the kernel (e.g. are we
> transporting RAW8 or RAW10 from the sensor through the pipeline) from
> the information useful for userspace only (e.g. the sensor embedded data
> is encoding using register + value pairs, based on the IMX708 registers
> set) is a good idea. I expect the main question to be where to draw the
> line between those two categories. Some pieces of information may be
> useless to any processing block in the pipeline except for an odd block
> in the middle.
> 
> This is, I believe, a problem similar to the CFA pattern. That
> information is useless for most devices, but required by the demosaicing
> block and some other blocks along the pipeline (colour gains for
> instance, or some Bayer statistics engines). We currently convey the CFA
> pattern in the media bus codes and pixel formats (e.g. SGRBG8 vs.
> SRGGB8) through the whole pipeline, while it could be conveyed out of
> band (e.g. exposed by the sensor using a control, and set on the devices
> that need it using a control as well).

Cases where another device in the pipeline would need to know the exact
metadata format are exceedingly rare. I actually don't have any I could
name right now.

> 
> If we come up with a good solution for metadata (and I hope we will),
> maybe we'll be able to use a similar mechanism for CFA patterns,
> simplifying new drivers and userspace. Or maybe this will remain a pipe
> dream given the backward compatibility implications.
> 
> > > The user space would be required to "know" the path of that data from the
> > > sensor's internal pad to the V4L2 video node. I do not see this as these
> > > devices require at least some knowledge of the pipeline, i.e. hardware at
> > > hand. Separating what the data means and how it is packed may even be
> > > beneficial: it allows separating code that interprets the data (sensor
> > > internal mbus code) from the code that accesses it (packing).
> > >
> > > These formats are in practice line based, meaning that there may be
> > > padding at the end of the line, depending on the bus as well as the DMA.
> > > If non-line based formats are needed, it is always possible to set the
> > > "height" field to 1.
> > 
> > One thing that may be worth considering or clarifying - for the case of the
> > BCM2835 Unicam CSI-2 device, we only have 2x DMA output channels.  So one will
> > match image data packets, and the other will match "everything else".  Typically
> > "everything else" would only be CSI-2 embedded data, but in the case of the
> > Raspberry Pi Camera v3 (IMX708), it includes embedded data, PDAF data, and
> > HDR histogram data.  Each of these outputs can be programmed to use a different
> > packet ID in the sensor, but since Unicam only has a single DMA for "everything
> > else", it all gets dumped into one metadata buffer.  But given we know the exact
> > structure of the data streams, it's trivial for useland to find the right bits
> > in this buffer.  Of course, other CSI-2 receivers with more DMA channels might
> > allow these streams to end up in their own buffers.
> > 
> > Nothing in your series seems to stop us operating Unicam in this way,
> > particularly because there is no fixed definition of the data format for
> > V4L2_META_FMT_GENERIC_8. So I don't think it's a problem, but perhaps it's worth
> > documenting that the metadata might include multiple streams from the sensor?
> 
> Thanks for your feedback Naush. Would you consider reviewing the
> individual patches in the series ? :-)
> 
> > > The internal (source) pads are an alternative to source routes [1]. The
> > > source routes were not universally liked and I do have to say I like
> > > re-using existing interface concepts (pads and everything you can do with
> > > pads, including access format, selections etc.) wherever it makes sense,
> > > instead of duplicating functionality.
> > >
> > > Effectively internal source pads behave mostly just like sink pads, but
> > > they describe a flow of data that originates from a sub-device instead of
> > > arriving to a sub-device. The SUBDEV_S_ROUTING IOCTLs are used to enable
> > > and disable routes from internal source pads to sub-device's source pads.
> > > The subdev format IOCTLs are usable, too, so one can find which subdev
> > > format is available on given internal source pad.
> > >
> > > This set depends on these patches:
> > >
> > > <URL:https://lore.kernel.org/linux-media/20230505205416.55002-1-sakari.ailus@linux.intel.com/T/#t>
> > >
> > > I've also pushed these here and I'll keep updating the branch:
> > >
> > > <URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata>
> > >
> > > Questions and comments are most welcome.
> > >
> > >
> > > [1] <URL:https://lore.kernel.org/linux-media/20220831141357.1396081-20-tomi.valkeinen@ideasonboard.com/>
> > >
> > > Sakari Ailus (7):
> > >   media: mc: Add INTERNAL_SOURCE pad type flag
> > >   media: v4l: subdev: Support INTERNAL_SOURCE pads in routing IOCTLs
> > >   media: uapi: v4l: Document source routes
> > >   media: mc: Check pad flag validity
> > >   media: uapi: Add generic serial metadata mbus formats
> > >   media: uapi: Add generic 8-bit metadata format definitions
> > >   media: v4l: Support line-based metadata capture
> > >
> > >  .../media/mediactl/media-types.rst            |   7 +
> > >  .../userspace-api/media/v4l/dev-meta.rst      |  15 +
> > >  .../userspace-api/media/v4l/dev-subdev.rst    |  18 +
> > >  .../userspace-api/media/v4l/meta-formats.rst  |   1 +
> > >  .../media/v4l/metafmt-generic.rst             | 317 ++++++++++++++++++
> > >  .../media/v4l/subdev-formats.rst              | 257 ++++++++++++++
> > >  .../media/v4l/vidioc-enum-fmt.rst             |   7 +
> > >  .../media/v4l/vidioc-subdev-g-routing.rst     |   5 +
> > >  drivers/media/mc/mc-entity.c                  |  20 +-
> > >  drivers/media/v4l2-core/v4l2-ioctl.c          |   8 +
> > >  drivers/media/v4l2-core/v4l2-subdev.c         |   6 +-
> > >  include/uapi/linux/media-bus-format.h         |   9 +
> > >  include/uapi/linux/media.h                    |   1 +
> > >  include/uapi/linux/v4l2-subdev.h              |   6 +-
> > >  include/uapi/linux/videodev2.h                |  19 ++
> > >  15 files changed, 691 insertions(+), 5 deletions(-)
> > >  create mode 100644 Documentation/userspace-api/media/v4l/metafmt-generic.rst

-- 
Kind regards,

Sakari Ailus
