Return-Path: <linux-media+bounces-3377-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D8C828289
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 09:56:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1E671C23A14
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 08:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 232CB25756;
	Tue,  9 Jan 2024 08:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JGf7j3JL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BE3225D3
	for <linux-media@vger.kernel.org>; Tue,  9 Jan 2024 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704790553; x=1736326553;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bp3fi2J+COqY0r/Qsxktq1HSNExs9l8BtVgXJOu6emI=;
  b=JGf7j3JLDAjtAfUYN54RSr+agswouP88Pd+Yc/z/POtmBfbdHQzJUa3s
   Oz6ptOiU+9WAmgW1Zlo4hncd2kvBj4+edcc6Zuyoju2UYBD594HsmrMfq
   pxT/XqnnaByFzzcESg2Pgul6EM7Wbf5HGY1SLHBDOojZqGQ9V1vAgjjib
   4THnJq+yMuKaUaeJIxx6ohRiYGR11XWeJw2zXGY18ukPgJYUV+cNTAKag
   2Hf0TBCrg1RBg841VBTn9jvBZYjrB9yADgU2R8kwdSW0pmWNe0IwwN6i5
   aqQsqXWEgumSoRfXCcA3bE1GBXiYGRuJEnErduNmKcxOcaXT4VfmdoI+n
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="11619684"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="11619684"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 00:55:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="731410462"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="731410462"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 00:55:47 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E459311F913;
	Tue,  9 Jan 2024 10:55:44 +0200 (EET)
Date: Tue, 9 Jan 2024 08:55:44 +0000
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
Message-ID: <ZZ0KEK-P8YJA-SSQ@kekkonen.localdomain>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <20231024112924.3934228-15-bingbu.cao@intel.com>
 <ZTkG40snprJhk8UW@kekkonen.localdomain>
 <5637c237-f939-3edc-4f45-b89f3dc241dc@linux.intel.com>
 <ZZu87Mdv18OLoTPW@kekkonen.localdomain>
 <26af01f0-dca0-b9a4-63b2-9d63d815a8be@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26af01f0-dca0-b9a4-63b2-9d63d815a8be@linux.intel.com>

Hi Bingbu,

