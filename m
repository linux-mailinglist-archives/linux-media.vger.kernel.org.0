Return-Path: <linux-media+bounces-33563-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DE5AC75FB
	for <lists+linux-media@lfdr.de>; Thu, 29 May 2025 04:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54DB41BA8243
	for <lists+linux-media@lfdr.de>; Thu, 29 May 2025 02:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 811AF2459F9;
	Thu, 29 May 2025 02:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IZStQEom"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD778213E94
	for <linux-media@vger.kernel.org>; Thu, 29 May 2025 02:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748487438; cv=none; b=aOPTCD+pOIuNXrh5wXwvgV5QLWLbY3/B2ACw7zPB2g/y8ahPD0cQvvIsJez7rtNujuS5ANCD0bo8Hy0RjGVrZEzQJvesJW0WBJH9FcHEV0fBVzHCAirw5CgO9DqUh5W06r5V71NvR0fFv9tMHA6yRZnTpG+2Ty/xjEOb9BMrFVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748487438; c=relaxed/simple;
	bh=lnPnP0g6rL3Hu9neKhHl48mNmSNKrmNk3+e3aNUpm4w=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=dgxJCfpkdwF8nFO55tWKly4dWH5qZIkKmcLEbulQ6QtP2LML4fwFpHPDiZ5aVtBoWswxpv16uZ6sbWS5hyzmepZq0+VhCn3drHO38AzPd+XvwV4T+lFHFNaLO+hq8xP1Rt2Vw9EdESszIfK2fIel+H83C3c+fizXba+kR6N/gL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IZStQEom; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748487437; x=1780023437;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=lnPnP0g6rL3Hu9neKhHl48mNmSNKrmNk3+e3aNUpm4w=;
  b=IZStQEom1qs6SzF2elPv1iDz3gyxQnfN8sIhZ1GuJPjAmD9NckAy1VQO
   gL8diBRy+IobWo2d4f+HXG4sJTUiUwsqUHyVC5cUzRufS/SquBkQvZ494
   HKm4IARyY8MjlepB/YYJVuObrWhONoroJS+vwTLlSFYylfvyT999W3k10
   n3oj9k6S8udRxJ+ppLdTXxKBTuTwsUNjQQdAdfehS+IuU9+x2oCy5hEif
   blzmX68hB6wELhTsGiyfQ4BNTASPhWjTQlU/hkvepDIBgDKDwsMHuBpwf
   KQT3E/HBNA+YBW+b0HuPQPwWsgcHuxPYuPWtwgTEbTp+oxLaLe9p+g3ke
   Q==;
X-CSE-ConnectionGUID: 1MKPmAjfQrijUqI51P7w4A==
X-CSE-MsgGUID: UaOHKdlmTNaircpoYHEoCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50533879"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="50533879"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 19:57:14 -0700
X-CSE-ConnectionGUID: AGh9Mi5iStSBeY5+LPCX7A==
X-CSE-MsgGUID: 3GKLOoOHSsqpTdwH5iNB4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="174424696"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 19:57:12 -0700
Subject: Re: [PATCH v2 1/8] media: Rename the IPU PCI device table header and
 add IPU7 PCI IDs
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: bingbu.cao@intel.com, linux-media@vger.kernel.org,
 stanislaw.gruszka@linux.intel.com, laurent.pinchart@ideasonboard.com,
 jerry.w.hu@intel.com, hao.yao@intel.com, tian.shu.qiu@intel.com
References: <20250528075146.1763079-1-bingbu.cao@intel.com>
 <20250528075146.1763079-2-bingbu.cao@intel.com>
 <eec99ae8-d168-428b-c713-e00ab7de0572@linux.intel.com>
 <aDb1i2ly1dlHIccL@kekkonen.localdomain>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <b96e062a-3bea-e555-f997-bcdaaf729e3f@linux.intel.com>
Date: Thu, 29 May 2025 10:53:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <aDb1i2ly1dlHIccL@kekkonen.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi, Sakari,

