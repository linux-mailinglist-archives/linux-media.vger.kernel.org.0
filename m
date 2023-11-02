Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC1D7DEDD1
	for <lists+linux-media@lfdr.de>; Thu,  2 Nov 2023 09:02:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234386AbjKBICu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Nov 2023 04:02:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbjKBICu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Nov 2023 04:02:50 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79F26102
        for <linux-media@vger.kernel.org>; Thu,  2 Nov 2023 01:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698912164; x=1730448164;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cL4+hAdKzfyfkVXNbBnbnUSFI1WL7ApH2O0zryK+K6M=;
  b=Pr1PynWhJgSgi9tXNolnCuI1dL8ERVmQIrsL+VWN2+DAPj3W0QV/Prad
   /UVOdhVI9KEoSIwvvwov4YS9W+Qp4srsaHo4cyJjZ5WoQV/JovW8jGF4x
   OieIYSWhxtjksqxo/qgqCHUCMxtuVmtEXnt0eyAGkH9u+8X4Anki5flQ5
   AV/vuzoGNzEVsmMXiqffn7WelpunEjWa1woMt0sNb3/nJRV4Jv5SdNgLc
   GBmzEU9J4T07bVm6mKx5ErKHjiuiJ31ZkK7GmAuEVycZ+xKdO+bvSfBjX
   8LGSzFNiO+WcP2Bmd0dKUi++71Ou6mlNXBcY2UFdVXB0NZIUtQOzo1jOD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="455137826"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="455137826"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 01:02:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="737671208"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="737671208"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 01:02:35 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 3B83E11F9E8;
        Thu,  2 Nov 2023 09:54:34 +0200 (EET)
Date:   Thu, 2 Nov 2023 07:54:34 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        "Cao, Bingbu" <bingbu.cao@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        hverkuil@xs4all.nl
Subject: Re: [PATCH 1/1] media: Documentation: Initialisation finishes before
 subdev registration
Message-ID: <ZUNVusvlOm1M3gE3@kekkonen.localdomain>
References: <20231101080546.1145527-1-sakari.ailus@linux.intel.com>
 <20231101125350.GL12764@pendragon.ideasonboard.com>
 <ZUJTITOHBtM80kyL@kekkonen.localdomain>
 <20231101134506.GP12764@pendragon.ideasonboard.com>
 <ZUJb4JXALy9WhDcW@kekkonen.localdomain>
 <20231101153635.GA12764@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231101153635.GA12764@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 01, 2023 at 05:36:35PM +0200, Laurent Pinchart wrote:
