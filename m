Return-Path: <linux-media+bounces-3280-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98531826789
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 05:11:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD4AC2819B9
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 04:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898F010FF;
	Mon,  8 Jan 2024 04:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LouQ5cko"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FD04A2C
	for <linux-media@vger.kernel.org>; Mon,  8 Jan 2024 04:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704687057; x=1736223057;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=bhkrmGcfD5B9eEarknsfMtGAEVdSpj8UacuXVQbzVM4=;
  b=LouQ5ckoQsywF1SyBOPbPfrAuGEX3mhZwmDnUGZLzImRcIYFljcDSP6X
   Me6cd3WD2wCpSy7H7jXT3iO6trfdV0T6iSj8IkICh23zsQmMrlTghgkrb
   Mnq07NTnr5eY+yBFETbe1uzUT1djZsTtBdsb9Z6sAg8UvHggz4by1RTae
   aXFqU8haboZSw7QlknIV9LD62PL1DzpV7ydDuY5CwyrGITe4Ua3QiL2O/
   qPpiFQTfQURTZo/pOdMVLzGPbr0Md3UiEtqc58lOd6Ny9KZp1CAKYyLN3
   ckJO1NolwmX9/NwuvMuKbwVNBXi3I/xdgTmYXN6wSN/Sc6JkVtXH6qDyf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="4874454"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="4874454"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2024 20:10:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="784726501"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="784726501"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by fmsmga007.fm.intel.com with ESMTP; 07 Jan 2024 20:10:49 -0800
Subject: Re: [PATCH v2 00/15] Intel IPU6 and IPU6 input system drivers
To: Hans de Goede <hans@hansg.org>, bingbu.cao@intel.com,
 linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
 laurent.pinchart@ideasonboard.com
Cc: andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, andreaskleist@gmail.com,
 claus.stovgaard@gmail.com, tfiga@chromium.org, senozhatsky@chromium.org,
 tomi.valkeinen@ideasonboard.com, tian.shu.qiu@intel.com,
 hongju.wang@intel.com
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <e1b060be-793f-4482-b0dc-670984bbbd84@hansg.org>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <2d3a85fe-dfb9-52e1-fe1b-e0b9a5ac14ab@linux.intel.com>
Date: Mon, 8 Jan 2024 12:07:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <e1b060be-793f-4482-b0dc-670984bbbd84@hansg.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hans,

On 11/8/23 7:59 PM, Hans de Goede wrote:
> Hi Bingbu,
> 
> On 10/24/23 13:29, bingbu.cao@intel.com wrote:
>> From: Bingbu Cao <bingbu.cao@intel.com>
>>
>> This patch series adds a driver for Intel IPU6 input system.
>> IPU6 is the sixth generation of Imaging Processing Unit, it is a PCI
>> device which can be found in some Intel Client Platforms. User can use
>> IPU6 to capture images from MIPI camera sensors.
>>
>> IPU6 has its own firmware which exposes ABIs to driver, and communicates
>> with CSE to do firmware authentication. IPU6 has its MMU hardware, so
>> the driver sets up a page table to allow IPU6 DMA to access the system
>> memory.
>>
>> IPU6 input system driver uses MC and V4L2 sub-device APIs besides V4L2.
> 
> I have been testing this on a TigerLake system, a Dell Latitude 9420
> with ov01a1s and the packed 10 bit bayer pixel fmt: V4L2_PIX_FMT_SGRBG10P,
> which libcamera together with (WIP) software debayer support picks
> by default does not work. There are many many CSI errors in dmesg
> and only the first 10 or so lines of the image show.
> 
> Disabling the packed format by removing it from ipu6_isys_pfmts[],
> making libcamera pick the unpacked (every 10 bits per pixel data
> stored in a 16 bit word in output buffer) fixes this.
> 
> Are the packed bayer formats supposed to work on Tiger Lake, or
> is this a known issue which Intel's own userspace stack avoids
> by always picking the unpacked format ?

I just tested the packed bayer on my device (ov01a10) and did not
observe the problems like yours, could you share the isys kernel log?

> 
> Regards,
> 
> Hans
> 
> 

-- 
Best regards,
Bingbu Cao

