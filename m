Return-Path: <linux-media+bounces-32144-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F83AB18C4
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 17:34:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1627DA22C7B
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 15:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D634822F77F;
	Fri,  9 May 2025 15:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="A5zrry2F"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF3522CBF9
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 15:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746804864; cv=none; b=FFkhQyGvTS/iWelFfar8ZtUL1A6ERLgJwYf5UVDkEpK8YydZM9lb9gUcOX4VqHPO8RCrgmEK8tzwnw0NU/WKOX2xJnfnVxmEdP+gRpaMicxNFSQUvlvzkHKQcyWLD2HWcKyUOtcVXj7fbzDh+5lZVko78MerDEACI+f1HvUQn7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746804864; c=relaxed/simple;
	bh=TwgD493fEZebYE1DW5ca/ih/3n7wWr3ghCJ5cF+YekU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RWZ1VFbe9p4EG2k/5uRIMD47ilRb4qagaxjbInx+b+TfCxkLc6AmHxX0cVKF91mtr+Qo+0eOMYSr5Oh/9+sG/78foVsqTNBvs6Sp/ob70aTNYkHtj1UnEF7S1vAjHk8VSNdRMeAAOn4IY7s4r9J6EDCsnc+l5kcaN6TYzuxXkpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=A5zrry2F; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=HLyrjL5WJJksmb8eELko+hQJx6IMnhM2I8WJmx8WtLc=; b=A5zrry2FhXCsl+TBgJlGiqQ8e6
	G6yC20H860kViIufrR8MyrLsYLJUYPQZOxq30MGXuXmwe232FS4MQk9GApk1qjCMvIdMNY7ZPzklS
	RxkiTuNA4yGGx8YU+gaE8k/EM9aSFo411TD3cX4JfhZf98uIG5A1xu/hzX9e9PPdyXBMlhqCXjPQC
	BNRZriVTxqNggdQ671Ct06nU8q5gNrbyphWAXuQx3G4POQbGw0+t8AOlSSDXCyTIMaJkfU6eE+ZBQ
	+s/8g3YxNL1ouwZMANVFdui2nr1G+SdQe0yC8HFHtt45G1VjnLrJBHu3Hn36jWNyVrocFj/l6i5cG
	T8V9DanA==;
Received: from [81.79.92.254] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uDPfF-005oEG-PY; Fri, 09 May 2025 17:34:06 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
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
Subject: [RFC v2 00/13] Some (drm_sched_|dma_)fence lifetime issues
Date: Fri,  9 May 2025 16:33:39 +0100
Message-ID: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
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

Other than that, the series starts with some cleanups, with the general goal of
hiding more of the dma-fence implementation details behind explicit API. This
means adding helpers for access to driver and timeline name, and also moving as
much as it is easily possible of driver allocated state into the fence object
itself. Because dma-fence is already reference counted, any state we can embed
automatically becomes safe.

The moved state refers to the patches that move the 64bit seqno, dma-fence-array
and dma-fence-chain disambiguation into the fence. Again, it is better for as
much of the state to be directly embedded. And since we have plenty of free
flags, the parts I moved are all for free. No increase in struct dma_fence size.

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
drivers will need similar changes for which there are asserts in the new
dma-fence API which will help catch them.

And also to discuss whether we want to go a step futher and later move to SRCU,
so code would be protected against module unload as well.

v2:
 * Dropped module unload handling.
 * Proposing real API instead of hacks.

Tvrtko Ursulin (13):
  drm/i915: Use provided dma_fence_is_chain
  dma-fence: Change signature of __dma_fence_is_later
  dma-fence: Use a flag for 64-bit seqnos
  dma-fence: Move array and chain checks to flags
  dma-fence: Add helpers for accessing driver and timeline name
  dma-fence: Use driver and timeline name helpers internally
  sync_file: Use dma-fence driver and timeline name helpers
  drm/amdgpu: Use dma-fence driver and timeline name helpers
  drm/i915: Use dma-fence driver and timeline name helpers
  dma-fence: Add safe access helpers and document the rules
  sync_file: Protect access to driver and timeline name
  drm/i915: Protect access to driver and timeline name
  drm/xe: Make dma-fences compliant with the safe access rules

 drivers/dma-buf/dma-fence-array.c             |  2 +-
 drivers/dma-buf/dma-fence-chain.c             |  9 +-
 drivers/dma-buf/dma-fence.c                   | 87 ++++++++++++++++++-
 drivers/dma-buf/sw_sync.c                     |  2 +-
 drivers/dma-buf/sync_file.c                   | 14 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     |  2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c  |  5 +-
 drivers/gpu/drm/i915/gem/i915_gem_wait.c      |  7 +-
 drivers/gpu/drm/i915/gt/intel_gt_requests.c   |  6 +-
 drivers/gpu/drm/i915/i915_request.c           |  5 +-
 drivers/gpu/drm/i915/i915_sw_fence.c          |  6 +-
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h  |  2 +
 drivers/gpu/drm/xe/xe_guc_submit.c            |  7 +-
 drivers/gpu/drm/xe/xe_hw_fence.c              |  5 +-
 drivers/gpu/drm/xe/xe_sched_job.c             | 14 +--
 include/linux/dma-fence.h                     | 48 +++++++---
 include/trace/events/dma_fence.h              |  4 +-
 17 files changed, 174 insertions(+), 51 deletions(-)

-- 
2.48.0


