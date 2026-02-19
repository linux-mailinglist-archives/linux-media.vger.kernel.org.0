Return-Path: <linux-media+bounces-53084-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAc7FQTdlmlJpgIAu9opvQ
	(envelope-from <linux-media+bounces-53084-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 10:51:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF3215D892
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 10:50:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5EB83028B36
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 09:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 590D930F921;
	Thu, 19 Feb 2026 09:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iB7PeTKH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4795586277;
	Thu, 19 Feb 2026 09:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771494651; cv=none; b=HwO6vhyQfTpvyIhQq1Wbyb2ZKvSsZpNlWDdLvsQQkId6X5Z4KQqjTGQQ378Pg7cqNRj1pjaCNvehzadi8mOIMjIgoUrB2p/eBmiVJlIOcpnJkFvChKll6x+jFB+iRYmyfHaS5B1QRTQ055W2aIreVyb7sefqCOoYKyNcMMoCFLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771494651; c=relaxed/simple;
	bh=2HPvPG7gUfSMXcUNKW1IQzveLKP+KB8qKCGmfKOYODQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r0d2L1SQqiMivsD9cFNNebxBFj6Lv0lliy8+SmeU9fA7tIQ5df8tvQKjZx2uMdER/Y8UbXn3p1rDYbyo5aRhOFF+uZFPjHph5UvT+r/ipLbMqdVfZDFF+CKrB33kgTeh26JPR645duVXWXS2VGNcN2htrZlbN8Dum80o3FiHTnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iB7PeTKH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771494651; x=1803030651;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2HPvPG7gUfSMXcUNKW1IQzveLKP+KB8qKCGmfKOYODQ=;
  b=iB7PeTKHfQ4ulOjWSeJHrgrcl5ZIoYPKWxRRsKz65BbDpep7GwkSn1xH
   uZFlNXnWxMaXJs1J1cx+MATaV6tepztccrb9a85y1FQ5GZ3uZiWK2EyEv
   piWKMi1OdSH6ci9dbtsDtyBcT15DIPVUfKgfKHQm7sppgbpYWSv3BKZo5
   BTd6B3LSK39di/uECuIXPYHIDvEJ0pZJ6WkG5B1UsThflnlhcCRtMlIid
   KSAhNqRuWGpGcPtJuoTsXE53HYflXpMMls3TuPSr36G8dDcOAJIk1H5Ae
   U6eQ2/0d+HJo2jXhNZZP2Du1t4+RtcZXMrQze2rnHLSLZ1M1KYW+bThwt
   Q==;
X-CSE-ConnectionGUID: yVZ4YPczRdy3A0RCmo9LJw==
X-CSE-MsgGUID: G32061oWROCm616VMybxEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="83680543"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="83680543"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 01:50:50 -0800
X-CSE-ConnectionGUID: oQuW/fDpQqS4wePqejyxDg==
X-CSE-MsgGUID: qVnbfRluS7K69jZeGjQvOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="213707254"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.130])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 01:50:48 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DFE0C11F908;
	Thu, 19 Feb 2026 11:51:10 +0200 (EET)
Date: Thu, 19 Feb 2026 11:51:10 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: Documentation: Fix frame interval calculation for
 raw camera sensors
Message-ID: <aZbdDqjogHqRvQYY@kekkonen.localdomain>
References: <20260219-media-fps-docs-v1-1-0387c5c5368c@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219-media-fps-docs-v1-1-0387c5c5368c@ideasonboard.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53084-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 9AF3215D892
X-Rspamd-Action: no action

Hi Jai,

Thanks for the patch.

On Thu, Feb 19, 2026 at 01:20:50PM +0530, Jai Luthra wrote:
> The previous frame interval formula used analogue crop dimensions. This
> breaks down for some sensors when binning.
> 
> For example in imx219 the minimum FLL (frame length in lines) can be
> lower than the analogue crop height when binning, which would require a
> negative VBLANK to represent the actual timing. Similarly, imx283 allows
> a lower minimum HMAX (line length) when doing 2x2 or 3x3 binning than
> the analogue crop width of the full resolution mode.

