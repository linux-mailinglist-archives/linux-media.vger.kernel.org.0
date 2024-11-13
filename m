Return-Path: <linux-media+bounces-21360-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFEE9C6A7E
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 09:20:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C3F228469D
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 08:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B60E189B8A;
	Wed, 13 Nov 2024 08:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="i9CUIlNA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D633F170A03
	for <linux-media@vger.kernel.org>; Wed, 13 Nov 2024 08:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731486042; cv=none; b=C3eUbSFh+SZNC2SdUzWOitiCmFSCvigqp0lQf51lMkB4kY94GbQ/3LwSZVHaygEaQxgK8Orenwn8pjhai1m6Muti8BPQhHCCQ+XfrWMos+7RckZMYlJA54TbFHueJNQKi6tX+kfah2g/IJ3yIUJdYBPcuVR74nkF/gSgm0xIdcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731486042; c=relaxed/simple;
	bh=osDETUBteNxR8kR7FPbTeHEFClX/dNb85LxSlTIleSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HvErBdX2kigkdD9crefW86LOEXo88+kAqoSd3omvF6YI5cd8BW+S/B/e6g7NZWrqx9nP+Zv5FWsXtgdCCOP9f/8jVMY7i0Qn59kZU5yIOWGp4ZTLHabPpAeVE7WXUiD+WsDblMsdFEMPoe8MZhYGDgz4Y7nMGIY2J49PPOqwcAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=i9CUIlNA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-150-226-204.cust.dsl.teletu.it [93.150.226.204])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 613E6752;
	Wed, 13 Nov 2024 09:20:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731486024;
	bh=osDETUBteNxR8kR7FPbTeHEFClX/dNb85LxSlTIleSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i9CUIlNArO+1hvb9Nuk6K+/pHA9NVu4FmZXPrXzn3IP7oMqw16SblJkOfuEzCy7dL
	 yPZITbCMMiV4QfNkQvTpaHMH3qMYD3NDax8SrwsRQkZ0R/cm0Ziy2gzhBBTHdWA0gy
	 u9q+35lLq5ZkdrBOuDcqf1Rrhmx4RXY9viQOfQ/E=
Date: Wed, 13 Nov 2024 09:20:32 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, hverkuil@xs4all.nl, 
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, Mikhail Rudenko <mike.rudenko@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>
Subject: Re: [RFC 3/4] media: Documentation: Add subdev configuration models,
 raw sensor model
Message-ID: <tudawlq55g7cd54b67t47qy3sso7m7a5a42mkhxvdbv7hx2vqy@3mihjp7saikq>
References: <20241011075535.588140-1-sakari.ailus@linux.intel.com>
 <20241011075535.588140-4-sakari.ailus@linux.intel.com>
 <o3vd3xnxjdfoitipoehoef4nycxmv6bvzjcq427gz3aqn2h5ku@yhspyjdngj73>
 <20241022221032.GF9497@pendragon.ideasonboard.com>
 <ZzRW0g4LobeORzSp@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZzRW0g4LobeORzSp@kekkonen.localdomain>

Hi Sakari

