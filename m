Return-Path: <linux-media+bounces-49782-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D78DACEB568
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 07:22:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 64564300CA35
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 06:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9D430FF3A;
	Wed, 31 Dec 2025 06:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SQvDuIjk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B713718CBE1
	for <linux-media@vger.kernel.org>; Wed, 31 Dec 2025 06:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767162118; cv=none; b=rBnfwn8YovlJhV4OF4qCCA9kAs/VsgNbhoDMKTHyq0NEdEYdGQ8jM4saBYNmhBX6ORTjo486pP8N/g3aHt75KQ3Z497T6B3iYbVMEZY6+JKgiNz8RoPLLb5Ftk0ldcaLsf8yaUm18mMzzu+E9WsuL8M9iZ3QI8/ZtxO3ytTHjHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767162118; c=relaxed/simple;
	bh=QZKqufOJnbD/7LFgMlIDk/muuC8zZ2tbO036sLlCF/4=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Id9zJTq79OUnYLKwPu7CQn/0vEfzlKilbrHNV1eRA4licXYJO8yLp+Lw4F4m7w9+16C/I/YvHYXbkasNswiPBz9gz7KrdLx09Jgv+SAP6TFpkN00ySQQP5o6OmN+o5UekCX9vGB1dBIFbr3Q3PDZtDT5aZbTiLzOHUpo8emoUes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SQvDuIjk; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767162115; x=1798698115;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=QZKqufOJnbD/7LFgMlIDk/muuC8zZ2tbO036sLlCF/4=;
  b=SQvDuIjkWV6ks+WeQbu+qapnHwi5xPlRPBtYyYSkeg5FRxPFBwublBqy
   2Fnd5C4xLsPeFUKjc4pKxVM2X5fWPjC4tltussdk+vUMQwGBW3f82Y7k5
   JTA0qFq/8c4o/az9FVj86yrr4bFvvKkebgew7HZAyq14ENui1mQPAVu+j
   hpD3WmBgVvPaGT3Rlfs9FBVWgGDLnVFwHf2yk0RYHdm/2e6MkDHJnQVby
   q1fmNkV4ezsGAua2loBFDqdd4CIjBtyQkp2jU0p1PhHo9JQKIPrBzQ4jd
   lHB5fxzLNi96UmH4PUtbwOQIj6dnMXOkAcHhJ+IgVcviVTxxBueagq03u
   w==;
X-CSE-ConnectionGUID: M8bkno0vSnuZsACEdogXfA==
X-CSE-MsgGUID: CaEAgaLNQ3O2W8SEy/09jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="72355004"
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="72355004"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 22:21:55 -0800
X-CSE-ConnectionGUID: rujosix4TvmJmNO6Lwdf9w==
X-CSE-MsgGUID: a/P1E/ZwTf6PC/v+iBEh+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="201388578"
Received: from ipu5-build.bj.intel.com (HELO [10.238.153.130]) ([10.238.153.130])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 22:21:54 -0800
Subject: Re: [PATCH v3 07/13] media: ipu6: Close firmware streams on streaming
 enable failure
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: tian.shu.qiu@intel.com, antti.laakso@linux.intel.com,
 mehdi.djait@linux.intel.com
References: <20251230131013.75338-1-sakari.ailus@linux.intel.com>
 <20251230131013.75338-8-sakari.ailus@linux.intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <6594dfc9-bfb9-a99e-fe92-da2493397e9d@linux.intel.com>
Date: Wed, 31 Dec 2025 14:11:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251230131013.75338-8-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sakari,

Thanks for the patch.

On 12/30/25 9:10 PM, Sakari Ailus wrote:
> When enabling streaming fails, the stream is stopped in firmware but not
> closed. Do this to release resources on firmware side.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> index dec8f5ffcfa5..919b77107cef 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> @@ -1066,6 +1066,7 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
>  
>  out_media_entity_stop_streaming_firmware:
>  	stop_streaming_firmware(av);
> +	close_streaming_firmware(av);

It looks the close_streaming_firmware() has no chance to run if
v4l2_subdev_disable_streams() above failed. Beside, the
stop_streaming_firmware() is better called after subdev
disable_streams().

>  
>  	return ret;
>  }
> 

-- 
Best regards,
Bingbu Cao

