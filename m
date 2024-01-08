Return-Path: <linux-media+bounces-3296-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 339B3826A6D
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 10:14:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 587351C21C6E
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 09:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2191911711;
	Mon,  8 Jan 2024 09:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hMU70w5U"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF7113AE3
	for <linux-media@vger.kernel.org>; Mon,  8 Jan 2024 09:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704705268; x=1736241268;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xiBOJ2mBiivVb+xQjNU91YO9V5SOjyUOy1gYXPeHWnQ=;
  b=hMU70w5UUaNkTq82FgAaLTGQFWqMOILJtpuMpTqH9KJjFEOyIwkXREjA
   zjsU0+Vz1FsL69G6TcCz+M86w97GVY0FmJOGslkRpLmZFL+BvVLafhT/T
   L0qdcJGGOH/nsEcERpZd74QyTMdfPHDPN5qNITYt0XxLgMZWK82psmPFH
   ENIFFS2u72k3+g78BaTb2iQ2NLy5ZUbAyNETzek5peXYhsRohYYO4cFWN
   yi+GndRv8aRh4FcSfqdAexEH968TlSwg87Ma6pzbR2TZPSnP++fnhuzPH
   2I10GDE5QJsd3/Gbq7K2A4MjS07yWh2/JOzsy+aFqCd0KXcyOAFIcJqzW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="11177289"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="11177289"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 01:14:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="810146836"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="810146836"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 01:14:23 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4635311F8DE;
	Mon,  8 Jan 2024 11:14:20 +0200 (EET)
Date: Mon, 8 Jan 2024 09:14:20 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: bingbu.cao@intel.com, linux-media@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, andreaskleist@gmail.com,
	claus.stovgaard@gmail.com, tfiga@chromium.org,
	senozhatsky@chromium.org, tomi.valkeinen@ideasonboard.com,
	tian.shu.qiu@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH v2 14/15] Documentation: add Intel IPU6 ISYS driver
 admin-guide doc
Message-ID: <ZZu87Mdv18OLoTPW@kekkonen.localdomain>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <20231024112924.3934228-15-bingbu.cao@intel.com>
 <ZTkG40snprJhk8UW@kekkonen.localdomain>
 <5637c237-f939-3edc-4f45-b89f3dc241dc@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5637c237-f939-3edc-4f45-b89f3dc241dc@linux.intel.com>

Hi Bingbu,

On Mon, Jan 08, 2024 at 11:51:50AM +0800, Bingbu Cao wrote:
> Sakari,
> 
> On 10/25/23 8:15 PM, Sakari Ailus wrote:
> > Hi Bingbu,
> > 
> > On Tue, Oct 24, 2023 at 07:29:23PM +0800, bingbu.cao@intel.com wrote:
> >> From: Bingbu Cao <bingbu.cao@intel.com>
> >>
> >> This document mainly describe the functionality of IPU6 and
> >> IPU6 isys driver, and gives an example that how user can do
> >> imaging capture with tools.
> >>
> >> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> >> ---
> >>  Documentation/admin-guide/media/ipu6-isys.rst |  159 +++
> >>  .../admin-guide/media/ipu6_isys_graph.svg     |  338 +++++
> >>  .../admin-guide/media/ipu6_isys_multi.svg     | 1124 +++++++++++++++++
> >>  .../admin-guide/media/v4l-drivers.rst         |    1 +
> >>  4 files changed, 1622 insertions(+)
> >>  create mode 100644 Documentation/admin-guide/media/ipu6-isys.rst
> >>  create mode 100644 Documentation/admin-guide/media/ipu6_isys_graph.svg
> >>  create mode 100644 Documentation/admin-guide/media/ipu6_isys_multi.svg
> >>
> >> diff --git a/Documentation/admin-guide/media/ipu6-isys.rst b/Documentation/admin-guide/media/ipu6-isys.rst
> >> new file mode 100644
> >> index 000000000000..fb4d355e1522
> >> --- /dev/null
> >> +++ b/Documentation/admin-guide/media/ipu6-isys.rst
> >> @@ -0,0 +1,159 @@
> >> +.. SPDX-License-Identifier: GPL-2.0
> >> +
> >> +.. include:: <isonum.txt>
> >> +
> >> +===============================================================
> >> +Intel Image Processing Unit 6 (IPU6) Input System driver
> >> +===============================================================
> > 
> > Too many '='s.
> > 
> >> +
> >> +Copyright |copy| 2023 Intel Corporation
> >> +
> >> +Introduction
> >> +============
> >> +
> >> +This file documents the Intel IPU6 (6th generation Image Processing Unit)
> >> +Input System (MIPI CSI2 receiver) drivers located under
> >> +drivers/media/pci/intel/ipu6.
> >> +
> >> +The Intel IPU6 can be found in certain Intel Chipsets but not in all SKUs:
> >> +
> >> +* TigerLake
> >> +* JasperLake
> >> +* AlderLake
> >> +* RaptorLake
> >> +* MeteorLake
> >> +
> >> +Intel IPU6 is made up of two components - Input System (ISYS) and Processing
> >> +System (PSYS).
> >> +
> >> +The Input System mainly works as MIPI CSI2 receiver which receives and
> >> +processes the imaging data from the sensors and outputs the frames to memory.
> >> +
> >> +There are 2 driver modules - intel_ipu6 and intel_ipu6_isys. intel_ipu6 is an
> >> +IPU6 common driver which does PCI configuration, firmware loading and parsing,
> >> +firmware authentication, DMA mapping and IPU-MMU (internal Memory mapping Unit)
> >> +configuration. intel_ipu6_isys implements V4L2, Media Controller and V4L2
> >> +sub-device interfaces. The IPU6 ISYS driver supports camera sensors connected
> >> +to the IPU6 ISYS through V4L2 sub-device sensor drivers.
> >> +
> >> +.. Note:: See Documentation/driver-api/media/drivers/ipu6.rst for more
> >> +	  information about the IPU6 hardware.
> > 
> > A direct reference would be nice.
> > 
> >> +
> >> +
> >> +Input system driver
> >> +===================
> >> +
> >> +The input System driver mainly configures CSI2 DPHY, constructs the firmware
> >> +stream configuration, sends commands to firmware, gets response from hardware
> >> +and firmware and then returns buffers to user.
> >> +The ISYS is represented as several V4L2 sub-devices - 'Intel IPU6 CSI2 $port',
> >> +which provide V4L2 subdev interfaces to the user space, there are also several
> >> +video nodes for each CSI-2 stream capture - 'Intel IPU6 ISYS capture $num' which
> >> +provide interface to user to set formats, queue buffers and streaming.
> >> +
> >> +.. kernel-figure::  ipu6_isys_graph.svg
> >> +   :alt: ipu6 isys media graph without multiple streams support
> >> +
> >> +   ipu6 isys media graph without multiple streams support
> >> +
> >> +.. kernel-figure::  ipu6_isys_multi.svg
> >> +   :alt: ipu6 isys media graph with multiple streams support
> >> +
> >> +   ipu6 isys media graph with multiple streams support
> > 
> > Is there a reason for having links from the CSI-2 receivers' source pads to
> > multiple video nodes? Isn't a single one enough?
> >
> 
> Sorry, I forgot to reply before. Firmware sees each MIPI VC as a single
> stream, for multiple VCs case, SW need create multiple firmware streams.

Yes, I understand that, but this does not explain why you have multiple
links between the source pads and video nodes. You can only capture one
stream at a time from a video node. The user needs to select the correct
video node related to a source pad, not to pick a random video node and
then figure out which link to enable.

The media graph does look impressive though. :-)

-- 
Regards,

Sakari Ailus