On Wed, Nov 13, 2024 at 07:35:46AM +0000, Sakari Ailus wrote:
> Hi Jacopo, Laurent,
>
> Thank you for the review.
>
> On Wed, Oct 23, 2024 at 01:10:32AM +0300, Laurent Pinchart wrote:
> > Hello,
> >
> > On Tue, Oct 22, 2024 at 06:02:32PM +0200, Jacopo Mondi wrote:
> > > On Fri, Oct 11, 2024 at 10:55:34AM +0300, Sakari Ailus wrote:
> > > > Sub-device configuration models define what V4L2 API elements are
> > > > available on a compliant sub-device and how do they behave.
> > > >
> > > > The patch also adds a model for common raw sensors.
> > > >
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  .../media/drivers/camera-sensor.rst           |   5 +
> > > >  .../media/v4l/common-raw-sensor.dia           | 441 ++++++++++++++++++
> > > >  .../media/v4l/common-raw-sensor.svg           | 134 ++++++
> > > >  .../userspace-api/media/v4l/dev-subdev.rst    |   2 +
> > > >  .../media/v4l/subdev-config-model.rst         | 180 +++++++
> > > >  5 files changed, 762 insertions(+)
> > > >  create mode 100644 Documentation/userspace-api/media/v4l/common-raw-sensor.dia
> > > >  create mode 100644 Documentation/userspace-api/media/v4l/common-raw-sensor.svg
> > > >  create mode 100644 Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > > >
> > > > diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > > > index ad4049ff7eec..727cc12bc624 100644
> > > > --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > > > +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > > > @@ -18,6 +18,9 @@ binning functionality. The sensor drivers belong to two distinct classes, freely
> > > >  configurable and register list based drivers, depending on how the driver
> > > >  configures this functionality.
> > > >
> > > > +Also see
> > > > +:ref:`media_subdev_config_model_common_raw_sensor`.
> >
> > The line break doesn't seem necessary.
>
> I agree.
>
> >
> > > > +
> > > >  Freely configurable camera sensor drivers
> > > >  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > >
> > > > @@ -105,6 +108,8 @@ values programmed by the register sequences. The default values of these
> > > >  controls shall be 0 (disabled). Especially these controls shall not be inverted,
> > > >  independently of the sensor's mounting rotation.
> > > >
> > > > +.. _media_using_camera_sensor_drivers_embedded_data:
> > > > +
> > > >  Embedded data
> > > >  -------------
> > >
> > > [snip images]
> >
> > One day we should probably try to unify the look & feel of all diagrams
> > in the V4L2 documentation. One day :-)
>
> That day may or may not come. :-)
>
> >
> > > > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > index dcfcbd52490d..4d145bd3bd09 100644
> > > > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > @@ -838,3 +838,5 @@ stream while it may be possible to enable and disable the embedded data stream.
> > > >
> > > >  The embedded data format does not need to be configured on the sensor's pads as
> > > >  the format is dictated by the pixel data format in this case.
> > > > +
> > > > +.. include:: subdev-config-model.rst
> >
> > I think we should reorganize the documentation at some point. Things are
> > getting a bit too deep, with e.g. 4.13.5.1.2. That's for later.
> > Splitting the configuration model to a separate file as done in this
> > patch will be helpful.
> >
> > > > diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > > > new file mode 100644
> > > > index 000000000000..8ec801998f5f
> > > > --- /dev/null
> > > > +++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > > > @@ -0,0 +1,180 @@
> > > > +.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
> > > > +
> > > > +Sub-device configuration models
> > > > +===============================
> > > > +
> > > > +A sub-device configuration model specifies in detail what the user space can
> > > > +expect from a sub-device in terms of V4L2 sub-device interface support,
> > > > +including semantics specific to a given configuration model.
> > > > +
> > > > +A sub-device may implement more than one configuration model at the same
> > > > +time.
> >
> > I wonder how that would work. I assume that, with the control being
> > read-only, you don't envision userspace selecting a model at runtime,
> > but rather drivers implementing the union (or intersection ?) of
> > multiple models. Do you have use cases in mind, or is this only to
> > prepare for a hypothetical future where this could happen ?
>
> Let's suppose we would use configuration models to tell about other parts
> of the sub-device than just what pads, links and streams may be present. A
> number of things currently work implicitly, for instance whether a sensor
> frame time is configured through controls or a dedicated IOCTL. I'm not
> sure I'd add a configuration model for that exactly but something like that
> seems entirely reasonable. It'd be orthogonal to the common raw sensor
> model.
>
> >
> > > The implemented configuration models can be obtained from the sub-device's
> > > > +``V4L2_CID_CONFIG_MODEL`` control.
> > >
> > > Isn't a control an overkill ? Isn't enough to identify that a sensor produces
> > > RAW images and has an internal pad to the below description ?
> >
> > V4L2 has a set of low-level, generic interfaces such as pads (external
> > and internal), formats, selection rectangles, routes, and controls. We
> > have some documentation about how those should be used, with a
> > relatively generic model defined in the "Order of configuration and
> > format propagation" section of Documentation/userspace-api/media/v4l/dev-subdev.rst.
> > The different API elements are however mostly defined independently of
> > each other (very little is said about interactions between controls and
> > formats or selection rectangles for instance), and we don't document how
> > they should be mapped to device features. This results in different
> > drivers for similar devices using the API elements differently,
> > sometimes in ways that breach the documented API. Userspace ends up
> > implementing heuristics and pray that thing work.
> >
> > The whole idea behind configuration models is to avoid heuristics.
> > That's why we want an explicit API element to indicate what
> > configuration model a device supports, and document that model
> > explicitly in the kernel documentation.
> >
> > > Also, would it be the single sensor driver that has to correctly
> > > populate the control ?
> > >
> > > > +
> > > > +.. _media_subdev_config_model_common_raw_sensor:
> > > > +
> > > > +Common raw camera sensor model
> > > > +------------------------------
> > > > +
> > > > +The common raw camera sensor model defines the configurability of a superset
> >
> > A superset of what ? Reading the next sentence I suspect you mean that
> > this model defines a set of features that compliant subdevs have to use
> > as documented, but where some API elements could be left unused by a
> > driver if the corresponding device doesn't implement the corresponding
> > hardware feature. Clarifying this would be nice.
>
> The intent is to say not everything may be impelemented by the sensors but
> there may be simpler ways to do that. How about:
>
> The common raw camera sensor model defines a set of configuration options
> (formats, selections etc.) that cover the vast majority of funcitionality of raw
> camera sensors. Not all of the configuration and enumeration interfaces are
> offered by all drivers.
>
> >
> > > > +that covers the vast majority of raw camera sensors. Not all of the
> > > > +configuration and enumeration interfaces are offered by all drivers.
> > > > +
> > > > +A sub-device complies with the common raw sensor model if the
> > > > +``V4L2_CONFIG_MODEL_COMMON_RAW`` bit is set in the ``V4L2_CID_CONFIG_MODEL``
> > > > +control of the sub-device.
> > > > +
> > > > +The common raw camera sensor model is aligned with
> > > > +:ref:`media_using_camera_sensor_drivers`. Please refer to that regarding aspects
> > > > +not specified here.
> >
> > Could we write this to emphasize the fact that
> > media_using_camera_sensor_drivers defines concepts common to all camera
> > sensors, while the model here focusses on how drivers expose API
> > elements for this particular model ? "is aligned with" is a bit vague.
>
> I think I'll just keep a reference here and add such a note to the other
> file.
>
> >
> > > > +
> > > > +Each camera sensor implementing the common raw sensor model exposes a single
> > > > +V4L2 sub-device. The sub-device contains a single source pad (0) and two or more
> > > > +internal pads: an image data internal pad (1) and optionally an embedded data
> > > > +pad (2). Additionally, further internal pads may be supported for other
> > > > +features, in which case they are documented separately for the given device.
> > >
> > > That's pretty easy to identify from userspace without a control, isn't
> > > it ?
> >
> > See above.
> >
> > > > +
> > > > +This is show in :ref:`media_subdev_config_model_common_raw_sensor_subdev`.
> >
> > s/show/shown/
> >
> > Maybe
> >
> > This is show in the :ref:`media_subdev_config_model_common_raw_sensor_subdev`
> > figure.
> >
> >
> > Or is there a sphinx directive other than ref that would automate this ?
>
> As these will be links, I'd just keep it as-is. Adding the note on what the
> references are (figures, tables etc.) should be done separately from this,
> including numbering.
>
> >
> > > > +
> > > > +.. _media_subdev_config_model_common_raw_sensor_subdev:
> > > > +
> > > > +.. kernel-figure:: common-raw-sensor.svg
> > > > +    :alt:    common-raw-sensor.svg
> > > > +    :align:  center
> > > > +
> > > > +    **Common raw sensor sub-device**
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
> > >
> > > afaiu either the route is Static (cannot be changed) or it is not.
> > > What does Maybe means here ?
>
> It depends on the device.
>
> > >
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
> > > > +      - -
> >
> > This is interpreted as a list, translated to
> >
> > <ul class="simple">
> > <li></li>
> > </ul>
> >
> > and rendered as •
>
> The backslash was missing, I'll add one.
>
> >
> > > > +      - Embedded data
> > > > +
> > > > +Some devices may support enabling and disabling the embedded data stream. Others
> > > > +may not support it at all, in which case the embedded data route does not exist.
> >
> > "may not support it at all" can be interpreted as "maybe not support
> > enabling and disabling it at all", i.e. only support a static always
> > enabled route. Based on the last sentence that's not what you mean, it
> > could be reworded.
>
> How about:
>
> Some devices do not support the embedded data stream, others do support it and
> in some of the latter, it can be turned on and off before streaming is started.
>
> >
> > >
> > > Does the driver need to expose a routing table at all if it has a
> > > single, immutable image data stream ?
> >
> > I think it should. If there are internal pads, they should be an
> > internal routing table, at the very least for consistency. It will make
> > userspace simpler I believe (and we can check that statement with a
> > libcamera implementation :-)).
>
> I agree. The routing table does not only tell what's there, it also tells
> what's not.
>
> >
> > > > +
> > > > +Sensor pixel array size, cropping and binning
> > > > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > > +
> > >
> > > This is not something I was expecting here. We teach how to compute
> > > framerates for RAW sensors in camera-sensor.rst ("Using camera sensor
> > > drivers") specifying which controls a sensor driver should register and
> > > the expected controls units. It seems to me we define part of the expected
> > > interface exposed by a raw camera sensor there and part here. I wonder
> > > if camera-sensor.rst makes any sense at all if we define the "models"
> > > here.
> >
> > Good question. I find the split to be a bit artificial indeed, and it's
> > not clear where some of the parts should live. I think we still need a
> > document that explains concept common to raw sensors, regardless of the
> > model. We probably won't get the split entirely right on the first try,
> > and that's fine with me, we can refine it later.
>
> There are some aspects that are different from what is documented and
> implemented elsewhere, such as some of the selectiong rectangles.
>
> >
> > > > +The sensor's pixel array is divided into one or more areas. The areas around the
> > > > +edge of the pixel array, usually one one or more sides, may contain optical
> >
> > "one one" ?
>
> One one might be enough indeed.
>
> >
> > > > +black pixels, dummy pixels and other non-image pixels.
> > > > +
> > > > +A rectangle within the pixel area contains the visible pixels. Capturing the
> >
> > Above you wrote "pixel array", and here "pixel area".
>
> This should be pixel array, I'll fix it.
>
> >
> > > > +non-visible pixels may be supported by the sensor.
> > >
> > > This is a bit of simplification, as I presume there might be
> > > rectangles of visible pixels which overlap in the most advanced use
> > > cases.
> > > https://git.libcamera.org/libcamera/libcamera.git/tree/src/libcamera/property_ids_core.yaml#n594
> >
> > That's a more generic model. I'd like to see if there are sensors
> > implementing it. Sakari, does CCS support that ?
> >
> > This being said, we could restrict this subdev model to supporting only
> > sensors with a rectangular visible pixels area.
>
> The current frame format descriptors in CCS can't, I'm not sure if vendors
> might prefer to be able to do that. The CSI-2 long packets (lines) still
> need to be the same length.
>
> In practice the visible pixel areas are rectangular, at least in those
> sensor I've seen, so perhaps it's fine to indeed assume that.
>
> >
> > > > +
> > > > +The sensor can perform three operations that affect the output image size. First
> > > > +comes analogue crop. This configuration limits parts of the pixel array which
> > > > +the sensor will read, affecting sensor timing as well. The granularity of the
> > > > +analogue crop configuration varies greatly across sensors: some sensors support
> > > > +a few different analogue crop configurations whereas others may support anything
> > > > +divisible by a given number of pixels.
> > > > +
> > > > +The default analogue crop rectangle corresponds to the visible pixel area if
> > > > +supported by the hardware.
> > >
> > > In what sense "if supported by the hardware" ? Is this referring to
> > > the "visibile pixel area" ?
> >
> > I assume this means "if analogue crop is supported by the hardware".
> > This should be clarified.
>
> Yes, analogue crop is not supported by all sensors (nor drivers, even if
> the sensor does). I'd just do: s/if.*//.
>
> >
> > > > +
> > > > +In the next step, binning is performed on the image data read from camera
> > > > +sensor's pixel array. This will effectively result in an image smaller than the
> > > > +original by given proportions horizontally and vertically. Typical values are
> > >
> > > s/proportions/scaling factors/ ?
>
> How about "binning factors"?
>

ack

> > >
> > > > +1/2 and 1/3 but others may well be supported by the hardware as well.
> > > > +
> > > > +The combination of the analogue crop and binning operations may result in an
> > > > +image size that may be larger than desirable. For this purpose, a digital crop
> > >
> > > This is highly optional it seems.
> > >
> > > > +operation may be performed on the binned image. The resulting image size is
> > > > +further outputted by the sensor.
> >
> > s/outputted/output/ ? I think "outputted" is correct, but I believe it's
> > less common.
>
> Given how "put" inflects, it probably should be "output" indeed.
>
> >
> > > > +
> > > > +.. flat-table:: Selection targets on pads
> > > > +    :header-rows: 1
> > > > +
> > > > +    * - Pad/Stream
> > > > +      - Selection target/format
> > > > +      - Mandatory (X/-)
> > > > +      - Synopsis
> > >
> > > What about an R/W column ?
> > >
> > > > +    * - 1/0
> > > > +      - Format
> > > > +      - X
> > > > +      - Image data format. The width and height fields of this format are the
> > > > +        same than those for the V4L2_SEL_TGT_CROP_BOUNDS rectangle. The media
> > >
> > > Can sizes be changed at all ?
> >
> > For the internal image pad, I wouldn't think so. I think it should
> > expose the full readable array. Or, reading what you wrote below, do you
> > envision this including non-readable pixels too ?
>
> I don't -- they can't be accessed in any case. Timing information (such as
> the latching points) should probably be conveyed using a different API if
> they're needed.
>

Ok, what I was suggesting was to explicitly say those sizes are not
modifiable.

> >
> > Mapping pixel array definitions from datasheets to formats and selection
> > rectangles is hard, as datasheets, when they are available, are often
> > confusing. Datasheets from different vendors, or even for different
> > sensors of the same vendor, often have different models. I think we need
> > to be extra precise here, and possibly work with sensor vendors. Using
> > the CCS model as a base could be useful.
>
> I wouldn't necessarily try to convey what non-visiblepixels might be there,
> apart from in the documentation. These tend to be fairly vendor/sensor
> specific after all.
>

In the whole document, I would use one of "non-readable" and
"non-visible".

> >
> > > > +        bus code of this format reflects the native pixel depth of the sensor.
> > > > +    * - 1/0
> > > > +      - V4L2_SEL_TGT_NATIVE_SIZE
> > > > +      - X
> > > > +      - The full size of the pixel array, including all pixels in the pixel
> > > > +	array, even if they cannot be captured. This rectangle is relative to
> > > > +	the format on the same (pad, stream).
> >
> > Mix of tabs and spaces.
> >
> > What do you mean by "relative to the format on the same (pad, stream)" ?
> > Does it mean the rectangle is expressed relatively to a rectangle
> > defined as (0,0),(fmt.width x fmt.height) ? That doesn't seem to match
>
> Yes.
>
> > the description of the format and V4L2_SEL_TGT_CROP_BOUNDS, as the
> > format is defined as having the same width and height as
> > V4L2_SEL_TGT_CROP_BOUNDS, and V4L2_SEL_TGT_CROP_BOUNDS is defined as
> > being relative to V4L2_SEL_TGT_NATIVE_SIZE. I assume you mean something
> > else, it should be clarified.
>
> As discussed, I'll drop the NATIVE_SIZE rectangle from the documentation as
> redundant.
>

Doesn't it help reporting the full pixel array size (readable and non
readable pixels ?). We care about that information in libcamera
(also to comply with Android's requirement to expose the full pixel
array size as a property of the camera)

