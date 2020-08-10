Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC34240337
	for <lists+linux-media@lfdr.de>; Mon, 10 Aug 2020 10:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbgHJIJK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Aug 2020 04:09:10 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:60987 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726021AbgHJIJK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Aug 2020 04:09:10 -0400
X-Originating-IP: 82.52.18.94
Received: from uno.localdomain (host-82-52-18-94.retail.telecomitalia.it [82.52.18.94])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id A3634FF80A;
        Mon, 10 Aug 2020 08:09:04 +0000 (UTC)
Date:   Mon, 10 Aug 2020 10:12:45 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH 1/4] media: docs: Describe pixel array properties
Message-ID: <20200810081245.s5av6vg2nvduo3qa@uno.localdomain>
References: <20200805105721.15445-1-jacopo@jmondi.org>
 <20200805105721.15445-2-jacopo@jmondi.org>
 <20200805222447.GP13316@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200805222447.GP13316@paasikivi.fi.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,
    thanks for feedback.

On Thu, Aug 06, 2020 at 01:24:47AM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> Thanks for the patchset.
>
> This improves selection documentation quite a bit. Please see my comments
> below.
>

Thanks. Laurent just mentioned your effort on documenting sensor
driver drivers, I would be happy to somehow merge the two efforts.

> On Wed, Aug 05, 2020 at 12:57:18PM +0200, Jacopo Mondi wrote:
> > The V4L2 selection API are also used to access the pixel array
> > properties of an image sensor, such as the size and position of active
> > pixels and the cropped area of the pixel matrix used to produce images.
> >
> > Currently no clear definition of the different areas that compose an
> > image sensor pixel array matrix is provided in the specification, and
> > the actual meaning of each selection target when applied to an image
> > sensor was not provided.
> >
> > Provide in the sub-device documentation the definition of the pixel
> > matrix properties and the selection target associated to each of them.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  .../userspace-api/media/v4l/dev-subdev.rst    | 81 +++++++++++++++++++
> >  1 file changed, 81 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > index 134d2fb909fa4..c47861dff9b9b 100644
> > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > @@ -386,6 +386,87 @@ requests on all selection targets, unless specifically told otherwise.
> >  ``V4L2_SEL_FLAG_GE`` and ``V4L2_SEL_FLAG_LE`` flags may be used to round
> >  the image size either up or down. :ref:`v4l2-selection-flags`
> >
> > +.. _v4l2-subdev-pixel-array-properties:
> > +
> > +Selection targets for image sensors properties
> > +----------------------------------------------
> > +
> > +The V4L2 selection API can be used on sub-devices that represent an image
> > +sensor to retrieve the sensor's pixel array matrix properties by using the
> > +:ref:`selection <VIDIOC_SUBDEV_G_SELECTION>` ioctls.
> > +
> > +Sub-device drivers for image sensor usually register a single source pad, but in
> > +the case they expose more, the pixel array properties can be accessed from
> > +any of them.
>
> Is this a hypothetical case or are there examples?
>
> Also note that camera sensor drivers may expose more than one sub-devices,
> only one of which represents the pixel array.
>

Yes, I just tried to mention that as a possible use case, but I admit
I might be a bit confused about that. I would, as suggested by
Laurent, drop this part and add it back when we'll have a case at
hands.

> > +
> > +The ``V4L2_SEL_TGT_NATIVE``, ``V4L2_SEL_TGT_CROP_BOUNDS``,
> > +``V4L2_SEL_TGT_CROP_DEFAULT`` and ``V4L2_TGT_CROP`` targets are used to retrieve
> > +the immutable properties of the several different areas that compose the sensor
> > +pixel array matrix. Each area describes a rectangle of logically adjacent pixel
> > +units. The logical disposition of pixels is defined by the sensor read-out
> > +starting point and direction, and may differ from the physical disposition of
> > +the pixel units in the pixel array matrix.
> > +
> > +Each pixel matrix portion is contained in a larger rectangle, with the most
>
> s/larger\K/ or equal/
>
> s/most//
>
> > +largest being the one that describes the pixel matrix physical size. This
> > +defines a hierarchical positional system, where each rectangle is defined
>
> s/,//
>

Ack on both sections.

