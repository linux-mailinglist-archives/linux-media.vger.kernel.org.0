Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4B8D1932DE
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 22:37:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727358AbgCYVh1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 17:37:27 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48520 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbgCYVh1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 17:37:27 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 052DE80C;
        Wed, 25 Mar 2020 22:37:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1585172245;
        bh=2fA+O1koVmC0GpXkLoJSXTWtFLj9PBG5bitY5ZeGbZw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g/RaQNigFP7a8HAUGbGa85BB9YRxQITHuaEg7/l9cNJHha2AIjOL1/vQCHu3QlUaj
         JSbzEJ7nSwrZNZDd5M5OtyA4cXWUTn7MUmrtLUV7B9KgQ4bGG1Axx22noxAV4U7jmn
         sNdWnxo0+/5otKmiralnfEQPz5Bg6LLldI12Ablc=
Date:   Wed, 25 Mar 2020 23:37:20 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
        sakari.ailus@linux.intel.com
Subject: Re: [libcamera-devel] [PATCH 1/4] Documentation: media: Document
 read-only subdevice
Message-ID: <20200325213720.GU19171@pendragon.ideasonboard.com>
References: <20200324202844.1518292-1-jacopo@jmondi.org>
 <20200324202844.1518292-2-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200324202844.1518292-2-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Mar 24, 2020 at 09:28:41PM +0100, Jacopo Mondi wrote:
> Document a new kapi function to register subdev device nodes in read only
> mode and for each affected ioctl report how access is restricted.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  Documentation/media/kapi/v4l2-subdev.rst      | 38 +++++++++++++++++++
>  .../media/uapi/v4l/vidioc-g-dv-timings.rst    |  6 +++
>  Documentation/media/uapi/v4l/vidioc-g-std.rst |  6 +++
>  .../media/uapi/v4l/vidioc-subdev-g-crop.rst   |  9 +++++
>  .../media/uapi/v4l/vidioc-subdev-g-fmt.rst    |  8 ++++
>  .../v4l/vidioc-subdev-g-frame-interval.rst    |  8 ++++
>  .../uapi/v4l/vidioc-subdev-g-selection.rst    |  8 ++++
>  7 files changed, 83 insertions(+)
> 
> diff --git a/Documentation/media/kapi/v4l2-subdev.rst b/Documentation/media/kapi/v4l2-subdev.rst
> index 29e07e23f888..26edb4178eea 100644
> --- a/Documentation/media/kapi/v4l2-subdev.rst
> +++ b/Documentation/media/kapi/v4l2-subdev.rst
> @@ -327,6 +327,44 @@ Private ioctls
>  	All ioctls not in the above list are passed directly to the sub-device
>  	driver through the core::ioctl operation.
>  
> +Read-only sub-device userspace API
> +----------------------------------
> +
> +Bridge drivers that control their connected subdevices through direct calls to
> +the kernel API realized by :c:type:`v4l2_subdev_ops` structure do not usually
> +want userspace to be able to change the same parameters through the subdevice
> +device node and thus do not usually register any.

I think part of this belongs to the previous section.

diff --git a/Documentation/media/kapi/v4l2-subdev.rst b/Documentation/media/kapi/v4l2-subdev.rst
index 29e07e23f888..41ccb3e5c707 100644
--- a/Documentation/media/kapi/v4l2-subdev.rst
+++ b/Documentation/media/kapi/v4l2-subdev.rst
@@ -275,8 +275,13 @@ system the .unbind() method is called. All three callbacks are optional.
 V4L2 sub-device userspace API
 -----------------------------
 
-Beside exposing a kernel API through the :c:type:`v4l2_subdev_ops` structure,
-V4L2 sub-devices can also be controlled directly by userspace applications.
+Bridge drivers traditionally expose one or multiple video nodes to userspace,
+and control subdevices through the :c:type:`v4l2_subdev_ops` operations in
+response to video node operations. This hides the complexity of the underlying
+hardware from applications. For complex devices, finer-grained control of the
+device than what the video nodes offer may be required. In those cases, bridge
+drivers that implement :ref:`the media controller API <media_controller>` may
+opt for making the subdevice operations directly accessible from userpace.
 
 Device nodes named ``v4l-subdev``\ *X* can be created in ``/dev`` to access
 sub-devices directly. If a sub-device supports direct userspace configuration

