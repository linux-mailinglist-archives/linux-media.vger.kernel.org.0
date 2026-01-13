Return-Path: <linux-media+bounces-50570-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C2BD199D0
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 15:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7AAD303A3A1
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 14:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D8D2C3259;
	Tue, 13 Jan 2026 14:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EnQ2HjZh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F011E2D5408
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 14:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768315816; cv=none; b=qzQdD0EJNTVoqmMEszyr7m76crY80gKthIfoFYXa0F5p2IQb1U5YzzU8jVNG8AqY7pfFyQ9d8ovXMGa8zwBvwpia4X0ECOR0NZCCuXKlyLdTBi+YKWq2vMI9vV3abIdyyGTsb+LuRUtAw/OkPBPD3CQTL+zTtx+B7KyQqz0Ra9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768315816; c=relaxed/simple;
	bh=0Rw55K6fZzVTBtMsQCabQkiSyhTnhKDatkUE5/Wp/Bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tg29k27pEGljbHEUUXUY5Y1wyCFU3VZjljcuyKEeJDSeC1Tl3MiGrn151kfOulLXDdqoQE9hShvzlfy6hKksrX1WPfeMjfQMAz3ePPUnNXrOrFVOT+xUVYojZ2raMsZ0a2b42i0rJhLsPws/FLrmWlW0Y/0xaCdijtZt3MDR2NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EnQ2HjZh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF3167FA;
	Tue, 13 Jan 2026 15:49:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768315778;
	bh=0Rw55K6fZzVTBtMsQCabQkiSyhTnhKDatkUE5/Wp/Bg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EnQ2HjZh4aGFDcDN3tw74geUc1tGUvj+VEacnwbsB1hLTUiMK66oiqLS8E6DJ5rsN
	 c+lkjdgd2VjidFwgqYNNyA7ojl9PMtBG0LTSWIdbXA3uDdID/30nqGbGXyJnBt27mI
	 hRjObdBIMgGOlKaDmKuhlmQGFkFRMzGkp1T/Jmwk=
Date: Tue, 13 Jan 2026 15:50:01 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, 
	"Yan, Dongcheng" <dongcheng.yan@intel.com>, "Cao, Bingbu" <bingbu.cao@intel.com>, 
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v10 40/64] media: Documentation: Add subdev configuration
 models, raw sensor model
Message-ID: <aWZbAuW6qx_ZYZVS@zed>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-41-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619115836.1946016-41-sakari.ailus@linux.intel.com>

Hi Sakari, one more drive-by comment

On Thu, Jun 19, 2025 at 02:58:12PM +0300, Sakari Ailus wrote:
> Sub-device configuration models define what V4L2 API elements are
> available on a compliant sub-device and how do they behave.
>
> The patch also adds a model for common raw sensors.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../media/drivers/camera-sensor.rst           |   4 +
>  .../media/v4l/common-raw-sensor.dia           | 442 ++++++++++++++++++
>  .../media/v4l/common-raw-sensor.svg           | 134 ++++++
>  .../userspace-api/media/v4l/dev-subdev.rst    |   2 +
>  .../media/v4l/subdev-config-model.rst         | 230 +++++++++
>  5 files changed, 812 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/common-raw-sensor.dia
>  create mode 100644 Documentation/userspace-api/media/v4l/common-raw-sensor.svg
>  create mode 100644 Documentation/userspace-api/media/v4l/subdev-config-model.rst
>
[snip]

