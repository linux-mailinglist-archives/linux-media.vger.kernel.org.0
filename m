Return-Path: <linux-media+bounces-3361-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAE3827ED5
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 07:38:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6208CB23431
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 06:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7AC7944D;
	Tue,  9 Jan 2024 06:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WuwUqvLd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C3B9442
	for <linux-media@vger.kernel.org>; Tue,  9 Jan 2024 06:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704782319; x=1736318319;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=WWQ20EJS/dbawnCV7JGEqBs6A6lNAtOMSSk9VPYtnoE=;
  b=WuwUqvLdLmw6jEP+IJw2mazJrStNL2Nw1Z4ReKg0ga9pocmMjCrm4B2H
   nxTUh65360fSsFa4VvcEzVzElcRxHe7Megkl3LtCLxVVwtk2y0UeOucHW
   wiT/CtlFsH2EQ5FplrGpra2ei/j9Bd02oeDfCpgF/BiAZ4A4rjGpBub8g
   2Md2oLVhn64Ms6Y5zJwYBS0gK+mC7Y3pkWxQsJRaFreAWoh5n9oPkBhZQ
   qio+zt3HFlvgQsHqcIsQ+xBZemQUyhXknhGymfUWGt0UrY0Q58eda+8CV
   HSuxtTagpockxoXSCSMtjNca+57+xfNyQn9D24q6my/6xlUmdcFE+blNO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="388541336"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="388541336"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 22:38:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="774747604"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="774747604"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by orsmga007.jf.intel.com with ESMTP; 08 Jan 2024 22:38:34 -0800
Subject: Re: [PATCH v2 14/15] Documentation: add Intel IPU6 ISYS driver
 admin-guide doc
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: bingbu.cao@intel.com, linux-media@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, andriy.shevchenko@linux.intel.com,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, andreaskleist@gmail.com,
 claus.stovgaard@gmail.com, tfiga@chromium.org, senozhatsky@chromium.org,
 tomi.valkeinen@ideasonboard.com, tian.shu.qiu@intel.com,
 hongju.wang@intel.com
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <20231024112924.3934228-15-bingbu.cao@intel.com>
 <ZTkG40snprJhk8UW@kekkonen.localdomain>
 <5637c237-f939-3edc-4f45-b89f3dc241dc@linux.intel.com>
 <ZZu87Mdv18OLoTPW@kekkonen.localdomain>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <26af01f0-dca0-b9a4-63b2-9d63d815a8be@linux.intel.com>
Date: Tue, 9 Jan 2024 14:34:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ZZu87Mdv18OLoTPW@kekkonen.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sakari,

