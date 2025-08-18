Return-Path: <linux-media+bounces-40174-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE098B2AC81
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 17:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7A3D7B01FB
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 15:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E4B255F5E;
	Mon, 18 Aug 2025 15:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Os6WKQEs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y1dcXw5g";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="THw06Wya";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Eu8Vdq0f"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31A924C07F
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 15:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755530405; cv=none; b=rDWM4xg0CzXbXclDnp5M91/HFWpy485a/cnwQiW8berz8jVL6yTrMQSOJnokyaS91gMJBGJ/DzxIQn82ShQOES3VJGntDiX7tv0te7dLk1tK57IIcNDx7h2A4h7Dpox80IudqKlqnXl+XYqG5K9gm+DCj3nbTzPjTFoRgcrRXJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755530405; c=relaxed/simple;
	bh=5z5dg2VCQqPfDYCibg7edaaz/hvO13XB8wDZ+QAdkvw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XdYWC54qUSSCI5NLwhBvkwY4mPiNafTUdtXN76GT9xSlBTCNjGc8RWXUtrv34BY7sH5LdcuzrHkRqJMe+w/2DCdo8vul6hz5LJPaA9ZMv7c1crjyTABixyVvxO6p3SPmStISmbOjVNFy7jxNi4ZIYy6rsqrd7BwGSDH8d/Xx+DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Os6WKQEs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y1dcXw5g; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=THw06Wya; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Eu8Vdq0f; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C6CC81F387;
	Mon, 18 Aug 2025 15:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755530402; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gTGZcbGAhtvP7tJl3ZoYm8rrknDDxNGavt/SiFlcvKo=;
	b=Os6WKQEslxwsA6G1+OlI0E+uK+XzSJyiBTEnWaLfUOjt8uTf4cuHmBCCA/gZwD6yfKJV6H
	1nXurn8lxbgQHQcjf079fIt+EVQsYeLDp+nh7v3zADonYYVZF8RPm8gWIHSzBn+SrFdS4U
	cKd3imiwsvkT6FRHtp/fKcrQaan154I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755530402;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gTGZcbGAhtvP7tJl3ZoYm8rrknDDxNGavt/SiFlcvKo=;
	b=y1dcXw5g1GE6xfu2POqaDgkZi+cdTx+mddRRmrhGjxJJNeNPqxkTNEzX9xaJ1TVigmgzlH
	TW8CzdRc0ddcqCCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=THw06Wya;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Eu8Vdq0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755530401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gTGZcbGAhtvP7tJl3ZoYm8rrknDDxNGavt/SiFlcvKo=;
	b=THw06WyaVXwVwYexR54jkB62f+ewjw2T25y8UiooHJSCKLwgaUsS8abPo2WVFvtnSMO18w
	uFA2VFYp/woG2JFIB778brbxCroAVqj6mDeJKE2pHg2M9WjYpKHZ/UXHih6af2Dd1otZCl
	fMSXSfTXcfxd9ya/QgGBdXMxIgXtUqE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755530401;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gTGZcbGAhtvP7tJl3ZoYm8rrknDDxNGavt/SiFlcvKo=;
	b=Eu8Vdq0fwoYKK/tCwXXBwcwnVa+V8rwf5u1lsO64zTAcNYDNZ/ec2DN5I0Mp1GKyGpM1l3
	AuY59Ey5GrOuS/CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 68EEB13A55;
	Mon, 18 Aug 2025 15:20:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id L0ltGKFEo2hGLwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 18 Aug 2025 15:20:01 +0000
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
Subject: [PATCH v2] drm/amdgpu: Pin buffers while vmap'ing exported dma-buf objects
Date: Mon, 18 Aug 2025 17:17:05 +0200
Message-ID: <20250818151710.284982-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[linaro.org,amd.com,kylinos.cn,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,amd.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,intel.com:email,suse.de:mid,suse.de:dkim,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: C6CC81F387
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51

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

v2:
- only use mapable domains (Christian)
- try pinning to domains in prefered order

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
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 41 ++++++++++++++++++++-
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 5743ebb2f1b7..471b41bd3e29 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -285,6 +285,43 @@ static int amdgpu_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
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
+	 * GTT should be compatible with most use cases. VRAM and CPU
+	 * are the fallbacks if the buffer has already been pinned there.
+	 */
+	ret = amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_GTT);
+	if (ret) {
+		ret = amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_VRAM);
+		if (ret) {
+			ret = amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_CPU);
+			if (ret)
+				return ret;
+		}
+	}
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
@@ -294,8 +331,8 @@ const struct dma_buf_ops amdgpu_dmabuf_ops = {
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


