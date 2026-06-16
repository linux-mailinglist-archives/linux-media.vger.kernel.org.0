Return-Path: <linux-media+bounces-65059-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bfOENOWTMWoMnQUAu9opvQ
	(envelope-from <linux-media+bounces-65059-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 20:20:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD1B6940B7
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 20:20:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=OsIYZBZq;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65059-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65059-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C21C63097243
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 18:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88B81477E33;
	Tue, 16 Jun 2026 18:20:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6BD36A36C
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 18:20:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781634009; cv=none; b=B/xyKMtemWOUFC9gzvmFLP+g7qNO1fH9hih9qu4AMfLKzTa92NCGPw/F8ktc8yScduD5XwUUTE9c3+UFruh8wfIa6IVYlDx5xRPtpr3Klw2locJit7nECw0E7XD6L86q3JMSke1WrqspFb0oSXBqUTeyQ3ehFYAvfhf6bZq4MuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781634009; c=relaxed/simple;
	bh=VsCW3uGhQYDZk9WiDRGdEyD+oXXhyDEM68SL+4Qr0Kw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sR1z6vfvW72imObkYvlScQqDR3YAn78utQY8uXoiALRzruEV2jT2E3Hy5GDqQl2gWiwHrW+At5cGryWzCMsFpXEclltm9PGTG/qDu/ln+SUFMTwQYrLR8RCZ7YTAQyMzovNC9u6dEpa0fpkhHyHj3o5J33PkBtNUvz9Nf5FLtq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OsIYZBZq; arc=none smtp.client-ip=209.85.216.54
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36bcbd7821fso2492927a91.2
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 11:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781634007; x=1782238807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UwpVureg07QbjRnL27mIYEGwVaOJw7DuUq/siGYlqU4=;
        b=OsIYZBZq8EOl6gGhtocVI5Ar4hjEKxeORa3W6yUcD3szPdwG8O8XYACfXE6+7h24XL
         PNdaaFrYtv4+iG/GehcoVoGuphUlBy3L56mBKu1trKJ/v6UksXukeXlkslpjor63/kDr
         +0t+vcrp80UyUkv7dQJtA31FsCimSgVmsMzv9SM/GjzJzMY3/cAR9Y3pBAjHW6os2bhA
         1ut3HUnKsZ3nswsCMVKWoNxGDtdodcgJh855+0xJJt/iIif8F7JyfbXBqvuVy5RbaKC1
         rTCuNpCR3bfYpV0gBxPnA5vThX0lstAuPE1Z9bAI7D1nEzETeDWMAu8gHk1kZSffLl+c
         GC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781634007; x=1782238807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwpVureg07QbjRnL27mIYEGwVaOJw7DuUq/siGYlqU4=;
        b=ZkijV+f9cVhgqVDGQRcXz3SjdvHi7Dzjw+M1E3lYTh6LnohEhKxu3nHJoGka9AB/fq
         04pG1H+anqlOngV1IgtE6vrDhhakfF2MXofA5AoQJBLbfL9bIaIr5UHGadYzyylyHDtG
         nlE8N6R9jORyP2oCv7dDKUevlkUqQfIJF8TPkFl+57Sa8PQ4ExEM/Bzzh4ekX9QDe4qj
         m4eLzs7YL37JibPBD/D420gfN0LI+AuGQrQFSNRkQiSlelxN1WLa3D/a9evzeBzEA+2h
         yNZGCdOEjQl8VIZx1Vh5AeKKMJWHn1d7OzMMHktQweE3vVCtCq1kDlVcH3Qeo7HkiobV
         JV+Q==
X-Forwarded-Encrypted: i=1; AFNElJ9HneZXxMtSMN5NqnTOD8m5OzHuxVGOV3/CRElkman0GL0O1aa/HdH8hZM4IyhVNct4S9CUU0O3UhU4ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUhJ0QKdIadnDIY93J8F3dQB7MnISpHMcF6gw/v4wLyckKs9FC
	5ezkXh4CZGxLSsvF8OYb+efEUEp7mbSXOdjoKbUbduiv4TYWlIAV/duG
X-Gm-Gg: AfdE7cl0BXjsV/qId51Z0smSWNmXO1ZLfkOMaJ04MPPDi5zQtWk/FGpU5/P3iwookSN
	BPoYkXu/BuhwXMrz13txKwdIr4Mpx2vJCWduu5IA/V9dV/qIlkTBD/x7jf+fdPHQq5BmGZ0gUX6
	17vHeO7wevy+13SHs22k92pyoBZkZOqhRnovu3CyQf+xU5lIG0bCKsjYSHRPm+X2l9BT7TFFhKd
	YFM7vBIYErD7VUA/Hd17NN1OpPjtLgQKZ1K/kdYn8U+JZDhhvXmYfGba/0xHp3o5IF5Sq6IcKj/
	EcNcYuQN/GnQnxVrQd6dt+trgvwkpMs9GlvooQH9UVT8sTA4QPLyThhdPcdU90srlc4KbnfHg/D
	jc5FOGIbEV5LgTs8nneEoTYNNnWustBPhl7AoZq6w3UqvDL1cl0gZFlTIqBkfE8GO4KAe0wjzAz
	IZ+RBNrLx3st7nRZXdezwtP+1RXl7SMkj2AeUNuNm8AGVZGpnhGa06C+2tGi2fBuM=
X-Received: by 2002:a17:90b:4ac7:b0:36b:7c2a:263e with SMTP id 98e67ed59e1d1-37c9e9d408dmr178965a91.20.1781634007158;
        Tue, 16 Jun 2026 11:20:07 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521ef803sm3605560a91.11.2026.06.16.11.20.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 16 Jun 2026 11:20:06 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH] drm/gem: modernize locks to use scoped_guard()
