Return-Path: <linux-media+bounces-60574-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oI6aCT4c+2nSWgMAu9opvQ
	(envelope-from <linux-media+bounces-60574-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 12:47:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7074D9785
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 12:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B33F3024A79
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 10:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B18A1421883;
	Wed,  6 May 2026 10:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="IOA5/8Iw"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A8B1DB95E;
	Wed,  6 May 2026 10:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778064394; cv=pass; b=j9Op9/TDJmhERrzdKIV1aNoDdspCN9P5mJoK86G2Rbx/O7fi8ITUFarDrrHwFk6yEdNNhrCBP32u7fqIWT6r2RDoo0mLOPRgjDdHfSCWf8NjEjtPvf0ZsxH/zFE9v7nue23AxoMTAXsi0WBSONyN2SCGCGdLAIvCqW5W85jWNHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778064394; c=relaxed/simple;
	bh=6b83ueALaK2PAhKhXJAmPol0le11nNh+/BLIAcSBX34=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tg0nWu5tjkzYJxuvJLmRCpZUE4WKNLNwAi+jxlWG43KAE+VCoydhdGQiKmN8jtqI5CFM6/yTwBjKB2Qf7NEVvyOe0FmZDVhub5J7e9KY9vM9zysi9YHUx/z3BObyMAmL6vzAA5teSlWHLK6dUwbeIS81cPLw2WhHca5ojGJN66Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=IOA5/8Iw; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1778064379; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IVWSXEZF3uZBLaxOj/wmmnUcU0sCjnQh+GzXRg16wFKOCLxfunm3huP0GPGuyxQ7ZFTwk3ZzrUAySsAvSmIrbKyRNziaAwLHowiTzEx/zx5Rq5S1YbIA2VI24xN9OByRuXiQ8XNODm2EYNVyYWH6Ywme+ArUCbKHYrtjL2mU77g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778064379; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=969bjndru/0e943CKf2AcnAwdyybQY7U20RliwhKKNA=; 
	b=ZXKPiv6m5lW6gONyDU+FP85ot6TfpdLvKSMXqH0XH7q3TSFPRszITAT+sbSttviXQnA0NctVOvc5DEGCXh+1AYPvmUJlskmwM4BmAxeOdsbTi1elVp7Zix6j3ip0SgoIViNcl6IBUl/p6xjjq9dKdtXknIqO4rxYhD4C4jpbUXs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778064379;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=969bjndru/0e943CKf2AcnAwdyybQY7U20RliwhKKNA=;
	b=IOA5/8IwcHx9uIpY7kBQjXFY6BE6bHyjlcapLhHf9H5qHrOtn1jhhTUmXe/V3ff6
	BmbQi2OH0yjc2vSD+DLn/Jxk8l5LY0yzs/uAwgcbDcoMJRGpUO2w5D6e/Fv9vcZ6o6v
	YIQD28ZaFGIg2VVltqm7lK6ytB7tzIBeOSTwVFB4=
Received: by mx.zohomail.com with SMTPS id 1778064377137162.00190677417413;
	Wed, 6 May 2026 03:46:17 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 06 May 2026 12:45:56 +0200
Subject: [PATCH 1/4] drm/panthor: Add freed_sz parameter to
 reclaim_priv_bos
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-panthor-explicit-reclaim-v1-1-44f82ac147ce@collabora.com>
References: <20260506-panthor-explicit-reclaim-v1-0-44f82ac147ce@collabora.com>
In-Reply-To: <20260506-panthor-explicit-reclaim-v1-0-44f82ac147ce@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 9D7074D9785
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[collabora.com,arm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60574-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

panthor_mmu_reclaim_priv_bos returns the number of freed pages. However,
how many bytes of freed memory this translates to can't generally be
deduced from the number of pages, as the page size is a per-VM property.

It may be useful to know the exact number of bytes that have been freed
for observability and debugging purposes. To that end, add a new
parameter "freed_sz", which is a pointer to a size_t where this
information will be stored. It may be NULL, in which case the
information isn't stored at all.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_gem.c |  3 ++-
 drivers/gpu/drm/panthor/panthor_mmu.c | 12 ++++++++++--
 drivers/gpu/drm/panthor/panthor_mmu.h |  1 +
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 13295d7a593d..80e82238f3c5 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -1511,7 +1511,8 @@ panthor_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 		goto out;
 
 	freed += panthor_mmu_reclaim_priv_bos(ptdev, sc->nr_to_scan - freed,
-					      &remaining, panthor_gem_try_evict);
+					      &remaining, NULL,
+					      panthor_gem_try_evict);
 	if (freed >= sc->nr_to_scan)
 		goto out;
 
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index a7ee14986849..b81388b35a58 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -3127,13 +3127,18 @@ int panthor_vm_prepare_mapped_bos_resvs(struct drm_exec *exec, struct panthor_vm
 unsigned long
 panthor_mmu_reclaim_priv_bos(struct panthor_device *ptdev,
 			     unsigned int nr_to_scan, unsigned long *remaining,
+			     size_t *freed_sz,
 			     bool (*shrink)(struct drm_gem_object *,
 					    struct ww_acquire_ctx *))
 {
+	unsigned long newly_freed;
 	unsigned long freed = 0;
 	LIST_HEAD(remaining_vms);
 	LIST_HEAD(vms);
 
+	if (freed_sz)
+		*freed_sz = 0;
+
 	mutex_lock(&ptdev->reclaim.lock);
 	list_splice_init(&ptdev->reclaim.vms, &vms);
 
@@ -3152,8 +3157,11 @@ panthor_mmu_reclaim_priv_bos(struct panthor_device *ptdev,
 
 		mutex_unlock(&ptdev->reclaim.lock);
 
-		freed += drm_gem_lru_scan(&vm->reclaim.lru, nr_to_scan - freed,
-					  remaining, shrink, NULL);
+		newly_freed = drm_gem_lru_scan(&vm->reclaim.lru, nr_to_scan - freed,
+					       remaining, shrink, NULL);
+		if (freed_sz)
+			*freed_sz += panthor_vm_page_size(vm) * newly_freed;
+		freed += newly_freed;
 
 		mutex_lock(&ptdev->reclaim.lock);
 
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
index 3522fbbce369..12b18b5f90e1 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.h
+++ b/drivers/gpu/drm/panthor/panthor_mmu.h
@@ -52,6 +52,7 @@ int panthor_vm_evict_bo_mappings_locked(struct panthor_gem_object *bo);
 unsigned long
 panthor_mmu_reclaim_priv_bos(struct panthor_device *ptdev,
 			     unsigned int nr_to_scan, unsigned long *remaining,
+			     size_t *freed_sz,
 			     bool (*shrink)(struct drm_gem_object *,
 					    struct ww_acquire_ctx *));
 int panthor_vm_prepare_mapped_bos_resvs(struct drm_exec *exec,

-- 
2.54.0


