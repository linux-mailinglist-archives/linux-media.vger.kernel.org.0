Return-Path: <linux-media+bounces-29914-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A89A3A84267
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 14:04:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CA3119E6F4E
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 12:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EA40281531;
	Thu, 10 Apr 2025 12:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A111MoEi"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2711F0E39
	for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 12:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744286660; cv=none; b=LKf19Zhu9qOKtr5HuaESODHGpX668P2TeBbF0Z7qgH0Y/BWEePz1y/JMQD1bOqZJgNIU6JlYGJRedbC4ctH9PQWA2AXw5pHS7nvGF5vEDGtPiEgXhUtDwaFVdMOynMkD4PtqMrrMc+D3LLk/zJL1GNK/MV1NI83+8TqnmTx6KZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744286660; c=relaxed/simple;
	bh=E4iqD9/Joh2qJsPmEPhc+oITPYabawpZNyNCXnCpNaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f8RXY6E/jWXMRWj2N2e1f7ODyeYenfWYkocFQwC3ODYk8IZLdlk+jtE1nUvLXRmcTCGYuXw1sMtA17JcuLvzlrIzVxcgYEuxvfdk2IOmkH4HH5c1EhGtje1mgdMJu7tgA6hP/CZ8hWFQt7DImtRDVAMEAc67VhBMVP7dILb+f5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A111MoEi; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744286658; x=1775822658;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E4iqD9/Joh2qJsPmEPhc+oITPYabawpZNyNCXnCpNaM=;
  b=A111MoEicBHe2LRHP53MQ7oI4DvEmWi0egiMcwEIRw+x4VD/KfwkN8BD
   9dgZ1PsIaQratS0LnrK2h0/TYfqpb5/jvGvscsn+Oeak3G3y87/MKUhp6
   RhPuVrzZp/Cry79DIAFrGEKXH1140L6+13eteAVwQIzpTitP3k/SbZl23
   8Y4NlQq1YsaFsYLz5q1RGI/r6nQ5rhSLKyamBGygCMRPqWMMkpMEpBtju
   hxIjr5Kpiz3dB7hKbiCC8H6dfnS1olf2QU/T+6s55+7Hcj3Hj0Vx/UfMh
   Hi0/YnkYGVBV3GaaZfnOFH8qt8WH8prk8NoUlzd9tTZagkOQT7XPqv/eI
   g==;
X-CSE-ConnectionGUID: PvEghv9IR7WLXqCumHpXMQ==
X-CSE-MsgGUID: tiMAQtEeSHmap8tJ/5PGYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="57171915"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="57171915"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 05:04:18 -0700
X-CSE-ConnectionGUID: 1TIrNAUYRgWAvDq4uTDmqw==
X-CSE-MsgGUID: sFtzFM4LRpiW9JblOVAHbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="134063888"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 05:04:17 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6AC8711F7E5;
	Thu, 10 Apr 2025 15:04:14 +0300 (EEST)
Date: Thu, 10 Apr 2025 12:04:14 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH 2/7] media: intel/ipu6: Remove line_align
Message-ID: <Z_ezvvBNtpcZlAXW@kekkonen.localdomain>
References: <20250407134037.808367-1-stanislaw.gruszka@linux.intel.com>
 <20250407134037.808367-3-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407134037.808367-3-stanislaw.gruszka@linux.intel.com>

Hi Stanislaw,

Thanks for the set.

On Mon, Apr 07, 2025 at 03:40:32PM +0200, Stanislaw Gruszka wrote:
> isys->line_align value is only used in one place and we can just use
> the proper value directly there.
> 
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 2 +-
>  drivers/media/pci/intel/ipu6/ipu6-isys.c       | 1 -
>  drivers/media/pci/intel/ipu6/ipu6-isys.h       | 4 ----
>  3 files changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> index e36a21aa9040..3165904d7ebf 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> @@ -241,7 +241,7 @@ static void ipu6_isys_try_fmt_cap(struct ipu6_isys_video *av, u32 type,
>  	else
>  		*bytesperline = DIV_ROUND_UP(*width * pfmt->bpp, BITS_PER_BYTE);
>  
> -	*bytesperline = ALIGN(*bytesperline, av->isys->line_align);
> +	*bytesperline = ALIGN(*bytesperline, 64);

Is this value the same for ipu7?

-- 
Sakari Ailus

