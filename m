Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D69A47DE1EF
	for <lists+linux-media@lfdr.de>; Wed,  1 Nov 2023 15:14:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbjKANpI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Nov 2023 09:45:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjKANpH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Nov 2023 09:45:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19A3183
        for <linux-media@vger.kernel.org>; Wed,  1 Nov 2023 06:45:01 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 500FC8D;
        Wed,  1 Nov 2023 14:44:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698846283;
        bh=Y/WCWUZ5E6SgvIve6oBj2rBHem5rkg+jCP6aTQi7XI4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g++zEUdkVZYL7lKq7kwFsP8eDD99I4yFDiKMpoz1VfTkUN/fcSrbMpTKjD1pZ/30q
         yWKYKILrm8DiSM1uvAc8Tb+mb/haepZvdFKHoR83UNR82j+W6Wjv+NOHYeG/xjsa7H
         mIk22dQVuFMqgFqPbnFx0eukqzJ4pPeEGj5W5ycc=
Date:   Wed, 1 Nov 2023 15:45:06 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        "Cao, Bingbu" <bingbu.cao@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        hverkuil@xs4all.nl
Subject: Re: [PATCH 1/1] media: Documentation: Initialisation finishes before
 subdev registration
Message-ID: <20231101134506.GP12764@pendragon.ideasonboard.com>
References: <20231101080546.1145527-1-sakari.ailus@linux.intel.com>
 <20231101125350.GL12764@pendragon.ideasonboard.com>
 <ZUJTITOHBtM80kyL@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZUJTITOHBtM80kyL@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Wed, Nov 01, 2023 at 01:31:13PM +0000, Sakari Ailus wrote:
> On Wed, Nov 01, 2023 at 02:53:50PM +0200, Laurent Pinchart wrote:
> > On Wed, Nov 01, 2023 at 10:05:46AM +0200, Sakari Ailus wrote:
> > > Document that sub-device initialisation needs to complete before the async
> > > sub-device is registered as there is no further driver action needed
> > > before the sensor becomes accessible via the UAPI.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  Documentation/driver-api/media/camera-sensor.rst | 3 ++-
> > >  Documentation/driver-api/media/v4l2-subdev.rst   | 4 ++++
> > >  2 files changed, 6 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> > > index 6456145f96ed..c675ce77c4d6 100644
> > > --- a/Documentation/driver-api/media/camera-sensor.rst
> > > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > > @@ -60,7 +60,8 @@ management over the pipeline.
> > >  Camera sensor drivers are responsible for controlling the power state of the
> > >  device they otherwise control as well. They shall use runtime PM to manage
> > >  power states. Runtime PM shall be enabled at probe time and disabled at remove
> > > -time. Drivers should enable runtime PM autosuspend.
> > > +time. Drivers should enable runtime PM autosuspend. Note that runtime PM has to
> > > +be enabled before registering the sensor's async sub-device.
> > 
> > I wouldn't single out runtime PM initialization here, and neither would
> > I talk about registration, as that's not in scope for this file. I think
> > it would be better to instead reference v4l2-subdev.rst at the beginning
> > of this file. Something generic like stating that camera sensor must be
> > implemented as subdevs, and comply with the generic rules for subdevs,
> > as explaiend in v4l2-subdev.rst.
> 
> I added this text here as this appears to be a very common problem in
> sensor drivers. Tost likely the reason is that some drivers have had this
> issue and it has gotten copied elsewhere.

Yes, I think there's lots of cargo cult there. Documentation is good,
fixing drivers so that the next person to copy code will copy good code
is better, but the best solution is to move most of the problem to
helper functions provided by the core.

I still prefer linking to v4l2-subdev.rst. Duplicating documentation in
multiple places increases the chances it will get stale.

> > >  The runtime PM handlers shall handle clocks, regulators, GPIOs, and other
> > >  system resources required to power the sensor up and down. For drivers that
> > > diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
> > > index e56b50b3f203..b22d1b075fd6 100644
> > > --- a/Documentation/driver-api/media/v4l2-subdev.rst
> > > +++ b/Documentation/driver-api/media/v4l2-subdev.rst
> > > @@ -195,6 +195,10 @@ performed using the :c:func:`v4l2_async_unregister_subdev` call. Subdevices
> > >  registered this way are stored in a global list of subdevices, ready to be
> > >  picked up by bridge drivers.
> > >  
> > > +Note that all sensor initialisation has to complete before registering the async
> > > +sub-device, including enabling runtime PM. This is because the sensor becomes
> > > +accessible via the UAPI without further action by the sensor driver.
> > 
> > It's not just the UAPI, but also in-kernel users.
> > 
> > The passive form is heavier and thus harder to read. Maybe something
> > like the following ? Feel free to rework it.
> > 
> > ----
> > Drivers must complete all initialization of the sensor before registering the
> > async sub-device. This includes enabling runtime PM. This is because the sensor
> > becomes accessible and may be used as soon as it gets registered.
> 
> s/used/accessed/ maybe? Or remove "and maybe used"?

I'm fine with that.

> > ----
> > 
> > Also, wouldn't this be better placed in the "Registering asynchronous
> > sub-devices" section ? This isn't specific to sensors.
> 
> Ah, yes, I meant sub-devices there. This actually applies to all
> of UAPI, in general, but it's the async sub-device drivers that tend to
> have the problem as people tend to think it's "just" registering the async
> sub-device but in fact the related sub-device may be immediately registered
> as well.

Note there are two sections, one about subdev registration, one about
camera sensor registration. You've added the text to the latter.

> > > +
> > >  Asynchronous sub-device notifiers
> > >  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > >  

-- 
Regards,

Laurent Pinchart
