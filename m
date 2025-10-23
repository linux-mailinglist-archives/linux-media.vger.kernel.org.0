Return-Path: <linux-media+bounces-45400-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 41677C01CD4
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 16:34:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C803F5482A2
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 14:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D46A9336EC8;
	Thu, 23 Oct 2025 14:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jxQNZnH1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3FD267714;
	Thu, 23 Oct 2025 14:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761229851; cv=none; b=jYBHtiO/Zgsg3dUR5iID1kpCRo8jBIy26toCAc12BqE59c6rCtTV93PkJN2x5TR+wakBrmlZA1Uln3JWuO61UbIqaJDLKMRHYSOK+HuDyshgAFcSy6Xm5KF7C7tXkNEJOCq5p4E/1k763OwJh8oThRCJIyCiwTHpfV53yRDWVYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761229851; c=relaxed/simple;
	bh=LbOep4u6dGmMx3E06SFB+2sU4wVXqcLPOLAVpCN4zb8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zs4CDaP72j3RjAgsX57+lpSvMQ0pMRT3bf+MQ4WGd0nrxYtM7axeZOQhPH06WhK3Dcw0AGtNAWATY94MRrhdS7ZuJdjXu+Nj8mNu0kPRxMKkHGrFVZTIj7JNUfooAiQ05KzNY6Twb9/NsV/P+pLPHccEY8gczrZG9jXCplb7VCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jxQNZnH1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66FF1C116D0;
	Thu, 23 Oct 2025 14:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761229850;
	bh=LbOep4u6dGmMx3E06SFB+2sU4wVXqcLPOLAVpCN4zb8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jxQNZnH1Iuq3NQom6PZ+X6LwQYE4XRNMIYyz/q4+d+zNT29CuV0rtNMiE7kJGLTSp
	 58GHiiXK8Dyw74JqZpPaGVsAzD8SReMcho77UlDJ3AmggupP63+XBuUCFGja1pIouk
	 qFbzWbAcnbzagGrd1XNtCbdR2pAAyP+YEe7HHIOAR+FfLCArmDC9aaEOYrqz2XBqZY
	 1r/8FUTqCjUYqhkjIIBRC2pvALZRoQAfcj4QyDo9XUHHgAvRnmQxQY4R0LeAM46uqK
	 weFuvTqGxYrV8QXS9jylqEQ8veBwmtWYX0TUm6SzdN8TGjXvGp1LjblqHmzrWyBO2I
	 ci9Qk5MX8T5WQ==
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
Subject: [PATCH v2 4/4] drm/sched: Add TODO entry for missing runqueue locks
Date: Thu, 23 Oct 2025 16:30:31 +0200
Message-ID: <20251023143031.149496-6-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251023143031.149496-2-phasta@kernel.org>
References: <20251023143031.149496-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct drm_sched_rq is not being locked at many places throughout the
scheduler, at least for readers. This was documented in a FIXME added
in:

commit 981b04d96856 ("drm/sched: improve docs around drm_sched_entity")

Add a TODO entry for that problem.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/TODO | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/TODO b/drivers/gpu/drm/scheduler/TODO
index 713dd62c58da..263ce2deb69a 100644
--- a/drivers/gpu/drm/scheduler/TODO
+++ b/drivers/gpu/drm/scheduler/TODO
@@ -36,3 +36,16 @@
 	3. Port a driver as first user.
 	3. Document the new alternative in the docu of deprecated
 	   drm_sched_resubmit_jobs().
+
+* Unlocked readers for runqueues
+  - Difficulty: medium
+  - Contact: Philipp Stanner <phasta@kernel.org>
+  - Description:
+    There is an old FIXME by Sima in include/drm/gpu_scheduler.h. It details
+    that struct drm_sched_rq is read at many places without any locks, not even
+    with a READ_ONCE. At XDC 2025 no one could really tell why that is the case,
+    whether locks are needed and whether they could be added. (But for real,
+    that should probably be locked!).
+  - Tasks:
+	1. Check whether locks for runqueue readers can be added.
+	2. If yes, add the locks.
-- 
2.49.0


