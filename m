Return-Path: <linux-media+bounces-49778-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8583CEB4E9
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 06:48:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 017AC3025F9A
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 05:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00362E9EC7;
	Wed, 31 Dec 2025 05:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mud7Rbl8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3572F25F0
	for <linux-media@vger.kernel.org>; Wed, 31 Dec 2025 05:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767160099; cv=none; b=hy3oGzRypti+oiwTCVSFPDbmUAnVEFMSKzXLtYvro2Og7vKY3bBCd45eYBh9L+vw9oRANSqKIDQYnvZar+yqLrfzNqAtvy1ycogyT87VMhbkyUvdr0GR69hAoMUyU90lqihhkt3rV3zl1THLDLrnMPQ5LEDdL6puAEWMPBKuyLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767160099; c=relaxed/simple;
	bh=3Np4gEHTJolWLnmKgZeojX0edvu1aLUz/bdfOog1tG8=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=U8NJMcF2akCANH4ggOgpLcPlerdBmGty1NTfdTu+coeLip9N/IKFMYo7ehdHqXqOHE4XT0HDrdsBhn3n/CN9+MDNClV5kmvGeD3S5I3RYIrdXGsJz8zsXQbt4i12ejLrB9dTWPOpCd2uKAI+ZcbObUNa/59QikHR1LbR6b0Fx0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mud7Rbl8; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767160097; x=1798696097;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=3Np4gEHTJolWLnmKgZeojX0edvu1aLUz/bdfOog1tG8=;
  b=Mud7Rbl8uk6hYFeg3NV94Z7avJByJ25QSBCiZgKTXCzBvblJdv295Pb9
   VNx4sc+Q4by68lqblaqHgDI+Fih9X9FtX8m1FHub9S1CfsjXycRLOJ8Va
   ASz7KM0g/rZvPGxUak5zvQWJhMDKjFjFUtpyNhaudiOBhagpkd0OtR5AT
   qyLEz6PLYhpmwVVXax3801MC5wBbR6TbcKe3XGgOWa36F+osY4H3T2TiZ
   oHAwTD036i1obaBk0D/cHBeVK+hXgQ2HJY5Pbx46xJ8D6pKn2Up+PykUI
   1e4m5/QH3qe1STCbPYP1nZR+a1tkarcY+NCe5TDHORRFA0OQNShM0wwSd
   w==;
X-CSE-ConnectionGUID: YrhPnXOQSLWSHRjA4Hjm/g==
X-CSE-MsgGUID: pmRcQAW3RC2hUMcqlf0mxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="79462018"
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="79462018"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 21:48:15 -0800
X-CSE-ConnectionGUID: QD9b/H+vRKy+pZDTGW9t1Q==
X-CSE-MsgGUID: aCDK7lsbQj2VNUfDra6VkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="201614048"
Received: from ipu5-build.bj.intel.com (HELO [10.238.153.130]) ([10.238.153.130])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 21:48:14 -0800
Subject: Re: [PATCH v3 02/13] media: ipu6: Drop MMU hardware initialisation in
 probe()
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: tian.shu.qiu@intel.com, antti.laakso@linux.intel.com,
 mehdi.djait@linux.intel.com
References: <20251230131013.75338-1-sakari.ailus@linux.intel.com>
 <20251230131013.75338-3-sakari.ailus@linux.intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <6edacdf3-05ad-f5d4-d919-4b2e57cd2e91@linux.intel.com>
Date: Wed, 31 Dec 2025 13:38:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251230131013.75338-3-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sakari,

Thanks for the patch.

On 12/30/25 9:10 PM, Sakari Ailus wrote:
> The MMU hardware is initialised in the runtime PM resume callback. Do not
> do it in probe().

It's correct. The MMU hardware initialization was there as firmware
open happen during ISYS probe before, but now it was moved at stream
starting stage.

> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
> index fc0ec0a4b8f5..eb45544a9f05 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
> @@ -1070,10 +1070,6 @@ static int isys_probe(struct auxiliary_device *auxdev,
>  	if (!isys->csi2)
>  		return -ENOMEM;
>  
> -	ret = ipu6_mmu_hw_init(adev->mmu);
> -	if (ret)
> -		return ret;
> -

So, also need to remove the ipu6_mmu_hw_cleanup() below. :)

>  	/* initial sensor type */
>  	isys->sensor_type = isys->pdata->ipdata->sensor_type_start;
>  
> 

-- 
Best regards,
Bingbu Cao

