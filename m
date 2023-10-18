Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37C407CD939
	for <lists+linux-media@lfdr.de>; Wed, 18 Oct 2023 12:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbjJRKcJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Oct 2023 06:32:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbjJRKcH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Oct 2023 06:32:07 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FD9395
        for <linux-media@vger.kernel.org>; Wed, 18 Oct 2023 03:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697625125; x=1729161125;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ts2oBkLdlyZsvR85vnM3RDcFMGVi4MN0Fxx1XvwBPbw=;
  b=P5kJong5WKs7BpTBOj6kvEOY19kgFtOsCPCb8AO2NXIYMWZq7Aa9nuph
   NIjirRmxBkKxf4jGdaE1OnmfaI5cTBp0FEMeuATYofVHFtn70p7wd2G3x
   p++HrvgqYzERlUwoPeGQLqkXPpsYnH+yRsHJGedAHkQtHDf3psDN5UcxG
   X5FIyKqq6rNXONvmdH5BPvJsbC0AKwSqtfVhtAQv6IXuC3YuA5B6VSXe0
   lT4S9FopcOnkpQ27/owl8bA+T51btiF9w/4fQVmQMW0R40FV3w90oWiPi
   HDAKhacc2jA4YOm6a0l4wIslT93svv+xnKHHg99Q7IYjvCbaiQPP7s+id
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="7536382"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="7536382"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 03:30:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="826841931"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="826841931"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 03:30:28 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 221301206B6;
        Wed, 18 Oct 2023 13:30:26 +0300 (EEST)
Date:   Wed, 18 Oct 2023 10:30:26 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, jacopo.mondi@ideasonboard.com,
        dave.stevenson@raspberrypi.com, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 1/3] media: Documentation: Document how link
 frequencies can be chosen
Message-ID: <ZS+zwu8/j15JWdyy@kekkonen.localdomain>
References: <20231017105630.558089-1-sakari.ailus@linux.intel.com>
 <20231017105630.558089-2-sakari.ailus@linux.intel.com>
 <20231017115221.GC10076@pendragon.ideasonboard.com>
 <ZS6HGqbTr//I030V@kekkonen.localdomain>
 <20231017133459.GA11118@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017133459.GA11118@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Oct 17, 2023 at 04:34:59PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Tue, Oct 17, 2023 at 01:07:38PM +0000, Sakari Ailus wrote:
> > On Tue, Oct 17, 2023 at 02:52:21PM +0300, Laurent Pinchart wrote:
> > > On Tue, Oct 17, 2023 at 01:56:28PM +0300, Sakari Ailus wrote:
> > > > Document how link frequencies can be selected for the link-frequencies
> > > > property.
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  Documentation/driver-api/media/camera-sensor.rst   | 14 ++++++++++++++
> > > >  .../userspace-api/media/drivers/camera-sensor.rst  |  2 ++
> > > >  2 files changed, 16 insertions(+)
> > > > 
> > > > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> > > > index 6456145f96ed..0de5c86cbd1f 100644
> > > > --- a/Documentation/driver-api/media/camera-sensor.rst
> > > > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > > > @@ -29,6 +29,20 @@ used in the system. Using another frequency may cause harmful effects
> > > >  elsewhere. Therefore only the pre-determined frequencies are configurable by the
> > > >  user.
> > > >  
> > > > +On choosing link frequencies
> > > > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > +
> > > > +Choosing link frequencies for a board is generally a part of the hardware design
> > > > +process as one needs to ensure an EMC-safe frequency the sensor supports with
> > > > +the given external clock frequency exists.
> > > 
> > > This is a bit hard to parse. I would write
> > > 
> > > Choosing link frequencies for a board is generally a part of the hardware design
> > > process as one needs to select EMC-safe frequencies that the sensor supports with
> > > the given external clock frequency.
> > 
> > I'll use this in v3.
> > 
> > > > On development systems this may be
> > > > +less than an immediate concern, so more or less anything that sensor and the
> > > > +rest of the applicable hardware supports can be used.
> > > 
> > > True, but it still doesn't say what to pick :-)
> > > 
> > > Q: What link frequency do I put in DT for a development board?
> > > A: Any frequency will do.
> > > Q: 1Hz?
> > > A: No, it has to be supported by the sensor
> > > Q: How do I figure that out?
> > > A: ...
> > > 
> > > And once the range (or list) of frequencies the driver supports (for a
> > > given input clock frequency) will be known, the selection process is
> > > still not totally straightforward, as it will have implications on what
> > > resolutions and frame rates the sensor will be able to output. This is
> > > complicated even further if the sensor can support different number of
> > > data lanes.
> > 
> > Ultimately this is always sensor specific: the PLL tree documentation is
> > the key here if the frequencies are not known otherwise. I guess one
> > guidance we could give is look what the driver supports but that is what
> > virtually every developers can figure out by themselves.
> > 
> > I'd say teaching mathematics is out of scope of this documentation.
> 
> I don't know how to compute the information. Can you teach me ? And
> let's record it in the documentation.

You're certainly not in a position to state this: you've written a PLL
calculator for an Aptina sensor. It's certainly easier to come up with a
single configuration than writing code that comes up with a reasonable
configuration when only the input and output parameters are known.

The Aptina PLL calculator is much more simple than the CCS PLL calculator,
perhaps we should use it as an example?

> 
> > > > +
> > > > +If the sensor's PLL tree is not documented and all that is available are
> > > > +register lists, even knowing the frequency a driver uses may be difficult. This
> > > > +could still be :ref:`calculated from the number of lanes, sensor's output image
> > > > +size, blanking values and frame rate <media_camera_raw_frame_interval>`.
> > > > +
> > > >  ACPI
> > > >  ~~~~
> > > >  
> > > > diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > > > index 919a50e8b9d9..e0596b85e7ec 100644
> > > > --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > > > +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > > > @@ -44,6 +44,8 @@ There are two different methods for obtaining possibilities for different frame
> > > >  intervals as well as configuring the frame interval. Which one to implement
> > > >  depends on the type of the device.
> > > >  
> > > > +.. _media_camera_raw_frame_interval:
> > > > +
> > > >  Raw camera sensors
> > > >  ~~~~~~~~~~~~~~~~~~
> > > >  
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Regards,

Sakari Ailus
