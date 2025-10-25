Return-Path: <linux-media+bounces-45546-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D658FC0937E
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 18:12:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2FEBB4EE7C9
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 16:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF2603043B7;
	Sat, 25 Oct 2025 16:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQArbhm3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BC2303A2A;
	Sat, 25 Oct 2025 16:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761408615; cv=none; b=WhT4CiLPofExqhA30pqUAxSwaxfxN7ywLzYAqqhRDjkmPlRMl327LSvRfQcJLpRzp+34HQhWM4t771PHmbl8Mgc4ihFcdo1RLxx19fyu7/BbPI0XG4pgAD/7CVeRzxCJM+dvEY7HGNpPV47akdXTwDeTTFNNXts/vMtr0ecSsG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761408615; c=relaxed/simple;
	bh=RVIKXVH5UErh0acqJO/K+Fvyk5QKptR9ypjhsRzx8vg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XB9fM69u0NGp/jgrqt52EbtWfyS5r5y8dboTKRLhDHfQ2gBGoGh5OCmC3hC6S++QRjeh5XtdzJpb9D5omAbUuAxIoM183IEhz5OuM6fvbR+6bSO80dIPQNTHh2D9CMG9NOwN0j9MJbdPitF067Pt+ksheHBxdMMTFu/zbRN9dq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQArbhm3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE34C4CEFF;
	Sat, 25 Oct 2025 16:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761408615;
	bh=RVIKXVH5UErh0acqJO/K+Fvyk5QKptR9ypjhsRzx8vg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PQArbhm3tGtHhTQPz/C0noOHEp5R2lU6qYTestsaOPrZsXcemEwY4G9zSKm+cH8+4
	 Y6FTUibImLYh3lwDE8qnqiM7eIdg3/yFNC0KLVlWcD9rmYooOXyzVv0bagl/E4vywk
	 5JFLfYEEd5JSMZ/rRvVvALD0kvdFBY1fbXPU6ILc76/tftrmkkz6ISUr0p0fd+TR1I
	 i4vwai6MwwVy9iHVkH1c/TT4nUzzTeT+KF6Gi922ly9mSJ/RvCIM4lJEDtSw9+v1UD
	 Dzz/nUV1ikDkZWOviQ0GntjDup2bb0vNU7fF+nU9DJs9rlOcTPJnluIF/E81qppDoD
	 wO/g+X7a2bL/A==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Matthew Auld <matthew.auld@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Jonathan Cavitt <jonathan.cavitt@intel.com>,
	Sasha Levin <sashal@kernel.org>,
	lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	intel-xe@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH AUTOSEL 6.17] drm/xe: improve dma-resv handling for backup object
Date: Sat, 25 Oct 2025 11:54:16 -0400
Message-ID: <20251025160905.3857885-25-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Transfer-Encoding: 8bit

From: Matthew Auld <matthew.auld@intel.com>

[ Upstream commit edb1745fc618ba8ef63a45ce3ae60de1bdf29231 ]

Since the dma-resv is shared we don't need to reserve and add a fence
slot fence twice, plus no need to loop through the dependencies.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Link: https://lore.kernel.org/r/20250829164715.720735-2-matthew.auld@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

Explanation

- What it fixes
  - Removes redundant dma-resv operations when a backup BO shares the
    same reservation object as the original BO, preventing the same
    fence from being reserved/added twice to the same `dma_resv`.
  - Avoids scanning the same dependency set twice when source and
    destination BOs share the same `dma_resv`.

- Why the change is correct
  - The backup object is created to share the parent’s reservation
    object, so a single reserve/add is sufficient:
    - The backup BO is initialized with the parent’s resv:
      `drivers/gpu/drm/xe/xe_bo.c:1309` (`xe_bo_init_locked(...,
      bo->ttm.base.resv, ...)`), ensuring `bo->ttm.base.resv ==
      backup->ttm.base.resv`.
    - The patch adds an explicit invariant check to document and enforce
      this: `drivers/gpu/drm/xe/xe_bo.c:1225` (`xe_assert(xe,
      bo->ttm.base.resv == backup->ttm.base.resv)`).
  - With shared `dma_resv`, adding the same fence twice is at best
    redundant (wasting fence slots and memory) and at worst error-prone.
    Reserving fence slots only once and adding the fence once is the
    correct behavior.

- Specific code changes and effects
  - Evict path (GPU migration copy case):
    - Before: reserves and adds fence on both `bo->ttm.base.resv` and
      `backup->ttm.base.resv`.
    - After: reserves and adds exactly once, guarded by the shared-resv
      assertion.
    - See single reserve and add: `drivers/gpu/drm/xe/xe_bo.c:1226`
      (reserve) and `drivers/gpu/drm/xe/xe_bo.c:1237` (add fence). This
      is the core fix; the removed second reserve/add on the backup is
      the redundant part eliminated.
  - Restore path (migration copy back):
    - Same simplification: reserve once, add once on the shared
      `dma_resv`.
    - See single reserve and add: `drivers/gpu/drm/xe/xe_bo.c:1375`
      (reserve) and `drivers/gpu/drm/xe/xe_bo.c:1387` (add fence).
  - Dependency handling in migrate:
    - Before: added deps for both src and dst based only on `src_bo !=
      dst_bo`.
    - After: only add dst deps if the resv objects differ, avoiding
      double-walking the same `dma_resv`.
    - See updated condition: `drivers/gpu/drm/xe/xe_migrate.c:932`
      (`src_bo->ttm.base.resv != dst_bo->ttm.base.resv`).

