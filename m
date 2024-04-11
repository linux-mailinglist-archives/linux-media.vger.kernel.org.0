Return-Path: <linux-media+bounces-9080-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A68E8A09E3
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 09:34:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34D14286D9D
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 07:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3080D13E897;
	Thu, 11 Apr 2024 07:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wd5+EuYM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A699A13E3FC
	for <linux-media@vger.kernel.org>; Thu, 11 Apr 2024 07:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712820864; cv=none; b=Hi2u/2BbS02hCxpTknKmUuIwSG6pmshyD/G6cJHsSkiCwd1DOvjs1e1sRvzjxMU553KZwjYiaUzQi1e86sL6duuy0ybDVdk3RFabezdXMw3tbT5TIK75t43hmbSSqGxoz04xT5Zf2ypSbiGSP2c9Z6NX9YhQP1xOM61xwwyBJNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712820864; c=relaxed/simple;
	bh=AvSDOHelRXuUgfVIrxo/KxP8vtlnvwxxTKrKclxJUEQ=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=GYZYeMtvYe9r7XQRYUqRJUlVCjC+PYPWuT30iynURjX31EcA/WAp0Vqjw2CGTOl5lUxTjqnov4ZQgGV9KgV6FW0GEIBIZJktZ1IOsiQmgzp/vI24NO5alTvj9Tg5trUvW/H0J4gywAZsTif7iOC+fdNkwnBZhYdOBMvstZy8vMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wd5+EuYM; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712820862; x=1744356862;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=AvSDOHelRXuUgfVIrxo/KxP8vtlnvwxxTKrKclxJUEQ=;
  b=Wd5+EuYM0hPATbRg5KyJblTL52gL0T7z/vGo++UguxI2dx9cUf4pMhHd
   +rj8l8cwYiS9xvF3jzAwRmD1+x9a132xP6YZJ60Q8pCvNLbvsx4VUCHnE
   70muQIl/NQ5FrtUDVFJDi+lRPVgI3jXrRw3XnLm3/Lq2T+Kg54wMkTiuR
   Iu0Yd23yOq2Sy+ku3k8HT1Hj/Gel9FcgkES4KpYnGcddf78AXcsWo2hya
   XRa8NQVNvOpYbY1Trx7v0KXI031oFuJcC93OlPDEYxcJLgngCKyl5/K3C
   VITIf6TqCcN2CI3XLserSVxZK0nAQxmFSPHjs1rA21ovIcrnQj0lDlybC
   w==;
X-CSE-ConnectionGUID: rURxJtViTk+fK22QiXO20Q==
X-CSE-MsgGUID: cnUFNNrZTNC3GnFziO2DOg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18775780"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="18775780"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 00:34:22 -0700
X-CSE-ConnectionGUID: iznNDsbXQQS0n/zqfdTMmg==
X-CSE-MsgGUID: fmREP6SKR0eyu8kWCSyV/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="58245476"
Received: from unknown (HELO [10.238.232.136]) ([10.238.232.136])
  by orviesa001.jf.intel.com with ESMTP; 11 Apr 2024 00:34:20 -0700
Subject: Re: [PATCH 1/1] media: staging: ipu3-imgu: Update firmware path
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>
References: <20240411065639.417134-1-sakari.ailus@linux.intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <79079812-fdd2-c712-6442-73bd5a40ba4c@linux.intel.com>
Date: Thu, 11 Apr 2024 15:35:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240411065639.417134-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sakari,

On 4/11/24 2:56 PM, Sakari Ailus wrote:
> Use the current firmware path in linux-firmware repository. Check the
> older paths still in order to avoid causing issues to the users.

We also meet similiar issues for IPU6(github driver), I am wondering
as the WHENCE file create link and do we still need such patch for IPU6?

> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/staging/media/ipu3/ipu3-css-fw.c | 4 +++-
>  drivers/staging/media/ipu3/ipu3-css-fw.h | 2 ++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3-css-fw.c b/drivers/staging/media/ipu3/ipu3-css-fw.c
> index 2b659b0ccca1..37482b626c3c 100644
> --- a/drivers/staging/media/ipu3/ipu3-css-fw.c
> +++ b/drivers/staging/media/ipu3/ipu3-css-fw.c
> @@ -117,7 +117,9 @@ int imgu_css_fw_init(struct imgu_css *css)
>  	unsigned int i, j, binary_nr;
>  	int r;
>  
> -	r = request_firmware(&css->fw, IMGU_FW_NAME_20161208, css->dev);
> +	r = request_firmware(&css->fw, IMGU_FW_NAME_IPU_20161208, css->dev);
> +	if (r == -ENOENT)
> +		r = request_firmware(&css->fw, IMGU_FW_NAME_20161208, css->dev);
>  	if (r == -ENOENT)
>  		r = request_firmware(&css->fw, IMGU_FW_NAME, css->dev);
>  	if (r)
> diff --git a/drivers/staging/media/ipu3/ipu3-css-fw.h b/drivers/staging/media/ipu3/ipu3-css-fw.h
> index f9403da75785..c956aa21df25 100644
> --- a/drivers/staging/media/ipu3/ipu3-css-fw.h
> +++ b/drivers/staging/media/ipu3/ipu3-css-fw.h
> @@ -9,6 +9,8 @@
>  #define IMGU_FW_NAME		"intel/ipu3-fw.bin"
>  #define IMGU_FW_NAME_20161208	\
>  	"intel/irci_irci_ecr-master_20161208_0213_20170112_1500.bin"
> +#define IMGU_FW_NAME_IPU_20161208	\
> +	"intel/ipu/irci_irci_ecr-master_20161208_0213_20170112_1500.bin"
>  
>  typedef u32 imgu_fw_ptr;
>  
> 

-- 
Best regards,
Bingbu Cao

