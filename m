Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FA0019B81F
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 00:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732619AbgDAWH1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Apr 2020 18:07:27 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:36373 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732357AbgDAWH1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Apr 2020 18:07:27 -0400
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id A4677240009;
        Wed,  1 Apr 2020 22:07:19 +0000 (UTC)
Date:   Thu, 2 Apr 2020 00:10:21 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        andrey.konovalov@linaro.org, laurent.pinchart@ideasonboard.com
Subject: Re: [v2 2/3] Documentation: media: Document read-only subdevice
Message-ID: <20200401221021.kbdmurcrs2amsezs@uno.localdomain>
References: <20200327223522.506832-1-jacopo@jmondi.org>
 <20200327223522.506832-3-jacopo@jmondi.org>
 <20200327233358.GD23713@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200327233358.GD23713@kekkonen.localdomain>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,
   one small question

On Sat, Mar 28, 2020 at 01:33:58AM +0200, Sakari Ailus wrote:
> Hi Jacopo,
>
> Thanks for the patchset.
>
> On Fri, Mar 27, 2020 at 11:35:21PM +0100, Jacopo Mondi wrote:
> > Document a new kapi function to register subdev device nodes in read only
> > mode and for each affected ioctl report how access is restricted.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  Documentation/media/kapi/v4l2-subdev.rst      | 44 +++++++++++++++++++
> >  Documentation/media/uapi/v4l/dev-subdev.rst   |  5 +++
> >  .../media/uapi/v4l/vidioc-g-dv-timings.rst    |  6 +++
> >  Documentation/media/uapi/v4l/vidioc-g-std.rst |  6 +++
> >  .../media/uapi/v4l/vidioc-subdev-g-crop.rst   |  9 ++++
> >  .../media/uapi/v4l/vidioc-subdev-g-fmt.rst    |  8 ++++
> >  .../v4l/vidioc-subdev-g-frame-interval.rst    |  8 ++++
> >  .../uapi/v4l/vidioc-subdev-g-selection.rst    |  8 ++++
> >  8 files changed, 94 insertions(+)
> >
> > diff --git a/Documentation/media/kapi/v4l2-subdev.rst b/Documentation/media/kapi/v4l2-subdev.rst
> > index 41ccb3e5c707..6506a673e6a1 100644
> > --- a/Documentation/media/kapi/v4l2-subdev.rst
> > +++ b/Documentation/media/kapi/v4l2-subdev.rst
> > @@ -332,6 +332,50 @@ Private ioctls
> >  	All ioctls not in the above list are passed directly to the sub-device
> >  	driver through the core::ioctl operation.
> >
> > +Read-only sub-device userspace API
> > +----------------------------------
> > +
> > +Bridge drivers that control their connected subdevices through direct calls to
> > +the kernel API realized by :c:type:`v4l2_subdev_ops` structure do not usually
> > +want userspace to be able to change the same parameters through the subdevice
> > +device node and thus do not usually register any.
> > +
> > +It is sometimes useful to report to userspace the current subdevice
> > +configuration through a read-only API, that does not permit applications to
> > +change to the device parameters but allows interfacing to the subdevice device
> > +node to inspect them.
> > +
> > +For instance, to implement cameras based on computational photography, userspace
> > +needs to know the detailed camera sensor configuration (in terms of skipping,
> > +binning, cropping and scaling) for each supported output resolution. To support
> > +such use cases, bridge drivers may expose the subdevice operations to userspace
> > +through a read-only API.
> > +
> > +To create a read-only device node for all the subdevices registered with the
> > +``V4L2_SUBDEV_FL_HAS_DEVNODE`` set, the :c:type:`v4l2_device` driver should call
> > +:c:func:`v4l2_device_register_ro_subdev_nodes`.
> > +
> > +Access to the following ioctls for userspace applications is restricted on
> > +sub-device device nodes registered with
> > +:c:func:`v4l2_device_register_ro_subdev_nodes`.
> > +
> > +``VIDIOC_SUBDEV_S_FMT``,
> > +``VIDIOC_SUBDEV_S_CROP``,
> > +``VIDIOC_SUBDEV_S_SELECTION``:
> > +
> > +	These ioctls are only allowed on a read-only subdevice device node
> > +	for the :ref:`V4L2_SUBDEV_FORMAT_TRY <v4l2-subdev-format-whence>`
> > +	formats and selection rectangles.
> > +
> > +``VIDIOC_SUBDEV_S_FRAME_INTERVAL``,
> > +``VIDIOC_SUBDEV_S_DV_TIMINGS``,
> > +``VIDIOC_SUBDEV_S_STD``:
> > +
> > +	These ioctls are not allowed on a read-only subdevice node.
> > +
> > +In case the ioclt is not allowed, or the format to modify is set to
>
> "IOCTL".

