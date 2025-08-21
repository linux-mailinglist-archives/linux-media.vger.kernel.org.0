Return-Path: <linux-media+bounces-40515-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 946ADB2EE74
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 08:44:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0B8FA05379
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 06:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6572E62AD;
	Thu, 21 Aug 2025 06:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lMLOxF0F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gDV6t3uF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lMLOxF0F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gDV6t3uF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B192D3A94
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 06:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755758606; cv=none; b=i/EsGLttIsja/JKevz/huMgCW30a9nCwzT3UjhpdAyIDuRnkAC7PbH7am4WtvlcxcScBAz8oNT9pi3Kv+6AGwowpJ7hGzKKo7+tvTJXKcJY/huZfB8/dnuniRgioN25e136Q0r+83pXgusfWiMELTAOJXV+iL63snyYCzX2g50I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755758606; c=relaxed/simple;
	bh=jhh27RigQDTMUmarQGp166MRsMUiUyC+RgunKqqXBdg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hXWWJHxSYMz6m+dwynSRhAMKvpdIDPIWqYX2YsRkW6nOhVMzegB4CaMxqKXHKE61+WTxetm3UeVAPrkpdCrfCZq5oKO8rI/pcUA19dxChWXqpa9qQsKPQfLWSBtwzjI4wtE/+iGjgvSAKh061qBMPEUKEkafUUYyU5J3YTd1FCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lMLOxF0F; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gDV6t3uF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lMLOxF0F; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gDV6t3uF; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AD244222A7;
	Thu, 21 Aug 2025 06:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755758601; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p46sQbW/eTCJ3rrkz45qAh9n0U47s/4mBkUdTiIOREM=;
	b=lMLOxF0FvPK496g6ehtC9eWrXIYIqfp566vr8Tdenn4iUJ9he4ZWSFeivfz+OGaliVxgOd
	FWf/6vfqht/ylDILfiA+Pq3ed0P7yZRmR+Oj/B4Xz8itHJmJiSYSKJ4g/PpqyIvn3RT7aO
	9E3WuwAvrCPbDXbWscVWYleTQB6qmHY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755758601;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p46sQbW/eTCJ3rrkz45qAh9n0U47s/4mBkUdTiIOREM=;
	b=gDV6t3uFjFvMYuOac8g9FxLNJOcO8mdUTxtbaM9Uke9EIVwWIWZomv8mUGlzrVWrKPbX/e
	bmrmpLBGVi0wwNAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755758601; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p46sQbW/eTCJ3rrkz45qAh9n0U47s/4mBkUdTiIOREM=;
	b=lMLOxF0FvPK496g6ehtC9eWrXIYIqfp566vr8Tdenn4iUJ9he4ZWSFeivfz+OGaliVxgOd
	FWf/6vfqht/ylDILfiA+Pq3ed0P7yZRmR+Oj/B4Xz8itHJmJiSYSKJ4g/PpqyIvn3RT7aO
	9E3WuwAvrCPbDXbWscVWYleTQB6qmHY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755758601;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p46sQbW/eTCJ3rrkz45qAh9n0U47s/4mBkUdTiIOREM=;
	b=gDV6t3uFjFvMYuOac8g9FxLNJOcO8mdUTxtbaM9Uke9EIVwWIWZomv8mUGlzrVWrKPbX/e
	bmrmpLBGVi0wwNAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4965C139A8;
	Thu, 21 Aug 2025 06:43:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BMSxEAnApmgmdgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 21 Aug 2025 06:43:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	oushixiong@kylinos.cn,
	alexander.deucher@amd.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3] drm/amdgpu: Pin buffers while vmap'ing exported dma-buf objects
