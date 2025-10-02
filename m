Return-Path: <linux-media+bounces-43529-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CF1BB2A95
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 09:10:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DD9619C473E
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 07:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBCB027A454;
	Thu,  2 Oct 2025 07:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EUiue1v2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D3E23F294
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 07:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759389006; cv=none; b=piRsptxgaZvJO/07kb+j9gcAjU/Oek9LR2esP1kQAbFoh6j3bfqOeXBqPGrc0dMtTdujxcmeYuHOkuZ4oL8WtUhm3pt2BBFrhSgL1rL8Xi97csBCY/pdFpriFIFq9Qaht8409omkhl6ZwbdF0SiurYchExM3KlXvxiX64JZOT7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759389006; c=relaxed/simple;
	bh=sELlGHCc4kRVm7My2Uc1y53/bYZcqV/KDmFdw+1+n7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mh+K8jcx8tbR5+5ZQvmkqfzJMKKLjwDyX733NlgIVwhzfOZ5r0zX6k4KmFwpGyYNCltq4ND87FFYCc4CWb8gPyd7cPqmeIr6WPamak04SMxLB5ZqOMX62d729WIELG/j1tVz1/Hdn9hkEuqdCn7vCQuSydxV76SIjfkgSJw5Wv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EUiue1v2; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759389004; x=1790925004;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sELlGHCc4kRVm7My2Uc1y53/bYZcqV/KDmFdw+1+n7o=;
  b=EUiue1v25gYBvC4SajAcKPSXU749Y9VvtXAMSB61Xio7ophCvVoYNth0
   m3XQUH4tYkpGNc5xMhNWVzucvQvwlrAJ7SptUFOxD1lcniFrnLgS0sRpU
   dARJ1fi71+zVC8/yb/VKxUqkTk3TsM+68aX/F/efGNJGU0SmEwnromKd+
   GX+Wzbn1ZEBj9SksDI3DmN0s0IFYC3pSkRDNAjtWRmJSYQkAJ3RfvZoYD
   fZyWb4+whokxQBtV3DE7zFYlL4HiWAetypQR3Baju1p4qOPssYeuQH/Kx
   I94HB/tre6hP20w//S7JlGajn8tG6TyKLfQzQthMAQQWp+aLFjSKC6OiR
   g==;
X-CSE-ConnectionGUID: 0N/rSAHwQHGqIAjCi0ANeQ==
X-CSE-MsgGUID: M03BPCN3TyOJ9AZ6m6s1/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="60706467"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; 
   d="scan'208";a="60706467"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 00:10:03 -0700
X-CSE-ConnectionGUID: QBOa0qR2RL6E/nk6WrR/Pw==
X-CSE-MsgGUID: TLXtgrPfRCiz4sQITSQxrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; 
   d="scan'208";a="178095675"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.175])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 00:09:56 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D4AE8121096;
	Thu, 02 Oct 2025 10:09:52 +0300 (EEST)
Date: Thu, 2 Oct 2025 10:09:52 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 39/66] media: Documentation: Add subdev configuration
 models, raw sensor model
Message-ID: <aN4lQPK5Mqve2bUI@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-40-sakari.ailus@linux.intel.com>
 <osdr2eavm23pzxrd73v4xscdtaafon3vllhzcg5r6eoqwclsfk@xgfnicn6iboj>
 <aM1J9LsbpueEr30x@kekkonen.localdomain>
 <5fwlztz2q2fewyml774my3sdw3wv5wdhnl6p4mfbubm4erm5ft@sthie2bobklf>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fwlztz2q2fewyml774my3sdw3wv5wdhnl6p4mfbubm4erm5ft@sthie2bobklf>

Hi Jacopo,