are you referring to the typo ioclt/ioctl or are you suggesting to
spell IOCTL uppercase ? As the rest of the documentation uses
lowercase "ioctl" ...
>
> > +``V4L2_SUBDEV_FORMAT_ACTIVE``, the core returns a negative error code and
> > +the errno variable is set to ``-EPERM``.
> >
> >  I2C sub-device drivers
> >  ----------------------
> > diff --git a/Documentation/media/uapi/v4l/dev-subdev.rst b/Documentation/media/uapi/v4l/dev-subdev.rst
> > index 029bb2d9928a..6082f9c2f8f4 100644
> > --- a/Documentation/media/uapi/v4l/dev-subdev.rst
> > +++ b/Documentation/media/uapi/v4l/dev-subdev.rst
> > @@ -39,6 +39,11 @@ will feature a character device node on which ioctls can be called to
> >  Sub-device character device nodes, conventionally named
> >  ``/dev/v4l-subdev*``, use major number 81.
> >
> > +Drivers may opt to limit the sub-device character devices to only expose
> > +operations that don't modify the device state. In such a case the sub-devices
> > +are referred to as ``read-only`` in the rest of this documentation, and the
> > +related restrictions are documented in individual ioctls.
>
> Perhaps "IOCTLs".

Same here, the rest of the documentation uses lowercase.

Thanks
  j
