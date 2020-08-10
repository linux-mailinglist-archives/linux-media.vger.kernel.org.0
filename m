Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03EC6240341
	for <lists+linux-media@lfdr.de>; Mon, 10 Aug 2020 10:14:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbgHJIOU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Aug 2020 04:14:20 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:34663 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725846AbgHJIOT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Aug 2020 04:14:19 -0400
Received: from uno.localdomain (host-82-52-18-94.retail.telecomitalia.it [82.52.18.94])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id A743D240003;
        Mon, 10 Aug 2020 08:14:15 +0000 (UTC)
Date:   Mon, 10 Aug 2020 10:17:57 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH 1/4] media: docs: Describe pixel array properties
Message-ID: <20200810081757.zeeqiigrlfpxppxs@uno.localdomain>
References: <20200805105721.15445-1-jacopo@jmondi.org>
 <20200805105721.15445-2-jacopo@jmondi.org>
 <20200809175821.GF5981@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200809175821.GF5981@pendragon.ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Aug 09, 2020 at 08:58:21PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
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
> > +largest being the one that describes the pixel matrix physical size. This
> > +defines a hierarchical positional system, where each rectangle is defined
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
>
> As I think I've mentioned previously (not sure if it was by e-mail or on
> IRC), we could also decide to set V4L2_SEL_TGT_NATIVE_SIZE ==
> V4L2_SEL_TGT_CROP_BOUNDS by ignoring the non-readable pixels completely.
> What's the advantage of exposing them in the API, when the sensors
> doesn't provide them to the rest of the pipeline ?
>

I don't know :) I'm also  bit confused on what's the purpose of
NATIVE, this commit seems to suggest it was meant to replace
CROP_BOUNDS, but I'm not sure about that.

commit b518d86609cc066b626120fe6ec6fe3a4ccfcd54
Author: Sakari Ailus <sakari.ailus@linux.intel.com>
Date:   Thu Nov 6 16:54:33 2014 -0300

    [media] smiapp: Support V4L2_SEL_TGT_NATIVE_SIZE

    Add support for selection target V4L2_SEL_TGT_NATIVE_SIZE. It is equivalent
    of what V4L2_SEL_TGT_CROP_BOUNDS used to be. Support for
    V4L2_SEL_TGT_CROP_BOUNDS is still supported by the driver as a compatibility
    interface.

Sakari, do you recall if that's was the original plan ?

Thanks
  j

> > +Pixel array readable area
> > +^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +The V4L2_SEL_TGT_CROP_BOUNDS targets returns size and position of the readable
> > +area of the pixel array matrix, including pixels with valid image data and pixel
> > +used for calibration purposes, such as optical black pixels. It is not unlikely
> > +that valid pixels and optical black pixels are surrounded by non-readable rows
> > +and columns of pixels. Those does not concur in the definition of the
> > +V4L2_SEL_TGT_CROP_BOUNDS rectangle. The rectangle returned by
> > +V4L2_SEL_TGT_CROP_BOUNDS describes an immutable property of the image sensor, it
> > +does not change at run-time and cannot be modified from userspace.
> > +
> > +Pixel array active area
> > +^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +The portion of the pixel array which contains valid image data is defined as the
> > +active area of the pixel matrix. The active pixel array is is accessed by mean
> > +of the V4L2_SEL_TGT_CROP_DEFAULT target, and is contained in the larger
> > +V4L2_SEL_TGT_CROP_BOUNDS rectangle. It represents the largest possible frame
> > +resolution the sensor can produce and defines the dimension of the full
> > +field-of-view. The rectangle returned by V4L2_SEL_TGT_CROP_BOUNDS describes an
> > +immutable property of the image sensor, it does not change at run-time and
> > +cannot be modified from userspace.
> > +
> > +Analog crop rectangle
> > +^^^^^^^^^^^^^^^^^^^^^
> > +
> > +The sensor driver might decide, in order to adjust the image resolution to best
> > +match the one requested by applications, to only process a part of the active
> > +pixel array matrix. The selected area is read-out and processed by the image
> > +sensor on-board ISP in order to produce images of the desired size and
> > +resolution while possible maintaing the largest possible field-of-view. The
> > +cropped portion of the pixel array which is used to produce images is returned
> > +by the V4L2_SEL_TGT_CROP target and represent the only information that can
> > +change at runtime as it depends on the currently configured sensor mode and
> > +desired image resolution. If the sub-device driver supports that, userspace
> > +can set the analog crop rectangle to select which portion of the pixel array
> > +to read out.
> > +
> >
> >  Types of selection targets
> >  --------------------------
>
> --
> Regards,
>
> Laurent Pinchart
