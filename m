Return-Path: <linux-media+bounces-22617-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9759E3B33
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 14:22:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 690CD162472
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 13:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03E521B983E;
	Wed,  4 Dec 2024 13:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hogzHF/M"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA1C189F57
	for <linux-media@vger.kernel.org>; Wed,  4 Dec 2024 13:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733318563; cv=none; b=mEMYbAVkwoWqGjncwR7Wwy3yS/rPOYOgiZRcaNLvxsVqxCb4j0plBqaPKH0DHDetveqzR0tgrGhCY1m98PKBG/ezk3MeyML+iOzmf4UPQ/+A4/1h2oWFJRWVdIJ0jvtYPGgaAjLwQgV02QMm9EAC0SYmBDqmvd98eCTj3XEEB8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733318563; c=relaxed/simple;
	bh=KGKFy45yQUt6z7Q3nj4ftvc0Lo4aHiBjqeTygppvjvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+kIJeTxRO4wmsF8OEccWnemta/5cWUTxR+9m2x5hq0Mi5HaWEEndp3WsLXlJmf86LaVtM9Cbqy5D0foL87xsnMCwgj3X3m6+Ei2MyKfTJ/NPCKJ9AQTxoWWfO0k/F0jibBZrEuZ3PjAWgfMKm/5c5W54N3wkA39+1faqHJ4TUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hogzHF/M; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733318560; x=1764854560;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KGKFy45yQUt6z7Q3nj4ftvc0Lo4aHiBjqeTygppvjvc=;
  b=hogzHF/M8Mf1RytroX0jybn7WzHIum+sNMG2DebBPDqJyCO34s320uSu
   4HIdR24FPtERyMhjT/79xHUkpDa54RpWAPLBFutBm7nMTb1kLjxhYjtT1
   GthXSuV8ko1tp+xhu10NceRFzqXd7DVee4ZtOzF5kDkxsg/aL7TnieCGG
   68Ujy1QVKQartJ2lWTT5eAHnmnl3XXTQHJevB8OipteqagYoR0ubwuJtJ
   GKMfEXenBNAZpjgocCxdFI4GuQuiSVgSk0mlElly3+jVTV1P8m5v4Whls
   SzwyvTaawxJN8aEVlZrWt6GWSDgPFKupSINFQawscBDFS5F05Jpn/KlPf
   w==;
X-CSE-ConnectionGUID: b9cPGHiCTleUJrP6t+8UBQ==
X-CSE-MsgGUID: UGbYIx/YSdOvszv9x7VZrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33713389"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="33713389"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 05:22:40 -0800
X-CSE-ConnectionGUID: onOmjg7ERzGC0hu9nCIMfQ==
X-CSE-MsgGUID: mBiLrZvuSeuA73KZf9XCJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="93847114"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 05:22:34 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0206611F89A;
	Wed,  4 Dec 2024 15:22:30 +0200 (EET)
Date: Wed, 4 Dec 2024 13:22:30 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
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
	Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: Re: [RFC v3 4/9] media: Documentation: Add subdev configuration
 models, raw sensor model
Message-ID: <Z1BXlmDT-1EflH1c@kekkonen.localdomain>
References: <20241129095142.87196-1-sakari.ailus@linux.intel.com>
 <20241129095142.87196-5-sakari.ailus@linux.intel.com>
 <5jxcc3ije4vytvponvl3k6weosr445xgy6bgnfn74dcfwf7loo@w26fnwxncbqo>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5jxcc3ije4vytvponvl3k6weosr445xgy6bgnfn74dcfwf7loo@w26fnwxncbqo>

Hi Jacopo,

Thank you for the review.