> +
> +.. include:: subdev-config-model.rst
> diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> new file mode 100644
> index 000000000000..1e6c58931ea0
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> @@ -0,0 +1,230 @@
> +.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
> +
> +.. _media_subdev_config_model:
> +
> +Sub-device configuration models
> +===============================
> +
> +The V4L2 specification defines a subdev API that exposes three type of
> +configuration elements: formats, selection rectangles and controls. The
> +specification contains generic information about how those configuration
> +elements behave, but not precisely how they apply to particular hardware
> +features. We leave some leeway to drivers to decide how to map selection
> +rectangles to device features, as long as they comply with the V4L2
> +specification. This is needed as hardware features differ between devices, so
> +it's the driver's responsibility to handle this mapping.
> +
> +Unfortunately, this lack of clearly defined mapping in the specification has led
> +to different drivers mapping the same hardware features to different API
> +elements, or implementing the API elements with slightly different
> +behaviours. Furthermore, many drivers have implemented selection rectangles in
> +ways that do not comply with the V4L2 specification. All of this makes userspace
> +development difficult.
> +
> +Sub-device configuration models specify in detail what the user space can expect
> +from a sub-device in terms of V4L2 sub-device interface support, semantics
> +included.
> +
> +A sub-device may implement more than one configuration model at the same
> +time. The implemented configuration models can be obtained from the sub-device's
> +``V4L2_CID_CONFIG_MODEL`` control.
> +
> +.. _media_subdev_config_model_common_raw_sensor:
> +
> +Common raw camera sensor model
> +------------------------------
> +
> +The common raw camera sensor model defines a set of enumeration and
> +configuration interfaces (formats, selections etc.) that cover the vast majority
> +of functionality of raw camera sensors. Not all of the interfaces are
> +necessarily offered by all drivers.
> +
> +A sub-device complies with the common raw sensor model if the
> +``V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR`` bit is set in the
> +``V4L2_CID_CONFIG_MODEL`` control of the sub-device.
> +
> +The common raw camera sensor model is aligned with
> +:ref:`media_using_camera_sensor_drivers`. Please refer to that regarding aspects
> +not specified here.
> +
> +Each camera sensor implementing the common raw sensor model exposes a single
> +V4L2 sub-device. The sub-device contains a single source pad (0) and two or more
> +internal pads: one or more image data internal pads (starting from 1) and
> +optionally an embedded data pad.
> +
> +Additionally, further internal pads may be supported for other features. Using
> +more than one image data internal pad or more than one non-image data pad
> +requires these pads documented separately for the given device. The indices of
> +the image data internal pads shall be lower than those of the non-image data
> +pads.
> +
> +This is shown in :ref:`media_subdev_config_model_common_raw_sensor_subdev`.
> +
> +.. _media_subdev_config_model_common_raw_sensor_subdev:
> +
> +.. kernel-figure:: common-raw-sensor.svg
> +    :alt:    common-raw-sensor.svg
> +    :align:  center
> +
> +    **Common raw sensor sub-device with n pads (n == 2)**
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
> +      - Mandatory (X/-)
> +      - Synopsis

In my understanding a route can be

        - Mandatory (Y/N)
        - Static (Y/N)

I found the Maybe/- options confusing

What does it mean "Maybe" here ? Ehtier a route is static or not, the
"Maybe" and "No" cases seems to express the same concept in my
opinion...

Thanks
  j

