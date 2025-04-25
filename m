Return-Path: <linux-media+bounces-30970-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDA1A9BD1B
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 05:03:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79F1516A3C4
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 03:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5415F1714AE;
	Fri, 25 Apr 2025 03:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NY3Q2Aod"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166D42701AE;
	Fri, 25 Apr 2025 03:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745550228; cv=none; b=oLUd/VLRCycxozkZAbSyi7ZMTTgERKzuhxOS+mY24uGvCat0nQ/rL3uLO6lNfQoNSPmXoeM4F7fChBdO6KjASiKH43aRsRkQ8KbKkT+Zh3URMalDrw00LlU5OhcXSl+Jm/VcEJRbErkfwVgePFY3NY6apN2+zdq54EmxNltXBPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745550228; c=relaxed/simple;
	bh=PbrTW9Nb3NrHcVwh2uM1HWLU9tSO0MnJRZBwUbnBVL0=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=cAZDsZ5FSwfNaClyUBC6IHl8f65aB5QzlmRIyXZ90OXCufdKZPF8AKbrcbaGlrNg2Uf6gzg6Pt5MGw8i/8dShyLpL0SVS7sBeekP1t0QXeWgMotZAQ7cq1Hp/r4h1/LhCnP2bolIe8VJV+qeuDJ6TPslc8Lb3vziiSEk9ZBHdoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NY3Q2Aod; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745550227; x=1777086227;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=PbrTW9Nb3NrHcVwh2uM1HWLU9tSO0MnJRZBwUbnBVL0=;
  b=NY3Q2Aodw/+ExeUtZhELwWKZmiXIMAuZ2+xlMa3sdpfzw0VDL0OYxX6g
   ciY0SlETOdAY4x/9jizOtS+XdTR58zU5Jgcw//HFUNmPCozApZqHiXKek
   4HH2gGBaevOki7Pd7PT6UYHbJ4TQBg1p+rDfYZsc0uC3QExJhqfZJvWbG
   tEEmGB23rj6CxZsMb8h4A2W0kCKDYA1wxlaspwFTVHIsGMlPtiS+rCX0E
   MTiHOWIWG8IZSLVA4bUYpuz3Cj34WXwTRLjB9jgUaIYIzLyB3E16770vS
   hcZnT25Zn7x13CA6tEyXFi8UVFKCWc1UTSlvNzu8bTA7sY+iqcmpaanYu
   g==;
X-CSE-ConnectionGUID: ChGvJbipRnOoLizS4jH7pQ==
X-CSE-MsgGUID: fRRXzPL+TNa4qLaFoyNWbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="57404506"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="57404506"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 20:03:46 -0700
X-CSE-ConnectionGUID: AdA3GsKPSe+gUpEo+rXnjA==
X-CSE-MsgGUID: 2wUPDRRrROKdrn9fLmgO4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="136858169"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 20:03:43 -0700
Subject: Re: [PATCH 2/2] udmabuf: fix vmap missed offset page
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>, Huan Yang
 <link@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Andrew Morton
 <akpm@linux-foundation.org>, Dave Airlie <airlied@redhat.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
References: <20250415031548.2007942-1-link@vivo.com>
 <20250415031548.2007942-3-link@vivo.com>
 <IA0PR11MB7185796FAA2A065CBE4EAB37F8BB2@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <70a4ae40-dbfe-a8ff-c4d7-a11c35490b3a@linux.intel.com>
Date: Fri, 25 Apr 2025 10:59:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <IA0PR11MB7185796FAA2A065CBE4EAB37F8BB2@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit


On 4/22/25 1:22 PM, Kasireddy, Vivek wrote:
> Hi Huan,
> 
>> Subject: [PATCH 2/2] udmabuf: fix vmap missed offset page
>>
>> Before invoke vmap, we need offer a pages pointer array which each page
>> need to map in vmalloc area.
>>
>> But currently vmap_udmabuf only set each folio's head page into pages,
>> missed each offset pages when iter.
>>
>> This patch set the correctly offset page in each folio into array.
>>
>> Signed-off-by: Huan Yang <link@vivo.com>
>> Fixes: 5e72b2b41a21 ("udmabuf: convert udmabuf driver to use folios")
>> ---
>>  drivers/dma-buf/udmabuf.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>> index 79845565089d..af5200e360a6 100644
>> --- a/drivers/dma-buf/udmabuf.c
>> +++ b/drivers/dma-buf/udmabuf.c
>> @@ -120,7 +120,8 @@ static int vmap_udmabuf(struct dma_buf *buf, struct
>> iosys_map *map)
>>  		return -ENOMEM;
>>
>>  	for (pg = 0; pg < ubuf->pagecount; pg++)
>> -		pages[pg] = &ubuf->folios[pg]->page;
>> +		pages[pg] = folio_page(ubuf->folios[pg],
>> +				       ubuf->offsets[pg] >> PAGE_SHIFT);
> IIUC, it does not look like vm_map_ram() or the other functions it calls would
> write to these tail page pointers (struct page*), which should be safe even
> when HVO is enabled (based on your conversations with Muchun). However,
> I am wondering whether Bingbu can test this out with HVO enabled?

Sorry, I cannot test HVO enabled case. I was running my case with local
revert patch. :)

> 
> Regardless,
> Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> 
> Thanks,
> Vivek
> 
>>
>>  	vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
>>  	kvfree(pages);
>> --
>> 2.48.1
> 

-- 
Best regards,
Bingbu Cao

