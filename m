Return-Path: <linux-media+bounces-34348-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC31CAD1C2D
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 13:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A6A2188DBDE
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 11:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB182550A4;
	Mon,  9 Jun 2025 11:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Bk7VBXBw"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5A4253346
	for <linux-media@vger.kernel.org>; Mon,  9 Jun 2025 11:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749467053; cv=none; b=FjLmg9k1iFG2LL5xf41lYNur3UCf+Hzk/hZOzi56+rNqH1v2gpV3T2E45r7j7nae3L4Y7DvrKC6yCwZ7qq/r8/DGKsrCEaWtNLVZGMlJbwpt2CfgAhix5vU9KtSsNQVmK3fUVsNvjB8eAkOoo5gBDgr6MMGGjuab6s33KxA/elw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749467053; c=relaxed/simple;
	bh=ssfFxPK3MoxO7a4/tvqAnhNGJw4iMdhBz3j6DrxYMrU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aSWt9rcQcqbLXuLqvdv9Vd/2DJgR4cj3Tv7KL7ULJw3evmpp39knC6ltEQJbx772fvyZ9Xu+TeyJx7bFURhZNVn7eC6wiQ4i3CzUl7CDoxuAWoASmCPGih98BhUOv9lr3yWwUBNNfAm4NcmeQFABYBqFPjHhzy46jBkb/LLNwPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Bk7VBXBw; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=2S32/aBsrv+xOKKgjTQUppa3LBI/6fgL0iqXdkdY86k=; b=Bk7VBXBwvitgVxHE1LsLFvGhB0
	ADnhuHhSDwW6HDrqTa4b+llSPjjklF6gAOffRLiEul2L7C2O/Ei8alyYoQh8aMeOpSuOHIefjKhTh
	jXEex3VdX7EEMsoTfLJf9y+B/pVWIqEJPNJ1eF14bKg9TihU2UQVXiKcwE9m24wH5bDfBqJ8LploR
	I5ha+b+LkQpSul/EwlMiEq+NTHWxJavJkoIVwNmxuWS+tPaTu6FNFK9GYzd8kocP9M7Mc5rys/Fxk
	qN2wgaPomV2EkvGiN/MdpTr5LJFD8DjLYy+GIN68eWRQgpNbrp3orJQxYxwWDezkD6hsJ44zzHDRZ
	HFPGYpQQ==;
Received: from [81.79.92.254] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uOaI4-001NxD-Tk; Mon, 09 Jun 2025 13:03:45 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Rob Clark <robdclark@gmail.com>,
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
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v5 0/4] Fixing some dma-fence use-after-free
Date: Mon,  9 Jun 2025 12:03:26 +0100
Message-ID: <20250609110330.74705-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
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

The series only addreses the runtime use-after-free scenarios,
such as the above explained situation with the xe driver. For now the module
unload problem is deliberately left for later. (Although again, some of the
patches merged earlier do make it safer, and will make future improvements
easier due fewer accesses to fence->ops.)

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

v5:
 * Rebased after prep patches merged.
 * Move dma_fence_access_end() earlier in dma_fence_release(). (Christian)

Tvrtko Ursulin (4):
  dma-fence: Add safe access helpers and document the rules
  sync_file: Protect access to driver and timeline name
  drm/i915: Protect access to driver and timeline name
  drm/xe: Make dma-fences compliant with the safe access rules

 drivers/dma-buf/dma-fence.c                  | 82 +++++++++++++++++++-
 drivers/dma-buf/sync_file.c                  |  6 ++
 drivers/gpu/drm/i915/gt/intel_gt_requests.c  |  2 +
 drivers/gpu/drm/i915/i915_request.c          | 17 +---
 drivers/gpu/drm/i915/i915_sw_fence.c         |  2 +
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  2 +
 drivers/gpu/drm/xe/xe_guc_submit.c           |  7 +-
 drivers/gpu/drm/xe/xe_hw_fence.c             |  3 +
 include/linux/dma-fence.h                    | 32 ++++++--
 include/trace/events/dma_fence.h             | 38 ++++++++-
 10 files changed, 162 insertions(+), 29 deletions(-)

-- 
2.48.0