> +
> +Although, it is sometime useful to report to userspace the current subdevice

s/Although/However/
s/sometime/sometimes/

> +configuration through a read-only API, that do not allow any change to the
> +device parameters but allows userspace applications to interface to the
> +subdevice device node and inspect them. To register a read-only device node for
> +all the registered sub-devices marked with ``V4L2_SUBDEV_FL_HAS_DEVNODE``
> +the :c:type:`v4l2_device` driver should call
> +:c:func:`v4l2_device_register_ro_subdev_nodes`.

This would become

It is sometimes useful to report detailed information about subdevice
configuration to userspace without exposing full direct control of the
subdevice. For instance, to implement cameras based on computational
photography, userspace needs to know the detailed camera sensor configuration
(in terms of skipping, binning, cropping and scaling) for each supported
output resolution. To support such use cases, bridge drivers may opt for
exposing subdevice operations to userspace in a read-only fashion.

The subdevice read-only userspace API requires the subdevices to set the
``V4L2_SUBDEV_FL_HAS_DEVNODE`` before being registered, exactly as for the
previously described subdevice userspace API. The :c:type:`v4l2_device`
driver shall then call :c:func:`v4l2_device_register_ro_subdev_nodes` to
create the subdevice device nodes.

> +Access to the following ioctls for userspace applications is restricted on
> +sub-device device nodes registered with
> +:c:func:`v4l2_device_register_ro_subdev_nodes`.
> +
> +``VIDIOC_SUBDEV_S_FMT``
> +``VIDIOC_SUBDEV_S_FRAME_INTERVAL``
> +``VIDIOC_SUBDEV_S_SELECTION``
> +``VIDIOC_SUBDEV_S_DV_TIMINGS``
> +``VIDIOC_SUBDEV_S_CROP``
> +``VIDIOC_SUBDEV_S_STD``
> +
> +``VIDIOC_SUBDEV_S_FMT``, ``VIDIOC_SUBDEV_S_SELECTION`` and
> +``VIDIOC_SUBDEV_S_CROP`` are only allowed on a read-only subdevice device node
> +only if the format to modify is set to ``V4L2_SUBDEV_FORMAT_TRY`` (
> +:ref:`v4l2_subdev_format_whence <v4l2-subdev-format-whence>`).
> +
> +``VIDIOC_SUBDEV_S_FRAME_INTERVAL``, ``VIDIOC_S_DV_TIMINGS`` and
> +``VIDIOC_SUBDEV_S_STD`` are always disallowed on a read-only subdevice node.
> +
> +In case the ioclt is not allowed at all or the format to modify is set to
> +``V4L2_SUBDEV_FORMAT_ACTIVE``, the core returns a negative error code and
> +sets the errno variable to ``-EPERM``.

I would split the list in two.

``VIDIOC_SUBDEV_S_FMT``,
``VIDIOC_SUBDEV_S_CROP``,
``VIDIOC_SUBDEV_S_SELECTION``:

	These ioctls are only allowed for the
	:ref:`V4L2_SUBDEV_FORMAT_TRY <v4l2-subdev-format-whence>` formats and
	selection rectangles. Any attempt to access the
	:ref:`V4L2_SUBDEV_FORMAT_ACTIVE <v4l2-subdev-format-whence>`
	configuration results in a ``-EPERM`` error.

``VIDIOC_SUBDEV_S_FRAME_INTERVAL``,
``VIDIOC_SUBDEV_S_DV_TIMINGS``,
``VIDIOC_SUBDEV_S_STD``:

	These ioctls are not allowed and result in a ``-EPERM`` error.

