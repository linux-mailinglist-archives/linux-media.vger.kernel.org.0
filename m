Return-Path: <linux-media+bounces-30147-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B010A87EEB
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 13:24:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21ACC1735A7
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 11:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A63268FF4;
	Mon, 14 Apr 2025 11:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="zqQycXN4"
X-Original-To: linux-media@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DDE1714B3;
	Mon, 14 Apr 2025 11:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744629866; cv=none; b=tTRQJPi/AHm54/+6CzGjO9/2klgsRzaUPr43IBKA7Mn4yfYXBBoOgwwe+3VR5E8Eab/HTUwLwj8K3SyoOvIxi27CiD1HG6iMif4uG7BVRF6foie/VsLEh3tr9qlWfywjah5cLi5zwXaOBINi3/+a8ljjy8Hy3Fkczj+9TPEEOVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744629866; c=relaxed/simple;
	bh=6B9LS5FMKeroy4YwHf6g4K6gImyW3sjxZYik20ncOB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SQClix+XCDmR6oUXma0w+5KKWSop/Ssh55g0DjVoK3IlwTXGiFlgZcxDY/H8fsb7h6uKK1/8agbFxt13k002Ln1H393Ls8Bj8oNtK+eo2oA0G+Q685UPl91g4nNxl1NdR9amRui9PAxB1ecjqqgyVMYr/HqdeGRjGNZLmy46jEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=zqQycXN4; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KlO9Sk4hejiVYyH+invLfYMYpcyc09MHVxHMPbyfzU4=; b=zqQycXN450Ypn3ETQ6T4HLhL/w
	uS1ayxj32deBuCXN2M+pZRKAAJq8wVyritpiF5QpZBR9QdveTF0b2EZzKNrorl0srfWp1Nvj6m4hb
	I18iiUXRGNr4WRV863QDReIcHv+tBdjvFFXYzc/6pbRh+4+F0eFhliIQig7N9TWn5NSIFidkdoz0f
	Vc+5KaHOZm1eDT8JP1WMsPiVY3zV0LlHI6Y1ev4f20rG47Rn2QIRts19cNU+h0YjpkG80RyZy1bft
	5GN6LrmqEc2I4MG7WPGu27vq/sG02rvRmanctdCL8YZKdyHZ41PuA2h3vFabIfN8/vmebg6mIV3Uv
	of9xo2Cg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4HvJ-00000001kmE-3jAQ;
	Mon, 14 Apr 2025 11:24:21 +0000
Date: Mon, 14 Apr 2025 04:24:21 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Christoph Hellwig <hch@infradead.org>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] uio/dma-buf: Give UIO users access to DMA addresses.
Message-ID: <Z_zwZYBO5Txz6lDF@infradead.org>
References: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
 <Z_yjNgY3dVnA5OVz@infradead.org>
 <20250414102455.03331c0f@windsurf>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414102455.03331c0f@windsurf>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Mon, Apr 14, 2025 at 10:24:55AM +0200, Thomas Petazzoni wrote:
> What this patch series is about is to add new user-space interface to
> extend the existing UIO subsystem.

Which as I explained to you is fundamentally broken and unsafe.  If you
need to do DMA from userspae you need to use vfio/iommufd.

> I am not sure how this can work in our use-case. We have a very simple
> set of IP blocks implemented in a FPGA, some of those IP blocks are
> able to perform DMA operations. The register of those IP blocks are
> mapped into a user-space application using the existing, accepted
> upstream, UIO subsystem. Some of those registers allow to program DMA
> transfers. So far, we can do all what we need, except program those DMA
> transfers. Lots of people are having the same issue, and zillions of
> ugly out-of-tree solutions flourish all over, and we're trying to see
> if we can constructively find a solution that would be acceptable
> upstream to resolve this use-case. Our platform is an old PowerPC with
> no IOMMU.

Then your driver design can't work and you need to replace it with a
proper in-kernel driver.


