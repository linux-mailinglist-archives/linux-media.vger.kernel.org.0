Return-Path: <linux-media+bounces-19527-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B454A99BF84
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 07:54:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2484A282B2D
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 05:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5EED13D619;
	Mon, 14 Oct 2024 05:54:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7197313C810
	for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 05:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728885247; cv=none; b=oxZEHZLW74fV7i8qpvWayZRoD/MmmknQlUSb9dtmo6cwmJhXC/0Vgj0Nb+GyA85KAShHQGuwjvL6BMajHGEFr5oMcwfl81f2fg2wGv1NJcWEXpC3KNzkoTEi8+VK8rGPYOjXqR29X/z65Zu746B2PGXACvRV0W6w19ClCkQH/vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728885247; c=relaxed/simple;
	bh=IT4eI4HCk79213G4hT/S9k9yrO9QEfCYuxH9CZ/v8kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eD3dS6ECAQt463BhPb+JydarXWKLL+Ul7hTbiy2PRrCIzJ+kIOA+6QurIDwBzF6glL3GxD1Rks2fjGRJ64GmRSOn0UchMj6uXG+U1WY2YDXMiY4Yy/cp7Z64ly4waNLlaJAk3kk1F0EgRJJnGHw5WZ+k4dlcKoMVk46so46e9gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id AFE21227AA8; Mon, 14 Oct 2024 07:54:01 +0200 (CEST)
Date: Mon, 14 Oct 2024 07:54:01 +0200
From: Christoph Hellwig <hch@lst.de>
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, hch@lst.de,
	andriy.shevchenko@linux.intel.com, bingbu.cao@linux.intel.com
Subject: Re: [PATCH 5/5] media: ipu6: use PFN_UP() and sg_virt() for code
 simplicity
Message-ID: <20241014055401.GC20331@lst.de>
References: <20241014034732.3109440-1-bingbu.cao@intel.com> <20241014034732.3109440-5-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014034732.3109440-5-bingbu.cao@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Oct 14, 2024 at 11:47:32AM +0800, bingbu.cao@intel.com wrote:
> +++ b/drivers/media/pci/intel/ipu6/ipu6-dma.c
> @@ -139,7 +139,7 @@ void ipu6_dma_sync_sg(struct ipu6_bus_device *sys, struct scatterlist *sglist,
>  	int i;
>  
>  	for_each_sg(sglist, sg, nents, i)
> -		clflush_cache_range(page_to_virt(sg_page(sg)), sg->length);
> +		clflush_cache_range(sg_virt(sg), sg->length);

Not new in this code, but what guarantees that this driver never sees
highmem?


