Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73662720118
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 14:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235598AbjFBMF5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 08:05:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235010AbjFBMFx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 08:05:53 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63E7D1B5
        for <linux-media@vger.kernel.org>; Fri,  2 Jun 2023 05:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685707552; x=1717243552;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fvjRh0JC+UbvPv1bLFFAZWI7xUhxjmiFG0e57mxX1Gc=;
  b=NfRkBLHCIJC7KTm50fadl3AWpQVTmHD3qMZuW/Z0PTZJjaDQHUC+sdu6
   f8758zNF8TSUt67xXRpUs4WK/GF9tZZRbwVYlWF1AfElpAUVrjDR6t9gP
   TiuYnS8WJkjgwpH7iIVVORr/YyuVQ9dKybncB4tLfuRyihi0UN4RKfSr+
   sx8U33n3H2s/mhOnenBlcDVQDnFbZQOgng8ka0/Y2/8Gnkniy0Ucu3yes
   icVqOkXlh9rYDA0EcGrWCFSmqKBPsoy6e0QNL9K4D7qRAy1hgtXnkZUVA
   9J4fDuLj0ulUwS3KIojVeYnYgh+6Pp/smbi4p6TKSgIleybeB7pRg7fYY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="354700980"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="354700980"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 05:05:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="777652276"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="777652276"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 05:05:42 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 110B51203D3;
        Fri,  2 Jun 2023 15:05:40 +0300 (EEST)
Date:   Fri, 2 Jun 2023 12:05:40 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Naushir Patuck <naush@raspberrypi.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com
Subject: Re: [RFC 0/7] Generic line based metadata support, internal pads
Message-ID: <ZHnbFEjryNCylF6k@kekkonen.localdomain>
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
 <CAEmqJPp_3e248mKRMK2fY2vwQi=HzqCsP6zTyWfOXFYbOFC0_Q@mail.gmail.com>
 <ZHmsddS7gaAyFu+N@kekkonen.localdomain>
 <CAEmqJPq9wS6mAvCYF2ryo4+sr0wO2OGMC_qNoaBjWW6V9sF=TA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEmqJPq9wS6mAvCYF2ryo4+sr0wO2OGMC_qNoaBjWW6V9sF=TA@mail.gmail.com>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Naush,

