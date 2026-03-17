Return-Path: <linux-media+bounces-56085-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNvVDC5XuWnYAgIAu9opvQ
	(envelope-from <linux-media+bounces-56085-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:29:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A51172AAE00
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:29:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 051A130862EC
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA94B3CA49E;
	Tue, 17 Mar 2026 13:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VGdGn48/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EE83CB2C1
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 13:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773753861; cv=none; b=ahWKf6rPOCCAodqKsg1nvV3mG9guuQUC0YzdnR8DcVNgF1ZNin+I0snysd6CUDkJo7UQmE/6HB2hiRPT2McUgaYbcZCuchXdj7rCLZFLdOgH2PVy609k2uag4W/btRwzCj5N6YasFvUSDZyfQXeC1DKoREnAc4n8iZSu95r5gHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773753861; c=relaxed/simple;
	bh=7Qt6Q9z2m0IUW39FJ0I96ZaoPjhs3eTkYaQNqdf8tjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZ508sgGdhyZG6r7ktDXU3L+jiJ/K07WLHHn9Y327voecGEGwVX6TbKPJzR0ihoduw2JHDGvx6C1xD0mYamkoHLyghAYZm0ZgCTp10Ws2EVQWotWMcz9CAcA/Xozm5pS2tCsTcX2YIAxXC0CNuUWUxlWv/xVeNFYvQUAMCG65uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VGdGn48/; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48569636800so74395e9.0
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 06:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773753858; x=1774358658; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zWZeNHlOMbvwVmHsivYMTEHjYjPNUndT05044cKL2Xs=;
        b=VGdGn48/LRM5/JRQhzdjI3EY2gac8bv8hlMLoLZpS13QROBC+G1fYZ4y+nAv69NyW/
         WufN0/7Ob7VsUSm+BqeiDiE7EZRgxoxfeTkCGSRjTdO5+WolscTS/f9ZQnxwJxBdyPea
         esGwYXbSf/CWtwDm1SqS+xRYm7FV88ZOBTVjD+ntjkHx7wPEyDTi+ty7PYWgYhIPxU+i
         7O/1yRjObE7Gya98nBp8z3aWKcGRz6/BivYnNK4RmDbakSgUi+CwpQMRzMi4yP4DOqTX
         t6U1X+I/k+QQRqkNr/X8eGFYJMZsz/qMUbzKH89GofdUFUjumnybLLIr1DbKZSSyqftA
         W6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773753858; x=1774358658;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zWZeNHlOMbvwVmHsivYMTEHjYjPNUndT05044cKL2Xs=;
        b=khJL6o2TcHTZ8AXfYWrxPcFCcZAHZCnRDNssalG76AeTk+ccyhzxX55TxjtdByxpxz
         4+epzNbUcePk2LDrEDbBwWtzWWmRqY/HDmG7Q4E+LaeD4p+66tuY9XvnbhkQMhlcVChM
         yIapfkcpyi29gmq5dD3/Z2U1VK4Lo5R+yo6Hjp4i7iAUsknbTOxHqD85XrzO226cQZ7u
         adPsNkrITtO6QCis76flKCysLXRG1y8l/xXljfYhPHdVugzYt8mLCpbDHxoWUCdhjnsW
         d7/fr/kLuVO8z+Xe4np4cIs0ZSX9D3U3MpKv1I7HuptQY91vLcXcrev38/Cp0VioLtWe
         cYag==
X-Forwarded-Encrypted: i=1; AJvYcCU0BylZ/n4pFrT8QwCb/tCP9JdUBFviCGQC5Xy+4uBL+NZpv/yHSYNFSz0uWArMfONJCUkn84zvmo20Pw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPaZn8SlziCOO1+a0U0MDUIuRUs2t+a/PRyllN9B9Ne+9wmbMx
	XHpew/9P/N6l26L0OMAt8DRklhjMbBL4u31PT9kSCJAPLzXqCQlEYaNL+Pf8Nay9dw==
X-Gm-Gg: ATEYQzzElStJxmJeywwSnULbHa7oxLHcrABqwivTuVuce37N4Mndef1efBxdX74LLwD
	e0bf8Rk0DD01jfzNr2ZgaUgOG+1n5ZChvMo6DsG1QCn6eOJuIxOa9au6XLkdIbjfH3Z+yarCEgu
	DJVu4Hf0jvkDrkLj82GHbugsZQ5DyaHzfCKu4oQD/ip4td3nXS0A5GKVsjuQmKc5nMTclU0ahek
	dhB0EhiXPK/a64AhMqCTXJpYxe9NeAmHteEl913TBMiasw18NRVAql6DzhJZ98WrFN7oXPbfaaJ
	C+n/MEBKjIpez3lGY62mHeRPAg0zhG1DPlUbXBjjqg/Vcw3wAbfsRz5Ps6/lNl10Qb9/oHR9jGe
	Tp34JGuzbflnerfXfYH7RLA8pkofKg2fA6mWhOUmptyNqAKe1VroNWqcfO3FH9fZdHI6DzAyLzN
	747P1dqdT+Jer1/YYn0/Eq8NHHXa3frEJWCMzGpPA2RX3RadENsglEacjU
X-Received: by 2002:a05:600c:4e45:b0:485:b6e4:9808 with SMTP id 5b1f17b1804b1-485b6e49f7bmr773775e9.1.1773753857226;
        Tue, 17 Mar 2026 06:24:17 -0700 (PDT)
Received: from google.com (54.95.38.34.bc.googleusercontent.com. [34.38.95.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eae3322sm58975315e9.10.2026.03.17.06.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 06:24:16 -0700 (PDT)
Date: Tue, 17 Mar 2026 13:24:13 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jiri Pirko <jiri@resnulli.us>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	iommu@lists.linux.dev, linux-media@vger.kernel.org,
	sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
	christian.koenig@amd.com, m.szyprowski@samsung.com,
	robin.murphy@arm.com, jgg@ziepe.ca, leon@kernel.org,
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com,
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 0/2] dma-buf: heaps: system: add an option to
 allocate explicitly decrypted memory
Message-ID: <ablV_f_l7wD2m63E@google.com>
References: <20260305123641.164164-1-jiri@resnulli.us>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260305123641.164164-1-jiri@resnulli.us>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-56085-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[smostafa@google.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: A51172AAE00
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jiri,

On Thu, Mar 05, 2026 at 01:36:39PM +0100, Jiri Pirko wrote:
> From: Jiri Pirko <jiri@nvidia.com>
> 
> Confidential computing (CoCo) VMs/guests, such as AMD SEV and Intel TDX,
> run with encrypted/protected memory which creates a challenge
> for devices that do not support DMA to it (no TDISP support).
> 
> For kernel-only DMA operations, swiotlb bounce buffering provides a
> transparent solution by copying data through decrypted memory.
> However, the only way to get this memory into userspace is via the DMA
> API's dma_alloc_pages()/dma_mmap_pages() type interfaces which limits
> the use of the memory to a single DMA device, and is incompatible with
> pin_user_pages().
> 
> These limitations are particularly problematic for the RDMA subsystem
> which makes heavy use of pin_user_pages() and expects flexible memory
> usage between many different DMA devices.
> 
> This patch series enables userspace to explicitly request decrypted
> (shared) memory allocations from the dma-buf system heap.
> Userspace can mmap this memory and pass the dma-buf fd to other
> existing importers such as RDMA or DRM devices to access the
> memory. The DMA API is improved to allow the dma heap exporter to DMA
> map the shared memory to each importing device.

I have been looking into a similar problem with restricted-dma[1] and
the inability of the DMA API to recognize that a block of memory is
already decrypted.

However, in your case, adding a new attr “DMA_ATTR_CC_DECRYPTED” works
well as dma-buf owns the memory, and is both responsible for the
set_memory_decrypted() and passing the DMA attrs.

On the other hand, for restricted-dma, the memory decryption is deep
in the DMA direct memory allocation and the DMA API callers (for ex
virtio drivers) are clueless about it and can’t pass any attrs.
My proposal was specific to restricted-dma and won’t work for your case.

I am wondering if the kernel should have a more solid, unified method
for identifying already-decrypted memory instead. Perhaps we need a
way for the DMA API to natively recognize the encryption state of a
physical page (working alongside force_dma_unencrypted(dev)), rather
than relying on caller-provided attributes?

[1] https://lore.kernel.org/all/20260305170335.963568-1-smostafa@google.com/

Thanks,
Mostafa


> 
> Jiri Pirko (2):
>   dma-mapping: introduce DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
>   dma-buf: heaps: system: add system_cc_decrypted heap for explicitly
>     decrypted memory
> 
>  drivers/dma-buf/heaps/system_heap.c | 103 ++++++++++++++++++++++++++--
>  include/linux/dma-mapping.h         |   6 ++
>  include/trace/events/dma.h          |   3 +-
>  kernel/dma/direct.h                 |  14 +++-
>  4 files changed, 117 insertions(+), 9 deletions(-)
> 
> -- 
> 2.51.1
> 

