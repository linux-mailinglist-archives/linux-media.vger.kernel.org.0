Return-Path: <linux-media+bounces-61793-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCMLEy1QCGoMjAMAu9opvQ
	(envelope-from <linux-media+bounces-61793-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 13:08:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B815855B545
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 13:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FF133020D79
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 11:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205D73D3D08;
	Sat, 16 May 2026 11:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZtMW+jR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168853D6467
	for <linux-media@vger.kernel.org>; Sat, 16 May 2026 11:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778929616; cv=none; b=loSqyLkBHs93f3OKxEcXOns6zZzqm9t9S9FqeraptOWoHsba+ztSdR2YSVTBvb7NCZl1JNMQU+hPMpqURZ+2AQAicrMHZSb6Tm5T7/xQ/bnVbholQ6ZuuUEZr1reQXWzNR8SRuOwloWevdSiadEQ/ldcHnh2ggU3f8SUjdlWkG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778929616; c=relaxed/simple;
	bh=E8KFRmAvFwSHl3US+f+37kFcs+Zh1TZlm/HDUacqWIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Neva29CkYIlozP4n5NI3+s6C44VuBEfzrDkccZ3Am9D1sVSJghD0WnJYhWyBa2q4/171Vb4DX35ll3F2waee/bWQxlQ6/JBQ6InlXVLYkuGOo7RmyQ47bRuZdploCOV0u5Fd4HXLPX3WYnogTcK6prlOCxGEBpBIH84W8Da232o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZtMW+jR; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48e56c1bf5dso2685175e9.3
        for <linux-media@vger.kernel.org>; Sat, 16 May 2026 04:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778929609; x=1779534409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3zYhR3PGwQ+MjR6b0xjhfz0ypo71/qwlvJbXPw+XJwc=;
        b=VZtMW+jRNzuN1xqRi/9dfl5+w4l7zTSYTKBbfiIQl3FZnvejChNyUYJd+6OdbNUb+3
         fWmslfgrvb3Imuu1td0P/wKWStPFvx6AFnJgkBwdY51V1D2J2pbUz5drHEkhHVlwUN+3
         YEvJYHfqGAdppErKk4TyfH00IgU3m/ilSrLAvymaEjJJiXXJBDDp+2c3tU1tdImp1iW/
         UU3vwiRUm22ZsWPEqyg3Z/wEjEg8VQpQIilsJyZER6CJsoq+W/qKMHAhpvs6XSVm1voa
         os7NbDePxXlkeTINvc0Y/s/R03+CgBgVDksiTYxSOOhLK6Z1C4nlGd+4ai/MX3mb0m6c
         YH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778929609; x=1779534409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3zYhR3PGwQ+MjR6b0xjhfz0ypo71/qwlvJbXPw+XJwc=;
        b=DufBaT/Gqi9x4UzYWgs4LTD1HEIme/mZumkdyX7U3AFyoBxfTxhPBAmCY9ZbV35YOo
         0R3g5M/aDlrQCMlBn/5keVHUNVkjU4oB3n07Ck9NaU+xAVBHG/ylG3bMJU+Dom28CnQh
         ZyqAKJgPpoJyIix5HB0zV1du3YZzcE5vlLEj4rvuE6tVzl1ygYk31G0d0a1OuIGILtFS
         zxes4zzgp1iixswv67xCN9ujRJH9hSmMiFMGPICu2cj6gy67RLhdMhvHcZjkXJb4MU8Z
         5MwNqIGcjPLC0ktArLDKhmT9Ail8HHrTNtQctpeSR2LP2y3qfzd8fvpUH1gnkrGOnfvA
         e8pw==
X-Forwarded-Encrypted: i=1; AFNElJ8LKK9OPPXWcUOTv7dilxKuepwk26YtY+MS4rZPAB40Hhlvmmncs8wYRzuU+LaKVt5lBspzdxQmJq9iWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSHcOEsbRfJUEQpJz/lG8Cw/ZDtc3bzg7AF19pt7zVviyZrEW9
	v/MDtBEZtgwApjiHGqK1hNW5giQYXwQyU4kxVUKUe6UDfADywzp4ir2ftSjcJo3Z
X-Gm-Gg: Acq92OEE2UCeLnehCaEGEZDBYFVyHGvMdjstmZUoZYrB0Y5gijDFavBCXAYWiX0HWcp
	i790gRwbaScAlJhg9y1jIrBgpP8MipmIpS5ggwkrPu2fjNVDdPBWlR5mIF5mISgFm2U7KOV3UE6
	BChhy0dFb3zXpZfuGiB11e0tBCPC2wM/2bEMlxE63jPoVVE7Isfi0D/FaNGGDYidGSL43bfRZPZ
	Cr9epZ7eJgAlQu0QV3cRT+D2mV1/llMZPoPjOBKjgrmX9ynJP6+kWHZ3wpQunzdix0djDNBLgxh
	dpMhUZfVCeqSEeMq6VoeD9RpGy7ZDsNVF0DobQEzCWnIRRJUKyuJjORJ9SLqeOyAUL9ygPOK6CG
	rapjbCReVZiKLJEJ+bB8LESvvXG1Ts0ON7R0EuEKqvWHLQ/0NLgJH971DPLsqeocXv8CN3nKZ4p
	YjT4kd5MkeOWFc9kQg6muLvfA8ZlBZQ/OGuroS4UQN9wdhOYCW3qmFgaIT7Dvne99XVksCjSD3U
	KXRI1A=
X-Received: by 2002:a05:600c:4e47:b0:488:a977:8de with SMTP id 5b1f17b1804b1-48fe61ed3b3mr113720245e9.16.1778929609523;
        Sat, 16 May 2026 04:06:49 -0700 (PDT)
Received: from [10.13.0.20] (ip87-106-117-14.pbiaas.com. [87.106.117.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb00e5easm36399545e9.13.2026.05.16.04.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:06:49 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
Date: Sat, 16 May 2026 13:06:07 +0200
Subject: [PATCH 04/12] drm/syncobj: add drm_syncobj_register_eventfd
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-jorth-syncobj-v1-4-88ede9d98a81@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778929602; l=3158;
 i=ju.orth@gmail.com; s=20251120; h=from:subject:message-id;
 bh=E8KFRmAvFwSHl3US+f+37kFcs+Zh1TZlm/HDUacqWIY=;
 b=bWpzKA+XEX3J2UNOYwj8QCncPGUIt1EclXXwvNyI/mmaQH21mYNpvhjIrkkFE7rAGXoJvJuvr
 uSj76PriSooBBU33M65Bq/uYq41w4a4tjHiYN/O/IE29Xyc6bLuV1Yr
X-Developer-Key: i=ju.orth@gmail.com; a=ed25519;
 pk=uM2SS4lelkuIoYHc7v9N9bgBZ3hS632zJS2xjRJLPLI=
X-Rspamd-Queue-Id: B815855B545
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
	TAGGED_FROM(0.00)[bounces-61793-lists,linux-media=lfdr.de];
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

This makes the logic from drm_syncobj_eventfd_ioctl available to callers
that already have a drm_syncobj.

Signed-off-by: Julian Orth <ju.orth@gmail.com>
---
 drivers/gpu/drm/drm_syncobj.c | 37 ++++++++++++++++++++++++++++++-------
 include/drm/drm_syncobj.h     |  2 ++
 2 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 648afd1f4fdd..3e8fb7e0cace 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1502,8 +1502,6 @@ drm_syncobj_eventfd_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_syncobj_eventfd *args = data;
 	struct drm_syncobj *syncobj;
-	struct eventfd_ctx *ev_fd_ctx;
-	struct syncobj_eventfd_entry *entry;
 	int ret;
 
 	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
@@ -1519,7 +1517,33 @@ drm_syncobj_eventfd_ioctl(struct drm_device *dev, void *data,
 	if (!syncobj)
 		return -ENOENT;
 
-	ev_fd_ctx = eventfd_ctx_fdget(args->fd);
+	ret = drm_syncobj_register_eventfd(syncobj, args->fd, args->point, args->flags);
+
+	drm_syncobj_put(syncobj);
+
+	return ret;
+}
+
+/**
+ * drm_syncobj_register_eventfd - register an eventfd for a syncobj
+ * @syncobj: sync object to add the eventfd to
+ * @ev_fd: eventfd file descriptor to signal
+ * @point: timeline point to wait for
+ * @flags: DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE or 0
+ *
+ * Registers an eventfd that will be signaled when the point is
+ * signaled or available.
+ *
+ * Returns 0 on success or a negative error value on failure.
+ */
+int drm_syncobj_register_eventfd(struct drm_syncobj *syncobj,
+				 int ev_fd, u64 point, u32 flags)
+{
+	struct eventfd_ctx *ev_fd_ctx;
+	struct syncobj_eventfd_entry *entry;
+	int ret;
+
+	ev_fd_ctx = eventfd_ctx_fdget(ev_fd);
 	if (IS_ERR(ev_fd_ctx)) {
 		ret = PTR_ERR(ev_fd_ctx);
 		goto err_fdget;
@@ -1532,20 +1556,19 @@ drm_syncobj_eventfd_ioctl(struct drm_device *dev, void *data,
 	}
 	entry->syncobj = syncobj;
 	entry->ev_fd_ctx = ev_fd_ctx;
-	entry->point = args->point;
-	entry->flags = args->flags;
+	entry->point = point;
+	entry->flags = flags;
 
 	drm_syncobj_add_eventfd(syncobj, entry);
-	drm_syncobj_put(syncobj);
 
 	return 0;
 
 err_kzalloc:
 	eventfd_ctx_put(ev_fd_ctx);
 err_fdget:
-	drm_syncobj_put(syncobj);
 	return ret;
 }
+EXPORT_SYMBOL(drm_syncobj_register_eventfd);
 
 int
 drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h
index 7677fd995be0..85e7ca7f7896 100644
--- a/include/drm/drm_syncobj.h
+++ b/include/drm/drm_syncobj.h
@@ -134,6 +134,8 @@ signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 					   uint32_t count, uint32_t flags,
 					   signed long timeout, uint32_t *idx,
 					   ktime_t *deadline);
+int drm_syncobj_register_eventfd(struct drm_syncobj *syncobj,
+				 int ev_fd, u64 point, u32 flags);
 void drm_syncobj_free(struct kref *kref);
 int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
 		       struct dma_fence *fence);

-- 
2.54.0


