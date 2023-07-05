Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E15D747FA6
	for <lists+linux-media@lfdr.de>; Wed,  5 Jul 2023 10:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232197AbjGEI2Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jul 2023 04:28:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232667AbjGEI1w (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jul 2023 04:27:52 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CFA41FEC
        for <linux-media@vger.kernel.org>; Wed,  5 Jul 2023 01:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688545654; x=1720081654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RlKfy19wn+5sfSHGa6zL+dhJelocJfTB7yqgu7LxUOA=;
  b=Byp7CMknG2oY2cOTn34qZ8Eajz0jwQpI4vqIbFzEelKd83T3vkdl4jlY
   UzsHQFyZXP3A33tgIJSgBqznXRXvEu0EEpo8+zFiFrspdwe9eIYnjojRo
   Snke+w9whwf27PevU7pT28ma9L13I85Z9ul2ls6sdosEeDih3UrtiOeyj
   WtQd0GwXic8OyhXpoMKe9KZu7qhsL7QZjq00tpnqIRkqJHtTFNMO2bMkT
   oUCSorSSVswN4tn8rqk9kHDRppB9dKWv/8MvZFapXt7l0o61tyefh4K7o
   hVEoRA0l9acjbmNWx5XN/3M1bE/gxj+1+XjVnffECFhDRY5nvdA/Nt7jD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="342873150"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="342873150"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 01:27:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="809187007"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="809187007"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 01:27:31 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id DD3AA11FB8E;
        Wed,  5 Jul 2023 11:27:28 +0300 (EEST)
Date:   Wed, 5 Jul 2023 08:27:28 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl
Subject: Re: [PATCH 0/7] Generic line based metadata support, internal pads
Message-ID: <ZKUpcImy3i4OWWMn@kekkonen.localdomain>
References: <20230630204338.126583-1-sakari.ailus@linux.intel.com>
 <20230704125720.GA24035@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230704125720.GA24035@pendragon.ideasonboard.com>
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

On Tue, Jul 04, 2023 at 03:57:20PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Fri, Jun 30, 2023 at 11:43:31PM +0300, Sakari Ailus wrote:
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
> 
> I've just realized that, unless I'm mistaken, we've never documented
> which of the v4l2_mbus_framefmt fields are valid for metadata formats.
> Should this be fixed as part of this series ?

Good point. I'll add a patch to document this. It's bound to be dependent
on mbus code as we don't have (which is a good thing) any indication of
type of the data there.

> 
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
> 
> Jacopo and I are working on this, including libcamera support.

Thanks, this is much appreciated!

-- 
Kind regards,

Sakari Ailus
