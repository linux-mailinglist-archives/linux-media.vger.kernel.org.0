Return-Path: <linux-media+bounces-38165-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F006DB0C296
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 13:18:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B150D18C3AAF
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 11:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B48329B8D2;
	Mon, 21 Jul 2025 11:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M5c43dVK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F4B29B224;
	Mon, 21 Jul 2025 11:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753096666; cv=none; b=fFiVBBKz8vwq2BHSWDskIPwQgcHhBkX66UuRFusdK6JlGtlp7U1q3BOzueh70lEX9+mWuedb7ECjYYEMBS3Q6wVfCUHjenLmPRMGt1ttN0aD1cE7UHGpYuz2hOFVXTQDIouyvVP/kYdhOS2ebLpu3VBRKnnsfkvnNP5GFvbxXuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753096666; c=relaxed/simple;
	bh=R7s2QbS4Azf34q7ntE4fERc43u45qADiAo0EY/vnlUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AYi8QJdw3bYebdwpDKWPkfa0n0Xvl/84Vit/tOuC+ztT18bUabs0Epw6XI5FVMxNdZic00e421oIJTU7CHyhuKMj/3YKgyUphzeeS7/gIi4HZWyyYY6vaRUvXzOpt2kfu6RIb7wR2GQx+bB66RaJJ3h+6aYNiZ6YhjtJ4NAQ4LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M5c43dVK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80451C4CEF4;
	Mon, 21 Jul 2025 11:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753096666;
	bh=R7s2QbS4Azf34q7ntE4fERc43u45qADiAo0EY/vnlUc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=M5c43dVKRdS8yfXBHGPXTHwZQdKOKbCFNZAm8Z1ZiQQWHUHcJOyxs3hDAi5nsNuzD
	 4pujLp02qa77Lh/iVo05aA1Vu1GKyEtzrh95kRaKCIe6EAcwwaq/3dg3a51sBoaY3C
	 c9bLlqJ7ILNUpDzrI76xRnmXcWNOgKbwvS1KJTEVWJsdnS6e1ZJA628ust75UyxNDh
	 FYnu1ASU1HGhnlVNhR+MRNaHxrC0bkFzeQKw3b6XPqcBxrS3NwYC2RqZk795s3A10d
	 LUMAoYIj4a1fz36DOny0jMIymAHBUeFANuTR2jLPzRFAiwn/niBCtx2E4ewVtKu4Pb
	 FCEFCt80FewQQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 21 Jul 2025 13:17:31 +0200
Subject: [PATCH v7 2/5] dma-buf: heaps: cma: Register list of CMA regions
 at boot
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-dma-buf-ecc-heap-v7-2-031836e1a942@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3200; i=mripard@kernel.org;
 h=from:subject:message-id; bh=R7s2QbS4Azf34q7ntE4fERc43u45qADiAo0EY/vnlUc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBl1iueFmubE8sh4cE/n37Og4euG4K4e28ZYp+65v194C
 m6zEJ3cMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACbSuJmxPq0019SlcuZa3cK4
 VTzV+wK9zkf9OJWVNF/ty6yKjHk5HIzFz0zys/957zu3WO+hWw0bY8PkENvmvtg/TlxMfVU817w
 i+h3TDm3v9d3juIDfj/vSDZFz/P9/b7y+vmrvxbvnjVtnswIA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

In order to create a CMA heap instance for each CMA region found in the
system, we need to register each of these instances.

While it would appear trivial, the CMA regions are created super early
in the kernel boot process, before most of the subsystems are
initialized. Thus, we can't just create an exported function to create a
heap from the CMA region being initialized.

What we can do however is create a two-step process, where we collect
all the CMA regions into an array early on, and then when we initialize
the heaps we iterate over that array and create the heaps from the CMA
regions we collected.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 MAINTAINERS                       |  1 +
 drivers/dma-buf/heaps/cma_heap.c  | 14 ++++++++++++++
 include/linux/dma-buf/heaps/cma.h | 16 ++++++++++++++++
 3 files changed, 31 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fad6cb025a1918beec113b576cf28b76151745ef..deb6930f28c82a7257f1d4610b9bc010de62a0c9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7095,10 +7095,11 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/driver-api/dma-buf.rst
 F:	Documentation/userspace-api/dma-buf-alloc-exchange.rst
 F:	drivers/dma-buf/
 F:	include/linux/*fence.h
 F:	include/linux/dma-buf.h
+F:	include/linux/dma-buf/
 F:	include/linux/dma-resv.h
 K:	\bdma_(?:buf|fence|resv)\b
 
 DMA GENERIC OFFLOAD ENGINE SUBSYSTEM
 M:	Vinod Koul <vkoul@kernel.org>
diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 0df007111975447d555714d61ead9699287fd65a..2a901af635ed76cdb085915c03258c235e302792 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -12,10 +12,11 @@
 
 #define pr_fmt(fmt) "cma_heap: " fmt
 
 #include <linux/cma.h>
 #include <linux/dma-buf.h>
+#include <linux/dma-buf/heaps/cma.h>
 #include <linux/dma-heap.h>
 #include <linux/dma-map-ops.h>
 #include <linux/err.h>
 #include <linux/highmem.h>
 #include <linux/io.h>
@@ -25,10 +26,23 @@
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
 #define DEFAULT_CMA_NAME "default_cma_region"
 
+static struct cma *dma_areas[MAX_CMA_AREAS] __initdata;
+static unsigned int dma_areas_num __initdata;
+
+int __init dma_heap_cma_register_heap(struct cma *cma)
+{
+	if (dma_areas_num >= ARRAY_SIZE(dma_areas))
+		return -EINVAL;
+
+	dma_areas[dma_areas_num++] = cma;
+
+	return 0;
+}
+
 struct cma_heap {
 	struct dma_heap *heap;
 	struct cma *cma;
 };
 
diff --git a/include/linux/dma-buf/heaps/cma.h b/include/linux/dma-buf/heaps/cma.h
new file mode 100644
index 0000000000000000000000000000000000000000..e751479e21e703e24a5f799b4a7fc8bd0df3c1c4
--- /dev/null
+++ b/include/linux/dma-buf/heaps/cma.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef DMA_BUF_HEAP_CMA_H_
+#define DMA_BUF_HEAP_CMA_H_
+
+struct cma;
+
+#ifdef CONFIG_DMABUF_HEAPS_CMA
+int dma_heap_cma_register_heap(struct cma *cma);
+#else
+static inline int dma_heap_cma_register_heap(struct cma *cma)
+{
+	return 0;
+}
+#endif // CONFIG_DMABUF_HEAPS_CMA
+
+#endif // DMA_BUF_HEAP_CMA_H_

-- 
2.50.1


