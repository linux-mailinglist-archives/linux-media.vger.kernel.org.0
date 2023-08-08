Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04249773F07
	for <lists+linux-media@lfdr.de>; Tue,  8 Aug 2023 18:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233256AbjHHQlR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Aug 2023 12:41:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231899AbjHHQkX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Aug 2023 12:40:23 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0989B15BA8
        for <linux-media@vger.kernel.org>; Tue,  8 Aug 2023 08:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691510079; x=1723046079;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hx11XmaiU2/u/WWDrt4UMPCOITZ2kZMzTc86vWMpghU=;
  b=grQYbtCc7/vymrzsYE936kgNHWO1t62xKDg9jrpIwKBNSYurXUZ54GMX
   NykMOW7eCsL4axkpaFbrV+RVJ8nlMtekwNZr0E3GDjly2FbmcR+u1o9mv
   JJxW0jdH5HdVTWJNOAu7V4NSUalrxCST8qz6qZoCgJ1WmLRhsMiNwa+Tn
   X4/WFV8RphxmgYVycVroPf0jOgLs8mYxOkVJKWKVvASjDSemDrKtXXne4
   /idK3rcJ3ex29ZN5kfr7zMgo5/klVSiJfsRD/HN69R9ChXU1FyaI06GEF
   wz8VbQfd5JrWA/ZLS8wBXKGnYBWvUmSi7wibC/rKtouVmLg4i28yvIJYe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="437078442"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="437078442"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 00:48:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="681145974"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="681145974"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 00:48:51 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id BC6F811FAE0;
        Tue,  8 Aug 2023 10:48:48 +0300 (EEST)
Date:   Tue, 8 Aug 2023 07:48:48 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v2 0/9] Generic line based metadata support, internal pads
Message-ID: <ZNHzYEemlKpGmqM8@kekkonen.localdomain>
References: <20230802214556.180589-1-sakari.ailus@linux.intel.com>
 <68805434-dd30-8da8-d4b6-48b5cf669633@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68805434-dd30-8da8-d4b6-48b5cf669633@xs4all.nl>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Aug 08, 2023 at 09:42:07AM +0200, Hans Verkuil wrote:
> On 02/08/2023 23:45, Sakari Ailus wrote:
> > Hi folks,
> > 
> > Here are a few patches to add support generic, line based metadata as well
> > as internal pads. While the amount of code is not very large, to the
> > contrary it is quite small actually IMO, I presume what this is about and
> > why it is being proposed requires some explaining.
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
> > 
> > The internal (source) pads are an alternative to source routes [1]. The
> > source routes were not universally liked and I do have to say I like
> > re-using existing interface concepts (pads and everything you can do with
> > pads, including access format, selections etc.) wherever it makes sense,
> > instead of duplicating functionality.
> > 
> > Effectively internal source pads behave mostly just like sink pads, but
> > they describe a flow of data that originates from a sub-device instead of
> > arriving to a sub-device. The SUBDEV_S_ROUTING IOCTLs are used to enable
> > and disable routes from internal source pads to sub-device's source pads.
> > The subdev format IOCTLs are usable, too, so one can find which subdev
> > format is available on given internal source pad.
> > 
> > This set depends on these patches:
> > 
> > <URL:https://lore.kernel.org/linux-media/20230505205416.55002-1-sakari.ailus@linux.intel.com/T/#t>
> > 
> > I've also pushed these here and I'll keep updating the branch:
> > 
> > <URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata>
> > 
> > Questions and comments are most welcome.
> > 
> > Driver support is to be added, as well as an example.
> > 
> > [1] <URL:https://lore.kernel.org/linux-media/20220831141357.1396081-20-tomi.valkeinen@ideasonboard.com/>
> > 
> > since v2:
> > 
> > - Added an example demonstrating the use of internal pads. --- Is the
> >   level of detail enough for the purpose?
> > 
> > - Improved documentation.
> > 
> > - Added a macro to tell whether a format is a metadata format.
> >   (Documentation could be added.)
> > 
> > - A small ReST syntax fix in the same section.
> > 
> > - Drop leftovers of a patch checking for the INTERNAL_SOURCE flag.
> > 
> > since v1:
> > 
> > - Make the new pad flag just "INTERNAL", requiring either SINK or SOURCE
> >   pad flag to accompany it. Removed the union in struct v4l2_subdev_route.
> > 
> > - Add the term "stream" to MC glossary.
> > 
> > - Improved and fixed documentation (according to comments).
> > 
> > - Note these formats are little endian.
> > 
> > - Remove 1X8 from the names of the mbus codes. These formats have generally
> >   8 bits per pixel.
> > 
> > - Fix mbus code numbering (had holes in RFC).
> > 
> > - Add new metadata fields to debug prints.
> > 
> > - Fix a minor documentation build issue.
> > 
> > Sakari Ailus (9):
> >   media: Documentation: Align numbered list
> >   media: mc: Check pad flag validity
> >   media: mc: Add INTERNAL pad flag
> >   media: uapi: v4l: Document source routes
> >   media: uapi: Add generic serial metadata mbus formats
> >   media: uapi: Document which mbus format fields are valid for metadata
> >   media: uapi: Add a macro to tell whether an mbus code is metadata
> >   media: uapi: Add generic 8-bit metadata format definitions
> >   media: v4l: Support line-based metadata capture
> 
> FYI: building the documentation results in these warnings:
> 
> Documentation/media/userspace-api/glossary.rst:117: WARNING: term not in glossary: 'V4L2 API'
> Documentation/media/userspace-api/glossary.rst:130: WARNING: term not in glossary: 'V4L2 Hardware'
> Documentation/media/userspace-api/glossary.rst:194: WARNING: term not in glossary: 'V4L2 API'
> Documentation/media/userspace-api/glossary.rst:207: WARNING: term not in glossary: 'V4L2 API'
> Documentation/media/userspace-api/glossary.rst:207: WARNING: term not in glossary: 'V4L2 Sub-device'

I've seen them, too. I'll post fixes some time soon...

-- 
Sakari Ailus