On Thu, Sep 25, 2025 at 12:31:09PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Fri, Sep 19, 2025 at 03:17:56PM +0300, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > On Mon, Sep 01, 2025 at 07:09:29PM +0200, Jacopo Mondi wrote:
> > > Hi Sakari
> > >
> > > On Mon, Aug 25, 2025 at 12:50:40PM +0300, Sakari Ailus wrote:
> > > > Sub-device configuration models define what V4L2 API elements are
> > > > available on a compliant sub-device and how do they behave.
> > > >
> > > > The patch also adds a model for common raw sensors.
> > > >
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> > > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > ---
> > > >  .../media/drivers/camera-sensor.rst           |   4 +
> > > >  .../media/v4l/common-raw-sensor.dia           | 442 ++++++++++++++++++
> > > >  .../media/v4l/common-raw-sensor.svg           | 134 ++++++
> > > >  .../userspace-api/media/v4l/dev-subdev.rst    |   2 +
> > > >  .../media/v4l/subdev-config-model.rst         | 230 +++++++++
> > > >  5 files changed, 812 insertions(+)
> > > >  create mode 100644 Documentation/userspace-api/media/v4l/common-raw-sensor.dia
> > > >  create mode 100644 Documentation/userspace-api/media/v4l/common-raw-sensor.svg
> > > >  create mode 100644 Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > > >
> > > > diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > > > index cbbfbb0d8273..39f3f91c6733 100644
> > > > --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > > > +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > > > @@ -18,6 +18,8 @@ binning functionality. The sensor drivers belong to two distinct classes, freely
> > > >  configurable and register list-based drivers, depending on how the driver
> > > >  configures this functionality.
> > > >
> > > > +Also see :ref:`media_subdev_config_model_common_raw_sensor`.
> > > > +
> > > >  Freely configurable camera sensor drivers
> > > >  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > >
> > > > @@ -118,6 +120,8 @@ values programmed by the register sequences. The default values of these
> > > >  controls shall be 0 (disabled). Especially these controls shall not be inverted,
> > > >  independently of the sensor's mounting rotation.
> > > >
> > > > +.. _media_using_camera_sensor_drivers_embedded_data:
> > > > +
> > > >  Embedded data
> > > >  -------------
> > > >
> > > > diff --git a/Documentation/userspace-api/media/v4l/common-raw-sensor.dia b/Documentation/userspace-api/media/v4l/common-raw-sensor.dia
> > > > new file mode 100644
> > > > index 000000000000..24b3f2b2a626
> > > > --- /dev/null
> > > > +++ b/Documentation/userspace-api/media/v4l/common-raw-sensor.dia
> > >
> > > [snip]
> > >
> > > > diff --git a/Documentation/userspace-api/media/v4l/common-raw-sensor.svg b/Documentation/userspace-api/media/v4l/common-raw-sensor.svg
> > > > new file mode 100644
> > > > index 000000000000..1d6055da2519
> > > > --- /dev/null
> > > > +++ b/Documentation/userspace-api/media/v4l/common-raw-sensor.svg
> > >
> > > [snip]
> > >
> > > > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > index bb86cadfad1c..b0774b9a9b71 100644
> > > > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > @@ -846,3 +846,5 @@ stream while it may be possible to enable and disable the embedded data stream.
> > > >
> > > >  The embedded data format does not need to be configured on the sensor's pads as
> > > >  the format is dictated by the pixel data format in this case.
> > > > +
> > > > +.. include:: subdev-config-model.rst
> > > > diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > > > new file mode 100644
> > > > index 000000000000..1e6c58931ea0
> > > > --- /dev/null
> > > > +++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > > > @@ -0,0 +1,230 @@
> > > > +.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
> > > > +
> > > > +.. _media_subdev_config_model:
> > > > +
> > > > +Sub-device configuration models
> > > > +===============================
> > > > +
> > > > +The V4L2 specification defines a subdev API that exposes three type of
> > > > +configuration elements: formats, selection rectangles and controls. The
> > > > +specification contains generic information about how those configuration
> > > > +elements behave, but not precisely how they apply to particular hardware
> > > > +features. We leave some leeway to drivers to decide how to map selection
> > > > +rectangles to device features, as long as they comply with the V4L2
> > > > +specification. This is needed as hardware features differ between devices, so
> > > > +it's the driver's responsibility to handle this mapping.
> > > > +
> > > > +Unfortunately, this lack of clearly defined mapping in the specification has led
> > > > +to different drivers mapping the same hardware features to different API
> > > > +elements, or implementing the API elements with slightly different
> > > > +behaviours. Furthermore, many drivers have implemented selection rectangles in
> > > > +ways that do not comply with the V4L2 specification. All of this makes userspace
> > > > +development difficult.
> > > > +
> > > > +Sub-device configuration models specify in detail what the user space can expect
> > > > +from a sub-device in terms of V4L2 sub-device interface support, semantics
> > > > +included.
> > > > +
> > > > +A sub-device may implement more than one configuration model at the same
> > > > +time. The implemented configuration models can be obtained from the sub-device's
> > > > +``V4L2_CID_CONFIG_MODEL`` control.
> > > > +
> > > > +.. _media_subdev_config_model_common_raw_sensor:
> > > > +
> > > > +Common raw camera sensor model
> > > > +------------------------------
> > > > +
> > > > +The common raw camera sensor model defines a set of enumeration and
> > > > +configuration interfaces (formats, selections etc.) that cover the vast majority
> > > > +of functionality of raw camera sensors. Not all of the interfaces are
> > > > +necessarily offered by all drivers.
> > > > +
> > > > +A sub-device complies with the common raw sensor model if the
> > > > +``V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR`` bit is set in the
> > > > +``V4L2_CID_CONFIG_MODEL`` control of the sub-device.
> > > > +
> > > > +The common raw camera sensor model is aligned with
> > > > +:ref:`media_using_camera_sensor_drivers`. Please refer to that regarding aspects
> > > > +not specified here.
> > > > +
> > > > +Each camera sensor implementing the common raw sensor model exposes a single
> > > > +V4L2 sub-device. The sub-device contains a single source pad (0) and two or more
> > > > +internal pads: one or more image data internal pads (starting from 1) and
> > > > +optionally an embedded data pad.
> > > > +
> > > > +Additionally, further internal pads may be supported for other features. Using
> > > > +more than one image data internal pad or more than one non-image data pad
> > > > +requires these pads documented separately for the given device. The indices of
> > > > +the image data internal pads shall be lower than those of the non-image data
> > > > +pads.
> > > > +
> > > > +This is shown in :ref:`media_subdev_config_model_common_raw_sensor_subdev`.
> > >
> > > possibly doesn't need a link as the image is just here below
> > >
> > > > +
> > > > +.. _media_subdev_config_model_common_raw_sensor_subdev:
> > > > +
> > > > +.. kernel-figure:: common-raw-sensor.svg
> > > > +    :alt:    common-raw-sensor.svg
> > > > +    :align:  center
> > > > +
> > > > +    **Common raw sensor sub-device with n pads (n == 2)**
> > > > +
> > > > +Routes
> > > > +^^^^^^
> > > > +
> > > > +A sub-device conforming to common raw camera sensor model implements the
> > > > +following routes.
> > > > +
> > > > +.. flat-table:: Routes
> > > > +    :header-rows: 1
> > > > +
> > > > +    * - Sink pad/stream
> > > > +      - Source pad/stream
> > > > +      - Static (X/M(aybe)/-)
> > > > +      - Mandatory (X/-)
> > > > +      - Synopsis
> > > > +    * - 1/0
> > > > +      - 0/0
> > > > +      - X
> > > > +      - X
> > > > +      - Image data
> > > > +    * - 2/0
> > > > +      - 0/1
> > > > +      - M
> > > > +      - \-
> > > > +      - Embedded data
> > > > +
> > > > +Support for the embedded data stream is optional. Drivers supporting the
> > > > +embedded data stream may allow disabling and enabling the route when the
> > > > +streaming is disabled.
> > >
> > > I would
> > >
> > > s/when the streaming is disabled//
> >
> > Sounds good.
> >
> > >
> > > > +
> > > > +Sensor pixel array size, cropping and binning
> > > > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > > +
> > > > +The sensor's pixel array is divided into one or more areas. The areas around the
> > > > +edge of the pixel array, usually one or more sides, may contain optical black
> > >
> > > You say that "the pixel array is divided into one or more areas" and
> > > then list "the areas around the edge of the pixel array" which is confusing
> > >
> > > I think it would be better as
> > >
> > > The sensor's full pixel array is divided into one or more areas, one
> > > (or multiple) active area which contains visible pixels surrounded,
> > > usually on one or more sides, by non-active areas which may contain
> > > optical black pixels, dummy pixels and other non-image pixels. The
> > > entire pixel array areas size, including the active and non-active
> > > portions is conveyed by the format on (pad, stream) pair 1/0.
> > >
> > > This would also better define the "visible pixels" term which is used
> > > in the rest of the documentation.
> >
> > There indeed were issues in the terms used in the original text. How about:
> >
> > The sensor's pixel array is divided into one or more areas. The areas around the
> > the visible area in the pixel array, usually one or more sides, may contain
> 
> I still feel that "active area that contains visible pixels" better
> defines what "visibile area" is... not a problem anyway

