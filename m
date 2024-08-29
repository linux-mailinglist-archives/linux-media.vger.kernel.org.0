Return-Path: <linux-media+bounces-17061-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0CA96383B
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 04:35:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E2031C21776
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 02:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B48D2837F;
	Thu, 29 Aug 2024 02:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BceftKPy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC60918030
	for <linux-media@vger.kernel.org>; Thu, 29 Aug 2024 02:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724898904; cv=none; b=cYZTey7KwLNMbwHi97/il/MQPeNRXJKqbeIJkWmPdrxeD1toeym7k8NpYT56rwdzB4hoIByzy+7AH/M0hDYaZfP3uQ6s+/lSBUl4V/Uzlf4epCKP31XPIuZSGYxxaPHMaufzXToeXrgaP9gl2cb1fteRrUveFvbOo9bqlDr30bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724898904; c=relaxed/simple;
	bh=tO/Ij/30Y34nnHTmfHaZBI0j1mzByx0hPHop84Q7654=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=BmhjBKrqv9KGBfhYI0Fnwn/sTxQixKMJY4e5Jo0Adw30r+ilkKHsWJchcgPwP4ztCs0GqZLGI8jMYRzLi+RYSdphKCQUWJO0n1REabOsQiwnCcP92F8CatLr8MNAZh0LMOkWYfVb6rlccqm/f8JrVd1OxOIXUv3iKEbW6l+J/DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BceftKPy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724898903; x=1756434903;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=tO/Ij/30Y34nnHTmfHaZBI0j1mzByx0hPHop84Q7654=;
  b=BceftKPyu6lQvJlNIe3uaWBG30urKZKjQgRkhzCeCsY/K8Ju0OgLDYsW
   HXBnAP4F6tqt0+5SXRwNRATlV5MUncBx/f2Dfi2BY6PDjc267mYi6Q6k7
   6FhUQImDJY0RZ7pwKB3OPXl8Q1e+4dO2Y2/C1dW3dJKzqBguN95vilNgL
   bZ8VJRHvS1LCKr5PpWn6DGVIhNXcIp0oiiheqyP+lLKB/8/rD4+mQX07D
   YcRC2+G/zdcBrW8Ekn/5ImKZX7GkS7q2QLYvxwG65/FMuZRDYNQlkseF/
   JLSb//4/Zeoo/eVp9P6LnALTAvAFhHiBgR9/iUhAfAzBXe8RW5Lc5Zc0b
   A==;
X-CSE-ConnectionGUID: p6PkC8WKSc+NhRZpiG43zA==
X-CSE-MsgGUID: ZKS6SoDZTyWcq+CKcJm93Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23269591"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="23269591"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 19:35:02 -0700
X-CSE-ConnectionGUID: lDGxrRHVR56WyhRaXEdHHg==
X-CSE-MsgGUID: EbvWdJQyRYyWScEhEpUwEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="86628569"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by fmviesa002.fm.intel.com with ESMTP; 28 Aug 2024 19:35:00 -0700
Subject: Re: [PATCH -next] media: intel/ipu6: make use of dev_err_cast_probe()
To: Hongbo Li <lihongbo22@huawei.com>, sakari.ailus@linux.intel.com,
 bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org
References: <20240828120948.3696243-1-lihongbo22@huawei.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <38cb535a-956b-a836-3ba6-c530fbf63e2f@linux.intel.com>
Date: Thu, 29 Aug 2024 10:36:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240828120948.3696243-1-lihongbo22@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hongbo,

Thanks for your patch.

On 8/28/24 8:09 PM, Hongbo Li wrote:
> Using dev_err_cast_probe() to simplify the code.
> 
> No functional change.
> 
> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
> index bbd646378ab3..d10cbdd088ab 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6.c
> @@ -390,20 +390,18 @@ ipu6_isys_init(struct pci_dev *pdev, struct device *parent,
>  	isys_adev = ipu6_bus_initialize_device(pdev, parent, pdata, ctrl,
>  					       IPU6_ISYS_NAME);
>  	if (IS_ERR(isys_adev)) {
> -		dev_err_probe(dev, PTR_ERR(isys_adev),
> -			      "ipu6_bus_initialize_device isys failed\n");
>  		kfree(pdata);
> -		return ERR_CAST(isys_adev);
> +		return dev_err_cast_probe(dev, isys_adev,
> +				"ipu6_bus_initialize_device isys failed\n");

The indent here is not correct, ditto for others.

>  	}
>  
>  	isys_adev->mmu = ipu6_mmu_init(dev, base, ISYS_MMID,
>  				       &ipdata->hw_variant);
>  	if (IS_ERR(isys_adev->mmu)) {
> -		dev_err_probe(dev, PTR_ERR(isys_adev->mmu),
> -			      "ipu6_mmu_init(isys_adev->mmu) failed\n");
>  		put_device(&isys_adev->auxdev.dev);
>  		kfree(pdata);
> -		return ERR_CAST(isys_adev->mmu);
> +		return dev_err_cast_probe(dev, isys_adev->mmu,
> +				"ipu6_mmu_init(isys_adev->mmu) failed\n");
>  	}
>  
>  	isys_adev->mmu->dev = &isys_adev->auxdev.dev;
> @@ -436,20 +434,18 @@ ipu6_psys_init(struct pci_dev *pdev, struct device *parent,
>  	psys_adev = ipu6_bus_initialize_device(pdev, parent, pdata, ctrl,
>  					       IPU6_PSYS_NAME);
>  	if (IS_ERR(psys_adev)) {
> -		dev_err_probe(&pdev->dev, PTR_ERR(psys_adev),
> -			      "ipu6_bus_initialize_device psys failed\n");
>  		kfree(pdata);
> -		return ERR_CAST(psys_adev);
> +		return dev_err_cast_probe(&pdev->dev, psys_adev,
> +				"ipu6_bus_initialize_device psys failed\n");
>  	}
>  
>  	psys_adev->mmu = ipu6_mmu_init(&pdev->dev, base, PSYS_MMID,
>  				       &ipdata->hw_variant);
>  	if (IS_ERR(psys_adev->mmu)) {
> -		dev_err_probe(&pdev->dev, PTR_ERR(psys_adev->mmu),
> -			      "ipu6_mmu_init(psys_adev->mmu) failed\n");
>  		put_device(&psys_adev->auxdev.dev);
>  		kfree(pdata);
> -		return ERR_CAST(psys_adev->mmu);
> +		return dev_err_cast_probe(&pdev->dev, psys_adev->mmu,
> +				"ipu6_mmu_init(psys_adev->mmu) failed\n");
>  	}
>  
>  	psys_adev->mmu->dev = &psys_adev->auxdev.dev;
>

I think this change is not essential so far, it will break developers
who are still working on 6.10.

If you plan to use the new helper, IMHO it is better a series of patches
to address all instead of just ipu6 driver.

-- 
Best regards,
Bingbu Cao

