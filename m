Return-Path: <linux-media+bounces-44440-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFBCBD9E43
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 16:08:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 58C4E4E9B37
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 14:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BFA1314D36;
	Tue, 14 Oct 2025 14:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lK8uoZSY"
X-Original-To: linux-media@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EF8314D0F;
	Tue, 14 Oct 2025 14:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760450794; cv=none; b=oKEUxaqAHseYsKCxHy4ApSMxqyQnrtJYK7WqMAXt0JBmHX1xGafCry+16IqxSUtvUOTtWr+o6RDX8WmGixL4UZA9cWlVo+QM4SlknTKo8HIIxAD4UQDoyYPfITrNNu17xShL+U8i1K/wUulZgLGsd/HGtv90A74AfLdW59Iczv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760450794; c=relaxed/simple;
	bh=IT6dBKIlwdnA1ddOUgBgq0XZQweKSrhrXqeilv7m9Us=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/MXe82plfYMa0wkG46j2wdWRgoN0+s/pEFclxoANR7itats49npXODelI/J6vxAg16uFAHXeV3moL/KCI7p+QD6gINLTCIM3wkUVMR+D8x7sZd8cmXCHrqKwGPzqlb95Xv+7QFC0fQR5N1r5ToeWn1k1SPSC4KKFRlcUaWBE1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=lK8uoZSY; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=e/V73HB2j0SB/c9ybjOOfbzsInvf4MCE5FolGwdySDg=; b=lK8uoZSYpxxAgKRKV/Hch8ByIS
	EVXALti/OcHwaKhZzxpYN1cvdWxikT7SKQRge3XVTafJJd3OjMjoxORgfBybUR4FJoAvcx3hdgiQP
	gXE/pec3m+6ks+KKgnkEsB8xiSabU4tVrQK6swmiAIX0qZP/qgZ+AgOhAk0u2w3nuCVcWnwUx7JZn
	Op9Cirp81R0019U2e0Q+C7ycK39oog7XyMkE5MiYqpIJzv0LfyrzzUsJXW2LMg+Zm3NtSmP+7z1mM
	vOjgQ0c2xJlIx7YMUOisNNHfTzhkry+JzUsmXVtZLi4+YuLGpup5hzOhLOuC75093AZdIealQjdUw
	pJMyaopg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ffM-0000000C1Ts-0nWf;
	Tue, 14 Oct 2025 14:06:16 +0000
Date: Tue, 14 Oct 2025 15:06:15 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	Vlastimil Babka <vbabka@suse.cz>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Zhaoyang Huang <huangzhaoyang@gmail.com>, steve.kang@unisoc.com
Subject: Re: [PATCH 0/2] optimization of dma-buf system_heap allocation
Message-ID: <aO5Y1x82YN81Mh7J@casper.infradead.org>
References: <20251014083230.1181072-1-zhaoyang.huang@unisoc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014083230.1181072-1-zhaoyang.huang@unisoc.com>

On Tue, Oct 14, 2025 at 04:32:28PM +0800, zhaoyang.huang wrote:
> From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> 
> This series of patches would like to introduce alloc_pages_bulk_list in
> dma-buf which need to call back the API for page allocation.

Start with the problem you're trying to solve.

