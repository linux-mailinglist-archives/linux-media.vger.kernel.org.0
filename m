Return-Path: <linux-media+bounces-61798-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODaFG8JQCGoMjAMAu9opvQ
	(envelope-from <linux-media+bounces-61798-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 13:10:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA5755B5F5
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 13:10:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02EE1303F2B3
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 11:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BF493D7D9F;
	Sat, 16 May 2026 11:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZEVIFNy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D433D6CC6
	for <linux-media@vger.kernel.org>; Sat, 16 May 2026 11:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778929623; cv=none; b=E6NiehwdUTBzGw/mjA3/+lMcCnHGNPxTHfzJxuiOav4tzU9lR2XmZe5IP3+YUcax5BqtUCy64DziWdu2dX5Ghbyyiw11NpQ1YodS0MdfhbFiC2YFaexL5F+h7uiqqAl6frPOA856PXt8ZCb4TkBOfxeTs4Q4bqwcDjaoZHKBffo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778929623; c=relaxed/simple;
	bh=gccEkxb9Fgxq3kICRGFzS2yuH2T+EBoB3hEcASoUfk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AborGH3OL0V5b9eXWxr/j8d7PQjjjM2CMDl7TxCZFtZe/CvPsLssA8bvSUvq3kges6HaTQoISuv2qEjKdD0vuH8taQGCoiuiTSNXJ3lRRX4uD+dzm7xOO5ANZZzApipMI47kQSxcfdoD7FWwoyAmx5hq2igbqs1xMW2r67gwBFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZEVIFNy; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43fe608cb92so324005f8f.2
        for <linux-media@vger.kernel.org>; Sat, 16 May 2026 04:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778929618; x=1779534418; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mZxaw3u6g9gSQgxhivb/aQTd6ZH6WM8J0IbrlUd06os=;
        b=GZEVIFNyXzBrJZH8agXuIgpikeppwWAlOjbWAop6q2/OCcKQ2pInJjZb5VyghaXLFw
         8at78ujSh/yhjy8e/2kBfbJ8/9p5sMbnVKitoVsjBKkj2VtjSVSolS5QzR11CL+ttgfI
         xxcMmJ6hxkQSnQxUJQDDKvl08c8tzKrDBV5sqVuL2VbVgRYcOTKig6HJigQXMbNwGppz
         MeiCETWq9exFIn0sCv3TiQDtuCeNStwHST0vREwJo6rPyTnKSJpmkCiffZi5VRfPZR7r
         vMAtyKPoRLylB7JOfZGXLV7TlJveAd/EDW4AbweEcN4TZnR9fBM4CXUmHCeNNXon8ReW
         UNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778929618; x=1779534418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mZxaw3u6g9gSQgxhivb/aQTd6ZH6WM8J0IbrlUd06os=;
        b=rEDsm1RWlwHNLx0jZRFI0q2PaizFWL45KasD31YrCNz+675d2jqTozCWnIT+qmPVds
         SMEDcobasjsaTogMHFJ7A6gs/xrxPtQXXtxPacs7FSuzhbY04N9udD2rKLIr7idI/as5
         0vQsHYerjOCUG/e2sePh8h8tFdhR2A4rO8tiYwvzL5ASyJo6v6zs914s7CgOn5N1kwpq
         73W/uxl0buPD3JZ3/maIvx2TJNEnrgRBGi00sd+DTKKha3Xkjd+qfUizW/S6ByeIQz5o
         dmaWDowEvgnF8lrLspFDrsqd3GD2x/yfPekyeP/lV8XK0i5AnIN5RD/rb5u+J2x1EqbR
         fdjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Aih8bYMtWEXDEi+QGFcpshYUkfont2aKA3a31knn6+ykwju9bUJ5PG/KM3wTAgaqzPQNJE0pXul99DA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz83WyZmhiO6ZgxrqlWixUbHRCvB0R+VXB97KaibBpreSqpVz7r
	UyjBb+M+ULkQupjYn4nPYjOn2I0KGhA6aLp9APRenlp9Yf5YeedvBRsSTMYNYKA2
X-Gm-Gg: Acq92OG7wlrrPZUOlpRp58sbY6Pi854AxpZXcRVSoMPWpuAvTtxxuLak9OkQ6hAUdic
	O2BUkD9s+aV8hy2HmiEN3GKxwQItDmnkgS5p5KcIadWZN0RdV3HGyFmCn3wP+N6eayrQYZTHzwa
	ldRppwJMBbeRKfGY6yD7p2U9r7puau7p8Wa5VDHOeBPPsA5MWVRu9ouVFEWc+8KomMukwCvKBap
	grfGo6C1jtV+82FfplWXwnRyGA8ejXH09WrcSBKV9BRS76Ie2DKyzRfFDuLVKIjduhI5s0ft6Dc
	SslCyukLD8aKrEKkijesYOJTUmG3qTpNV8nuC2yR232ILgzx+6+tqOpnNJMGIP4h2HCbabqAMb5
	tqVyjtT5tVoTXBbDxZ2dfrY8JXEjv17z9Fbdu3EwCaKLGALmYy3VaBkhgm/cjSpDYXf8mT9EqJQ
	JnBpjqbt2Pzr/iKDuqWykWK0Gu3qGLoS8cWId/QS/P+xDxemBgGbKpgHp6C8PQiUQGM3Z7Z6ILB
	BQR0RLC8wO0ef+gOw==
X-Received: by 2002:a05:600c:2d09:b0:48f:e1ac:c96d with SMTP id 5b1f17b1804b1-48fe61f2bcemr60030905e9.20.1778929617614;
        Sat, 16 May 2026 04:06:57 -0700 (PDT)
Received: from [10.13.0.20] (ip87-106-117-14.pbiaas.com. [87.106.117.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb00e5easm36399545e9.13.2026.05.16.04.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:06:57 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
Date: Sat, 16 May 2026 13:06:13 +0200
Subject: [PATCH 10/12] drm/syncobj: add drm_syncobj_import_sync_file
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-jorth-syncobj-v1-10-88ede9d98a81@gmail.com>
References: <20260516-jorth-syncobj-v1-0-88ede9d98a81@gmail.com>
In-Reply-To: <20260516-jorth-syncobj-v1-0-88ede9d98a81@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 linux-doc@vger.kernel.org, wayland-devel@lists.freedesktop.org, 
 ju.orth@gmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778929602; l=2792;
 i=ju.orth@gmail.com; s=20251120; h=from:subject:message-id;
 bh=gccEkxb9Fgxq3kICRGFzS2yuH2T+EBoB3hEcASoUfk4=;
 b=LfciDdq+01NiK3gXOUbCymlEM3K+nuuGo3VhuhjLND4T9QDwYUXe2UHMMsjDrtokyTzc+edKE
 S+PE8qGatMuDQ8hyiPBhAhZK6ObHL0ljbFX8Do8xYlPgTokSZvXJnCB
X-Developer-Key: i=ju.orth@gmail.com; a=ed25519;
 pk=uM2SS4lelkuIoYHc7v9N9bgBZ3hS632zJS2xjRJLPLI=
X-Rspamd-Queue-Id: 0BA5755B5F5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61798-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lwn.net,linuxfoundation.org,arndb.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,lists.linaro.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[juorth@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

This makes the logic from drm_syncobj_import_sync_file_fence available
to callers that have a drm_syncobj instead of a drm_file/handle pair.

Signed-off-by: Julian Orth <ju.orth@gmail.com>
---
 drivers/gpu/drm/drm_syncobj.c | 35 ++++++++++++++++++++++++++---------
 include/drm/drm_syncobj.h     |  2 ++
 2 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 1da96e23dfc0..4c1667c67cb7 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -765,19 +765,37 @@ static int drm_syncobj_fd_to_handle(struct drm_file *file_private,
 static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
 					      int fd, int handle, u64 point)
 {
-	struct dma_fence *fence = sync_file_get_fence(fd);
 	struct drm_syncobj *syncobj;
 	int ret = 0;
 
+	syncobj = drm_syncobj_find(file_private, handle);
+	if (!syncobj)
+		return -ENOENT;
+
+	ret = drm_syncobj_import_sync_file(syncobj, fd, point);
+
+	drm_syncobj_put(syncobj);
+
+	return ret;
+}
+
+/**
+ * drm_syncobj_import_sync_file - import a sync_file fd into a syncobj
+ * @syncobj: syncobj to import into
+ * @fd: sync_file file descriptor
+ * @point: timeline point or 0
+ *
+ * Returns 0 on success or a negative error value on failure.
+ */
+int drm_syncobj_import_sync_file(struct drm_syncobj *syncobj,
+				 int fd, u64 point)
+{
+	struct dma_fence *fence = sync_file_get_fence(fd);
+	int ret = 0;
+
 	if (!fence)
 		return -EINVAL;
 
-	syncobj = drm_syncobj_find(file_private, handle);
-	if (!syncobj) {
-		ret = -ENOENT;
-		goto err_syncobj;
-	}
-
 	if (point) {
 		struct dma_fence_chain *chain = dma_fence_chain_alloc();
 
@@ -792,11 +810,10 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
 	}
 
 err:
-	drm_syncobj_put(syncobj);
-err_syncobj:
 	dma_fence_put(fence);
 	return ret;
 }
+EXPORT_SYMBOL(drm_syncobj_import_sync_file);
 
 static int drm_syncobj_export_sync_file(struct drm_file *file_private,
 					int handle, u64 point, int *p_fd)
diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h
index da237ca3e61f..1571ffa12a5c 100644
--- a/include/drm/drm_syncobj.h
+++ b/include/drm/drm_syncobj.h
@@ -143,6 +143,8 @@ int drm_syncobj_timeline_signal(struct drm_syncobj **syncobjs,
 				u64 user_points, u32 count);
 int drm_syncobj_query(struct drm_syncobj **syncobjs, u64 user_points,
 		      u32 count, u32 flags);
+int drm_syncobj_import_sync_file(struct drm_syncobj *syncobj,
+				 int sync_file_fd, u64 point);
 void drm_syncobj_free(struct kref *kref);
 int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
 		       struct dma_fence *fence);

-- 
2.54.0