Date: Thu, 21 Aug 2025 08:40:12 +0200
Message-ID: <20250821064031.39090-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[linaro.org,amd.com,kylinos.cn,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.30

Current dma-buf vmap semantics require that the mapped buffer remains
in place until the corresponding vunmap has completed.

For GEM-SHMEM, this used to be guaranteed by a pin operation while creating
an S/G table in import. GEM-SHMEN can now import dma-buf objects without
creating the S/G table, so the pin is missing. Leads to page-fault errors,
such as the one shown below.

[  102.101726] BUG: unable to handle page fault for address: ffffc90127000000
[...]
[  102.157102] RIP: 0010:udl_compress_hline16+0x219/0x940 [udl]
[...]
[  102.243250] Call Trace:
[  102.245695]  <TASK>
[  102.2477V95]  ? validate_chain+0x24e/0x5e0
[  102.251805]  ? __lock_acquire+0x568/0xae0
[  102.255807]  udl_render_hline+0x165/0x341 [udl]
[  102.260338]  ? __pfx_udl_render_hline+0x10/0x10 [udl]
[  102.265379]  ? local_clock_noinstr+0xb/0x100
[  102.269642]  ? __lock_release.isra.0+0x16c/0x2e0
[  102.274246]  ? mark_held_locks+0x40/0x70
[  102.278177]  udl_primary_plane_helper_atomic_update+0x43e/0x680 [udl]
[  102.284606]  ? __pfx_udl_primary_plane_helper_atomic_update+0x10/0x10 [udl]
[  102.291551]  ? lockdep_hardirqs_on_prepare.part.0+0x92/0x170
[  102.297208]  ? lockdep_hardirqs_on+0x88/0x130
[  102.301554]  ? _raw_spin_unlock_irq+0x24/0x50
[  102.305901]  ? wait_for_completion_timeout+0x2bb/0x3a0
[  102.311028]  ? drm_atomic_helper_calc_timestamping_constants+0x141/0x200
[  102.317714]  ? drm_atomic_helper_commit_planes+0x3b6/0x1030
[  102.323279]  drm_atomic_helper_commit_planes+0x3b6/0x1030
[  102.328664]  drm_atomic_helper_commit_tail+0x41/0xb0
[  102.333622]  commit_tail+0x204/0x330
[...]
[  102.529946] ---[ end trace 0000000000000000 ]---
[  102.651980] RIP: 0010:udl_compress_hline16+0x219/0x940 [udl]

In this stack strace, udl (based on GEM-SHMEM) imported and vmap'ed a
dma-buf from amdgpu. Amdgpu relocated the buffer, thereby invalidating the
mapping.

Provide a custom dma-buf vmap method in amdgpu that pins the object before
mapping it's buffer's pages into kernel address space. Do the opposite in
vunmap.

Note that dma-buf vmap differs from GEM vmap in how it handles relocation.
While dma-buf vmap keeps the buffer in place, GEM vmap requires the caller
to keep the buffer in place. Hence, this fix is in amdgpu's dma-buf code
instead of its GEM code.

A discussion of various approaches to solving the problem is available
at [1].

v3:
- try (GTT | VRAM); drop CPU domain (Christian)
v2:
- only use mapable domains (Christian)
- try pinning to domains in preferred order

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 660cd44659a0 ("drm/shmem-helper: Import dmabuf without mapping its sg_table")
Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
Closes: https://lore.kernel.org/dri-devel/ba1bdfb8-dbf7-4372-bdcb-df7e0511c702@suse.de/
Cc: Shixiong Ou <oushixiong@kylinos.cn>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Link: https://lore.kernel.org/dri-devel/9792c6c3-a2b8-4b2b-b5ba-fba19b153e21@suse.de/ # [1]
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 34 +++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 5743ebb2f1b7..ce27cb5bb05e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -285,6 +285,36 @@ static int amdgpu_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
 	return ret;
 }
 
+static int amdgpu_dma_buf_vmap(struct dma_buf *dma_buf, struct iosys_map *map)
+{
+	struct drm_gem_object *obj = dma_buf->priv;
+	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
+	int ret;
+
+	/*
+	 * Pin to keep buffer in place while it's vmap'ed. The actual
+	 * domain is not that important as long as it's mapable. Using
+	 * GTT and VRAM should be compatible with most use cases.
+	 */
+	ret = amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_GTT | AMDGPU_GEM_DOMAIN_VRAM);
+	if (ret)
+		return ret;
+	ret = drm_gem_dmabuf_vmap(dma_buf, map);
+	if (ret)
+		amdgpu_bo_unpin(bo);
+
+	return ret;
+}
+
+static void amdgpu_dma_buf_vunmap(struct dma_buf *dma_buf, struct iosys_map *map)
+{
+	struct drm_gem_object *obj = dma_buf->priv;
+	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
+
+	drm_gem_dmabuf_vunmap(dma_buf, map);
+	amdgpu_bo_unpin(bo);
+}
+
 const struct dma_buf_ops amdgpu_dmabuf_ops = {
 	.attach = amdgpu_dma_buf_attach,
 	.pin = amdgpu_dma_buf_pin,
@@ -294,8 +324,8 @@ const struct dma_buf_ops amdgpu_dmabuf_ops = {
 	.release = drm_gem_dmabuf_release,
 	.begin_cpu_access = amdgpu_dma_buf_begin_cpu_access,
 	.mmap = drm_gem_dmabuf_mmap,
-	.vmap = drm_gem_dmabuf_vmap,
-	.vunmap = drm_gem_dmabuf_vunmap,
+	.vmap = amdgpu_dma_buf_vmap,
+	.vunmap = amdgpu_dma_buf_vunmap,
 };
 
 /**
-- 
2.50.1


