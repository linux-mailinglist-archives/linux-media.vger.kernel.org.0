Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 268E92C66BC
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 14:23:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730501AbgK0NW1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 08:22:27 -0500
Received: from mga05.intel.com ([192.55.52.43]:32596 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730343AbgK0NW0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 08:22:26 -0500
IronPort-SDR: I5Lfdn2XS9Y07813O+MJ0GnoBNldCZUu9dlYseV7QWQ7O2mLuH/tDVYzexyBJXRPuyBnBuYSez
 Vs0r+QoRwSmw==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257099820"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; 
   d="scan'208";a="257099820"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2020 05:22:25 -0800
IronPort-SDR: IfOO58YvmdW3zeiMB0gXjeDZJl5yHd52qNQB0FjU2MvYmO1/pCkFYENj7nhhr5d+cz359ey6Cw
 3tMgANGxZpJA==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; 
   d="scan'208";a="479679569"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2020 05:22:23 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id D27FD205FC; Fri, 27 Nov 2020 15:22:21 +0200 (EET)
Date:   Fri, 27 Nov 2020 15:22:21 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH 1/4] media: docs: Describe pixel array properties
Message-ID: <20201127132221.GQ3940@paasikivi.fi.intel.com>
References: <20200805105721.15445-1-jacopo@jmondi.org>
 <20200805105721.15445-2-jacopo@jmondi.org>
 <20200809175821.GF5981@pendragon.ideasonboard.com>
 <20200810081757.zeeqiigrlfpxppxs@uno.localdomain>
 <20200818081743.GQ24582@paasikivi.fi.intel.com>
 <20200819010623.GI2360@pendragon.ideasonboard.com>
 <20200819102000.GS24582@paasikivi.fi.intel.com>
 <20200819123840.GG6049@pendragon.ideasonboard.com>
 <20200820151604.GZ24582@paasikivi.fi.intel.com>
 <20201126130943.GJ3905@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126130943.GJ3905@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Nov 26, 2020 at 03:09:43PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Thu, Aug 20, 2020 at 06:16:04PM +0300, Sakari Ailus wrote:
