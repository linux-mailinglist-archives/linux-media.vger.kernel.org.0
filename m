Return-Path: <linux-media+bounces-14496-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BF791EF3D
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 08:42:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A4CA1F238A7
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 06:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE327130A53;
	Tue,  2 Jul 2024 06:40:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C6B12FB1B;
	Tue,  2 Jul 2024 06:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719902422; cv=none; b=FNQI1/K9pKG01hkQgovxuA3rvHDwWwK9+HNB4aUzopkW+HG+jsKDMypr1kl4CmdIr0NX5r7a6K+vwoQd6/dKTzdsTFXWvY2N11ZAtgkQZYASeygVdnR3ZRPB1mLen1dkpeUNtOXnFp/lkqJA5v1+wLPVfWgGtkZHlWbZol1IUzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719902422; c=relaxed/simple;
	bh=mT2O6REwtpFzEiJSYh+Veol21i4gFZFbaq/T17fTAD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lg32pQAsb+n4r9WL2+UmDP5VAFKLUd1dQaj1PppA0ScU82uIqiyxSc1M43mxqY3SL1EJ2BTKmi7HxVZwbOWPSr8NTYuHf2XmChjgpwZeBZ8HahKp44yIamoIZjFzaabq7ASHtcEfewq7YOPEe+/j6s5d/G5rWdeveSnfmMyRho8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 61E5568B05; Tue,  2 Jul 2024 08:40:17 +0200 (CEST)
Date: Tue, 2 Jul 2024 08:40:17 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Thorsten Blum <thorsten.blum@toblux.com>, jack@suse.cz,
	surenb@google.com, linux-kernel@vger.kernel.org,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] dma-buf: Remove unnecessary kmalloc() cast
Message-ID: <20240702064017.GA24838@lst.de>
References: <20240630011215.42525-1-thorsten.blum@toblux.com> <20240701232634.0bddb542ddea123b48dcabdf@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701232634.0bddb542ddea123b48dcabdf@linux-foundation.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Jul 01, 2024 at 11:26:34PM -0700, Andrew Morton wrote:
> No, I do think the cast is useful:
> 
> 	struct page *page = dma_fence_chain_alloc();
> 
> will presently generate a warning.  We want this.  Your change will
> remove that useful warning.
> 
> 
> Unrelatedly: there is no earthly reason why this is implemented as a
> macro.  A static inline function would be so much better.  Why do we
> keep doing this.

Agreed with all of the above.  Adding the dmabuf maintainers.

