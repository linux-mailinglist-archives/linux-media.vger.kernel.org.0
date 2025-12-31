Return-Path: <linux-media+bounces-49779-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2456BCEB510
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 06:53:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2E94301D64C
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 05:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CAB330FF25;
	Wed, 31 Dec 2025 05:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TOeq/uO3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6A326A1AF
	for <linux-media@vger.kernel.org>; Wed, 31 Dec 2025 05:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767160403; cv=none; b=e7cTD+LW4Is/6rNmBtv3hfCeADgOYhtB/I5VIieJGr5MHmCjTS5xQmsDZ3kWBUCh6B1W1J7gDatELEwImMlf9T05zw/kXuncLtrFs2UjeCWwbYaT5eBdaLzdSDttc+PLtM72XS9E+8BRn7AW+k08T0c4PBkMTUu7rVfXOPFmCxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767160403; c=relaxed/simple;
	bh=YY/Vxvf76+AyhznjN7/9m/FJsyX56k0YJACoypVA5Qw=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=VtRd37dpr2oKc5A+ZhMAC/OFzxHPWcYJBYKkaDwEku7/XiXBXSoels8awW4NdwKNLL9W8jd4unGzQdHOjRX3pDevUKU13vwok/yvr1YhQBgGAgwdpVit8fPSjJUmyYWJzm9Djg9MSwzg9nuKn10uo7jlbh03w9XPNOYt7q6sqK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TOeq/uO3; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767160401; x=1798696401;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=YY/Vxvf76+AyhznjN7/9m/FJsyX56k0YJACoypVA5Qw=;
  b=TOeq/uO3ySxXguqsrW9ztaybSnBOVOmKWMWEGNp2RIPftHJb6WGfGKQz
   PMSyc/oEFdjENvVjAvA+kVKn5LRlPo0Ov53BGKEtomBfuOFWbOTsver4q
   ssCBZlUCGCHQHhmmYHJEehlZ8qoNazZ/O88pMOuaA9FmJf1wlZ+gbOA1w
   Hn6NqBzRhzmWAllv1yGI0LwruE6YC+8LZ7wkG+9qh0AbXZjLLbqmyzbSb
   tXhXPaA5TGtchPxYwTwMFT+48haNYciyevNag9l2IYXvyl3Mt4jZmnZN3
   mQfAjbv5koYSfrMkUpmNaqPyoixlfHN3TyATp3OAmF6swPoaGWk99wI4y
   w==;
X-CSE-ConnectionGUID: ZVjN3USXRFyymJnlxYoapw==
X-CSE-MsgGUID: z5ldJgMpQMOStiw1yp0+oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="72589945"
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="72589945"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 21:53:21 -0800
X-CSE-ConnectionGUID: jtDQh0m1SPm3IjlHcb0bTg==
X-CSE-MsgGUID: d2U23QpcSY+CJfyGz2sx6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="201119100"
Received: from ipu5-build.bj.intel.com (HELO [10.238.153.130]) ([10.238.153.130])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 21:53:19 -0800
Subject: Re: [PATCH v3 03/13] media: ipu6: Remove redundant driver data checks
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: tian.shu.qiu@intel.com, antti.laakso@linux.intel.com,
 mehdi.djait@linux.intel.com
References: <20251230131013.75338-1-sakari.ailus@linux.intel.com>
 <20251230131013.75338-4-sakari.ailus@linux.intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <e0f6d568-63a3-b8d3-ca90-8742ebe843a2@linux.intel.com>
Date: Wed, 31 Dec 2025 13:43:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251230131013.75338-4-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sakari,

Thanks for this cleanup.

On 12/30/25 9:10 PM, Sakari Ailus wrote:
> Both runtime PM resume and suspend callbacks check whether the driver's
> data is set for the device. This is done in probe(); drop the redundant
> checks.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
> index eb45544a9f05..4855eeb24980 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
> @@ -857,9 +857,6 @@ static int isys_runtime_pm_resume(struct device *dev)
>  	unsigned long flags;
>  	int ret;
>  
> -	if (!isys)
> -		return 0;
> -
>  	ret = ipu6_mmu_hw_init(adev->mmu);
>  	if (ret)
>  		return ret;
> @@ -884,13 +881,9 @@ static int isys_runtime_pm_resume(struct device *dev)
>  static int isys_runtime_pm_suspend(struct device *dev)
>  {
>  	struct ipu6_bus_device *adev = to_ipu6_bus_device(dev);
> -	struct ipu6_isys *isys;
> +	struct ipu6_isys *isys = dev_get_drvdata(dev);
>  	unsigned long flags;
>  
> -	isys = dev_get_drvdata(dev);
> -	if (!isys)
> -		return 0;
> -
>  	spin_lock_irqsave(&isys->power_lock, flags);
>  	isys->power = 0;
>  	spin_unlock_irqrestore(&isys->power_lock, flags);
> 

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

-- 
Best regards,
Bingbu Cao

