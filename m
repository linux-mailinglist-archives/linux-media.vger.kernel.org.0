Return-Path: <linux-media+bounces-43532-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B04CBB2AE7
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 09:22:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 400723BA391
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 07:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E30842C21CF;
	Thu,  2 Oct 2025 07:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h80veIOh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A7033F6
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 07:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759389762; cv=none; b=LGXVA3lBqKYh46unJOmm/ELBQd0OZCxpoCDTysFVZ9So0qJT/baf/MNnYdOU8cd5GUewG4IxNNVPQYE9uS0j6bfz6xd6AUO5nyM/YfOyKd4TQZbBraYPRWoszQRH5jkAyvHnEFD5/fehtNTCMx7x7TeLLtXZCwb79LxG6LgTAGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759389762; c=relaxed/simple;
	bh=mFxT3mMJrmD61xEmkRpy5e01E/hy6Rq4edbR3mZw+4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FD4Bisb7pReCRZwlzYVn2duatTbAmzMNevBCwkoq3caw8ZXLDSWxOV5TdLAWc8PCorKg5kWnBM69r/UTJp4tft9e8M/wFVTb3guNfk+v25ZGVICbj+exex6cvKTEnrF5A3CwY5hL5bKTg9ZcAhubOM+0NTmM/1GaHwCX3MKKQwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h80veIOh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0180BE01;
	Thu,  2 Oct 2025 09:21:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759389666;
	bh=mFxT3mMJrmD61xEmkRpy5e01E/hy6Rq4edbR3mZw+4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h80veIOhOO9CBG3FcbgW/GPyfF3yQCnf/MMQ5XxablYkll46w3pxT8V4viHRIblNl
	 jzYG/7+KTl67CS6s5wETx5EcrQx18gPJCrWiprZb50ZSfqmZ5kI2yoDiH/f7551Q8j
	 EBst19LY+MrdYDXDyeD+LDJBtSemcJ5dGe8qpWVI=
Date: Thu, 2 Oct 2025 09:22:32 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com, 
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Umang Jain <umang.jain@ideasonboard.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	"Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu" <tian.shu.qiu@intel.com>, 
	"Wang, Hongju" <hongju.wang@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, 
	Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 39/66] media: Documentation: Add subdev configuration
 models, raw sensor model
Message-ID: <kblfpuqfj2d6vkagspnqdhztno2js3wljdrsv2wpeywuwyzg5x@xt7rjhh5wt76>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-40-sakari.ailus@linux.intel.com>
 <osdr2eavm23pzxrd73v4xscdtaafon3vllhzcg5r6eoqwclsfk@xgfnicn6iboj>
 <aM1J9LsbpueEr30x@kekkonen.localdomain>
 <5fwlztz2q2fewyml774my3sdw3wv5wdhnl6p4mfbubm4erm5ft@sthie2bobklf>
 <aN4lQPK5Mqve2bUI@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aN4lQPK5Mqve2bUI@kekkonen.localdomain>

Hi Sakari

