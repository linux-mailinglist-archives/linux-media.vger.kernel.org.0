Return-Path: <linux-media+bounces-61797-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDwDEqRQCGoMjAMAu9opvQ
	(envelope-from <linux-media+bounces-61797-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 13:10:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A34E955B5DF
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 13:10:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 482E23039C94
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 11:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B79753D6674;
	Sat, 16 May 2026 11:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/i84IdG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF3E3D669E
	for <linux-media@vger.kernel.org>; Sat, 16 May 2026 11:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778929622; cv=none; b=r/vpYzq7+biUqc0/wII2oB2WUy8+B2PAUAHidZi0yxB6L47Sk7tnXMWNkf46ckfNWBrTgvALgssXXS5avJDZjO5HQ7umNY3MuGutAli9NfmjxqRvYsBvbsLKtNewebx18upN2bFBx0Oz3YGEFOpTsMXkJ3pKFinnwVwlFFUooxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778929622; c=relaxed/simple;
	bh=u/7AwpljxtH4IVP0O+P5dyfoAPoN+qqc7x1nJCbL2qA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GaMZ/dSRKzS+Ivs6x1OnC51hHPk2nMUq+NMAfI+VoAuh+7s0nMs7TKf+ejTUjr65XrhV5lcRcUpHGBIs17GAVk7UG+zAPJEwKM7Aod9YFMrtN75nJhLjXv6EQGo08bS381Os0JuMytBN+YVD+BDVrFFSxvfMVdvinBgl+h/6X5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/i84IdG; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48e82c23840so4329375e9.3
        for <linux-media@vger.kernel.org>; Sat, 16 May 2026 04:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778929615; x=1779534415; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30Q99PLuQeVhsFXIYdjo6aYJwvFzoWXm4HGv+NrFQtM=;
        b=A/i84IdGUjfKOCoV7FiEqAb0+LVUFgSqJhVp/neJ9xpaj6UprD28zFUmUrNClhl0ii
         ELvZOWOAZ6cp119udCwGGOyGFnW0yL1gER7VQFz7onXcU5CAV7VFsSkjcZXmr1AzjqhO
         JvCLMtcTgLERQniAfNC0Y28EccZA4D+BGxLnVwp26HmcyjnVCETZZTvlcb0g4L3VOCtS
         kYEs/ADp7NiCYdlhUEu6NjqdoNkU8nk/rcU8Lck4GzXdqc5WAw2uTqLArCUBW9GWbVWI
         376WNv8TzX40UWEZadTfXf5DJvCtPpX+ikjzs87bK5m3bDXM2nIwYMFAw6CfR0wyj3ym
         uxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778929615; x=1779534415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=30Q99PLuQeVhsFXIYdjo6aYJwvFzoWXm4HGv+NrFQtM=;
        b=NVeACUqTc6gf9eRNPyPwNUHNBi7fe4hS72jqhgpQka1WRyxyXodCSOPxr3XLephCOc
         mQ63q75A9TSOU5Gx/pTxzdNQh7rNcfYT/3wgPsf9/0orZOMROyXGAswC+ON7Cswc9wVC
         hr2SCQpVy2US+alvttGw8g4bXxjErdStML38VVQ8SkXGAGbZP6XIfsn9/CVgBGXq+iaH
         Vek/2VkVUyefGpwqHY4Xhp4gvhveGXc6upNJ270i1imSrTEiK73LwueeIEaQNC/34osB
         JKPyUD9HxaOvY3Ht1vN0fQy57xPETTYTJiBgRorg6wuZZCY8Bp5xbWrtpYLCcB3KjGuM
         q6Lg==
X-Forwarded-Encrypted: i=1; AFNElJ/N5s+n/OJ5jTUHDEgMwEv89ox0vNtYVoGmWIQGEMzjtwp0YiYwnyhge6OpHvHei3leOAHziWqHHAw9Dg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2negozeYiQe/1BUCUpGlvxt0tF9fAQrkf0p2+3N7wTge4f+oB
	0gSY2VLNFvqNb3x6nzN9fdYxJKoZUyLzqsgW7TGgrihZ/FaRX9bWkopmp3A3lFKX
X-Gm-Gg: Acq92OEXEp9CRM4/3DLqPEuAKCYcXvGSyXG3aCXcPbu7M4vmynrZWHO/AokxwBSJ+0d
	JqT6XkxqM7bmoAnTEAelaCN1kE/Z5AWnUlL3SZ02+e0n0mqPTWe5rJ4DXAuVShjLwZKtrUJTzkE
	T73Ht3iJ2MlI3Z6e7ZTv44Rj+l/ibaNaiku408vPHWXcXJg3AfhzwLC1FKgq2taTzy8I5ELxEVV
	kajun3g1FM0dAAlR8Q61c+a0mSFlBEl9YCbSHPYZ4I9Hk36PK8UKYMvA+RC6SmIWbYnjgwmr/Ja
	KOkCIIUbjLs4okqp/scLYWSkyppEsR9RvBlRkLs0TGj7lXxcVlFmVeC9jWoD8chL7SJ1RDv3G8j
	Zs1dlfAVgieYzOWLYmAs6KHNYJ7V+ja9irp+BeZOkb+39JbX3UVVe6WVN93UkniXO+FAY/wK8EG
	HRU4K1z42UMQw7H/oks2ariWgBQ1MBZyJerBR/aXX4Bk6sULp3uHQmRZgNSFEXP8gx7hGLw3f3u
	Goe52s=
X-Received: by 2002:a05:600c:8189:b0:48e:89f9:9408 with SMTP id 5b1f17b1804b1-48fe632374fmr115018775e9.20.1778929614964;
        Sat, 16 May 2026 04:06:54 -0700 (PDT)
Received: from [10.13.0.20] (ip87-106-117-14.pbiaas.com. [87.106.117.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb00e5easm36399545e9.13.2026.05.16.04.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:06:54 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
Date: Sat, 16 May 2026 13:06:11 +0200
Subject: [PATCH 08/12] drm/syncobj: add drm_syncobj_query
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-jorth-syncobj-v1-8-88ede9d98a81@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778929602; l=3038;
 i=ju.orth@gmail.com; s=20251120; h=from:subject:message-id;
 bh=u/7AwpljxtH4IVP0O+P5dyfoAPoN+qqc7x1nJCbL2qA=;
 b=Z99DZxu195EeP3vO6X1kysFQ8YqTJJCA0BtkhBQFSClYANqqlJRzUiJ2Mte4dsbxSoaJ7uZfc
 SeQCmRzeltDByjvV1yhoKMIXpDXzFzH7PGzJ6lguaIs7JV/fN5LYMoH
X-Developer-Key: i=ju.orth@gmail.com; a=ed25519;
 pk=uM2SS4lelkuIoYHc7v9N9bgBZ3hS632zJS2xjRJLPLI=
X-Rspamd-Queue-Id: A34E955B5DF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61797-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

This makes the logic from drm_syncobj_query_ioctl available to callers
that already have an array of drm_syncobj.

Signed-off-by: Julian Orth <ju.orth@gmail.com>
---
 drivers/gpu/drm/drm_syncobj.c | 32 +++++++++++++++++++++++++++-----
 include/drm/drm_syncobj.h     |  2 ++
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 948084f56c32..9b7ecc2978f5 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1773,8 +1773,6 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_syncobj_timeline_array *args = data;
 	struct drm_syncobj **syncobjs;
-	uint64_t __user *points = u64_to_user_ptr(args->points);
-	uint32_t i;
 	int ret;
 
 	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
@@ -1793,7 +1791,31 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 	if (ret < 0)
 		return ret;
 
-	for (i = 0; i < args->count_handles; i++) {
+	ret = drm_syncobj_query(syncobjs, args->points,
+				args->count_handles, args->flags);
+
+	drm_syncobj_array_free(syncobjs, args->count_handles);
+
+	return ret;
+}
+
+/**
+ * drm_syncobj_query - query timeline points of syncobjs
+ * @syncobjs: array of syncobjs
+ * @user_points: user pointer to array of timeline points
+ * @count: number of syncobjs
+ * @flags: DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED or 0
+ *
+ * Queries the timeline point of each syncobj and writes it to @points.
+ */
+int drm_syncobj_query(struct drm_syncobj **syncobjs, u64 user_points,
+		      u32 count, u32 flags)
+{
+	uint64_t __user *points = u64_to_user_ptr(user_points);
+	uint32_t i;
+	int ret = 0;
+
+	for (i = 0; i < count; i++) {
 		struct dma_fence_chain *chain;
 		struct dma_fence *fence;
 		uint64_t point;
@@ -1804,7 +1826,7 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 			struct dma_fence *iter, *last_signaled =
 				dma_fence_get(fence);
 
-			if (args->flags &
+			if (flags &
 			    DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED) {
 				point = fence->seqno;
 			} else {
@@ -1832,7 +1854,7 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 		if (ret)
 			break;
 	}
-	drm_syncobj_array_free(syncobjs, args->count_handles);
 
 	return ret;
 }
+EXPORT_SYMBOL(drm_syncobj_query);
diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h
index a9216ea07946..da237ca3e61f 100644
--- a/include/drm/drm_syncobj.h
+++ b/include/drm/drm_syncobj.h
@@ -141,6 +141,8 @@ int drm_syncobj_transfer(struct drm_syncobj *src, u64 src_point,
 			 u32 flags);
 int drm_syncobj_timeline_signal(struct drm_syncobj **syncobjs,
 				u64 user_points, u32 count);
+int drm_syncobj_query(struct drm_syncobj **syncobjs, u64 user_points,
+		      u32 count, u32 flags);
 void drm_syncobj_free(struct kref *kref);
 int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
 		       struct dma_fence *fence);

-- 
2.54.0


