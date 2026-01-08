Return-Path: <linux-media+bounces-50212-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 058D8D021EB
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 11:31:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A7F48316693D
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 09:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40B8E3659FD;
	Thu,  8 Jan 2026 08:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k3T/yL/f"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B408935E54D
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 08:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767860889; cv=none; b=BAjbJJxLrDrCxzvejGcQzmb6d7K26G9ZSs58sSbG4cv70FWQRWdCV2LOUd5KG+RqkzcsDgJ5lf79GblbRWxXD+fogjNaU0Z3+sRU5LuaumAjwIj/mVBxjXw+6ZQyt4w7zLmKrf3uviG9srpQ+R6OrqAODZdFLlUc72J7N0wxfpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767860889; c=relaxed/simple;
	bh=a1LuyxRWQ/wcrM502trgjSraTL2KOgLW/miLGTRXJ1k=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=QRlT8Bgq/e2ktKPlWd1whifePFMv3479N8mCieyYitCOuOhCOKAZKUg6WHcls1L0Nnp7njlPtlSshq+/z742Pdy1k4o6gFFWitulMRC0Oxgik4vGjjnSCrNxMhP6+6OeEvrzhdrs1fGG5YcTvkXIy6vP2WpsTO/6XqoNQ6opORo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k3T/yL/f; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767860877; x=1799396877;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=a1LuyxRWQ/wcrM502trgjSraTL2KOgLW/miLGTRXJ1k=;
  b=k3T/yL/fH8OCUC+L5nFVyUbHChd03H1GF9ZMx76a2DNJLnOjpjUvP51d
   eqO1k1s5gX5HkHoEhxwCfJKe+d8ogbHr7YxSO0xxU73ufUGK6/UEP3hHU
   0J3ZAIxVgHnSprxyqowg74E+iKA5qAe2utI9wNkemUmW1G/IXdkNrKX57
   qIBkpFI0n4XqfLq30cX8V0lSdnNxyvv9ZCFnVUHV4wEvxSFjqMISSrjP2
   71Pgsb9+wVe/BxqQd6dlZKjOIrl6vv3e53JcyPkYAkMNVQGv/tVEWY2TW
   5P2qFwW9EoahqhDcg66Sgz016I7I/25WurL1xsYD7yOiG50vDgQ3hmEeF
   w==;
X-CSE-ConnectionGUID: gv8b+ESXTdiHceaWLc17ow==
X-CSE-MsgGUID: i23cm6aySx2gI760uQMOAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="68969038"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="68969038"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:27:54 -0800
X-CSE-ConnectionGUID: M+DfWqP+SiqQHCkRKhHbzA==
X-CSE-MsgGUID: c8qgVyLPQaWF8yMjWHdYVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="234295296"
Received: from ipu5-build.bj.intel.com (HELO [10.238.153.130]) ([10.238.153.130])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:27:52 -0800
Subject: Re: [PATCH v4 06/14] media: ipu6: Don't check pipeline in
 stream_start
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: tian.shu.qiu@intel.com, antti.laakso@linux.intel.com,
 mehdi.djait@linux.intel.com
References: <20260108081712.543704-1-sakari.ailus@linux.intel.com>
 <20260108081712.543704-7-sakari.ailus@linux.intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <c52f99b3-bd84-6e48-1ed9-67c8e866f205@linux.intel.com>
Date: Thu, 8 Jan 2026 16:17:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260108081712.543704-7-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sakari,

Thanks for the patch.
Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

On 1/8/26 4:17 PM, Sakari Ailus wrote:
> A pipeline exists when start_streaming has returned so the check for
> start_streaming_called is equivalent to having media_pipeline. Use
> vb2_start_streaming_called() to perform the check.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> index fdf41b3cf60e..dcad6aafee29 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> @@ -355,8 +355,6 @@ static void buf_queue(struct vb2_buffer *vb)
>  		vb2_buffer_to_ipu6_isys_video_buffer(vvb);
>  	struct ipu6_isys_buffer *ib = &ivb->ib;
>  	struct device *dev = &av->isys->adev->auxdev.dev;
> -	struct media_pipeline *media_pipe =
> -		media_entity_pipeline(&av->vdev.entity);
>  	struct ipu6_fw_isys_frame_buff_set_abi *buf = NULL;
>  	struct ipu6_isys_stream *stream = av->stream;
>  	struct ipu6_isys_buffer_list bl;
> @@ -374,8 +372,8 @@ static void buf_queue(struct vb2_buffer *vb)
>  	list_add(&ib->head, &aq->incoming);
>  	spin_unlock_irqrestore(&aq->lock, flags);
>  
> -	if (!media_pipe || !vb->vb2_queue->start_streaming_called) {
> -		dev_dbg(dev, "media pipeline is not ready for %s\n",
> +	if (!vb2_start_streaming_called(vb->vb2_queue)) {
> +		dev_dbg(dev, "start_streaming hasn't been called yet on %s\n",
>  			av->vdev.name);
>  		return;
>  	}
> 

-- 
Best regards,
Bingbu Cao

