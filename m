Return-Path: <linux-media+bounces-49334-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 866A4CD59D7
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 11:36:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BDC7530121BF
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 10:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E901F3148C2;
	Mon, 22 Dec 2025 10:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fNCC7ifC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D2331328E
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 10:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398399; cv=none; b=Kjah+gL9+zne1+Lb/lg3KFRV/fko+eZVp1AsfAlqXLD3ZCB0/plR1ELTkUWa9TllmA/q4n9VbUhCDgg/s/pOmUCz9PD8BB6ZMD6Osx4OcoaBvzXg+JnDA4+efFhJ+GBfvCyUSkZv4aphX5kQhK4y9ichE3GXjKTY6zGf1HXgv1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398399; c=relaxed/simple;
	bh=nigwKEWUbyirDV4x3aN1CneJPEp6WCy5XmCrikSanbA=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=EH5vYbs61/NUHeEMSPX76ykgYKiInKMK0XQmxVtTPDZWh8cLOdZBbIqiBPZx24UQNHb6ZbMV50PzKo/Z2g60ptf+0FCREgHqbfc8fi6AKceLPmXMj3BhcawJcsdiYEhz2zsp703gSYuxfuwdvSauL+18JrTP2XKUzhTOh+L1R74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fNCC7ifC; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766398398; x=1797934398;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=nigwKEWUbyirDV4x3aN1CneJPEp6WCy5XmCrikSanbA=;
  b=fNCC7ifCOk1SWQLgFrxK9hyP1o5Dg0diCgDsJ7rTyH+/gMZvaGhNeZEp
   GprRpc+QQkwhskqp//QxnENSsduNFnZohMVXN8wfVIl31BPixiOGTKNOi
   sKjtYOILEYRwXdwW/pVhEbyH785L52ATSaLXI3aLn+pWxboBG9rIvPVDi
   hD0tzS7fWx+AQh+0mDPpq/yae1ZkwU3TNnKg6ElU+8WU8m5/p3qkIZ8W1
   KaPsFv9CyMuXP+huoQz4l4mp8a3JopXgeVosLx3qiTtS0r0Ru37LytbVu
   APWoSnC5oKmrLQ8QMKYGlkauszM0Q/RNcT3FafnYQUUgFcHGGwLhprRm0
   g==;
X-CSE-ConnectionGUID: hk07ijgCTO+aNRj4tsLZLQ==
X-CSE-MsgGUID: AX3JuDxIQ1ShOduPfWSSKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="70828946"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="70828946"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 02:13:15 -0800
X-CSE-ConnectionGUID: JY5BtPVWSb+6+SUiZJrt0w==
X-CSE-MsgGUID: g6L8d1lKQIWYz1ediZ10+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="230507146"
Received: from ipu5-build.bj.intel.com (HELO [10.238.153.130]) ([10.238.153.130])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 02:13:13 -0800
Subject: Re: [PATCH v2 4/4] media: ipu6/7: fix typo and coding errors in IPU
 mmu driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>, bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, antti.laakso@linux.intel.com,
 mehdi.djait@linux.intel.com
References: <20251222070629.2018807-1-bingbu.cao@intel.com>
 <20251222070629.2018807-5-bingbu.cao@intel.com>
 <aUkDw4wtdWmZwn39@kekkonen.localdomain>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <817e0b8a-accb-6d72-5a31-00274cba50e4@linux.intel.com>
Date: Mon, 22 Dec 2025 18:04:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <aUkDw4wtdWmZwn39@kekkonen.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sakari,

Thanks for the review.

On 12/22/25 4:39 PM, Sakari Ailus wrote:
> Hi Bingbu,
> 
> On Mon, Dec 22, 2025 at 03:06:29PM +0800, bingbu.cao@intel.com wrote:
>> From: Bingbu Cao <bingbu.cao@intel.com>
>>
>> Fix the coding errors in ipu6-mmu.c and ipu7-mmu.c, it has
>> no impact on current driver functionality, however it needs
>> a fix.
> 
> Please wrap paragraphs (using your $EDITOR perhaps?) to use as much as
> possible but still at most 75 characters per line. The above should look
> like:
> 
> Fix the coding errors in ipu6-mmu.c and ipu7-mmu.c, it has no impact on
> current driver functionality, however it needs a fix.

Thanks, I will.
> 
>>
>> Fixes: 9163d83573e4 ("media: intel/ipu6: add IPU6 DMA mapping API and MMU table")
>> Fixes: 71d81c25683a ("media: staging/ipu7: add IPU7 DMA APIs and MMU mapping")
> 
> Could you split this into two separate patches, please?

Yes, I will update in v3.

> 
>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>> ---
>>  drivers/media/pci/intel/ipu6/ipu6-mmu.c | 4 ++--
>>  drivers/staging/media/ipu7/ipu7-mmu.c   | 2 +-
>>  2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
>> index 6d1c0b90169d..85cc6d5b4dd1 100644
>> --- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
>> +++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
>> @@ -102,7 +102,7 @@ static void page_table_dump(struct ipu6_mmu_info *mmu_info)
>>  		if (mmu_info->l1_pt[l1_idx] == mmu_info->dummy_l2_pteval)
>>  			continue;
>>  
>> -		l2_phys = TBL_PHYS_ADDR(mmu_info->l1_pt[l1_idx];)
>> +		l2_phys = TBL_PHYS_ADDR(mmu_info->l1_pt[l1_idx]);
>>  		dev_dbg(mmu_info->dev,
>>  			"l1 entry %u; iovas 0x%8.8x-0x%8.8x, at %pap\n",
>>  			l1_idx, iova, iova + ISP_PAGE_SIZE, &l2_phys);
>> @@ -248,7 +248,7 @@ static u32 *alloc_l2_pt(struct ipu6_mmu_info *mmu_info)
>>  
>>  	dev_dbg(mmu_info->dev, "alloc_l2: get_zeroed_page() = %p\n", pt);
>>  
>> -	for (i = 0; i < ISP_L1PT_PTES; i++)
>> +	for (i = 0; i < ISP_L2PT_PTES; i++)
>>  		pt[i] = mmu_info->dummy_page_pteval;
>>  
>>  	return pt;
>> diff --git a/drivers/staging/media/ipu7/ipu7-mmu.c b/drivers/staging/media/ipu7/ipu7-mmu.c
>> index ded1986eb8ba..ea35cce4830a 100644
>> --- a/drivers/staging/media/ipu7/ipu7-mmu.c
>> +++ b/drivers/staging/media/ipu7/ipu7-mmu.c
>> @@ -231,7 +231,7 @@ static u32 *alloc_l2_pt(struct ipu7_mmu_info *mmu_info)
>>  
>>  	dev_dbg(mmu_info->dev, "alloc_l2: get_zeroed_page() = %p\n", pt);
>>  
>> -	for (i = 0; i < ISP_L1PT_PTES; i++)
>> +	for (i = 0; i < ISP_L2PT_PTES; i++)
>>  		pt[i] = mmu_info->dummy_page_pteval;
>>  
>>  	return pt;
> 

-- 
Best regards,
Bingbu Cao

