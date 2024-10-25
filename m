Return-Path: <linux-media+bounces-20283-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1079E9AF8E2
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 06:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6764283758
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 04:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B389218C03C;
	Fri, 25 Oct 2024 04:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FSl/AYHp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9867107A0
	for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 04:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729830118; cv=none; b=dXd3eeHPdmnXFhOhZgmTSGDjg4wmzzFDtGhq7P3MzCeeIMfDm46ylxxa1rDUeRKD7SABUc8QIECA+vRGl/I/AOtAkMrEDmu0t0XSXJOUURmQXP71Oxt6HdNWUMs1WCTylErHXLhYym7W6NfSOWkhFOR7NqbjzTzY/eZjNlWXcVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729830118; c=relaxed/simple;
	bh=BvoFjVuCy/q6coYWWhJ+1awHC8tvH+8QtktSzmtf4vE=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=At+KTWlWpHtJeHKobDD7uZXxEryf7lti4ranusYO4yWgfFhIDkh8x8K2Aptswf5xYI45C9X3vWikisZZzPik2VmGI9wuDBvv/ctqoM2+CRDc2LJRurW164ANNPmaTJ4QMQ5C2xOy+yB59Zx5L/4jiNazfyiAeoesaF9Q7pi5HgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FSl/AYHp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729830116; x=1761366116;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=BvoFjVuCy/q6coYWWhJ+1awHC8tvH+8QtktSzmtf4vE=;
  b=FSl/AYHpaw94i7em/+ORDi/tcDWDMP+4WVzfauUqmWq9xXFi9YLPaeC2
   6ylszw+Hb4mpyC8bfH329ypaBaZiV7G0OfpY1N7593YV//54eoTxqbDL/
   xJQJB4vWLDEQkk+DmEk1+J/9lNyqoIWWM9V9RuUTSdmCZlKGCMbM4BXX6
   Bi0M8HzmrM70rGCagJkeiUI8a8w8jGCoehsaD48SyRsw6r80djh4SzB0+
   f4aI49E+Ia5CqmuiDRDtMGfO9DaKABDr4ygd9QDNE6+sVXGwmtdcFMbhU
   io3C77I1Qi/37DXNAf+ZJ3vv08TXVB1C3iHpf4Q4pMVzAq3wd0vytIgUb
   A==;
X-CSE-ConnectionGUID: Hdff2MBhQR2KmSbHMSf1UA==
X-CSE-MsgGUID: A65j3sysSVu59hjMFfZuDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="32348424"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="32348424"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 21:21:55 -0700
X-CSE-ConnectionGUID: 9Hi1L6vVTMCtC4EfcM6Cpw==
X-CSE-MsgGUID: qeYDIjEKSxGMAU8GIj7/Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="104121094"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 21:21:54 -0700
Subject: Re: [PATCH 1/4] media: ipu6: move the l2_unmap() up before l2_map()
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>
Cc: linux-media@vger.kernel.org
References: <1729754679-6402-1-git-send-email-bingbu.cao@intel.com>
 <ZxoinlZK_hJcJwcF@kekkonen.localdomain>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <748797d4-1e33-5341-a006-1632c5217f67@linux.intel.com>
Date: Fri, 25 Oct 2024 12:18:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ZxoinlZK_hJcJwcF@kekkonen.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sakari,

Thanks for the review.

On 10/24/24 6:34 PM, Sakari Ailus wrote:
> Hi Bingbu,
> 
> Thank you for the update.
> 
> On Thu, Oct 24, 2024 at 03:24:36PM +0800, Bingbu Cao wrote:
>> l2_map() and l2_unmap() are better to be grouped together, and
>> l2_unmap() could also be called in l2_map() for error handling.
> 
> Can you confirm there are no changes to the function itself? This should be
> part of the commit message.

Yes, the l2_unmap() here is not changed.

> 
> I'd also add that l2_unmap() will soon be called from l2_map(), rather than
> being something that could be done.

