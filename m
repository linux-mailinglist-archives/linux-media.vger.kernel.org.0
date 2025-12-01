Return-Path: <linux-media+bounces-47936-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 84775C96BC8
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 11:51:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 630304E14F6
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 10:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7AA305E00;
	Mon,  1 Dec 2025 10:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SLZrDzdN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56133054C1;
	Mon,  1 Dec 2025 10:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764586239; cv=none; b=IASlfpurUuvyHPs09NjpRbENFRZtqPMObvwmWcGBwIFCpnKFNgAisMgK4e3F0Qlx0nvPilE44lhxeMMFpHr66JHdVpArD+vYW+VG1I1eVWlNw+05/Tc8CfQ2r04N7VwxUDH+tn4chwQM+eRzHlQmaQHOqsBld3XxkuF9u7jwymw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764586239; c=relaxed/simple;
	bh=ZNNy2n+FQntaNFoCYnOtU5AymWpe+pwz2nd2uKriozw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=adLQ6BIjK+9/uml6oQ0KetzaoVyGIoxhrgnGUFHds4SJ0iNcil2WNIGdPou0RE7PU99GGsl+zHmDJosLaOODrHmaotTFuvLLC3zOnwVPOVVG44mf0JhoWHc+0tBlC90aA8hjoZ35MwMcsDuQ5gt+AdBlcLtrhGZE7IzItb07KhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SLZrDzdN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 000A8C4CEF1;
	Mon,  1 Dec 2025 10:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764586239;
	bh=ZNNy2n+FQntaNFoCYnOtU5AymWpe+pwz2nd2uKriozw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SLZrDzdN7EeHfrOUfYTT7xr8GaWUdt18zDB6hnTvBTpXIg+Cb+UCbUh2t3muEaRR8
	 Sz9S0NDO1Mr8qNPgsHuueqCL+NMWrv9pahD3Z/jMCz8xC5GmnjYbdwghAn5SOnOd5F
	 abwTDwzdo+5q3IhZGQP+XDG08T0zMMt88J1I4kGO3wtnIPxLTmtmThcX7Eu5dK7/P5
	 fJb0hiibVHGGoNR3YDbsUgp83hIp7pobxKhK0PoNnouqBVz/ib32vpf/NrzSpeDvFi
	 Oi3W9FRjtQBxM9ZXxMlVsbqCvFvoZPMcEQ9SPWhPRgX3Iz+OHx62+3dh0MJiv+hXoD
	 awsbGd8msbsjA==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Huang Rui <ray.huang@amd.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v2 2/8] dma-buf/dma-fence: Add dma_fence_check_and_signal()
Date: Mon,  1 Dec 2025 11:50:06 +0100
Message-ID: <20251201105011.19386-4-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251201105011.19386-2-phasta@kernel.org>
References: <20251201105011.19386-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The overwhelming majority of users of dma_fence signaling functions
don't care about whether the fence had already been signaled by someone
else. Therefore, the return code shall be removed from those functions.

For the few users who rely on the check, a new, specialized function
shall be provided.

Add dma_fence_check_and_signal(), which signals a fence if it had not
yet been signaled, and informs the user about that.

Add a counter part, dma_fence_check_and_signal_locked(), which doesn't
take the spinlock.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/dma-buf/dma-fence.c | 44 +++++++++++++++++++++++++++++++++++++
 include/linux/dma-fence.h   |  2 ++
 2 files changed, 46 insertions(+)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 96d72ffc0750..146de62887cf 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -445,6 +445,50 @@ int dma_fence_signal_locked(struct dma_fence *fence)
 }
 EXPORT_SYMBOL(dma_fence_signal_locked);
 
+/**
+ * dma_fence_check_and_signal_locked - signal the fence if it's not yet signaled
+ * @fence: the fence to check and signal
+ *
+ * Checks whether a fence was signaled and signals it if it was not yet signaled.
+ *
+ * Unlike dma_fence_check_and_signal(), this function must be called with
+ * &struct dma_fence.lock being held.
+ *
+ * Return: true if fence has been signaled already, false otherwise.
+ */
+bool dma_fence_check_and_signal_locked(struct dma_fence *fence)
+{
+	bool ret;
+
+	ret = dma_fence_test_signaled_flag(fence);
+	dma_fence_signal_locked(fence);
+
+	return ret;
+}
+EXPORT_SYMBOL(dma_fence_check_and_signal_locked);
+
+/**
+ * dma_fence_check_and_signal - signal the fence if it's not yet signaled
+ * @fence: the fence to check and signal
+ *
+ * Checks whether a fence was signaled and signals it if it was not yet signaled.
+ * All this is done in a race-free manner.
+ *
+ * Return: true if fence has been signaled already, false otherwise.
+ */
+bool dma_fence_check_and_signal(struct dma_fence *fence)
+{
+	unsigned long flags;
+	bool ret;
+
+	spin_lock_irqsave(fence->lock, flags);
+	ret = dma_fence_check_and_signal_locked(fence);
+	spin_unlock_irqrestore(fence->lock, flags);
+
+	return ret;
+}
+EXPORT_SYMBOL(dma_fence_check_and_signal);
+
 /**
  * dma_fence_signal - signal completion of a fence
  * @fence: the fence to signal
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 19972f5d176f..0504afe52c2a 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -365,6 +365,8 @@ static inline void __dma_fence_might_wait(void) {}
 #endif
 
 int dma_fence_signal(struct dma_fence *fence);
+bool dma_fence_check_and_signal(struct dma_fence *fence);
+bool dma_fence_check_and_signal_locked(struct dma_fence *fence);
 int dma_fence_signal_locked(struct dma_fence *fence);
 int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp);
 int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
-- 
2.49.0


