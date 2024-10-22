Return-Path: <linux-media+bounces-20004-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4679A950C
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 02:43:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C53F01F23934
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 00:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B33DC17993;
	Tue, 22 Oct 2024 00:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kz6JTPvp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCC2320E
	for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 00:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729557793; cv=none; b=XYwwCdP9Bt0oqZFTDNNvRTcR8DNgAFGA3Y5v1hoSbyLG50Jhx+XwFnm8bxLiiJzdnsz3ZLhnixWHc84z/qu/PR3CVo5BHOcUJwzrcDr0j3pcSd9odFKsySTZxKrioF42YLJSrtafrp4SH0M6eiQH/KCNKwj0xgkuVfcCohI6Pas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729557793; c=relaxed/simple;
	bh=W7KkYAv2OHF5nNAIVr0w+fvgW/kTnswRgHaKtwUD1rc=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=fZAfxhmYZ4s/c1NLhm+RnqjmSmi6pgmSAjudUCr7R86kFvHtNRPmtjFFeCyOe5icacPOeyjA4m1FjyeAvxDYJ49+Y27FdROI/0zHZAqXtx2sDToJ7k1Mw3F9ofTUs4BtcmqidCjpqgq6HbhXoZJ6rgv5pIIHs2/TMmOc4upooQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kz6JTPvp; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729557791; x=1761093791;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=W7KkYAv2OHF5nNAIVr0w+fvgW/kTnswRgHaKtwUD1rc=;
  b=Kz6JTPvpdToaxZOmpA6d83pvnDVnrPx0wEvqLciBlfPCfuWDH+iZfrNK
   brrCEpfagoz6RjnT0y/2NtJ4BkAXw7bqRX8n7IgdBZ7ifwy+uCRDo7zRC
   A/J1hNotZ61lRuAjdYsvWyH/xZiZl5YSW25JLZ+G2i74Jjsxp7UmhJcuS
   sNHkx7WRyTh3yE9X8etdyzvqU8NuxTsT2cHtFtYH/fqNwDnNFm+hwayXR
   41mGXTSds54VqB0fk8CvygJeHy51HVKsme+WRWBBt27x1yxXPYm9yWP3s
   7tOqhAMm5DWhzhOeqnd+MtmMezZtRZCi03XVjrWr+J9wQ/Vu1iHLb8sK0
   Q==;
X-CSE-ConnectionGUID: qWHlTW6WQrenaF0w6UexEw==
X-CSE-MsgGUID: IQWsV30fQpKaxy9JqVJGFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="29184442"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="29184442"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 17:43:03 -0700
X-CSE-ConnectionGUID: 8MmwXsvJQyK7felp6Yz5sQ==
X-CSE-MsgGUID: vrlGnRofSYGXHy+ecVdy/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="79266778"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 17:43:00 -0700
Subject: Re: [PATCH v2] media: intel/ipu6: optimize the IPU6 MMU mapping and
 unmapping flow
To: Sakari Ailus <sakari.ailus@linux.intel.com>, bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, jianhui.j.dai@intel.com, tfiga@chromium.org
References: <20240816033121.3961995-1-bingbu.cao@intel.com>
 <ZxYShNcSzFMwap6G@kekkonen.localdomain>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <e97d9747-b6f3-bda6-874b-e6435e283bd9@linux.intel.com>
Date: Tue, 22 Oct 2024 08:39:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ZxYShNcSzFMwap6G@kekkonen.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sakari,

Thank you for the review.

On 10/21/24 4:36 PM, Sakari Ailus wrote:
> Hi Bingbu,
> 
> On Fri, Aug 16, 2024 at 11:31:21AM +0800, bingbu.cao@intel.com wrote:
>> From: Bingbu Cao <bingbu.cao@intel.com>
>>
>> ipu6_mmu_map() and ipu6_mmu_unmap() operated on a per-page basis,
>> leading to frequent calls to spin_locks/unlocks and
>> clflush_cache_range for each page. This will cause inefficiencies,
>> especially when handling large dma-bufs with hundreds of pages.
>>
>> This change enhances ipu6_mmu_map()/ipu6_mmu_unmap() with batching
>> process multiple contiguous pages. This significantly reduces calls
>> for spin_lock/unlock and clflush_cache_range() and improve the
>> performance.
>>
>> Signed-off-by: Jianhui Dai <jianhui.j.dai@intel.com>
>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> 
> Thanks for the patch.
> 
> Could you split this into three patches (at least) to make it more
> reviewable:
> 
> - Move l2_unmap() up to its new location.
> - Add unmapping optimisation.
> - Add mapping optimisation.
> 

Yes, I will split this.

-- 
Best regards,
Bingbu Cao

