Return-Path: <linux-media+bounces-26040-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03525A320FE
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 09:26:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5BE2165A92
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 08:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021FE205ABE;
	Wed, 12 Feb 2025 08:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i36AnJPw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1361D86F2
	for <linux-media@vger.kernel.org>; Wed, 12 Feb 2025 08:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739348716; cv=none; b=C6tq0SM/WndzLBR3wdjAzwdlnY5R3nrMr15+VN75j6FRhxJcRcryI9UKRCCRiSlWDIi/JgAznvTXITU8eRPaYxIxYjQe8q5P0dWUP2b0Pier86qkejbcZ3az/Ds1OlB+7PvoIdjgE1feArD3YOJC/lT+LYr8eLsDa3RU2PXbuqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739348716; c=relaxed/simple;
	bh=T+2XULw3NO/13ht8Bz+NejCreRZ3ibkjLlQbT73utgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bNtp5/4HG1uPzzLWD6yF1vK3azqIEamYB1yfhAGM5AZRKBa5bMqXEtQ6pMTaj9msIMJuejIv1aspkHBKWZKDnO2wUecTRD7eOeTpHgX7FMFxMi8HSBopuh1o89a+p1/0fp19FbEjPLH1nKGsxT+cYjFGrvOJgcxt5lTehygxCw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i36AnJPw; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739348715; x=1770884715;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T+2XULw3NO/13ht8Bz+NejCreRZ3ibkjLlQbT73utgw=;
  b=i36AnJPwkhQ3CNbb7g9JDbfmXNbrRW0X28D+1TzpZyrMDCNSLqnj9sBP
   c6NsixMcBcO6Y6I3Y7Io6GkNNt1+AVtTUpWTw2X9sBQwaPas3GkqySSV9
   UFMG2GVMnFf/EMdkgWk1TDh30si7LfnOByMXbHonLD9XJyTUVGy4PRy+k
   7TPeUUvRhmO5m/VFahl7dMwKFWAipvPKR9OSs77diXp5CpJBZ8/wdfKhO
   4o8bruQrlGPGQu81milfCr9/AOFdU5Ailst7HudGq3R8mRmNgpDTZJ1VQ
   XeeeZRaUAAL0NNRmvaiI4qshejgZCCjAJ0JL9F6oORZPVfUyv370di0SU
   w==;
X-CSE-ConnectionGUID: m4GOEYW3SZOeLqTteNZHlg==
X-CSE-MsgGUID: NFUDRo4qTqq6cmI+EW4/Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="51387299"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="51387299"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 00:25:14 -0800
X-CSE-ConnectionGUID: huQsfp0ET5WXmo3mp7PHJA==
X-CSE-MsgGUID: iSx2maCJTcSv1dvolDYCvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="149946752"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 00:25:12 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4A1E811F7E8;
	Wed, 12 Feb 2025 10:25:09 +0200 (EET)
Date: Wed, 12 Feb 2025 08:25:09 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, hidenorik@chromium.org,
	bingbu.cao@linux.intel.com
Subject: Re: [PATCH] media: intel/ipu6: set the bus_info of the
 v4l2_capability
Message-ID: <Z6xa5VleQumTgto9@kekkonen.localdomain>
References: <20250212075314.2291135-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212075314.2291135-1-bingbu.cao@intel.com>

Hi Bingbu,

Thanks for the patch.

On Wed, Feb 12, 2025 at 03:53:14PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> IPU6 isys driver missed setting the bus_info of its v4l2_capability.
> `v4l2-ctl --all` cannot show the bus_info. This patch copy the bus_info
> from the media device to fill the v4l2_capability.
> 
> Fixes: 3c1dfb5a69cf ("media: intel/ipu6: input system video nodes and buffer queues")
> Signed-off-by: Hidenori Kobayashi <hidenorik@chromium.org>
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> index 387963529adb..3ca3f44da387 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> @@ -146,6 +146,8 @@ static int ipu6_isys_vidioc_querycap(struct file *file, void *fh,
>  
>  	strscpy(cap->driver, IPU6_ISYS_NAME, sizeof(cap->driver));
>  	strscpy(cap->card, av->isys->media_dev.model, sizeof(cap->card));
> +	strscpy(cap->bus_info, av->isys->media_dev.bus_info,
> +		sizeof(cap->bus_info));

Is there a need to do this? The bus_info is set by the framework based on
struct video_device dev_parent field and that comes from struct v4l2_device
dev field.

>  
>  	return 0;
>  }

-- 
Kind regards,

Sakari Ailus

