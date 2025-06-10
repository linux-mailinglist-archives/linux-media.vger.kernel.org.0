Return-Path: <linux-media+bounces-34466-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDC7AD3F5B
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 18:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F54F7AC0E1
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 16:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A71D242D70;
	Tue, 10 Jun 2025 16:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="haZZw926"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910E7241C8C
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 16:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749573776; cv=none; b=nbr2xcYKoKk8jyRdBzmzEWmF0Iw5mmaFcjpNXwmdjLUq2+UDg3EhQrh8Fz3OvcEC3DeGn96VBgOuVh+BjSV/tYa1dGx4Kiob7qQMn07Eta3vBlU++2MNwtggXckKuAq7HUPFWMGJBcNYOoqQoEfUB5jFkONvZWt9whW+G9veNCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749573776; c=relaxed/simple;
	bh=CXOm3VpV3s7dgmropTJ9W5BtThM3SEPuwr9dm8Ssioo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=upS6oU/TTjL6kHuAfHVfqbUGaOXQiE5ckcKDZvsyRiMdGq8Z30NFFhpFXll87kXKDbj4umV993xuVJyaWgZGN0yrS22EM1ZWGqtDCMD5L2pjer7tfTqy0V/Y+z4+/zlGKD1Sxd83LjVDUUvomaNmqN+pXbwvqvC0Ex7XXC10E10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=haZZw926; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=DNcYXqzWPd3Ni6JJNBcKHgqmeyxWYGcGr3oexCbuq04=; b=haZZw926B7qxoxoKGnSFW2JZyi
	wK7ThIGHhiOwCia7WuYBAXfIb/+aM0mpn3yv9KsOfF+n+s63cIZbl9T7AOqS2CCG1LcXH5/K5gD78
	OcNEmqxxQuvSDx8BgUQqZ0OvdcGM4PSZJtfjF+yXWm9YGJgb5rBqzEvWn0dDJuyHfhFCT1FxnnANp
	UZQh78hfnLHqOs9+Cv7NIvzdfljvGl2lF8+Tuyy0XVVKFnQWOJaZSZaW7fO7VWwKjheM1wTbP3hpA
	GY4mZgeXf+7tizqbMDfojn1D59YSUnpLyk5YlpPdo6wwNas7DKJ4tn1hkB8eNIr5uT9CA3vcd2PYm
	RsYx7M8g==;
Received: from [81.79.92.254] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uP23V-001t9c-Jm; Tue, 10 Jun 2025 18:42:33 +0200
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
Subject: [PATCH v6 0/4] Fixing some dma-fence use-after-free
Date: Tue, 10 Jun 2025 17:42:22 +0100
Message-ID: <20250610164226.10817-1-tvrtko.ursulin@igalia.com>
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
accessible from xe fences getting freed. 

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

v6:
 * Replaced dma_fence_access_begin/end with rcu_read_(un)lock. (Christian)
 * Added __rcu annotation to dma_fence_driver|timeline_name() helpers. (Christian)
 * Re-ordered patches to accomodate above changes.

Tvrtko Ursulin (4):
  sync_file: Protect access to driver and timeline name
  drm/i915: Protect access to driver and timeline name
  dma-fence: Add safe access helpers and document the rules
  drm/xe: Make dma-fences compliant with the safe access rules

 drivers/dma-buf/dma-fence.c                  | 111 +++++++++++++++++--
 drivers/dma-buf/sync_file.c                  |  24 +++-
 drivers/gpu/drm/i915/gt/intel_gt_requests.c  |  10 +-
 drivers/gpu/drm/i915/i915_request.c          |   7 +-
 drivers/gpu/drm/i915/i915_sw_fence.c         |  10 +-
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c           |   7 +-
 drivers/gpu/drm/xe/xe_hw_fence.c             |   3 +
 include/linux/dma-fence.h                    |  31 ++++--
 include/trace/events/dma_fence.h             |  38 ++++++-
 10 files changed, 209 insertions(+), 34 deletions(-)

-- 
2.48.0


