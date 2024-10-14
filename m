Return-Path: <linux-media+bounces-19526-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 692EA99BF7F
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 07:53:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DE542824AC
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 05:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1D5613B7AF;
	Mon, 14 Oct 2024 05:53:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A403313B792
	for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 05:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728885201; cv=none; b=gBVDqFI6NqzFlUqMAGEpI7WJ/j6g3dbMRaIy5jDHaiK1rZNH2HIzTRZqBk5ifUtWZ0LmChhVXfFURz1vYS3IXUtG39TLECRvgG+QeKdhTJdx7yeRBidbEdS5np0sbSENPrPw/Q7/B2GoWWmlOOgZzKRZI3d8XeZfhpnJpINAHj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728885201; c=relaxed/simple;
	bh=fL1sP0DmZwhfbEKTcdggIc/JinRXHettSuU8ceyuElo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e9RR1uPWqP4yMnflLsQmYd06E0vG6pQSc5yxr3nKvxCW5bDH0ZIJfItUg0ksCQZmy/FSQWiUkHGlHdoHeBsYaZ63psWituZvQRF1TOyUCpuPFDiX3zXDUIa063aIZOMI9qalgSekX4NAek80mmuH5F15SYXJ6Q8wX+0icwJtUAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id D0131227AA8; Mon, 14 Oct 2024 07:53:06 +0200 (CEST)
Date: Mon, 14 Oct 2024 07:53:06 +0200
From: Christoph Hellwig <hch@lst.de>
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, hch@lst.de,
	andriy.shevchenko@linux.intel.com, bingbu.cao@linux.intel.com
Subject: Re: [PATCH 1/5] media: ipu6: not override the dma_ops of device in
 driver
Message-ID: <20241014055306.GB20331@lst.de>
References: <20241014034732.3109440-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014034732.3109440-1-bingbu.cao@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Oct 14, 2024 at 11:47:28AM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> DMA ops are a helper for architectures and not for drivers to override
> the DMA implementation.  Driver should not override the DMA
> implementation. This patch remove the dma_ops override and expose the
> IPU6 DMA mapping APIs.

That's a good rationale, but it might make sense to mention what you're
actually changing here as well.

> +	ret = dma_map_sgtable(&pdev->dev, sgt, DMA_TO_DEVICE, 0);
> +	if (ret) {
> +		sg_free_table(sgt);
> +		goto out;
> +	}
> +
> +	ret = ipu6_dma_map_sgtable(sys, sgt, DMA_TO_DEVICE, 0);

This looks like the only user of ipu6_dma_map_sgtable, any reason
to not open code it here?

>  	kfree(pages);
> @@ -607,7 +615,10 @@ EXPORT_SYMBOL_NS_GPL(ipu6_buttress_map_fw_image, INTEL_IPU6);
>  void ipu6_buttress_unmap_fw_image(struct ipu6_bus_device *sys,
>  				  struct sg_table *sgt)
>  {
> -	dma_unmap_sgtable(&sys->auxdev.dev, sgt, DMA_TO_DEVICE, 0);
> +	struct pci_dev *pdev = sys->isp->pdev;
> +
> +	ipu6_dma_unmap_sgtable(sys, sgt, DMA_TO_DEVICE, 0);

Same for ipu6_dma_unmap_sgtable