On Fri, Jun 02, 2023 at 10:35:08AM +0100, Naushir Patuck wrote:
> Hi Sakari,
> 
> On Fri, 2 Jun 2023 at 09:46, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Naushir,
> >
> > On Fri, Jun 02, 2023 at 08:54:35AM +0100, Naushir Patuck wrote:
> > > Hi Sakari,
> > >
> > > Thank you for working on this. Sensor metadata is something that
> > > Raspberry Pi do make extensive use of, and our downstream changes to
> > > support it, although a bit hacky, are not too dissimilar to your proposal
> > > here.
> > >
> > > On Fri, 5 May 2023 at 22:53, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > > >
> > > > Hi folks,
> > > >
> > > > Here are a few patches to add support generic, line based metadata as well
> > > > as internal source pads. While the amount of code is not very large, to
> > > > the contrary it is quite small actually IMO, I presume what this is about
> > > > and why it is being proposed requires some explaining.
> > > >
> > > > Metadata mbus codes and formats have existed for some time in V4L2. They
> > > > however have been only used by drivers that produce the data itself and
> > > > effectively this metadata has always been statistics of some sort (at
> > > > least when it comes to ISPs). What is different here is that we intend to
> > > > add support for metadata originating from camera sensors.
> > > >
> > > > Camera sensors produce different kinds of metadata, embedded data (usually
> > > > register address--value pairs used to capture the frame, in a more or less
> > > > sensor specific format), histograms (in a very sensor specific format),
> > > > dark pixels etc. The number of these formats is probably going to be about
> > > > as large as image data formats if not larger, as the image data formats
> > > > are much better standardised but a smaller subset of them will be
> > > > supported by V4L2, at least initially but possibly much more in the long
> > > > run.
> > > >
> > > > Having this many device specific formats would be a major problem for all
> > > > the other drivers along that pipeline (not to mention the users of those
> > > > drivers), including bridge (e.g. CSI-2 to parallel) but especially CSI-2
> > > > receiver drivers that have DMA: the poor driver developer would not only
> > > > need to know camera sensor specific formats but to choose the specific
> > > > packing of that format suitable for the DMA used by the hardware. It is
> > > > unlikely many of these would ever get tested while being present on the
> > > > driver API. Also adding new sensors with new embedded data formats would
> > > > involve updating all bridge and CSI-2 receiver drivers. I don't expect
> > > > this to be a workable approach.
> > > >
> > > > Instead what I'm proposing is to use specific metadata formats on the
> > > > sensor devices only, on internal pads (more about those soon) of the
> > > > sensors, only visible in the UAPI, and then generic mbus formats along the
> > > > pipeline and finally generic V4L2 metadata formats on the DMAs (specific
> > > > to bit depth and packing). This would unsnarl the two, defining what data
> > > > there is (specific mbus code) and how that is transported and packed
> > > > (generic mbus codes and V4L2 formats).
> > > >
> > > > The user space would be required to "know" the path of that data from the
> > > > sensor's internal pad to the V4L2 video node. I do not see this as these
> > > > devices require at least some knowledge of the pipeline, i.e. hardware at
> > > > hand. Separating what the data means and how it is packed may even be
> > > > beneficial: it allows separating code that interprets the data (sensor
> > > > internal mbus code) from the code that accesses it (packing).
> > > >
> > > > These formats are in practice line based, meaning that there may be
> > > > padding at the end of the line, depending on the bus as well as the DMA.
> > > > If non-line based formats are needed, it is always possible to set the
> > > > "height" field to 1.
> > >
> > > One thing that may be worth considering or clarifying - for the case of
> > > the BCM2835 Unicam CSI-2 device, we only have 2x DMA output channels. So
> > > one will match image data packets, and the other will match "everything
> > > else". Typically "everything else" would only be CSI-2 embedded data, but
> > > in the case of the Raspberry Pi Camera v3 (IMX708), it includes embedded
> > > data, PDAF data, and HDR histogram data. Each of these outputs can be
> > > programmed to use a different packet ID in the sensor, but since Unicam
> > > only has a single DMA for "everything else", it all gets dumped into one
> > > metadata buffer. But given we know the exact structure of the data
> > > streams, it's trivial for useland to find the right bits in this buffer.
> > > Of course, other CSI-2 receivers with more DMA channels might allow these
> > > streams to end up in their own buffers.
> > >
> > > Nothing in your series seems to stop us operating Unicam in this way,
> > > particularly because there is no fixed definition of the data format for
> > > V4L2_META_FMT_GENERIC_8. So I don't think it's a problem, but perhaps
> > > it's worth documenting that the metadata might include multiple streams
> > > from the sensor?
> >
> > I believe this happens on other hardware, too, indeed. Currently the
> > documentation says that
> >
> >         Any number of routes from streams on sink pads towards streams on
> >         source pads is allowed, to the extent supported by drivers. For
> >         every stream on a source pad, however, only a single route is
> >         allowed.
> >
> >         (Documentation/userspace-api/media/v4l/dev-subdev.rst)
> >
> > This probably needs to be changed to allow what you'd need?
> 
> Yes, that last sentence sounds like it would (artificially wrt your
> series) limit metadata buffers to only handle a single output stream.
> However, I may have got the context of the paragraph wrong as well :)

That was exactly the purpose: I wanted to make sure we didn't allow this
without thinking what other implications it could have --- for instance
what you also mentioned, the V4L2 format of the related buffer.

-- 
Kind regards,

Sakari Ailus
