Return-Path: <linux-media+bounces-39870-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38653B25DCB
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 09:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED1B23B1B45
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 07:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC4726E16F;
	Thu, 14 Aug 2025 07:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xsDGl5TW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RrhR5OAg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2FH1at0u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gkp2E0Y6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68E526AA88
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 07:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755157081; cv=none; b=nTIXzJlBwt5vL3R7LZ0DUwfwf17uWGQPmpsRXLn0GAW0j3iekSEXpWHIRI5iPGSTiuJKabADooYkb7DnZXkvQHtcW4J43s0/rc/dqwc2JMEjrZMPaJF9SgLjFLikCozl05nhOIwN0RItDnb5vTFpB1sC0QZkCnan0msuFuAog4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755157081; c=relaxed/simple;
	bh=4VmF+6MNMwQFn0EsK+329WN2rtE0p/jt7lyiIjQqpBc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hTUXE758M1LZcP8O7FI9krwp1uars+IP2wcz0y3T85ubELA9+6STRfWbbjBmFBAVBq8pM+00HiN32axWiblrVC7VI18Ll3/jQlfxVeUNrf2I9BnT8yBeumztNMglZHtNWWmDGQuhord4ROAefN0j/KqqbrYI0OIxTR6JbpWRqWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xsDGl5TW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RrhR5OAg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2FH1at0u; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gkp2E0Y6; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C969C21ABE;
	Thu, 14 Aug 2025 07:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755157076; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RI1dCO7X86AGd1N6BFTrqVf06Ye+7aZi9kRrQeTTn2U=;
	b=xsDGl5TW6eZsKFnFi9+Tv8+u+Q28neFLAnDZii9NvDKcZp9SnYA0rYWmgkodRfyOWk7682
	NQIvOs8Z4GDd3XlxLRnNjj3zyw1rFK9K4bs2yVdLfv+/8d8HtIikOQcNq8wGoQ3C4AetvZ
	9ZpPnhov5dwXYcXSc060wQHvg0yo858=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755157076;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RI1dCO7X86AGd1N6BFTrqVf06Ye+7aZi9kRrQeTTn2U=;
	b=RrhR5OAgYVoHcppnCMpYGhgtdWXZm6F8wyhS3thhCSaptuWE1wEz98QgMcUB1vGgZ+yqWm
	2QYwkkfqEthle/Bg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=2FH1at0u;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gkp2E0Y6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755157075; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RI1dCO7X86AGd1N6BFTrqVf06Ye+7aZi9kRrQeTTn2U=;
	b=2FH1at0uaXWmpAxONgdOUy4p0TaJpc+1kXZegVnlxOsIVB/Jy6JshKNDeTy62WvLAUBCuT
	SMcEKsOa/85d5zKnCVCgSXY2+0bkdGQJl6Q1WDp2I5jRBcVQqcEhKquiydtldNMmDYcrLx
	hFFmxepiJka+Jm2F5BhKOnMkMnk2ImE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755157075;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RI1dCO7X86AGd1N6BFTrqVf06Ye+7aZi9kRrQeTTn2U=;
	b=gkp2E0Y6a+M0R2OtYitvuT/2iOiW1mhQaeN/YH8nxVZ9fv4hhxYR1XEkIhPLiSqBKQwy8a
	NOlbwDU3gkUhVDAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7834A136AE;
	Thu, 14 Aug 2025 07:37:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0HMnHFOSnWhiAQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 14 Aug 2025 07:37:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	oushixiong@kylinos.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/gem-shmem: Pin and unpin buffers when importing w/o S/G table
Date: Thu, 14 Aug 2025 09:34:30 +0200
Message-ID: <20250814073507.18587-1-tzimmermann@suse.de>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,amd.com,kylinos.cn,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,amd.com:email,ffwll.ch:email,suse.de:mid,suse.de:dkim,suse.de:email,intel.com:email,kylinos.cn:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: C969C21ABE
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51

Imported dma-buf objects need to be pinned while being vmap'ed into
kernel address space. This used to be done before while creating an
S/G table.

GEM-SHMEN can import dma-buf objects without creating the S/G table,
but the pin/unpin is now missing. Leads to page-mapping errors such
as the one shown below.

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

