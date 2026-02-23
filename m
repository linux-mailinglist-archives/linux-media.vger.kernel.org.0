Return-Path: <linux-media+bounces-53179-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEmpDGInnGl1AAQAu9opvQ
	(envelope-from <linux-media+bounces-53179-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 11:09:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8832D1749A8
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 11:09:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 810E93099145
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424EE357737;
	Mon, 23 Feb 2026 10:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MzDQ7+t3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE5B344056;
	Mon, 23 Feb 2026 10:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771841141; cv=none; b=qI46eUL9GtVDm1V/AkBZYPf5DTsY83f7qrszgwR6G+AP+5y+YVfk080WcCAOktfUDYIOHDZBt2cBknaWfpBC0uZGkk0yj2ruMh4ZSx2AZ7V1xgdDMXpcT6U7UsOmXJTepxOfa7k4dGefZw3Jd0/YNlRejEOeIYo1cnEmwC3qyRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771841141; c=relaxed/simple;
	bh=qidrYHU3Vf+rGyiGqxlgqSUImfZ6U11xnHASKgxAHxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fk+wyjK2GNUe92Z16AYfHE+jqYp0z9EsOz+wReeQqcQPlpqHwZxt3gNbgQz8upohLpb4bO0C9Pi3LKv1mU1h5Z0bTSGqH4FTu878NdKC5Yj/olDg/aRY946gHM9pectHwUq5dQA2csGMNW6X1Mt7lBc41JKyHjOVSLfNVot9yUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MzDQ7+t3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771841138; x=1803377138;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qidrYHU3Vf+rGyiGqxlgqSUImfZ6U11xnHASKgxAHxs=;
  b=MzDQ7+t3MbZCjIocKaG5YquJCJg0AdplIM6EVVGS+ywExGoNXHvwJNPO
   OpXJy6TFOWLqP5EOLqC6Zg71X5IHxty48vq/MxagaMV9GKDOsAn3rjvg8
   yTPxijV0HEPE5bK2Cqx+IPEhczpyNB/QplYiYccLH3GsKW4aaejFXB13T
   gQBoZPLa8XLOH3waaJtWtG1HNZmBGSVnla37OzysDfE9f4s/yYjKJn/Ou
   v60iASVU/ecnVITi5u5fLO8KoDW0b5ullsnyarGACV6CrefSS4yzRMCEf
   s6QbchwpvcxHpNkz3RxJ6dyK/gja6t5lg5AFJOXaJLKMx6uUjOXpT42vK
   w==;
X-CSE-ConnectionGUID: zTbiFcO5Ss+X2Bw/ltbpUg==
X-CSE-MsgGUID: 4mddijqbTEilHH2O65Pm5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72894635"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="72894635"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 02:05:37 -0800
X-CSE-ConnectionGUID: QWuMGGjSTHG2x9bChcoj9Q==
X-CSE-MsgGUID: 3RGmD75aTDe47aHZJJYcOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="213477169"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.225])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 02:05:36 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id CAF9F11F908;
	Mon, 23 Feb 2026 12:06:01 +0200 (EET)
Date: Mon, 23 Feb 2026 12:06:01 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: Re: [PATCH] media: Documentation: Fix frame interval calculation for
 raw camera sensors
Message-ID: <aZwmiYu-VZjQE2tE@kekkonen.localdomain>
References: <20260219-media-fps-docs-v1-1-0387c5c5368c@ideasonboard.com>
 <aZwQJZX6sjzLgVL4@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZwQJZX6sjzLgVL4@zed>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53179-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kekkonen.localdomain:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: 8832D1749A8
X-Rspamd-Action: no action

Hi Jacopo,