On Thu, Oct 02, 2025 at 10:09:52AM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Thu, Sep 25, 2025 at 12:31:09PM +0200, Jacopo Mondi wrote:
> > Hi Sakari
> >
> > On Fri, Sep 19, 2025 at 03:17:56PM +0300, Sakari Ailus wrote:
> > > Hi Jacopo,
> > >
> > > On Mon, Sep 01, 2025 at 07:09:29PM +0200, Jacopo Mondi wrote:
> > > > Hi Sakari
> > > >
> > > > On Mon, Aug 25, 2025 at 12:50:40PM +0300, Sakari Ailus wrote:
> > > > > Sub-device configuration models define what V4L2 API elements are
> > > > > available on a compliant sub-device and how do they behave.
> > > > >
> > > > > The patch also adds a model for common raw sensors.
> > > > >
> > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> > > > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > ---
> > > > >  .../media/drivers/camera-sensor.rst           |   4 +
> > > > >  .../media/v4l/common-raw-sensor.dia           | 442 ++++++++++++++++++
> > > > >  .../media/v4l/common-raw-sensor.svg           | 134 ++++++
> > > > >  .../userspace-api/media/v4l/dev-subdev.rst    |   2 +
> > > > >  .../media/v4l/subdev-config-model.rst         | 230 +++++++++
> > > > >  5 files changed, 812 insertions(+)
> > > > >  create mode 100644 Documentation/userspace-api/media/v4l/common-raw-sensor.dia
> > > > >  create mode 100644 Documentation/userspace-api/media/v4l/common-raw-sensor.svg
> > > > >  create mode 100644 Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > > > >
> > > > > diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > > > > index cbbfbb0d8273..39f3f91c6733 100644
> > > > > --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > > > > +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > > > > @@ -18,6 +18,8 @@ binning functionality. The sensor drivers belong to two distinct classes, freely
> > > > >  configurable and register list-based drivers, depending on how the driver
> > > > >  configures this functionality.
> > > > >
> > > > > +Also see :ref:`media_subdev_config_model_common_raw_sensor`.
> > > > > +
> > > > >  Freely configurable camera sensor drivers
> > > > >  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > >
> > > > > @@ -118,6 +120,8 @@ values programmed by the register sequences. The default values of these
> > > > >  controls shall be 0 (disabled). Especially these controls shall not be inverted,
> > > > >  independently of the sensor's mounting rotation.
> > > > >
> > > > > +.. _media_using_camera_sensor_drivers_embedded_data:
> > > > > +
> > > > >  Embedded data
> > > > >  -------------
> > > > >
> > > > > diff --git a/Documentation/userspace-api/media/v4l/common-raw-sensor.dia b/Documentation/userspace-api/media/v4l/common-raw-sensor.dia
> > > > > new file mode 100644
> > > > > index 000000000000..24b3f2b2a626
> > > > > --- /dev/null
> > > > > +++ b/Documentation/userspace-api/media/v4l/common-raw-sensor.dia
> > > >
> > > > [snip]
> > > >
> > > > > diff --git a/Documentation/userspace-api/media/v4l/common-raw-sensor.svg b/Documentation/userspace-api/media/v4l/common-raw-sensor.svg
> > > > > new file mode 100644
> > > > > index 000000000000..1d6055da2519
> > > > > --- /dev/null
> > > > > +++ b/Documentation/userspace-api/media/v4l/common-raw-sensor.svg
> > > >
> > > > [snip]
> > > >
> > > > > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > > index bb86cadfad1c..b0774b9a9b71 100644
> > > > > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > > @@ -846,3 +846,5 @@ stream while it may be possible to enable and disable the embedded data stream.
> > > > >
> > > > >  The embedded data format does not need to be configured on the sensor's pads as
> > > > >  the format is dictated by the pixel data format in this case.
> > > > > +
> > > > > +.. include:: subdev-config-model.rst
> > > > > diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > > > > new file mode 100644
> > > > > index 000000000000..1e6c58931ea0
> > > > > --- /dev/null
> > > > > +++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > > > > @@ -0,0 +1,230 @@
> > > > > +.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
> > > > > +
> > > > > +.. _media_subdev_config_model:
> > > > > +
> > > > > +Sub-device configuration models
> > > > > +===============================
> > > > > +
> > > > > +The V4L2 specification defines a subdev API that exposes three type of
> > > > > +configuration elements: formats, selection rectangles and controls. The
> > > > > +specification contains generic information about how those configuration
> > > > > +elements behave, but not precisely how they apply to particular hardware
> > > > > +features. We leave some leeway to drivers to decide how to map selection
> > > > > +rectangles to device features, as long as they comply with the V4L2
> > > > > +specification. This is needed as hardware features differ between devices, so
> > > > > +it's the driver's responsibility to handle this mapping.
> > > > > +
> > > > > +Unfortunately, this lack of clearly defined mapping in the specification has led
> > > > > +to different drivers mapping the same hardware features to different API
> > > > > +elements, or implementing the API elements with slightly different
> > > > > +behaviours. Furthermore, many drivers have implemented selection rectangles in
> > > > > +ways that do not comply with the V4L2 specification. All of this makes userspace
> > > > > +development difficult.
> > > > > +
> > > > > +Sub-device configuration models specify in detail what the user space can expect
> > > > > +from a sub-device in terms of V4L2 sub-device interface support, semantics
> > > > > +included.
> > > > > +
> > > > > +A sub-device may implement more than one configuration model at the same
> > > > > +time. The implemented configuration models can be obtained from the sub-device's
> > > > > +``V4L2_CID_CONFIG_MODEL`` control.
> > > > > +
> > > > > +.. _media_subdev_config_model_common_raw_sensor:
> > > > > +
> > > > > +Common raw camera sensor model
> > > > > +------------------------------
> > > > > +
> > > > > +The common raw camera sensor model defines a set of enumeration and
> > > > > +configuration interfaces (formats, selections etc.) that cover the vast majority
> > > > > +of functionality of raw camera sensors. Not all of the interfaces are
> > > > > +necessarily offered by all drivers.
> > > > > +
> > > > > +A sub-device complies with the common raw sensor model if the
> > > > > +``V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR`` bit is set in the
> > > > > +``V4L2_CID_CONFIG_MODEL`` control of the sub-device.
> > > > > +
> > > > > +The common raw camera sensor model is aligned with
> > > > > +:ref:`media_using_camera_sensor_drivers`. Please refer to that regarding aspects
> > > > > +not specified here.
> > > > > +
> > > > > +Each camera sensor implementing the common raw sensor model exposes a single
> > > > > +V4L2 sub-device. The sub-device contains a single source pad (0) and two or more
> > > > > +internal pads: one or more image data internal pads (starting from 1) and
> > > > > +optionally an embedded data pad.
> > > > > +
> > > > > +Additionally, further internal pads may be supported for other features. Using
> > > > > +more than one image data internal pad or more than one non-image data pad
> > > > > +requires these pads documented separately for the given device. The indices of
> > > > > +the image data internal pads shall be lower than those of the non-image data
> > > > > +pads.
> > > > > +
> > > > > +This is shown in :ref:`media_subdev_config_model_common_raw_sensor_subdev`.
> > > >
> > > > possibly doesn't need a link as the image is just here below
> > > >
> > > > > +
> > > > > +.. _media_subdev_config_model_common_raw_sensor_subdev:
> > > > > +
> > > > > +.. kernel-figure:: common-raw-sensor.svg
> > > > > +    :alt:    common-raw-sensor.svg
> > > > > +    :align:  center
> > > > > +
> > > > > +    **Common raw sensor sub-device with n pads (n == 2)**
> > > > > +
> > > > > +Routes
> > > > > +^^^^^^
> > > > > +
> > > > > +A sub-device conforming to common raw camera sensor model implements the
> > > > > +following routes.
> > > > > +
> > > > > +.. flat-table:: Routes
> > > > > +    :header-rows: 1
> > > > > +
> > > > > +    * - Sink pad/stream
> > > > > +      - Source pad/stream
> > > > > +      - Static (X/M(aybe)/-)
> > > > > +      - Mandatory (X/-)
> > > > > +      - Synopsis
> > > > > +    * - 1/0
> > > > > +      - 0/0
> > > > > +      - X
> > > > > +      - X
> > > > > +      - Image data
> > > > > +    * - 2/0
> > > > > +      - 0/1
> > > > > +      - M
> > > > > +      - \-
> > > > > +      - Embedded data
> > > > > +
> > > > > +Support for the embedded data stream is optional. Drivers supporting the
> > > > > +embedded data stream may allow disabling and enabling the route when the
> > > > > +streaming is disabled.
> > > >
> > > > I would
> > > >
> > > > s/when the streaming is disabled//
> > >
> > > Sounds good.
> > >
> > > >
> > > > > +
> > > > > +Sensor pixel array size, cropping and binning
> > > > > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > > > +
> > > > > +The sensor's pixel array is divided into one or more areas. The areas around the
> > > > > +edge of the pixel array, usually one or more sides, may contain optical black
> > > >
> > > > You say that "the pixel array is divided into one or more areas" and
> > > > then list "the areas around the edge of the pixel array" which is confusing
> > > >
> > > > I think it would be better as
> > > >
> > > > The sensor's full pixel array is divided into one or more areas, one
> > > > (or multiple) active area which contains visible pixels surrounded,
> > > > usually on one or more sides, by non-active areas which may contain
> > > > optical black pixels, dummy pixels and other non-image pixels. The
> > > > entire pixel array areas size, including the active and non-active
> > > > portions is conveyed by the format on (pad, stream) pair 1/0.
> > > >
> > > > This would also better define the "visible pixels" term which is used
> > > > in the rest of the documentation.
> > >
> > > There indeed were issues in the terms used in the original text. How about:
> > >
> > > The sensor's pixel array is divided into one or more areas. The areas around the
> > > the visible area in the pixel array, usually one or more sides, may contain
> >
> > I still feel that "active area that contains visible pixels" better
> > defines what "visibile area" is... not a problem anyway
>
> How about "visible pixel area"?

