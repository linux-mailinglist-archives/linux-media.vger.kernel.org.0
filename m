Return-Path: <linux-media+bounces-49333-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E896CD5BD3
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 12:08:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F00A73058A11
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 11:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12932315D33;
	Mon, 22 Dec 2025 10:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WTIkY7ha"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67493148D0
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 10:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398301; cv=none; b=dcz5fn9CcmTQI+hlTBYpca5JkWTRgNiSa8yXxDPHSGKjPFC7rDLjatX8Cxd2c2qA2zVzlPCHJRLIoSkOTW7W2DSnhv9arM70l9c4vLnwEWTWud5aF22VMuox0KMwPxq8IQkkvzhNC4vZDQs1QJ+AqpnPQoxAdsxIp1xESuivZ/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398301; c=relaxed/simple;
	bh=8CRv7QC4AZTVXiOsBZLPL6tQuJWNTBcL2RikxX1XylE=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=AjUXxJ3IkL46qjRlrZo9JOKv4oanKp9v/ie9cfU3vRdyVWEMHr+wLqhzJZZuonFY5BrZFCw39ojEt8H1n2Xz1FWzbqRYUXZXCk/OlkqlBhiizT1ge702Z07wVCOi7l7n8ZPorgvaeI8nEjItJln5BB+w9LO5HdxLR+RiFI+uCxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WTIkY7ha; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766398300; x=1797934300;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=8CRv7QC4AZTVXiOsBZLPL6tQuJWNTBcL2RikxX1XylE=;
  b=WTIkY7ha1MK3DXYhEKYxTfvAB6bd8RwMSGjSzwtFrzuwbOyFYlwTJ8x3
   aJFIntruPV33k1+OX+BZIW1MUlOKQwwGQQ5R666syxykPH7c6FmmthEqd
   /ArMRev5EnEqMwSYW3SWupFk7nOxae0D3gpMyb0FTUuA03Zh2Cjt7SiGv
   V2vnD2YvK+jUP/LKjPTHnDaB1QMHUOxUQC9IRVj/rSytUnZKZb5v8UO5s
   VPdzBJmHhQm8/JIkbH1Oi6qwLQNJpWLIWhzA+68ut1Pp37ydp/72Ea1ZG
   OhVy1gDHaEDMHSAe8BCJHNxf5srh2RMT5K0Fhg+bocmBDFtCyxGJm3eLO
   g==;
X-CSE-ConnectionGUID: Z3CvYaumTXeixwldCdboUA==
X-CSE-MsgGUID: 11rUoLUwQnaOAC+wBUK00g==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="70828849"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="70828849"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 02:11:39 -0800
X-CSE-ConnectionGUID: /cXNHwoKS5eur/oy68ty0Q==
X-CSE-MsgGUID: /aVRyRYKQvKp5/vKxOpdVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="230506569"
Received: from ipu5-build.bj.intel.com (HELO [10.238.153.130]) ([10.238.153.130])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 02:11:37 -0800
Subject: Re: [PATCH v2 2/4] media: staging/ipu7: call synchronous RPM suspend
 in probe failure
To: Sakari Ailus <sakari.ailus@linux.intel.com>, bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, antti.laakso@linux.intel.com,
 mehdi.djait@linux.intel.com
References: <20251222070629.2018807-1-bingbu.cao@intel.com>
 <20251222070629.2018807-3-bingbu.cao@intel.com>
 <aUkDHvTQ5JH-_xM5@kekkonen.localdomain>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <8fd50787-87f6-ac31-739f-5f3c64961abc@linux.intel.com>
Date: Mon, 22 Dec 2025 18:03:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <aUkDHvTQ5JH-_xM5@kekkonen.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sakari,

Thanks for the review.

On 12/22/25 4:36 PM, Sakari Ailus wrote:
> Hi Bingbu,
> 
> Thanks for the patchset.
> 
> On Mon, Dec 22, 2025 at 03:06:27PM +0800, bingbu.cao@intel.com wrote:
>> From: Bingbu Cao <bingbu.cao@intel.com>
>>
>> If firmware authentication failed during driver probe, driver call
>> an asynchronous API to suspend the psys device but the bus device
>> will be removed soon, thus runtime PM of bus device will be disabled
>> soon, that will cancel the suspend request, so use synchronous
>> suspend to make sure the runtime suspend before disabling its RPM.
>>
>> IPU7 hardware has constraints that the PSYS device must be powered
>> off before ISYS, otherwise it will cause machine check error.
> 
> How does this differ from IPU6? In the ipu6 driver this has been addressed
> by making the PSYS a child of ISYS. Would this work on IPU7, too?

For both IPU6 and IPU7, PSYS is child of ISYS. It can guarantee that PSYS
auxiliary device will be powered off before ISYS except the probe failure
case. Runtime PM disabling(in ipu7_bus_del_devices) may cancel the pending
PSYS suspend request which cause machine check error on PTL which has clock
hardware constraint.

> 
>>
>> Cc: Stable@vger.kernel.org
>> Fixes: b7fe4c0019b1 ("media: staging/ipu7: add Intel IPU7 PCI device driver")
>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>> ---
>>  drivers/staging/media/ipu7/ipu7.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
>> index 6c8c3eea44ac..fa5a1867626f 100644
>> --- a/drivers/staging/media/ipu7/ipu7.c
>> +++ b/drivers/staging/media/ipu7/ipu7.c
>> @@ -2620,7 +2620,7 @@ static int ipu7_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>  	if (!IS_ERR_OR_NULL(isp->isys) && !IS_ERR_OR_NULL(isp->isys->mmu))
>>  		ipu7_mmu_cleanup(isp->isys->mmu);
>>  	if (!IS_ERR_OR_NULL(isp->psys))
>> -		pm_runtime_put(&isp->psys->auxdev.dev);
>> +		pm_runtime_put_sync(&isp->psys->auxdev.dev);
>>  	ipu7_bus_del_devices(pdev);
>>  	release_firmware(isp->cpd_fw);
>>  buttress_exit:
> 

-- 
Best regards,
Bingbu Cao

