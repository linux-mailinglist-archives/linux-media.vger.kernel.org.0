Return-Path: <linux-media+bounces-54300-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHXxFnC0pmk7TAAAu9opvQ
	(envelope-from <linux-media+bounces-54300-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 11:14:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C90B01EC818
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 11:14:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C321D3076499
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 10:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5CA398918;
	Tue,  3 Mar 2026 10:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D2d7GSce"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60313822A3;
	Tue,  3 Mar 2026 10:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772532800; cv=none; b=IniJvKhPSoSFfsCStHauMRIuywBOl7ZMMC/6w3D9sNpHciBlRp5ddLSY4GYI/hoeJc5OGteaCV/IoPDp8hqmlRUAPDOjQLawQmTLPZeMkBkO0lCVOg965kz8HFrwxtTUDXCpHl6spLEk55uvIoAe8dRnB7lUEt9bHO9kcAcuO4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772532800; c=relaxed/simple;
	bh=9Km9m0AXCUr/a6vgKJn4EecEuoKphraVZQe3lTzETlY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QzejMNktP6gbi6Gq7o9agla8uFywM57PLUflQqwSGEwcSkmB8wV9cwFL9DB31O0hPkQz6jzSUL/68C3EUblP3JcDcTqNk+q170yqDTTRlYFq9kOS1itPiKRo/A4uRK0ouVgbw70tp9epETqMDhoNacKTkkUmKGLjoyppIKzlX9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D2d7GSce; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71B84C2BC87;
	Tue,  3 Mar 2026 10:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772532799;
	bh=9Km9m0AXCUr/a6vgKJn4EecEuoKphraVZQe3lTzETlY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=D2d7GSceo2GvP+dNzIPEP4ShcHqDj1mZkp1iu8UOhrVMZYMWVxIbp/uP0T8ZscKi3
	 lngmQRRXkWN8GJJy1USDTQDtf4yW1r8QgxmoRtmMSaYOPXIKSFgss9LpbTJ5Yg0rTD
	 pNTx7dsao1Ox1bbzxWwaJFwXR2f3AKEmTvFHdc9JfPH9cX9guJskLgK3FnAMbA7p9C
	 EA+gvFd7dwRHQPOsaXjGXpS9PunNElnwDCZOjYjLtxqiFDzE9tvzEs8KsmR2jjLyQK
	 tksUQmnOgbG8ky7g+hY6Zy0WOGt9+MUFsBzRcYsYcsHPadDecoBXGFN1M7kuPi5ISq
	 H3NYMxITNv3dw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 03 Mar 2026 11:13:04 +0100
Subject: [PATCH v3 1/8] dma: contiguous: Turn heap registration logic
 around
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-dma-buf-heaps-as-modules-v3-1-24344812c707@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5204; i=mripard@kernel.org;
 h=from:subject:message-id; bh=9Km9m0AXCUr/a6vgKJn4EecEuoKphraVZQe3lTzETlY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJnLtphcSmn/y3jh6D3phd9vaE3RX6ltOKNy1+XtUx2OB
 Tzt5GRt7JjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQATYVFnbGj5sJbFUM67h2PH
 hA7JXQ4z0h+aWR8X9knqjfgoICOf3Rd59O4CUxXT8//n/nUI+bH5HGOdAscG6Q8rXDcVixxdFl+
 rmbC/wcZwQ/9q8xWqW1wND084VFlcvqCpM9r12sRjkvc+M2sBAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Rspamd-Queue-Id: C90B01EC818
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
	TAGGED_FROM(0.00)[bounces-54300-lists,linux-media=lfdr.de];
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

The CMA heap instantiation was initially developed by having the
contiguous DMA code call into the CMA heap to create a new instance
every time a reserved memory area is probed.

Turning the CMA heap into a module would create a dependency of the
kernel on a module, which doesn't work.

Let's turn the logic around and do the opposite: store all the reserved
memory CMA regions into the contiguous DMA code, and provide an iterator
for the heap to use when it probes.

Reviewed-by: T.J. Mercier <tjmercier@google.com>
Reviewed-by: Albert Esteve <aesteve@redhat.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/dma-buf/heaps/cma_heap.c | 18 ++----------------
 include/linux/dma-map-ops.h      |  5 +++++
 kernel/dma/contiguous.c          | 26 ++++++++++++++++++++++++--
 3 files changed, 31 insertions(+), 18 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index bd3370b9a3f6d4e18885a1d0e8ba3f659b85ef47..f8a3d87f3ccee9630383ba28502eb40b10671cc2 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -28,23 +28,10 @@
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
 #define DEFAULT_CMA_NAME "default_cma_region"
 
-static struct cma *dma_areas[MAX_CMA_AREAS] __initdata;
-static unsigned int dma_areas_num __initdata;
-
-int __init dma_heap_cma_register_heap(struct cma *cma)
-{
-	if (dma_areas_num >= ARRAY_SIZE(dma_areas))
-		return -EINVAL;
-
-	dma_areas[dma_areas_num++] = cma;
-
-	return 0;
-}
-
 struct cma_heap {
 	struct dma_heap *heap;
 	struct cma *cma;
 };
 
@@ -412,22 +399,21 @@ static int __init __add_cma_heap(struct cma *cma, const char *name)
 }
 
 static int __init add_cma_heaps(void)
 {
 	struct cma *default_cma = dev_get_cma_area(NULL);
+	struct cma *cma;
 	unsigned int i;
 	int ret;
 
 	if (default_cma) {
 		ret = __add_cma_heap(default_cma, DEFAULT_CMA_NAME);
 		if (ret)
 			return ret;
 	}
 
-	for (i = 0; i < dma_areas_num; i++) {
-		struct cma *cma = dma_areas[i];
-
+	for (i = 0; (cma = dma_contiguous_get_reserved_region(i)) != NULL; i++) {
 		ret = __add_cma_heap(cma, cma_get_name(cma));
 		if (ret) {
 			pr_warn("Failed to add CMA heap %s", cma_get_name(cma));
 			continue;
 		}
diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 60b63756df821d839436618f1fca2bfa3eabe075..3007c68a8ec5b85990d1938d04a2f05c1a71acdb 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -110,10 +110,11 @@ bool dma_release_from_contiguous(struct device *dev, struct page *pages,
 				 int count);
 struct page *dma_alloc_contiguous(struct device *dev, size_t size, gfp_t gfp);
 void dma_free_contiguous(struct device *dev, struct page *page, size_t size);
 
 void dma_contiguous_early_fixup(phys_addr_t base, unsigned long size);
+struct cma *dma_contiguous_get_reserved_region(unsigned int idx);
 #else /* CONFIG_DMA_CMA */
 static inline struct cma *dev_get_cma_area(struct device *dev)
 {
 	return NULL;
 }
@@ -148,10 +149,14 @@ static inline void dma_free_contiguous(struct device *dev, struct page *page,
 	__free_pages(page, get_order(size));
 }
 static inline void dma_contiguous_early_fixup(phys_addr_t base, unsigned long size)
 {
 }
+static inline struct cma *dma_contiguous_get_reserved_region(unsigned int idx)
+{
+	return NULL;
+}
 #endif /* CONFIG_DMA_CMA*/
 
 #ifdef CONFIG_DMA_DECLARE_COHERENT
 int dma_declare_coherent_memory(struct device *dev, phys_addr_t phys_addr,
 		dma_addr_t device_addr, size_t size);
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index c56004d314dc2e436cddf3b20a4ee6ce8178bee4..14bd54fb758537f01a6fe27318e7b683964e20b1 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -456,10 +456,32 @@ void dma_free_contiguous(struct device *dev, struct page *page, size_t size)
 #include <linux/of_reserved_mem.h>
 
 #undef pr_fmt
 #define pr_fmt(fmt) fmt
 
+static struct cma *rmem_cma_areas[MAX_CMA_AREAS];
+static unsigned int rmem_cma_areas_num;
+
+static int rmem_cma_insert_area(struct cma *cma)
+{
+	if (rmem_cma_areas_num >= ARRAY_SIZE(rmem_cma_areas))
+		return -EINVAL;
+
+	rmem_cma_areas[rmem_cma_areas_num++] = cma;
+
+	return 0;
+}
+
+struct cma *dma_contiguous_get_reserved_region(unsigned int idx)
+{
+	if (idx >= rmem_cma_areas_num)
+		return NULL;
+
+	return rmem_cma_areas[idx];
+}
+EXPORT_SYMBOL_GPL(dma_contiguous_get_reserved_region);
+
 static int rmem_cma_device_init(struct reserved_mem *rmem, struct device *dev)
 {
 	dev->cma_area = rmem->priv;
 	return 0;
 }
@@ -504,13 +526,13 @@ static int __init rmem_cma_setup(struct reserved_mem *rmem)
 	rmem->priv = cma;
 
 	pr_info("Reserved memory: created CMA memory pool at %pa, size %ld MiB\n",
 		&rmem->base, (unsigned long)rmem->size / SZ_1M);
 
-	err = dma_heap_cma_register_heap(cma);
+	err = rmem_cma_insert_area(cma);
 	if (err)
-		pr_warn("Couldn't register CMA heap.");
+		pr_warn("Couldn't store CMA reserved area.");
 
 	return 0;
 }
 RESERVEDMEM_OF_DECLARE(cma, "shared-dma-pool", rmem_cma_setup);
 #endif

-- 
2.53.0


