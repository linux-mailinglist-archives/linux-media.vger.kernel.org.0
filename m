Return-Path: <linux-media+bounces-44907-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F34BE8FD6
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 15:48:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1C4514E8D92
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 13:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF7E3570C8;
	Fri, 17 Oct 2025 13:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MgP3WEzH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180F6350D73;
	Fri, 17 Oct 2025 13:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760708875; cv=none; b=eX8DlQqkGcD9e0rW03g1L5i4nrSnBl4KE3k3vJ0sCqrl419YOVNxwo8qVhNL57GL1FytzfzWKejzjnxMvqnow5PVq93XMZHdJ1PmdLhgCHTNZD1n4XrpjUUaYk/yKYvBGr/192Ifja63CI88KoUIQZw2IDOyWA+Xpt+EgyG6OZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760708875; c=relaxed/simple;
	bh=vrRFEKTK4AWiLuQSasLbMw065+46eQtPuGvNJqTLrH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KaJhJ5ejGzgtUoCQfde3wHA+vGDHFRcGPQF1o7AN7PZwXDczyrXfvjH/ZAuk4f7vItJ6D8lIvAv433A8S/wSQCXFSjNCeiQvJp3GNYQIEFWM2jdm8NWXKqMuzZrMRasFsDfQUWCqvr6iy3c2faQs/ZysHialBv4/yE+XOWR4nso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MgP3WEzH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55AA1C4CEFE;
	Fri, 17 Oct 2025 13:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760708874;
	bh=vrRFEKTK4AWiLuQSasLbMw065+46eQtPuGvNJqTLrH4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MgP3WEzH4xzjfD6A6/bW0TBNZZNnElvkbi1wUWqZ12I36MqZyEv/PJVoBsBNuZH/7
	 WlLvZgFOdDrpj0Ck0ql7eSo1Mj9JDHTnFvT5q3rHiMJt1sij5uxRAOILDaQKd5PI92
	 x78WkVedghK5peiINGn5Hw+ps6c6cplNXiyaT+Xz9ZtJf93/dmkKnjkvxlSpO7EaIX
	 tV3YLDte3ZSdrNepHn+D7fr5M6gL4DKG83FpGZkiw6VCF7C5duPZD6zQNhV6qVjFJ4
	 ED6fHIBBZVbwWQtC3kr9kPQD+rdJwNkG2G+qFVHTYg7mBGaV2doQg7xwIc8j7dopeB
	 FkVzV32lxWT6w==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 2/3] drm/sched: Add TODO file with first entry
Date: Fri, 17 Oct 2025 15:47:02 +0200
Message-ID: <20251017134716.187723-3-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251017134716.187723-2-phasta@kernel.org>
References: <20251017134716.187723-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a drm_sched TODO file with open tasks, contact info, difficulty
level and a job description.

Add the missing successor of drm_sched_resubmit_jobs() as a first task.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/TODO | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 drivers/gpu/drm/scheduler/TODO

diff --git a/drivers/gpu/drm/scheduler/TODO b/drivers/gpu/drm/scheduler/TODO
new file mode 100644
index 000000000000..6a06e2858dd6
--- /dev/null
+++ b/drivers/gpu/drm/scheduler/TODO
@@ -0,0 +1,27 @@
+=== drm_sched TODO list ===
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


