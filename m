Return-Path: <linux-media+bounces-57757-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPsnH0icy2loJgYAu9opvQ
	(envelope-from <linux-media+bounces-57757-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:04:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0215A3678DC
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:04:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E10CC30C6033
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 319323EF0B8;
	Tue, 31 Mar 2026 10:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Up1CxMKO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA2E30F803;
	Tue, 31 Mar 2026 10:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774951242; cv=none; b=rcQ1xWI1uZVFC52gCz8z9+HcUJuvCCh40iU6mcc7QZrL5ffkGxllVA/BMLtTISoW451S1yNwkKqbg6FioU1Hih4xYdAYJ6hCsIgNQ8daTC34cssA6xaN5junJxfBbfADofpDC+TG/r+KCIyzR+ltAygFql27/QXlIke06ySRzRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774951242; c=relaxed/simple;
	bh=XD1ohQhO9zZA1+h5cJdCf8noqsv9utcIYdzdurGWIrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pIxO/TXaIk6VX1iQMvX/pxBzIKS/jfos/wjzfHh68mJga11EdsialIZMNFPvQ+fTLEUsfm2BVGCMBsXruLh0oXr4K+uaD6ziOMmzB9yFtwehf5Jm0WuSY25hbmVuN9OwGMruj1jPLSduIsJUX5ABbNuxRBNNs550i+N8oB2EQxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Up1CxMKO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6FDDC19423;
	Tue, 31 Mar 2026 10:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774951242;
	bh=XD1ohQhO9zZA1+h5cJdCf8noqsv9utcIYdzdurGWIrY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Up1CxMKOAyN1rLwyQza8/sAk+vuTStw21qVWIaeT0nv7/i2FS4hW1rDu2o22IyXEN
	 KKa5Vg1LLUbpLbvjhb8zh9awLQxhplAE1M+xTJ8L4nCdl3cjQ2uhrO36q6X6Buto1Y
	 tfUcsp3l4j89be0q9tm1gQnuH5PromlrCiPR4/nrg67weWLfiN0M+uaYpQNacjCkh+
	 g+G29chbogcDCTSGyLBYn2A0b5DGmhrxkNzYIfWxzmKDL0c96m5+Ia5YlCSC/kw39e
	 C+SDDZTbdOUeTGc95q0Rbc2mPncZYH6jGbvfdwKsAke6Qi0IxqrllwEc+J1jHuMPBs
	 vpQqXEfrI7rgw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 31 Mar 2026 12:00:16 +0200
Subject: [PATCH v4 7/8] dma-buf: heaps: cma: Turn the heap into a module
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-dma-buf-heaps-as-modules-v4-7-e18fda504419@kernel.org>
References: <20260331-dma-buf-heaps-as-modules-v4-0-e18fda504419@kernel.org>
In-Reply-To: <20260331-dma-buf-heaps-as-modules-v4-0-e18fda504419@kernel.org>
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
 h=from:subject:message-id; bh=XD1ohQhO9zZA1+h5cJdCf8noqsv9utcIYdzdurGWIrY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJmnZxt2/QrhDmEWnJyuEZ53bFn8sXkc/fdfaT1zvGv9R
 LA4sj+hYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAExkoTZjw5nbW9wPGX2XvzCp
 NnIfb9ta1a19Tar+HziFhd6HPjo/df3qyE3LS7byVlas//HX8DaHKmN9uOtdhR0Ge1ts2rp1L+r
 Psrpy+l3A5P2zWGvPxGWffLW7YLeUjuTjde96utSmCZ7/spcJAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57757-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0215A3678DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 33cac626da1198e3c4a1cdcd562223c1924b6ceb..0ed519a19da455df7441396c96934a107fd72ffb 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -421,5 +421,8 @@ static int __init add_cma_heaps(void)
 
 	return 0;
 }
 module_init(add_cma_heaps);
 MODULE_DESCRIPTION("DMA-BUF CMA Heap");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("DMA_BUF");
+MODULE_IMPORT_NS("DMA_BUF_HEAP");

-- 
2.53.0


