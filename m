Return-Path: <linux-media+bounces-54306-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JtaG0G1pmk7TAAAu9opvQ
	(envelope-from <linux-media+bounces-54306-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 11:17:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F08421EC8FA
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 11:17:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9DD5330B46B7
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 10:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E3539D6C3;
	Tue,  3 Mar 2026 10:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ig/bQomu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A3F39B96A;
	Tue,  3 Mar 2026 10:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772532818; cv=none; b=C6wqgIESBlmTGHGOBTH3h/ynL/5fC7naWWDp00nbgs4pV3m0hU3yz/+vwMn837K1iFwoPcIs960UJSAYzHysUpg8FPa8ucTrv1q8kwxV0OLn166CAJvjzc6G1Rj5AXBIMXXGuQvAIto14FfJ40u23kZLcnBFf1gnay9mZn3/heE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772532818; c=relaxed/simple;
	bh=lO+1PMKRSkJNghp2Ly48vsH4KqRxHWKQohidvl/pe2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JQj1IPuOW/+7LAsIzey20GQXKhdg5rrQR6gpQumiBk2eTJ/8LAVsgnyYXVg3eDqItwR8BgNTah4fLLVcYgH9btwpc5/DnC6MnE9zpWogOktBbY1iCrGiC5kuJF0fhrz3wQuXfVa1M3lDxJjxMk3LtHBXaMZwm3ayzte+i6rc82w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ig/bQomu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0FCFC2BC87;
	Tue,  3 Mar 2026 10:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772532818;
	bh=lO+1PMKRSkJNghp2Ly48vsH4KqRxHWKQohidvl/pe2Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ig/bQomueXUc216uzemyo2U7Bbfzhcnc5nCEskK/mHG1BNSkp3GNVKQcUoQF5QbIs
	 3Ql14c7EzyAwIOLpNgE4RVLoyqF/JkOXcKr/QFwizysU/w7EMn4z9bPzaPwAzstxwA
	 qMrhWoIKGCrBkZJD+FuOR1K3Y02+jGyn13qfMo5Xb2VgJnvXinZWmgj4b++CO37Pgh
	 yo548YffVMv7oJbhtPYd/f+5y5R8sQgYxKJtoIuANg+MX9pwblSdpNvzWQ3qUhezm3
	 9yu90bIGAySB/Mh5tSVxPLc+Lt5oM+5mpj/Opk08gXnc1NdLEqAbSjMbSCRoX8FJ1R
	 TwqT6cZiYZ5oA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 03 Mar 2026 11:13:10 +0100
Subject: [PATCH v3 7/8] dma-buf: heaps: cma: Turn the heap into a module
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-dma-buf-heaps-as-modules-v3-7-24344812c707@kernel.org>
References: <20260303-dma-buf-heaps-as-modules-v3-0-24344812c707@kernel.org>
In-Reply-To: <20260303-dma-buf-heaps-as-modules-v3-0-24344812c707@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Cc: Albert Esteve <aesteve@redhat.com>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1869; i=mripard@kernel.org;
 h=from:subject:message-id; bh=lO+1PMKRSkJNghp2Ly48vsH4KqRxHWKQohidvl/pe2Y=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJnLtphp/tk9K/m380aGhrutlZoh089yhxn5CWXlbGD3E
 ntoFVfbMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACZyYCpjw96X696qrNmY0KzK
 lFh940Fc/q33m61bV6u/3VdYf+pliXaje4peib7Al+5/W58s2c2VyVhn8nfape47nK3J9Qv+sqe
 qN1urnd+w8b5he5eljsLOoJMfZbUsXh+WY/u3tvRlQu/97fsB
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Rspamd-Queue-Id: F08421EC8FA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54306-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Now that all the symbols used by the CMA heap are exported, turning the
CMA heap into a module becomes pretty easy: we just need to add the
usual MODULE_* macros, import the proper namespaces and change the
Kconfig symbol to a tristate.

This heap won't be able to unload though, since we're missing a lot of
infrastructure to make it safe.

Reviewed-by: T.J. Mercier <tjmercier@google.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/dma-buf/heaps/Kconfig    | 2 +-
 drivers/dma-buf/heaps/cma_heap.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index a5eef06c422644e8aadaf5aff2bd9a33c49c1ba3..aed0b9b4febf388376cfc41be9843980d010c4e8 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -4,11 +4,11 @@ config DMABUF_HEAPS_SYSTEM
 	help
 	  Choose this option to enable the system dmabuf heap. The system heap
 	  is backed by pages from the buddy allocator. If in doubt, say Y.
 
 config DMABUF_HEAPS_CMA
-	bool "DMA-BUF CMA Heap"
+	tristate "DMA-BUF CMA Heap"
 	depends on DMABUF_HEAPS && DMA_CMA
 	help
 	  Choose this option to enable dma-buf CMA heap. This heap is backed
 	  by the Contiguous Memory Allocator (CMA). If your system has these
 	  regions, you should say Y here.
diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index f8a3d87f3ccee9630383ba28502eb40b10671cc2..7216a14262b04bb6130ddf26b7d009f7d15b03fd 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -422,5 +422,8 @@ static int __init add_cma_heaps(void)
 
 	return 0;
 }
 module_init(add_cma_heaps);
 MODULE_DESCRIPTION("DMA-BUF CMA Heap");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("DMA_BUF");
+MODULE_IMPORT_NS("DMA_BUF_HEAP");

-- 
2.53.0


