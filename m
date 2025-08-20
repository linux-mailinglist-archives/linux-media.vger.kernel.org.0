Return-Path: <linux-media+bounces-40404-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C8937B2DCD1
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 14:43:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A0F947B3E36
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 12:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CC04315763;
	Wed, 20 Aug 2025 12:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P/zkyWrt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA74B308F05;
	Wed, 20 Aug 2025 12:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755693785; cv=none; b=IFTH6o1v1geWKNHsVdg+XGpIpyhSvaSsKiH9JY5TG0C5kLRCbC4P84pQcQSZdg0zT32fbDQoz4yusCAHoXxWEL2pN2lpakT39lD+/ABSK8Oy6J7QW/AkGB7gBWD1/2a1rhUtP1Mf8ndpUJNqvZYZjdCoiEEx2kJqR+ErCZDdS3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755693785; c=relaxed/simple;
	bh=BzKWieJAdNGNUkpmpGd/ntRvTjTdJS0+m011390ExCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HEUyC5sBhXULL11efJUZZ5RlqPDObMwID/+sz3sQiAC6d8lxevZMaWyZzwEDn0I4JsY/6L8AT29EJDGu6v1bc8oRaYeSXK69G/+k6+mhwfRcM2rFNyEM1NaJokIgsty2jekLMdU0bZ5CRv57ivHER4a62/kZy/RLSRQdjLSDUoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P/zkyWrt; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755693784; x=1787229784;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=BzKWieJAdNGNUkpmpGd/ntRvTjTdJS0+m011390ExCc=;
  b=P/zkyWrtzmjvAoRLgQnSlr5EhCIlRMDpw+sqaOaAJv3WrbqKb0gImnwv
   js6RYqZr9c3fE50Dy2QtqTvf0ycIXoZszPUFAavMnOSNjcpzo5GzLbbeC
   eckqSejMAAS6wTqlgCuA2ggSXlYDZveQg0KKSK1rEFZnDtVhqVPyH0sLN
   Bv2P0MoVOlK7toxyfIGjRYuj9depdNtyu718dgxZeAWFROBYUIM+k6Zr8
   JGjCNma9Fl1FCMEEyUtADJrvqnwM2kNFBJJ1OrmRVNPPwOjxBwdbrUIT1
   Z2hZip9Zn55BIqOISgKm/8np6lCizeQ58HCU3lKc0sIm2vUjGbusa4SbJ
   g==;
X-CSE-ConnectionGUID: DlRH0tI9T/WKqyJIcUmMSg==
X-CSE-MsgGUID: KpwGK1hwR+KhyPAhPVPI7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="45531989"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="45531989"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 05:43:03 -0700
X-CSE-ConnectionGUID: avHaKPYLQB2V2AL5YBS26A==
X-CSE-MsgGUID: LJuPOidESgya4geRW5fmCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="168463890"
Received: from ettammin-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.19])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 05:42:59 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2A4DA12024B;
	Wed, 20 Aug 2025 15:42:57 +0300 (EEST)
Date: Wed, 20 Aug 2025 15:42:57 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Du, Bin" <bin.du@amd.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	mchehab@kernel.org, hverkuil@xs4all.nl, bryan.odonoghue@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com, Svetoslav.Stoilov@amd.com
Subject: Re: [PATCH v2 8/8] Documentation: add documentation of AMD isp 4
 driver
Message-ID: <aKXC0Q4IiKmkjoSH@kekkonen.localdomain>
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-9-Bin.Du@amd.com>
 <20250805113719.GF24627@pendragon.ideasonboard.com>
 <e614b565-81e0-49c0-93dc-af1936462728@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e614b565-81e0-49c0-93dc-af1936462728@amd.com>

Hi Bin,

