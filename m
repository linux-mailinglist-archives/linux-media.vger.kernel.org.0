Return-Path: <linux-media+bounces-50209-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EB3D02007
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 11:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FCB2308F1A6
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 09:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9014835F8D9;
	Thu,  8 Jan 2026 08:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T2Awrd+6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9A4331A5B
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 08:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767860818; cv=none; b=uQ8xky7wpx4Q7+RQqHjrnSfIr3Xw8l3q2Yh4XUPaDqsnsjx9/HlKS1Q6SbL83pZda0dBoqdVDQdf6AhQuVWabAE5vXQM0QhJ+3d3eEOPZ9HGPHWnVI+DvlgSsNaGD23TXFnDVdReHXXl9Nj19e8lc7RZ3QlFZyU3rLxJmR6S2n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767860818; c=relaxed/simple;
	bh=+aomt6MrVpzzXxUx/+uQwMJdRuu+/jP8da7FUGs3q5s=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=oQC2tXHZPqlyufAscjTcnxTliQHRFrI5EgyGJIG1FN1GHp9OSvqFbcEZsafD6N7HvFdDBs4PPcWgGPyKVUJNDDuZ3UOJP5SsHiFTtBBIoN8SPV0rQMGYez/m9EqxQ2jxIyLmyJzvrl8fS4Yr8Pz4V8ktmLCQj5+wLwmKMwBIJuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T2Awrd+6; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767860815; x=1799396815;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=+aomt6MrVpzzXxUx/+uQwMJdRuu+/jP8da7FUGs3q5s=;
  b=T2Awrd+6JN6pyqNmiKYCTxY6YmXWrPF+jQgWQ/izEY2sUAAumO7ruA5N
   2BP2xh+twF4gkjLrSUIMCBKaRkAE9HgKo8sTfC6bSD0RZmkNvfxziC9oZ
   Ft7diYIUNy0mI9CVx42E3OZ0Muq/xVWr01wsw1xIx5NKDd+/SR2lShRAi
   CD0J8zOR1iBEF7qUUJqyUrZTnLFFLPq+yJ4hUxeNmrzafJbfuAfk5w5BY
   0eAK/ky5zRH2JwWQDjq0Ui6l2widifjtXfskOxQaFLw6LE8bL2xGdZAQv
   pvEeibgP/b7atF4npiYw9P3sbdT+qv3ut+B+PdB/eX440uGJ0I21/b7+/
   g==;
X-CSE-ConnectionGUID: 7gQu/2fHRMiXCwTdvkFEUg==
X-CSE-MsgGUID: jMqdZxhERbiEfn2LamsnFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="68968947"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="68968947"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:26:50 -0800
X-CSE-ConnectionGUID: 0JGKCIqeRy2nxSu+fONOSw==
X-CSE-MsgGUID: hJjR0PlTTlCZeVRGL1Kq+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="234295174"
Received: from ipu5-build.bj.intel.com (HELO [10.238.153.130]) ([10.238.153.130])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:26:49 -0800
Subject: Re: [PATCH v4 02/14] media: ipu6: Drop MMU hardware initialisation in
 probe()
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: tian.shu.qiu@intel.com, antti.laakso@linux.intel.com,
 mehdi.djait@linux.intel.com
References: <20260108081712.543704-1-sakari.ailus@linux.intel.com>
 <20260108081712.543704-3-sakari.ailus@linux.intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <229c6bb5-eac1-56d4-7cb1-8f25c66defcb@linux.intel.com>
Date: Thu, 8 Jan 2026 16:16:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260108081712.543704-3-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

On 1/8/26 4:16 PM, Sakari Ailus wrote:
> The MMU hardware is initialised and cleaned up in the runtime PM resume
> callbacks. Do not do this in probe().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
> index fc0ec0a4b8f5..226bfae21c16 100644
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
>  	/* initial sensor type */
>  	isys->sensor_type = isys->pdata->ipdata->sensor_type_start;
>  
> @@ -1125,8 +1121,6 @@ static int isys_probe(struct auxiliary_device *auxdev,
>  	if (ret)
>  		goto free_fw_msg_bufs;
>  
> -	ipu6_mmu_hw_cleanup(adev->mmu);
> -
>  	return 0;
>  
>  free_fw_msg_bufs:
> @@ -1148,8 +1142,6 @@ static int isys_probe(struct auxiliary_device *auxdev,
>  	mutex_destroy(&isys->mutex);
>  	mutex_destroy(&isys->stream_mutex);
>  
> -	ipu6_mmu_hw_cleanup(adev->mmu);
> -
>  	return ret;
>  }
>  
> 

-- 
Best regards,
Bingbu Cao

