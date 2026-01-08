Return-Path: <linux-media+bounces-50213-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 056B4D01F44
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 10:53:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA67E30552C6
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 09:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0B7E368277;
	Thu,  8 Jan 2026 08:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XxGsfjTB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A03362141
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 08:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767860942; cv=none; b=ZJQHLxgv2zdCzbwmSJc/ClqsEcKHWTogMJ7mwTWrL2hZA7RqWuRlxWj7QZ9g0/YvC/th1FcGvhRqT9B3leqCBZoiqwqldGnneAGUWtWXl+EYmw4qRBi9Bl0bdZswCuXVRInMNqdv1hc+khtAqg9iKeMDLSwjrGeJ2KeScxIEMno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767860942; c=relaxed/simple;
	bh=YUbVUI2fP5tgKgXu0/4nJJv+FstVimGJS+j8j6qWOj0=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=keAj7L8MVN2PPMO37go+pYRYdPrCpb/BAEkPslt2p7/I/+PY5pZUKkaPCR6rSYaDGI2GnX8YCobzWHbfU4ufe/sQJ+raV7TZeTvBTNg1kigTM8xNWPdDA/hglvK2PwPSomoCcbKHSdIKrHGhsnZTxXyn/bfsJaxKgxaqHG7iCRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XxGsfjTB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767860935; x=1799396935;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=YUbVUI2fP5tgKgXu0/4nJJv+FstVimGJS+j8j6qWOj0=;
  b=XxGsfjTBIf2GD7+YHoVh4v07X+5qtUFGdQSLBHbnIQM0R9PdwLghtcYD
   4N76o5tfBQKoqw31ShK9uAib1Z/wWMbiLnnmhoOYPptrMG38kM7tPbC2X
   gNNQGCN69wUdA0DgQAgVKci1w/bMuji7Gl851r8JvlbrFkLhXMe5AOCWf
   Ay0xwJ4K06fpEmI2ioQJzB0oCPRP8Wg/ZK2dCG+qVT0AX1r+Bl7gcJmAl
   ekzWd35Iw4x0Y4XmMXFxoYmWsp8HWL3FoB/IjRcvSqDX9EH4MXQpoHkgr
   ACW2dA5KxJfeEsFBrUIzJUh2D6AEhyeTWFqJlM9DSAxMDKxIigJCjaSXU
   A==;
X-CSE-ConnectionGUID: 7M+MlWyPQ0GXijaRcTExGQ==
X-CSE-MsgGUID: leYlZ8wYTYSCezFEEHD6yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="94702068"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="94702068"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:28:52 -0800
X-CSE-ConnectionGUID: AV1cv4UtRdaD9lEg1WRbkA==
X-CSE-MsgGUID: tC826ivRSLSj9anTrEssBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="207984680"
Received: from ipu5-build.bj.intel.com (HELO [10.238.153.130]) ([10.238.153.130])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:28:50 -0800
Subject: Re: [PATCH v4 07/14] media: ipu6: Close firmware streams on streaming
 enable failure
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: tian.shu.qiu@intel.com, antti.laakso@linux.intel.com,
 mehdi.djait@linux.intel.com
References: <20260108081712.543704-1-sakari.ailus@linux.intel.com>
 <20260108081712.543704-8-sakari.ailus@linux.intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <68f570e1-7cb8-5ce2-3c28-c1bea1196027@linux.intel.com>
Date: Thu, 8 Jan 2026 16:18:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260108081712.543704-8-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit


Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

On 1/8/26 4:17 PM, Sakari Ailus wrote:
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
>  
>  	return ret;
>  }
> 

-- 
Best regards,
Bingbu Cao

