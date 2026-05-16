Return-Path: <linux-media+bounces-61796-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPcmMI1QCGoMjAMAu9opvQ
	(envelope-from <linux-media+bounces-61796-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 13:10:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 285F755B5D7
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 13:10:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F0483035B70
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 11:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC323D902E;
	Sat, 16 May 2026 11:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sV0QlIC4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB50B3D5C1E
	for <linux-media@vger.kernel.org>; Sat, 16 May 2026 11:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778929621; cv=none; b=mRx1+rZM6ydXEhpzMoEJqOpCqtdcmoGPFt+iIHWEerfS5ND4BLxvHSXEilfm5p5rF+yQ2lBPpVl3P4/Tt3UwdDv6U7Iwn1y9q9AuP9UnoLmW5Xnvd0U8oMz0+AqB9VNkvLv7TPr0DkZ7BBRCY9SjnzaJDfCQIVSzUqTsaKoxutM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778929621; c=relaxed/simple;
	bh=crfpaYowwqJxJnvwODKb3NMb9L0ciSXP5LaWzS0yZzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xy1VJR0W9gSoJHf5KtYgDLwUWHzXR/2VkVatXyBVtIoufjvNN/ku3oS8tvZTT3XlvaacJbeBI1q+BndSRAjWKyHgmfdQ388KFiEGcbrKyNgdTp8nj5pNj04w27uvA1DPA07eegNPSm+J9gfuVGP5OJpgpyMB5yEtHWlivg59sHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sV0QlIC4; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso6107295e9.3
        for <linux-media@vger.kernel.org>; Sat, 16 May 2026 04:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778929612; x=1779534412; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lfXCZmKhXGPb19F0Jw5wedNIT6lbmZvd88iLNzyg/OY=;
        b=sV0QlIC4zerZT0HPz89g/CWmE6SL4C9oXjqyqSZsu03uwHinsRhNb0nEw+clEg/uRH
         KDV0uXUpBXev/BosWAnX3utT1HU3G6z5bi9lU2vFlnveVjG6792bhHNkXpUHYm0FnlZ0
         fNldmqMN7pNMOjqNiBe4c75tFoTKw7bIbf5VdQi3PbWgbV4dUJKttdmw0uriSyP+M1r/
         0wJ/+VWxCc/52xom4aOk9CC5l5TkKR35WXFDsUL3Jsmk8vRLpXihrd0ZqyhsvypxG5BH
         kX5dw+LfuhnJjiFIRxY8vETGOBnAxhLT908JRoZmlAEwb7cn6uUbFOWRXDfAE0R6gHbH
         YtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778929612; x=1779534412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lfXCZmKhXGPb19F0Jw5wedNIT6lbmZvd88iLNzyg/OY=;
        b=Miyzdno9DioUpHqeKmHmzDltP8Tz1bsxudestvlE1XR3qDUgAOXD3eeal4TKMxm1/v
         j6MAat6o7Rd7P9tMbABWU4NPHuu1oiCWoA9u/I4fq3y2mArbXMvuQu/xi39bBuM8nC3m
         dGpgrJQSa30W59rutrMd+89dK9vwLDr1qc5LLAd4jOPWgtboV0y/I2lm9hS0DijmC5dH
         t+vdYApF1Kp7sBEdp1rZ/tVCqfhSGdZXG4daISOmabPnMT0+4aSa09MgDJpK5EuCyiwK
         2hKCNUZylz1szGFcaZ0FoWqAhSFEwNDmEFJVn7YCaxAK+u/5FOw0dqC62IU5iL1lTFbx
         mF1w==
X-Forwarded-Encrypted: i=1; AFNElJ9r0Yoj3JEqUcgEIu5PCFUCTJh+OvyAW+c3jR5UAGo1D18Rqr90OJYNz/+rcZ1rRtWHZRv3WiVwixaOBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyADQ0weVz34DqI3bJv8YEFs8jpC1yS+QUHNHiNiXVwCbpgfK1y
	15PdSd+EUiSfitPvqPS1WxwGRT9wY1q+9gSq+NjduzBNMZPJ0NQf403t2BeBO6vj
X-Gm-Gg: Acq92OEuZsP10jCyFmgIvS8I0G+wIV2FeHi2Z9mVyED6z3OSciiP1o1ZW014mJQpPbz
	EuC+va5rsHE5PHGpGca5svRc2rOzG/cViiLoYe1ChSXbO1YlyB9gaU79C8BId4FrbA2HRi5iFTa
	ZJ931wH13pSpa1BY7UWIjFbUOyh5biJzLCTzK3YvJPHiVc1BbmVoYuivbviP4T7f4G5nD4OmjN2
	Z+a6nOSHtcaMvpJooBmHw+4tDFx0DzEGJL08WdQfACC0Ycr9KBgBPiqXutIWOJCzMORHtup71wT
	AJcMBAqrgM5VXazaHOCWFjdm7I9aKrfFtNNCd1QO47KvXBL8LeIyJqjC91XSX8dez21R3IlgtI7
	ksisYFDqMFvpRVN3e42fG3DCcb2f83vwmfglu6iAZvwoWJ6cZxwlzE/rqWH2pXtGf+ZDVSCb0kv
	kMCCqj7gJ0PWucF4WopUOaD69woM38YsUzOClyvpNDpXWZTRBkZjznDdkL6pjvffwHFjASdp8Ij
	RvX7aU=
X-Received: by 2002:a05:600c:c494:b0:485:4388:3492 with SMTP id 5b1f17b1804b1-48fe60ed839mr106842125e9.11.1778929612138;
        Sat, 16 May 2026 04:06:52 -0700 (PDT)
Received: from [10.13.0.20] (ip87-106-117-14.pbiaas.com. [87.106.117.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb00e5easm36399545e9.13.2026.05.16.04.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:06:51 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
Date: Sat, 16 May 2026 13:06:09 +0200
Subject: [PATCH 06/12] drm/syncobj: add drm_syncobj_transfer
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-jorth-syncobj-v1-6-88ede9d98a81@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778929602; l=2747;
 i=ju.orth@gmail.com; s=20251120; h=from:subject:message-id;
 bh=crfpaYowwqJxJnvwODKb3NMb9L0ciSXP5LaWzS0yZzY=;
 b=4LnJkSRcgHTRmc5hqP/RVVAq8z7NN5hqbrYXKUhKI6Ju4If09ezCwoSL5J4pmggyrT/r6k6gL
 MSWHYqto26NBUeuZWgCz0Yq5OF0t6VAVcTQcC9DTxb9GREciFiuCzd0
X-Developer-Key: i=ju.orth@gmail.com; a=ed25519;
 pk=uM2SS4lelkuIoYHc7v9N9bgBZ3hS632zJS2xjRJLPLI=
X-Rspamd-Queue-Id: 285F755B5D7
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
	TAGGED_FROM(0.00)[bounces-61796-lists,linux-media=lfdr.de];
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

This makes the logic from drm_syncobj_transfer_ioctl available to
callers that already have two drm_syncobj.

Signed-off-by: Julian Orth <ju.orth@gmail.com>
---
 drivers/gpu/drm/drm_syncobj.c | 36 +++++++++++++++++++++++++++++-------
 include/drm/drm_syncobj.h     |  3 +++
 2 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index a746e787882d..8ccfbd972191 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1031,13 +1031,9 @@ drm_syncobj_transfer_ioctl(struct drm_device *dev, void *data,
 		goto err_dst;
 	}
 
-	if (args->dst_point)
-		ret = drm_syncobj_transfer_to_timeline(src, args->src_point,
-						       dst, args->dst_point,
-						       args->flags);
-	else
-		ret = drm_syncobj_transfer_to_binary(src, args->src_point,
-						     dst, args->flags);
+	ret = drm_syncobj_transfer(src, args->src_point,
+				   dst, args->dst_point,
+				   args->flags);
 
 	drm_syncobj_put(dst);
 err_dst:
@@ -1046,6 +1042,32 @@ drm_syncobj_transfer_ioctl(struct drm_device *dev, void *data,
 	return ret;
 }
 
+/**
+ * drm_syncobj_transfer - transfer a fence between syncobjs
+ * @src: source syncobj
+ * @src_point: source point
+ * @dst: destination syncobj
+ * @dst_point: destination point
+ * @flags: DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT or 0
+ *
+ * Copies the fence at @src_point in @src to @dst_point in @dst.
+ *
+ * Returns 0 on success or a negative error value on failure.
+ */
+int drm_syncobj_transfer(struct drm_syncobj *src, u64 src_point,
+			 struct drm_syncobj *dst, u64 dst_point,
+			 u32 flags)
+{
+	if (dst_point)
+		return drm_syncobj_transfer_to_timeline(src, src_point,
+							dst, dst_point,
+							flags);
+	else
+		return drm_syncobj_transfer_to_binary(src, src_point,
+						      dst, flags);
+}
+EXPORT_SYMBOL(drm_syncobj_transfer);
+
 static void syncobj_wait_fence_func(struct dma_fence *fence,
 				    struct dma_fence_cb *cb)
 {
diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h
index 85e7ca7f7896..ec8042d61466 100644
--- a/include/drm/drm_syncobj.h
+++ b/include/drm/drm_syncobj.h
@@ -136,6 +136,9 @@ signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 					   ktime_t *deadline);
 int drm_syncobj_register_eventfd(struct drm_syncobj *syncobj,
 				 int ev_fd, u64 point, u32 flags);
+int drm_syncobj_transfer(struct drm_syncobj *src, u64 src_point,
+			 struct drm_syncobj *dst, u64 dst_point,
+			 u32 flags);
 void drm_syncobj_free(struct kref *kref);
 int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
 		       struct dma_fence *fence);

-- 
2.54.0


