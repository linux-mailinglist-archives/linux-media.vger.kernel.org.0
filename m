Return-Path: <linux-media+bounces-19595-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5847299C739
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 12:35:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0727F1F23765
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 10:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E13170A15;
	Mon, 14 Oct 2024 10:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c4kjtBfW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CDD1684A0
	for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 10:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728902096; cv=none; b=UXY4do4MGMg8I0gAaJryECA2+Q03xogwoIpYUGCCEdRiBgKVcD3rSWajFxtYoFh39JYCn9hsFmwC8LOhTvnfTZsJeDSjbg/skhhSEfiC6Kt31uQRXGkgSFG1QTNx7321i4c+3DA0qY4PQSggAgBIKA77bxTSaSROwQ+yl2Re+FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728902096; c=relaxed/simple;
	bh=U3ODU/OAdym6AE9B0kfQ0CeMmlhr1eqpb1KWlV7sKBg=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Osx7NxQX6yJaQ9x03A2cMcZpKc2xc3N/7ThFVH+M8nF1y2gCLVat4aIdz6i6Z35d1ISP6auDzKz6baWVP7Nd0HwstSJ6k+2DHUqu3pqYbm/uh38KvezH0/IjMDxlo4q8S1iFxHPezoaCc5KeXkShqsWjxsM96s7yYpSPNhDXX+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c4kjtBfW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728902095; x=1760438095;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=U3ODU/OAdym6AE9B0kfQ0CeMmlhr1eqpb1KWlV7sKBg=;
  b=c4kjtBfW4D5NKFA8kBnhsD6+FfbxI+q2WTys34e3lYsxF7beipALRIiI
   uAg3OfXy0J+AQ8IOmV0cavtzTGLqZ0LoplNxFPZOvm5BSaEh5m5SvT3zR
   N06FjppNpTSOrMfTJ1tS7cdQNHqOt9/kooXqZeQe5yjnr/e7UEji6Ndpr
   av6bzU5aJ9IJDNf2NGllZbCWzxg+8DM6FzhYjLLrE6iN55WyttHwHio5n
   tH6z5Z/728SWVre0L2mZ1JnXIApv4XQIXhdTRv2EFmagQlHrkfBirHnbu
   dxoS9vtvCNlzn0QATSHigscXygpgGpK2Fx8r1NRawCRw4wx1e2CIjTX9e
   Q==;
X-CSE-ConnectionGUID: XfZAojs/TfyF3vMQghOSwA==
X-CSE-MsgGUID: CR1w6X9IRb2OfDSwqT5QoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="53662498"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="53662498"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 03:34:54 -0700
X-CSE-ConnectionGUID: uaLiIzw1TdumiESFWCdpHQ==
X-CSE-MsgGUID: 6rAYqSRLSsCWvnE5uMT6zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="100867664"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 03:34:53 -0700
Subject: Re: [PATCH 5/5] media: ipu6: use PFN_UP() and sg_virt() for code
 simplicity
To: Christoph Hellwig <hch@lst.de>, bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
 andriy.shevchenko@linux.intel.com
References: <20241014034732.3109440-1-bingbu.cao@intel.com>
 <20241014034732.3109440-5-bingbu.cao@intel.com>
 <20241014055401.GC20331@lst.de>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <9ff8b19d-963f-0221-3b4c-9629cd938924@linux.intel.com>
Date: Mon, 14 Oct 2024 18:31:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241014055401.GC20331@lst.de>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Christoph,

On 10/14/24 1:54 PM, Christoph Hellwig wrote:
> On Mon, Oct 14, 2024 at 11:47:32AM +0800, bingbu.cao@intel.com wrote:
>> +++ b/drivers/media/pci/intel/ipu6/ipu6-dma.c
>> @@ -139,7 +139,7 @@ void ipu6_dma_sync_sg(struct ipu6_bus_device *sys, struct scatterlist *sglist,
>>  	int i;
>>  
>>  	for_each_sg(sglist, sg, nents, i)
>> -		clflush_cache_range(page_to_virt(sg_page(sg)), sg->length);
>> +		clflush_cache_range(sg_virt(sg), sg->length);
> 
> Not new in this code, but what guarantees that this driver never sees
> highmem?
> 
>

The hardware is only in Intel 64-bit SoCs. And it is likely the driver
working with 64-bit kernel. I am not sure driver should handle highmem.

Any suggestions?

-- 
Best regards,
Bingbu Cao