I will add that into v2.
> 
>>
>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>> Signed-off-by: Jianhui Dai <jianhui.j.dai@intel.com>
>> ---
>>  drivers/media/pci/intel/ipu6/ipu6-mmu.c | 80 ++++++++++++++++-----------------
>>  1 file changed, 40 insertions(+), 40 deletions(-)
>>
>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
>> index c3a20507d6db..9ea6789bca5e 100644
>> --- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
>> +++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
>> @@ -252,6 +252,46 @@ static u32 *alloc_l2_pt(struct ipu6_mmu_info *mmu_info)
>>  	return pt;
>>  }
>>  
>> +static size_t l2_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
>> +		       phys_addr_t dummy, size_t size)
>> +{
>> +	u32 l1_idx = iova >> ISP_L1PT_SHIFT;
>> +	u32 iova_start = iova;
>> +	unsigned int l2_idx;
>> +	size_t unmapped = 0;
>> +	unsigned long flags;
>> +	u32 *l2_pt;
>> +
>> +	dev_dbg(mmu_info->dev, "unmapping l2 page table for l1 index %u (iova 0x%8.8lx)\n",
>> +		l1_idx, iova);
>> +
>> +	spin_lock_irqsave(&mmu_info->lock, flags);
>> +	if (mmu_info->l1_pt[l1_idx] == mmu_info->dummy_l2_pteval) {
>> +		spin_unlock_irqrestore(&mmu_info->lock, flags);
>> +		dev_err(mmu_info->dev,
>> +			"unmap iova 0x%8.8lx l1 idx %u which was not mapped\n",
>> +			iova, l1_idx);
>> +		return 0;
>> +	}
>> +
>> +	for (l2_idx = (iova_start & ISP_L2PT_MASK) >> ISP_L2PT_SHIFT;
>> +	     (iova_start & ISP_L1PT_MASK) + (l2_idx << ISP_PAGE_SHIFT)
>> +		     < iova_start + size && l2_idx < ISP_L2PT_PTES; l2_idx++) {
>> +		l2_pt = mmu_info->l2_pts[l1_idx];
>> +		dev_dbg(mmu_info->dev,
>> +			"unmap l2 index %u with pteval 0x%10.10llx\n",
>> +			l2_idx, TBL_PHYS_ADDR(l2_pt[l2_idx]));
>> +		l2_pt[l2_idx] = mmu_info->dummy_page_pteval;
>> +
>> +		clflush_cache_range((void *)&l2_pt[l2_idx],
>> +				    sizeof(l2_pt[l2_idx]));
>> +		unmapped++;
>> +	}
>> +	spin_unlock_irqrestore(&mmu_info->lock, flags);
>> +
>> +	return unmapped << ISP_PAGE_SHIFT;
>> +}
>> +
>>  static int l2_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
>>  		  phys_addr_t paddr, size_t size)
>>  {
>> @@ -336,46 +376,6 @@ static int __ipu6_mmu_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
>>  	return l2_map(mmu_info, iova_start, paddr, size);
>>  }
>>  
>> -static size_t l2_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
>> -		       phys_addr_t dummy, size_t size)
>> -{
>> -	u32 l1_idx = iova >> ISP_L1PT_SHIFT;
>> -	u32 iova_start = iova;
>> -	unsigned int l2_idx;
>> -	size_t unmapped = 0;
>> -	unsigned long flags;
>> -	u32 *l2_pt;
>> -
>> -	dev_dbg(mmu_info->dev, "unmapping l2 page table for l1 index %u (iova 0x%8.8lx)\n",
>> -		l1_idx, iova);
>> -
>> -	spin_lock_irqsave(&mmu_info->lock, flags);
>> -	if (mmu_info->l1_pt[l1_idx] == mmu_info->dummy_l2_pteval) {
>> -		spin_unlock_irqrestore(&mmu_info->lock, flags);
>> -		dev_err(mmu_info->dev,
>> -			"unmap iova 0x%8.8lx l1 idx %u which was not mapped\n",
>> -			iova, l1_idx);
>> -		return 0;
>> -	}
>> -
>> -	for (l2_idx = (iova_start & ISP_L2PT_MASK) >> ISP_L2PT_SHIFT;
>> -	     (iova_start & ISP_L1PT_MASK) + (l2_idx << ISP_PAGE_SHIFT)
>> -		     < iova_start + size && l2_idx < ISP_L2PT_PTES; l2_idx++) {
>> -		l2_pt = mmu_info->l2_pts[l1_idx];
>> -		dev_dbg(mmu_info->dev,
>> -			"unmap l2 index %u with pteval 0x%10.10llx\n",
>> -			l2_idx, TBL_PHYS_ADDR(l2_pt[l2_idx]));
>> -		l2_pt[l2_idx] = mmu_info->dummy_page_pteval;
>> -
>> -		clflush_cache_range((void *)&l2_pt[l2_idx],
>> -				    sizeof(l2_pt[l2_idx]));
>> -		unmapped++;
>> -	}
>> -	spin_unlock_irqrestore(&mmu_info->lock, flags);
>> -
>> -	return unmapped << ISP_PAGE_SHIFT;
>> -}
>> -
>>  static size_t __ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info,
>>  			       unsigned long iova, size_t size)
>>  {
>> -- 
>> 2.7.4
>>
> 

-- 
Best regards,
Bingbu Cao