On 1/8/24 5:14 PM, Sakari Ailus wrote:
> Hi Bingbu,
> 
> On Mon, Jan 08, 2024 at 11:51:50AM +0800, Bingbu Cao wrote:
>> Sakari,
>>
>> On 10/25/23 8:15 PM, Sakari Ailus wrote:
>>> Hi Bingbu,
>>>
>>> On Tue, Oct 24, 2023 at 07:29:23PM +0800, bingbu.cao@intel.com wrote:
>>>> From: Bingbu Cao <bingbu.cao@intel.com>
>>>>
>>>> This document mainly describe the functionality of IPU6 and
>>>> IPU6 isys driver, and gives an example that how user can do
>>>> imaging capture with tools.
>>>>
>>>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>>>> ---
>>>>  Documentation/admin-guide/media/ipu6-isys.rst |  159 +++
>>>>  .../admin-guide/media/ipu6_isys_graph.svg     |  338 +++++
>>>>  .../admin-guide/media/ipu6_isys_multi.svg     | 1124 +++++++++++++++++
>>>>  .../admin-guide/media/v4l-drivers.rst         |    1 +
>>>>  4 files changed, 1622 insertions(+)
>>>>  create mode 100644 Documentation/admin-guide/media/ipu6-isys.rst
>>>>  create mode 100644 Documentation/admin-guide/media/ipu6_isys_graph.svg
>>>>  create mode 100644 Documentation/admin-guide/media/ipu6_isys_multi.svg
>>>>
>>>> diff --git a/Documentation/admin-guide/media/ipu6-isys.rst b/Documentation/admin-guide/media/ipu6-isys.rst
>>>> new file mode 100644
>>>> index 000000000000..fb4d355e1522
>>>> --- /dev/null
>>>> +++ b/Documentation/admin-guide/media/ipu6-isys.rst
>>>> @@ -0,0 +1,159 @@
>>>> +.. SPDX-License-Identifier: GPL-2.0
>>>> +
>>>> +.. include:: <isonum.txt>
>>>> +
>>>> +===============================================================
>>>> +Intel Image Processing Unit 6 (IPU6) Input System driver
>>>> +===============================================================
>>>
>>> Too many '='s.
>>>
>>>> +
>>>> +Copyright |copy| 2023 Intel Corporation
>>>> +
>>>> +Introduction
>>>> +============
>>>> +
>>>> +This file documents the Intel IPU6 (6th generation Image Processing Unit)
>>>> +Input System (MIPI CSI2 receiver) drivers located under
>>>> +drivers/media/pci/intel/ipu6.
>>>> +
>>>> +The Intel IPU6 can be found in certain Intel Chipsets but not in all SKUs:
>>>> +
>>>> +* TigerLake
>>>> +* JasperLake
>>>> +* AlderLake
>>>> +* RaptorLake
>>>> +* MeteorLake
>>>> +
>>>> +Intel IPU6 is made up of two components - Input System (ISYS) and Processing
>>>> +System (PSYS).
>>>> +
>>>> +The Input System mainly works as MIPI CSI2 receiver which receives and
>>>> +processes the imaging data from the sensors and outputs the frames to memory.
>>>> +
>>>> +There are 2 driver modules - intel_ipu6 and intel_ipu6_isys. intel_ipu6 is an
>>>> +IPU6 common driver which does PCI configuration, firmware loading and parsing,
>>>> +firmware authentication, DMA mapping and IPU-MMU (internal Memory mapping Unit)
>>>> +configuration. intel_ipu6_isys implements V4L2, Media Controller and V4L2
>>>> +sub-device interfaces. The IPU6 ISYS driver supports camera sensors connected
>>>> +to the IPU6 ISYS through V4L2 sub-device sensor drivers.
>>>> +
>>>> +.. Note:: See Documentation/driver-api/media/drivers/ipu6.rst for more
>>>> +	  information about the IPU6 hardware.
>>>
>>> A direct reference would be nice.
>>>
>>>> +
>>>> +
>>>> +Input system driver
>>>> +===================
>>>> +
>>>> +The input System driver mainly configures CSI2 DPHY, constructs the firmware
>>>> +stream configuration, sends commands to firmware, gets response from hardware
>>>> +and firmware and then returns buffers to user.
>>>> +The ISYS is represented as several V4L2 sub-devices - 'Intel IPU6 CSI2 $port',
>>>> +which provide V4L2 subdev interfaces to the user space, there are also several
>>>> +video nodes for each CSI-2 stream capture - 'Intel IPU6 ISYS capture $num' which
>>>> +provide interface to user to set formats, queue buffers and streaming.
>>>> +
>>>> +.. kernel-figure::  ipu6_isys_graph.svg
>>>> +   :alt: ipu6 isys media graph without multiple streams support
>>>> +
>>>> +   ipu6 isys media graph without multiple streams support
>>>> +
>>>> +.. kernel-figure::  ipu6_isys_multi.svg
>>>> +   :alt: ipu6 isys media graph with multiple streams support
>>>> +
>>>> +   ipu6 isys media graph with multiple streams support
>>>
>>> Is there a reason for having links from the CSI-2 receivers' source pads to
>>> multiple video nodes? Isn't a single one enough?
>>>
>>
>> Sorry, I forgot to reply before. Firmware sees each MIPI VC as a single
>> stream, for multiple VCs case, SW need create multiple firmware streams.
> 
> Yes, I understand that, but this does not explain why you have multiple
> links between the source pads and video nodes. You can only capture one
> stream at a time from a video node. The user needs to select the correct
> video node related to a source pad, not to pick a random video node and
> then figure out which link to enable.

The user can select any of the video nodes to one source pad.
This figure shows that user have the capability to link any source pad
to any of the video node (in dotted line). In reality, only 1 link is
active (solid line).

> 
> The media graph does look impressive though. :-)
> 

-- 
Best regards,
Bingbu Cao