On Wed, Dec 04, 2024 at 01:10:55PM +0100, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Fri, Nov 29, 2024 at 11:51:37AM +0200, Sakari Ailus wrote:
> > Sub-device configuration models define what V4L2 API elements are
> > available on a compliant sub-device and how do they behave.
> >
> > The patch also adds a model for common raw sensors.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../media/drivers/camera-sensor.rst           |   4 +
> >  .../media/v4l/common-raw-sensor.dia           | 441 ++++++++++++++++++
> >  .../media/v4l/common-raw-sensor.svg           | 134 ++++++
> >  .../userspace-api/media/v4l/dev-subdev.rst    |   2 +
> >  .../media/v4l/subdev-config-model.rst         | 208 +++++++++
> >  5 files changed, 789 insertions(+)
> >  create mode 100644 Documentation/userspace-api/media/v4l/common-raw-sensor.dia
> >  create mode 100644 Documentation/userspace-api/media/v4l/common-raw-sensor.svg
> >  create mode 100644 Documentation/userspace-api/media/v4l/subdev-config-model.rst
> >
> > diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > index bc55c861fb69..5bc4c79d230c 100644
> > --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > @@ -18,6 +18,8 @@ binning functionality. The sensor drivers belong to two distinct classes, freely
> >  configurable and register list-based drivers, depending on how the driver
> >  configures this functionality.
> >
> > +Also see :ref:`media_subdev_config_model_common_raw_sensor`.
> > +
> >  Freely configurable camera sensor drivers
> >  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > @@ -105,6 +107,8 @@ values programmed by the register sequences. The default values of these
> >  controls shall be 0 (disabled). Especially these controls shall not be inverted,
> >  independently of the sensor's mounting rotation.
> >
> > +.. _media_using_camera_sensor_drivers_embedded_data:
> > +
> >  Embedded data
> >  -------------
> >
> > diff --git a/Documentation/userspace-api/media/v4l/common-raw-sensor.dia b/Documentation/userspace-api/media/v4l/common-raw-sensor.dia
> 
> snip
> 
> > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > index dcfcbd52490d..4d145bd3bd09 100644
> > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > @@ -838,3 +838,5 @@ stream while it may be possible to enable and disable the embedded data stream.
> >
> >  The embedded data format does not need to be configured on the sensor's pads as
> >  the format is dictated by the pixel data format in this case.
> > +
> > +.. include:: subdev-config-model.rst
> > diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > new file mode 100644
> > index 000000000000..4ddf98e3143c
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > @@ -0,0 +1,208 @@
> > +.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
> > +
> > +.. _media_subdev_config_model:
> > +
> > +Sub-device configuration models
> > +===============================
> > +
> > +A sub-device configuration model specifies in detail what the user space can
> > +expect from a sub-device in terms of V4L2 sub-device interface support,
> > +including IOCTL (including selection targets and controls) semantics.
> 
> including IOCTLs, selection targets and controls semantics.

I think we could as well as drop these, i.e. just mention semantics.

> 
> > +
> > +A sub-device may implement more than one configuration model at the same
> > +time. The implemented configuration models can be obtained from the sub-device's
> > +``V4L2_CID_CONFIG_MODEL`` control.
> > +
> > +.. _media_subdev_config_model_common_raw_sensor:
> > +
> > +Common raw camera sensor model
> > +------------------------------
> > +
> > +The common raw camera sensor model defines a set of enumeration and
> > +configuration interfaces (formats, selections etc.) that cover the vast majority
> > +of funcitionality of raw camera sensors. Not all of the interfaces are
> 
> s/funcitionality/functionalities

I'd say singular is right in this case. Maybe Kieran or Dave have an
opinion as well? :-)

> 
> > +necessarily offered by all drivers.
> > +
> > +A sub-device complies with the common raw sensor model if the
> > +``V4L2_CONFIG_MODEL_COMMON_RAW`` bit is set in the ``V4L2_CID_CONFIG_MODEL``
> > +control of the sub-device.
> > +
> > +The common raw camera sensor model is aligned with
> > +:ref:`media_using_camera_sensor_drivers`. Please refer to that regarding aspects
> > +not specified here.
> > +
> > +Each camera sensor implementing the common raw sensor model exposes a single
> > +V4L2 sub-device. The sub-device contains a single source pad (0) and two or more
> > +internal pads: an image data internal pad (1) and optionally an embedded data
> > +pad (2). Additionally, further internal pads may be supported for other
> > +features, in which case they are documented separately for the given device.
> > +
> > +This is shown in :ref:`media_subdev_config_model_common_raw_sensor_subdev`.
> > +
> > +.. _media_subdev_config_model_common_raw_sensor_subdev:
> > +
> > +.. kernel-figure:: common-raw-sensor.svg
> > +    :alt:    common-raw-sensor.svg
> > +    :align:  center
> > +
> > +    **Common raw sensor sub-device**
> > +
> > +Routes
> > +^^^^^^
> > +
> > +A sub-device conforming to common raw camera sensor model implements the
> > +following routes.
> > +
> > +.. flat-table:: Routes
> > +    :header-rows: 1
> > +
> > +    * - Sink pad/stream
> > +      - Source pad/stream
> > +      - Static (X/M(aybe)/-)
> > +      - Mandatory (X/-)
> > +      - Synopsis
> > +    * - 1/0
> > +      - 0/0
> > +      - X
> > +      - X
> > +      - Image data
> > +    * - 2/0
> > +      - 0/1
> > +      - M
> > +      - \-
> > +      - Embedded data
> > +
> > +Some devices do not support the embedded data stream, others do support it and
> > +in some of the latter, it can be turned on and off before streaming is started.
> 
> What about:
> 
> Support for the embedded data stream is optional. Device that support
> the embedded data stream might allow to enable/disable the route
> before the streaming is started.

