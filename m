Return-Path: <linux-media+bounces-36091-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E979AEB62A
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 13:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 055C51C429FF
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 11:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A183829C32B;
	Fri, 27 Jun 2025 11:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aRFg/cEz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BCF2951CE;
	Fri, 27 Jun 2025 11:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751023389; cv=none; b=SvgZwLbudVA3UvddJB4WfKhtDJqpIC2jhj/eHRWz4dXw8HPJxjuSXlkukHFNKXAIf5b2OwWxj9qaMN4BG9niicxzmRzCHklUIjC8XjNMo2ITHJ/52cyCJMFRiy6ChDweER16FMhTyb2Z6jWeSg8AelxU7yHs9PpMaNFKy4iVqW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751023389; c=relaxed/simple;
	bh=4E766QcrHyc6FJQNUYWjsfGgdu/BRMSpFtNgERpjx+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CpOCZrYp7ihOK/ayuvN5eTP+xCznRRK9sTgT3hwRS6P46DhlOmNkWzWkNMmnnT33VveqTSNLZghrP1PXgKWHDhOpN+ugSsxgFXxh99XXO+74GjJj0VN49y4b0mgPo3IigSZBf7D/1xPst2ppfMFM1CpTaM8G3cTU6S9CtL8++Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aRFg/cEz; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751023387; x=1782559387;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4E766QcrHyc6FJQNUYWjsfGgdu/BRMSpFtNgERpjx+c=;
  b=aRFg/cEzfp9Z/1eKoPTRubCTpm7vhkHtulKXVKzp8GOxHzPrX3KGzF6k
   o94ORfDUGnAW+ajvdZkYMEoC3h/iAxaAqtA8zwNlB/HxHKhF8enLx6Ndk
   mSRjz430leOnDOsAJDOY9zsbQafpcB7UTvxswoGzZZY3/Poe9AhXrpan4
   MdfoBvPerCc78z4hkRFT0sMnbjBi4fJowrVeybO9/tIG050KiZDHEqFBR
   vXcrXk2+uSvKfAP1LItfJYnNPu1/93FQYD52T+4h3MbjJ8Ub3T81H82o3
   WQhMC0Z5mhLgsAih44DV3wG3fqkvulWG13wUvltCzCnoGbaxKJ2h17gai
   g==;
X-CSE-ConnectionGUID: 3b1jxNXFSZaVQMoFznQM6g==
X-CSE-MsgGUID: C0X9IszmSlOBheNkF9f5Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64774530"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="64774530"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 04:23:07 -0700
X-CSE-ConnectionGUID: pWmaIgjQRVmcrM9GMPJZOw==
X-CSE-MsgGUID: sUZS+/A6QaWHE3H4M8P7Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="153498611"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 04:23:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uV7Aa-0000000ASlm-1HHR;
	Fri, 27 Jun 2025 14:23:00 +0300
Date: Fri, 27 Jun 2025 14:22:59 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
	gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de,
	viro@zeniv.linux.org.uk, thomas.weissschuh@linutronix.de,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
Message-ID: <aF5_EwSHHMOOMRv9@smile.fi.intel.com>
References: <20250627101939.3649295-1-xu.yang_2@nxp.com>
 <20250627101939.3649295-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627101939.3649295-2-xu.yang_2@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jun 27, 2025 at 06:19:37PM +0800, Xu Yang wrote:
> This will add usb_alloc_noncoherent() and usb_free_noncoherent()
> functions to support alloc and free buffer in a dma-noncoherent way.
> 
> To explicit manage the memory ownership for the kernel and device,
> this will also add usb_dma_noncoherent_sync_for_cpu/device() functions
> and call it at proper time.  The management requires the user save
> sg_table returned by usb_alloc_noncoherent() to urb->sgt.

...

> +/**
> + * usb_alloc_noncoherent - allocate dma-noncoherent buffer for URB_NO_xxx_DMA_MAP
> + * @dev: device the buffer will be used with
> + * @size: requested buffer size
> + * @mem_flags: affect whether allocation may block
> + * @dma: used to return DMA address of buffer
> + * @dir: dma transfer direction
> + * @table: used to return sg_table of allocated memory
> + *
> + * Return: Either null (indicating no buffer could be allocated), or the
> + * cpu-space pointer to a buffer that may be used to perform DMA to the
> + * specified device.  Such cpu-space buffers are returned along with the DMA
> + * address (through the pointer provided).

Return section should be last in the kernel-doc (this requirement is
documented).

> + * To explicit manage the memory ownership for the kernel vs the device by
> + * usb core, the user needs save sg_table to urb->sgt. Then usb core will
> + * do dma sync for cpu and device properly.
> + *
> + * When the buffer is no longer used, free it with usb_free_noncoherent().

Here and everywhere else in your series, pay respect to acronyms by using them
as acronyms:

dma --> DMA
cpu --> CPU
usb --> USB

and so on...


> + */
> +void *usb_alloc_noncoherent(struct usb_device *dev, size_t size,
> +			    gfp_t mem_flags, dma_addr_t *dma,
> +			    enum dma_data_direction dir,
> +			    struct sg_table **table)
> +{
> +	struct device *dmadev;
> +	struct sg_table *sgt;
> +	void *buffer;
> +
> +	if (!dev || !dev->bus)

When !dev case is possible?

> +		return NULL;
> +
> +	dmadev = bus_to_hcd(dev->bus)->self.sysdev;
> +
> +	sgt = dma_alloc_noncontiguous(dmadev, size, dir, mem_flags, 0);
> +	if (!sgt)
> +		return NULL;
> +
> +	buffer = dma_vmap_noncontiguous(dmadev, size, sgt);
> +	if (!buffer) {
> +		dma_free_noncontiguous(dmadev, size, sgt, dir);
> +		return NULL;
> +	}
> +
> +	*table = sgt;
> +	*dma = sg_dma_address(sgt->sgl);
> +
> +	return buffer;
> +}

...

> +void usb_free_noncoherent(struct usb_device *dev, size_t size,
> +			  void *addr, enum dma_data_direction dir,
> +			  struct sg_table *table)
> +{
> +	struct device *dmadev;
> +
> +	if (!dev || !dev->bus)

Ditto.

> +		return;
> +	if (!addr)
> +		return;
> +
> +	dmadev = bus_to_hcd(dev->bus)->self.sysdev;
> +	dma_vunmap_noncontiguous(dmadev, addr);
> +	dma_free_noncontiguous(dmadev, size, table, dir);
> +}

-- 
With Best Regards,
Andy Shevchenko