On Tue, Aug 12, 2025 at 09:36:04AM +0800, Du, Bin wrote:
> Many thanks Laurent Pinchart for the review.
> 
> On 8/5/2025 7:37 PM, Laurent Pinchart wrote:
> > On Wed, Jun 18, 2025 at 05:19:59PM +0800, Bin Du wrote:
> > > Add documentation for AMD isp 4 and describe the main components
> > > 
> > > Signed-off-by: Bin Du <Bin.Du@amd.com>
> > > Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> > > ---
> > >   Documentation/admin-guide/media/amdisp4-1.rst | 64 +++++++++++++++++++
> > >   Documentation/admin-guide/media/amdisp4.dot   |  8 +++
> > >   MAINTAINERS                                   |  2 +
> > >   3 files changed, 74 insertions(+)
> > >   create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
> > >   create mode 100644 Documentation/admin-guide/media/amdisp4.dot
> > > 
> > > diff --git a/Documentation/admin-guide/media/amdisp4-1.rst b/Documentation/admin-guide/media/amdisp4-1.rst
> > > new file mode 100644
> > > index 000000000000..417b15af689a
> > > --- /dev/null
> > > +++ b/Documentation/admin-guide/media/amdisp4-1.rst
> > > @@ -0,0 +1,64 @@
> > > +.. SPDX-License-Identifier: GPL-2.0
> > > +
> > > +.. include:: <isonum.txt>
> > > +
> > > +====================================
> > > +AMD Image Signal Processor (amdisp4)
> > > +====================================
> > > +
> > > +Introduction
> > > +============
> > > +
> > > +This file documents the driver for the AMD ISP4 that is part of
> > > +AMD Ryzen AI Max 385 SoC.
> > > +
> > > +The driver is located under drivers/media/platform/amd/isp4 and uses
> > > +the Media-Controller API.
> > > +
> > > +Topology
> > > +========
> > > +
> > > +.. _amdisp4_topology_graph:
> > > +
> > > +.. kernel-figure:: amdisp4.dot
> > > +     :alt:   Diagram of the media pipeline topology
> > > +     :align: center
> > > +
> > > +
> > > +
> > > +The driver has 1 sub-device:
> > > +
> > > +- isp: used to resize and process bayer raw frames in to yuv.
> > > +
> > > +The driver has 1 video device:
> > > +
> > > +- <capture video device: capture device for retrieving images.
> > > +
> > > +
> > > +  - ISP4 Image Signal Processing Subdevice Node
> > > +-----------------------------------------------
> > > +
> > > +The isp4 is represented as a single V4L2 subdev, the sub-device does not
> > > +provide interface to the user space.
> > 
> > Doesn't it ? The driver sets the V4L2_SUBDEV_FL_HAS_DEVNODE flag for the
> > subdev, and calls v4l2_device_register_subdev_nodes().
> > 
> 
> We have exported subdev device to user space during the testing with
> libcamera sample pipeline.
> 
> > As far as I understand, the camera is exposed by the firmware with a
> > webcam-like interface. We need to better understand your plans with this
> > driver. If everything is handled by the firmware, why are the sensor and
> > subdev exposed to userspace ? Why can't you expose a single video
> > capture device, with a media device, and handle everything behind the
> > scene ? I assume there may be more features coming later. Please
> > document the plan, we can't provide feedback on the architecture
> > otherwise.
> > 
> 
> Currently, isp fw is controlling the sensor to update just the exposure and
> gain, since the 3A algorithms run on ISP HW rather than on x86. In a future
> version, we plan to introduce raw output support in the ISP driver, allowing
> users to choose between AMD’s 3A running on ISP hardware or a custom 3A
> running on x86. If the user opts for the x86-based 3A, the firmware will
> relinquish control of the sensor, and hands over full control to the x86
> system.

There are a few problems I see with this approach.

Camera sensors are separate devices from the ISP and they're expected to be
controlled by the respective camera sensor drivers and these drivers only.
The firmware contains the camera control algorithms as well as tuning; this
is something that's better located outside of it.

The complex camera system comprising of a camera sensor, an ISP and a
microcontroller within you have is right now semi-integrated to the SoC and
I think it needs to be either fully unintegrated (the ISPs we currently
support) or fully integrated (e.g. UVC webcams).

There are two options that I can see here, in descending order of
preference:

1. Control the ISP processing blocks from the AMD ISP driver, via a
   documented UAPI. This includes setting processing block parameters and
   being able to obtain statistics from the ISP. This is aligned with the
   other currently supported ISP drivers.
   
   This option could include support for the CSI-2 receiver only, with the
   processing taking place in SoftISP. Fully supported ISP would of course
   be preferred.
   
   Right now I don't have an opinion on whether or not this needs to
   include libcamera support, but the ISP driver wouldn't be of much use
   without that anyway.

2. Move sensor control to firmware and make the AMD ISP driver expose an
   interface that looks like a webcam, akin to the UVC driver. In this case
   there's also no use for the sensor driver you've posted earlier.
   Overall, the ISP/sensor combination will probably be limited to use as a
   webcam in this case.

-- 
Kind regards,

Sakari Ailus

