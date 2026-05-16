Return-Path: <linux-media+bounces-61794-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ImABfRPCGoMjAMAu9opvQ
	(envelope-from <linux-media+bounces-61794-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 13:07:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C3F55B4E5
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 13:07:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C08F530055D8
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 11:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DBA83D7D60;
	Sat, 16 May 2026 11:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjCmLvR7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD2B3D5658
	for <linux-media@vger.kernel.org>; Sat, 16 May 2026 11:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778929617; cv=none; b=eePfVtYkYFhfxdl7ZgSO25575odh9fetVRImLLYl6bo6K3d1HBRbLcEUzWzvLuhNHtyKFU5wkDToXF159+hZ/a0x+IWHR1evN2SKOM5YGXEPXUqRVpw0b7SuGWYg/maOZuq7Z69/mIYFPOiu+KmZU/IStz5C3RYT4qOuqD/yD3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778929617; c=relaxed/simple;
	bh=Mb8lX2KhvsBJbZLZbGjpbAUq1f7hQxcuF5oQ0+pOVFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p8owPEhu0VFjJHorBG5fyc2qNBZFWHi67eTeJoBrIp+Bkpyj7D0OkZcPIxq9HdvVs0ouK+e9WHdUucdJvKMGRMq26Efm1xvwvd3L+kiqgoVjjay0Pa6Kv7772vbzRl9VpFI8pbTDNZKHEcHE/3nIqAVJhJ96MFyA6mB2m8jsReI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gjCmLvR7; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so5010185e9.0
        for <linux-media@vger.kernel.org>; Sat, 16 May 2026 04:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778929611; x=1779534411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W2kX0D85vKgrMTrfAaShnpioKYHS8IrhnFr9X3CmECA=;
        b=gjCmLvR7NUvdNlhUexikzVfYE5dvmDWQ8MDD2okU6SlPW/Y9rIulFIsqWjS20DP0ZP
         s6/R69DL0ezBfveFZKEXeOF30ZMpVqKC/mBKefNoHRn9DoFNxSqJ4VBTzMeN1b5ryv2T
         T5NH8EOigk1mpCKOMaHgwpUU1rswUSqv0yvaf2LwHqUr6CPA96QvaygkRvaXsSMzCn3d
         cElDHEISD5xaEEONpV2PfjiOHkrByKSMQasG9r/QsP9E6wH8LOSoq/Bl2R0p1Fa4jFH1
         P+WlbAfYfC/WVDwS40DM4dUTNa/uJerXBsCDIt7LmagBi0u5A8k5o5rM6ZPwmsR639z5
         apOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778929611; x=1779534411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W2kX0D85vKgrMTrfAaShnpioKYHS8IrhnFr9X3CmECA=;
        b=NwFAOCyWcGh7JJEInICI5sAsv2nQkEVZVtjFldsZJ6CsfI1LSjWI0ptbsT/2TiR7Gt
         iDeBkUXB9s511jibGTRpAZLyMZOyb6o+I3xzZ9IY5eWjQic6rK1mhR0RqckpaE4J4okE
         izxSUJ33HZs3Sy7RUKroD5fg2/qoiXcdVzKE+tn1dugDG+ELu63EGaIZQEA7/pqNCZqM
         rwZAEFjtchGgpG9eJmXv4FTa4BfQUi2lJdSKo/O+Z+lEcqw+TGz36I6fwBZdaJLU8qWp
         btwFKQ0sMNCgV/+bYVI+M12hCWcpyd9OrMh5mNFMktBsyzVu51HPcSAuEaUnLcS0LjXm
         ZsrQ==
X-Forwarded-Encrypted: i=1; AFNElJ/iG3ATinz6XhZeeGsaGff7nwptsugCNt497DjuV2pk36x8hrjzPdYz+dlSSeucW5Gsi3OyBIZa8pvqDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCCypCSIy+1DyF4qt8uEolriMIXZl1ZNWI2fitlBAl2dG32BEZ
	KIJsRabnO0vjfDfbsA6Lq2XURnGe+ZP3XvlAtznwmD87HSyUuMg2yWxnMEqgTTO4
X-Gm-Gg: Acq92OEGKD/uJwxcbVZoIbZQSSkoKGBJUndAlllA9vLg0HgLe/g70iqOZMGRyEDNbMW
	ndkToXV7TSezamH+QxexbiBM7ivL3j/78rsRZMzziVghfmo8PhOYT6rMYfB/KYRDtylhEqcaYMD
	2ZzyDgbOTBeK326dT9WxtRG566WgHNXafLqJc+FdVc7L7zPPxAfvA247vt3gGyuclkpmumkxWvQ
	pZbDiPbKfnejhQBPHE1BJvircwTp6S5mG/Hjao4Jw3o4QxiRZdjpgq3k8sQHDDbbarYmz4UuGQi
	cp5pJ7DSd/ZNLYjvVR+elTbRw3HoK/kATO3lBSIWSBRpIccPIHYbGHIL0ZHQZVS4cNbdYKT6bdl
	r114fguS/ZjPO5inawZTAWvERIOZOTOfIwzD/VnoigXURYmDFay16Z6UyY/MkFVqVqoZuE0RP7M
	kAtQiLKlyvUbZysGW2mNB70hoWzhXcOgmuQoBqN2Rk41dVdvfSRffKCebZkXqNwrap24uPr83Li
	lqeOw+UhW8tb5hfXQ==
X-Received: by 2002:a05:600c:1512:b0:48f:e26a:1744 with SMTP id 5b1f17b1804b1-48fe60ecd67mr61949075e9.9.1778929610832;
        Sat, 16 May 2026 04:06:50 -0700 (PDT)
Received: from [10.13.0.20] (ip87-106-117-14.pbiaas.com. [87.106.117.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb00e5easm36399545e9.13.2026.05.16.04.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:06:50 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
Date: Sat, 16 May 2026 13:06:08 +0200
Subject: [PATCH 05/12] drm/syncobj: have transfer functions accept
 drm_syncobj directly
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-jorth-syncobj-v1-5-88ede9d98a81@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778929602; l=3982;
 i=ju.orth@gmail.com; s=20251120; h=from:subject:message-id;
 bh=Mb8lX2KhvsBJbZLZbGjpbAUq1f7hQxcuF5oQ0+pOVFk=;
 b=BeGkMWuyeX/aZRp2H0hfoW2AxnZOC2lzk8MPd8PsvJlWTvAKosg1c1JQKJEBD/6j1xtsYYLN2
 hnZSkrLB1TOAJz2SwH4GedXgfD0gdUZ4ygDmsn2lzPUAFQlwflz007b
X-Developer-Key: i=ju.orth@gmail.com; a=ed25519;
 pk=uM2SS4lelkuIoYHc7v9N9bgBZ3hS632zJS2xjRJLPLI=
X-Rspamd-Queue-Id: 18C3F55B4E5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61794-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

This removes the implicit flags check from drm_syncobj_find_fence. The
check is moved to the only caller drm_syncobj_transfer_ioctl.

Signed-off-by: Julian Orth <ju.orth@gmail.com>
---
 drivers/gpu/drm/drm_syncobj.c | 62 ++++++++++++++++++++++++-------------------
 1 file changed, 35 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 3e8fb7e0cace..a746e787882d 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -955,29 +955,23 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 					&args->handle);
 }
 
-static int drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
-					    struct drm_syncobj_transfer *args)
+static int drm_syncobj_transfer_to_timeline(struct drm_syncobj *src, u64 src_point,
+					    struct drm_syncobj *dst, u64 dst_point,
+					    u32 flags)
 {
-	struct drm_syncobj *timeline_syncobj = NULL;
 	struct dma_fence *fence, *tmp;
 	struct dma_fence_chain *chain;
 	int ret;
 
-	timeline_syncobj = drm_syncobj_find(file_private, args->dst_handle);
-	if (!timeline_syncobj) {
-		return -ENOENT;
-	}
-	ret = drm_syncobj_find_fence(file_private, args->src_handle,
-				     args->src_point, args->flags,
-				     &tmp);
+	ret = drm_syncobj_fence_lookup(src, src_point, flags, &tmp);
 	if (ret)
-		goto err_put_timeline;
+		goto out;
 
 	fence = dma_fence_unwrap_merge(tmp);
 	dma_fence_put(tmp);
 	if (!fence) {
 		ret = -ENOMEM;
-		goto err_put_timeline;
+		goto out;
 	}
 
 	chain = dma_fence_chain_alloc();
@@ -986,34 +980,27 @@ static int drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
 		goto err_free_fence;
 	}
 