> > On Wed, Aug 19, 2020 at 03:38:40PM +0300, Laurent Pinchart wrote:
> > > On Wed, Aug 19, 2020 at 01:20:00PM +0300, Sakari Ailus wrote:
> > > > On Wed, Aug 19, 2020 at 04:06:23AM +0300, Laurent Pinchart wrote:
> > > > > On Tue, Aug 18, 2020 at 11:17:43AM +0300, Sakari Ailus wrote:
> > > > > > On Mon, Aug 10, 2020 at 10:17:57AM +0200, Jacopo Mondi wrote:
> > > > > > > On Sun, Aug 09, 2020 at 08:58:21PM +0300, Laurent Pinchart wrote:
> > > > > > > > On Wed, Aug 05, 2020 at 12:57:18PM +0200, Jacopo Mondi wrote:
> > > > > > > > > The V4L2 selection API are also used to access the pixel array
> > > > > > > > > properties of an image sensor, such as the size and position of active
> > > > > > > > > pixels and the cropped area of the pixel matrix used to produce images.
> > > > > > > > >
> > > > > > > > > Currently no clear definition of the different areas that compose an
> > > > > > > > > image sensor pixel array matrix is provided in the specification, and
> > > > > > > > > the actual meaning of each selection target when applied to an image
> > > > > > > > > sensor was not provided.
> > > > > > > > >
> > > > > > > > > Provide in the sub-device documentation the definition of the pixel
> > > > > > > > > matrix properties and the selection target associated to each of them.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > > > > > > > ---
> > > > > > > > >  .../userspace-api/media/v4l/dev-subdev.rst    | 81 +++++++++++++++++++
> > > > > > > > >  1 file changed, 81 insertions(+)
> > > > > > > > >
> > > > > > > > > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > > > > > > index 134d2fb909fa4..c47861dff9b9b 100644
> > > > > > > > > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > > > > > > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > > > > > > @@ -386,6 +386,87 @@ requests on all selection targets, unless specifically told otherwise.
> > > > > > > > >  ``V4L2_SEL_FLAG_GE`` and ``V4L2_SEL_FLAG_LE`` flags may be used to round
> > > > > > > > >  the image size either up or down. :ref:`v4l2-selection-flags`
> > > > > > > > >
> > > > > > > > > +.. _v4l2-subdev-pixel-array-properties:
> > > > > > > > > +
> > > > > > > > > +Selection targets for image sensors properties
> > > > > > > > > +----------------------------------------------
> > > > > > > > > +
> > > > > > > > > +The V4L2 selection API can be used on sub-devices that represent an image
> > > > > > > > > +sensor to retrieve the sensor's pixel array matrix properties by using the
> > > > > > > > > +:ref:`selection <VIDIOC_SUBDEV_G_SELECTION>` ioctls.
> > > > > > > > > +
> > > > > > > > > +Sub-device drivers for image sensor usually register a single source pad, but in
> > > > > > > > > +the case they expose more, the pixel array properties can be accessed from
> > > > > > > > > +any of them.
> > > > > > > > > +
> > > > > > > > > +The ``V4L2_SEL_TGT_NATIVE``, ``V4L2_SEL_TGT_CROP_BOUNDS``,
> > > > > > > > > +``V4L2_SEL_TGT_CROP_DEFAULT`` and ``V4L2_TGT_CROP`` targets are used to retrieve
> > > > > > > > > +the immutable properties of the several different areas that compose the sensor
> > > > > > > > > +pixel array matrix. Each area describes a rectangle of logically adjacent pixel
> > > > > > > > > +units. The logical disposition of pixels is defined by the sensor read-out
> > > > > > > > > +starting point and direction, and may differ from the physical disposition of
> > > > > > > > > +the pixel units in the pixel array matrix.
> > > > > > > > > +
> > > > > > > > > +Each pixel matrix portion is contained in a larger rectangle, with the most
> > > > > > > > > +largest being the one that describes the pixel matrix physical size. This
> > > > > > > > > +defines a hierarchical positional system, where each rectangle is defined
> > > > > > > > > +relatively to the largest available one among the ones exposed by the
> > > > > > > > > +sub-device driver. Each selection target and the associated pixel array portion
> > > > > > > > > +it represents are below presented in order from the largest to the smallest one.
> > > > > > > > > +
> > > > > > > > > +Pixel array physical size
> > > > > > > > > +^^^^^^^^^^^^^^^^^^^^^^^^^
> > > > > > > > > +
> > > > > > > > > +The image sensor chip is composed by a number of physical pixels, not all of
> > > > > > > > > +them readable by the application processor. Invalid or unreadable lines might
> > > > > > > > > +not be transmitted on the data bus at all, or in case on CSI-2 capable sensors
> > > > > > > > > +they might be tagged with an invalid data type (DT) so that the receiver
> > > > > > > > > +automatically discard them. The size of the whole pixel matrix area is
> > > > > > > > > +retrieved using the V4L2_SEL_TGT_NATIVE target, which has its top-left corner
> > > > > > > > > +defined as position (0, 0). All the other selection targets are defined
> > > > > > > > > +relatively to this, larger, rectangle. The rectangle returned by
> > > > > > > > > +V4L2_SEL_TGT_NATIVE describes an immutable property of the image sensor, it
> > > > > > > > > +does not change at run-time and cannot be modified from userspace.
> > > > > > > >
> > > > > > > > As I think I've mentioned previously (not sure if it was by e-mail or on
> > > > > > > > IRC), we could also decide to set V4L2_SEL_TGT_NATIVE_SIZE ==
> > > > > > > > V4L2_SEL_TGT_CROP_BOUNDS by ignoring the non-readable pixels completely.
> > > > > > > > What's the advantage of exposing them in the API, when the sensors
> > > > > > > > doesn't provide them to the rest of the pipeline ?
> > > > > > > 
> > > > > > > I don't know :) I'm also  bit confused on what's the purpose of
> > > > > > > NATIVE, this commit seems to suggest it was meant to replace
> > > > > > > CROP_BOUNDS, but I'm not sure about that.
> > > > > > > 
> > > > > > > commit b518d86609cc066b626120fe6ec6fe3a4ccfcd54
> > > > > > > Author: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > > > Date:   Thu Nov 6 16:54:33 2014 -0300
> > > > > > > 
> > > > > > >     [media] smiapp: Support V4L2_SEL_TGT_NATIVE_SIZE
> > > > > > > 
> > > > > > >     Add support for selection target V4L2_SEL_TGT_NATIVE_SIZE. It is equivalent
> > > > > > >     of what V4L2_SEL_TGT_CROP_BOUNDS used to be. Support for
> > > > > > >     V4L2_SEL_TGT_CROP_BOUNDS is still supported by the driver as a compatibility
> > > > > > >     interface.
> > > > > > > 
> > > > > > > Sakari, do you recall if that's was the original plan ?
> > > > > > 
> > > > > > That was to denote the size of the pixel array indeed. We didn't discuss
> > > > > > dark or invalid pixels at the time.
> > > > > > 
> > > > > > So this was just there to tell that it's the pixel array you're cropping
> > > > > > from.
> > > > > > 
> > > > > > But as long as it's API-wise compatible, I don't think anything prevents
> > > > > > re-purposing this to include other areas. The documentation (AFAIR) does
> > > > > > not say this has to be the same as the crop bounds rectangle.
> > > > > 
> > > > > What do you think would be best ? Should we include the non-readable
> > > > > pixels in V4L2_SEL_TGT_NATIVE_SIZE, with V4L2_SEL_TGT_CROP_BOUNDS then
> > > > > being strictly smaller, or drop them completely from the API, with
> > > > > V4L2_SEL_TGT_CROP_BOUNDS being equal to V4L2_SEL_TGT_NATIVE_SIZE ? It
> > > > > may be that we have to allow both to support existing drivers, but we
> > > > > should pick one of the two options and make it mandatory for new
> > > > > drivers.
> > > > 
> > > > That's a very good question.
> > > > 
> > > > What would be the purpose of adding pixels that cannot be read? I assume
> > > > they would not affect sensor timing either in that case, so there would be
> > > > no difference whether they are there or not.
> > > 
> > > Timings is a good point, could there be sensors that read those pixels
> > > but don't send them out ? Maybe to avoid edge effects ? That would be
> > > accounted for in the H/V blank though, wouldn't it ?
> > 
> > I guess we could ignore it, as it takes place during what is indeed
> > considered as blanking.
> 
> Makes sense.
> 
> > > > The crop bounds should contain
> > > > everything whereas for the default crop should reflect the area of the
> > > > visible pixels.
> > > 
> > > I believe there are sensors that have all pixels visible, but recommend
> > > not using edge pixels as they are affected by edge effects, even if
> > > those pixels can be read out and transferred. In that case
> > > V4L2_SEL_TGT_CROP_BOUNDS should include the edge pixels, but maybe
> > > V4L2_SEL_TGT_CROP_DEFAULT shouldn't ?
> > 
> > I guess so. But in practice I wonder if there are such implementations.
> 
> I think it's actually quite common, sensors often have visible pixels on
> the edges that are not counted in the nominal sensor resolution, but are
> still commonly read out and consumed by the demosaicing operation.
> Ideally we should report both the nominal active array (the pixels
> guaranteed by the manufacturer to be good), and the potentially larger
> exposed pixels array that include margins of potentially lower quality.

Yes, I think so, too.

But I do also think we'll need a new target for the purpose; this is really
about telling the pixels inside the area are of good quality, and it's
unrelated to cropping.

I wonder what to call it though. V4L2_SEL_TGT_PIXEL_PRETTY? :-)

> 
> > > > I guess in theory the visible pixels could not be cropped by the sensor in
> > > > analogue cropping step, so it might be worth having a separate rectangle
> > > > for those, too.
> > > 
> > > I'm not sure to follow you here.
> > 
> > I'm saying the sensor hardware could in theory be unable to read only the
> > visible pixels.
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Sakari Ailus
