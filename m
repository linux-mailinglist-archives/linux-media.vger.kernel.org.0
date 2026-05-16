Return-Path: <linux-media+bounces-61795-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iD7ABXhQCGoMjAMAu9opvQ
	(envelope-from <linux-media+bounces-61795-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 13:09:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B0855B5C5
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 13:09:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 187A93031ADF
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 11:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C65403D88FB;
	Sat, 16 May 2026 11:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sSZoa9Td"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9FD3D6682
	for <linux-media@vger.kernel.org>; Sat, 16 May 2026 11:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778929620; cv=none; b=HUY8MvX8gzBIOc1P1KF3XUe/uMhwnKFTk4AXKo5E802nDWTn8eWvw8EENRc6y8UqkjHtJYngjJMfYIdM0NdIwZEzrVbVBVHJPCePHz6UL/V11DzNvVjBal244C6WJFBrClZVhU0kqBJQ5y4fR/0BBg6wokoZtDkbGvrPy1/KwN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778929620; c=relaxed/simple;
	bh=GBWZLpTSQKwI1OU9IPw5ePXafftNdAo847uKMqv9qQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NPyrQJlcm8sobP3bOJklvSX9+Jg1cwnJQjd5/Z1TMkhaFSm1f5F7QP60o4BZW7pIMERYTUzq6+kiAA5bqZ54DbHyZeeJ9FWa/nP8GsIDRUGu1bB5Elqlg77tVdmaCxptNKDfOXojbAblPoQxIQulOPykQqFCeSoyzc028KYZPmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sSZoa9Td; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso5345235e9.0
        for <linux-media@vger.kernel.org>; Sat, 16 May 2026 04:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778929614; x=1779534414; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6GkkTkJJ4gPDTN90NOOy2Oe9JOnAG88gTd5YGKnZHEk=;
        b=sSZoa9TdQUh3lhyzwArreADQRar9CsjKLdwyj9PO2v/sfbotz7HzwYIWAb/p5Vo4SW
         kRKsLlz4JoQ43nlrS2j8Ol8i92S8kz4SdgM8Ccy9dAUZs8SRhrrX+41iVYSxpS1CuPNI
         6zK+uBNX5Yt44/xkY5KF8bey3KGyEfLd5HUeWaed1z4IRWjNddFAt+c+doNvA7sjQkkv
         ZJE1l/F+BUpRz4q6zYZ3EBfkIXn1M6qQuWIHwP8AAh8t54MqqxtJVJVeiSWaVvaP79o8
         GWvjrhjQN1CPkEfrQPPqpY9mF8b8Ww7DDBlqpeUqXRFo5j6PiqO45YE41Pu80Q1x87CJ
         /UbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778929614; x=1779534414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6GkkTkJJ4gPDTN90NOOy2Oe9JOnAG88gTd5YGKnZHEk=;
        b=gA504SOY0nZMLZEsFbsy4heW8lAdcWqbXak0R85D0hlKWFeWp04eeP1SyRvtmXfHpU
         XZVcBjQJzziCsP7aPLrMcyY/MPR7NrbVShpdFl5wxYnNe7jdRhe6YeZFYyREc2wbLaIY
         WtnUV/SnldDdQgNND/fdSEEKYv+q3yI3lUXtdfdDgDXpP3V9RJ5uBLLsJGT3DqeI7uBl
         OW9sKIJ584pmLIhKHZKvfa3EKKPZleyFVBhxcatSTkG/dy24lUAEW/oHlLy9iZpL51r5
         iwnm6pOfnKfI4+eyLICSFUx5OLr2D5mkiA7J4zyR0Vdaph6uj43fy81xx05zfsmkDSdg
         kofQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Y85oIzta7z78phWZXRNn3DBzHai7bi69xBRkiUBBhGbqOplSYz2imVyul+buwancULDzPchwIuZL7OA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxV1pzRsOJIiR5bR/BQ/3FuYO/9/YSSoSmpaauFl8svcEUMdVj1
	1orPY9djdNzLg32N23MQqxmFHnjiTikZPxvCuQYqjh7Bqcu1/ArTYPvQuh/4ohgX
X-Gm-Gg: Acq92OHDT7CSD4X++tfyghDGKd1eeNia+iJ0SRpA7YJWBrHmnlpbNygckCVCxh3DrJv
	XdC+6ZqxYyCjFhQbb9Hs4ra/IsjVRfH1b1glKkgoOulzkI6LprQ0R+g1JndLXG9/okOZvvrncxT
	Jznp3Nnc7lBILwqRE70loHepX20TPbPujuxzD4JRgYA8voOnplKYYV4yBPd2dzAquTx1Cmyv3m4
	ruVnIsHCiJ9lKydmDbJ817iPo42xpRfELn2AeYg/lSZPzMXbpaXt4G2A2lDUfFck/HchbeFlwX7
	tzOz/2A9GRktv+Mf5V3IikkWM8JtwhldiTYPC5rFfANs0uGue1JX+8B5UQHbPaEVODF0J8nc8jZ
	ydDox65O39ay6rWaeIUqSM6pDaPVx8uOoBBfQBxCwBkhgP0nM3RYQ2Zz4k9rZ9DCOZpUL1US7c1
	MQ9VQTAy+6O1REonurQXH1CjSZgY9VUj9FtcbmtYQtm/ryfwTf9Z2jEZRiUa8j8Ecsb6mK61RmI
	jqB2xvOynxqOaSOJA==
X-Received: by 2002:a05:600c:8b18:b0:48f:e230:1d13 with SMTP id 5b1f17b1804b1-48fe632a17cmr113820945e9.32.1778929613501;
        Sat, 16 May 2026 04:06:53 -0700 (PDT)
Received: from [10.13.0.20] (ip87-106-117-14.pbiaas.com. [87.106.117.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb00e5easm36399545e9.13.2026.05.16.04.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:06:53 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
Date: Sat, 16 May 2026 13:06:10 +0200
Subject: [PATCH 07/12] drm/syncobj: add drm_syncobj_timeline_signal
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-jorth-syncobj-v1-7-88ede9d98a81@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778929602; l=4123;
 i=ju.orth@gmail.com; s=20251120; h=from:subject:message-id;
 bh=GBWZLpTSQKwI1OU9IPw5ePXafftNdAo847uKMqv9qQs=;
 b=0gZo9A/tA5EbfMN54peF660OcWHUpqWJdekS7fQjA+fGOVO86M7bIbAQu7ODFDJVVH0bdcsvX
 oBVYQt/E6R0BsJf+sfH3PTEAIAKrD2RH29Jg6VWUMm3yc+y9LG9cMif
X-Developer-Key: i=ju.orth@gmail.com; a=ed25519;
 pk=uM2SS4lelkuIoYHc7v9N9bgBZ3hS632zJS2xjRJLPLI=
X-Rspamd-Queue-Id: B3B0855B5C5
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
	TAGGED_FROM(0.00)[bounces-61795-lists,linux-media=lfdr.de];
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

This makes the logic from drm_syncobj_timeline_signal_ioctl available to
callers that already have an array of drm_syncobj.

Signed-off-by: Julian Orth <ju.orth@gmail.com>
---
 drivers/gpu/drm/drm_syncobj.c | 50 ++++++++++++++++++++++++++++++++-----------
 include/drm/drm_syncobj.h     |  2 ++
 2 files changed, 40 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 8ccfbd972191..948084f56c32 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1675,9 +1675,6 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_syncobj_timeline_array *args = data;
 	struct drm_syncobj **syncobjs;
-	struct dma_fence_chain **chains;
-	uint64_t *points;
-	uint32_t i, j;
 	int ret;
 
 	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
@@ -1696,26 +1693,55 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 	if (ret < 0)
 		return ret;
 
-	points = kmalloc_array(args->count_handles, sizeof(*points),
+	ret = drm_syncobj_timeline_signal(syncobjs, args->points, args->count_handles);
+
+	drm_syncobj_array_free(syncobjs, args->count_handles);
+
+	return ret;
+}
+
+/**
+ * drm_syncobj_timeline_signal - signal timeline points on syncobjs
+ * @syncobjs: array of syncobjs
+ * @user_points: user pointer to array of timeline points
+ * @count: number of syncobjs
+ *
+ * Signals each syncobj at the corresponding timeline point.
+ *
+ * Returns 0 on success or a negative error value on failure.
+ */
+int
+drm_syncobj_timeline_signal(struct drm_syncobj **syncobjs,
+			    u64 user_points, u32 count)
+{
+	struct dma_fence_chain **chains;
+	uint64_t *points;
+	uint32_t i, j;
+	int ret = 0;
+
+	if (count == 0)
+		return -EINVAL;
+
+	points = kmalloc_array(count, sizeof(*points),
 			       GFP_KERNEL);
 	if (!points) {
 		ret = -ENOMEM;
 		goto out;
 	}
-	if (!u64_to_user_ptr(args->points)) {
-		memset(points, 0, args->count_handles * sizeof(uint64_t));
-	} else if (copy_from_user(points, u64_to_user_ptr(args->points),
-				  sizeof(uint64_t) * args->count_handles)) {
+	if (!u64_to_user_ptr(user_points)) {
+		memset(points, 0, count * sizeof(uint64_t));
+	} else if (copy_from_user(points, u64_to_user_ptr(user_points),
+				  sizeof(uint64_t) * count)) {
 		ret = -EFAULT;
 		goto err_points;
 	}
 
-	chains = kmalloc_array(args->count_handles, sizeof(void *), GFP_KERNEL);
+	chains = kmalloc_array(count, sizeof(void *), GFP_KERNEL);
 	if (!chains) {
 		ret = -ENOMEM;
 		goto err_points;
 	}
-	for (i = 0; i < args->count_handles; i++) {
+	for (i = 0; i < count; i++) {
 		chains[i] = dma_fence_chain_alloc();
 		if (!chains[i]) {
 			for (j = 0; j < i; j++)
@@ -1725,7 +1751,7 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 		}
 	}
 
-	for (i = 0; i < args->count_handles; i++) {
+	for (i = 0; i < count; i++) {
 		struct dma_fence *fence = dma_fence_get_stub();
 
 		drm_syncobj_add_point(syncobjs[i], chains[i],
@@ -1737,10 +1763,10 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 err_points:
 	kfree(points);
 out:
-	drm_syncobj_array_free(syncobjs, args->count_handles);
 
 	return ret;
 }
+EXPORT_SYMBOL(drm_syncobj_timeline_signal);
 
 int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 			    struct drm_file *file_private)
diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h
index ec8042d61466..a9216ea07946 100644
--- a/include/drm/drm_syncobj.h
+++ b/include/drm/drm_syncobj.h
@@ -139,6 +139,8 @@ int drm_syncobj_register_eventfd(struct drm_syncobj *syncobj,
 int drm_syncobj_transfer(struct drm_syncobj *src, u64 src_point,
 			 struct drm_syncobj *dst, u64 dst_point,
 			 u32 flags);
+int drm_syncobj_timeline_signal(struct drm_syncobj **syncobjs,
+				u64 user_points, u32 count);
 void drm_syncobj_free(struct kref *kref);
 int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
 		       struct dma_fence *fence);

-- 
2.54.0