How about:

Support for the embedded data stream is optional. Drivers supporting
the embedded data stream may allow disabling and enabling the route
when the streaming is disabled.


> 
> > +
> > +Sensor pixel array size, cropping and binning
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +The sensor's pixel array is divided into one or more areas. The areas around the
> > +edge of the pixel array, usually one or more sides, may contain optical black
> 
> optically ?

E.g. CCS spec refers to these as "optical black" pixels.

> 
> > +pixels, dummy pixels and other non-image pixels. The entire pixel array size is
> > +conveyed by the format on (pad, stream) pair 1/0.
> > +
> > +A rectangle within the pixel array contains the visible pixels. Capturing the
> > +non-visible pixels outside the visible pixel area may be supported by the
> > +sensor. The visible pixel area corresponds to the ``V4L2_SEL_TGT_CROP_DEFAULT``
> > +selection target on (pad, stream) pair 1/0.
> > +
> > +Sensors can perform multiple operations that affect the output image size. First
> > +of these is the analogue crop. Analogue crop limits the area of the pixel array
> > +which the sensor will read, affecting sensor timing as well. The granularity of
> > +the analogue crop configuration varies greatly across sensors: some sensors
> > +support only a few different analogue crop configurations whereas others may
> > +support anything divisible by a given number of pixels. The analogue crop
> > +configuration corresponds the ``V4L2_SEL_TGT_CROP`` selection target on (pad,
> > +stream) pair 1/0. The default analogue crop rectangle corresponds to the visible
> > +pixel area.
> > +
> > +In the next step, binning is performed on the image data read from camera
> > +sensor's pixel array, as determined by the analogue crop configuration. Enabling
> > +binning will effectively result in an image smaller than the original by given
> > +binning factors horizontally and vertically. Typical values are 1/2 and 1/3 but
> 
> I thought 1/4 was more common than 1/3... Nevermind..
> 
> > +others may well be supported by the hardware as well.
> > +
> > +Sub-sampling follows binning. Sub-sampling, like binning, reduces the size of
> > +the image by including only a subset of samples read from the sensor's pixel
> > +matrix, typically every n'th pixel horizontally and vertically, taking the
> > +sensor's colour pattern into account. Sub-sampling is generally configurable
> > +separately horizontally and vertically.
> > +
> > +Binning and sub-sampling are configured using the ``V4L2_SEL_TGT_COMPOSE``
> > +rectangle, relative to the analogue crop rectangle, on (pad, stream) pair
> > +1/0. It depends on the driver which of these operations are being used to
> > +achieve the resulting size.
> 
> I would say "It depends on the driver implementation to decide how
> binning and skipping are combined to obtain the desired scaling
> ratio."

I wouldn't refer to this as scaling as we'll have specific scaling
configuration elsewhere. How about:

The driver implementation determines how to configure binning and
sub-sampling to achieve the desired size.

> 
> > +
> > +The digital crop operation takes place after binning and sub-sampling. It is
> > +configured by setting the ``V4L2_SEL_TGT_CROP`` rectangle on (pad, stream) pair
> > +0/0. The resulting image size is further output by the sensor.
> 
> This is not true anymore if we consider digital scaling and
> post-scaler crop.

Yes. I'll address this in the next patch.

> 
> > +
> > +The sensor's output mbus code is configured by setting the format on the (pad,
> > +stream) pair 0/0. When setting the format, always use the same width and height
> > +as for the digital crop setting.
> > +
> 
> Same comment here as well.

Ditto.

> 
> > +Drivers may only support some of even none of these configurations, in which
> 
> s/configurations/configuration options/
> 
> > +case they do not expose the corresponding selection rectangles. If any selection
> 
> How are selection rectangles "exposed" ?

Well, they are not imposed at least. :-)

> I would say "support" instead of expose.
> 
> However I'm a bit concerned what "support" (or "expose") means. We
> should probably define it. I do think that driver should allow reading
> all the above selection rectangles and return the correct values (if a
> configuration step is not supported, sizes are simply passed forward
> from the previous selection target to the next target/format). I'm
> less sure about setting them, if they should error out or simply
> adjust it as get_selection() would have done.

Either could be used IMO. If something is not supported and the user tries
to access it, the result is an error (-EINVAL in this case).

