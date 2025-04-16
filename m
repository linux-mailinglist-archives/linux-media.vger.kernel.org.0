Return-Path: <linux-media+bounces-30261-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28740A8A09C
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 16:06:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B6A316BD13
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 14:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D0F1A262A;
	Tue, 15 Apr 2025 14:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fAuP/uqC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BU6c6Ubx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="H7gbCJ+V";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5SsZL6pq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A1B126C02
	for <linux-media@vger.kernel.org>; Tue, 15 Apr 2025 14:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725994; cv=none; b=aqfNag/iAUdbiiemBGqXdDBpCMxt8K0tUElxIp0bqrDmWLTVTJ7VQF22DsNqWBas2yXbJOK0ZiQMBbzjffBLQ3YT+6SGLbD/MphosKrWVbtru5Jbmwmavg+oeDVvVzckiJvSCWjjyXnVlVWVmZ3H71zEXS3dGVwrhzOJzn9cCgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725994; c=relaxed/simple;
	bh=UYJ+JiHcePriEpsMERLxW1GDQDDpN+Kewz0puE+HTaY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=s/mUL9zy64nIh/aw2lgpuVrG6zy4f30mwp/m8WX5lUtZXwg9rJla4vmxUk9TXsH1/1DKW/Iz5x+EsqOiKQJ6KeVHpTA1ncmtVs4JUxYJJH6iHNxEcdG9EFmqLMZN88mZRouPwRkldS7csXs3X9jRwzrpvw+rJM6623ry+JhKGwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fAuP/uqC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BU6c6Ubx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=H7gbCJ+V; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5SsZL6pq; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DAF3C1F38A;
	Tue, 15 Apr 2025 14:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744725991; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jiZileAmCpzc0/USvSNYQ0e5z2UcSzk1rG28zMxxz2w=;
	b=fAuP/uqCwYRn+k0f0fQLuxSV04UEkPG1i/ry/zJrNhkmdJWDQEHCdt0WebgYg3/EzEErPY
	YnY9ZvaHY0afl4nd3cFH15mSg9tu6aD+fokyUX+JsfIPqQ5Vmj5bhMHvxkGp2MRdlcWkYC
	Z6zG6SEjk6hLEkrkKUUQ59oeeakbM/E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744725991;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jiZileAmCpzc0/USvSNYQ0e5z2UcSzk1rG28zMxxz2w=;
	b=BU6c6UbxMJO04tLPJ+9WNy1/n9sO+GfbLEBZkwarKnuN71CakbllbBEyhMT03CqIE2o88V
	cLVn9/Jk6OhA0cDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744725990; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jiZileAmCpzc0/USvSNYQ0e5z2UcSzk1rG28zMxxz2w=;
	b=H7gbCJ+VcQML1QO6G0NxUAYf7nhy2nnB6AbLssfIIuikUJhaVMBDnIweWK+mlQXXeuMQtk
	kT/Pk4QnB4VqRoq1iRBcNsJL7qkw6Zy+XWdDbGXHphCPK15erNzybD4Zy75w7N9PfNoqKQ
	Cpa8cfL3PxSQWnDxr+7qENTsRWcwH8U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744725990;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jiZileAmCpzc0/USvSNYQ0e5z2UcSzk1rG28zMxxz2w=;
	b=5SsZL6pqcsStaZvbrS7+VvC3d+89r9IlGMxYXbTIy5HRyKAOkaQem5cnhdCoxBTbQJg8DO
	vOucglOELAxpYnBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 856CA139A1;
	Tue, 15 Apr 2025 14:06:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gFVbH+Zn/mcMNAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 15 Apr 2025 14:06:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch,
	airlied@gmail.com,
	asrivats@redhat.com,
	andyshrk@163.com,
	christian.koenig@amd.com,
	boris.brezillon@collabora.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH v2] drm/gem: Internally test import_attach for imported objects
Date: Tue, 15 Apr 2025 16:02:20 +0200
Message-ID: <20250415140256.299550-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com,163.com,amd.com,collabora.com,kernel.org,linux.intel.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,suse.de:email,suse.de:mid,amd.com:email,imap1.dmz-prg2.suse.org:helo,intel.com:email]
X-Spam-Score: -3.30
X-Spam-Flag: NO

Test struct drm_gem_object.import_attach.dmabuf to detect imported
objects. Warn if the stored state is inconsistent.

During object clenaup, the dma_buf field might be NULL. Testing it in
an object's free callback then incorrectly does a cleanup as for native
objects. Happens for calls to drm_mode_destroy_dumb_ioctl() that
clears the dma_buf field in drm_gem_object_exported_dma_buf_free().

v2:
- use import_attach.dmabuf instead of dma_buf (Christian)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: b57aa47d39e9 ("drm/gem: Test for imported GEM buffers with helper")
Reported-by: Andy Yan <andyshrk@163.com>
Closes: https://lore.kernel.org/dri-devel/38d09d34.4354.196379aa560.Coremail.andyshrk@163.com/
Tested-by: Andy Yan <andyshrk@163.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Anusha Srivatsa <asrivats@redhat.com>
Cc: Christian König <christian.koenig@amd.com>
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
 include/drm/drm_gem.h | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 9b71f7a9f3f8..464b9c7feec0 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -579,6 +579,21 @@ static inline bool drm_gem_object_is_shared_for_memory_stats(struct drm_gem_obje
 	return (obj->handle_count > 1) || obj->dma_buf;
 }
 
+/**
+ * drm_gem_owns_dma_buf() - Tests if GEM object backs a DMA-buffer object
+ * @obj: the GEM object
+ * @obj: the DMA buffer
+ *
+ * Returns:
+ * True if the DMA buffer refers to the GEM object's buffer.
+ */
+static inline bool drm_gem_owns_dma_buf(const struct drm_gem_object *obj,
+					const struct dma_buf *dma_buf)
+{
+	/* The dma-buf's priv field points to the original GEM object. */
+	return dma_buf->priv == obj;
+}
+
 /**
  * drm_gem_is_imported() - Tests if GEM object's buffer has been imported
  * @obj: the GEM object
@@ -588,8 +603,15 @@ static inline bool drm_gem_object_is_shared_for_memory_stats(struct drm_gem_obje
  */
 static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
 {
-	/* The dma-buf's priv field points to the original GEM object. */
-	return obj->dma_buf && (obj->dma_buf->priv != obj);
+	const struct dma_buf *dma_buf = NULL;
+
+	if (!obj->import_attach)
+		return false;
+
+	dma_buf = obj->import_attach->dmabuf;
+
+	/* Warn if we somehow reimported our own buffer. */
+	return !drm_WARN_ON_ONCE(obj->dev, !dma_buf || drm_gem_owns_dma_buf(obj, dma_buf));
 }
 
 #ifdef CONFIG_LOCKDEP
-- 
2.49.0