Support pin/unpin in drm_buf_map_attachment() without creating an S/G
table. Passing DMA_NONE for the DMA direction will only pin. Do the
inverse for unmap_attachment(). Modify GEM-SHMEM accordingly, so that
it pins the imported dma-buf.

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
---
 drivers/dma-buf/dma-buf.c              | 16 +++++++++++++---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 11 ++++++++++-
 drivers/gpu/drm/drm_prime.c            |  2 ++
 3 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 2bcf9ceca997..f1e1385ce630 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1086,7 +1086,8 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_unpin, "DMA_BUF");
  * @direction:	[in]	direction of DMA transfer
  *
  * Returns sg_table containing the scatterlist to be returned; returns ERR_PTR
- * on error. May return -EINTR if it is interrupted by a signal.
+ * on error. May return -EINTR if it is interrupted by a signal. Returns NULL
+ * on success iff direction is DMA_NONE.
  *
  * On success, the DMA addresses and lengths in the returned scatterlist are
  * PAGE_SIZE aligned.
@@ -1122,6 +1123,8 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 		if (ret)
 			return ERR_PTR(ret);
 	}
+	if (!valid_dma_direction(direction))
+		return NULL; /* only pin; don't map */
 
 	sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
 	if (!sg_table)
@@ -1216,14 +1219,21 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
 {
 	might_sleep();
 
-	if (WARN_ON(!attach || !attach->dmabuf || !sg_table))
+	if (WARN_ON(!attach || !attach->dmabuf))
 		return;
 
 	dma_resv_assert_held(attach->dmabuf->resv);
 
+	if (!valid_dma_direction(direction))
+		goto unpin;
+
+	if (WARN_ON(!sg_table))
+		return;
+
 	mangle_sg_table(sg_table);
 	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
 
+unpin:
 	if (dma_buf_pin_on_map(attach))
 		attach->dmabuf->ops->unpin(attach);
 }
@@ -1245,7 +1255,7 @@ void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
 {
 	might_sleep();
 
-	if (WARN_ON(!attach || !attach->dmabuf || !sg_table))
+	if (WARN_ON(!attach || !attach->dmabuf))
 		return;
 
 	dma_resv_lock(attach->dmabuf->resv, NULL);
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 5d1349c34afd..1b66501420d3 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -817,6 +817,7 @@ struct drm_gem_object *drm_gem_shmem_prime_import_no_map(struct drm_device *dev,
 							 struct dma_buf *dma_buf)
 {
 	struct dma_buf_attachment *attach;
+	struct sg_table *sgt;
 	struct drm_gem_shmem_object *shmem;
 	struct drm_gem_object *obj;
 	size_t size;
@@ -838,12 +839,18 @@ struct drm_gem_object *drm_gem_shmem_prime_import_no_map(struct drm_device *dev,
 
 	get_dma_buf(dma_buf);
 
+	sgt = dma_buf_map_attachment_unlocked(attach, DMA_NONE);
+	if (IS_ERR(sgt)) {
+		ret = PTR_ERR(sgt);
+		goto fail_detach;
+	}
+
 	size = PAGE_ALIGN(attach->dmabuf->size);
 
 	shmem = __drm_gem_shmem_create(dev, size, true, NULL);
 	if (IS_ERR(shmem)) {
 		ret = PTR_ERR(shmem);
-		goto fail_detach;
+		goto fail_unmap;
 	}
 
 	drm_dbg_prime(dev, "size = %zu\n", size);
@@ -853,6 +860,8 @@ struct drm_gem_object *drm_gem_shmem_prime_import_no_map(struct drm_device *dev,
 
 	return &shmem->base;
 
+fail_unmap:
+	dma_buf_unmap_attachment_unlocked(attach, sgt, DMA_NONE);
 fail_detach:
 	dma_buf_detach(dma_buf, attach);
 	dma_buf_put(dma_buf);
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 43a10b4af43a..b3b070868e3b 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -1109,6 +1109,8 @@ void drm_prime_gem_destroy(struct drm_gem_object *obj, struct sg_table *sg)
 	attach = obj->import_attach;
 	if (sg)
 		dma_buf_unmap_attachment_unlocked(attach, sg, DMA_BIDIRECTIONAL);
+	else
+		dma_buf_unmap_attachment_unlocked(attach, NULL, DMA_NONE);
 	dma_buf = attach->dmabuf;
 	dma_buf_detach(attach->dmabuf, attach);
 	/* remove the reference */
-- 
2.50.1