> +    * - 1/0
> +      - 0/0
> +      - X
> +      - X
> +      - Image data
> +    * - 2/0
> +      - 0/1
> +      - M
> +      - \-
> +      - Embedded data
> +
> +Support for the embedded data stream is optional. Drivers supporting the
> +embedded data stream may allow disabling and enabling the route when the
> +streaming is disabled.
> +
> +Sensor pixel array size, cropping and binning
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +The sensor's pixel array is divided into one or more areas. The areas around the
> +edge of the pixel array, usually one or more sides, may contain optical black
> +pixels, dummy pixels and other non-image pixels. The entire pixel array size is
> +conveyed by the format on (pad, stream) pair 1/0.
> +
> +A rectangle within the pixel array contains the visible pixels. Capturing the
> +non-visible pixels outside the visible pixel area may be supported by the
> +sensor. The visible pixel area corresponds to the ``V4L2_SEL_TGT_CROP_DEFAULT``
> +selection target on (pad, stream) pair 1/0.
> +
> +Sensors can perform multiple operations that affect the output image size. First
> +of these is the analogue crop. Analogue crop limits the area of the pixel array
> +which the sensor will read, affecting sensor timing as well. The granularity of
> +the analogue crop configuration varies greatly across sensors: some sensors
> +support only a few different analogue crop configurations whereas others may
> +support anything divisible by a given number of pixels. The analogue crop
> +configuration corresponds to the ``V4L2_SEL_TGT_CROP`` selection target on (pad,
> +stream) pair 1/0. The default analogue crop rectangle corresponds to the visible
> +pixel area.
> +
> +In the next step, binning is performed on the image data read from camera
> +sensor's pixel array, as determined by the analogue crop configuration. Enabling
> +binning will effectively result in an image smaller than the original by given
> +binning factors horizontally and vertically. Typical values are 1/2 and 1/3 but
> +others may well be supported by the hardware as well.
> +
> +Sub-sampling follows binning. Sub-sampling, like binning, reduces the size of
> +the image by including only a subset of samples read from the sensor's pixel
> +matrix, typically every n'th pixel horizontally and vertically, taking the
> +sensor's color pattern into account. Sub-sampling is generally configurable
> +separately horizontally and vertically.
> +
> +Binning and sub-sampling are configured using the ``V4L2_SEL_TGT_COMPOSE``
> +rectangle, relative to the analogue crop rectangle, on (pad, stream) pair
> +1/0. The driver implementation determines how to configure binning and
> +sub-sampling to achieve the desired size.
> +
> +The digital crop operation takes place after binning and sub-sampling. It is
> +configured by setting the ``V4L2_SEL_TGT_CROP`` rectangle on (pad, stream) pair
> +0/0. The resulting image size is further output by the sensor.
> +
> +The sensor's output mbus code is configured by setting the format on the (pad,
> +stream) pair 0/0. When setting the format, always use the same width and height
> +as for the digital crop setting.
> +
> +Drivers may only support some or even none of these configurations, in which
> +case they do not expose the corresponding selection rectangles. If any selection
> +targets are omitted, the further selection rectangle or format is instead
> +related to the previous implemented selection rectangle. For instance, if the
> +sensor supports binning but not analogue crop, then the binning configuration
> +(``V4L2_SEL_TGT_COMPOSE`` selection target) is done in relation to the visible
> +pixel area (``V4L2_SEL_TGT_CROP_DEFAULT`` selection target).
> +
> +Also refer to :ref:`Selection targets <v4l2-selection-targets-table>`.
> +
> +.. flat-table:: Selection targets on pads
> +    :header-rows: 1
> +
> +    * - Pad/Stream
> +      - Selection target/format
> +      - Mandatory (X/-)
> +      - Modifiable (X/-)
> +      - Synopsis
> +    * - 1/0
> +      - Format
> +      - X
> +      - \-
> +      - Image data format. The width and the height fields indicates the full
> +        size of the pixel array, including non-visible pixels. The media bus
> +        code of this format reflects the native pixel depth of the sensor.
> +    * - 1/0
> +      - ``V4L2_SEL_TGT_CROP_DEFAULT``
> +      - X
> +      - \
> +      - The visible pixel area. This rectangle is relative to the format on the
> +        same (pad, stream).
> +    * - 1/0
> +      - ``V4L2_SEL_TGT_CROP``
> +      - \-
> +      - X
> +      - Analogue crop. Analogue crop typically has a coarse granularity. This
> +        rectangle is relative to the format on the same (pad, stream).
> +    * - 1/0
> +      - ``V4L2_SEL_TGT_COMPOSE``
> +      - \-
> +      - X
> +      - Binning and sub-sampling. This rectangle is relative to the
> +        ``V4L2_SEL_TGT_CROP`` rectangle on the same (pad, stream). The
> +        combination of binning and sub-sampling is configured using this
> +        selection target.
> +    * - 2/0
> +      - Format
> +      - X
> +      - \-
> +      - Embedded data format.
> +    * - 0/0
> +      - ``V4L2_SEL_TGT_CROP``
> +      - \-
> +      - X
> +      - Digital crop. This rectangle is relative to the ``V4L2_SEL_TGT_COMPOSE``
> +        rectangle on (pad, stream) pair 1/0.
> +    * - 0/0
> +      - Format
> +      - X
> +      - X
> +      - Image data source format. Always assign the width and height fields of
> +        the format to the same values than for the ``V4L2_SEL_TGT_CROP``
> +        rectangle on (pad, stream) pair 0/0. The media bus code reflects the
> +        pixel data output of the sensor.
> +    * - 0/1
> +      - Format
> +      - X
> +      - \-
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
> --
> 2.39.5
>
>

