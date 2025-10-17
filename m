Return-Path: <linux-media+bounces-44869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3FBBE7CD0
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 11:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13F8219A23DB
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 09:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663B92877D4;
	Fri, 17 Oct 2025 09:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bRyZzAED"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57762D7803;
	Fri, 17 Oct 2025 09:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760693576; cv=none; b=YgaPRA4J/Dl//hIWrspYFX4Srv/20bsO3hejHsDRA1nEpVWqpzIozhiUyU9D86Bd/ps5lLcVxMMQ8IfTe3P1NTNeRT6z0ghKrMByhlxkQI0EsiCjTHxQ4D9dq0CwRveNo21f09hk+qS69lYxeyv9Rv00H9bsbVMge58maMlEMTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760693576; c=relaxed/simple;
	bh=D5qz7gPz3Z7WJiNcS8DF4jAwdycwGxqYhESHvomlVHM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UEXyFBvRIRs+KZpuwFWU4XIYuV6Unmvo1CPCSii8YYTssyRLDVHeXQKGae++KP6dxLDFNnnl/zTjPzkPTUNGnR/HYK/RzoOmXVK7WRyInLgynv5YZsZs+eDni/BSXJlOYSxe+GCLibtjowHdxAPLtyD/QYqBtYOAVmg0wC+ZwK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bRyZzAED; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3027DC4CEE7;
	Fri, 17 Oct 2025 09:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760693576;
	bh=D5qz7gPz3Z7WJiNcS8DF4jAwdycwGxqYhESHvomlVHM=;
	h=From:To:Cc:Subject:Date:From;
	b=bRyZzAEDZvTQsSrM8jDioj0xQcUmN9HI3xZvcEd1GRs5N6BrKpdynAN5qsXPbfSjV
	 hYEEyb8NS6M1thLgYl8maLp0uyIAXCOHDiUNsFzxTUQ/W0aZXC+20qzxFf5sqvQaNO
	 1qsEb/8ZvNAzTbObedbKMNzwnHDERFjqPb3sZrJKylgWSb8rr7rH+qUaboHkCosI80
	 MKga2jMIy7mwgTyrzlCrg+CNLD4uTuYosjYhmSA7px5J9WuHYm0Zid630UWYb2EP9d
	 V5e+/MQMPrm+n6Vp2MbbAdfsU2N8sIo5F3auAd6E4JHAM0GsiB4GUDtdAGHtW94d2f
	 8aU5t7ZK6HTwg==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	tursulin@ursulin.net
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [RFC PATCH] dma-fence: Remove 64-bit flag
Date: Fri, 17 Oct 2025 11:31:47 +0200
Message-ID: <20251017093146.169996-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It seems that DMA_FENCE_FLAG_SEQNO64_BIT has no real effects anymore,
since seqno is a u64 everywhere.

Remove the unneeded flag.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
Seems to me that this flag doesn't really do anything anymore?

I *suspect* that it could be that some drivers pass a u32 to
dma_fence_init()? I guess they could be ported, couldn't they.

P.
---
 drivers/dma-buf/dma-fence.c |  3 +--
 include/linux/dma-fence.h   | 10 +---------
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 3f78c56b58dc..24794c027813 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -1078,8 +1078,7 @@ void
 dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
 		 spinlock_t *lock, u64 context, u64 seqno)
 {
-	__dma_fence_init(fence, ops, lock, context, seqno,
-			 BIT(DMA_FENCE_FLAG_SEQNO64_BIT));
+	__dma_fence_init(fence, ops, lock, context, seqno, 0);
 }
 EXPORT_SYMBOL(dma_fence_init64);
 
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 64639e104110..4eca2db28625 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -98,7 +98,6 @@ struct dma_fence {
 };
 
 enum dma_fence_flag_bits {
-	DMA_FENCE_FLAG_SEQNO64_BIT,
 	DMA_FENCE_FLAG_SIGNALED_BIT,
 	DMA_FENCE_FLAG_TIMESTAMP_BIT,
 	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
@@ -470,14 +469,7 @@ dma_fence_is_signaled(struct dma_fence *fence)
  */
 static inline bool __dma_fence_is_later(struct dma_fence *fence, u64 f1, u64 f2)
 {
-	/* This is for backward compatibility with drivers which can only handle
-	 * 32bit sequence numbers. Use a 64bit compare when the driver says to
-	 * do so.
-	 */
-	if (test_bit(DMA_FENCE_FLAG_SEQNO64_BIT, &fence->flags))
-		return f1 > f2;
-
-	return (int)(lower_32_bits(f1) - lower_32_bits(f2)) > 0;
+	return f1 > f2;
 }
 
 /**
-- 
2.49.0


