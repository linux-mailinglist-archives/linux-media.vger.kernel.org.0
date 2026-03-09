Return-Path: <linux-media+bounces-54975-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BlRF67+rmkxLQIAu9opvQ
	(envelope-from <linux-media+bounces-54975-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 18:09:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCC023D5FE
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 18:09:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 203B231087DE
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 17:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25BF8292B2E;
	Mon,  9 Mar 2026 17:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WF12R8qV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E9828A72B;
	Mon,  9 Mar 2026 17:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075759; cv=none; b=HgTWwo3+d2pyPFRXo+iUJxF/O6JK8N6NVS0W6t9EfmWGkMQJumDWUwrjYyN+xrGO2rKRZpa3EhGjGZWK0O7jAJryl9nmr3Vzblwx3adO+qcNgvjRg1cIlFMmTC2NHAOmsbMw+xR20KVU+GfGBVVdSlEHkS4iTTZ2riMZORmynQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075759; c=relaxed/simple;
	bh=D4dnaetgojBNyQPDNlvEp0wzXXp3bure5gGdOoj7FR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJcFSjyQZQZRmTLKfBmJecDHTOr4rf1PcGgkjLJCkJuuA9i1gDELn1cQSd88IJQ51i49P2pNYMnpzFJUiBlA8Y/NlQKxoFsvWl1qPq5nmU67n1ftArbTR25QRcmTfIF5Q68bX2g54Kf79kQcFdApa0mG/SBICSVFkHkBeB1+Vv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WF12R8qV; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773075758; x=1804611758;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D4dnaetgojBNyQPDNlvEp0wzXXp3bure5gGdOoj7FR4=;
  b=WF12R8qVA5HFX57lG+80NwxA4vkXTl0z3I5SaGKfiMPVe/MG8emzqDn+
   ZIRzPWgpEO8K7fQUfqjvDYWoc2s48Zrh57PfPlpXX4IvBAP4U7n+H9qnw
   T8IKoYEYO8cniTDGGwvPirq+tGAls3kTAZ6SwwvjOFRvDw1WlhFhvZqM0
   9b1rl+1QmSKxI67YiSDOynisluu6hK4XME+oqEj+jFDrJ2Djr4D28F29T
   vKfGbV1ZbXf9OHRtox2ziqt4LQ7kocMcPSWdtBwgWRLUGhj6sTwrOVSKL
   WfQRIJiTxHg78yaUeRYPhIXqLGEKQBfQ6uD7N7xJPA7GxlRkSmaMABbJ0
   g==;
X-CSE-ConnectionGUID: kcudpS0GRV6wDErayqi7Ow==
X-CSE-MsgGUID: UbdoIC0RRoy3tuw0jYwYFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="76712338"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="76712338"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 10:02:37 -0700
X-CSE-ConnectionGUID: apCgbU5oT2mchTurXo6Jpg==
X-CSE-MsgGUID: XXs+QIKWSSmbBaSUJOCtYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="219789955"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.245.232])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 10:02:35 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 45477121D1F;
	Mon, 09 Mar 2026 19:03:06 +0200 (EET)
Date: Mon, 9 Mar 2026 19:03:06 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: Documentation: Fix frame interval calculation
 for raw camera sensors
Message-ID: <aa79SoBikANsqBax@kekkonen.localdomain>
References: <20260225-media-fps-docs-v2-1-5cb222d41e4d@ideasonboard.com>
 <aarNI_4ghaZme-PT@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aarNI_4ghaZme-PT@zed>
X-Rspamd-Queue-Id: EDCC023D5FE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54975-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Jacopo,

On Fri, Mar 06, 2026 at 02:02:58PM +0100, Jacopo Mondi wrote:
> Hi Jai,
> 
> On Wed, Feb 25, 2026 at 02:19:35PM +0530, Jai Luthra wrote:
> > The previous frame interval formula used analogue crop dimensions. This
> > diverges from what most non-CCS camera sensor drivers do and what most
> > applications expect.
> >
> > The CCS specification describes under section "8.2.6 Line Length and
> > Frame Length" how the horizontal and vertical readout minimums can be
> > different when binning.
> >
> > We see the same thing in non-CCS sensor drivers, for example in imx219
> > the minimum FLL (frame length in lines) can be lower than the analogue
> > crop height when doing 2x2 or 4x4 binning. Similarly in imx283 HMAX
> > (line length) can be lower compared to the analogue crop width when
> > doing 2x2 or 3x3 binning.
> >
> > While the CCS driver defines the HBLANK/VBLANK controls with respect to
> > the analogue crop rectangle, with possibly negative values for blanking,
> > most other raw sensor drivers instead define them with respect to the
> > output dimensions (format defined on the source pad) sent on the bus.
> 
> Sakari: are negative blankins the way CCS is intended to be operated
> when LLP/FLL are smaller than the analog crop ?

Yes. The formula is rather simple.

