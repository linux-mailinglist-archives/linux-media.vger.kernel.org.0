Return-Path: <linux-media+bounces-38168-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF11B0C2A5
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 13:19:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1283A178F4B
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 11:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48A9A2BDC2D;
	Mon, 21 Jul 2025 11:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j8uRdNR6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AA4298248;
	Mon, 21 Jul 2025 11:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753096674; cv=none; b=muk/1D3dd30V1n72UhzZuZqiOhZ39QaLcDaqtRsa590/vDr6TqlwC7jNzHv+9Imjc4tCiySuezdj+/k2TAqlJkstphVFxv5iDZEB9vn2ZpMH8swKAFVA0vMJsjQHd7V5deI2xkaXBo8NCSQGTxh9sKGWzRgHFc1ijFv9xzqZRBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753096674; c=relaxed/simple;
	bh=4T4b5ZbeftLTM3SsRon2K5QG8xDtblIGsfG23CADlSM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=etswd9kBO0MkLeA064JIHrhROobNNKwW+gV1rSjdzFWxGZ6GeZKy5l8LW59qq4pllFA9CNFxM2AC7A3VzPxC1vr70AHyByyTQvc5IYicp9viF98fpm2HtEgWTJ9XiuEy8MNlil6IYEpYIB3q62Hg432cOuhj+wX3BY6lZBP/nDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j8uRdNR6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87B00C4CEED;
	Mon, 21 Jul 2025 11:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753096673;
	bh=4T4b5ZbeftLTM3SsRon2K5QG8xDtblIGsfG23CADlSM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=j8uRdNR6aR8U6g8Ri5MWh9mk4cwJfet6aiu2HdwP4/QKIwasSYan9QORGc2/gZQ50
	 BumIi9ewUP6yZoZnfxGhtRXIQQcyEJbPwn+A0IrwNA5Laal3c/hk1Y43gBHGNVSLCM
	 9sFb9lTcVKjfyhkN2uI2qBjWFC2MQIcci+rMbwCUqrC2IAC3/dHSPbMMO5P3Uo3mwo
	 FyQN2sLdAx+4YpbZig9rlrBn9Mi4pKKVLsZykcClGLrARxfG/RdVNSFLdFtGxdA9uO
	 9/yiv7nGJJIMtYtkKYOSQBSLenI3aiBAF9CnPz+XKB9H6JF6V/w0GfR3D3UtUHvuuh
	 r1ffJsA2ZcsQA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 21 Jul 2025 13:17:34 +0200
Subject: [PATCH v7 5/5] dma-buf: heaps: cma: Create CMA heap for each CMA
 reserved region
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-dma-buf-ecc-heap-v7-5-031836e1a942@kernel.org>
References: <20250721-dma-buf-ecc-heap-v7-0-031836e1a942@kernel.org>
In-Reply-To: <20250721-dma-buf-ecc-heap-v7-0-031836e1a942@kernel.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Andrew Davis <afd@ti.com>, Jared Kangas <jkangas@redhat.com>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 iommu@lists.linux.dev, linux-doc@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5786; i=mripard@kernel.org;
 h=from:subject:message-id; bh=4T4b5ZbeftLTM3SsRon2K5QG8xDtblIGsfG23CADlSM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBl1ihcmWzFvfXJ31g6hiiVfFN/G/ZcPuvjx6RqG1L2Z6
 6TY/Hbv75jKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQAT+VDFWJ9gc8I3VT/vxme5
 mKJNOUqzO6eVKL2OuH619yVbhWzFI+/wnLSbYVve2rZHHCxZcOjBGcaGyaufS3xeoZeq5W9XLal
 ecatbdeMLndCXTI7zap1yw5qd5gQVqE9q6etuYVY8Jd0cmw4A
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Aside from the main CMA region, it can be useful to allow userspace to
allocate from the other CMA reserved regions.

Indeed, those regions can have specific properties that can be useful to
a specific us-case.

For example, one of them platform I've been with has ECC enabled on the
entire memory but for a specific region. Using that region to allocate
framebuffers can be particular beneficial because enabling the ECC has a
performance and memory footprint cost.

Thus, exposing these regions as heaps user-space can allocate from and
import wherever needed allows to cover that use-case.

For now, only shared-dma-pools regions with the reusable property (ie,
backed by CMA) are supported, but eventually we'll want to support other
DMA pools types.

Since we collected all the CMA regions created during boot, we can
simply iterate over all of them to create the heaps.

This has a weird interaction with the recent work on the CMA name, in
particular the backward compatibility code created by commit
854acbe75ff4 ("dma-buf: heaps: Give default CMA heap a fixed name").

Indeed, the old name was either 'reserved', or the name of the
reserved-memory region device tree node if the linux,cma-default
property was set.

