Return-Path: <linux-media+bounces-44908-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D394BE900A
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 15:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FD3B6275F7
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 13:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BEC3369970;
	Fri, 17 Oct 2025 13:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="exPbmHCl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89CB3570AB;
	Fri, 17 Oct 2025 13:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760708877; cv=none; b=ljmOu4aPulWpqpy4YFwc4Q2+UJGdCny3lJsXwLqqx/jbIZ7NMoNXFRgin9I/iUXd/wiSVabWHw00mBDuAxSLE5vfB9bY8J5GMnut7a2TA/F6eaT6VwQWqi102pWYoRXaIqXJQ+FbUJPVKamxpFMVMXWZYGyNAqEanlJrImD3e9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760708877; c=relaxed/simple;
	bh=lmMQtoUVkjlboGNHSh7UdnBd5C5+17GyMOAaWbzaAo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eug8RTA6VLXYC+cSLP/Hf0UdsC22dUlnjcDwgvAgHxo5FOJwFmiQIM0Ynn/Tx9kClE1FGyeg2q7wMs7Hg/v8tiffOcndF+mvZNAVkmNYBMjIiYOu+yZXrrTyvWrlLA939oRU/J57pDrqunPBuX9V12UpTWefCI4ea0rMEnMJTIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=exPbmHCl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 108FBC4CEF9;
	Fri, 17 Oct 2025 13:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760708877;
	bh=lmMQtoUVkjlboGNHSh7UdnBd5C5+17GyMOAaWbzaAo0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=exPbmHClsb3TSS2uax9m1RD+XQgcAB2hQDFpyM7lRsISUm9kcDFpXtl3M7s7avy2H
	 p/a/UZ1Q0v7nW03rl85mmUVA/BpajMbVV3BZVxVa7ZlxMErGhPrMtsnRhsnKkuAdA7
	 Hg12ICNNzLyOLlfld1uYq/pdGBC8JbDjqxm06Zrf0vIZBMZH1mIhtANQlx2OaZc16w
	 3A8WSc2gGs7lu8ovCt/KhorlRO2XsPe1CaSILISNbzThlvJVdQqvKsCFCkcYXuUO97
	 ozinWF0rJ4JDHmZO/nWe6afU4W7BOhLNL/2I5PKwr7uy3V3ZPmcH0PowftgsljstjB
	 lmp9kVWCClG4w==
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
Subject: [PATCH 3/3] drm/sched: Add TODO entry for missing runqueue locks
Date: Fri, 17 Oct 2025 15:47:03 +0200
Message-ID: <20251017134716.187723-4-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251017134716.187723-2-phasta@kernel.org>
References: <20251017134716.187723-2-phasta@kernel.org>
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
index 6a06e2858dd6..f4b5bee8e3eb 100644
--- a/drivers/gpu/drm/scheduler/TODO
+++ b/drivers/gpu/drm/scheduler/TODO
@@ -25,3 +25,16 @@
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


