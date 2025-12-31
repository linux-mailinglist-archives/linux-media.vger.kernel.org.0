Return-Path: <linux-media+bounces-49780-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B41CEB513
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 06:57:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97870301C91D
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 05:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6769630FF30;
	Wed, 31 Dec 2025 05:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a3TbicnR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20B322D785
	for <linux-media@vger.kernel.org>; Wed, 31 Dec 2025 05:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767160615; cv=none; b=cuHHXofBZ2QX9G8JUmD7c0aD4Eih5VRKmGxP6JMs0ThSUkrenzViqi3cozahYcCLYOdDJsT6XcaaFAHK+91evPMuk4zNJCBiv1vCFTX5VMYewwAnKIWWtePilnMkWwQo++xNQ2+NQic8zA+Dyr3Ol3Mdhfb2kDmrQRUaxzASiaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767160615; c=relaxed/simple;
	bh=53pq08kUud2i+Ce/5zkjHpeaFxrcYgftrNb3s9nnIKQ=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=P8fZhxcybhiZfqYGx2Wq7nXTFS1syTsvYY87WHP3IcYmZdehxWor3dwFaZwG3BOZ3cYtMpkC/KIvfX6Ac4pSd4kW+eeS2Wfv7Vb7sPudJNgwWl8qj4c2WmGmVBH9JxWQl2wc93rL9d7Cl1ZVurz4ceRFngEmJQ+d2VOLJHOLjt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a3TbicnR; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767160614; x=1798696614;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=53pq08kUud2i+Ce/5zkjHpeaFxrcYgftrNb3s9nnIKQ=;
  b=a3TbicnRwuhC1KEKrRNDyl4tUjiA2X18XEkG60W76hPwRwUAogcVlPXk
   xhpsXJWErKcv11EKwrKyAFzTGA3/YuWwU37H7HLy9KRTZkMLdZ0fbN87c
   UQtsp92NvC5CN645Lo+66WCt+qWQp9YDIeLCKxLCao94rLl43AdnTGEYT
   EFbtNjh6m8Jjtmw17d61eV3bVxezLNt38bKXHIexJtcESpAi8Hz1H3RB2
   8YbuN09naPEAWZI54EcA4M+jWh/uS3IQPUB4hkTrl3z3+AUxKOctSjHb/
   431bRci2KpwUUur1D0XmwEmyXK8IS+T8Xq6KS5EPQkvG/HzDUUhHbp7Cx
   w==;
X-CSE-ConnectionGUID: uO08kc2DQYCXj5YUtD6i/Q==
X-CSE-MsgGUID: Ntc6k2okSNe7qt4UWSU7Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="71316866"
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="71316866"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 21:56:51 -0800
X-CSE-ConnectionGUID: ime6eCLSSWek7fwkCvENlA==
X-CSE-MsgGUID: SBjzLXI7TdSw0cikd46hZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="201373544"
Received: from ipu5-build.bj.intel.com (HELO [10.238.153.130]) ([10.238.153.130])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 21:56:49 -0800
Subject: Re: [PATCH v3 04/13] media: ipu6: Make symbols static
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: tian.shu.qiu@intel.com, antti.laakso@linux.intel.com,
 mehdi.djait@linux.intel.com
References: <20251230131013.75338-1-sakari.ailus@linux.intel.com>
 <20251230131013.75338-5-sakari.ailus@linux.intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <b5674c3a-8573-e5c0-c7eb-442ce383c85e@linux.intel.com>
Date: Wed, 31 Dec 2025 13:46:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251230131013.75338-5-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit


On 12/30/25 9:10 PM, Sakari Ailus wrote:
> Make isys_setup_hw and isys_isr static as they're only used in a single
> file.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys.c | 4 ++--
>  drivers/media/pci/intel/ipu6/ipu6-isys.h | 2 --
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
> index 4855eeb24980..1b527d9156e2 100644
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

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

-- 
Best regards,
Bingbu Cao

