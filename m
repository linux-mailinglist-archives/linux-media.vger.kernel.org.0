Return-Path: <linux-media+bounces-61792-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPpwCRBQCGqDjAMAu9opvQ
	(envelope-from <linux-media+bounces-61792-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 13:08:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9B555B510
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 13:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B8F8301429C
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 11:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E86938D40F;
	Sat, 16 May 2026 11:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IRzi+gYJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338E63D5652
	for <linux-media@vger.kernel.org>; Sat, 16 May 2026 11:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778929613; cv=none; b=ITLe/SiGtCZuTjJQnFvq73ePMle5SksZ7TGWSeHM0jtXohOmP+28xGuVEYEUdzuavNjzNZdVw2mvMJrYoyI0ZlxMapTwWKo0L5ZJvsVG2lpbdS48keRmYIfLeYvfSieoc/BW/SVkLNJkgtOr3BlUUkW1o8+g0x1oZzMLj7qGUYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778929613; c=relaxed/simple;
	bh=a9lG2nbpvJpNBTclhiNFI8DwaJzMN3KTgSfTJHOAb6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fp0PSknq8RABE+VlJgjWSm4tJXsMUJGK3fuiN6ddeHTKPCJcXxe8DkSS+E+68MLDHgXmJ5B89v1utGan0NXhRl8QF01XZUs8xe5f2y7wk1BeS9cZLxC9lQoYJulXj7tnV50H2Y7NMF2MnamKs7vI7u7GeL0/89nXv0b7B5Nccx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IRzi+gYJ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488ad135063so4471615e9.0
        for <linux-media@vger.kernel.org>; Sat, 16 May 2026 04:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778929607; x=1779534407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DZXH6WE6NwIFHcNfcXNqTsh8pXC1vp/igAOE1DEZDoU=;
        b=IRzi+gYJyMO5o2NZUM+RehkR/HJ08f344RqnHLVYG2/9Iz3cy5ibqu8aF5zN/wgWEP
         PF6zyLu/DZ+hy2uPZwNr+mhvQSCakvW3MeNnS1qcsC4Snxjnk4bB7O5E8qZrWpTXUQxF
         8R7c26ac/Kt89KnKOcUMsxc6CBnw995C032mwIodYOB0v9/KNTnldRKdsuTTuBCwUcxD
         Poe6KvBK72ZF+9VdOsTTiookNK34fB6PTa7dWT1+gtGKhddXpavyA/OXY2NxWiG4Yo99
         CzOrI5keDG7nP6tT+DMT0vNOuKAN9xwyTpvYrEgDJrUFlNxb3u1q9l7vNFcSSlxYZZyK
         Yk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778929607; x=1779534407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DZXH6WE6NwIFHcNfcXNqTsh8pXC1vp/igAOE1DEZDoU=;
        b=dNI+GBxKAAx04qmSpNJ+6wQ0y5wRpcKNu8LvU9HwD8mflR9UewQFMSkIAhTaTGuiiy
         KTTIfSpP7rKeIwGxur/rgI1MGnn+Xv7beM2Sv0gzdjS1q09kvyqLUsOGTR/qtJQGFMTH
         7jd6IY7k43iyqsoK6T+Jz9w2/ctRUEdALeVjTmPD7F53/8bBL02GdyDKfbKhBwvCGnHC
         IKt8ZCz7hZXTPkpkbnuK5+pvrEGjTAGkYJoGpfBBhx1TS+9bKbhAG39ux6/ANgeQyiTS
         XN4hhYaS2NbAVXzYzc8nrg08hOmv06q1GMzSi2HcLNLssstGfG1f9n/yhbOvL3/BaL2Q
         JyQQ==
X-Forwarded-Encrypted: i=1; AFNElJ8mfhdYEiP9O0AMDbCtYw7Nb6rdJKtq1tIsTROaLaC2tZHpfVOk8PujcZ42eAQRn5JL1P7JaAfrKPdalQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtV3y+NooYvbxYxy+yBjhknxCHm1bJY+pdD6lQo+N1UpAm7ECH
	SSLF5EvtWpIPAbjjRyAY0/wmxUF3fzLrv/UNBC8K5i/xEv/5YOa/E3rd6YR1qHhd
X-Gm-Gg: Acq92OHQNYI8rRRn7sVFsEC2p9Q3W5N4mFaUI2rdCrhWJExsqe6vp9QP/kwcUQP0hVi
	UDSl2MB8l01HBtjZWN4Y67pe0q6giP2NCanASRput6rDYHLPv+UNt18gFTMbVw5Oh0+I8000EI9
	7lugJ37znbrKkWXCx5dyEXGE44n1dqPU5MhYKTIK0y2ZJK2NTZylAnNco845Fr3vifoeOnguBDG
	MeZ2mPfJ/Bb+Rh1bymTcnk3H+KLdcIfYV4bOssymyEcKUuNo42FDPSX5antSQBwtV2OTWGqfcyJ
	ezNZSaz03w66F6xW6aBs93utO67lmGPamvfa2pjxrsDIggXMeOrnR4pRv/xhwsmGsD9rFYYDtWS
	Beb/qWvpbc+v0ioYHIOJlhU7P5liKVJBUKGw75k6j9Ecvol12hojZL+egtkRw4p9VNy2SywRK1a
	el6sdG8ZEjgVCAEPlB9JLrh3wzRNmd3s8nuAcND++qJaQvUFXeaxmbPwaq2rgXj9Gn0nF572bQl
	FiGyO2za+i7c1e6Fw==
X-Received: by 2002:a05:600c:4692:b0:48f:d835:e104 with SMTP id 5b1f17b1804b1-48fe6325391mr108240075e9.16.1778929606890;
        Sat, 16 May 2026 04:06:46 -0700 (PDT)
Received: from [10.13.0.20] (ip87-106-117-14.pbiaas.com. [87.106.117.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb00e5easm36399545e9.13.2026.05.16.04.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:06:46 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
Date: Sat, 16 May 2026 13:06:05 +0200
Subject: [PATCH 02/12] drm/syncobj: add drm_syncobj_fence_lookup
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-jorth-syncobj-v1-2-88ede9d98a81@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778929602; l=3464;
 i=ju.orth@gmail.com; s=20251120; h=from:subject:message-id;
 bh=a9lG2nbpvJpNBTclhiNFI8DwaJzMN3KTgSfTJHOAb6U=;
 b=07+mwlPAmGj35N8dMENXh6PCoPSv2aMD6VxpSxRkS+KDubuwjlGqM09oILAMtWVMbSAEmf3Bp
 UZUi9wH3NLuA1L+LQNH3MdycdnESgn7NfT46epz4KcBbp+qwZvxkBy9
X-Developer-Key: i=ju.orth@gmail.com; a=ed25519;
 pk=uM2SS4lelkuIoYHc7v9N9bgBZ3hS632zJS2xjRJLPLI=
X-Rspamd-Queue-Id: BF9B555B510
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
	TAGGED_FROM(0.00)[bounces-61792-lists,linux-media=lfdr.de];
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

This makes the logic from drm_syncobj_find_fence available to callers
that have a drm_syncobj instead of a drm_file/handle pair.

Signed-off-by: Julian Orth <ju.orth@gmail.com>
---
 drivers/gpu/drm/drm_syncobj.c | 34 ++++++++++++++++++++++++++++------
 include/drm/drm_syncobj.h     |  2 ++
 2 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index d992aa082ace..8df438fe0807 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -427,7 +427,7 @@ static int drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj)
  * @fence: out parameter for the fence
  *
  * This is just a convenience function that combines drm_syncobj_find() and
- * drm_syncobj_fence_get().
+ * drm_syncobj_fence_lookup().
  *
  * Returns 0 on success or a negative error value on failure. On success @fence
  * contains a reference to the fence, which must be released by calling
@@ -438,8 +438,6 @@ int drm_syncobj_find_fence(struct drm_file *file_private,
 			   struct dma_fence **fence)
 {
 	struct drm_syncobj *syncobj = drm_syncobj_find(file_private, handle);
-	struct syncobj_wait_entry wait;
-	u64 timeout = nsecs_to_jiffies64(DRM_SYNCOBJ_WAIT_FOR_SUBMIT_TIMEOUT);
 	int ret;
 
 	if (flags & ~DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT)
@@ -448,6 +446,32 @@ int drm_syncobj_find_fence(struct drm_file *file_private,
 	if (!syncobj)
 		return -ENOENT;
 
+	ret = drm_syncobj_fence_lookup(syncobj, point, flags, fence);
+
+	drm_syncobj_put(syncobj);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_syncobj_find_fence);
+
+/**
+ * drm_syncobj_fence_lookup - lookup and reference the fence in a sync object
+ * @syncobj: sync object to lookup.
+ * @point: timeline point
+ * @flags: DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT or not
+ * @fence: out parameter for the fence
+ *
+ * Returns 0 on success or a negative error value on failure. On success @fence
+ * contains a reference to the fence, which must be released by calling
+ * dma_fence_put().
+ */
+int drm_syncobj_fence_lookup(struct drm_syncobj *syncobj, u64 point,
+			     u64 flags, struct dma_fence **fence)
+{
+	struct syncobj_wait_entry wait;
+	u64 timeout = nsecs_to_jiffies64(DRM_SYNCOBJ_WAIT_FOR_SUBMIT_TIMEOUT);
+	int ret;
+
 	/* Waiting for userspace with locks help is illegal cause that can
 	 * trivial deadlock with page faults for example. Make lockdep complain
 	 * about it early on.
@@ -511,11 +535,9 @@ int drm_syncobj_find_fence(struct drm_file *file_private,
 		drm_syncobj_remove_wait(syncobj, &wait);
 
 out:
-	drm_syncobj_put(syncobj);
-
 	return ret;
 }
-EXPORT_SYMBOL(drm_syncobj_find_fence);
+EXPORT_SYMBOL(drm_syncobj_fence_lookup);
 
 /**
  * drm_syncobj_free - free a sync object.
diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h
index 5da9988834b5..580a967ae364 100644
--- a/include/drm/drm_syncobj.h
+++ b/include/drm/drm_syncobj.h
@@ -124,6 +124,8 @@ void drm_syncobj_add_point(struct drm_syncobj *syncobj,
 			   uint64_t point);
 void drm_syncobj_replace_fence(struct drm_syncobj *syncobj,
 			       struct dma_fence *fence);
+int drm_syncobj_fence_lookup(struct drm_syncobj *syncobj, u64 point,
+			     u64 flags, struct dma_fence **fence);
 int drm_syncobj_find_fence(struct drm_file *file_private,
 			   u32 handle, u64 point, u64 flags,
 			   struct dma_fence **fence);

-- 
2.54.0


