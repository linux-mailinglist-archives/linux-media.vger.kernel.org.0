Return-Path: <linux-media+bounces-27944-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 806CBA59384
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 13:07:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59ACB188FB87
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 12:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28D3229B00;
	Mon, 10 Mar 2025 12:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h1Zf+ZM4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF23D2288CC;
	Mon, 10 Mar 2025 12:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741608387; cv=none; b=Sg222sRLcomO5sV8GBdG54yI8GEvDA/lEiUzgPapDjpMO0izmtFBXqFs9X6Z5n6AYF9h0Z1iq82cShg1vQ2mV7PqDsL01Fz03Q7LgmZ2EDvchFW2KKAABKlwbBdfPXqR0N1rbnKrudAiGY6hphDzp8MRuoGK6Lo4TlRs/J5l7m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741608387; c=relaxed/simple;
	bh=/UAL0ad49jcngOkD0mAWDzGa0d7QjTxM4lCTP33f5+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WLkL9H4GJZfP59ij2XVdsCwc6xtCYwQeazvPjDYgbOvpH0sh+obdhQBwTOBQYDkc6oZdI6tWzt7wGzQmq5qcF+uydRwULw7P5UhgJwe6h0y+1guAmE9VKX98/cvDtWJbpbgr28bxamvKAENlTbzlRvOibZZgj1hxMUgglulXcro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h1Zf+ZM4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94331C4CEEE;
	Mon, 10 Mar 2025 12:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741608387;
	bh=/UAL0ad49jcngOkD0mAWDzGa0d7QjTxM4lCTP33f5+4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=h1Zf+ZM4Dqtwu1U4J20iOEAVrrphW+yhBnDr5d+g3qRKv+nXi4+U4z+zGiscHqgIJ
	 jDUbDDfaU0xN3s3IiJ5iYy/hVOmEzoC1iGGqEHNpCp8k0y3nWsV/3ZM9vHvXRwVPo1
	 2fPoTnlS3G3ZT7vefqxhxsjm0yC480gMCoBAP0CQzdHflDKowuMalbQpcBBFbJZR64
	 fHQHlaX7dk9rale95FWC1Laqog0FtGsZ3ujKmR1n5j79GfIaWO7FkejT1/Y5sUk/61
	 WwaKkKvQBPqb1WZjg6GrWJF4c5AgBt/pcVmc1nSiiEMRyE4HaNlngnYtHlQ3A2gPmA
	 h8d4CfRauzyXQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 10 Mar 2025 13:06:09 +0100
Subject: [PATCH RFC 03/12] dma: coherent: Register dmem region for each
 coherent region
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-dmem-cgroups-v1-3-2984c1bc9312@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1940; i=mripard@kernel.org;
 h=from:subject:message-id; bh=/UAL0ad49jcngOkD0mAWDzGa0d7QjTxM4lCTP33f5+4=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOnnrm7clPp7wa7PzbMebqtakmhdV8Nk65B7SrPty7XjK
 546TVoQ31HKwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJ6D9lZLjvfGnBE4fJ51rT
 XGQSXjNW8Zds/rg3XKTr0/Zcla3x38sZ/nsuda/5n79f3Cd/QfOtqvsy1hW2Zwvk/Y8uXZIpX33
 FnAkA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

There can be several coherent memory region in the system, and all of
them might end up being used to allocate a DMA buffer.

Let's register a dmem region for each of them to make sure we can track
those allocations.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 kernel/dma/coherent.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/kernel/dma/coherent.c b/kernel/dma/coherent.c
index 3b2bdca9f1d4b0274bf4874892b94730cd05c5df..2a2d515e43acbdef19c14d8840ed90e48e7ebb43 100644
--- a/kernel/dma/coherent.c
+++ b/kernel/dma/coherent.c
@@ -5,10 +5,11 @@
  */
 #include <linux/io.h>
 #include <linux/slab.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/cgroup_dmem.h>
 #include <linux/dma-direct.h>
 #include <linux/dma-map-ops.h>
 
 struct dma_coherent_mem {
 	void		*virt_base;
@@ -16,10 +17,12 @@ struct dma_coherent_mem {
 	unsigned long	pfn_base;
 	int		size;
 	unsigned long	*bitmap;
 	spinlock_t	spinlock;
 	bool		use_dev_dma_pfn_offset;
+
+	struct dmem_cgroup_region *dmem_cgroup_region;
 };
 
 static inline struct dma_coherent_mem *dev_get_coherent_memory(struct device *dev)
 {
 	if (dev && dev->dma_mem)
@@ -335,16 +338,25 @@ static phys_addr_t dma_reserved_default_memory_size __initdata;
 #endif
 
 static int rmem_dma_device_init(struct reserved_mem *rmem, struct device *dev)
 {
 	if (!rmem->priv) {
+		struct dmem_cgroup_region *region;
 		struct dma_coherent_mem *mem;
 
 		mem = dma_init_coherent_memory(rmem->base, rmem->base,
 					       rmem->size, true);
 		if (IS_ERR(mem))
 			return PTR_ERR(mem);
+
+		region = dmem_cgroup_register_region(rmem->size,
+						     "dma/coherent/%s",
+						     rmem->name);
+		if (IS_ERR(region))
+			return PTR_ERR(region);
+
+		mem->dmem_cgroup_region = region;
 		rmem->priv = mem;
 	}
 	dma_assign_coherent_memory(dev, rmem->priv);
 	return 0;
 }

-- 
2.48.1