> 
> >
> > So fix the frame interval calculation described in the documentation to
> > match the reality of existing drivers, separating out the CCS and
> > non-CCS cases. In future, with the common raw sensor model, this may
> > need further updates.
> >
> > While at it, also clarify the order of operations in the sensor pipeline
> > and give the "hardware" definition for frame interval using LLP (line
> > length in pixels) and FLL (frame length in lines) before the messy
> > definitions that use blanking controls.
> >
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> > Changes in v2:
> > - Use reStructureText note box for describing the
> >   HBLANK/VBLANK/PIXEL_RATE controls
> > - Document the blanking formula for both CCS and non-CCS raw
> >   sensor drivers
> > - Drop driver-api documentation as common raw sensor model is coming
> >   soon
> > - Link to v1: https://lore.kernel.org/r/20260219-media-fps-docs-v1-1-0387c5c5368c@ideasonboard.com
> > ---
> >  .../userspace-api/media/drivers/camera-sensor.rst  | 80 ++++++++++++++++------
> >  1 file changed, 58 insertions(+), 22 deletions(-)
> >
> > diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > index 75fd9166383fdbb2dabdb6384ed0904c4e78a3c6..e41ed4616593735bf78b73c2ed34b016ab46c783 100644
> > --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > @@ -49,34 +49,70 @@ depends on the type of the device.
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
> > +The pixel array is the full grid of photosensitive elements on the camera
> > +sensor. A subregion of it is selected by the analogue crop. The cropped image
> > +may then be subject to binning (averaging of a NxN block) and subsampling which
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
> 
> nitpicking: I would slightly change this to:
> 
> The frame duration is determined by two timing parameters: line length in pixels
> (LLP) and frame length in lines (FLL). These are fundamental sensor timing
> parameters that control how fast the image is read out.
> 
> 
> > +by different names for a particular sensor, like HMAX and VMAX, or HTOTAL and
> > +VTOTAL, or similar.
> >
> > -The formula is bus independent and is applicable for raw timing parameters on
> > -large variety of devices beyond camera sensors. Devices that have no analogue
> > -crop, use the full source image size, i.e. pixel array size.
> > +LLP is the total number of pixel clock cycles per line, including both the
> > +active readout width and horizontal blanking. FLL is the total number of lines
> > +per frame, including both the active readout height and vertical blanking.
> >
> > -Horizontal and vertical blanking are specified by ``V4L2_CID_HBLANK`` and
> > -``V4L2_CID_VBLANK``, respectively. The unit of the ``V4L2_CID_HBLANK`` control
> > -is pixels and the unit of the ``V4L2_CID_VBLANK`` is lines. The pixel rate in
> > -the sensor's **pixel array** is specified by ``V4L2_CID_PIXEL_RATE`` in the same
> > -sub-device. The unit of that control is pixels per second.
> > +The frame interval is::
> >
> > -Register list-based drivers need to implement read-only sub-device nodes for the
> > -purpose. Devices that are not register list based need these to configure the
> > -device's internal processing pipeline.
> > +        frame interval = (line length in pixels) *
> > +                         (frame length in lines) / pixel rate
> >
> > -The first entity in the linear pipeline is the pixel array. The pixel array may
> > -be followed by other entities that are there to allow configuring binning,
> > -skipping, scaling or digital crop, see :ref:`VIDIOC_SUBDEV_G_SELECTION
> > -<VIDIOC_SUBDEV_G_SELECTION>`.
> > +Application developers can calculate the frame interval using the pixel rate
> > +and blanking controls, relative to the reference rectangle used by the sensor
> > +driver::
> > +
> > +        frame interval = (width + horizontal blanking) *
> > +                         (height + vertical blanking) / pixel rate
> 
> As you below provides definitions for LLP and FLL in the CCS and
> non-CCS case, should we use:
> 
>         frame interval = LLP * FFL / pixel rate
> 
> ?
> 
> > +
> > +.. note::
> > +
> > +        Horizontal and vertical blanking are specified by ``V4L2_CID_HBLANK``
> > +        and ``V4L2_CID_VBLANK``, respectively. The unit of the
> > +        ``V4L2_CID_HBLANK`` control is pixels and the unit of the
> > +        ``V4L2_CID_VBLANK`` is lines. The pixel rate in the sensor's **pixel
> > +        array** is specified by ``V4L2_CID_PIXEL_RATE`` in the same sub-device.
> > +        The unit of that control is pixels per second.
> 
> Should we link to those control definitions ?
> 
> > +
> > +        Drivers need to implement sub-device nodes that expose these controls.
> > +        They can be read-only or configurable depending on the device.
> > +
> > +        For non-CCS sensors, the blanking is defined relative to the size of
> > +        the image being sent out to the host over the bus (source pad format)::
> > +
> > +                LLP = output width + horizontal blanking
> > +                FLL = output height + vertical blanking
> > +
> > +        For CCS-compliant raw sensors (that use the CCS driver), the blanking
> > +        controls are defined relative to the analogue crop rectangle::
> > +
> > +                LLP = analogue crop width + horizontal blanking
> > +                FLL = analogue crop height + vertical blanking
> > +
> > +Sensors may achieve higher framerates by allowing lower minimums for line and
> > +frame length when binning or subsampling is enabled.
> 
> I think what you mean here is that sensors can have different
> HBLANK/VBLANK min/max when binning is in use ?
> 
> In that case I would say
> 
> Sensors may allow lower minimums for line and frame length when
> binning or subsampling is enabled.
> 
> 
> > +
> > +The driver shall set the minimum and maximum values of the blanking controls
> 
> and here use "update" instead of "set" to convey that when
> binning/subsampling is in use the blankings valid range could be
> changed if the sensor supports that.
> 
> > +such that the resulting LLP and FLL reigsters are programmed within the range
> > +permitted by the sensor hardware for the current mode.
> 
> Nits apart the patch looks like a good clarification to me.
> 
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> Sakari, I understand you're planning to introduce LLP/FLL controls in
> the generic line-based metadata series.
> 
> Should we take this patch in that series or can this be fast-tracked ?
> I'm asking because if you plan to introduce those controls it might be
> worth mentioning them in this patch from the very beginning.

I think we could merge it before the series; there are few conflicts with
it, too.

-- 
Sakari Ailus

