Return-Path: <linux-media+bounces-33103-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9118BAC0A94
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 13:26:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4FAD3A6301
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 11:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF411289E3A;
	Thu, 22 May 2025 11:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJpyeDmP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A692B9A9;
	Thu, 22 May 2025 11:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747913173; cv=none; b=Lxi2MBhnAeTJ1WSxsnLsKtXElUEpec/iwNJAfm4ZieGpjXFU63fFZyviacoRbnZPXtipaRPixJDf2zRXeyXuBKKNSGHpgvkHc/9tOucgYj+b/Jp/xfPPHBrRkrxuEsbKL2SFdRii2s1GkakcY+ULtiVGkFJtQgfEeCn8fYYBlsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747913173; c=relaxed/simple;
	bh=MfWIYTNt7ahALZILDalNrz6ro08fWG+/lj6vw0D5yaI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MplT+xkfIjw/41Y/ySH031eJ29Ld2vgOdu1eww3QxmD3DIixMK/7F1I/c+cIlBPj+KsQRUQnYdDnBNRPIk2yVyuCy18lKTwzw8gZ3jmpyjcRtkvv4gB7KWSukpJeR3KW01GWNp7U0kKRXjovZHUdFBekobSCFjJsMl7IlFcOm48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJpyeDmP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5D4C4CEE4;
	Thu, 22 May 2025 11:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747913172;
	bh=MfWIYTNt7ahALZILDalNrz6ro08fWG+/lj6vw0D5yaI=;
	h=From:To:Cc:Subject:Date:From;
	b=CJpyeDmPvKKzPKDXS4g0XArg2Y6PVpv0I7brJmSq8iRMJkssx6ATM1KX6HmLa7v8I
	 v4nFyhVAufFZoAUG9n3tPUDsWKBrI1EsWB7nl51Ju9547O7UYf098J8Mg6Wt1tpQ9B
	 TkanzTW5TKd841CboO2yPcDSevdtqoU/9/uVapNbMbwjwDdc6tXx8yLorpBqriSmIm
	 P1Rw/erPZp/jM9WElNApdelt9Y76PSL2vGlW/29Nbzgy9z+0QdiVa0x8moznaOZLX6
	 GkK/K8qRVhZeB7pg3JbXtUsq7FYF9aUpWskjLvkntCvdBEHoQLW2P48xsFHYctJDsL
	 u4GxC8QDHektQ==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 1/2] dma-buf: Add __dma_fence_is_signaled()
Date: Thu, 22 May 2025 13:25:40 +0200
Message-ID: <20250522112540.161411-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some parties want to check whether a function is already signaled
without actually signaling the fence, which is what
dma_fence_is_signaled() might due if the fence ops 'signaled' callback
is implemented.

Add __dma_fence_is_signaled(), which _only_ checks whether a fence is
signaled. Use it internally.

Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 include/linux/dma-fence.h | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 48b5202c531d..ac951a54a007 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -381,6 +381,26 @@ bool dma_fence_remove_callback(struct dma_fence *fence,
 			       struct dma_fence_cb *cb);
 void dma_fence_enable_sw_signaling(struct dma_fence *fence);
 
+/**
+ * __dma_fence_is_signaled - Only check whether a fence is signaled yet.
+ * @fence: the fence to check
+ *
+ * This function just checks whether @fence is signaled, without interacting
+ * with the fence in any way. The user must, therefore, ensure through other
+ * means that fences get signaled eventually.
+ *
+ * This function does not require locking.
+ *
+ * See also dma_fence_is_signaled().
+ *
+ * Return: true if signaled, false otherwise.
+ */
+static inline bool
+__dma_fence_is_signaled(struct dma_fence *fence)
+{
+	return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
+}
+
 /**
  * dma_fence_is_signaled_locked - Return an indication if the fence
  *                                is signaled yet.
@@ -398,7 +418,7 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence);
 static inline bool
 dma_fence_is_signaled_locked(struct dma_fence *fence)
 {
-	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
+	if (__dma_fence_is_signaled(fence))
 		return true;
 
 	if (fence->ops->signaled && fence->ops->signaled(fence)) {
@@ -428,7 +448,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
 static inline bool
 dma_fence_is_signaled(struct dma_fence *fence)
 {
-	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
+	if (__dma_fence_is_signaled(fence))
 		return true;
 
 	if (fence->ops->signaled && fence->ops->signaled(fence)) {
-- 
2.49.0


