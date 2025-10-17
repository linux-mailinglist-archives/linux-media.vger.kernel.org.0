Return-Path: <linux-media+bounces-44875-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 38799BE8511
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 13:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 24EA94F7455
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 11:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E458F343D86;
	Fri, 17 Oct 2025 11:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JAKGPXcp"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DCF343D89;
	Fri, 17 Oct 2025 11:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760700383; cv=none; b=kysSkusLkzgxBrnk5LheDYCpvohbGtt5VnazHXhHIjGEwK73E+2YnO6WXDTRHa949Erk0R9FknquzsUXAWnn5cO/SzbnBifhSe8a/X9zo/b0DUwJJ4X0SImPtTWLzH4hI0dTXT7R6NVHgH/NMQD9VNxaf4584OijH3lVxQ+O1qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760700383; c=relaxed/simple;
	bh=pPzUuwGvogXsvvUv9K+pic8Th4sHIWdVh+uLPnCifM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JAN9BcaIzewW62cwCWUxaiQrq9+S3e/+AxTddOQ0HFoUGTKjq9wdqaiHVOMS9QNOyjbTcp6m4Vr6MXtRscSYnnXkL6Vd9QfOlp9VPT/UYSbSXX1OFYKVdQ06vlueAve4+MA7C6u16fYDHoggxmT/XE/5SBLABuewb01Q4S7JgPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JAKGPXcp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C915CC4CEE7;
	Fri, 17 Oct 2025 11:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760700382;
	bh=pPzUuwGvogXsvvUv9K+pic8Th4sHIWdVh+uLPnCifM8=;
	h=From:To:Cc:Subject:Date:From;
	b=JAKGPXcpTbpaITsnF/iMnIYPT2LZAdmUxVKIXGQd1fL00dJ5T8wqO3rem4CutDXMT
	 dzZK3xWiBflJxgLAqsUtE3nWKIHQ5q2KILVbaGwDURTZi/MCBTBTSkM5FWZPOXI2GV
	 9cPSkc7Yp7XZJYbhSSyZNvc/TRmoFs51k001AYgJS9b2yoT7FG32tstUxsm4MV9eWw
	 dsXzdEBZJ7T4YR688CmgstmYgO79Lo63SbHTmgUlnLwA6+kFr0Bkpkc1yecVR2fNuN
	 tIhw/QEvp50XhnBNLzMbTgs0Ir4ebXR1HHbws7LcVIq+9KHMA9YDM84JWUl1421WZ9
	 2T2mz56TkGY+A==
From: Philipp Stanner <phasta@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2] drm/sched: Add warning for removing hack in drm_sched_fini()
Date: Fri, 17 Oct 2025 13:25:44 +0200
Message-ID: <20251017112543.177674-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The assembled developers agreed at the X.Org Developers Conference 2025
that the hack added for amdgpu in drm_sched_fini() shall be removed. It
shouldn't be needed by amdgpu anymore.

As it's unclear whether all drivers really follow the life time rule of
entities having to be torn down before their scheduler, it is reasonable
to warn for a while before removing the hack.

Add a warning in drm_sched_fini() that fires if an entity is still
active.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
Changes in v2:
  - Fix broken brackets.
---
 drivers/gpu/drm/scheduler/sched_main.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 46119aacb809..87ea373f266e 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1419,7 +1419,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 		struct drm_sched_rq *rq = sched->sched_rq[i];
 
 		spin_lock(&rq->lock);
-		list_for_each_entry(s_entity, &rq->entities, list)
+		list_for_each_entry(s_entity, &rq->entities, list) {
 			/*
 			 * Prevents reinsertion and marks job_queue as idle,
 			 * it will be removed from the rq in drm_sched_entity_fini()
@@ -1441,7 +1441,10 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 			 * drivers that keep entities alive for longer than
 			 * the scheduler.
 			 */
+			if (!s_entity->stopped)
+				dev_warn(sched->dev, "Tearing down scheduler with active entities!\n");
 			s_entity->stopped = true;
+		}
 		spin_unlock(&rq->lock);
 		kfree(sched->sched_rq[i]);
 	}
-- 
2.49.0


