Return-Path: <linux-media+bounces-27946-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6F1A5938C
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 13:08:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D001E3AA748
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 12:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCED3229B23;
	Mon, 10 Mar 2025 12:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D51WTw1v"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181EE22A4E6;
	Mon, 10 Mar 2025 12:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741608393; cv=none; b=TmvxtdE8MeXJJvAHig8C2mPBoarmxLkHRFIxk8uOMdGgQJeXXcoOYtpLe2sIBp6npmtKOU3v+NfkYcKls9V/4k+OfDPkoQl5FydCWrjUu8W06VlZvUhcOr08uF2xqk53ds2zdG8O9MvjeWPCMLLuxprZ+PAp3NjiKQH6V99b1Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741608393; c=relaxed/simple;
	bh=Qro4bxDwIqe16ab1F2sB7BE0N7tDo7mzmoJ4I8TRdJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rpwageSKe3zmuSmFSYel95NnuuPZmGjicjHhhLKFJDPEYIFFcJ18x0kcfxCAH7ce6nKVDLRSj1RIKWRMYPHFDKAzDZSqwg9jD5D+AzleEPaGyGW1WzfWjqlLub0wMRtP8wECRsVqENRGwVt5y3xXKggFoGfXCDvrgu/aCYYeB/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D51WTw1v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D876C4CEF2;
	Mon, 10 Mar 2025 12:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741608392;
	bh=Qro4bxDwIqe16ab1F2sB7BE0N7tDo7mzmoJ4I8TRdJo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=D51WTw1vtvstBl3vA6JvF9mJlq8j1sR8WR9qqmKOGz+7DJOVHwT2Kyu8P57f2urTP
	 CcYglBYtnuHm740POtZsbS+c/avUeR+UJF6Dm89rG4q/w96U7nc3KllbLk3dYYAbcm
	 7aVwrst/8lH5sL1VUq7gavKQxdqv4Mk/P5S/KKkTbQ2XeEY6Cf7iqmRIp8G7/jsn1G
	 e2aM8hRmquBs3cACUrGaYZkeX0oqiLvQqGDvMp5TTuJpMfP1ECtFpniPlTgDzMm9da
	 30WiRVu14OryQa/TWUpQxatBX+kELTV279o/nPrT/8j5qdqoMbFDSDO8ckXUVJZGDO
	 LopwJfsypVydw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 10 Mar 2025 13:06:11 +0100
Subject: [PATCH RFC 05/12] dma: contiguous: Provide accessor to dmem region
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-dmem-cgroups-v1-5-2984c1bc9312@kernel.org>
References: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
In-Reply-To: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Tomasz Figa <tfiga@chromium.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1928; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Qro4bxDwIqe16ab1F2sB7BE0N7tDo7mzmoJ4I8TRdJo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOnnrm6qvuS1X/e7kHRZT3uA1u0ltrJ7v62s3zidrfnc4
 uvXokTKO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCR1EhGht8NTNPURafMNOm7
 kfjSL08gJ6V+/YO0W5df7s09yXj3x1SG/xXZzw7vC5rw1We/aXFph+FWnjcK3376mE4Ly39l8N1
 SlhkA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Consumers of the DMA contiguous API will have to know which region their
device allocates from in order for them to charge the memory allocation
in the right one.

Let's provide an accessor for that region.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/linux/dma-map-ops.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index a2c10ed186efb6e08f64df0954b4d389589b6e35..bfc928d3bac37f3eece93d152abd57da513a1cc8 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -4,10 +4,11 @@
  * It should not be included in drivers just using the DMA API.
  */
 #ifndef _LINUX_DMA_MAP_OPS_H
 #define _LINUX_DMA_MAP_OPS_H
 
+#include <linux/cma.h>
 #include <linux/dma-mapping.h>
 #include <linux/pgtable.h>
 #include <linux/slab.h>
 
 struct cma;
@@ -153,10 +154,30 @@ static inline void dma_free_contiguous(struct device *dev, struct page *page,
 {
 	__free_pages(page, get_order(size));
 }
 #endif /* CONFIG_DMA_CMA*/
 
+#if IS_ENABLED(CONFIG_DMA_CMA) && IS_ENABLED(CONFIG_CGROUP_DMEM)
+
+static inline struct dmem_cgroup_region *
+dma_contiguous_get_dmem_cgroup_region(struct device *dev)
+{
+	struct cma *cma = dev_get_cma_area(dev);
+
+	return cma_get_dmem_cgroup_region(cma);
+}
+
+#else /* IS_ENABLED(CONFIG_DMA_CMA) && IS_ENABLED(CONFIG_CGROUP_DMEM) */
+
+static inline struct dmem_cgroup_region *
+dma_contiguous_get_dmem_cgroup_region(struct device *dev)
+{
+	return NULL;
+}
+
+#endif /* IS_ENABLED(CONFIG_DMA_CMA) && IS_ENABLED(CONFIG_CGROUP_DMEM) */
+
 #ifdef CONFIG_DMA_DECLARE_COHERENT
 int dma_declare_coherent_memory(struct device *dev, phys_addr_t phys_addr,
 		dma_addr_t device_addr, size_t size);
 void dma_release_coherent_memory(struct device *dev);
 int dma_alloc_from_dev_coherent(struct device *dev, ssize_t size,

-- 
2.48.1


