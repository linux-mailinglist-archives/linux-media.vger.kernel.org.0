Return-Path: <linux-media+bounces-42890-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B80AB8F22E
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 08:25:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A11A57A9449
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 06:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 617702ED164;
	Mon, 22 Sep 2025 06:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LcS4L6aK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87D0243374;
	Mon, 22 Sep 2025 06:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758522255; cv=none; b=hivL61U0lvg+Dh66DKPnHeE8MAhof0MeKIFhxjdFexGM9EHCfLamUy/QHTBrCAQ+roR59MzC3U/AHty57b8d1t35gyAtVz+rpiph9acVsdLRvdLeM1/au/ZNqlsoQm7ZEUhZFWBg8INTN2qAjB9Bi66h3gC4bPqOzzlmuQQiFa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758522255; c=relaxed/simple;
	bh=ItzcklpR0VEI3W2fs8IVOzcdzh9vl6FK1hexHboE1Ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JAD+wnDUeRxAextVA/w6n1tWtDv7xlINki1JgO32ALnleFP8O15mKxvMIj5XwJhKBEttok3XhGmb8L4HI2sP/X2teL76KQYsla86vA3oUKC8wHPPti+q99DLrPjYu5b5x9CLcWjkeJLI7RbnI9gh65BIGreBOB4Ox+T/gf3BAno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LcS4L6aK; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758522254; x=1790058254;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ItzcklpR0VEI3W2fs8IVOzcdzh9vl6FK1hexHboE1Ck=;
  b=LcS4L6aKKF+65EXqKDTA0RlWdCtXmUX1P6xA7W/CZO/cBuHvh9rJumOb
   Mu9OgsBX7FsCHhV/3MesgwCsUCeM59zovu0AhmdEtylvRCFqEDFehlIWf
   MtT+qOy07FykMdroycCclUxDIIBmrAnVwpuoHj8V3DgbWywUL5Vifa1H6
   fhpIIWK+aHW3ySseMWiqRvtTmSRQuBzBUYzDmhGvVscF9Kqd3pX+XdKLK
   hHDjuFpLu1qwWO1Gpg4pgH7AhG0tgN9fKbHoN53XSnhogDCHU4QuZW9y3
   gpfecadJDJ7zEBIgV9qFCEidA8AYTXfJiJomFJiRBTGkmZMJGPoTHJ3mR
   A==;
X-CSE-ConnectionGUID: 9SlGhMczRH2agNRUtDlq0Q==
X-CSE-MsgGUID: Tu6RabkMQQiccy5y+0zyOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60833837"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60833837"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 23:24:13 -0700
X-CSE-ConnectionGUID: Eg0xHE8hQKCggUhFi/aITQ==
X-CSE-MsgGUID: aUR+PvcVRmKqFRgI5cT0QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; 
   d="scan'208";a="200109407"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.61])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 23:24:09 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5BFAD11F982;
	Mon, 22 Sep 2025 09:24:06 +0300 (EEST)
Date: Mon, 22 Sep 2025 09:24:06 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Du, Bin" <bin.du@amd.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	mchehab@kernel.org, hverkuil@xs4all.nl, bryan.odonoghue@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com,
	Mario Limonciello <mario.limonciello@amd.com>, Richard.Gong@amd.com,
	anson.tsao@amd.com
Subject: Re: [PATCH v2 8/8] Documentation: add documentation of AMD isp 4
 driver
Message-ID: <aNDrhlLL3UpfyBpV@kekkonen.localdomain>
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-9-Bin.Du@amd.com>
 <20250805113719.GF24627@pendragon.ideasonboard.com>
 <e614b565-81e0-49c0-93dc-af1936462728@amd.com>
 <aKXC0Q4IiKmkjoSH@kekkonen.localdomain>
 <63949b3b-ca2d-42aa-bc8d-43f2952d307a@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63949b3b-ca2d-42aa-bc8d-43f2952d307a@amd.com>

Hi Bin,