I would just drop the "relative" part. NATIVE is a rectangle with
top-left corner in position (0,0).

> >
> > > > +    * - 1/0
> > > > +      - V4L2_SEL_TGT_CROP_BOUNDS
> > > > +      - X
> > > > +      - The crop rectangle bounds. No pixels outside this area can be
> > >
> > > I would describe it as "the readable part of the full pixel array
> > > area" instead of repeating "crop rectangle bounds"
> >
> > Agreed. I would also explicitly state this can include black pixels. I
> > wonder if we should also define border pixels in this document.
>
> I wouldn't try to convey in APIs what qualities different non-visible
> pixels might have or where they are located, just that they're non-visible
> pixels.
>
> >
> > > > +        captured. This rectangle is relative to the V4L2_SEL_TGT_NATIVE_SIZE
> > >
> > > > +    * - 1/0
> > > > +      - V4L2_SEL_TGT_CROP_DEFAULT
> > > > +      - X
> > > > +      - The visible pixel area. This rectangle is relative to the
> > >
> > > Isn't this the default analogue crop rectangle ?
> >
> > I assume so, and it should be documented as such explicitly. Also, if
> > the default crop rectangle doesn't include some of the readable pixels,
>
> It does indeed say this is the "visible pixel area". I can elaborate this in
> the analogue crop documentation -- it's possible the sensor doesn't support
> capturing just visible pixels, even if it's unlikely.
>
> >
> > > > +        V4L2_SEL_TGT_NATIVE_SIZE rectangle on the same (pad, stream).
> > > > +    * - 1/0
> > > > +      - V4L2_SEL_TGT_CROP
> > > > +      - \-
> > > > +      - Analogue crop. Analogue crop typically has a coarse granularity. This
> > > > +        rectangle is relative to the V4L2_SEL_TGT_NATIVE_SIZE rectangle on the
> > > > +        same (pad, stream).
> > > > +    * - 1/0
> > > > +      - V4L2_SEL_TGT_COMPOSE
> > > > +      - \-
> > > > +      - Binning. This rectangle is relative to the V4L2_SEL_TGT_CROP
> > > > +        rectangle on the same (pad, stream).
> > >
> > > The size ratio between the V4L2_SEL_TGT_CROP and V4L2_SEL_TGT_COMPOSE
> > > rectangles selects the desired binning factor.
> > >
> > > > +    * - 2/0
> > > > +      - Format
> > > > +      - X
> > > > +      - Embedded data format.
> > > > +    * - 0/0
> > > > +      - V4L2_SEL_TGT_CROP
> > > > +      - \-
> > > > +      - Digital crop. This rectangle is relative to the V4L2_SEL_TGT_COMPOSE
> > > > +        rectangle on (pad, stream) pair 1/0.
> > > > +    * - 0/0
> > > > +      - Format
> > > > +      - X
> > > > +      - Image data source format. The width and height fields of the format are
> > > > +        the same than for the V4L2_SEL_TGT crop rectangle on (pad, stream) pair
> >
> > I think you meant "V4L2_SEL_TGT_CROP rectangle" here.
>
> Yes.
>
> >
> > > > +        0/0 where as the media bus code reflects the pixel data output of the
> > >
> > > s/where as/and ?
> > > Or maybe I didn't get what you mean
>
> And works here, yes.
>
> > >
> > > > +        sensor.
> > > > +    * - 0/1
> > > > +      - Format
> > > > +      - X
> > > > +      - Embedded data source format.
> >
> > I think we also need to consider skipping.
>
> I'll add sub-sampling in v2.
>
> >
> > > > +
> > > > +Embedded data
> > > > +^^^^^^^^^^^^^
> > > > +
> > > > +The embedded data stream is produced by the sensor when the corresponding route
> > > > +is enabled. The embedded data route may also be immutable or not exist at all,
> > > > +in case the sensor (or the driver) does not support it.
> > > > +
> > > > +Generally the sensor embedded data width is determined by the width of the image
> > > > +data whereas the number of lines are constant for the embedded data. The user
> > > > +space may obtain the size of the embedded data once the image data size on the
> > > > +source pad has been configured.
> > > > +
> > > > +Also see :ref:`media_using_camera_sensor_drivers_embedded_data`.
> > > > +
> >
>
> --
> Kind regards,
>
> Sakari Ailus

