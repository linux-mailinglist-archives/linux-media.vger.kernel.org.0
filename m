Return-Path: <linux-media+bounces-15104-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C63693469B
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 05:08:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4E7C1F22892
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 03:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CAB92CCA3;
	Thu, 18 Jul 2024 03:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IpuNKge5"
X-Original-To: linux-media@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23E934CD8;
	Thu, 18 Jul 2024 03:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721272111; cv=none; b=lMDJSfw49pOQqbLlwYy0TJuAqMN0E5nd3lxFI5dHGGCEWpJmyP9LnJl8Xfrw0GilWbZV9aa4OeKMIp/24+4On58JjErLlK58xra4GTbxKdyxNhb1k19RoxXSEt6BR0SsScDw9+Cg8BZUJt3jDdueqoPKdQymxOg75rMjWesiv0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721272111; c=relaxed/simple;
	bh=MiNlsXGgcHh+E5vT/xG2YFf4Mbm5LGxVLddc+UVv2zM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZK+TujkXM62IKSF2P1yRR4BKcuWfyiR1ORS27b3F1y640sCHh2nW+lPlJEFYTNn+QlrAORqaimyq+AYLuUk+3KhNwk4s6Yd+EHWv+uxo14E4Tyz7VDLfqnKah8ye8UEomyG/xeW/sH4knqhtPz6I5YxfShd4wDw4vaKiqVH0gHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=IpuNKge5; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dhbKOOXLOR2dvKgzNkDsF4yaQ6Osy862xbMrlR1zrlQ=; b=IpuNKge5/alV6Zh+IIdYK02o6o
	mQ6vK/76s7+pxU7WODCEyWz/6yKYMACOjWbuNN4pfqaGfqwjrVJvk6szr8URtWhT3CD8Yu6EV2RJ+
	LdboflFJOE/rpX8VL8rN7I795cKHfm5U9BD7/mom5/xJnC9F0ggILKciQJ60LMLmE/a0MYkBudjWs
	909niZLucPZQkdPbI9FbVL0SFbseSieO4T6Xf2faKmBw/AVRNmqLdd3jX7OUD7F94MesgwTfOqdk6
	6g66H6TUQnwT6o6pwSBBVSI/GEyDRUbkc38BZbKtUB5rZ884cpQMrPjBckplXxQTjxXMykRDG6Z9C
	Z99aa10A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUHVJ-0000000FavV-24cO;
	Thu, 18 Jul 2024 03:08:25 +0000
Date: Wed, 17 Jul 2024 20:08:25 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Huan Yang <link@vivo.com>
Cc: Christoph Hellwig <hch@infradead.org>,
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
Message-ID: <ZpiHKY2pGiBuEq4z@infradead.org>
References: <20240711074221.459589-2-link@vivo.com>
 <5ccbe705-883c-4651-9e66-6b452c414c74@amd.com>
 <ZpTnzkdolpEwFbtu@phenom.ffwll.local>
 <99364176-a7f0-4a17-8889-75ff92d5694e@amd.com>
 <06713006-c5ce-4773-a1b3-ca3bea56ee45@vivo.com>
 <ZpY-CfcDdEhzWpxN@phenom.ffwll.local>
 <b18ad853-90e4-4ad7-b621-2ca8a8111708@vivo.com>
 <Zpff-8LmqK5AD-a8@phenom.ffwll.local>
 <Zpf5R7fRZZmEwVuR@infradead.org>
 <7140a145-7dd5-43b0-8b2a-0fd12bb9e62d@vivo.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7140a145-7dd5-43b0-8b2a-0fd12bb9e62d@vivo.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Jul 18, 2024 at 09:51:39AM +0800, Huan Yang wrote:
> Yes, actually, if dma-buf want's to copy_file_range from a file, it need
> change something in vfs_copy_file_range:

No, it doesn't.  copy_file_range is specifically designed to copy inside
a single file system as already mentioned.  The generic offload for
copying between arbitrary FDs is splice and the sendfile convenience
wrapper around it