> On Wed, Nov 01, 2023 at 02:08:32PM +0000, Sakari Ailus wrote:
> > On Wed, Nov 01, 2023 at 03:45:06PM +0200, Laurent Pinchart wrote:
> > > On Wed, Nov 01, 2023 at 01:31:13PM +0000, Sakari Ailus wrote:
> > > > On Wed, Nov 01, 2023 at 02:53:50PM +0200, Laurent Pinchart wrote:
> > > > > On Wed, Nov 01, 2023 at 10:05:46AM +0200, Sakari Ailus wrote:
> > > > > > Document that sub-device initialisation needs to complete before the async
> > > > > > sub-device is registered as there is no further driver action needed
> > > > > > before the sensor becomes accessible via the UAPI.
> > > > > > 
> > > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > > ---
> > > > > >  Documentation/driver-api/media/camera-sensor.rst | 3 ++-
> > > > > >  Documentation/driver-api/media/v4l2-subdev.rst   | 4 ++++
> > > > > >  2 files changed, 6 insertions(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> > > > > > index 6456145f96ed..c675ce77c4d6 100644
> > > > > > --- a/Documentation/driver-api/media/camera-sensor.rst
> > > > > > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > > > > > @@ -60,7 +60,8 @@ management over the pipeline.
> > > > > >  Camera sensor drivers are responsible for controlling the power state of the
> > > > > >  device they otherwise control as well. They shall use runtime PM to manage
> > > > > >  power states. Runtime PM shall be enabled at probe time and disabled at remove
> > > > > > -time. Drivers should enable runtime PM autosuspend.
> > > > > > +time. Drivers should enable runtime PM autosuspend. Note that runtime PM has to
> > > > > > +be enabled before registering the sensor's async sub-device.
> > > > > 
> > > > > I wouldn't single out runtime PM initialization here, and neither would
> > > > > I talk about registration, as that's not in scope for this file. I think
> > > > > it would be better to instead reference v4l2-subdev.rst at the beginning
> > > > > of this file. Something generic like stating that camera sensor must be
> > > > > implemented as subdevs, and comply with the generic rules for subdevs,
> > > > > as explaiend in v4l2-subdev.rst.
> > > > 
> > > > I added this text here as this appears to be a very common problem in
> > > > sensor drivers. Tost likely the reason is that some drivers have had this
> > > > issue and it has gotten copied elsewhere.
> > > 
> > > Yes, I think there's lots of cargo cult there. Documentation is good,
> > > fixing drivers so that the next person to copy code will copy good code
> > > is better, but the best solution is to move most of the problem to
> > > helper functions provided by the core.
> > 
> > I wouldn't call it "cargo cult" if a sensor driver needs to deal with
> > multiple unrelated matters.
> 
> I meant that most sensor drivers are written by copying code from other
> drivers without understanding what that code does exactly, and why.

That certainly does happen, too...

> 
> > Of course it's possible to have helper
> > functions performing multiple unrelated things but at some point it is easy
> > to notice some drivers need things to be done differently. Admittedly, most
> > of such differences are due to historical reasons, not something you want
> > in new drivers anymore.
> 
> It's time to relegate historical code to the git history :-)
> 
> > > I still prefer linking to v4l2-subdev.rst. Duplicating documentation in
> > > multiple places increases the chances it will get stale.
> > 
> > I'm fine with dropping this part of the patch. Although what is being said
> > there is very unlikely to change in the foreseeable future.
> 
> Would you add a link to v4l2-subdev.rst at the top of the file ? It can
> be done in a separate patch.

I'll add that in v2.

> 
> > > > > >  The runtime PM handlers shall handle clocks, regulators, GPIOs, and other
> > > > > >  system resources required to power the sensor up and down. For drivers that
> > > > > > diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
> > > > > > index e56b50b3f203..b22d1b075fd6 100644
> > > > > > --- a/Documentation/driver-api/media/v4l2-subdev.rst
> > > > > > +++ b/Documentation/driver-api/media/v4l2-subdev.rst
> > > > > > @@ -195,6 +195,10 @@ performed using the :c:func:`v4l2_async_unregister_subdev` call. Subdevices
> > > > > >  registered this way are stored in a global list of subdevices, ready to be
> > > > > >  picked up by bridge drivers.
> > > > > >  
> > > > > > +Note that all sensor initialisation has to complete before registering the async
> > > > > > +sub-device, including enabling runtime PM. This is because the sensor becomes
> > > > > > +accessible via the UAPI without further action by the sensor driver.
> > > > > 
> > > > > It's not just the UAPI, but also in-kernel users.
> > > > > 
> > > > > The passive form is heavier and thus harder to read. Maybe something
> > > > > like the following ? Feel free to rework it.
> > > > > 
> > > > > ----
> > > > > Drivers must complete all initialization of the sensor before registering the
> > > > > async sub-device. This includes enabling runtime PM. This is because the sensor
> > > > > becomes accessible and may be used as soon as it gets registered.
> > > > 
> > > > s/used/accessed/ maybe? Or remove "and maybe used"?
> > > 
> > > I'm fine with that.
> > > 
> > > > > ----
> > > > > 
> > > > > Also, wouldn't this be better placed in the "Registering asynchronous
> > > > > sub-devices" section ? This isn't specific to sensors.
> > > > 
> > > > Ah, yes, I meant sub-devices there. This actually applies to all
> > > > of UAPI, in general, but it's the async sub-device drivers that tend to
> > > > have the problem as people tend to think it's "just" registering the async
> > > > sub-device but in fact the related sub-device may be immediately registered
> > > > as well.
> > > 
> > > Note there are two sections, one about subdev registration, one about
> > > camera sensor registration. You've added the text to the latter.
> > 
> > The section I added the text to does not mention camera sensors separately,
> > the section title is "Registering asynchronous sub-devices".
> 
> My bad, I was looking at the wrong location. Replacing the reference to
> sensor with subdev should be good enough then.

Good that we agree. :-)

I'll use this as the original sentence, after replacing sensor with
sub-device, made an unintended difference between the sub-device and teh
async sub-device:

Drivers must complete all initialization of the sub-device before
registering it using :c:func:`v4l2_async_register_subdev`, including
enabling runtime PM. This is because the sub-device becomes accessible
as soon as it gets registered.

-- 
Regards,

Sakari Ailus
