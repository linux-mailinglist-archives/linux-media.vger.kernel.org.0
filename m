Return-Path: <linux-media+bounces-36672-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C101DAF760E
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 15:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9C851C270EB
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 13:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F022E762D;
	Thu,  3 Jul 2025 13:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QIFL5Arc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D9912B17C;
	Thu,  3 Jul 2025 13:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751550426; cv=none; b=H1HzxPkR3jT7V1MOGxycjVSXcOKDoHuld7czQ/gzGgTfFUQlZ9fzqDoNGusILUkXXXMxaaWrnUhGU4ARD9kFse7XuqGZnxrSx0jDJhUVI4SW53j/yxJ70Sr5BcQ3khj2qM2tvGYRVoSVDY8c5Rww9zAXkgeRpCJJ/+pOz7GNm3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751550426; c=relaxed/simple;
	bh=S6uSAFxgMusmYk+i3vZCmcqElpNigeA5L151mpjtU+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9y+qxj/4ij5/ct+AO7YI9yaHA2NckqsuwdN0eTLYehYpcUEAILSNIR1iiiBiqaArrsrOLTI9VKiGf+Z9J+uHtHtYqCsAdSHbRSeEoljV1OqLp3wONKFZ8cmElwUFgTjPAWUx6SM2uQmAHSCbREn8TGzxJrVs1Fq+bHa7rppVZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QIFL5Arc; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751550425; x=1783086425;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S6uSAFxgMusmYk+i3vZCmcqElpNigeA5L151mpjtU+0=;
  b=QIFL5ArcYIa3M1cHDDrpNQQ1upSyQ/L/XOJET+oM6og8Xoq2FdSeEcCk
   s+uDK6zKCLu4cQKqiQuXFsE3zGDHLDA7om7FiUHehCTPdTFe1NXLrb6FO
   RHfpQmoWqmiXTWX/GjuKMxO26iUmUBNb4MjDpKh8R1R5Tasf807VaBNlo
   wRIcNkldhWNZRImW3ajo1eYhBD0P9+eI9vmA2BKiii6rnbKtJFeOJ5GZp
   s8C/EvymP0podc+KNacza9w1jCtMMnaA5Ty+ZYSf8QG88snRyZwGUZPcd
   eON0WIXHSSG+zKbTlYe7GRFAlsX4zZmtPInxGF2gZjVzLsU5xbYJfyV/k
   Q==;
X-CSE-ConnectionGUID: o3pJkc+YTi6Nr5g0IcMkeg==
X-CSE-MsgGUID: q7gRQNzcR7OwEI7DS0kCXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="79312723"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="79312723"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 06:47:04 -0700
X-CSE-ConnectionGUID: gaDn8zDxSIapXB2tg+gNfg==
X-CSE-MsgGUID: qw2BXUjFR1qJyb9Msal+7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="154945203"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 06:47:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uXKHB-0000000CDdl-1PxA;
	Thu, 03 Jul 2025 16:46:57 +0300
Date: Thu, 3 Jul 2025 16:46:57 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
	gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de,
	viro@zeniv.linux.org.uk, thomas.weissschuh@linutronix.de,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v4 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
Message-ID: <aGaJ0fS25bDoLCfH@smile.fi.intel.com>
References: <20250703103811.4048542-1-xu.yang_2@nxp.com>
 <20250703103811.4048542-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703103811.4048542-2-xu.yang_2@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 03, 2025 at 06:38:09PM +0800, Xu Yang wrote:
> This will add usb_alloc_noncoherent() and usb_free_noncoherent()
> functions to support alloc and free buffer in a dma-noncoherent way.
> 
> To explicit manage the memory ownership for the kernel and device,
> this will also add usb_dma_noncoherent_sync_for_cpu/device() functions
> and call it at proper time.  The management requires the user save
> sg_table returned by usb_alloc_noncoherent() to urb->sgt.

...

>  	dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> -	if (urb->transfer_buffer_length != 0
> -	    && !(urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP)) {
> +	if (!(urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP)) {
> +		if (!urb->transfer_buffer_length)
> +			return ret;

This return ret out of a sudden are quite fragile. Please, move to use return 0
directly where it is supposed to be 0.

...

> +	} else {
> +		if (!urb->sgt)
> +			return ret;

Ditto.

> +		if (dir == DMA_TO_DEVICE)
> +			flush_kernel_vmap_range(urb->transfer_buffer,
> +						urb->transfer_buffer_length);
> +		dma_sync_sgtable_for_device(hcd->self.sysdev, urb->sgt, dir);
>  	}

>  	return ret;

Ditto?

-- 
With Best Regards,
Andy Shevchenko



