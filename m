Return-Path: <linux-media+bounces-57571-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIvpBxA8ymnD6gUAu9opvQ
	(envelope-from <linux-media+bounces-57571-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:02:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0910357AD9
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:02:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B635E301A9EE
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 09:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E9133B52F7;
	Mon, 30 Mar 2026 08:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Mbuozpvj"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32623B47DC
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 08:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774861195; cv=none; b=Dl5DCOLofYX9xqSdamE4hDwFF+6mvMuSiWyIN96VSqoubJvVyf/GngwA+RHZCH23Pj2NCqyfb3dA47LX7F3lyKWv2zSyuHQ74haGzY9qvHnKCTn6FlofRw1p3eMXdWvJ2YXzo+507iGL4nmgxYjzsPfe6W4dsRSP7qxzXqys5G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774861195; c=relaxed/simple;
	bh=4fEDventmX0qGo5Za/mQHwjJ7mCuukWm9uGdDRkRIow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=apt6+/+g0Wdxs1vbklNuThLf65mfgMeN5LXvzxWauqfLywatepAIjGvnj5IK5cm8BCu0O4VYQWMyqz440IqIIhgHG40b/O2WJbZ8HRFhPGZGv76TumVCXebivaJPku9m4Zmj1up/mrECNxwr7bCNt0xEV4x+0JvDvQSEyggdrTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Mbuozpvj; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260330085950euoutp029eca169024a3f58bc9d68eac466cdfc5~hktl2CRCL2036620366euoutp020
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 08:59:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260330085950euoutp029eca169024a3f58bc9d68eac466cdfc5~hktl2CRCL2036620366euoutp020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1774861190;
	bh=cYvbV9vmk6ZuLyfnM/KH4B2QOnv37WDoJ8hEc+JQuDg=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=MbuozpvjXWHXgzgjWuHC+ySMxMXxaTWV7Sd/Tq080KossBGSyJjExqCDgMFiG8JfX
	 eL7VwSyau7cyhIx+lHAGVCbHfb5M06r5oiWHa5is7xp0/GV1SYevmTcaYkhB97c0gx
	 fO581/KMGXd2xcbkYqkiT3PAfMOe7O9FoBaEsFs0=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260330085950eucas1p1f94b35200e0ca2471baa85be6b85512f~hktlSraz10257402574eucas1p1P;
	Mon, 30 Mar 2026 08:59:50 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260330085949eusmtip2f8fb615228f6bf437e97b25c4fd14566~hktknbyTA1554315543eusmtip2h;
	Mon, 30 Mar 2026 08:59:49 +0000 (GMT)
Message-ID: <62b9e47c-1c31-4654-8347-16516faf73f0@samsung.com>
Date: Mon, 30 Mar 2026 10:59:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] dma/contiguous: Fix broken build
To: Maxime Ripard <mripard@kernel.org>, Sumit Semwal
	<sumit.semwal@linaro.org>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Robin Murphy
	<robin.murphy@arm.com>, Albert Esteve <aesteve@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	iommu@lists.linux.dev, Mark Brown <broonie@kernel.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260330-dma-build-fix-v1-1-748b64f0d8af@kernel.org>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260330085950eucas1p1f94b35200e0ca2471baa85be6b85512f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260330084111eucas1p1e7cd5c886e34d0ed41226fe524d2a55a
