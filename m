Return-Path: <linux-media+bounces-50211-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C39C7D020A4
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 11:10:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D72F3134B11
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 09:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C61D3659E0;
	Thu,  8 Jan 2026 08:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xba0RVsC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869C6331A5B
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 08:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767860857; cv=none; b=UL/Y8kKm+C9BGfsMAh/5dcFVPut5MKh3DZIleC4Q27pgRf4xBFgJD1dMaDtpwQlDvOyNctvjYUQldNQr3EDce8ZDuXBBeXYzqn5gn+Hxc5BL4wK4bDpZTXZ0A7WlCpvGqy2cKAezuLzlzOgty9MXpeW6bX+I+BXgXWPd7ImH3yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767860857; c=relaxed/simple;
	bh=VWBpGhwSayufKSEWIGxweG/DLsCs1ChBdDw40W45Xr4=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=upXGwbqPD/OrJ9BUMehNa6Mfag4hAtOPhwWJjU7SPVmUO49AA9Q5AtI/upQcnympoFY70vjoqHVBcForncblrsDFs8DJW0vCY0u6/Nxz/+02jv2FEK0Hjq9QzDqEPPKQpS8KQLH3IpfunFnhfHKcIgN+N6JrgbomnRCVaCZOTxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xba0RVsC; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767860848; x=1799396848;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=VWBpGhwSayufKSEWIGxweG/DLsCs1ChBdDw40W45Xr4=;
  b=Xba0RVsCihsgkQ83wFrUmKMFmEvTbCEukOZBR3iCQcZqN/uR334sgRQq
   tk0tPHb6jjnCA7LSneS/lB4fDuXVog/oiNvWjBtb/6h89itodx1+WlGOF
   epn5MHp6/tq96eaYa1c/V4gVa+4A4Z+458756FpuOXg/X/K0VHJi4P75g
   1pf09DbZxnmepKfJN6pfhimMLUWtz/R3oAMMdvwGqO+ZX/psAgFi/RG9G
   1ouSuyKZM0dOAJROkzysUVA5s07g3p8uJAN5UxI+YUgN+Ln2GNW8dBeSr
   lQ8P6s3X7jZcLBMS6ZQjCsDSdobFMENOZBwh/iT7QwUG1jN+UXaMv5alS
   Q==;
X-CSE-ConnectionGUID: zd3cx4s7SGeePkgmKfWERA==
X-CSE-MsgGUID: fZ4GqtRZRVGuxJ+4QHvRVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="68968999"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="68968999"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:27:26 -0800
X-CSE-ConnectionGUID: BR4+hHV+S8q1OMJho8tzaw==
X-CSE-MsgGUID: fbDJsECMSwqGLYatyRQ7uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="234295233"
Received: from ipu5-build.bj.intel.com (HELO [10.238.153.130]) ([10.238.153.130])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:27:25 -0800
Subject: Re: [PATCH v4 04/14] media: ipu6: Make symbols static
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: tian.shu.qiu@intel.com, antti.laakso@linux.intel.com,
 mehdi.djait@linux.intel.com
References: <20260108081712.543704-1-sakari.ailus@linux.intel.com>
 <20260108081712.543704-5-sakari.ailus@linux.intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <cf7d68bb-64de-62fd-6b37-b0b3173ee303@linux.intel.com>
Date: Thu, 8 Jan 2026 16:17:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260108081712.543704-5-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

On 1/8/26 4:17 PM, Sakari Ailus wrote:
> Make isys_setup_hw and isys_isr static as they're only used in a single
> file.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys.c | 4 ++--
>  drivers/media/pci/intel/ipu6/ipu6-isys.h | 2 --
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
> index ef01dcb635fa..5a8becff65ae 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
> @@ -269,7 +269,7 @@ static int isys_register_video_devices(struct ipu6_isys *isys)
>  	return ret;
>  }
>  
> -void isys_setup_hw(struct ipu6_isys *isys)
> +static void isys_setup_hw(struct ipu6_isys *isys)
>  {
>  	void __iomem *base = isys->pdata->base;
>  	const u8 *thd = isys->pdata->ipdata->hw_variant.cdc_fifo_threshold;
> @@ -341,7 +341,7 @@ static void ipu6_isys_csi2_isr(struct ipu6_isys_csi2 *csi2)
>  	}
>  }
>  
> -irqreturn_t isys_isr(struct ipu6_bus_device *adev)
> +static irqreturn_t isys_isr(struct ipu6_bus_device *adev)
>  {
>  	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
>  	void __iomem *base = isys->pdata->base;
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
> index 0e2c8b71edfc..7fb8cb820912 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
> @@ -181,8 +181,6 @@ void ipu6_cleanup_fw_msg_bufs(struct ipu6_isys *isys);
>  
>  extern const struct v4l2_ioctl_ops ipu6_isys_ioctl_ops;
>  
> -void isys_setup_hw(struct ipu6_isys *isys);
> -irqreturn_t isys_isr(struct ipu6_bus_device *adev);
>  void update_watermark_setting(struct ipu6_isys *isys);
>  
>  int ipu6_isys_mcd_phy_set_power(struct ipu6_isys *isys,
> 

-- 
Best regards,
Bingbu Cao