> 
> 
> > +targets are omitted, the further selection rectangle or format is instead
> > +related to the previous implemented selection rectangle. For instance, if the
> > +sensor supports binning but not analogue crop, then the binning configuration
> > +(``V4L2_SEL_TGT_COMPOSE`` selection target) is done in relation to the visible
> > +pixel area (``V4L2_SEL_TGT_CROP_DEFAULT`` selection target).
> 
> Let alone the fact I would have used, say, digital crop as an example
> of an optional feature, I think allowing to read all the possible
> targets would save userspace keeping track of what target the
> rectangle they want to configure refers to.

This is how the selection API works. If we want to deviate from that, it's
another thing, but currently if a driver doesn't support configuring
a selection, it won't support that target either.

If we required all selection rectangles to be supported even if they
wouldn't be configurable, then it'd be up to user to try to change them to
see if they can be modified. I'm not sure if that would be an improvement
as a whole.

I wonder what Laurent thinks.

> 
> > +
> > +Also refer to :ref:`Selection targets <v4l2-selection-targets-table>`.
> > +
> > +.. flat-table:: Selection targets on pads
> > +    :header-rows: 1
> > +
> > +    * - Pad/Stream
> > +      - Selection target/format
> > +      - Mandatory (X/-)
> > +      - Modifiable (X/-)
> > +      - Synopsis
> > +    * - 1/0
> > +      - Format
> > +      - X
> > +      - \-
> > +      - Image data format. The width and the height fields indicates the full
> > +        size of the pixel array, including non-visible pixels. The media bus
> > +        code of this format reflects the native pixel depth of the sensor.
> > +    * - 1/0
> > +      - ``V4L2_SEL_TGT_CROP_DEFAULT``
> > +      - X
> > +      - \
> > +      - The visible pixel area. This rectangle is relative to the format on the
> > +        same (pad, stream).
> > +    * - 1/0
> > +      - ``V4L2_SEL_TGT_CROP``
> > +      - \-
> > +      - X
> > +      - Analogue crop. Analogue crop typically has a coarse granularity. This
> > +        rectangle is relative to the format on the same (pad, stream).
> > +    * - 1/0
> > +      - ``V4L2_SEL_TGT_COMPOSE``
> > +      - \-
> > +      - X
> > +      - Binning and sub-sampling. This rectangle is relative to the
> > +        ``V4L2_SEL_TGT_CROP`` rectangle on the same (pad, stream). The
> > +        combination of binning and sub-sampling is configured using this
> > +        selection target.
> > +    * - 2/0
> > +      - Format
> > +      - X
> > +      - \-
> > +      - Embedded data format.
> > +    * - 0/0
> > +      - ``V4L2_SEL_TGT_CROP``
> > +      - \-
> > +      - X
> > +      - Digital crop. This rectangle is relative to the ``V4L2_SEL_TGT_COMPOSE``
> > +        rectangle on (pad, stream) pair 1/0.
> > +    * - 0/0
> > +      - Format
> > +      - X
> > +      - X
> > +      - Image data source format. Always assign the width and height fields of
> > +        the format to the same values than for the ``V4L2_SEL_TGT_CROP``
> > +        rectangle on (pad, stream) pair 0/0. The media bus code reflects the
> > +        pixel data output of the sensor.
> 
> This makes me think it is intentional not to document digital
> scaling/post-scaler crop in this version ?

Not in this patch, no. :-)

I'm fine merging this to the 5th patch if there's an agreement they should
be merged together (probably?).

> 
> > +    * - 0/1
> > +      - Format
> > +      - X
> > +      - \-
> > +      - Embedded data source format.
> > +
> > +Embedded data
> > +^^^^^^^^^^^^^
> > +
> > +The embedded data stream is produced by the sensor when the corresponding route
> > +is enabled. The embedded data route may also be immutable or not exist at all,
> > +in case the sensor (or the driver) does not support it.
> > +
> > +Generally the sensor embedded data width is determined by the width of the image
> > +data whereas the number of lines are constant for the embedded data. The user
> 
> Maybe drop "The" from "The user space" ?

I'd keep it as-is.

> 
> > +space may obtain the size of the embedded data once the image data size on the
> > +source pad has been configured.
> > +
> > +Also see :ref:`media_using_camera_sensor_drivers_embedded_data`.
> 
> Thanks for the hard work here, I like how this new document
> clearly outlines the expected interfaces exposed by drivers.

Thank you. Hopefully we could all agree on this soonish and get libcamera
support implemented so we could merge it all. :-)

-- 
Kind regards,

Sakari Ailus

