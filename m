Return-Path: <linux-media+bounces-19529-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5D899BFB4
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 08:03:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 025691C2218E
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 06:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2736F13CFB6;
	Mon, 14 Oct 2024 06:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IMBZ0p2H"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09BA762F7
	for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 06:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728885783; cv=none; b=mYJVsPdqSS9TEjLvGdD9dDoPk/nJRVz3H+kPREx/hoAWjHjJ9QCZoixsa2MVfuWLe9LDTBP5ZtGwxUk7KuL65y5gwhQ1/YSAXVbxkDekse+PjgjQh+s7ToHAwezePmQd0m7Q6xYD+dADhFWN96YOgO8I+at8GV2bIyXcrsvsAV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728885783; c=relaxed/simple;
	bh=Lv/d5xi2pzN7TtLBoqzbgl7q5JqvUMaLeJqxvyvr49Y=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=q8lGXcGiz7GWRIDHUcybSSA2tK0Rs2bGlaNaxjMxUwArRst5Df49PQZP7NJXSqHxzZQdy6Oh4wCAveJae5f+JMiMypYGJyF3B//8BkN4+PridiCKzKXAemlW3iJ0GuW8SM23DY6/0LyPz1gk8asuIVBsJOUFBo29BQjyqHWBBT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IMBZ0p2H; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728885782; x=1760421782;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Lv/d5xi2pzN7TtLBoqzbgl7q5JqvUMaLeJqxvyvr49Y=;
  b=IMBZ0p2HLrrJNx7/wWPbDVOypQzwW0G9iviMXTZ1XUQEAk95El6X4ycN
   MJxcvMIEIkcuHYelixH83wyV6pOJ9V4w8qy4iUAgZCQaQWgNzrkOG68Sp
   C0YFF1okSq1H5rixuf9aEl57SwiyL+ObMR5mcf2ADpCapyWFmxnV4d2RL
   rMdTU20bBlAR5FPOYHRPPk11gOecgJV40BooReN7zJzA1YjJhl8jjbYpn
   XhCta2vePveCxuZ2W7BIsSH0nt87zTFTlI/Y69aiRQPJuDjShBWGjYUAr
   dlrA7biOryMlHjYIO2SvRNg3ftfSpaFgfApD4QYbFI/BE9/4sZE2vV+PQ
   g==;
X-CSE-ConnectionGUID: ZskmoTH4QW+ALtxgPsDnaA==
X-CSE-MsgGUID: HJxqtHKYREmzUZ5DabGahQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="39599851"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="39599851"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 23:03:01 -0700
X-CSE-ConnectionGUID: /FNoydiJQSuX1wGZzBWzFg==
X-CSE-MsgGUID: Wnh9lFeXRdOmBc2HyXPOzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="77487110"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 23:02:59 -0700
Subject: Re: [PATCH 1/5] media: ipu6: not override the dma_ops of device in
 driver
To: Christoph Hellwig <hch@lst.de>, bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
 andriy.shevchenko@linux.intel.com
References: <20241014034732.3109440-1-bingbu.cao@intel.com>
 <20241014055306.GB20331@lst.de>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <df29c907-4f6a-c7e0-2668-47bd907e40d0@linux.intel.com>
Date: Mon, 14 Oct 2024 13:59:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241014055306.GB20331@lst.de>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Christoph,

Thanks for the review comments.

On 10/14/24 1:53 PM, Christoph Hellwig wrote:
> On Mon, Oct 14, 2024 at 11:47:28AM +0800, bingbu.cao@intel.com wrote:
>> From: Bingbu Cao <bingbu.cao@intel.com>
>>
>> DMA ops are a helper for architectures and not for drivers to override
>> the DMA implementation.  Driver should not override the DMA
>> implementation. This patch remove the dma_ops override and expose the
>> IPU6 DMA mapping APIs.
> 
> That's a good rationale, but it might make sense to mention what you're
> actually changing here as well.

Ack. I will reword the message.

> 
>> +	ret = dma_map_sgtable(&pdev->dev, sgt, DMA_TO_DEVICE, 0);
>> +	if (ret) {
>> +		sg_free_table(sgt);
>> +		goto out;
>> +	}
>> +
>> +	ret = ipu6_dma_map_sgtable(sys, sgt, DMA_TO_DEVICE, 0);
> 
> This looks like the only user of ipu6_dma_map_sgtable, any reason
> to not open code it here?

The Intel IPU6 driver contains 2 modules, this symbol is defined in
intel_ipu6 module. The map/unmap_sgtable are also used by another
driver - intel_ipu6_isys.

> 
>>  	kfree(pages);
>> @@ -607,7 +615,10 @@ EXPORT_SYMBOL_NS_GPL(ipu6_buttress_map_fw_image, INTEL_IPU6);
>>  void ipu6_buttress_unmap_fw_image(struct ipu6_bus_device *sys,
>>  				  struct sg_table *sgt)
>>  {
>> -	dma_unmap_sgtable(&sys->auxdev.dev, sgt, DMA_TO_DEVICE, 0);
>> +	struct pci_dev *pdev = sys->isp->pdev;
>> +
>> +	ipu6_dma_unmap_sgtable(sys, sgt, DMA_TO_DEVICE, 0);
> 
> Same for ipu6_dma_unmap_sgtable
> 

-- 
Best regards,
Bingbu Cao