How about "visible pixel area"?

> 
> > optical black pixels, dummy pixels and other non-image pixels. The full size of
> > the pixel array that may be captured is conveyed by the format on (pad, stream)
> > pair 1/0.
> >
> > A rectangle within the pixel array contains the visible pixels. Capturing the
> > non-visible pixels outside the visible pixel area may be supported by the
> > sensor. The visible pixel area corresponds to the ``V4L2_SEL_TGT_CROP_DEFAULT``
> > selection target on (pad, stream) pair 1/0.
> >
> 
> Just for sake of discussion: in libcamera we support multiple,
> possible overlapping, active pixel areas:
> https://git.libcamera.org/libcamera/libcamera.git/tree/src/libcamera/property_ids_core.yaml#n594
> 
> tbh I don't know how common this is, but as far as I can tell we won't
> be able to describe them here

Do you have a sensor that would support this?

> 
> 
> > >
> > > > +
> > > > +A rectangle within the pixel array contains the visible pixels. Capturing the
> > >
> > > If you accept the above, you can drop the first sentence here
> > >
> > > > +non-visible pixels outside the visible pixel area may be supported by the
> > > > +sensor. The visible pixel area corresponds to the ``V4L2_SEL_TGT_CROP_DEFAULT``
> > > > +selection target on (pad, stream) pair 1/0.
> > > > +
> > > > +Sensors can perform multiple operations that affect the output image size. First
> > > > +of these is the analogue crop. Analogue crop limits the area of the pixel array
> > >
> > > s/First one of these/The first one of these/
> >
> > Yes.
> >
> > >
> > > > +which the sensor will read, affecting sensor timing as well. The granularity of
> > > > +the analogue crop configuration varies greatly across sensors: some sensors
> > > > +support only a few different analogue crop configurations whereas others may
> > > > +support anything divisible by a given number of pixels. The analogue crop
> > > > +configuration corresponds to the ``V4L2_SEL_TGT_CROP`` selection target on (pad,
> > > > +stream) pair 1/0. The default analogue crop rectangle corresponds to the visible
> > > > +pixel area.
> > > > +
> > > > +In the next step, binning is performed on the image data read from camera
> > > > +sensor's pixel array, as determined by the analogue crop configuration. Enabling
> > > > +binning will effectively result in an image smaller than the original by given
> > > > +binning factors horizontally and vertically. Typical values are 1/2 and 1/3 but
> > > > +others may well be supported by the hardware as well.
> > > > +
> > > > +Sub-sampling follows binning. Sub-sampling, like binning, reduces the size of
> > > > +the image by including only a subset of samples read from the sensor's pixel
> > > > +matrix, typically every n'th pixel horizontally and vertically, taking the
> > > > +sensor's color pattern into account. Sub-sampling is generally configurable
> > > > +separately horizontally and vertically.
> > > > +
> > > > +Binning and sub-sampling are configured using the ``V4L2_SEL_TGT_COMPOSE``
> > >
> > > s/Binning and sub-sampling are/The combined effect of binning and
> > > sub-sampling is/
> >
> > Yes.
> >
> > >
> > > > +rectangle, relative to the analogue crop rectangle, on (pad, stream) pair
> > > > +1/0. The driver implementation determines how to configure binning and
> > > > +sub-sampling to achieve the desired size.
> > > > +
> > > > +The digital crop operation takes place after binning and sub-sampling. It is
> > > > +configured by setting the ``V4L2_SEL_TGT_CROP`` rectangle on (pad, stream) pair
> > > > +0/0. The resulting image size is further output by the sensor.
> > >
> > > by the sensor on the bus.
> > >
> > > ?
> >
> > We should in fact get rid of the word "bus" in this context as the CSI-2
> > interface is not an actual (addressable) bus. How about "sensor's data
> > interface"? Someone will probably ask what that data interface is. :-)
> 
> True :) up to you!

I'll use the data interface here.

-- 
Kind regards,

Sakari Ailus