In both these cases, we have now collected this region during boot, and
we're using the same name. So we're now largely redundant with the
code to handle backward compatibility code, and we can thus remove it
and the associated Kconfig option.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 Documentation/userspace-api/dma-buf-heaps.rst |  9 +++++---
 drivers/dma-buf/heaps/Kconfig                 | 10 --------
 drivers/dma-buf/heaps/cma_heap.c              | 33 +++++++++++++--------------
 3 files changed, 22 insertions(+), 30 deletions(-)

diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
index 17bf6829efd7963bc849765db54d327644e8c395..b78d2faeba62cda721a1f49d49e02bcb520ad429 100644
--- a/Documentation/userspace-api/dma-buf-heaps.rst
+++ b/Documentation/userspace-api/dma-buf-heaps.rst
@@ -22,8 +22,11 @@ following heaps:
    through the ``cma`` parameter, a memory region Device-Tree node with
    the ``linux,cma-default`` property set, or through the
    ``CMA_SIZE_MBYTES`` or ``CMA_SIZE_PERCENTAGE`` Kconfig options. Prior
    to Linux 6.17, its name wasn't stable and could be called
    ``reserved``, ``linux,cma``, or ``default-pool``, depending on the
-   platform. From Linux 6.17 onwards, the creation of these heaps is
-   controlled through the ``DMABUF_HEAPS_CMA_LEGACY`` Kconfig option for
-   backwards compatibility.
+   platform.
+
+ - A heap will be created for each reusable region in the device tree
+   with the ``shared-dma-pool`` compatible, using the full device tree
+   node name as its name. The buffer semantics are identical to
+   ``default-cma-region``.
diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index bb369b38b001af51721b56e065df92825022f1f1..a5eef06c422644e8aadaf5aff2bd9a33c49c1ba3 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -10,15 +10,5 @@ config DMABUF_HEAPS_CMA
 	depends on DMABUF_HEAPS && DMA_CMA
 	help
 	  Choose this option to enable dma-buf CMA heap. This heap is backed
 	  by the Contiguous Memory Allocator (CMA). If your system has these
 	  regions, you should say Y here.
-
-config DMABUF_HEAPS_CMA_LEGACY
-	bool "Legacy DMA-BUF CMA Heap"
-	default y
-	depends on DMABUF_HEAPS_CMA
-	help
-	  Add a duplicate CMA-backed dma-buf heap with legacy naming derived
-	  from the CMA area's devicetree node, or "reserved" if the area is not
-	  defined in the devicetree. This uses the same underlying allocator as
-	  CONFIG_DMABUF_HEAPS_CMA.
diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 2a901af635ed76cdb085915c03258c235e302792..42f88193eab9f8f4571064c7b3b8a73bca20fdf4 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -20,10 +20,12 @@
 #include <linux/err.h>
 #include <linux/highmem.h>
 #include <linux/io.h>
 #include <linux/mm.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
 #define DEFAULT_CMA_NAME "default_cma_region"
@@ -407,35 +409,32 @@ static int __init __add_cma_heap(struct cma *cma, const char *name)
 	}
 
 	return 0;
 }
 
-static int __init add_default_cma_heap(void)
+static int __init add_cma_heaps(void)
 {
 	struct cma *default_cma = dev_get_cma_area(NULL);
-	const char *legacy_cma_name;
+	unsigned int i;
 	int ret;
 
-	if (!default_cma)
-		return 0;
+	if (default_cma) {
+		ret = __add_cma_heap(default_cma, DEFAULT_CMA_NAME);
+		if (ret)
+			return ret;
+	}
 
-	ret = __add_cma_heap(default_cma, DEFAULT_CMA_NAME);
-	if (ret)
-		return ret;
+	for (i = 0; i < dma_areas_num; i++) {
+		struct cma *cma = dma_areas[i];
 
-	if (IS_ENABLED(CONFIG_DMABUF_HEAPS_CMA_LEGACY)) {
-		legacy_cma_name = cma_get_name(default_cma);
-		if (!strcmp(legacy_cma_name, DEFAULT_CMA_NAME)) {
-			pr_warn("legacy name and default name are the same, skipping legacy heap\n");
-			return 0;
+		ret = __add_cma_heap(cma, cma_get_name(cma));
+		if (ret) {
+			pr_warn("Failed to add CMA heap %s", cma_get_name(cma));
+			continue;
 		}
 
-		ret = __add_cma_heap(default_cma, legacy_cma_name);
-		if (ret)
-			pr_warn("failed to add legacy heap: %pe\n",
-				ERR_PTR(ret));
 	}
 
 	return 0;
 }
-module_init(add_default_cma_heap);
+module_init(add_cma_heaps);
 MODULE_DESCRIPTION("DMA-BUF CMA Heap");

-- 
2.50.1