V4L2 integer controls are signed so using negative numbers is a non-issue.
CCS already does this in some cases actually.

> 
> The CCS specification also describes under section "8.2.6 Line Length
> and Frame Length" how the horizontal and vertical readout minimums can
> be different when binning.
> 
> Replace the formula with the underlying hardware concepts of LLP (line
> length in pixels) and FLL (frame length in lines). These terms were
> chosen to match the CCS specification on raw sensors, as it is a cleaner
> reference compared to a typical sensor vendor datasheet.
> 
> Finally, define the blanking controls relative to the active pixel
> readout (post-binning) rather than the analogue crop size. This matches
> what most sensor drivers already do, and also what applications like
> libcamera expect. In "Figure 42" of CCS specification too, we see a
> similar definition:
> 
>   frame interval = (output width + HBLANK) *
>                    (output height + VBLANK) / pixel rate
> 
> Also add a note in the "Writing camera sensor drivers" guide, to ensure
> this formula is followed by new sensor drivers.

We're about to require implementing the common raw sensor model soon by
essentially all new drivers so documenting the soon-to-be-obsolete state
has limited benefits.

But the UAPI documentation remains relevant for quite some time, please see
my comments below.

> 
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  Documentation/driver-api/media/camera-sensor.rst   | 11 ++++
>  .../userspace-api/media/drivers/camera-sensor.rst  | 59 +++++++++++++++-------
>  2 files changed, 53 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> index 94bd1dae82d5c570b2d11c7faee20dd45d2f4be6..8dcac7551f54ac4ffa71173281ae3bbea331c036 100644
> --- a/Documentation/driver-api/media/camera-sensor.rst
> +++ b/Documentation/driver-api/media/camera-sensor.rst
> @@ -120,6 +120,17 @@ The function returns a non-zero value if it succeeded getting the power count or
>  runtime PM was disabled, in either of which cases the driver may proceed to
>  access the device.
>  
> +Frame interval
> +--------------
> +
> +If a sensor supports cropping or binning, it is the sensor driver's
> +responsibility to ensure that the frame interval formula (see
> +:ref:`media_using_camera_sensor_drivers`) remains valid regardless of the
> +pipeline configuration. The driver shall adjust the minimum and maximum allowed
> +values of ``V4L2_CID_HBLANK`` and ``V4L2_CID_VBLANK`` as needed when the mode
> +changes, so that application developers can always rely on the same formula to
> +calculate the frame interval.
> +
>  Rotation, orientation and flipping
>  ----------------------------------
>  
> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> index 75fd9166383fdbb2dabdb6384ed0904c4e78a3c6..30dddea72a12da264fc9c30e37b561c762c09d29 100644
> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> @@ -49,35 +49,60 @@ depends on the type of the device.
>  Raw camera sensors
>  ~~~~~~~~~~~~~~~~~~
>  
> -Instead of a high level parameter such as frame interval, the frame interval is
> -a result of the configuration of a number of camera sensor implementation
> -specific parameters. Luckily, these parameters tend to be the same for more or
> -less all modern raw camera sensors.
> +Instead of a high level parameter such as frame interval, the frame interval on
> +a raw camera sensor is determined by a number of sensor-specific parameters.
> +These parameters tend to be common across most modern raw camera sensors.
>  
> -The frame interval is calculated using the following equation::
> +The pixel array is the full grid of photosensitive elements on the sensor. A

s/sensor/camera sensor/