X-EPHeader: CA
X-CMS-RootMailID: 20260330084111eucas1p1e7cd5c886e34d0ed41226fe524d2a55a
References: <CGME20260330084111eucas1p1e7cd5c886e34d0ed41226fe524d2a55a@eucas1p1.samsung.com>
	<20260330-dma-build-fix-v1-1-748b64f0d8af@kernel.org>
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-57571-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[2600:3c09:e001:a7::12fc:5321:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:dkim,samsung.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C0910357AD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 30.03.2026 10:40, Maxime Ripard wrote:
> Commit 3a236f6a5cf2 ("dma: contiguous: Turn heap registration logic
> around") didn't remove one last call to dma_heap_cma_register_heap()
> that it removed, thus breaking the build.
>
> That last call is in dma_contiguous_reserve(), to handle the
> registration of the default CMA region heap instance if it's declared in
> the device tree.
>
> However, the default CMA region instance is already handled by
> retrieving it through dev_get_cma_area() in the CMA heap driver, so the
> call to dma_heap_cma_register_heap() wasn't actually needed.
>
> Let's remove this call, the now unused function definition, its now
> empty header, and all includes of this header.
>
> Fixes: 3a236f6a5cf2 ("dma: contiguous: Turn heap registration logic around")
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/linux-next/acbjaDJ1a-YQC64d@sirena.co.uk/
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/dma-buf/heaps/cma_heap.c  |  1 -
>  include/linux/dma-buf/heaps/cma.h | 16 ----------------
>  kernel/dma/contiguous.c           |  5 -----
>  3 files changed, 22 deletions(-)
>
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> index f8a3d87f3ccee9630383ba28502eb40b10671cc2..cc517ac68a0bec0788abcb338c03f530d169013b 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -12,11 +12,10 @@
>  
>  #define pr_fmt(fmt) "cma_heap: " fmt
>  
>  #include <linux/cma.h>
>  #include <linux/dma-buf.h>
> -#include <linux/dma-buf/heaps/cma.h>
>  #include <linux/dma-heap.h>
>  #include <linux/dma-map-ops.h>
>  #include <linux/err.h>
>  #include <linux/highmem.h>
>  #include <linux/io.h>
> diff --git a/include/linux/dma-buf/heaps/cma.h b/include/linux/dma-buf/heaps/cma.h
> deleted file mode 100644
> index e751479e21e703e24a5f799b4a7fc8bd0df3c1c4..0000000000000000000000000000000000000000
> --- a/include/linux/dma-buf/heaps/cma.h
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef DMA_BUF_HEAP_CMA_H_
> -#define DMA_BUF_HEAP_CMA_H_
> -
> -struct cma;
> -
> -#ifdef CONFIG_DMABUF_HEAPS_CMA
> -int dma_heap_cma_register_heap(struct cma *cma);
> -#else
> -static inline int dma_heap_cma_register_heap(struct cma *cma)
> -{
> -	return 0;
> -}
> -#endif // CONFIG_DMABUF_HEAPS_CMA
> -
> -#endif // DMA_BUF_HEAP_CMA_H_
> diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> index ad50512d71d3088a73e4b1ac02d6e6122374888e..9fe001c712339f8388d3f40cca3dfff3f707fcbf 100644
> --- a/kernel/dma/contiguous.c
> +++ b/kernel/dma/contiguous.c
> @@ -40,11 +40,10 @@
>  #include <asm/page.h>
>  
>  #include <linux/memblock.h>
>  #include <linux/err.h>
>  #include <linux/sizes.h>
> -#include <linux/dma-buf/heaps/cma.h>
>  #include <linux/dma-map-ops.h>
>  #include <linux/cma.h>
>  #include <linux/nospec.h>
>  
>  #ifdef CONFIG_CMA_SIZE_MBYTES
> @@ -270,14 +269,10 @@ void __init dma_contiguous_reserve(phys_addr_t limit)
>  						  selected_limit,
>  						  &dma_contiguous_default_area,
>  						  fixed);
>  		if (ret)
>  			return;
> -
> -		ret = dma_heap_cma_register_heap(dma_contiguous_default_area);
> -		if (ret)
> -			pr_warn("Couldn't register default CMA heap.");
After this change no dma-buf heap for the default CMA area is created if it has 
not been specified in device-tree. This might be especially a problem for the
non-dt systems.


>  	}
>  }
>  
>  void __weak
>  dma_contiguous_early_fixup(phys_addr_t base, unsigned long size)
>
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


