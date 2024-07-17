Return-Path: <linux-media+bounces-15094-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 706489340EA
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 19:03:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A7731F224EB
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 17:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C32C1822E1;
	Wed, 17 Jul 2024 17:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="4spTy3FP"
X-Original-To: linux-media@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B77180A99;
	Wed, 17 Jul 2024 17:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721235790; cv=none; b=EYHXnGIVsupH4O1/tmjj2O6AuwaeqpsPX4OWpqBqEacwqaphFbxNSsFkW/ksCkI8veo2b9h9Dwx0DYrIBV/vBq9WiD5yt26qCDkHedyce+IC8AS9JijMnBgERTwzR2U2dgmaGhDY/mrkL42ma9WDjl+nIaI8xlfEfWXCkAoWo2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721235790; c=relaxed/simple;
	bh=8/5dJrJ2+9Wk14cPx5nkHzMZuSV5tS8fq5+uo+286Ac=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TAPa7mTxUdUSrM9GcoRq7r23iNsx4qkUy/+/LO054cHlWQTkyfAfaQLjxfN1+/dt5R9PbuAQqNRowgJ008zqOCEI9oyO1Sb4s13qMax+BSifiZEREoFWzTAiDX7FI3oU7CdVDYVTgVMnXGqJM4kOMTyHyO7Nb8wLTOb41ApmEfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=4spTy3FP; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=btjX+x6cX8ZBL/5bFIlgNMCTbIAJLEehWyH8wcIpEtA=; b=4spTy3FPwrLHyxqFzvVKuk6IsZ
	dWB88354/QeLzMTejtZXsLORI5PI06SASnDbophFtwoS/jmsYRzStFitTD4QQxFM+4Q34EYee4KrS
	EwfERdLiKdeKKYApRpDYHcrfplLTCMNqnaGPurJACPcgfPOMpveONFMFsiIC2j1UQa9qj0DPaRpY1
	zjCBvgds+6kDB+08OVrG96LOpkRnFlgAl3MT5L0xMk6dNdSMEE0gh5lJ/HX6CiEtddkeZTkKtXHLY
	d9s7NAoSza++7qxIxMb0t1tdfTJ/3t9nFTFRjSJPZhrVeC108Wvk9LsjhGL+mvL7PkuEbhfBigQge
	Mb9I9eww==;
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU83U-0000000EQZG-0AYB;
	Wed, 17 Jul 2024 17:03:04 +0000
Date: Wed, 17 Jul 2024 10:03:03 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Huan Yang <link@vivo.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH 1/2] dma-buf: heaps: DMA_HEAP_IOCTL_ALLOC_READ_FILE
 framework
Message-ID: <Zpf5R7fRZZmEwVuR@infradead.org>
References: <20240711074221.459589-1-link@vivo.com>
 <20240711074221.459589-2-link@vivo.com>
 <5ccbe705-883c-4651-9e66-6b452c414c74@amd.com>
 <ZpTnzkdolpEwFbtu@phenom.ffwll.local>
 <99364176-a7f0-4a17-8889-75ff92d5694e@amd.com>
 <06713006-c5ce-4773-a1b3-ca3bea56ee45@vivo.com>
 <ZpY-CfcDdEhzWpxN@phenom.ffwll.local>
 <b18ad853-90e4-4ad7-b621-2ca8a8111708@vivo.com>
 <Zpff-8LmqK5AD-a8@phenom.ffwll.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zpff-8LmqK5AD-a8@phenom.ffwll.local>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Wed, Jul 17, 2024 at 05:15:07PM +0200, Daniel Vetter wrote:
> I'm talking about memfd, not dma-buf here. I think copy_file_range to
> dma-buf is as architecturally unsound as allowing O_DIRECT on the dma-buf
> mmap.

copy_file_range only work inside the same file system anyway, so
it is completely irrelevant here.

What should work just fine is using sendfile (or splice if you like it
complicated) to write TO the dma buf.  That just iterates over the page
cache on the source file and calls ->write_iter from the page cache
pages.  Of course that requires that you actually implement
->write_iter, but given that dmabufs support mmaping there I can't
see why you should not be able to write to it.

Reading FROM the dma buf in that fashion should also work if you provide
a ->read_iter wire up ->splice_read to copy_splice_read so that it
doesn't require any page cache.