> +subregion of it is selected by the analogue crop. The cropped image may then be
> +subject to binning (averaging of a NxN block) or subsampling which
> +further reduce the image dimensions. The resulting image is then read out by
> +the ADC (analogue-to-digital converter) line by line. After ADC readout,
> +optional digital crop or scaling may further reduce the image dimensions, see
> +:ref:`VIDIOC_SUBDEV_G_SELECTION <VIDIOC_SUBDEV_G_SELECTION>`.
>  
> -	frame interval = (analogue crop width + horizontal blanking) *
> -			 (analogue crop height + vertical blanking) / pixel rate
> +The frame size is determined by two timing parameters: line length in pixels
> +(LLP) and frame length in lines (FLL). These are fundamental sensor timing
> +registers that control how fast the ADC reads out the image. They may go
> +by different names for a particular sensor, like HMAX and VMAX, or HTOTAL and
> +VTOTAL, or similar.
>  
> -The formula is bus independent and is applicable for raw timing parameters on
> -large variety of devices beyond camera sensors. Devices that have no analogue
> -crop, use the full source image size, i.e. pixel array size.
> +LLP is the total number of pixel clock cycles per line, including both the
> +active readout width and horizontal blanking. FLL is the total number of lines
> +per frame, including both the active readout height and vertical blanking.
> +
> +The frame interval is::
> +
> +        frame interval = LLP * FLL / pixel rate

How would this look like if you spell out LLP and FLL? The rest aren't
abbreviated either.

>  
>  Horizontal and vertical blanking are specified by ``V4L2_CID_HBLANK`` and
>  ``V4L2_CID_VBLANK``, respectively. The unit of the ``V4L2_CID_HBLANK`` control
>  is pixels and the unit of the ``V4L2_CID_VBLANK`` is lines. The pixel rate in
> -the sensor's **pixel array** is specified by ``V4L2_CID_PIXEL_RATE`` in the same
> -sub-device. The unit of that control is pixels per second.
> +the sensor's **pixel array** is specified by ``V4L2_CID_PIXEL_RATE`` in the
> +same sub-device. The unit of that control is pixels per second.
> +
> +The blanking is defined relative to the size of the image being sent out to the
> +host over the bus (like CSI-2)::
> +
> +        LLP = active width + V4L2_CID_HBLANK
> +        FLL = active height + V4L2_CID_VBLANK
> +
> +The driver shall set the minimum and maximum values of ``V4L2_CID_HBLANK`` and
> +``V4L2_CID_VBLANK`` such that the resulting LLP and FLL values correspond to the
> +range permitted by the sensor hardware for the current mode. Sensors that
> +support binning often define a lower minimum for LLP or FLL registers, which
> +can help achieve higher framerates when binning.
> +
> +Application developers can calculate the frame interval using the output
> +dimensions and the blanking controls::
> +
> +        frame interval = (output width + horizontal blanking) *
> +                         (output height + vertical blanking) / pixel rate

This is indeed what many presumably non-CCS sensor drivers implement. Are
there any that would use the crop rectangle (the imx219 doesn't seem to)?
For user space variance in this area is of course bad.

The common raw sensor model introduces two new controls for the purpose so
we could re-purpose the old VBLANK/HBLANK controls for this -- apart from
the CCS driver.

>  
>  Register list-based drivers need to implement read-only sub-device nodes for the
>  purpose. Devices that are not register list based need these to configure the
>  device's internal processing pipeline.
>  
> -The first entity in the linear pipeline is the pixel array. The pixel array may
> -be followed by other entities that are there to allow configuring binning,
> -skipping, scaling or digital crop, see :ref:`VIDIOC_SUBDEV_G_SELECTION
> -<VIDIOC_SUBDEV_G_SELECTION>`.
> -
>  USB cameras etc. devices
>  ~~~~~~~~~~~~~~~~~~~~~~~~
>  
> 
> ---
> base-commit: 956b9cbd7f156c8672dac94a00de3c6a0939c692
> change-id: 20260219-media-fps-docs-fd1da722cc38
> 
> Best regards,

-- 
Kind regards,

Sakari Ailus

