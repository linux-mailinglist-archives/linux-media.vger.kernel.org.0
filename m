Return-Path: <linux-media+bounces-33984-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A904DACC325
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 11:33:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65E267A806E
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 09:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA66028467D;
	Tue,  3 Jun 2025 09:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iZ3iD+Uw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530EB2820C1;
	Tue,  3 Jun 2025 09:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748943133; cv=none; b=Y07anPabavsL464zFm2pY9mMJN46PFHXL+0FW3SKE5/tVrtZZltxL6KBJniM/JF3o166PFGSB16uMLSg69NNtpv2b8fQvn9JN7hQyJCPb6ASvvtKbBxQE1/oDsx1SWjy1S+kYPnu3yTrjcdV8Wyswhh9h7+RBcl4+LyzhA+S754=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748943133; c=relaxed/simple;
	bh=JlGlrAf5irnLGCz57gLr8CZ1XlTgVDnTWZ4rzZoyCTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y67RCaqUscvWXyHwW3kZ6zDsoKYePMlKMHCPMLd2972w6h5tnmXxjZY3nNkmVx/u12/B6i31BWydGfFEctyFMzIVSzL/SeHOlGZwL9ufYcVSJ+ZHikrMemS4WzmbOt7k1xSDUEljJQo1sZ9LFaNxKhS3XDx/0bngiF318bCRvZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iZ3iD+Uw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43EDBC4CEEF;
	Tue,  3 Jun 2025 09:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748943133;
	bh=JlGlrAf5irnLGCz57gLr8CZ1XlTgVDnTWZ4rzZoyCTg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iZ3iD+UwvikJeVTacU5gVEdfONFFSfTUnENiItII3sdU8eQEjkfIxAH3zUWSD2ZDE
	 KfHmvzXsHpYRXKPYNu7Xc6AJoZlhAq4iG4qeA56magRzGcU2O20jFVMWr0IuiqNBwQ
	 dWGFo20wWBL3M68IV4d8etgB3KAgC9jzTN87fYNkkVHBBkt/hScitnKqHSqlp7oRqn
	 PYvRzanvdQjqOupHR1c5VEFyu7qLmkOfgVmNmL/kBhBMKHpRI4/a574CtEHkC2xglR
	 Ee8eu3XaITO1M0BIgxWU+Ua+3WY4PXHZo4LxZ+kc4yQhO32oJFxrwtKxShpPKAKDMp
	 M4uNvTEbatGJQ==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [RFC PATCH 4/6] drm/nouveau: Make fence container helper usable driver-wide
Date: Tue,  3 Jun 2025 11:31:29 +0200
Message-ID: <20250603093130.100159-6-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250603093130.100159-2-phasta@kernel.org>
References: <20250603093130.100159-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to implement a new DRM GPU scheduler callback in Nouveau, a
helper for obtaining a nouveau_fence from a dma_fence is necessary. Such
a helper exists already inside nouveau_fence.c, called from_fence().

Make that helper available to other C files with a more precise name.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 20 +++++++-------------
 drivers/gpu/drm/nouveau/nouveau_fence.h |  6 ++++++
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index d5654e26d5bc..869d4335c0f4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -38,12 +38,6 @@
 static const struct dma_fence_ops nouveau_fence_ops_uevent;
 static const struct dma_fence_ops nouveau_fence_ops_legacy;
 
-static inline struct nouveau_fence *
-from_fence(struct dma_fence *fence)
-{
-	return container_of(fence, struct nouveau_fence, base);
-}
-
 static inline struct nouveau_fence_chan *
 nouveau_fctx(struct nouveau_fence *fence)
 {
@@ -77,7 +71,7 @@ nouveau_local_fence(struct dma_fence *fence, struct nouveau_drm *drm)
 	    fence->ops != &nouveau_fence_ops_uevent)
 		return NULL;
 
-	return from_fence(fence);
+	return to_nouveau_fence(fence);
 }
 
 void
@@ -268,7 +262,7 @@ nouveau_fence_done(struct nouveau_fence *fence)
 static long
 nouveau_fence_wait_legacy(struct dma_fence *f, bool intr, long wait)
 {
-	struct nouveau_fence *fence = from_fence(f);
+	struct nouveau_fence *fence = to_nouveau_fence(f);
 	unsigned long sleep_time = NSEC_PER_MSEC / 1000;
 	unsigned long t = jiffies, timeout = t + wait;
 
@@ -448,7 +442,7 @@ static const char *nouveau_fence_get_get_driver_name(struct dma_fence *fence)
 
 static const char *nouveau_fence_get_timeline_name(struct dma_fence *f)
 {
-	struct nouveau_fence *fence = from_fence(f);
+	struct nouveau_fence *fence = to_nouveau_fence(f);
 	struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
 
 	return !fctx->dead ? fctx->name : "dead channel";
@@ -462,7 +456,7 @@ static const char *nouveau_fence_get_timeline_name(struct dma_fence *f)
  */
 static bool nouveau_fence_is_signaled(struct dma_fence *f)
 {
-	struct nouveau_fence *fence = from_fence(f);
+	struct nouveau_fence *fence = to_nouveau_fence(f);
 	struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
 	struct nouveau_channel *chan;
 	bool ret = false;
@@ -478,7 +472,7 @@ static bool nouveau_fence_is_signaled(struct dma_fence *f)
 
 static bool nouveau_fence_no_signaling(struct dma_fence *f)
 {
-	struct nouveau_fence *fence = from_fence(f);
+	struct nouveau_fence *fence = to_nouveau_fence(f);
 
 	/*
 	 * caller should have a reference on the fence,
@@ -503,7 +497,7 @@ static bool nouveau_fence_no_signaling(struct dma_fence *f)
 
 static void nouveau_fence_release(struct dma_fence *f)
 {
-	struct nouveau_fence *fence = from_fence(f);
+	struct nouveau_fence *fence = to_nouveau_fence(f);
 	struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
 
 	kref_put(&fctx->fence_ref, nouveau_fence_context_put);
@@ -521,7 +515,7 @@ static const struct dma_fence_ops nouveau_fence_ops_legacy = {
 
 static bool nouveau_fence_enable_signaling(struct dma_fence *f)
 {
-	struct nouveau_fence *fence = from_fence(f);
+	struct nouveau_fence *fence = to_nouveau_fence(f);
 	struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
 	bool ret;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
index 8bc065acfe35..c3595c2197b5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
@@ -17,6 +17,12 @@ struct nouveau_fence {
 	unsigned long timeout;
 };
 
+static inline struct nouveau_fence *
+to_nouveau_fence(struct dma_fence *fence)
+{
+	return container_of(fence, struct nouveau_fence, base);
+}
+
 int  nouveau_fence_create(struct nouveau_fence **, struct nouveau_channel *);
 int  nouveau_fence_new(struct nouveau_fence **, struct nouveau_channel *);
 void nouveau_fence_unref(struct nouveau_fence **);
-- 
2.49.0


