Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00E5069BA0A
	for <lists+linux-media@lfdr.de>; Sat, 18 Feb 2023 13:52:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbjBRMwL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Feb 2023 07:52:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjBRMwK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Feb 2023 07:52:10 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58EAA14EA0
        for <linux-media@vger.kernel.org>; Sat, 18 Feb 2023 04:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676724729; x=1708260729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kQnpOQhBXT/LA2KQtbj8PWcPPlTTfuaa8JKys7onHCw=;
  b=aPeXdOGbdjwak2otuz5Aohf3H08imMVGgsBR/EWEkWAWt7zKtjL7bZD0
   xIIHbFEZ/NfzEbukNU5a5BszlamqRyvjdwDK17jgUN2VPvB+t6L+bR2EQ
   0MgokIvtG5IbfBd+eJDOeeWoCIiWedRjIdK1Jx36FJkvO0n4q/2iHsPvo
   4POor8fSAStvekwSrlRqIdk9IWwBopKORnbimjy7stMUlFmoLPOYeaIA6
   HIdkd71FUjATHDuXqNwz3yglR55Df/4GroNSLeeb4pOwqDmct7v5dfipv
   YwI9mQ8H0j6fqpqlXzj9tLeJ/YlwnMC/pT7HZ9uTLCIIL6oijmEkfNil0
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="418392560"
X-IronPort-AV: E=Sophos;i="5.97,307,1669104000"; 
   d="scan'208";a="418392560"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 04:52:09 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="739592371"
X-IronPort-AV: E=Sophos;i="5.97,307,1669104000"; 
   d="scan'208";a="739592371"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 04:52:07 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 0E3F211F913;
        Sat, 18 Feb 2023 14:52:05 +0200 (EET)
Date:   Sat, 18 Feb 2023 14:52:05 +0200
From:   "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andy Shevchenko <andy@kernel.org>,
        Dan Scally <djrscally@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: RFC: removing various special/obscure features from atomisp code
 ?
Message-ID: <Y/DJ9WikTA+OnrCu@kekkonen.localdomain>
References: <5309d845-063b-6dd9-529d-0f82654290f2@redhat.com>
 <Y+5CMkwHy9tuk6G2@pendragon.ideasonboard.com>
 <c3dc3173-9bbd-c48a-80a7-ec6a86b6e360@redhat.com>
 <Y+6hSuRzaaHj83S9@pendragon.ideasonboard.com>
 <ea81b17b-7d1f-a5e1-11dd-04db310e1e50@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea81b17b-7d1f-a5e1-11dd-04db310e1e50@redhat.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Feb 17, 2023 at 04:18:55PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 2/16/23 22:34, Laurent Pinchart wrote:
> > Hi Hans,
> > 
> > On Thu, Feb 16, 2023 at 04:47:51PM +0100, Hans de Goede wrote:
> >> On 2/16/23 15:48, Laurent Pinchart wrote:
> >>> On Thu, Feb 16, 2023 at 03:20:08PM +0100, Hans de Goede wrote:
> >>>> Hi All,
> >>>>
> >>>> I have been looking into moving the sensor registration for atomisp2
> >>>> over to v4l2-aysnc similar to how
> >>>> drivers/media/pci/intel/ipu3/cio2-bridge.c does things.
> >>>>
> >>>> Together with some other smaller changes this should allow the atomisp
> >>>> code use standard sensor drivers instead of having their own fork of
> >>>> these drivers.
> >>>>
> >>>> While looking into this I realized that the current architecture of
> >>>> the atomisp2 code where it registers 8 /dev/video# nodes + many
> >>>> v4l2-subdevs is getting in the way of doing this.  At a minimum the
> >>>> current convoluted media-ctl graph makes it harder then necessary to
> >>>> make this change.
> >>>>
> >>>> So this makes me realize that it probably is time to make some changes
> >>>> to the atomisp-code to remove a bunch of somewhat obscure (and
> >>>> untested / unused) features. I have been thinking about removing these
> >>>> for a long time already since they also get in the way of a bunch of
> >>>> other things like allowing the /dev/video# nodes to be opened multiple
> >>>> times.
> >>>>
> >>>> So my plan is to reduce the feature set to make atomisp work as more
> >>>> or less a standard webcam (with front/back sensors) which is how most
> >>>> hw is using it and also is how all our (my) current testing uses it.
> >>>>
> >>>> This means reducing the graph to a single /dev/video0 output node + 2
> >>>> subdevs for the sensors I might put one more node in the graph for
> >>>> selecting between the 3 CSI ports, or those could be 3 possible
> >>>> sources for /dev/video0.
> >>>
> >>> Could you briefly summarize the hardware architecture, and in particular
> >>> what building blocks are present, and how they're connected ? That will
> >>> help with the discussion.
> >>
> >> I can try, but it is complicated. The atomisp appears to mainly be
> >> some coprocessor thing (with I guess some hw-accel blocks on the side)
> >> the way it works from the driver's pov is that the firmware file really
> >> contains a a whole bunch of different binaries to run on the co-processor,
> >> with a table describing the binaries including supported input and
> >> output formats.
> >>
> >> Each binary represents a complete camera pipeline, going from
> >> directly reading from the CSI receiver on one end to DMA-ing
> >> the fully finished ready to consume buffers in the requested
> >> destination fmt on the other end. The driver picks a binary
> >> based on the requested input + output formats and then uploads
> >> + starts that.
> >>
> >> So basically it is one big black box, where we hookup a
> >> sensor on one side and then on the other end say give my YUYV
> >> or YU12, or ...   There are of course a whole bunch of
> >> processing parameters we can set like lens shading correction
> >> tables (format unknown), etc. But basically it is still
> >> just a black box.
> >>
> >> So from a mediactl pov as I see it the whole thing is a single
> >> node in the graph.
> > 
> > Do you mean a single entity for the ISP ? I'd go for
> > 
> > sensor subdev -> CSI-2 RX subdev -> ISP subdev -> video device
> > 
> > Is that what you meant ?
> 
> Yes although I'm not sure having "CSI-2 RX subdev" in there
> as a separate node makes much sense given how blackbox-y
> the entire working of the pipeline is.
> 
> At least I'm not aware of any way to e.g. skip the ISP and
> get raw bayer frames directly out of the CSI-2 receiver.

This should be technically possible, or at least it has been. Not quite
sure about this hardware version or firmware though.

Even then, it's always possible to have one more pad for raw output in the
same sub-device. The ISP won't be usable for memory to memory processing
while capturing raw anyway --- it's not supported by the firmware.

-- 
Regards,

Sakari Ailus
