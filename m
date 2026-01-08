Return-Path: <linux-media+bounces-50210-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A7DD01AF8
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 09:57:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA937302CF65
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 08:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29284363C4C;
	Thu,  8 Jan 2026 08:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NABW+x8m"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B3835FF66
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 08:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767860846; cv=none; b=BgGz6/b4CmsYlU5EzwdRAtkO4Pxyn4Gysog2e7tnp1SgK429A4HqMICTCPqxEXBp53P9LPzA1zKe3wMb2EGEqoLjW3DgQKjmI9E8n7Eo0oP7KtpeRZa8+nnyD6pWGxin6Us/Nd3gY/F9dDXXxNWo2w+uGiG8ZfItQrsLgNRPYqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767860846; c=relaxed/simple;
	bh=/rzu+QNVQvhTGlxfod/pZXW4EMrEwB2uMPSI1e+2fhI=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=VKu1ncq1VLF1MX4Mgqrw4Supdpygo+7Qbe3sxm/DJr5RSDoT1n3I01g3pkoLlt8KMLA2cDVW1IXsNQFShBYm4osc5nA0UN08yaLFcE0k4JJA6lWZF5mIyKz81rlsIetTQ5CuRBuombfv6pTLB+jXJQJyiVZi9IU+QOwzHvDklBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NABW+x8m; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767860841; x=1799396841;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=/rzu+QNVQvhTGlxfod/pZXW4EMrEwB2uMPSI1e+2fhI=;
  b=NABW+x8m2A9oWE//XxQapsLrVoeuVhlX81wLHeAvBwVdZjiAqW8d+Q23
   aftjgHgKl09Cuxu/vsl5PYKWSAlWR/RD0fGsAKXcJFv69mS+7cDA0yIkm
   eMjCqR8eUXxenmUh84IRsfbinp/ocGcE4bylW8znRWxHapjSTptUWu1D3
   nN7mw7s+7kcDuUh7asVUYAmQWTmYDHzaE3LlBeaMU0aIv67xAcBAR7wZE
   pDXSZfMLjWP4WhjgRhQca16aumudUaBsGJ56TIXVUxVrYMnx8PkD1FXFq
   rMf2Njn8MHfp0sPd6EqocPd2k3/qJC+aR9y3kgEVsyXJp93cOJbt2o3LH
   g==;
X-CSE-ConnectionGUID: jv5bYoJxS72Ety6aS3X5Cw==
X-CSE-MsgGUID: AgJj/QwQREWYTDcVZvvhpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="68968981"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="68968981"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:27:13 -0800
X-CSE-ConnectionGUID: DzM7kKSSQPeqYcZrfJ5PcQ==
X-CSE-MsgGUID: 5jigGOKvS4yIdsPekduTMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="234295211"
Received: from ipu5-build.bj.intel.com (HELO [10.238.153.130]) ([10.238.153.130])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:27:12 -0800
Subject: Re: [PATCH v4 03/14] media: ipu6: Remove redundant driver data checks
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: tian.shu.qiu@intel.com, antti.laakso@linux.intel.com,
 mehdi.djait@linux.intel.com
References: <20260108081712.543704-1-sakari.ailus@linux.intel.com>
 <20260108081712.543704-4-sakari.ailus@linux.intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <ac11978f-50c6-6458-5dfc-d180e6594fbf@linux.intel.com>
Date: Thu, 8 Jan 2026 16:17:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260108081712.543704-4-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sakari,

Thanks for the patch.

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

On 1/8/26 4:17 PM, Sakari Ailus wrote:
> Both runtime PM resume and suspend callbacks check whether the driver's
> data is set for the device. This is done in probe(); drop the redundant
> checks.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
> index 226bfae21c16..ef01dcb635fa 100644
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

-- 
Best regards,
Bingbu Cao

