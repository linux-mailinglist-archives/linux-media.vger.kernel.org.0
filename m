Return-Path: <linux-media+bounces-45385-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C1366C0127E
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 14:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 932AD4E4E81
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 12:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 134F21E5B95;
	Thu, 23 Oct 2025 12:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g8lVkppu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8322D73B5;
	Thu, 23 Oct 2025 12:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761222889; cv=none; b=rYOTs/i4LAG2bb+gfF43RcWHTxfkSisCn8uQuyQOxA3Xz2sztmHumr5Sc4Utd9OKlfJlML6tdq7WyHUogu6QeVq39c+L9gaXF/FZQ24wzIpebJKCu3CxgLH8Z4Bna11SkyBgUI7QvBjCs7HFW5Zkzd7VGZzcxSNIhXGsHGVbAq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761222889; c=relaxed/simple;
	bh=GYBKmdSVd/3rI9vvraR/CDqhZgDVhutt8fTSw28SkRE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M7lVCTeWaZFKE4ktaB9BtaYJNtjZ+GTx/yJSRGA/sXY4cgjKthbTF0ycyL1CFl42Bo90T6G7WxlBXr8MuFArPtgfLhmLRDjmJsuo7zzoaGpxikATh3HRaHiobm/LEYZ8FUSCDb7OWWz7k4EUw51EigtgpL9j4mbX4f8tJP8K0NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g8lVkppu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 837DAC4CEE7;
	Thu, 23 Oct 2025 12:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761222889;
	bh=GYBKmdSVd/3rI9vvraR/CDqhZgDVhutt8fTSw28SkRE=;
	h=From:To:Cc:Subject:Date:From;
	b=g8lVkppuiMXK/tlaFNL2WJIqYCJ88NvIOipFAShc8aJqmufpfPmKlmBvKvHpvhyvd
	 O2GoTZyjOrqTzR0ksCIOKeJjmOOOCbY7mFJbwxUgxghhLSuUYv46cVtmFljnf3CKBB
	 sVSI3EiclVlLiuzXKql1nMq2dsn5q+aECESPlSnz6boO5rN47Kxmm7fKc/HETKC3yL
	 F4c1VvD1aIzk1Udf6DyU2wMghWjGpFF0nKgDJOlWYiMAw0nnxV+sQ4/gvdrWHUaiv8
	 opkm/AkBnfaCHoPV1BrH6b4tvLDUl24dbqflQuVBfc0lxPCWAk05rB54IwCEYhNJAQ
	 7dDnqBU37VLaQ==
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
Subject: [PATCH v3] drm/sched: Add warning for removing hack in drm_sched_fini()
Date: Thu, 23 Oct 2025 14:34:30 +0200
Message-ID: <20251023123429.139848-2-phasta@kernel.org>
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
Changes in v3:
  - Add a READ_ONCE() + comment to make the warning slightly less
    horrible.

Changes in v2:
  - Fix broken brackets.
---
 drivers/gpu/drm/scheduler/sched_main.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 46119aacb809..31039b08c7b9 100644
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
@@ -1440,8 +1440,15 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 			 * For now, this remains a potential race in all
 			 * drivers that keep entities alive for longer than
 			 * the scheduler.
+			 *
+			 * The READ_ONCE() is there to make the lockless read
+			 * (warning about the lockless write below) slightly
+			 * less broken...
 			 */
+			if (!READ_ONCE(s_entity->stopped))
+				dev_warn(sched->dev, "Tearing down scheduler with active entities!\n");
 			s_entity->stopped = true;
+		}
 		spin_unlock(&rq->lock);
 		kfree(sched->sched_rq[i]);
 	}
-- 
2.49.0


