Return-Path: <linux-media+bounces-22612-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4F39E3993
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 13:11:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AB86285A1C
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 12:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 566D11B87CE;
	Wed,  4 Dec 2024 12:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="duquzS7H"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062891B87DF
	for <linux-media@vger.kernel.org>; Wed,  4 Dec 2024 12:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733314267; cv=none; b=EIjkRpkJk4HWQN8NPehj5xukEVCBi3Z5deRYghpac+KgZ6iKnl19d/DmDX6sHAOgoynihcAMPpwewRjBfYCqP0wTniVST5ROuvlvHNBH/KgRjWvY8jav59DkFFukezkAIj78EnfhMU3UQOhnCteKdM30lagLllHeTjrQpq/RpSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733314267; c=relaxed/simple;
	bh=mHteyk8f8OOe014qbr/pYir4PCW7JgjYCuehowBDk80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XM6EZfM3iAdTY4RtCTR1XLWbSR0io6ZETVCDbCy01Ay0MsnX+8ZXAgGjRZC5uZw85017eXHgXCLNcT64Ke3m5GDlFFhZdwl21TKTuWAeDTmQ/hfEv0gxcVyGG9xJ1lGMdMK+aN4UV/FtKcdDcDXVv9PG0G84cKSq4fcA/N+17r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=duquzS7H; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F184F6D6;
	Wed,  4 Dec 2024 13:10:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733314231;
	bh=mHteyk8f8OOe014qbr/pYir4PCW7JgjYCuehowBDk80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=duquzS7HTvnerTyAI7dayifKRkwW96TBZhjq0KeKrwFJ3sl2rOpurQz7oxPqeUBeo
	 u2fvrVt78fnNzFLpmcgTPhVEBfvQLQ74ZmKG+aCuxRg+3PWC3ocvA92ArIjQ/jI503
	 ktsqhh+BRIq809dlVpytLHwjD+3sfS0OuAP+qjds=
Date: Wed, 4 Dec 2024 13:10:55 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Umang Jain <umang.jain@ideasonboard.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	"Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu" <tian.shu.qiu@intel.com>, 
	"Wang, Hongju" <hongju.wang@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, 
	Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: Re: [RFC v3 4/9] media: Documentation: Add subdev configuration
 models, raw sensor model
Message-ID: <5jxcc3ije4vytvponvl3k6weosr445xgy6bgnfn74dcfwf7loo@w26fnwxncbqo>
References: <20241129095142.87196-1-sakari.ailus@linux.intel.com>
 <20241129095142.87196-5-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241129095142.87196-5-sakari.ailus@linux.intel.com>

Hi Sakari

On Fri, Nov 29, 2024 at 11:51:37AM +0200, Sakari Ailus wrote:
> Sub-device configuration models define what V4L2 API elements are
> available on a compliant sub-device and how do they behave.
>
> The patch also adds a model for common raw sensors.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../media/drivers/camera-sensor.rst           |   4 +
>  .../media/v4l/common-raw-sensor.dia           | 441 ++++++++++++++++++
>  .../media/v4l/common-raw-sensor.svg           | 134 ++++++
>  .../userspace-api/media/v4l/dev-subdev.rst    |   2 +
>  .../media/v4l/subdev-config-model.rst         | 208 +++++++++
>  5 files changed, 789 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/common-raw-sensor.dia
>  create mode 100644 Documentation/userspace-api/media/v4l/common-raw-sensor.svg
>  create mode 100644 Documentation/userspace-api/media/v4l/subdev-config-model.rst
>
> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> index bc55c861fb69..5bc4c79d230c 100644
> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> @@ -18,6 +18,8 @@ binning functionality. The sensor drivers belong to two distinct classes, freely
>  configurable and register list-based drivers, depending on how the driver
>  configures this functionality.
>
> +Also see :ref:`media_subdev_config_model_common_raw_sensor`.
> +
>  Freely configurable camera sensor drivers
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> @@ -105,6 +107,8 @@ values programmed by the register sequences. The default values of these
>  controls shall be 0 (disabled). Especially these controls shall not be inverted,
>  independently of the sensor's mounting rotation.
>
> +.. _media_using_camera_sensor_drivers_embedded_data:
> +
>  Embedded data
>  -------------
>
> diff --git a/Documentation/userspace-api/media/v4l/common-raw-sensor.dia b/Documentation/userspace-api/media/v4l/common-raw-sensor.dia