On Mon, Feb 23, 2026 at 10:11:02AM +0100, Jacopo Mondi wrote:
> Hi Jai
> 
> On Thu, Feb 19, 2026 at 01:20:50PM +0530, Jai Luthra wrote:
> > The previous frame interval formula used analogue crop dimensions. This
> > breaks down for some sensors when binning.
> >
> > For example in imx219 the minimum FLL (frame length in lines) can be
> > lower than the analogue crop height when binning, which would require a
> > negative VBLANK to represent the actual timing. Similarly, imx283 allows
> > a lower minimum HMAX (line length) when doing 2x2 or 3x3 binning than
> > the analogue crop width of the full resolution mode.
> >
> > The CCS specification also describes under section "8.2.6 Line Length
> > and Frame Length" how the horizontal and vertical readout minimums can
> > be different when binning.
> >
> > Replace the formula with the underlying hardware concepts of LLP (line
> > length in pixels) and FLL (frame length in lines). These terms were
> > chosen to match the CCS specification on raw sensors, as it is a cleaner
> > reference compared to a typical sensor vendor datasheet.
> >
> > Finally, define the blanking controls relative to the active pixel
> > readout (post-binning) rather than the analogue crop size. This matches
> > what most sensor drivers already do, and also what applications like
> > libcamera expect. In "Figure 42" of CCS specification too, we see a
> > similar definition:
> >
> >   frame interval = (output width + HBLANK) *
> >                    (output height + VBLANK) / pixel rate
> >
> > Also add a note in the "Writing camera sensor drivers" guide, to ensure
> > this formula is followed by new sensor drivers.
> 
> I agree that using the analogue crop rectangle sizes is not correct,
> however, with this new formulation the LLP and FLL values might be
> smaller than the crop rectangles reported through the selection API,
> which I'm not sure it's great from a consistency point of view ?
> 
> Also the below suggested formulation:
> 
>         LLP = active width + V4L2_CID_HBLANK
>         FLL = active height + V4L2_CID_VBLANK
> 
> Assumes the combined effect of [binning + subsampling] always directly
> affect the readout time of pixels on the pixel array. The CCS specs
> and driver seems to suggest that's not always the case ?
> 
> Do we need to distinguish between binning modes that affect the
> timings and binning modes that do not do that?

For existing (pre-common raw sensor model) drivers, I'd say "no". CCS and
common raw sensor model will use line length in pixels and frame length in
lines for this, which reflects what the hardware does.

Existing non-CCS drivers have used the format for this purpose and adjusted
the blanking values accordingly.

> 
> As we're going to introduce a control for binning to report the
> binning factor in the image dimension domain, should we introduce
> a control to specify the binning factor in the image timing domain ?
> 
>         LLP = (analog_crop_width + HBLANK) / binning_timing_h
>         FLL = (analog_crop_height + VBLANK) / binning_timing_v
>         frame_interval = LLP * FLL / pixel_rate
> 
> I'm not 100% sure this is correct however, as the blankings should be
> expressed on a different clock domain that the pixel sampling rate,
> but I guess this is a reasonable approximation ?

If binning is done in analogue domain, the above would hold, but sensor do
digital binning as well. The driver needs to adjust the blanking values
(and in the future frame length and line length values) to accommodate
this.

