Return-Path: <linux-media+bounces-37204-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 559F8AFE94B
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 14:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3E2F189D0B5
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 12:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B0482E0936;
	Wed,  9 Jul 2025 12:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t7lqxg3v"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F912E03FE;
	Wed,  9 Jul 2025 12:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752065110; cv=none; b=rLrSiSERM0q6cYro6b1PT2M/5u2a5M5bxiqMm6395iK8AJGstnUQEIn6g7sgCj55DFHMEjp3XCz2Cnm/5AHl8XHCdt56Ih5JeFa0x4P4abjEjYdnY3mSVUvxOy82L6BjEe5A9nYJ51AwUqZBUoD33hUjETs5GecIRSXq3pNy/7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752065110; c=relaxed/simple;
	bh=eJM6k+wK6WHbWepDDkp+m8Pi3rWX7uz+aZzRQGLbdr0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F8quMMM7729+KVfpu8kDXXOhNna/dkj46HguXQThh9d4eUfe4nU9viZ+kEqTD9gakn4z9FQZpnyQpxTlthgiBN6WHoq0YGPFZs4EyNc7fjb8sVXmMgpFh3afyxnuqKfvcejd0k7iczkErm6UxICSfTltrkSUeRKS0amvZ5xTK3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t7lqxg3v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F0BBC4CEF4;
	Wed,  9 Jul 2025 12:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752065110;
	bh=eJM6k+wK6WHbWepDDkp+m8Pi3rWX7uz+aZzRQGLbdr0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=t7lqxg3v75ueilutziXZ8q3HmM8ibFJjZ8kMTAKtLoqvfMQ5upnVSdynjlTROiT99
	 pkCUyFLOQa7ZC8bS1P5TcgrnFST6yIy32hz2W3A+EGw2FBwuzpB/PgIiFtDo2J9uin
	 WXuIgVV7fY63PsK1+aDioMdyWHGAuVYiC4El7gUQu3Jn246rzTB2fgLUlFKeWdzJxT
	 Hx3bB6UM34Z4hjPw+xyLmFVNbjwjD9KYpR4c35MTXcfNnDTwglbm+Hl4I107JH2JOI
	 hDTTYCxEkr+ya7CozRR+unhFeDRva2CV/OMYkZaIMc4upU10450ZGB7YM2XESV+sQS
	 QRZE0elBx+XYA==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 09 Jul 2025 14:44:52 +0200
Subject: [PATCH v6 2/2] dma-buf: heaps: cma: Create CMA heap for each CMA
 reserved region
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-dma-buf-ecc-heap-v6-2-dac9bf80f35d@kernel.org>
References: <20250709-dma-buf-ecc-heap-v6-0-dac9bf80f35d@kernel.org>
In-Reply-To: <20250709-dma-buf-ecc-heap-v6-0-dac9bf80f35d@kernel.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>
Cc: Andrew Davis <afd@ti.com>, Jared Kangas <jkangas@redhat.com>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 iommu@lists.linux.dev, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2674; i=mripard@kernel.org;
 h=from:subject:message-id; bh=eJM6k+wK6WHbWepDDkp+m8Pi3rWX7uz+aZzRQGLbdr0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBl5Kb4af/N4FRS+60947CdqJvGl78DS8IxFGZOsD3eUb
 /FdVyXWMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACZSVMtYZ/LxzQ27uTXcRt4t
 e3bofj0kpsaf/DNL6QV/Ayevu8BT3o3Ppyef/Wm1pX3ysetRD16ZM9aHCHxpLWaPC3j0Jz73oo/
 oraatxzr1ch6r7VqU+q/+qMHmNS5di78+CX1ZtWtZ/YVpqnkA
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

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/dma-buf/heaps/cma_heap.c | 52 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 0df007111975447d555714d61ead9699287fd65a..31a18683ee25788a800f3f878fd958718a930ff7 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -19,10 +19,12 @@
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
@@ -421,7 +423,55 @@ static int __init add_default_cma_heap(void)
 				ERR_PTR(ret));
 	}
 
 	return 0;
 }
-module_init(add_default_cma_heap);
+
+static int __init add_cma_heaps(void)
+{
+	struct device_node *rmem_node;
+	struct device_node *node;
+	int ret;
+
+	ret = add_default_cma_heap();
+	if (ret)
+		return ret;
+
+	rmem_node = of_find_node_by_path("/reserved-memory");
+	if (!rmem_node)
+		goto out;
+
+	for_each_child_of_node(rmem_node, node) {
+		struct reserved_mem *rmem;
+		struct cma *cma;
+
+		rmem = of_reserved_mem_lookup(node);
+		if (!rmem) {
+			ret = -EINVAL;
+			goto err_put_node;
+		}
+
+		if (!of_reserved_mem_is_contiguous(rmem))
+			continue;
+
+		cma = rmem->priv;
+		if (!cma) {
+			ret = -EINVAL;
+			goto err_put_node;
+		}
+
+		ret = __add_cma_heap(cma, of_node_full_name(node));
+		if (ret)
+			goto err_put_node;
+	}
+
+out:
+	of_node_put(rmem_node);
+	return 0;
+
+err_put_node:
+	of_node_put(rmem_node);
+	return ret;
+}
+
+module_init(add_cma_heaps);
 MODULE_DESCRIPTION("DMA-BUF CMA Heap");

-- 
2.50.0


