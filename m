Return-Path: <linux-media+bounces-56520-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DwkOMc8vWkH8AIAu9opvQ
	(envelope-from <linux-media+bounces-56520-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 13:25:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DC82DA28A
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 13:25:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CB1C0302C72A
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 12:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 917BB3A963B;
	Fri, 20 Mar 2026 12:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Lm+LMJ1N"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4076E3AD51E
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 12:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774009467; cv=none; b=SYYZ7F9L0IuuIl8QRxWPhZjC4WNGKDhy1EWj6GTznDG1tYULsfQ3hJL7dEV/2AKcvdDl/QdphdEcDgkC0TWUpvW9T+R4IaFgDX5WpjzaDYoKwZqdUuR+s0B/qC/2XrBMGwnVKs+lTrSzqdgbmKN16XsbVk5MkU3/nQUk/Pus92s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774009467; c=relaxed/simple;
	bh=036nVHah2RBf3OKTA/Tt60k0HdHGvWe2NGZ+Itxd5gA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=K1oeyvYcTlRU/tWJ8tY81ireEgo6yvAKiC/gpmml3K9uYVL25AvNzczYP8FApH0ca9/ydBIRVEf/CACH4q9Gwj8sgJnEVthhFtJCrOQrYclZQFn4rbMjHBHPn8FltNKQT7qToe9rhRrsdn0nmtn9BHgXkUX47CnTwN6WaKKefxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Lm+LMJ1N; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260320122421euoutp0140f8bf5a704d989c12631973949e8345~ejDS_L-ZZ2252722527euoutp01t
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 12:24:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260320122421euoutp0140f8bf5a704d989c12631973949e8345~ejDS_L-ZZ2252722527euoutp01t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1774009461;
	bh=zBoVOBx1I566RxpDMI+o2b7Nge6l1DhueDNqbVeTZ9I=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Lm+LMJ1N2KMDXYMK1DOJQHu+mcsmsRVm47PRbfNKkp8LdCVnjJF+uuVbrRgj1j9cG
	 U6RyPHSthJw3H1wRb6DJWdKEkegzlLK8kjUL4OkQza+IkqiKcpbdhiO2jqVXlE4EAI
	 pmpJvKXTiVmVuJGUhpk10ye6Ti+6l5/UoHmotHuQ=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260320122421eucas1p17d0a17d9bdd22b45c1e60c78271e1d65~ejDSnuv7b2308323083eucas1p1i;
	Fri, 20 Mar 2026 12:24:21 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260320122419eusmtip117bbdef1d0f760c12e7437f2d83e9ca0~ejDRniVoR0999509995eusmtip1m;
	Fri, 20 Mar 2026 12:24:19 +0000 (GMT)
Message-ID: <c60a3f30-6fc3-41ab-835a-2fdd887e18fd@samsung.com>
Date: Fri, 20 Mar 2026 13:24:18 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v3 0/8] dma-buf: heaps: Turn heaps into modules
To: Maxime Ripard <mripard@kernel.org>, Sumit Semwal
	<sumit.semwal@linaro.org>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Robin Murphy
	<robin.murphy@arm.com>, Andrew Morton <akpm@linux-foundation.org>, David
	Hildenbrand <david@kernel.org>, Lorenzo Stoakes
	<lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren
	Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Cc: Albert Esteve <aesteve@redhat.com>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260303-dma-buf-heaps-as-modules-v3-0-24344812c707@kernel.org>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260320122421eucas1p17d0a17d9bdd22b45c1e60c78271e1d65
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260303101320eucas1p2eb4fea499364ef20825d0d73585a2555
X-EPHeader: CA
X-CMS-RootMailID: 20260303101320eucas1p2eb4fea499364ef20825d0d73585a2555
References: <CGME20260303101320eucas1p2eb4fea499364ef20825d0d73585a2555@eucas1p2.samsung.com>
	<20260303-dma-buf-heaps-as-modules-v3-0-24344812c707@kernel.org>
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-56520-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.939];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:dkim,samsung.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A4DC82DA28A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Maxime,

On 03.03.2026 11:13, Maxime Ripard wrote:
> The recent introduction of heaps in the optee driver [1] made possible
> the creation of heaps as modules.
>
> It's generally a good idea if possible, including for the already
> existing system and CMA heaps.
>
> The system one is pretty trivial, the CMA one is a bit more involved,
> especially since we have a call from kernel/dma/contiguous.c to the CMA
> heap code. This was solved by turning the logic around and making the
> CMA heap call into the contiguous DMA code.
>
> Let me know what you think,
> Maxime
>
> 1: https://lore.kernel.org/dri-devel/20250911135007.1275833-4-jens.wiklander@linaro.org/
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

I'm okay with the kernel/dma/contiguous.c changes. I only wonder how to 
properly merge them. There are other pending changes to 
kernel/dma/contiguous.c file [1] and if they finally get reviewed, I 
would like to merge both via dma-mapping-for-next tree. Then I can 
provide a stable branch for merging the remaining dma-buf pathes. Is it 
okay for You?

1. 
https://lore.kernel.org/all/20260313150802.1121442-1-m.szyprowski@samsung.com/ 



> ---
> Changes in v3:
> - Squashed cma_get_name and cma_alloc/release patches
> - Fixed typo in Export dev_get_cma_area commit title
> - Fixed compilation failure with DMA_CMA but not OF_RESERVED_MEM
> - Link to v2: https://lore.kernel.org/r/20260227-dma-buf-heaps-as-modules-v2-0-454aee7e06cc@kernel.org
>
> Changes in v2:
> - Collect tags
> - Don't export dma_contiguous_default_area anymore, but export
>    dev_get_cma_area instead
> - Mentioned that heap modules can't be removed
> - Link to v1: https://lore.kernel.org/r/20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org
>
> ---
> Maxime Ripard (8):
>        dma: contiguous: Turn heap registration logic around
>        dma: contiguous: Make dev_get_cma_area() a proper function
>        dma: contiguous: Make dma_contiguous_default_area static
>        dma: contiguous: Export dev_get_cma_area()
>        mm: cma: Export cma_alloc(), cma_release() and cma_get_name()
>        dma-buf: heaps: Export mem_accounting parameter
>        dma-buf: heaps: cma: Turn the heap into a module
>        dma-buf: heaps: system: Turn the heap into a module
>
>   drivers/dma-buf/dma-heap.c          |  1 +
>   drivers/dma-buf/heaps/Kconfig       |  4 ++--
>   drivers/dma-buf/heaps/cma_heap.c    | 21 +++++----------------
>   drivers/dma-buf/heaps/system_heap.c |  5 +++++
>   include/linux/dma-map-ops.h         | 18 ++++++++++--------
>   kernel/dma/contiguous.c             | 37 ++++++++++++++++++++++++++++++++++---
>   mm/cma.c                            |  3 +++
>   7 files changed, 60 insertions(+), 29 deletions(-)
> ---
> base-commit: 499a718536dc0e1c1d1b6211847207d58acd9916
> change-id: 20260225-dma-buf-heaps-as-modules-1034b3ec9f2a
>
> Best regards,

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