> 
> >
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> >  Documentation/driver-api/media/camera-sensor.rst   | 11 ++++
> >  .../userspace-api/media/drivers/camera-sensor.rst  | 59 +++++++++++++++-------
> >  2 files changed, 53 insertions(+), 17 deletions(-)
> >
> > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> > index 94bd1dae82d5c570b2d11c7faee20dd45d2f4be6..8dcac7551f54ac4ffa71173281ae3bbea331c036 100644
> > --- a/Documentation/driver-api/media/camera-sensor.rst
> > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > @@ -120,6 +120,17 @@ The function returns a non-zero value if it succeeded getting the power count or
> >  runtime PM was disabled, in either of which cases the driver may proceed to
> >  access the device.
> >
> > +Frame interval
> > +--------------
> > +
> > +If a sensor supports cropping or binning, it is the sensor driver's
> > +responsibility to ensure that the frame interval formula (see
> > +:ref:`media_using_camera_sensor_drivers`) remains valid regardless of the
> > +pipeline configuration. The driver shall adjust the minimum and maximum allowed
> > +values of ``V4L2_CID_HBLANK`` and ``V4L2_CID_VBLANK`` as needed when the mode
> > +changes, so that application developers can always rely on the same formula to
> > +calculate the frame interval.
> > +
> >  Rotation, orientation and flipping
> >  ----------------------------------
> >
> > diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > index 75fd9166383fdbb2dabdb6384ed0904c4e78a3c6..30dddea72a12da264fc9c30e37b561c762c09d29 100644
> > --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > @@ -49,35 +49,60 @@ depends on the type of the device.
> >  Raw camera sensors
> >  ~~~~~~~~~~~~~~~~~~
> >
> > -Instead of a high level parameter such as frame interval, the frame interval is
> > -a result of the configuration of a number of camera sensor implementation
> > -specific parameters. Luckily, these parameters tend to be the same for more or
> > -less all modern raw camera sensors.
> > +Instead of a high level parameter such as frame interval, the frame interval on
> > +a raw camera sensor is determined by a number of sensor-specific parameters.
> > +These parameters tend to be common across most modern raw camera sensors.
> >
> > -The frame interval is calculated using the following equation::
> > +The pixel array is the full grid of photosensitive elements on the sensor. A
> > +subregion of it is selected by the analogue crop. The cropped image may then be
> > +subject to binning (averaging of a NxN block) or subsampling which
> > +further reduce the image dimensions. The resulting image is then read out by
> > +the ADC (analogue-to-digital converter) line by line. After ADC readout,
> > +optional digital crop or scaling may further reduce the image dimensions, see
> > +:ref:`VIDIOC_SUBDEV_G_SELECTION <VIDIOC_SUBDEV_G_SELECTION>`.
> >
> > -	frame interval = (analogue crop width + horizontal blanking) *
> > -			 (analogue crop height + vertical blanking) / pixel rate
> > +The frame size is determined by two timing parameters: line length in pixels
> > +(LLP) and frame length in lines (FLL). These are fundamental sensor timing
> > +registers that control how fast the ADC reads out the image. They may go
> > +by different names for a particular sensor, like HMAX and VMAX, or HTOTAL and
> > +VTOTAL, or similar.
> >
> > -The formula is bus independent and is applicable for raw timing parameters on
> > -large variety of devices beyond camera sensors. Devices that have no analogue
> > -crop, use the full source image size, i.e. pixel array size.
> > +LLP is the total number of pixel clock cycles per line, including both the
> > +active readout width and horizontal blanking. FLL is the total number of lines
> > +per frame, including both the active readout height and vertical blanking.
> > +
> > +The frame interval is::
> > +
> > +        frame interval = LLP * FLL / pixel rate
> >
> >  Horizontal and vertical blanking are specified by ``V4L2_CID_HBLANK`` and
> >  ``V4L2_CID_VBLANK``, respectively. The unit of the ``V4L2_CID_HBLANK`` control
> >  is pixels and the unit of the ``V4L2_CID_VBLANK`` is lines. The pixel rate in
> > -the sensor's **pixel array** is specified by ``V4L2_CID_PIXEL_RATE`` in the same
> > -sub-device. The unit of that control is pixels per second.
> > +the sensor's **pixel array** is specified by ``V4L2_CID_PIXEL_RATE`` in the
> > +same sub-device. The unit of that control is pixels per second.
> > +
> > +The blanking is defined relative to the size of the image being sent out to the
> > +host over the bus (like CSI-2)::
> > +
> > +        LLP = active width + V4L2_CID_HBLANK
> > +        FLL = active height + V4L2_CID_VBLANK
> > +
> > +The driver shall set the minimum and maximum values of ``V4L2_CID_HBLANK`` and
> > +``V4L2_CID_VBLANK`` such that the resulting LLP and FLL values correspond to the
> > +range permitted by the sensor hardware for the current mode. Sensors that
> > +support binning often define a lower minimum for LLP or FLL registers, which
> > +can help achieve higher framerates when binning.
> > +
> > +Application developers can calculate the frame interval using the output
> > +dimensions and the blanking controls::
> > +
> > +        frame interval = (output width + horizontal blanking) *
> > +                         (output height + vertical blanking) / pixel rate
> >
> >  Register list-based drivers need to implement read-only sub-device nodes for the
> >  purpose. Devices that are not register list based need these to configure the
> >  device's internal processing pipeline.
> >
> > -The first entity in the linear pipeline is the pixel array. The pixel array may
> > -be followed by other entities that are there to allow configuring binning,
> > -skipping, scaling or digital crop, see :ref:`VIDIOC_SUBDEV_G_SELECTION
> > -<VIDIOC_SUBDEV_G_SELECTION>`.
> > -
> >  USB cameras etc. devices
> >  ~~~~~~~~~~~~~~~~~~~~~~~~
> >
> >
> > ---
> > base-commit: 956b9cbd7f156c8672dac94a00de3c6a0939c692
> > change-id: 20260219-media-fps-docs-fd1da722cc38
> >
> > Best regards,
> > --
> > Jai Luthra <jai.luthra@ideasonboard.com>
> >

-- 
Kind regards,

Sakari Ailus

