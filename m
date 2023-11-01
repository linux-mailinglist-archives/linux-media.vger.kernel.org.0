Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 088987DE18B
	for <lists+linux-media@lfdr.de>; Wed,  1 Nov 2023 14:34:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344219AbjKANbZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Nov 2023 09:31:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344200AbjKANbY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Nov 2023 09:31:24 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F13C2FD
        for <linux-media@vger.kernel.org>; Wed,  1 Nov 2023 06:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698845478; x=1730381478;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=25lObjMkN/e5nJp8aILWJT5zRsVpQvYOpyaM4XJtooQ=;
  b=mL3DCxxYifc3/SC0WB6SebUG7b6d7nKjIDELwfKOovca0kbtadhycWem
   c4GO90ZQSwYKKQ/D1aLuunhHEyM7Xft41fVUohaPs1SSeI64S5QbqaL3y
   eJeOu/xvpJLUgoQGN674a1NWh0LphuymJgc4HLVbNI3HcQtOIn6whI71D
   KADQxytM5KpoioVtsIdJUlVmCoAsibPlDuqZUQXi2KRMT+DY5gVIzRG0D
   JbB4ej681m90ecohLfONmYaVeHEBT/RjzSMCgQE2z7H4se7ly96GZ1VzW
   19PHz6JJRdcmGzVjOQTza9J3AnnWWaowcQdqBdI21YnAw9y0D0DrZU9Uz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="388311243"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; 
   d="scan'208";a="388311243"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 06:31:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="754473086"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; 
   d="scan'208";a="754473086"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 06:31:16 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 4E59C1207A3;
        Wed,  1 Nov 2023 15:31:13 +0200 (EET)
Date:   Wed, 1 Nov 2023 13:31:13 +0000
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
Message-ID: <ZUJTITOHBtM80kyL@kekkonen.localdomain>
References: <20231101080546.1145527-1-sakari.ailus@linux.intel.com>
 <20231101125350.GL12764@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231101125350.GL12764@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, Nov 01, 2023 at 02:53:50PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.

Thank you for the review.

> 
> On Wed, Nov 01, 2023 at 10:05:46AM +0200, Sakari Ailus wrote:
> > Document that sub-device initialisation needs to complete before the async
> > sub-device is registered as there is no further driver action needed
> > before the sensor becomes accessible via the UAPI.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  Documentation/driver-api/media/camera-sensor.rst | 3 ++-
> >  Documentation/driver-api/media/v4l2-subdev.rst   | 4 ++++
> >  2 files changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> > index 6456145f96ed..c675ce77c4d6 100644
> > --- a/Documentation/driver-api/media/camera-sensor.rst
> > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > @@ -60,7 +60,8 @@ management over the pipeline.
> >  Camera sensor drivers are responsible for controlling the power state of the
> >  device they otherwise control as well. They shall use runtime PM to manage
> >  power states. Runtime PM shall be enabled at probe time and disabled at remove
> > -time. Drivers should enable runtime PM autosuspend.
> > +time. Drivers should enable runtime PM autosuspend. Note that runtime PM has to
> > +be enabled before registering the sensor's async sub-device.
> 
> I wouldn't single out runtime PM initialization here, and neither would
> I talk about registration, as that's not in scope for this file. I think
> it would be better to instead reference v4l2-subdev.rst at the beginning
> of this file. Something generic like stating that camera sensor must be
> implemented as subdevs, and comply with the generic rules for subdevs,
> as explaiend in v4l2-subdev.rst.

I added this text here as this appears to be a very common problem in
sensor drivers. Tost likely the reason is that some drivers have had this
issue and it has gotten copied elsewhere.

> 
> >  
> >  The runtime PM handlers shall handle clocks, regulators, GPIOs, and other
> >  system resources required to power the sensor up and down. For drivers that
> > diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
> > index e56b50b3f203..b22d1b075fd6 100644
> > --- a/Documentation/driver-api/media/v4l2-subdev.rst
> > +++ b/Documentation/driver-api/media/v4l2-subdev.rst
> > @@ -195,6 +195,10 @@ performed using the :c:func:`v4l2_async_unregister_subdev` call. Subdevices
> >  registered this way are stored in a global list of subdevices, ready to be
> >  picked up by bridge drivers.
> >  
> > +Note that all sensor initialisation has to complete before registering the async
> > +sub-device, including enabling runtime PM. This is because the sensor becomes
> > +accessible via the UAPI without further action by the sensor driver.
> 
> It's not just the UAPI, but also in-kernel users.
> 
> The passive form is heavier and thus harder to read. Maybe something
> like the following ? Feel free to rework it.
> 
> ----
> Drivers must complete all initialization of the sensor before registering the
> async sub-device. This includes enabling runtime PM. This is because the sensor
> becomes accessible and may be used as soon as it gets registered.

s/used/accessed/ maybe? Or remove "and maybe used"?

> ----
> 
> Also, wouldn't this be better placed in the "Registering asynchronous
> sub-devices" section ? This isn't specific to sensors.

Ah, yes, I meant sub-devices there. This actually applies to all
of UAPI, in general, but it's the async sub-device drivers that tend to
have the problem as people tend to think it's "just" registering the async
sub-device but in fact the related sub-device may be immediately registered
as well.

> 
> > +
> >  Asynchronous sub-device notifiers
> >  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >  
> 

-- 
Regards,

Sakari Ailus
