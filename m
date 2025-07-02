Return-Path: <linux-media+bounces-36562-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00ED1AF1575
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 14:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 905B918942FF
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 12:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E623726E715;
	Wed,  2 Jul 2025 12:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aEz897f1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA00D253350;
	Wed,  2 Jul 2025 12:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751458843; cv=none; b=H3POKgOkRiLAzIeORIcnUk8lsn9Fql5V/CDLFEInrCkuEFg+LsyZ0XA+Fy3W6VaOztBxRD7paEA/pvJ/fVobX8ZJWFTB+mLsveur9o41fupIPoeoQxHrqQpUt/azNjKcAoXtRu6IRefG8UbMYB9Y5T0UvNwmAsUeNuXk74ciqKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751458843; c=relaxed/simple;
	bh=64aTKjc/IcbpGG9gKWt+2nVue/MdoRiwlfPf0ILjKpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dMjCVdjsGVRQf5Fwuy8Uz6NcHgJ7dosTiVUOoKjWcFuBEviWECpZJkgjRSdXlS+DwlBwYTUFklx/PW9Ldnn70T09Fm1ce0NMMYDD1sFs3KqnUgmBrshdiqYKUg/P+S/6c8ifrwzJKtfvLPMtk0l/MAJ1XRAunZO2HIiEUh9jHJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aEz897f1; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751458842; x=1782994842;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=64aTKjc/IcbpGG9gKWt+2nVue/MdoRiwlfPf0ILjKpo=;
  b=aEz897f1q7bf7XAR9LSt27bLtTKuL51R7K+tQRCij+p0CyJoei91o6Mr
   2tiORroOnfTJGswRavIVIEPomDZyLT5FB6p2Ief2e7qqvwSH2qCRUkLkA
   12Qg/P6zkQbXKz90b5j2g8m3vBq6dorFF1vsDsDo5gnn8xHFlJF2j8ztY
   H1w1dhggL1fbFb33j/sBLgvR+dj1lrSqmSQXWL1cmWB04v4oVOOqAsboB
   nrscgTxq4dCnsN9nFWnxB90oT/k3YkVSS2qvrRSzCieYjrkLVZVWE4FIo
   Taz2irBVTvjlo1gM6f5EesUZGH6Kk3gysCdnohh8MHck+bsjGO1CB880a
   Q==;
X-CSE-ConnectionGUID: 665iHEqlQ2Wx9e6RID6Row==
X-CSE-MsgGUID: pso3+bjzTdmhyRzmLgjRiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53616732"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="53616732"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 05:20:41 -0700
X-CSE-ConnectionGUID: 1aETWCKNQ1umOKFoIsAm7Q==
X-CSE-MsgGUID: ppFS1wN+T+ik1840nkTGjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="158104826"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 05:20:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uWwS1-0000000Bun0-43Su;
	Wed, 02 Jul 2025 15:20:33 +0300
Date: Wed, 2 Jul 2025 15:20:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
	gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de,
	viro@zeniv.linux.org.uk, thomas.weissschuh@linutronix.de,
	dafna.hirschfeld@collabora.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v3 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
Message-ID: <aGUkEbaSOzrtILkZ@smile.fi.intel.com>
References: <20250702110222.3926355-1-xu.yang_2@nxp.com>
 <20250702110222.3926355-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702110222.3926355-2-xu.yang_2@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jul 02, 2025 at 07:02:20PM +0800, Xu Yang wrote:
> This will add usb_alloc_noncoherent() and usb_free_noncoherent()
> functions to support alloc and free buffer in a dma-noncoherent way.
> 
> To explicit manage the memory ownership for the kernel and device,
> this will also add usb_dma_noncoherent_sync_for_cpu/device() functions
> and call it at proper time.  The management requires the user save
> sg_table returned by usb_alloc_noncoherent() to urb->sgt.

...

> +	if ((urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP) &&
> +	    urb->sgt) {

Something weird with the indentation. Here you wrapped, but the very next line
is not, and they both satisfy 80 limit (even though we have it relaxed now).

> +		dma_sync_sgtable_for_cpu(hcd->self.sysdev, urb->sgt, dir);
> +		if (dir == DMA_FROM_DEVICE)
> +			invalidate_kernel_vmap_range(urb->transfer_buffer,
> +						     urb->transfer_buffer_length);
> +	}

...

> +
> +		return ret;
>  	}
> +
> +	if ((urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP) &&
> +	    urb->sgt) {

Why not

	} else if {

and drop the above return ret; ?

> +		if (dir == DMA_TO_DEVICE)
> +			flush_kernel_vmap_range(urb->transfer_buffer,
> +						urb->transfer_buffer_length);
> +		dma_sync_sgtable_for_device(hcd->self.sysdev, urb->sgt, dir);
> +	}
> +
>  	return ret;

-- 
With Best Regards,
Andy Shevchenko