snip

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
> index 000000000000..4ddf98e3143c
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> @@ -0,0 +1,208 @@
> +.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
> +
> +.. _media_subdev_config_model:
> +
> +Sub-device configuration models
> +===============================
> +
> +A sub-device configuration model specifies in detail what the user space can
> +expect from a sub-device in terms of V4L2 sub-device interface support,
> +including IOCTL (including selection targets and controls) semantics.

including IOCTLs, selection targets and controls semantics.

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
> +of funcitionality of raw camera sensors. Not all of the interfaces are

s/funcitionality/functionalities

> +necessarily offered by all drivers.
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
> +
> +This is shown in :ref:`media_subdev_config_model_common_raw_sensor_subdev`.
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
> +      - \-
> +      - Embedded data
> +
> +Some devices do not support the embedded data stream, others do support it and
> +in some of the latter, it can be turned on and off before streaming is started.

What about:

Support for the embedded data stream is optional. Device that support
the embedded data stream might allow to enable/disable the route
before the streaming is started.

> +
> +Sensor pixel array size, cropping and binning
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +The sensor's pixel array is divided into one or more areas. The areas around the
> +edge of the pixel array, usually one or more sides, may contain optical black

optically ?

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
> +configuration corresponds the ``V4L2_SEL_TGT_CROP`` selection target on (pad,
> +stream) pair 1/0. The default analogue crop rectangle corresponds to the visible
> +pixel area.
> +
> +In the next step, binning is performed on the image data read from camera
> +sensor's pixel array, as determined by the analogue crop configuration. Enabling
> +binning will effectively result in an image smaller than the original by given
> +binning factors horizontally and vertically. Typical values are 1/2 and 1/3 but

I thought 1/4 was more common than 1/3... Nevermind..

> +others may well be supported by the hardware as well.
> +
> +Sub-sampling follows binning. Sub-sampling, like binning, reduces the size of
> +the image by including only a subset of samples read from the sensor's pixel
> +matrix, typically every n'th pixel horizontally and vertically, taking the
> +sensor's colour pattern into account. Sub-sampling is generally configurable
> +separately horizontally and vertically.
> +
> +Binning and sub-sampling are configured using the ``V4L2_SEL_TGT_COMPOSE``
> +rectangle, relative to the analogue crop rectangle, on (pad, stream) pair
> +1/0. It depends on the driver which of these operations are being used to
> +achieve the resulting size.

I would say "It depends on the driver implementation to decide how
binning and skipping are combined to obtain the desired scaling
ratio."

> +
> +The digital crop operation takes place after binning and sub-sampling. It is
> +configured by setting the ``V4L2_SEL_TGT_CROP`` rectangle on (pad, stream) pair
> +0/0. The resulting image size is further output by the sensor.

This is not true anymore if we consider digital scaling and
post-scaler crop.

> +
> +The sensor's output mbus code is configured by setting the format on the (pad,
> +stream) pair 0/0. When setting the format, always use the same width and height
> +as for the digital crop setting.
> +

Same comment here as well.

> +Drivers may only support some of even none of these configurations, in which

s/configurations/configuration options/

> +case they do not expose the corresponding selection rectangles. If any selection

How are selection rectangles "exposed" ?
I would say "support" instead of expose.

However I'm a bit concerned what "support" (or "expose") means. We
should probably define it. I do think that driver should allow reading
all the above selection rectangles and return the correct values (if a
configuration step is not supported, sizes are simply passed forward
from the previous selection target to the next target/format). I'm
less sure about setting them, if they should error out or simply
adjust it as get_selection() would have done.


> +targets are omitted, the further selection rectangle or format is instead
> +related to the previous implemented selection rectangle. For instance, if the
> +sensor supports binning but not analogue crop, then the binning configuration
> +(``V4L2_SEL_TGT_COMPOSE`` selection target) is done in relation to the visible
> +pixel area (``V4L2_SEL_TGT_CROP_DEFAULT`` selection target).

Let alone the fact I would have used, say, digital crop as an example
of an optional feature, I think allowing to read all the possible
targets would save userspace keeping track of what target the
rectangle they want to configure refers to.

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

This makes me think it is intentional not to document digital
scaling/post-scaler crop in this version ?

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

Maybe drop "The" from "The user space" ?

> +space may obtain the size of the embedded data once the image data size on the
> +source pad has been configured.
> +
> +Also see :ref:`media_using_camera_sensor_drivers_embedded_data`.

Thanks for the hard work here, I like how this new document
clearly outlines the expected interfaces exposed by drivers.

Thanks
  j


> --
> 2.39.5
>
>