On Tue, Jan 09, 2024 at 02:34:48PM +0800, Bingbu Cao wrote:
> Sakari,
> 
> On 1/8/24 5:14 PM, Sakari Ailus wrote:
> > Hi Bingbu,
> > 
> > On Mon, Jan 08, 2024 at 11:51:50AM +0800, Bingbu Cao wrote:
> >> Sakari,
> >>
> >> On 10/25/23 8:15 PM, Sakari Ailus wrote:
> >>> Hi Bingbu,
> >>>
> >>> On Tue, Oct 24, 2023 at 07:29:23PM +0800, bingbu.cao@intel.com wrote:
> >>>> From: Bingbu Cao <bingbu.cao@intel.com>
> >>>>
> >>>> This document mainly describe the functionality of IPU6 and
> >>>> IPU6 isys driver, and gives an example that how user can do
> >>>> imaging capture with tools.
> >>>>
> >>>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> >>>> ---
> >>>>  Documentation/admin-guide/media/ipu6-isys.rst |  159 +++
> >>>>  .../admin-guide/media/ipu6_isys_graph.svg     |  338 +++++
> >>>>  .../admin-guide/media/ipu6_isys_multi.svg     | 1124 +++++++++++++++++
> >>>>  .../admin-guide/media/v4l-drivers.rst         |    1 +
> >>>>  4 files changed, 1622 insertions(+)
> >>>>  create mode 100644 Documentation/admin-guide/media/ipu6-isys.rst
> >>>>  create mode 100644 Documentation/admin-guide/media/ipu6_isys_graph.svg
> >>>>  create mode 100644 Documentation/admin-guide/media/ipu6_isys_multi.svg
> >>>>
> >>>> diff --git a/Documentation/admin-guide/media/ipu6-isys.rst b/Documentation/admin-guide/media/ipu6-isys.rst
> >>>> new file mode 100644
> >>>> index 000000000000..fb4d355e1522
> >>>> --- /dev/null
> >>>> +++ b/Documentation/admin-guide/media/ipu6-isys.rst
> >>>> @@ -0,0 +1,159 @@
> >>>> +.. SPDX-License-Identifier: GPL-2.0
> >>>> +
> >>>> +.. include:: <isonum.txt>
> >>>> +
> >>>> +===============================================================
> >>>> +Intel Image Processing Unit 6 (IPU6) Input System driver
> >>>> +===============================================================
> >>>
> >>> Too many '='s.
> >>>
> >>>> +
> >>>> +Copyright |copy| 2023 Intel Corporation
> >>>> +
> >>>> +Introduction
> >>>> +============
> >>>> +
> >>>> +This file documents the Intel IPU6 (6th generation Image Processing Unit)
> >>>> +Input System (MIPI CSI2 receiver) drivers located under
> >>>> +drivers/media/pci/intel/ipu6.
> >>>> +
> >>>> +The Intel IPU6 can be found in certain Intel Chipsets but not in all SKUs:
> >>>> +
> >>>> +* TigerLake
> >>>> +* JasperLake
> >>>> +* AlderLake
> >>>> +* RaptorLake
> >>>> +* MeteorLake
> >>>> +
> >>>> +Intel IPU6 is made up of two components - Input System (ISYS) and Processing
> >>>> +System (PSYS).
> >>>> +
> >>>> +The Input System mainly works as MIPI CSI2 receiver which receives and
> >>>> +processes the imaging data from the sensors and outputs the frames to memory.
> >>>> +
> >>>> +There are 2 driver modules - intel_ipu6 and intel_ipu6_isys. intel_ipu6 is an
> >>>> +IPU6 common driver which does PCI configuration, firmware loading and parsing,
> >>>> +firmware authentication, DMA mapping and IPU-MMU (internal Memory mapping Unit)
> >>>> +configuration. intel_ipu6_isys implements V4L2, Media Controller and V4L2
> >>>> +sub-device interfaces. The IPU6 ISYS driver supports camera sensors connected
> >>>> +to the IPU6 ISYS through V4L2 sub-device sensor drivers.
> >>>> +
> >>>> +.. Note:: See Documentation/driver-api/media/drivers/ipu6.rst for more
> >>>> +	  information about the IPU6 hardware.
> >>>
> >>> A direct reference would be nice.
> >>>
> >>>> +
> >>>> +
> >>>> +Input system driver
> >>>> +===================
> >>>> +
> >>>> +The input System driver mainly configures CSI2 DPHY, constructs the firmware
> >>>> +stream configuration, sends commands to firmware, gets response from hardware
> >>>> +and firmware and then returns buffers to user.
> >>>> +The ISYS is represented as several V4L2 sub-devices - 'Intel IPU6 CSI2 $port',
> >>>> +which provide V4L2 subdev interfaces to the user space, there are also several
> >>>> +video nodes for each CSI-2 stream capture - 'Intel IPU6 ISYS capture $num' which
> >>>> +provide interface to user to set formats, queue buffers and streaming.
> >>>> +
> >>>> +.. kernel-figure::  ipu6_isys_graph.svg
> >>>> +   :alt: ipu6 isys media graph without multiple streams support
> >>>> +
> >>>> +   ipu6 isys media graph without multiple streams support
> >>>> +
> >>>> +.. kernel-figure::  ipu6_isys_multi.svg
> >>>> +   :alt: ipu6 isys media graph with multiple streams support
> >>>> +
> >>>> +   ipu6 isys media graph with multiple streams support
> >>>
> >>> Is there a reason for having links from the CSI-2 receivers' source pads to
> >>> multiple video nodes? Isn't a single one enough?
> >>>
> >>
> >> Sorry, I forgot to reply before. Firmware sees each MIPI VC as a single
> >> stream, for multiple VCs case, SW need create multiple firmware streams.
> > 
> > Yes, I understand that, but this does not explain why you have multiple
> > links between the source pads and video nodes. You can only capture one
> > stream at a time from a video node. The user needs to select the correct
> > video node related to a source pad, not to pick a random video node and
> > then figure out which link to enable.
> 
> The user can select any of the video nodes to one source pad.
> This figure shows that user have the capability to link any source pad
> to any of the video node (in dotted line). In reality, only 1 link is
> active (solid line).

Yes, that's how it's currently implemented but I don't think there's really
a reason to do that. Could you remove all but one link to each video node?

-- 
Regards,

Sakari Ailus

