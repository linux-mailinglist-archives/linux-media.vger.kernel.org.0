Return-Path: <linux-media+bounces-3358-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EB0827D99
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 04:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5EAF8B22545
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 03:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F11284699;
	Tue,  9 Jan 2024 03:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m+lJpblZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DE94418
	for <linux-media@vger.kernel.org>; Tue,  9 Jan 2024 03:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704772547; x=1736308547;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=x8STvpFIG83BevQ8zQ/CINCFxsnPRiVepaYwW/uI8cQ=;
  b=m+lJpblZNe3jOZLQkSkOLyPwah2RZb+nnfB4d2fswNcjZRu1Z670/Ll9
   bh8fvkORrrQ3Jx0+XxzpfUThuOa0VcopBMZ06t4sRUbMMUdf9MoEQReKi
   MxtGnm+4sC1v6/7+EiC1XyVb3dt9Kou3w3CE7MASsIYnu9ZsFcwJMTki6
   /VT4vQYJ9cS1aZe41hH00G+9GgkM10A60k0sPgEPB7Y6xz9hHuSSaugHB
   BXsIY/RSorGgPWmwn0TrCoZhQJkxK8QTgpBFnX7Z43aK4ayJgwBWwtOz4
   VFimz5NMHGb4DApvG6jZrg70pMm0yMop+Y+LOmJ/s6XfNa4aw7zEqUkT3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="429261625"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; 
   d="scan'208";a="429261625"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 19:55:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="905011226"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; 
   d="scan'208";a="905011226"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by orsmga004.jf.intel.com with ESMTP; 08 Jan 2024 19:55:31 -0800
Subject: Re: [PATCH v2 00/15] Intel IPU6 and IPU6 input system drivers
To: Hans de Goede <hdegoede@redhat.com>, Hans de Goede <hans@hansg.org>,
 bingbu.cao@intel.com, linux-media@vger.kernel.org,
 sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc: andriy.shevchenko@linux.intel.com, ilpo.jarvinen@linux.intel.com,
 andreaskleist@gmail.com, claus.stovgaard@gmail.com, tfiga@chromium.org,
 senozhatsky@chromium.org, tomi.valkeinen@ideasonboard.com,
 tian.shu.qiu@intel.com, hongju.wang@intel.com
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <e1b060be-793f-4482-b0dc-670984bbbd84@hansg.org>
 <2d3a85fe-dfb9-52e1-fe1b-e0b9a5ac14ab@linux.intel.com>
 <445d7cbf-8d68-4b55-a252-7187973d63c4@redhat.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <d554d5e2-d586-1bf8-b11c-bcd32fa01ab4@linux.intel.com>
Date: Tue, 9 Jan 2024 11:51:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <445d7cbf-8d68-4b55-a252-7187973d63c4@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit


Hans,

On 1/8/24 10:23 PM, Hans de Goede wrote:
> Hi Bingbu,
> 
> On 1/8/24 05:07, Bingbu Cao wrote:
>> Hans,
>>
>> On 11/8/23 7:59 PM, Hans de Goede wrote:
>>> Hi Bingbu,
>>>
>>> On 10/24/23 13:29, bingbu.cao@intel.com wrote:
>>>> From: Bingbu Cao <bingbu.cao@intel.com>
>>>>
>>>> This patch series adds a driver for Intel IPU6 input system.
>>>> IPU6 is the sixth generation of Imaging Processing Unit, it is a PCI
>>>> device which can be found in some Intel Client Platforms. User can use
>>>> IPU6 to capture images from MIPI camera sensors.
>>>>
>>>> IPU6 has its own firmware which exposes ABIs to driver, and communicates
>>>> with CSE to do firmware authentication. IPU6 has its MMU hardware, so
>>>> the driver sets up a page table to allow IPU6 DMA to access the system
>>>> memory.
>>>>
>>>> IPU6 input system driver uses MC and V4L2 sub-device APIs besides V4L2.
>>>
>>> I have been testing this on a TigerLake system, a Dell Latitude 9420
>>> with ov01a1s and the packed 10 bit bayer pixel fmt: V4L2_PIX_FMT_SGRBG10P,
>>> which libcamera together with (WIP) software debayer support picks
>>> by default does not work. There are many many CSI errors in dmesg
>>> and only the first 10 or so lines of the image show.
>>>
>>> Disabling the packed format by removing it from ipu6_isys_pfmts[],
>>> making libcamera pick the unpacked (every 10 bits per pixel data
>>> stored in a 16 bit word in output buffer) fixes this.
>>>
>>> Are the packed bayer formats supposed to work on Tiger Lake, or
>>> is this a known issue which Intel's own userspace stack avoids
>>> by always picking the unpacked format ?
>>
>> I just tested the packed bayer on my device (ov01a10) and did not
>> observe the problems like yours, could you share the isys kernel log?
> 
> Was this on a device with a Tiger Lake CPU / plain ipu6 (not ipu6ep) ?

Sorry, it's ipu6ep.

I have no TigerLake so far.
The difference between ipu6 and ipu6ep is the MIPI CSI-2 D-PHY. But it
should not have no impact on the packed format.

Could you share the debug log on TigerLake?

> 
> Regards,
> 
> Hans
> 
> 

-- 
Best regards,
Bingbu Cao

