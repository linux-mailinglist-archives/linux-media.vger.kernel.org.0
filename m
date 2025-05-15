Return-Path: <linux-media+bounces-32572-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4921AB834D
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 11:50:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54EAC4C6FC5
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 09:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E49DE297B87;
	Thu, 15 May 2025 09:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="P/GNF0N2"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA76238C21
	for <linux-media@vger.kernel.org>; Thu, 15 May 2025 09:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747302630; cv=none; b=mDx7CB7PhBKJ1gYe49ypWdA8hBj0mqlPh+0Mh3kmlccoZQX0wv6WutKLX4Xirk0TbeN6GVTo8aD34DJ6fZf8ST4w8RY5nJ+gHKyuj/b4wgW8vJLihxbdqFjTjqbMuOcGmpKxWSBRlQGsLnq7ITS1TOA2bwEMjDO5ov9OCbAJX2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747302630; c=relaxed/simple;
	bh=WkQmZJjEjFdinkPp2u80tHt0bGL4jWJ9L14h3I0dMgc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jjzXArGhWRncIcg/sxtTffIncC5WQHbB1zmwTywBlwHLwBkbJyXsCib8Shx7c7a1b0FpUBlG6LB1AvTsVzrXZ831fmO0EDYOicPvrlSzjrX4uyp1auHRPPtwP/+FTmgApk5wG1WmZcQ5Ry2tsdXgzq1NcuybtHmOCVBVjotCF98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=P/GNF0N2; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=fGQOFPJrTYGfJTQLPFRUvbXaQjq4Gsq2Hi+BhulxzEk=; b=P/GNF0N2SxUb8A9r+w08FsISvh
	A0v+7zeGZLMDl0zMHvWJV26YqdZ0AzC+K1sOim68aRx4JamHNgnZiKb1SQQHEEtcbRQf/u94Gio2I
	o187Xi8W17stXXCPs8u0kAN4ACGGEpairArhMwKpofGE3JVXraW3HrEab7Rg6KAbEW7aSHf4xWwwR
	lQ9TRBjLPJvW7BTIuKg34FNCCAKz0ssPyhhjYSwVXnRi7UopUKfM6NGqymwMxRxu85dGkcq+XIbqt
	gdVf+MGhgoq+tRXZ7LF9VIkkzMqMkkvCLy4N7C+NDFT1K76VMPdt1G9hdctU3XZp8L57yhx5fN7Z0
	DqHFikbw==;
Received: from [81.79.92.254] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uFV8O-008ZQb-2m; Thu, 15 May 2025 11:50:06 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	amd-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v4 0/9] Some (drm_sched_|dma_)fence lifetime issues
Date: Thu, 15 May 2025 10:49:55 +0100
Message-ID: <20250515095004.28318-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

tl;dr;
Xe and probably some other drivers can tear down the internal state referenced
by an exported sync_file fence which then causes a null pointer derefences on
accessing said fence.

IGT that exploits the problem:
https://patchwork.freedesktop.org/patch/642709/?series=146211&rev=2

It seems there is a consensus this is a known problem with the dma-fence design,
where internal state shouldn't really be accessed after the fence has been
signaled. However currently the code is mostly unaware of that hence the use-
after-free potential.

To fix it, between the option of adding more reference counting and trying to
"revoke" the fence, suggestion is to focus on the later.

Reference to the recent discussion:
https://lore.kernel.org/dri-devel/20250418164246.72426-1-tvrtko.ursulin@igalia.com/

This series therefore attempts to implement a solution along those lines.

Most of the description what and how can be found in:
 "dma-fence: Add safe access helpers and document the rules"

Other than that, the series starts with some cleanups, with the general goal of
hiding more of the dma-fence implementation details behind explicit API. This
means adding helpers for access to driver and timeline name, and also moving as
much as it is easily possible of driver allocated state into the fence object
itself. Because dma-fence is already reference counted, any state we can embed
automatically becomes safe.

Having said that, the series only addreses the runtime use-after-free scenarios,
such as the above explained situation with the xe driver. For now the module
unload problem is deliberately left for later. (Although again, some of the
early patches do make it safer, and will make future improvements easier due
fewer accesses to fence->ops.)

Final patch in the series is the one which makes xe compliant with the rules
and API proposed earlier in the series. It does so by ensuring there is at least
one RCU grace period between fences being signaled and driver allocated memory
accessible from xe fences getting freed. Which couples with the earlier (from
the series) refactors which added dma_fence_access_begin/end() protection to
the relevant call sites.

If this approach is acceptable the next steps will be to see if any other
drivers will need similar changes. And also to discuss whether we want to go a
step futher and later move to SRCU, so code would be protected against module
unload as well.

v2:
 * Dropped module unload handling.
 * Proposing real API instead of hacks.

v3:
 * Dropped the dma_fence_is_array|chain ops to flags conversion.
 * Dropped the i915 cleanup patch which is now independent.
 * Squashed dma-fence helpers with internal usage patches.
 * Restored missing hunk in "dma-fence: Use a flag for 64-bit seqnos".
 * Removed the AMDGPU_JOB_GET_TIMELINE_NAME macro.
 * Applied some r-b tags.

v4:
 * Tidied 64-bit seqno flags patch and fixed for amdgpu user queues which landed
   since.
 * Adjusted some dma-fence tracepoints to avoid asserts.
 * Protected tracepoints in dma_fence_wait_timeout() with the safe access
   annotations.
 * Dropped driver/timeline helper usage from amdgpu_trace.h.
 * Dropped signaled fence protection from i915 timeline name vfunc.

Tvrtko Ursulin (9):
  dma-fence: Change signature of __dma_fence_is_later
  dma-fence: Use a flag for 64-bit seqnos
  dma-fence: Add helpers for accessing driver and timeline name
  sync_file: Use dma-fence driver and timeline name helpers
  drm/i915: Use dma-fence driver and timeline name helpers
  dma-fence: Add safe access helpers and document the rules
  sync_file: Protect access to driver and timeline name
  drm/i915: Protect access to driver and timeline name
  drm/xe: Make dma-fences compliant with the safe access rules

 drivers/dma-buf/dma-fence-chain.c             |   7 +-
 drivers/dma-buf/dma-fence.c                   | 159 +++++++++++++++---
 drivers/dma-buf/sw_sync.c                     |   2 +-
 drivers/dma-buf/sync_file.c                   |  14 +-
 .../drm/amd/amdgpu/amdgpu_eviction_fence.c    |   7 +-
 .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.c   |   5 +-
 .../gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c  |   5 +-
 drivers/gpu/drm/i915/gt/intel_gt_requests.c   |   6 +-
 drivers/gpu/drm/i915/i915_request.c           |  17 +-
 drivers/gpu/drm/i915/i915_sw_fence.c          |   6 +-
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h  |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c            |   7 +-
 drivers/gpu/drm/xe/xe_hw_fence.c              |   5 +-
 drivers/gpu/drm/xe/xe_sched_job.c             |  14 +-
 include/linux/dma-fence.h                     |  47 ++++--
 include/trace/events/dma_fence.h              |  38 ++++-
 16 files changed, 254 insertions(+), 87 deletions(-)

-- 
2.48.0