>
> With these, for the set,
>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>
> > +
> >
> >  Controls
> >  ========
> > diff --git a/Documentation/media/uapi/v4l/vidioc-g-dv-timings.rst b/Documentation/media/uapi/v4l/vidioc-g-dv-timings.rst
> > index e36dd2622857..611f94e4510a 100644
> > --- a/Documentation/media/uapi/v4l/vidioc-g-dv-timings.rst
> > +++ b/Documentation/media/uapi/v4l/vidioc-g-dv-timings.rst
> > @@ -57,6 +57,10 @@ pointer to the struct :c:type:`v4l2_dv_timings`
> >  structure as argument. If the ioctl is not supported or the timing
> >  values are not correct, the driver returns ``EINVAL`` error code.
> >
> > +Calling ``VIDIOC_SUBDEV_S_DV_TIMINGS`` on a subdev device node that has been
> > +registered in read-only mode is not allowed. An error is returned and the errno
> > +variable is set to ``-EPERM``.
> > +
> >  The ``linux/v4l2-dv-timings.h`` header can be used to get the timings of
> >  the formats in the :ref:`cea861` and :ref:`vesadmt` standards. If
> >  the current input or output does not support DV timings (e.g. if
> > @@ -81,6 +85,8 @@ ENODATA
> >  EBUSY
> >      The device is busy and therefore can not change the timings.
> >
> > +EPERM
> > +    ``VIDIOC_SUBDEV_S_DV_TIMINGS`` has been called on a read-only subdevice.
> >
> >  .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
> >
> > diff --git a/Documentation/media/uapi/v4l/vidioc-g-std.rst b/Documentation/media/uapi/v4l/vidioc-g-std.rst
> > index e633e42e3910..e220b38b859f 100644
> > --- a/Documentation/media/uapi/v4l/vidioc-g-std.rst
> > +++ b/Documentation/media/uapi/v4l/vidioc-g-std.rst
> > @@ -66,6 +66,9 @@ video timings (e.g. if :ref:`VIDIOC_ENUMINPUT`
> >  does not set the ``V4L2_IN_CAP_STD`` flag), then ``ENODATA`` error code is
> >  returned.
> >
> > +Calling ``VIDIOC_SUBDEV_S_STD`` on a subdev device node that has been registered
> > +in read-only mode is not allowed. An error is returned and the errno variable is
> > +set to ``-EPERM``.
> >
> >  Return Value
> >  ============
> > @@ -79,3 +82,6 @@ EINVAL
> >
> >  ENODATA
> >      Standard video timings are not supported for this input or output.
> > +
> > +EPERM
> > +    ``VIDIOC_SUBDEV_S_STD`` has been called on a read-only subdevice.
> > diff --git a/Documentation/media/uapi/v4l/vidioc-subdev-g-crop.rst b/Documentation/media/uapi/v4l/vidioc-subdev-g-crop.rst
> > index 632ee053accc..62f5d9870ca7 100644
> > --- a/Documentation/media/uapi/v4l/vidioc-subdev-g-crop.rst
> > +++ b/Documentation/media/uapi/v4l/vidioc-subdev-g-crop.rst
> > @@ -73,6 +73,11 @@ crop rectangles and stored in the sub-device file handle. Two
> >  applications querying the same sub-device would thus not interact with
> >  each other.
> >
> > +If the subdev device node has been registered in read-only mode calls to
> > +``VIDIOC_SUBDEV_S_CROP`` are only valid if the ``which`` field is set to
> > +``V4L2_SUBDEV_FORMAT_TRY``, otherwise an error is returned and the errno
> > +variable is set to ``-EPERM``.
> > +
> >  Drivers must not return an error solely because the requested crop
> >  rectangle doesn't match the device capabilities. They must instead
> >  modify the rectangle to match what the hardware can provide. The
> > @@ -123,3 +128,7 @@ EINVAL
> >      references a non-existing pad, the ``which`` field references a
> >      non-existing format, or cropping is not supported on the given
> >      subdev pad.
> > +
> > +EPERM
> > +    The ``VIDIOC_SUBDEV_S_CROP`` ioctl has been called on a read-only subdevice
> > +    and the ``which`` field is set to ``V4L2_SUBDEV_FORMAT_ACTIVE``.
> > diff --git a/Documentation/media/uapi/v4l/vidioc-subdev-g-fmt.rst b/Documentation/media/uapi/v4l/vidioc-subdev-g-fmt.rst
> > index 472577bd1745..3a2f64bb00e7 100644
> > --- a/Documentation/media/uapi/v4l/vidioc-subdev-g-fmt.rst
> > +++ b/Documentation/media/uapi/v4l/vidioc-subdev-g-fmt.rst
> > @@ -78,6 +78,11 @@ current links configuration or sub-device controls value. For instance,
> >  a low-pass noise filter might crop pixels at the frame boundaries,
> >  modifying its output frame size.
> >
> > +If the subdev device node has been registered in read-only mode calls to
> > +``VIDIOC_SUBDEV_S_FMT`` are only valid if the ``which`` field is set to
> > +``V4L2_SUBDEV_FORMAT_TRY``, otherwise an error is returned and the errno
> > +variable is set to ``-EPERM``.
> > +
> >  Drivers must not return an error solely because the requested format
> >  doesn't match the device capabilities. They must instead modify the
> >  format to match what the hardware can provide. The modified format
> > @@ -146,6 +151,9 @@ EINVAL
> >      ``pad`` references a non-existing pad, or the ``which`` field
> >      references a non-existing format.
> >
> > +EPERM
> > +    The ``VIDIOC_SUBDEV_S_FMT`` ioctl has been called on a read-only subdevice
> > +    and the ``which`` field is set to ``V4L2_SUBDEV_FORMAT_ACTIVE``.
> >
> >  ============
> >
> > diff --git a/Documentation/media/uapi/v4l/vidioc-subdev-g-frame-interval.rst b/Documentation/media/uapi/v4l/vidioc-subdev-g-frame-interval.rst
> > index 4b1b4bc78bfe..34aa39096e3d 100644
> > --- a/Documentation/media/uapi/v4l/vidioc-subdev-g-frame-interval.rst
> > +++ b/Documentation/media/uapi/v4l/vidioc-subdev-g-frame-interval.rst
> > @@ -65,6 +65,10 @@ struct
> >  contains the current frame interval as would be returned by a
> >  ``VIDIOC_SUBDEV_G_FRAME_INTERVAL`` call.
> >
> > +Calling ``VIDIOC_SUBDEV_S_FRAME_INTERVAL`` on a subdev device node that has been
> > +registered in read-only mode is not allowed. An error is returned and the errno
> > +variable is set to ``-EPERM``.
> > +
> >  Drivers must not return an error solely because the requested interval
> >  doesn't match the device capabilities. They must instead modify the
> >  interval to match what the hardware can provide. The modified interval
> > @@ -118,3 +122,7 @@ EINVAL
> >      :c:type:`v4l2_subdev_frame_interval`
> >      ``pad`` references a non-existing pad, or the pad doesn't support
> >      frame intervals.
> > +
> > +EPERM
> > +    The ``VIDIOC_SUBDEV_S_FRAME_INTERVAL`` ioctl has been called on a read-only
> > +    subdevice.
> > diff --git a/Documentation/media/uapi/v4l/vidioc-subdev-g-selection.rst b/Documentation/media/uapi/v4l/vidioc-subdev-g-selection.rst
> > index fc73d27e6d74..abd046cef612 100644
> > --- a/Documentation/media/uapi/v4l/vidioc-subdev-g-selection.rst
> > +++ b/Documentation/media/uapi/v4l/vidioc-subdev-g-selection.rst
> > @@ -53,6 +53,10 @@ function of the crop API, and more, are supported by the selections API.
> >  See :ref:`subdev` for more information on how each selection target
> >  affects the image processing pipeline inside the subdevice.
> >
> > +If the subdev device node has been registered in read-only mode calls to
> > +``VIDIOC_SUBDEV_S_SELECTION`` are only valid if the ``which`` field is set to
> > +``V4L2_SUBDEV_FORMAT_TRY``, otherwise an error is returned and the errno
> > +variable is set to ``-EPERM``.
> >
> >  Types of selection targets
> >  --------------------------
> > @@ -123,3 +127,7 @@ EINVAL
> >      ``pad`` references a non-existing pad, the ``which`` field
> >      references a non-existing format, or the selection target is not
> >      supported on the given subdev pad.
> > +
> > +EPERM
> > +    The ``VIDIOC_SUBDEV_S_SELECTION`` ioctl has been called on a read-only
> > +    subdevice and the ``which`` field is set to ``V4L2_SUBDEV_FORMAT_ACTIVE``.
>
> --
> Regards,
>
> Sakari Ailus
