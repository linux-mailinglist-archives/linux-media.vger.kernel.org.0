Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE6F67BDE76
	for <lists+linux-media@lfdr.de>; Mon,  9 Oct 2023 15:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346443AbjJINTx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 09:19:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376430AbjJIMTD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 08:19:03 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A59B43C0D
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 05:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696853783; x=1728389783;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=chf52JvMskAyiT5JertBn3ke3Uudh2MmXCMjYnSHyuY=;
  b=cYx1GTEgJj+eAjiYNTJg81JYKbLmxjcWxfDqP9WazpK3VVgl1SmCRg+o
   LddlrYvTQDGF6hWzORjtvHuejeZQC5DDZXpDXjRrlVf0pag69Z4y226np
   X38M0UBKLXVr9KGlDeA5tOTgBv3TnyRVnEwPeBE/lgL/VYZW7SieQT0q5
   tDhT7/Jji/x+AswuCQnVt4M4aV+LLp0b2VJ1/gTp/bCpFBJLd0gv6pDcX
   /FuPOF34Dwc9T1ACSbA46+DoAvemQpvjxmkIGpXKAnCn5fYxtaG6HcoFE
   juVlB1t2JF4s4m2LHubLlf1Z3xs1rlwpGG4BzjYSh5SqdBVusj8Gl76Jq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="448317268"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="448317268"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 05:16:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="729653004"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="729653004"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 05:16:19 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 003E111F835;
        Mon,  9 Oct 2023 15:16:16 +0300 (EEST)
Date:   Mon, 9 Oct 2023 12:16:16 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v6 00/28] Generic line based metadata support, internal
 pads
Message-ID: <ZSPvENBUMEuwGprh@kekkonen.localdomain>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
 <95d77f2a-bfcf-fc80-7e1a-0f207217b358@ideasonboard.com>
 <ZR58OGjjg8kehn0z@kekkonen.localdomain>
 <25a0a013-50b7-9665-5509-06617cacdf9b@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25a0a013-50b7-9665-5509-06617cacdf9b@ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Thu, Oct 05, 2023 at 02:17:07PM +0300, Tomi Valkeinen wrote:
> On 05/10/2023 12:04, Sakari Ailus wrote:
> > Hyvää huomenta!
> > 
> > On Thu, Oct 05, 2023 at 11:05:54AM +0300, Tomi Valkeinen wrote:
> > > Hi!
> > > 
> > > Thanks for working on this. I think this series is very important.
> > > 
> > > On 03/10/2023 14:52, Sakari Ailus wrote:
> > > > Hi folks,
> > > > 
> > > > Here are a few patches to add support generic, line based metadata as well
> > > > as internal pads. While the amount of code is not very large, to the
> > > > contrary it is quite small actually IMO, I presume what this is about and
> > > > why it is being proposed requires some explaining.
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
> > > 
> > > What do you mean with "only visible in the UAPI"?
> > 
> > Other drivers won't bother with specific metadata formats: they are only
> > present on the internal pads while external pads have generic formats.
> > 
> > > 
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
> > > > 
> > > > The internal (source) pads are an alternative to source routes [1]. The
> > > > source routes were not universally liked and I do have to say I like
> > > > re-using existing interface concepts (pads and everything you can do with
> > > > pads, including access format, selections etc.) wherever it makes sense,
> > > > instead of duplicating functionality.
> > > > 
> > > > Effectively internal source pads behave mostly just like sink pads, but
> > > > they describe a flow of data that originates from a sub-device instead of
> > > > arriving to a sub-device. The SUBDEV_S_ROUTING IOCTLs are used to enable
> > > > and disable routes from internal source pads to sub-device's source pads.
> > > > The subdev format IOCTLs are usable, too, so one can find which subdev
> > > > format is available on given internal source pad.
> > > 
> > > I think the internal pads require a bit more praise, as they can be used for
> > > other things too. E.g. the ds90ub953 FPD-Link serializer has a test pattern
> > > generator, which can be modeled very nicely with internal pads. The internal
> > > pad represents the TPG, and the user can use routing to choose if the output
> > > of the device is sourced from the normal input or from the TPG. And one can
> > > set the format on the TPG pad, thus configuring the TPG.
> > 
> > Well, yes, indeed.
> > 
> > Could you review especially the documentation patches to ensure we're
> > aligned on this?
> 
> Sure.
> 
> > > 
> > > > This set depends on these patches:
> > > > 
> > > > <URL:https://lore.kernel.org/linux-media/20231002105557.28972-1-sakari.ailus@linux.intel.com/T/#t>
> > > 
> > > Hmm, it's a bit odd for a generic series to depend on a device specific
> > > series. That makes backporting these more difficult. Why do these depend on
> > > ov2740 and css patches?
> > 
> > Patchset-wise that is the dependency, individual patches may be backported
> > without backporting _all_ driver patches in the previous set. However, if
> > you need those drivers as well, then you'll need to backport these patches,
> > too.
> 
> Ok. I don't like the structure of these serieses that much.
> 
> I haven't reviewed the patches yet, so maybe there are reasons for the
> structure, but I'd rather have, in this order, preferably as separate
> serieses:
> 
> - cleanups/fixes not directly related to ccs, embedded data or internal pads
> - internal pads
> - embedded data
> - driver changes
> 
> That would help in backporting, but it'd also help with the reviews as the
> series would be more concentrated on a single topic.

It's also useful to use new APIs once they're added rather than (much)
later in the set. This is one of the reasons why the patches are arranged as
they are.

I'll see if this could be taken better into account and if further cleanups
could be merged earlier, I think there are at least a couple of such
patches.

-- 
Regards,

Sakari Ailus