Date: Tue, 16 Jun 2026 23:49:57 +0530
Message-ID: <20260616181956.61476-2-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-65059-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:birenpandya@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8DD1B6940B7

Several GEM core functions manually managed mutex_lock() and
mutex_unlock() over single scopes or error paths. This adds boilerplate
and carries the risk of lock leaks if error paths are refactored.

Modernize these locks by deploying the <linux/cleanup.h> scoped_guard()
macro. This ensures that the locks are reliably dropped when the block
exits, cleanly removing goto out_unlock paths and tightening the
lifecycle.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>

Compiled locally, but requires IGT validation by the DRM CI.
---
 drivers/gpu/drm/drm_gem.c | 66 ++++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 891c3bff5ae0..d3a061d42ba7 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -346,13 +346,13 @@ void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
 	 * we checked for a name.
 	 */
 
-	mutex_lock(&dev->object_name_lock);
-	if (--obj->handle_count == 0) {
-		drm_gem_object_handle_free(obj);
-		drm_gem_object_exported_dma_buf_free(obj);
-		final = true;
+	scoped_guard(mutex, &dev->object_name_lock) {
+		if (--obj->handle_count == 0) {
+			drm_gem_object_handle_free(obj);
+			drm_gem_object_exported_dma_buf_free(obj);
+			final = true;
+		}
 	}
-	mutex_unlock(&dev->object_name_lock);
 
 	if (final)
 		drm_gem_object_put(obj);
@@ -374,11 +374,8 @@ drm_gem_object_release_handle(int id, void *ptr, void *data)
 	if (obj->funcs->close)
 		obj->funcs->close(obj, file_priv);
 
-	mutex_lock(&file_priv->prime.lock);
-
-	drm_prime_remove_buf_handle(&file_priv->prime, id);
-
-	mutex_unlock(&file_priv->prime.lock);
+	scoped_guard(mutex, &file_priv->prime.lock)
+		drm_prime_remove_buf_handle(&file_priv->prime, id);
 
 	drm_vma_node_revoke(&obj->vma_node, file_priv);
 
@@ -1021,37 +1018,34 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
 		goto out;
 	}
 
-	mutex_lock(&file_priv->prime.lock);
+	scoped_guard(mutex, &file_priv->prime.lock) {
+		spin_lock(&file_priv->table_lock);
+		ret = idr_alloc(&file_priv->object_idr, obj, handle, handle + 1,
+				GFP_NOWAIT);
+		spin_unlock(&file_priv->table_lock);
 
-	spin_lock(&file_priv->table_lock);
-	ret = idr_alloc(&file_priv->object_idr, obj, handle, handle + 1,
-			GFP_NOWAIT);
-	spin_unlock(&file_priv->table_lock);
+		if (ret < 0)
+			break;
 
-	if (ret < 0)
-		goto out_unlock;
+		if (obj->dma_buf) {
+			ret = drm_prime_add_buf_handle(&file_priv->prime, obj->dma_buf,
+						       handle);
+			if (ret < 0) {
+				spin_lock(&file_priv->table_lock);
+				idr_remove(&file_priv->object_idr, handle);
+				spin_unlock(&file_priv->table_lock);
+				break;
+			}
 
-	if (obj->dma_buf) {
-		ret = drm_prime_add_buf_handle(&file_priv->prime, obj->dma_buf,
-					       handle);
-		if (ret < 0) {
-			spin_lock(&file_priv->table_lock);
-			idr_remove(&file_priv->object_idr, handle);
-			spin_unlock(&file_priv->table_lock);
-			goto out_unlock;
+			drm_prime_remove_buf_handle(&file_priv->prime, args->handle);
 		}
 
-		drm_prime_remove_buf_handle(&file_priv->prime, args->handle);
-	}
-
-	ret = 0;
-
-	spin_lock(&file_priv->table_lock);
-	idr_remove(&file_priv->object_idr, args->handle);
-	spin_unlock(&file_priv->table_lock);
+		ret = 0;
 
-out_unlock:
-	mutex_unlock(&file_priv->prime.lock);
+		spin_lock(&file_priv->table_lock);
+		idr_remove(&file_priv->object_idr, args->handle);
+		spin_unlock(&file_priv->table_lock);
+	}
 out:
 	drm_gem_object_put(obj);
 

base-commit: 72c25183cac9bc584c9de21797a5883af44bcc7a
-- 
2.50.1 (Apple Git-155)


