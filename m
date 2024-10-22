Return-Path: <linux-media+bounces-20050-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 035849AB353
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 18:06:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DD241C22A13
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 16:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36B191BD513;
	Tue, 22 Oct 2024 16:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NqwOPpWy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AD91A0BE5
	for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 16:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729612959; cv=none; b=WLdMrIsUon2KO/Aezm3Bh7bUaaV+3oCM81GcbNJFBKHELg/LQ/YJERTt5rtMIuKmX1yuqxce1D3Xgr1uPxtQ/ZTSsFKy1ngC9Bb5DSB6VQYAQpHNyHV5Ojg8r3BZm8U1tGJxO02fRaC4uxUbwfckEwKtk7dKZLyH4n3bQPNRcus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729612959; c=relaxed/simple;
	bh=L32KRJwVVLgyhgfKzeHdVHeZfi3C/stpJ5ORHs5UyRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GI7HiiWvbbUnHEUWdOeigd8BP0rvB16d7QcAzXIZzuqMkEvcWdhL3TVW/tmqNsRf8ehy4ZbzNIACTjPHE1Xf+TDFw5TZFYBTnkZawC0Ak9ZGH8seAoEZM1OzFbjI75M7Wf1GuUtQZrXSlXrpbBKT4wQDBe2d0dmZ6Il26xKjjG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NqwOPpWy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1AD6480;
	Tue, 22 Oct 2024 18:00:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729612848;
	bh=L32KRJwVVLgyhgfKzeHdVHeZfi3C/stpJ5ORHs5UyRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NqwOPpWysBlAxk83buSZMgBEAFbbh3qFXMRRQsD9D5NkdSa/rGmcIp/oWgvUUHxSz
	 6AAg3TP88rx40KIOgXFq5SoToFmoAttxzJ0uMcXr+DLOxWssB8Y4LBIkfPRu1vX63X
	 /y2TA+YmYF9PJjlXGjjPnxYeH6LmltHvsQK76wQM=
Date: Tue, 22 Oct 2024 18:02:32 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Umang Jain <umang.jain@ideasonboard.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>
Subject: Re: [RFC 3/4] media: Documentation: Add subdev configuration models,
 raw sensor model
Message-ID: <o3vd3xnxjdfoitipoehoef4nycxmv6bvzjcq427gz3aqn2h5ku@yhspyjdngj73>
References: <20241011075535.588140-1-sakari.ailus@linux.intel.com>
 <20241011075535.588140-4-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241011075535.588140-4-sakari.ailus@linux.intel.com>

Hi Sakari

On Fri, Oct 11, 2024 at 10:55:34AM +0300, Sakari Ailus wrote:
> Sub-device configuration models define what V4L2 API elements are
> available on a compliant sub-device and how do they behave.
>
> The patch also adds a model for common raw sensors.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../media/drivers/camera-sensor.rst           |   5 +
>  .../media/v4l/common-raw-sensor.dia           | 441 ++++++++++++++++++
>  .../media/v4l/common-raw-sensor.svg           | 134 ++++++
>  .../userspace-api/media/v4l/dev-subdev.rst    |   2 +
>  .../media/v4l/subdev-config-model.rst         | 180 +++++++
>  5 files changed, 762 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/common-raw-sensor.dia
>  create mode 100644 Documentation/userspace-api/media/v4l/common-raw-sensor.svg
>  create mode 100644 Documentation/userspace-api/media/v4l/subdev-config-model.rst
>
> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> index ad4049ff7eec..727cc12bc624 100644
> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> @@ -18,6 +18,9 @@ binning functionality. The sensor drivers belong to two distinct classes, freely
>  configurable and register list based drivers, depending on how the driver
>  configures this functionality.
>
> +Also see
> +:ref:`media_subdev_config_model_common_raw_sensor`.
> +
>  Freely configurable camera sensor drivers
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> @@ -105,6 +108,8 @@ values programmed by the register sequences. The default values of these
>  controls shall be 0 (disabled). Especially these controls shall not be inverted,
>  independently of the sensor's mounting rotation.
>
> +.. _media_using_camera_sensor_drivers_embedded_data:
> +
>  Embedded data
>  -------------
>

[snip images]

> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index dcfcbd52490d..4d145bd3bd09 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -838,3 +838,5 @@ stream while it may be possible to enable and disable the embedded data stream.
>
>  The embedded data format does not need to be configured on the sensor's pads as
>  the format is dictated by the pixel data format in this case.
> +
> +.. include:: subdev-config-model.rst
> diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> new file mode 100644
> index 000000000000..8ec801998f5f
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> @@ -0,0 +1,180 @@
> +.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
> +
> +Sub-device configuration models
> +===============================
> +
> +A sub-device configuration model specifies in detail what the user space can
> +expect from a sub-device in terms of V4L2 sub-device interface support,
> +including semantics specific to a given configuration model.
> +
> +A sub-device may implement more than one configuration model at the same
> +time. The implemented configuration models can be obtained from the sub-device's
> +``V4L2_CID_CONFIG_MODEL`` control.

Isn't a control an overkill ? Isn't enough to identify that a sensor produces
RAW images and has an internal pad to the below description ?

Also, would it be the single sensor driver that has to correctly
populate the control ?

> +
> +.. _media_subdev_config_model_common_raw_sensor:
> +
> +Common raw camera sensor model
> +------------------------------
> +
> +The common raw camera sensor model defines the configurability of a superset
> +that covers the vast majority of raw camera sensors. Not all of the
> +configuration and enumeration interfaces are offered by all drivers.
> +
> +A sub-device complies with the common raw sensor model if the
> +``V4L2_CONFIG_MODEL_COMMON_RAW`` bit is set in the ``V4L2_CID_CONFIG_MODEL``
> +control of the sub-device.
> +
> +The common raw camera sensor model is aligned with
> +:ref:`media_using_camera_sensor_drivers`. Please refer to that regarding aspects
> +not specified here.
> +
> +Each camera sensor implementing the common raw sensor model exposes a single
> +V4L2 sub-device. The sub-device contains a single source pad (0) and two or more
> +internal pads: an image data internal pad (1) and optionally an embedded data
> +pad (2). Additionally, further internal pads may be supported for other
> +features, in which case they are documented separately for the given device.

That's pretty easy to identify from userspace without a control, isn't
it ?

> +
> +This is show in :ref:`media_subdev_config_model_common_raw_sensor_subdev`.
> +
> +.. _media_subdev_config_model_common_raw_sensor_subdev:
> +
> +.. kernel-figure:: common-raw-sensor.svg
> +    :alt:    common-raw-sensor.svg
> +    :align:  center
> +
> +    **Common raw sensor sub-device**
> +
> +Routes
> +^^^^^^
> +
> +A sub-device conforming to common raw camera sensor model implements the
> +following routes.
> +
> +.. flat-table:: Routes
> +    :header-rows: 1
> +
> +    * - Sink pad/stream
> +      - Source pad/stream
> +      - Static (X/M(aybe)/-)

afaiu either the route is Static (cannot be changed) or it is not.
What does Maybe means here ?

> +      - Mandatory (X/-)
> +      - Synopsis
> +    * - 1/0
> +      - 0/0
> +      - X
> +      - X
> +      - Image data
> +    * - 2/0
> +      - 0/1
> +      - M
> +      - -
> +      - Embedded data
> +
> +Some devices may support enabling and disabling the embedded data stream. Others
> +may not support it at all, in which case the embedded data route does not exist.

Does the driver need to expose a routing table at all if it has a
single, immutable image data stream ?

> +
> +Sensor pixel array size, cropping and binning
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +

