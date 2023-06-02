Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D41971FC71
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 10:47:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234810AbjFBIrw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 04:47:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234812AbjFBIrc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 04:47:32 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79A08194
        for <linux-media@vger.kernel.org>; Fri,  2 Jun 2023 01:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685695610; x=1717231610;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MDo9pni2UQ8AuCwGV6rFSfaXWUBYJAszJivUX/GC8tU=;
  b=Pod37MVb8xEmTiTRMYDBThgDGMbgvr0KFvXVZbEjG0RdD3RShdjgGVol
   kh26L9bbf0iCbjhLo4Qb+EAqBD66OxV5p1EOPL+DIL/lICwGDQeLPi1Ec
   6F+r4bp2+TO0kKB+711xOAYUEMwjXGY/isofEZBpKZQiHOPKDS5jN39Uv
   dGt+fRt0iu4Cy/hCPzUT4o07PnFvIObi7EKCscl+6E/3xQWDzFNTCEvhB
   0OZSJuixH95A8SsjuizYXjdpGcNvQVwNx1iPHgbShmr3j9hTHz3eoPfpt
   jAb9cpejqc7JuDWymWnFpTAUFx7IVAbJbQzYv1WqZ1cbModhZKYZkQyLH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="355834356"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="355834356"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 01:46:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="954401834"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="954401834"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 01:46:48 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 07CC611F9D2;
        Fri,  2 Jun 2023 11:46:46 +0300 (EEST)
Date:   Fri, 2 Jun 2023 08:46:45 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Naushir Patuck <naush@raspberrypi.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com
Subject: Re: [RFC 0/7] Generic line based metadata support, internal pads
Message-ID: <ZHmsddS7gaAyFu+N@kekkonen.localdomain>
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
 <CAEmqJPp_3e248mKRMK2fY2vwQi=HzqCsP6zTyWfOXFYbOFC0_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEmqJPp_3e248mKRMK2fY2vwQi=HzqCsP6zTyWfOXFYbOFC0_Q@mail.gmail.com>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Naushir,

On Fri, Jun 02, 2023 at 08:54:35AM +0100, Naushir Patuck wrote:
> Hi Sakari,
> 
> Thank you for working on this. Sensor metadata is something that
> Raspberry Pi do make extensive use of, and our downstream changes to
> support it, although a bit hacky, are not too dissimilar to your proposal
> here.
> 
> On Fri, 5 May 2023 at 22:53, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi folks,
> >
> > Here are a few patches to add support generic, line based metadata as well
> > as internal source pads. While the amount of code is not very large, to
> > the contrary it is quite small actually IMO, I presume what this is about
> > and why it is being proposed requires some explaining.
> >
> > Metadata mbus codes and formats have existed for some time in V4L2. They
> > however have been only used by drivers that produce the data itself and
> > effectively this metadata has always been statistics of some sort (at
> > least when it comes to ISPs). What is different here is that we intend to
> > add support for metadata originating from camera sensors.
> >
> > Camera sensors produce different kinds of metadata, embedded data (usually
> > register address--value pairs used to capture the frame, in a more or less
> > sensor specific format), histograms (in a very sensor specific format),
> > dark pixels etc. The number of these formats is probably going to be about
> > as large as image data formats if not larger, as the image data formats
> > are much better standardised but a smaller subset of them will be
> > supported by V4L2, at least initially but possibly much more in the long
> > run.
> >
> > Having this many device specific formats would be a major problem for all
> > the other drivers along that pipeline (not to mention the users of those
> > drivers), including bridge (e.g. CSI-2 to parallel) but especially CSI-2
> > receiver drivers that have DMA: the poor driver developer would not only
> > need to know camera sensor specific formats but to choose the specific
> > packing of that format suitable for the DMA used by the hardware. It is
> > unlikely many of these would ever get tested while being present on the
> > driver API. Also adding new sensors with new embedded data formats would
> > involve updating all bridge and CSI-2 receiver drivers. I don't expect
> > this to be a workable approach.
> >
> > Instead what I'm proposing is to use specific metadata formats on the
> > sensor devices only, on internal pads (more about those soon) of the
> > sensors, only visible in the UAPI, and then generic mbus formats along the
> > pipeline and finally generic V4L2 metadata formats on the DMAs (specific
> > to bit depth and packing). This would unsnarl the two, defining what data
> > there is (specific mbus code) and how that is transported and packed
> > (generic mbus codes and V4L2 formats).
> >
> > The user space would be required to "know" the path of that data from the
> > sensor's internal pad to the V4L2 video node. I do not see this as these
> > devices require at least some knowledge of the pipeline, i.e. hardware at
> > hand. Separating what the data means and how it is packed may even be
> > beneficial: it allows separating code that interprets the data (sensor
> > internal mbus code) from the code that accesses it (packing).
> >
> > These formats are in practice line based, meaning that there may be
> > padding at the end of the line, depending on the bus as well as the DMA.
> > If non-line based formats are needed, it is always possible to set the
> > "height" field to 1.
> 
> One thing that may be worth considering or clarifying - for the case of
> the BCM2835 Unicam CSI-2 device, we only have 2x DMA output channels. So
> one will match image data packets, and the other will match "everything
> else". Typically "everything else" would only be CSI-2 embedded data, but
> in the case of the Raspberry Pi Camera v3 (IMX708), it includes embedded
> data, PDAF data, and HDR histogram data. Each of these outputs can be
> programmed to use a different packet ID in the sensor, but since Unicam
> only has a single DMA for "everything else", it all gets dumped into one
> metadata buffer. But given we know the exact structure of the data
> streams, it's trivial for useland to find the right bits in this buffer.
> Of course, other CSI-2 receivers with more DMA channels might allow these
> streams to end up in their own buffers.
> 
> Nothing in your series seems to stop us operating Unicam in this way,
> particularly because there is no fixed definition of the data format for
> V4L2_META_FMT_GENERIC_8. So I don't think it's a problem, but perhaps
> it's worth documenting that the metadata might include multiple streams
> from the sensor?

I believe this happens on other hardware, too, indeed. Currently the
documentation says that

	Any number of routes from streams on sink pads towards streams on
	source pads is allowed, to the extent supported by drivers. For
	every stream on a source pad, however, only a single route is
	allowed.

	(Documentation/userspace-api/media/v4l/dev-subdev.rst)

This probably needs to be changed to allow what you'd need?

-- 
Kind regards,

Sakari Ailus