- User-visible impact without the patch
  - Duplicate `dma_resv_add_fence()` calls on the same reservation
    object can:
    - Consume extra shared-fence slots and memory.
    - Inflate dependency lists, causing unnecessary scheduler waits and
      overhead.
    - Increase failure likelihood of `dma_resv_reserve_fences()` under
      memory pressure.
  - These paths are exercised during suspend/resume flows of pinned VRAM
    BOs (evict/restore), so reliability and performance in power
    transitions can be affected.

- Scope and risk
  - Small, focused changes localized to the Intel Xe driver
    migration/evict/restore paths:
    - Files: `drivers/gpu/drm/xe/xe_bo.c`,
      `drivers/gpu/drm/xe/xe_migrate.c`.
  - No API changes or architectural refactors; logic strictly reduces
    redundant operations.
  - The `xe_assert` acts as a safety net to catch unexpected non-shared
    `resv` usage; normal runtime behavior is unchanged when the
    invariant holds.
  - The CPU copy fallback paths are untouched.

- Stable backport considerations
  - This is a clear correctness and robustness fix, not a feature.
  - Low regression risk if the stable branch also creates the backup BO
    with the parent’s `dma_resv` (as shown by the use of
    `xe_bo_init_locked(..., bo->ttm.base.resv, ...)` in
    `drivers/gpu/drm/xe/xe_bo.c:1309`).
  - If a stable branch diverges and the backup BO does not share the
    resv, this patch would need adjustment (i.e., keep dual reserve/add
    in that case). The added `xe_assert` helps surface such mismatches
    during testing.

Conclusion: This commit fixes a real bug (duplicate fence reserve/add
and duplicate dependency scanning on a shared `dma_resv`) with a
minimal, well-scoped change. It aligns with stable rules (important
bugfix, low risk, contained), so it should be backported.

 drivers/gpu/drm/xe/xe_bo.c      | 13 +------------
 drivers/gpu/drm/xe/xe_migrate.c |  2 +-
 2 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index d07e23eb1a54d..5a61441d68af5 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1242,14 +1242,11 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 		else
 			migrate = mem_type_to_migrate(xe, bo->ttm.resource->mem_type);
 
+		xe_assert(xe, bo->ttm.base.resv == backup->ttm.base.resv);
 		ret = dma_resv_reserve_fences(bo->ttm.base.resv, 1);
 		if (ret)
 			goto out_backup;
 
-		ret = dma_resv_reserve_fences(backup->ttm.base.resv, 1);
-		if (ret)
-			goto out_backup;
-
 		fence = xe_migrate_copy(migrate, bo, backup, bo->ttm.resource,
 					backup->ttm.resource, false);
 		if (IS_ERR(fence)) {
@@ -1259,8 +1256,6 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 
 		dma_resv_add_fence(bo->ttm.base.resv, fence,
 				   DMA_RESV_USAGE_KERNEL);
-		dma_resv_add_fence(backup->ttm.base.resv, fence,
-				   DMA_RESV_USAGE_KERNEL);
 		dma_fence_put(fence);
 	} else {
 		ret = xe_bo_vmap(backup);
@@ -1338,10 +1333,6 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
 		if (ret)
 			goto out_unlock_bo;
 
-		ret = dma_resv_reserve_fences(backup->ttm.base.resv, 1);
-		if (ret)
-			goto out_unlock_bo;
-
 		fence = xe_migrate_copy(migrate, backup, bo,
 					backup->ttm.resource, bo->ttm.resource,
 					false);
@@ -1352,8 +1343,6 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
 
 		dma_resv_add_fence(bo->ttm.base.resv, fence,
 				   DMA_RESV_USAGE_KERNEL);
-		dma_resv_add_fence(backup->ttm.base.resv, fence,
-				   DMA_RESV_USAGE_KERNEL);
 		dma_fence_put(fence);
 	} else {
 		ret = xe_bo_vmap(backup);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 2a627ed64b8f8..ba9b8590eccb2 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -901,7 +901,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		if (!fence) {
 			err = xe_sched_job_add_deps(job, src_bo->ttm.base.resv,
 						    DMA_RESV_USAGE_BOOKKEEP);
-			if (!err && src_bo != dst_bo)
+			if (!err && src_bo->ttm.base.resv != dst_bo->ttm.base.resv)
 				err = xe_sched_job_add_deps(job, dst_bo->ttm.base.resv,
 							    DMA_RESV_USAGE_BOOKKEEP);
 			if (err)
-- 
2.51.0


