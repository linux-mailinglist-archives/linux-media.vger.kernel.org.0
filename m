Return-Path: <linux-media+bounces-29614-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D71CA806C6
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 14:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CB9D4C481D
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 12:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBE5526B2D4;
	Tue,  8 Apr 2025 12:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H2uuPMwq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219E6268685;
	Tue,  8 Apr 2025 12:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744114961; cv=none; b=Ee1RzJODU5b16BWbhgxfTDDjf+6//XMSRJgiM7a+OcNd42JRIBMDbGd9fuYC6gOYcPvZRyDdt8OQIRX74W8hi0b5loigzih2U7akF/mKBneb6VhoFXbIkHPveU0hCrgeIMSyhBt4JU8Hyk1AaACeYFEuXGQFTbFsy8yCKV7Qtd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744114961; c=relaxed/simple;
	bh=ARlaPxjwhPhDoB9L/imRcfXdn1v5REAzpHVuhMnz+Bs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nhs5hRs1DLHrl06BnDcC46HkIP7XRU7CEQrkxmyS6FiwZ3+BQgxwP6HwXLDEOwlEKmoXQCZ9gAd7JAgaI1wMly7D8KvMh4iH6g3KBHFXd93DQfoLWEI9nmLtlAN8mKCjouv6kMx/JZ7Ual0yFrW+JQNO27hhDaHh3WNxxCjy8jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H2uuPMwq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F5CC4CEEA;
	Tue,  8 Apr 2025 12:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744114960;
	bh=ARlaPxjwhPhDoB9L/imRcfXdn1v5REAzpHVuhMnz+Bs=;
	h=From:To:Cc:Subject:Date:From;
	b=H2uuPMwq2KAc8X12Yow30IXlWQi9nW0kPLtUWTjtb23hznGTn7+hmvZoqf9L4H5dc
	 Kvjd91MTdPzdzNK8sCdN085er4UL2HyIiItLZ1iLPMJ2gqdpzMjDfLSh9OJlrKvXBe
	 voZC3NS+WHSf0/ixpp1DviVfmbK0RRtaQVsBeD40/M0PO353pt+aiOLcDsm9LdaeYn
	 d5xfrforOzFeqtM+AyfAfPU66h2RorRN1Xbkkc9/FQe2I6JCrnSB7epue89bEk+OQD
	 WAZh3Z4rY8DZyxoRV6nA/jecrOBcCq7MS0GkfbRaO8VyaKvHYtgA8Akl9DoM30VyVy
	 /ZA6hrGKspzPw==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH] dma-fence: Document signaling in dma_fence_is_signaled() explicitly
Date: Tue,  8 Apr 2025 14:22:18 +0200
Message-ID: <20250408122217.61530-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current documentation of dma_fence_is_signaled() and
dma_fence_is_signaled_locked() does not explicitly mention that those
functions can signal the fence.

Furthermore, the documentation of the return value reads as if the
returned boolean only describes whether dma_fence_signal() (or similar)
had been called before this function call already. That's not the case,
since dma_fence_ops.signaled() usually just checks through the sequence
number whether the hardware is finished with a fence. That doesn't mean
a signaling function has been called already.

Make the documentation clearer.

Move the Return: documentation to the end, since that's the officially
recommended docu style.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 include/linux/dma-fence.h | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index e7ad819962e3..939df0ab3224 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -407,14 +407,21 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence);
  *                                is signaled yet.
  * @fence: the fence to check
  *
- * Returns true if the fence was already signaled, false if not. Since this
- * function doesn't enable signaling, it is not guaranteed to ever return
- * true if dma_fence_add_callback(), dma_fence_wait() or
+ * Checks whether the fence was already signaled, and, if not, whether
+ * &struct dma_fence_ops.signaled indicates that it should be signaled. If so,
+ * the fence gets signaled here.
+ *
+ * Since this function doesn't enable signaling, it is not guaranteed to ever
+ * return true if dma_fence_add_callback(), dma_fence_wait() or
  * dma_fence_enable_sw_signaling() haven't been called before.
  *
  * This function requires &dma_fence.lock to be held.
  *
  * See also dma_fence_is_signaled().
+ *
+ * Return: true if the fence was already signaled, or if
+ * &struct dma_fence_ops.signaled is implemented and indicates that this fence
+ * can be treated as signaled; false otherwise.
  */
 static inline bool
 dma_fence_is_signaled_locked(struct dma_fence *fence)
@@ -434,9 +441,12 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
  * dma_fence_is_signaled - Return an indication if the fence is signaled yet.
  * @fence: the fence to check
  *
- * Returns true if the fence was already signaled, false if not. Since this
- * function doesn't enable signaling, it is not guaranteed to ever return
- * true if dma_fence_add_callback(), dma_fence_wait() or
+ * Checks whether the fence was already signaled, and, if not, whether
+ * &struct dma_fence_ops.signaled indicates that it should be signaled. If so,
+ * the fence gets signaled here.
+ *
+ * Since this function doesn't enable signaling, it is not guaranteed to ever
+ * return true if dma_fence_add_callback(), dma_fence_wait() or
  * dma_fence_enable_sw_signaling() haven't been called before.
  *
  * It's recommended for seqno fences to call dma_fence_signal when the
@@ -445,6 +455,10 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
  * value of this function before calling hardware-specific wait instructions.
  *
  * See also dma_fence_is_signaled_locked().
+ *
+ * Return: true if the fence was already signaled, or if
+ * &struct dma_fence_ops.signaled is implemented and indicates that this fence
+ * can be treated as signaled; false otherwise.
  */
 static inline bool
 dma_fence_is_signaled(struct dma_fence *fence)
-- 
2.48.1