fine with me

>
> >
> > > optical black pixels, dummy pixels and other non-image pixels. The full size of
> > > the pixel array that may be captured is conveyed by the format on (pad, stream)
> > > pair 1/0.
> > >
> > > A rectangle within the pixel array contains the visible pixels. Capturing the
> > > non-visible pixels outside the visible pixel area may be supported by the
> > > sensor. The visible pixel area corresponds to the ``V4L2_SEL_TGT_CROP_DEFAULT``
> > > selection target on (pad, stream) pair 1/0.
> > >
> >
> > Just for sake of discussion: in libcamera we support multiple,
> > possible overlapping, active pixel areas:
> > https://git.libcamera.org/libcamera/libcamera.git/tree/src/libcamera/property_ids_core.yaml#n594
> >
> > tbh I don't know how common this is, but as far as I can tell we won't
> > be able to describe them here
>
> Do you have a sensor that would support this?
>

Not really. Do you think it is a valid use case ?

I'm just mentioning it because in libcamera we prepared for that but
I personally never had to deal with anything like this

> >
> >
> > > >
> > > > > +
> > > > > +A rectangle within the pixel array contains the visible pixels. Capturing the
> > > >
> > > > If you accept the above, you can drop the first sentence here
> > > >
> > > > > +non-visible pixels outside the visible pixel area may be supported by the
> > > > > +sensor. The visible pixel area corresponds to the ``V4L2_SEL_TGT_CROP_DEFAULT``
> > > > > +selection target on (pad, stream) pair 1/0.
> > > > > +
> > > > > +Sensors can perform multiple operations that affect the output image size. First
> > > > > +of these is the analogue crop. Analogue crop limits the area of the pixel array
> > > >
> > > > s/First one of these/The first one of these/
> > >
> > > Yes.
> > >
> > > >
> > > > > +which the sensor will read, affecting sensor timing as well. The granularity of
> > > > > +the analogue crop configuration varies greatly across sensors: some sensors
> > > > > +support only a few different analogue crop configurations whereas others may
> > > > > +support anything divisible by a given number of pixels. The analogue crop
> > > > > +configuration corresponds to the ``V4L2_SEL_TGT_CROP`` selection target on (pad,
> > > > > +stream) pair 1/0. The default analogue crop rectangle corresponds to the visible
> > > > > +pixel area.
> > > > > +
> > > > > +In the next step, binning is performed on the image data read from camera
> > > > > +sensor's pixel array, as determined by the analogue crop configuration. Enabling
> > > > > +binning will effectively result in an image smaller than the original by given
> > > > > +binning factors horizontally and vertically. Typical values are 1/2 and 1/3 but
> > > > > +others may well be supported by the hardware as well.
> > > > > +
> > > > > +Sub-sampling follows binning. Sub-sampling, like binning, reduces the size of
> > > > > +the image by including only a subset of samples read from the sensor's pixel
> > > > > +matrix, typically every n'th pixel horizontally and vertically, taking the
> > > > > +sensor's color pattern into account. Sub-sampling is generally configurable
> > > > > +separately horizontally and vertically.
> > > > > +
> > > > > +Binning and sub-sampling are configured using the ``V4L2_SEL_TGT_COMPOSE``
> > > >
> > > > s/Binning and sub-sampling are/The combined effect of binning and
> > > > sub-sampling is/
> > >
> > > Yes.
> > >
> > > >
> > > > > +rectangle, relative to the analogue crop rectangle, on (pad, stream) pair
> > > > > +1/0. The driver implementation determines how to configure binning and
> > > > > +sub-sampling to achieve the desired size.
> > > > > +
> > > > > +The digital crop operation takes place after binning and sub-sampling. It is
> > > > > +configured by setting the ``V4L2_SEL_TGT_CROP`` rectangle on (pad, stream) pair
> > > > > +0/0. The resulting image size is further output by the sensor.
> > > >
> > > > by the sensor on the bus.
> > > >
> > > > ?
> > >
> > > We should in fact get rid of the word "bus" in this context as the CSI-2
> > > interface is not an actual (addressable) bus. How about "sensor's data
> > > interface"? Someone will probably ask what that data interface is. :-)
> >
> > True :) up to you!
>
> I'll use the data interface here.

It's fine, thanks!

>
> --
> Kind regards,
>
> Sakari Ailus