This is not something I was expecting here. We teach how to compute
framerates for RAW sensors in camera-sensor.rst ("Using camera sensor
drivers") specifying which controls a sensor driver should register and
the expected controls units. It seems to me we define part of the expected
interface exposed by a raw camera sensor there and part here. I wonder
if camera-sensor.rst makes any sense at all if we define the "models"
here.

> +The sensor's pixel array is divided into one or more areas. The areas around the
> +edge of the pixel array, usually one one or more sides, may contain optical
> +black pixels, dummy pixels and other non-image pixels.
> +
> +A rectangle within the pixel area contains the visible pixels. Capturing the
> +non-visible pixels may be supported by the sensor.

This is a bit of simplification, as I presume there might be
rectangles of visible pixels which overlap in the most advanced use
cases.
https://git.libcamera.org/libcamera/libcamera.git/tree/src/libcamera/property_ids_core.yaml#n594

> +
> +The sensor can perform three operations that affect the output image size. First
> +comes analogue crop. This configuration limits parts of the pixel array which
> +the sensor will read, affecting sensor timing as well. The granularity of the
> +analogue crop configuration varies greatly across sensors: some sensors support
> +a few different analogue crop configurations whereas others may support anything
> +divisible by a given number of pixels.
> +
> +The default analogue crop rectangle corresponds to the visible pixel area if
> +supported by the hardware.

In what sense "if supported by the hardware" ? Is this referring to
the "visibile pixel area" ?

> +
> +In the next step, binning is performed on the image data read from camera
> +sensor's pixel array. This will effectively result in an image smaller than the
> +original by given proportions horizontally and vertically. Typical values are

s/proportions/scaling factors/ ?

> +1/2 and 1/3 but others may well be supported by the hardware as well.
> +
> +The combination of the analogue crop and binning operations may result in an
> +image size that may be larger than desirable. For this purpose, a digital crop

This is highly optional it seems.

> +operation may be performed on the binned image. The resulting image size is
> +further outputted by the sensor.
> +
> +.. flat-table:: Selection targets on pads
> +    :header-rows: 1
> +
> +    * - Pad/Stream
> +      - Selection target/format
> +      - Mandatory (X/-)
> +      - Synopsis

What about an R/W column ?

> +    * - 1/0
> +      - Format
> +      - X
> +      - Image data format. The width and height fields of this format are the
> +        same than those for the V4L2_SEL_TGT_CROP_BOUNDS rectangle. The media

Can sizes be changed at all ?

> +        bus code of this format reflects the native pixel depth of the sensor.
> +    * - 1/0
> +      - V4L2_SEL_TGT_NATIVE_SIZE
> +      - X
> +      - The full size of the pixel array, including all pixels in the pixel
> +	array, even if they cannot be captured. This rectangle is relative to
> +	the format on the same (pad, stream).
> +    * - 1/0
> +      - V4L2_SEL_TGT_CROP_BOUNDS
> +      - X
> +      - The crop rectangle bounds. No pixels outside this area can be

I would describe it as "the readable part of the full pixel array
area" instead of repeating "crop rectangle bounds"

> +        captured. This rectangle is relative to the V4L2_SEL_TGT_NATIVE_SIZE

> +    * - 1/0
> +      - V4L2_SEL_TGT_CROP_DEFAULT
> +      - X
> +      - The visible pixel area. This rectangle is relative to the

Isn't this the default analogue crop rectangle ?

> +        V4L2_SEL_TGT_NATIVE_SIZE rectangle on the same (pad, stream).
> +    * - 1/0
> +      - V4L2_SEL_TGT_CROP
> +      - \-
> +      - Analogue crop. Analogue crop typically has a coarse granularity. This
> +        rectangle is relative to the V4L2_SEL_TGT_NATIVE_SIZE rectangle on the
> +        same (pad, stream).
> +    * - 1/0
> +      - V4L2_SEL_TGT_COMPOSE
> +      - \-
> +      - Binning. This rectangle is relative to the V4L2_SEL_TGT_CROP
> +        rectangle on the same (pad, stream).

The size ratio between the V4L2_SEL_TGT_CROP and V4L2_SEL_TGT_COMPOSE
rectangles selects the desired binning factor.

> +    * - 2/0
> +      - Format
> +      - X
> +      - Embedded data format.
> +    * - 0/0
> +      - V4L2_SEL_TGT_CROP
> +      - \-
> +      - Digital crop. This rectangle is relative to the V4L2_SEL_TGT_COMPOSE
> +        rectangle on (pad, stream) pair 1/0.
> +    * - 0/0
> +      - Format
> +      - X
> +      - Image data source format. The width and height fields of the format are
> +        the same than for the V4L2_SEL_TGT crop rectangle on (pad, stream) pair
> +        0/0 where as the media bus code reflects the pixel data output of the

s/where as/and ?
Or maybe I didn't get what you mean

> +        sensor.
> +    * - 0/1
> +      - Format
> +      - X
> +      - Embedded data source format.
> +
> +Embedded data
> +^^^^^^^^^^^^^
> +
> +The embedded data stream is produced by the sensor when the corresponding route
> +is enabled. The embedded data route may also be immutable or not exist at all,
> +in case the sensor (or the driver) does not support it.
> +
> +Generally the sensor embedded data width is determined by the width of the image
> +data whereas the number of lines are constant for the embedded data. The user
> +space may obtain the size of the embedded data once the image data size on the
> +source pad has been configured.
> +
> +Also see :ref:`media_using_camera_sensor_drivers_embedded_data`.
> +
> --
> 2.39.5
>
>