> > +relatively to the largest available one among the ones exposed by the
> > +sub-device driver. Each selection target and the associated pixel array portion
> > +it represents are below presented in order from the largest to the smallest one.
> > +
> > +Pixel array physical size
> > +^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +The image sensor chip is composed by a number of physical pixels, not all of
> > +them readable by the application processor. Invalid or unreadable lines might
> > +not be transmitted on the data bus at all, or in case on CSI-2 capable sensors
> > +they might be tagged with an invalid data type (DT) so that the receiver
> > +automatically discard them. The size of the whole pixel matrix area is
> > +retrieved using the V4L2_SEL_TGT_NATIVE target, which has its top-left corner
> > +defined as position (0, 0). All the other selection targets are defined
> > +relatively to this, larger, rectangle. The rectangle returned by
> > +V4L2_SEL_TGT_NATIVE describes an immutable property of the image sensor, it
> > +does not change at run-time and cannot be modified from userspace.
> > +
> > +Pixel array readable area
> > +^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +The V4L2_SEL_TGT_CROP_BOUNDS targets returns size and position of the readable
> > +area of the pixel array matrix, including pixels with valid image data and pixel
> > +used for calibration purposes, such as optical black pixels. It is not unlikely
> > +that valid pixels and optical black pixels are surrounded by non-readable rows
> > +and columns of pixels. Those does not concur in the definition of the
>
> How about: "Only pixels that can be read out are included in the
> V4L2_SEL_TGT_CROP_BOUNDS rectangle."?
>

I'll more extensively reply on this to laurent's comment on the "Pixel
array physical size" section, as it also address this comment you have
here. There's a SMIA++ question for you there :)

> > +V4L2_SEL_TGT_CROP_BOUNDS rectangle. The rectangle returned by
> > +V4L2_SEL_TGT_CROP_BOUNDS describes an immutable property of the image sensor, it
> > +does not change at run-time and cannot be modified from userspace.
> > +
> > +Pixel array active area
> > +^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +The portion of the pixel array which contains valid image data is defined as the
> > +active area of the pixel matrix. The active pixel array is is accessed by mean
>
> s/accessed/described/
>
> Another word than "active" here would be great as we already have active
> and try contexts for selections.
>

I feel like we would need to define a stricter gloassary as well.
To replace active I would usually say "Valid for image capture",
"pixel that contain valid image data". But they're both longer

> > +of the V4L2_SEL_TGT_CROP_DEFAULT target, and is contained in the larger
>
> s/the larger//
>
> > +V4L2_SEL_TGT_CROP_BOUNDS rectangle. It represents the largest possible frame
> > +resolution the sensor can produce and defines the dimension of the full
>
> s/resolution/size/
>
> > +field-of-view. The rectangle returned by V4L2_SEL_TGT_CROP_BOUNDS describes an
>
> s/-/ /g
>
> > +immutable property of the image sensor, it does not change at run-time and
> > +cannot be modified from userspace.
> > +
> > +Analog crop rectangle
> > +^^^^^^^^^^^^^^^^^^^^^
> > +
> > +The sensor driver might decide, in order to adjust the image resolution to best
> > +match the one requested by applications, to only process a part of the active
>
> s/, to\K/ instruct the hardware to/
>
> > +pixel array matrix. The selected area is read-out and processed by the image
> > +sensor on-board ISP in order to produce images of the desired size and
> > +resolution while possible maintaing the largest possible field-of-view. The
>
> s/size\K[^.]?*\./m
>
> > +cropped portion of the pixel array which is used to produce images is returned
>
> s/produce/read out/
> s/returned/configured/
>
> > +by the V4L2_SEL_TGT_CROP target and represent the only information that can
>
> s/by/using/
>
> I'd leave out the rest of the sentence after "target" above.

I added this as I initially listed CROP in the immutable targets, and
I was trying to specify it's actually not here. I'll remove the first
ambiguity then I could drop this patch.

>
> > +change at runtime as it depends on the currently configured sensor mode and
> > +desired image resolution. If the sub-device driver supports that, userspace
> > +can set the analog crop rectangle to select which portion of the pixel array
> > +to read out.
>
> How about instead:
>
> Register list based drivers generally do not allow setting analogue crop
> rectangles.
>

I could do that. I'm always a bit uncertain on mentioning 'register
list drivers', 'mode-based drivers' etc as we don't have a real
definition of them in the documentation..

Thanks
  j


> > +
> >
> >  Types of selection targets
> >  --------------------------
>
> --
> Kind regards,
>
> Sakari Ailus