On 5/28/25 7:37 PM, Sakari Ailus wrote:
> Hi Bingbu,
> 
> On Wed, May 28, 2025 at 05:18:54PM +0800, Bingbu Cao wrote:
>> Sakari,
>>
>> On 5/28/25 3:51 PM, bingbu.cao@intel.com wrote:
>>> From: Bingbu Cao <bingbu.cao@intel.com>
>>>
>>> Rename the IPU PCI device table header file and add the IPU7 PCI device
>>> IDs.
>>>
>>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>>> ---
>>>  drivers/media/pci/intel/ipu6/ipu6.c                |  2 +-
>>>  drivers/media/pci/intel/ivsc/mei_csi.c             |  2 +-
>>>  .../media/{ipu6-pci-table.h => ipu-pci-table.h}    | 14 +++++++++++---
>>>  3 files changed, 13 insertions(+), 5 deletions(-)
>>>  rename include/media/{ipu6-pci-table.h => ipu-pci-table.h} (68%)
>>>
>>> diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
>>> index 277af7cda8ee..aa859220ba94 100644
>>> --- a/drivers/media/pci/intel/ipu6/ipu6.c
>>> +++ b/drivers/media/pci/intel/ipu6/ipu6.c
>>> @@ -21,7 +21,7 @@
>>>  #include <linux/types.h>
>>>  
>>>  #include <media/ipu-bridge.h>
>>> -#include <media/ipu6-pci-table.h>
>>> +#include <media/ipu-pci-table.h>
>>>  
>>>  #include "ipu6.h"
>>>  #include "ipu6-bus.h"
>>> diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
>>> index 92d871a378ba..47fc48c7619b 100644
>>> --- a/drivers/media/pci/intel/ivsc/mei_csi.c
>>> +++ b/drivers/media/pci/intel/ivsc/mei_csi.c
>>> @@ -27,7 +27,7 @@
>>>  #include <linux/workqueue.h>
>>>  
>>>  #include <media/ipu-bridge.h>
>>> -#include <media/ipu6-pci-table.h>
>>> +#include <media/ipu-pci-table.h>
>>>  #include <media/v4l2-async.h>
>>>  #include <media/v4l2-ctrls.h>
>>>  #include <media/v4l2-fwnode.h>
>>> diff --git a/include/media/ipu6-pci-table.h b/include/media/ipu-pci-table.h
>>> similarity index 68%
>>> rename from include/media/ipu6-pci-table.h
>>> rename to include/media/ipu-pci-table.h
>>> index 0899d9d2f978..528080c6f742 100644
>>> --- a/include/media/ipu6-pci-table.h
>>> +++ b/include/media/ipu-pci-table.h
>>> @@ -3,8 +3,8 @@
>>>   * Copyright (C) 2024 Intel Corporation
>>>   */
>>>  
>>> -#ifndef __IPU6_PCI_TBL_H__
>>> -#define __IPU6_PCI_TBL_H__
>>> +#ifndef __IPU_PCI_TBL_H__
>>> +#define __IPU_PCI_TBL_H__
>>>  
>>>  #include <linux/pci.h>
>>>  
>>> @@ -15,6 +15,9 @@
>>>  #define PCI_DEVICE_ID_INTEL_IPU6EP_RPLP		0xa75d
>>>  #define PCI_DEVICE_ID_INTEL_IPU6EP_MTL		0x7d19
>>>  
>>> +#define PCI_DEVICE_ID_INTEL_IPU7_PCI_ID		0x645d
>>> +#define PCI_DEVICE_ID_INTEL_IPU7P5_PCI_ID	0xb05d
>>> +
>>>  static const struct pci_device_id ipu6_pci_tbl[] = {
>>>  	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6) },
>>>  	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6SE) },
>>> @@ -25,4 +28,9 @@ static const struct pci_device_id ipu6_pci_tbl[] = {
>>>  	{ }
>>>  };
>>>  
>>> -#endif /* __IPU6_PCI_TBL_H__ */
>>> +static const struct pci_device_id ipu7_pci_tbl[] = {
>>
>> I got media-ci build errors:
>> In file included from drivers/media/pci/intel/ivsc/mei_csi.c:30:
>> ./include/media/ipu-pci-table.h:31:35: warning: ‘ipu7_pci_tbl’
>> defined but not used [-Wunused-const-variable=]
>>
>> Do you think is it OK using 1 table to cover IPU6 and IPU7?
> 
> Static const tables in a header isn't that great to begin with, but the
> alternative would be another module which is way overkill. Two headers
> would make sense in this case I think -- the tables are separate in any
> case.

ivsc is another user of the IPU6 table, but I don't see that other driver
need IPU7 table so far. So I want to keep the ipu7 table private without
touching the table.h (Drop 1/8).

> 
>>
>>> +	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU7_PCI_ID)},
>>> +	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU7P5_PCI_ID)},
>>> +	{ }
>>> +};
>>> +#endif /* __IPU_PCI_TBL_H__ */
>>>
>>
> 

-- 
Best regards,
Bingbu Cao

