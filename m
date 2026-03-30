Return-Path: <linux-media+bounces-57614-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAzeMsdyymnG8gUAu9opvQ
	(envelope-from <linux-media+bounces-57614-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 14:55:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C81235B5AE
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 14:55:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C02DD3044653
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 12:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0863D1CB3;
	Mon, 30 Mar 2026 12:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="lyd1qaKz"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566013D170D
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 12:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774875103; cv=none; b=diY6G+VNw5dIqNZ2YWwcfqgMY6HEfRtZG6n6iURIPELsukZPyJ1CXSEZVqTA8iKTGGUSRwT/HYpt10g49Duk4if23k095NgcyQOFXUPCM7LFgewytRSnbRi8mXaO3dQaEKMeq2FCXGl91XR1AWS6B1t8vu33k1tyGWPXyeyZLaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774875103; c=relaxed/simple;
	bh=sjvMh4iAUGDdNV/3wW/wwHB7EEp8dN9PC7EVlZyMnjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=XT7tNTPKf1FwcuREpawi9V99tvpf2kaWMcQzxy+PfXKPObnMIWTGJKjQzAoi2sG1NOSPOZOOsATOuEno5M00q6sVVDyMMNER9/ALBtN0ek/+VDkDeSxDaF4aucpjpZ3gxrSpAfBNa2wO68G/8brKkGekU966TncCmgA4T8QHDp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=lyd1qaKz; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260330125138euoutp0250ebe7c3393b2540338b8635185548ff~hn3_XtZ4N3101431014euoutp02C
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 12:51:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260330125138euoutp0250ebe7c3393b2540338b8635185548ff~hn3_XtZ4N3101431014euoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1774875098;
	bh=/K0BfatLUGOzJ2a4upShRyXd92Gck0knBszJjH43XM0=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=lyd1qaKzKOMZ/N8MPCsQmF5PntlcAwPgetCoeDe4ySx4mig0uYBXch9XggXmrVUzr
	 /p05+mew8GhkRI8a9hzvHj3w0AnDpcZM/Wxis75yKmkrr+Z02UZq2MMZZ1XICvd8F9
	 HpbWNeR7q5o6aznWI0alIbd+N/qLrjWo7Z7DLoVI=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260330125136eucas1p20d38cd3f5c4c3772aeef5b7d2f2b8906~hn381TBya2647926479eucas1p2y;
	Mon, 30 Mar 2026 12:51:36 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260330125135eusmtip2d7715ffa0968cdc67f37ae3c3026faac~hn37iwEWw2261922619eusmtip2d;
	Mon, 30 Mar 2026 12:51:35 +0000 (GMT)
Message-ID: <ac7fa9bc-e966-4337-ae54-7bb6d8bd6e5a@samsung.com>
Date: Mon, 30 Mar 2026 14:51:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] dma/contiguous: Fix broken build
To: Maxime Ripard <mripard@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Robin Murphy
	<robin.murphy@arm.com>, Albert Esteve <aesteve@redhat.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	iommu@lists.linux.dev, Mark Brown <broonie@kernel.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260330-glaring-pygmy-dodo-fa06f3@houat>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260330125136eucas1p20d38cd3f5c4c3772aeef5b7d2f2b8906
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260330084111eucas1p1e7cd5c886e34d0ed41226fe524d2a55a
X-EPHeader: CA
X-CMS-RootMailID: 20260330084111eucas1p1e7cd5c886e34d0ed41226fe524d2a55a
References: <CGME20260330084111eucas1p1e7cd5c886e34d0ed41226fe524d2a55a@eucas1p1.samsung.com>
	<20260330-dma-build-fix-v1-1-748b64f0d8af@kernel.org>
	<62b9e47c-1c31-4654-8347-16516faf73f0@samsung.com>
	<20260330-glaring-pygmy-dodo-fa06f3@houat>
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-57614-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:dkim,samsung.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3C81235B5AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 30.03.2026 13:41, Maxime Ripard wrote:
> On Mon, Mar 30, 2026 at 10:59:48AM +0200, Marek Szyprowski wrote:
>> On 30.03.2026 10:40, Maxime Ripard wrote:
>>> Commit 3a236f6a5cf2 ("dma: contiguous: Turn heap registration logic
>>> around") didn't remove one last call to dma_heap_cma_register_heap()
>>> that it removed, thus breaking the build.
>>>
>>> That last call is in dma_contiguous_reserve(), to handle the
>>> registration of the default CMA region heap instance if it's declared in
>>> the device tree.
>>>
>>> However, the default CMA region instance is already handled by
>>> retrieving it through dev_get_cma_area() in the CMA heap driver, so the
>>> call to dma_heap_cma_register_heap() wasn't actually needed.
>>>
>>> Let's remove this call, the now unused function definition, its now
>>> empty header, and all includes of this header.
>>>
>>> Fixes: 3a236f6a5cf2 ("dma: contiguous: Turn heap registration logic around")
>>> Reported-by: Mark Brown <broonie@kernel.org>
>>> Closes: https://lore.kernel.org/linux-next/acbjaDJ1a-YQC64d@sirena.co.uk/
>>> Signed-off-by: Maxime Ripard <mripard@kernel.org>
>>> ---
>>>  drivers/dma-buf/heaps/cma_heap.c  |  1 -
>>>  include/linux/dma-buf/heaps/cma.h | 16 ----------------
>>>  kernel/dma/contiguous.c           |  5 -----
>>>  3 files changed, 22 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
>>> index f8a3d87f3ccee9630383ba28502eb40b10671cc2..cc517ac68a0bec0788abcb338c03f530d169013b 100644
>>> --- a/drivers/dma-buf/heaps/cma_heap.c
>>> +++ b/drivers/dma-buf/heaps/cma_heap.c
>>> @@ -12,11 +12,10 @@
>>>  
>>>  #define pr_fmt(fmt) "cma_heap: " fmt
>>>  
>>>  #include <linux/cma.h>
>>>  #include <linux/dma-buf.h>
>>> -#include <linux/dma-buf/heaps/cma.h>
>>>  #include <linux/dma-heap.h>
>>>  #include <linux/dma-map-ops.h>
>>>  #include <linux/err.h>
>>>  #include <linux/highmem.h>
>>>  #include <linux/io.h>
>>> diff --git a/include/linux/dma-buf/heaps/cma.h b/include/linux/dma-buf/heaps/cma.h
>>> deleted file mode 100644
>>> index e751479e21e703e24a5f799b4a7fc8bd0df3c1c4..0000000000000000000000000000000000000000
>>> --- a/include/linux/dma-buf/heaps/cma.h
>>> +++ /dev/null
>>> @@ -1,16 +0,0 @@
>>> -/* SPDX-License-Identifier: GPL-2.0 */
>>> -#ifndef DMA_BUF_HEAP_CMA_H_
>>> -#define DMA_BUF_HEAP_CMA_H_
>>> -
>>> -struct cma;
>>> -
>>> -#ifdef CONFIG_DMABUF_HEAPS_CMA
>>> -int dma_heap_cma_register_heap(struct cma *cma);
>>> -#else
>>> -static inline int dma_heap_cma_register_heap(struct cma *cma)
>>> -{
>>> -	return 0;
>>> -}
>>> -#endif // CONFIG_DMABUF_HEAPS_CMA
>>> -
>>> -#endif // DMA_BUF_HEAP_CMA_H_
>>> diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
>>> index ad50512d71d3088a73e4b1ac02d6e6122374888e..9fe001c712339f8388d3f40cca3dfff3f707fcbf 100644
>>> --- a/kernel/dma/contiguous.c
>>> +++ b/kernel/dma/contiguous.c
>>> @@ -40,11 +40,10 @@
>>>  #include <asm/page.h>
>>>  
>>>  #include <linux/memblock.h>
>>>  #include <linux/err.h>
>>>  #include <linux/sizes.h>
>>> -#include <linux/dma-buf/heaps/cma.h>
>>>  #include <linux/dma-map-ops.h>
>>>  #include <linux/cma.h>
>>>  #include <linux/nospec.h>
>>>  
>>>  #ifdef CONFIG_CMA_SIZE_MBYTES
>>> @@ -270,14 +269,10 @@ void __init dma_contiguous_reserve(phys_addr_t limit)
>>>  						  selected_limit,
>>>  						  &dma_contiguous_default_area,
>>>  						  fixed);
>>>  		if (ret)
>>>  			return;
>>> -
>>> -		ret = dma_heap_cma_register_heap(dma_contiguous_default_area);
>>> -		if (ret)
>>> -			pr_warn("Couldn't register default CMA heap.");
>> After this change no dma-buf heap for the default CMA area is created if it has 
>> not been specified in device-tree. This might be especially a problem for the
>> non-dt systems.
> I don't think that's the case? My understanding is that
> dma_contiguous_reserve() is called by the arch code, and will create
> that region only if it hasn't be set by the DT (that excerpt above is
> run only if !dma_contiguous_default_area).
>
> However, for the DT case, dma_contiguous_default_area will be set by
> rmem_cma_setup() a bit below if linux,cma-default is set in the DT.
>
> dma_contiguous_reserved() is called (on arm64 at least) through
> bootmem_init(), called as part of setup_arch().
>
> rmem_cma_setup() is called through RESERVEDMEM_OF_DECLARE, so through
> __reserved_mem_init_node(), so, if we consider only the public
> functions, through:
>
>   * fdt_scan_reserved_mem_reg_nodes(), called by
>     unflatten_device_tree(), called right before bootmem_init() in
>     setup_arch();
>
>   * or fdt_scan_reserved_mem() and then
>     early_init_fdt_scan_reserved_mem(), called in arm64_memblock_init(),
>     itself called in setup_arch() earlier than both
>     unflatten_device_tree(), and bootmem_init().
>
> Thus, the DT case will run first and set dma_contiguous_default_area if
> relevant on that platform, and if it's not set, the non-DT case will set
> it up. Either way, dma_contiguous_default_area will be set.
>
> The CMA heap runs much later using a regular module_init. It will
> retrieve dma_contiguous_default_area through dev_get_cma_area(), and
> will create a heap instance for the default area.
>
> Am I misunderstanding something?

The default CMA area is also optional for DT platforms. 

If DT doesn't provide such, it will be created based on the kernel cmdline cma= parameter or the default configuration defined in the kernel .config (this is also true for the non-dt platforms). I know that for most Android GKI systems the default CMA area will be defined in DT, but I see no reason to disable dma-buf heap support for the default CMA area if it has been instantiated from kernel cmdline or .config.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