On Fri, Aug 22, 2025 at 10:20:01AM +0800, Du, Bin wrote:
> Many thanks Sakari Ailus for your deep insight
> 
> On 8/20/2025 8:42 PM, Sakari Ailus wrote:
> > Hi Bin,
> > 
> > On Tue, Aug 12, 2025 at 09:36:04AM +0800, Du, Bin wrote:
> > > Many thanks Laurent Pinchart for the review.
> > > 
> > > On 8/5/2025 7:37 PM, Laurent Pinchart wrote:
> > > > On Wed, Jun 18, 2025 at 05:19:59PM +0800, Bin Du wrote:
> > > > > Add documentation for AMD isp 4 and describe the main components
> > > > > 
> > > > > Signed-off-by: Bin Du <Bin.Du@amd.com>
> > > > > Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> > > > > ---
> > > > >    Documentation/admin-guide/media/amdisp4-1.rst | 64 +++++++++++++++++++
> > > > >    Documentation/admin-guide/media/amdisp4.dot   |  8 +++
> > > > >    MAINTAINERS                                   |  2 +
> > > > >    3 files changed, 74 insertions(+)
> > > > >    create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
> > > > >    create mode 100644 Documentation/admin-guide/media/amdisp4.dot
> > > > > 
> > > > > diff --git a/Documentation/admin-guide/media/amdisp4-1.rst b/Documentation/admin-guide/media/amdisp4-1.rst
> > > > > new file mode 100644
> > > > > index 000000000000..417b15af689a
> > > > > --- /dev/null
> > > > > +++ b/Documentation/admin-guide/media/amdisp4-1.rst
> > > > > @@ -0,0 +1,64 @@
> > > > > +.. SPDX-License-Identifier: GPL-2.0
> > > > > +
> > > > > +.. include:: <isonum.txt>
> > > > > +
> > > > > +====================================
> > > > > +AMD Image Signal Processor (amdisp4)
> > > > > +====================================
> > > > > +
> > > > > +Introduction
> > > > > +============
> > > > > +
> > > > > +This file documents the driver for the AMD ISP4 that is part of
> > > > > +AMD Ryzen AI Max 385 SoC.
> > > > > +
> > > > > +The driver is located under drivers/media/platform/amd/isp4 and uses
> > > > > +the Media-Controller API.
> > > > > +
> > > > > +Topology
> > > > > +========
> > > > > +
> > > > > +.. _amdisp4_topology_graph:
> > > > > +
> > > > > +.. kernel-figure:: amdisp4.dot
> > > > > +     :alt:   Diagram of the media pipeline topology
> > > > > +     :align: center
> > > > > +
> > > > > +
> > > > > +
> > > > > +The driver has 1 sub-device:
> > > > > +
> > > > > +- isp: used to resize and process bayer raw frames in to yuv.
> > > > > +
> > > > > +The driver has 1 video device:
> > > > > +
> > > > > +- <capture video device: capture device for retrieving images.
> > > > > +
> > > > > +
> > > > > +  - ISP4 Image Signal Processing Subdevice Node
> > > > > +-----------------------------------------------
> > > > > +
> > > > > +The isp4 is represented as a single V4L2 subdev, the sub-device does not
> > > > > +provide interface to the user space.
> > > > 
> > > > Doesn't it ? The driver sets the V4L2_SUBDEV_FL_HAS_DEVNODE flag for the
> > > > subdev, and calls v4l2_device_register_subdev_nodes().
> > > > 
> > > 
> > > We have exported subdev device to user space during the testing with
> > > libcamera sample pipeline.
> > > 
> > > > As far as I understand, the camera is exposed by the firmware with a
> > > > webcam-like interface. We need to better understand your plans with this
> > > > driver. If everything is handled by the firmware, why are the sensor and
> > > > subdev exposed to userspace ? Why can't you expose a single video
> > > > capture device, with a media device, and handle everything behind the
> > > > scene ? I assume there may be more features coming later. Please
> > > > document the plan, we can't provide feedback on the architecture
> > > > otherwise.
> > > > 
> > > 
> > > Currently, isp fw is controlling the sensor to update just the exposure and
> > > gain, since the 3A algorithms run on ISP HW rather than on x86. In a future
> > > version, we plan to introduce raw output support in the ISP driver, allowing
> > > users to choose between AMD’s 3A running on ISP hardware or a custom 3A
> > > running on x86. If the user opts for the x86-based 3A, the firmware will
> > > relinquish control of the sensor, and hands over full control to the x86
> > > system.
> > 
> > There are a few problems I see with this approach.
> > 
> > Camera sensors are separate devices from the ISP and they're expected to be
> > controlled by the respective camera sensor drivers and these drivers only.
> > The firmware contains the camera control algorithms as well as tuning; this
> > is something that's better located outside of it.
> > 
> > The complex camera system comprising of a camera sensor, an ISP and a
> > microcontroller within you have is right now semi-integrated to the SoC and
> > I think it needs to be either fully unintegrated (the ISPs we currently
> > support) or fully integrated (e.g. UVC webcams).
> > 
> > There are two options that I can see here, in descending order of
> > preference:
> > 
> > 1. Control the ISP processing blocks from the AMD ISP driver, via a
> >     documented UAPI. This includes setting processing block parameters and
> >     being able to obtain statistics from the ISP. This is aligned with the
> >     other currently supported ISP drivers.
> >     This option could include support for the CSI-2 receiver only, with the
> >     processing taking place in SoftISP. Fully supported ISP would of course
> >     be preferred.
> >     Right now I don't have an opinion on whether or not this needs to
> >     include libcamera support, but the ISP driver wouldn't be of much use
> >     without that anyway.
> > 
> > 2. Move sensor control to firmware and make the AMD ISP driver expose an
> >     interface that looks like a webcam, akin to the UVC driver. In this case
> >     there's also no use for the sensor driver you've posted earlier.
> >     Overall, the ISP/sensor combination will probably be limited to use as a
> >     webcam in this case.
> > 
> 
> Based on our internal discussion and validation, will make option 2 as our
> current upstream target, after that, will plan option 1 with more
> considerations, a. Whether to provide the capability and interface so user
> can do switch between option 1 and 2. b. Whether and how to expose interface
> so host can leverage the ISP HW feature to accelerat some processing. Though
> sensor driver is not used in option 2, we still plan to upstream it because
> of option 1 as next step.

I expect this to take some time.

In the meantime, I'm inclined to merge ov02c05 driver from Bingbu / Hao in
case they can provide an upstreamable one as that driver would have users
already today. That being said, it won't be a problem accommodating the
needs of both into the same driver.

-- 
Kind regards,

Sakari Ailus