-	drm_syncobj_add_point(timeline_syncobj, chain, fence, args->dst_point);
+	drm_syncobj_add_point(dst, chain, fence, dst_point);
 err_free_fence:
 	dma_fence_put(fence);
-err_put_timeline:
-	drm_syncobj_put(timeline_syncobj);
+out:
 
 	return ret;
 }
 
 static int
-drm_syncobj_transfer_to_binary(struct drm_file *file_private,
-			       struct drm_syncobj_transfer *args)
+drm_syncobj_transfer_to_binary(struct drm_syncobj *src, u64 src_point,
+			       struct drm_syncobj *dst, u32 flags)
 {
-	struct drm_syncobj *binary_syncobj = NULL;
 	struct dma_fence *fence;
 	int ret;
 
-	binary_syncobj = drm_syncobj_find(file_private, args->dst_handle);
-	if (!binary_syncobj)
-		return -ENOENT;
-	ret = drm_syncobj_find_fence(file_private, args->src_handle,
-				     args->src_point, args->flags, &fence);
+	ret = drm_syncobj_fence_lookup(src, src_point, flags, &fence);
 	if (ret)
 		goto err;
-	drm_syncobj_replace_fence(binary_syncobj, fence);
+	drm_syncobj_replace_fence(dst, fence);
 	dma_fence_put(fence);
 err:
-	drm_syncobj_put(binary_syncobj);
 
 	return ret;
 }
@@ -1022,18 +1009,39 @@ drm_syncobj_transfer_ioctl(struct drm_device *dev, void *data,
 			   struct drm_file *file_private)
 {
 	struct drm_syncobj_transfer *args = data;
+	struct drm_syncobj *src, *dst;
 	int ret;
 
 	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
 		return -EOPNOTSUPP;
 
+	if (args->flags & ~DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT)
+		return -EINVAL;
+
 	if (args->pad)
 		return -EINVAL;
 
+	src = drm_syncobj_find(file_private, args->src_handle);
+	if (!src)
+		return -ENOENT;
+
+	dst = drm_syncobj_find(file_private, args->dst_handle);
+	if (!dst) {
+		ret = -ENOENT;
+		goto err_dst;
+	}
+
 	if (args->dst_point)
-		ret = drm_syncobj_transfer_to_timeline(file_private, args);
+		ret = drm_syncobj_transfer_to_timeline(src, args->src_point,
+						       dst, args->dst_point,
+						       args->flags);
 	else
-		ret = drm_syncobj_transfer_to_binary(file_private, args);
+		ret = drm_syncobj_transfer_to_binary(src, args->src_point,
+						     dst, args->flags);
+
+	drm_syncobj_put(dst);
+err_dst:
+	drm_syncobj_put(src);
 
 	return ret;
 }

-- 
2.54.0


