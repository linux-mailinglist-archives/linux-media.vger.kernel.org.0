Return-Path: <linux-media+bounces-40054-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B77CB29713
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 04:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CF102034AF
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 02:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 084272571B3;
	Mon, 18 Aug 2025 02:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c1lOftVh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4727111A8
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 02:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755484418; cv=none; b=kCtYOvV/80FB1S0vvR8Cq57MNEvCTq4so4ZwG9fo2d+8oMQI/aClZEoeZmXkUEvmqr6zkCEGyq/8kL/E7PlRzb64bRtAYZCndNkIeD5brNklfhlFDZHIzXJmjrqtFW3j3E803/pEERa4Xuq6SsUQ0SAxjM/gjo4bCQJ3CySYP2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755484418; c=relaxed/simple;
	bh=1HDDKcx+ORK+ZEaGFaHnmRtrJNUlP0Uml2FBqbS/ezk=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ivo2iBdolsl30aNcHyiZNEcknEYu9r+Hb9cj1ll3vBM5vnNS/zXCe/YOe2P+4qa/kDuxUaVElPQsVTncjRUqb7sV2A08yYowLFdwGuhgd7kWEJQdlWSmASmGCERBA1+h5pLD7qGJkbU68hqyMsR1aW885OHEEB2tgHQDYtCLXrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c1lOftVh; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755484417; x=1787020417;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=1HDDKcx+ORK+ZEaGFaHnmRtrJNUlP0Uml2FBqbS/ezk=;
  b=c1lOftVhTez52Nl/yVPlYKrogVf92k0XwBYUiqi6DORhO6GaZeT/kEaO
   yrOWBo3gyvAbY1QmNTz7Qyp55WuIvDkU7tX8uMZEhrTfGHIQBR5nuHvUz
   nil8mG9JaWnA1LvyeEfc2x2WvVy4onalCCKxBU/sstG3k1D4eeKRBr1Lk
   ++1uBw5QEllQmfxjH97kkvGQF3LCxZ+lKS6Ds7I7sFoHlbqkVHhANvXz9
   w9A0FIHf6rVbo1wGVLdV/kSnvg8kYX3Pu2vR6MC/ZTEXPqKbzvPHWfC3n
   mdtOoZYB0FapeI2938A7WyYBwolV4tCUTWKRxmE3PnPBj2AITTtBgDUTi
   Q==;
X-CSE-ConnectionGUID: aoQE4dBmQ3it7CrA4wAAag==
X-CSE-MsgGUID: AHOWi4k3Szi3ayp1eFlyyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="57849273"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57849273"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 19:33:35 -0700
X-CSE-ConnectionGUID: iN5gFiJrTXmHtDobEAWY8A==
X-CSE-MsgGUID: TeBIng/tRreH9cYx6tUQSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="172667711"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 19:33:33 -0700
Subject: Re: [PATCH 3/3] media: staging/ipu7: cleanup the MMU correctly in
 IPU7 driver release
To: Sakari Ailus <sakari.ailus@linux.intel.com>, bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 tomi.valkeinen@ideasonboard.com, hans@jjverkuil.nl,
 jacopo.mondi@ideasonboard.com
References: <20250815092037.1825769-1-bingbu.cao@intel.com>
 <20250815092037.1825769-3-bingbu.cao@intel.com>
 <aJ-mALzD-mA_KXsa@kekkonen.localdomain>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <adf948fe-17a7-6881-d520-c71b50dc9214@linux.intel.com>
Date: Mon, 18 Aug 2025 10:27:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <aJ-mALzD-mA_KXsa@kekkonen.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sakari,

On 8/16/25 5:26 AM, Sakari Ailus wrote:
> Hi Bingbu,
> 
> Thanks for the set.
> 
> On Fri, Aug 15, 2025 at 05:20:37PM +0800, bingbu.cao@intel.com wrote:
>> From: Bingbu Cao <bingbu.cao@intel.com>
>>
>> IPU7 ISYS and PSYS auxiliary devices are released after
>> ipu7_bus_del_devices(), so driver can not reference the MMU devices
>> from ISYS and PSYS auxiliary devices, so move the MMUs cleanup before
>> releasing the auxiliary devices.
>>
>> Fixes: b7fe4c0019b1 ("media: staging/ipu7: add Intel IPU7 PCI device driver")
> 
> Please also add Cc: stable tag if you have a Fixes: tag.
> 
>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>> ---
>>  drivers/staging/media/ipu7/ipu7.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
>> index aef931d23510..3de41b3d1ae1 100644
>> --- a/drivers/staging/media/ipu7/ipu7.c
>> +++ b/drivers/staging/media/ipu7/ipu7.c
>> @@ -2644,6 +2644,9 @@ static void ipu7_pci_remove(struct pci_dev *pdev)
>>  	if (!IS_ERR_OR_NULL(isp->fw_code_region))
>>  		vfree(isp->fw_code_region);
>>  
>> +	ipu7_mmu_cleanup(isp->isys->mmu);
>> +	ipu7_mmu_cleanup(isp->psys->mmu);
>> +
>>  	ipu7_bus_del_devices(pdev);
>>  
>>  	pm_runtime_forbid(&pdev->dev);
>> @@ -2653,8 +2656,6 @@ static void ipu7_pci_remove(struct pci_dev *pdev)
>>  
>>  	release_firmware(isp->cpd_fw);
>>  
> 
> This newline will be extra once the two lines below have been removed.
> 
> Does the same issue exist in the IPU6 driver? These calls are located in
> the same location but I haven't checked if that's the right place for them.
>

IPU6 driver fix this problem in another way.

	struct ipu6_mmu *isys_mmu = isp->isys->mmu;
	struct ipu6_mmu *psys_mmu = isp->psys->mmu;
...
	release_firmware(isp->cpd_fw);

	ipu6_mmu_cleanup(psys_mmu);
	ipu6_mmu_cleanup(isys_mmu);
	
I think cleanup MMU before releasing auxdevs make more sense.

>> -	ipu7_mmu_cleanup(isp->psys->mmu);
>> -	ipu7_mmu_cleanup(isp->isys->mmu);
>>  }
>>  
>>  static void ipu7_pci_reset_prepare(struct pci_dev *pdev)
> 

-- 
Best regards,
Bingbu Cao