>  
>  I2C sub-device drivers
>  ----------------------
> diff --git a/Documentation/media/uapi/v4l/vidioc-g-dv-timings.rst b/Documentation/media/uapi/v4l/vidioc-g-dv-timings.rst
> index 5712bd48e687..435d955aaf85 100644
> --- a/Documentation/media/uapi/v4l/vidioc-g-dv-timings.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-g-dv-timings.rst
> @@ -57,6 +57,10 @@ pointer to the struct :c:type:`v4l2_dv_timings`
>  structure as argument. If the ioctl is not supported or the timing
>  values are not correct, the driver returns ``EINVAL`` error code.
>  
> +Calling ``VIDIOC_SUBDEV_S_DV_TIMINGS`` on a subdev device node that has been
> +registered in read-only mode is not allowed. An error is returned and the errno
> +variable is set to ``-EPERM``.
> +
>  The ``linux/v4l2-dv-timings.h`` header can be used to get the timings of
>  the formats in the :ref:`cea861` and :ref:`vesadmt` standards. If
>  the current input or output does not support DV timings (e.g. if
> @@ -81,6 +85,8 @@ ENODATA
>  EBUSY
>      The device is busy and therefore can not change the timings.
>  
> +EPERM
> +    ``VIDIOC_SUBDEV_S_DV_TIMINGS`` has been called on a read-only subdevice.
>  
>  .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
>  
> diff --git a/Documentation/media/uapi/v4l/vidioc-g-std.rst b/Documentation/media/uapi/v4l/vidioc-g-std.rst
> index e633e42e3910..e220b38b859f 100644
> --- a/Documentation/media/uapi/v4l/vidioc-g-std.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-g-std.rst
> @@ -66,6 +66,9 @@ video timings (e.g. if :ref:`VIDIOC_ENUMINPUT`
>  does not set the ``V4L2_IN_CAP_STD`` flag), then ``ENODATA`` error code is
>  returned.
>  
> +Calling ``VIDIOC_SUBDEV_S_STD`` on a subdev device node that has been registered
> +in read-only mode is not allowed. An error is returned and the errno variable is
> +set to ``-EPERM``.
>  
>  Return Value
>  ============
> @@ -79,3 +82,6 @@ EINVAL
>  
>  ENODATA
>      Standard video timings are not supported for this input or output.
> +
> +EPERM
> +    ``VIDIOC_SUBDEV_S_STD`` has been called on a read-only subdevice.
> diff --git a/Documentation/media/uapi/v4l/vidioc-subdev-g-crop.rst b/Documentation/media/uapi/v4l/vidioc-subdev-g-crop.rst
> index 632ee053accc..62f5d9870ca7 100644
> --- a/Documentation/media/uapi/v4l/vidioc-subdev-g-crop.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-subdev-g-crop.rst
> @@ -73,6 +73,11 @@ crop rectangles and stored in the sub-device file handle. Two
>  applications querying the same sub-device would thus not interact with
>  each other.
>  
> +If the subdev device node has been registered in read-only mode calls to
> +``VIDIOC_SUBDEV_S_CROP`` are only valid if the ``which`` field is set to
> +``V4L2_SUBDEV_FORMAT_TRY``, otherwise an error is returned and the errno
> +variable is set to ``-EPERM``.
> +
>  Drivers must not return an error solely because the requested crop
>  rectangle doesn't match the device capabilities. They must instead
>  modify the rectangle to match what the hardware can provide. The
> @@ -123,3 +128,7 @@ EINVAL
>      references a non-existing pad, the ``which`` field references a
>      non-existing format, or cropping is not supported on the given
>      subdev pad.
> +
> +EPERM
> +    The ``VIDIOC_SUBDEV_S_CROP`` ioctl has been called on a read-only subdevice
> +    and the ``which`` field is set to ``V4L2_SUBDEV_FORMAT_ACTIVE``.
> diff --git a/Documentation/media/uapi/v4l/vidioc-subdev-g-fmt.rst b/Documentation/media/uapi/v4l/vidioc-subdev-g-fmt.rst
> index 472577bd1745..3a2f64bb00e7 100644
> --- a/Documentation/media/uapi/v4l/vidioc-subdev-g-fmt.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-subdev-g-fmt.rst
> @@ -78,6 +78,11 @@ current links configuration or sub-device controls value. For instance,
>  a low-pass noise filter might crop pixels at the frame boundaries,
>  modifying its output frame size.
>  
> +If the subdev device node has been registered in read-only mode calls to
> +``VIDIOC_SUBDEV_S_FMT`` are only valid if the ``which`` field is set to
> +``V4L2_SUBDEV_FORMAT_TRY``, otherwise an error is returned and the errno
> +variable is set to ``-EPERM``.
> +
>  Drivers must not return an error solely because the requested format
>  doesn't match the device capabilities. They must instead modify the
>  format to match what the hardware can provide. The modified format
> @@ -146,6 +151,9 @@ EINVAL
>      ``pad`` references a non-existing pad, or the ``which`` field
>      references a non-existing format.
>  
> +EPERM
> +    The ``VIDIOC_SUBDEV_S_FMT`` ioctl has been called on a read-only subdevice
> +    and the ``which`` field is set to ``V4L2_SUBDEV_FORMAT_ACTIVE``.
>  
>  ============
>  
> diff --git a/Documentation/media/uapi/v4l/vidioc-subdev-g-frame-interval.rst b/Documentation/media/uapi/v4l/vidioc-subdev-g-frame-interval.rst
> index 4b1b4bc78bfe..34aa39096e3d 100644
> --- a/Documentation/media/uapi/v4l/vidioc-subdev-g-frame-interval.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-subdev-g-frame-interval.rst
> @@ -65,6 +65,10 @@ struct
>  contains the current frame interval as would be returned by a
>  ``VIDIOC_SUBDEV_G_FRAME_INTERVAL`` call.
>  
> +Calling ``VIDIOC_SUBDEV_S_FRAME_INTERVAL`` on a subdev device node that has been
> +registered in read-only mode is not allowed. An error is returned and the errno
> +variable is set to ``-EPERM``.
> +
>  Drivers must not return an error solely because the requested interval
>  doesn't match the device capabilities. They must instead modify the
>  interval to match what the hardware can provide. The modified interval
> @@ -118,3 +122,7 @@ EINVAL
>      :c:type:`v4l2_subdev_frame_interval`
>      ``pad`` references a non-existing pad, or the pad doesn't support
>      frame intervals.
> +
> +EPERM
> +    The ``VIDIOC_SUBDEV_S_FRAME_INTERVAL`` ioctl has been called on a read-only
> +    subdevice.
> diff --git a/Documentation/media/uapi/v4l/vidioc-subdev-g-selection.rst b/Documentation/media/uapi/v4l/vidioc-subdev-g-selection.rst
> index fc73d27e6d74..abd046cef612 100644
> --- a/Documentation/media/uapi/v4l/vidioc-subdev-g-selection.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-subdev-g-selection.rst
> @@ -53,6 +53,10 @@ function of the crop API, and more, are supported by the selections API.
>  See :ref:`subdev` for more information on how each selection target
>  affects the image processing pipeline inside the subdevice.
>  
> +If the subdev device node has been registered in read-only mode calls to
> +``VIDIOC_SUBDEV_S_SELECTION`` are only valid if the ``which`` field is set to
> +``V4L2_SUBDEV_FORMAT_TRY``, otherwise an error is returned and the errno
> +variable is set to ``-EPERM``.
>  
>  Types of selection targets
>  --------------------------
> @@ -123,3 +127,7 @@ EINVAL
>      ``pad`` references a non-existing pad, the ``which`` field
>      references a non-existing format, or the selection target is not
>      supported on the given subdev pad.
> +
> +EPERM
> +    The ``VIDIOC_SUBDEV_S_SELECTION`` ioctl has been called on a read-only
> +    subdevice and the ``which`` field is set to ``V4L2_SUBDEV_FORMAT_ACTIVE``.

This looks good, but you also need to explain the read-only subdev API
in dev-subdev.rst.

diff --git a/Documentation/media/uapi/v4l/dev-subdev.rst b/Documentation/media/uapi/v4l/dev-subdev.rst
index 029bb2d9928a..6082f9c2f8f4 100644
--- a/Documentation/media/uapi/v4l/dev-subdev.rst
+++ b/Documentation/media/uapi/v4l/dev-subdev.rst
@@ -39,6 +39,11 @@ will feature a character device node on which ioctls can be called to
 Sub-device character device nodes, conventionally named
 ``/dev/v4l-subdev*``, use major number 81.
 
+Drivers may opt to limit the sub-device character devices to only expose
+operations that don't modify the device state. In such a case the sub-devices
+are referred to as ``read-only`` in the rest of this documentation, and the
+related restrictions are documented in individual ioctls.
+
 
 Controls
 ========

-- 
Regards,

Laurent Pinchart
