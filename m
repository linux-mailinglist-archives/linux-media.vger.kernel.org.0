Return-Path: <linux-media+bounces-45399-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE4EC01D14
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 16:38:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A8EB3B63D3
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 14:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9662E32D44D;
	Thu, 23 Oct 2025 14:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hcQIrwxt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F121C32D449;
	Thu, 23 Oct 2025 14:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761229848; cv=none; b=sl5ROCShG9t9LdMEsO0XW/X78g4h1Fsb/09RDaUUePDctCadT0xnmFJ4L7lZGGhTJRDI0gPy1rvd844KuBDRe3T9Q7ixFbGKcmu+Bw7xj/WdrfWoMgL1WS8XJxj8RahLELc+IQuD7+po6JiAYCE5XKJlkFvOWUlOa7KemDE3jCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761229848; c=relaxed/simple;
	bh=lRRm98sjHaVsvhoTag39RzQU6GJrENsxxPSr2a2wy8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bPvzbWrQP0Gxgekm2Y3vDTWrUEDapAL8feHjCfvJK0Szdxrz7eQP8zoUQU+QLG3QYsq1SW41S5nNnCMe3asKXPrOdp76RmRUUC5FcgdBERu80cyZwkNxZtDWLGMoJPfRREEtiQ396zujB2EHwa9xHsgZ9B1t7ItFrzBqNtKbKEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hcQIrwxt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C273C4CEF7;
	Thu, 23 Oct 2025 14:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761229847;
	bh=lRRm98sjHaVsvhoTag39RzQU6GJrENsxxPSr2a2wy8g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hcQIrwxtBlYYrXZf3XUxjvVdQdMgos2eH0AI+i52u4J5Lc9drlw1/M/N5EFNIckEu
	 CVfKOeQgIfvCNx3KK+L4fdwqZlMQNTCWM3c3pPoUk9vPgvroVwz91kH7kLRdvJbAS3
	 ptr2DoR3CqFoWgTTgroKBzqt2rTsd2QOyDWxrccVjPe9iRHSxxwfPJtbfWEqwy/Ouy
	 RLGbf3buKk4oKus8R0brAGh9sec+F6ShfsbDjKjXwYBSIIkiRRfJsA4Wpcyo7tMV16
	 BoFzWAm3duA3IWR8/mmhs6toB++A937UsZYTtSwwsdAU1XB3YPm0tNe60+8TDbq3Kz
	 F5Vd/WB9OvGuQ==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 3/4] drm/sched: Add TODO entry for resubmitting jobs
Date: Thu, 23 Oct 2025 16:30:30 +0200
Message-ID: <20251023143031.149496-5-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251023143031.149496-2-phasta@kernel.org>
References: <20251023143031.149496-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the issue of a successor of drm_sched_resubmit_jobs() missing to the
TODO file.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/TODO | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/TODO b/drivers/gpu/drm/scheduler/TODO
index 79044adb7d01..713dd62c58da 100644
--- a/drivers/gpu/drm/scheduler/TODO
+++ b/drivers/gpu/drm/scheduler/TODO
@@ -10,3 +10,29 @@
   - Tasks:
 	1. Read the example entry.
 	2. Remove the entry once solved (never in this case)
+
+* GPU job resubmits
+  - Difficulty: hard
+  - Contact:
+    - Christian König <ckoenig.leichtzumerken@gmail.com>
+    - Philipp Stanner <phasta@kernel.org>
+  - Description:
+    drm_sched_resubmit_jobs() is deprecated. Main reason being that it leads to
+    reinitializing dma_fences. See that function's docu for details. The better
+    approach for valid resubmissions by amdgpu and Xe is (apparently) to figure
+    out which job (and, through association: which entity) caused the hang. Then,
+    the job's buffer data, together with all other jobs' buffer data currently
+    in the same hardware ring, must be invalidated. This can for example be done
+    by overwriting it.
+    amdgpu currently determines which jobs are in the ring and need to be
+    overwritten by keeping copies of the job. Xe obtains that information by
+    directly accessing drm_sched's pending_list.
+  - Tasks:
+	1. implement scheduler functionality through which
+	   the driver can obtain the information which *broken* jobs are currently in
+	   the hardware ring.
+	2. Such infrastructure would then typically be used in
+	   drm_sched_backend_ops.timedout_job(). Document that.
+	3. Port a driver as first user.
+	3. Document the new alternative in the docu of deprecated
+	   drm_sched_resubmit_jobs().
-- 
2.49.0


