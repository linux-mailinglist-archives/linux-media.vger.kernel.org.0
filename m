Return-Path: <linux-media+bounces-28901-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC1EA74058
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 22:36:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98B5C7A6B5D
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 21:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66861DDC21;
	Thu, 27 Mar 2025 21:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/zdHmMA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E93D8462;
	Thu, 27 Mar 2025 21:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743111398; cv=none; b=IFTo/hX69i9CtXSBYT6Vf2swYZgBg8EPcPhidnlpjm/AtKYMx/xEPFCYWraKOKP76IDFbrvLYDyY3GMQhgtKqAsL7AAm0BM9d8eV84O2aVF+RoKHTUKKjzGjfPUKymUHqxST5zgmrnQl5eTZjfHTd8RZi/fr3Gr7rNCyzNIDQrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743111398; c=relaxed/simple;
	bh=vFfzh+qJ2E/Fg6LhILBUm2b8dYY0+APHMTusxqNHpsU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iW1xRRzoou1tISO1Haj8bIW6EHO+qsguxJmTk5/WEBVzUCJH5tJuV3Ijp1roV6zsOf1Sjhe0ISgghEPgnKB/N25E7r49DrGXyKlBF3J4jAnmR9SckKuD8UUuNOnLdY0glva5GPWbVC9i006mW14z4UHfx4M1e8cYdq/L9gg22NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/zdHmMA; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-226185948ffso33186585ad.0;
        Thu, 27 Mar 2025 14:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743111396; x=1743716196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vt+RjYIF5jBbl4jDavT5AkEfIOndEZDQELaBJfix0fM=;
        b=l/zdHmMAz+pPs8/L62KyiOoUMGjIURJWRWZ9+BFU6drU1cHFtmnPh2NkQBDHVdJYbz
         eAeTC41DzjgTHHaVWUtADSYO1YUbEYG19QXZ2Lf6AuPv9SKUV9TBgP0KuDzHFUdUQHw/
         LKCWssH0rWPAbP8vvF1SXWAU6UrrlqzBS6YHzGxyyh72WxmvG6NAUOldsW7a0iIp1xvX
         FS5m9cZW5vgLvXb1qWJ9wjo6cAcMyuYYb5ruyZa4PeNstcqMtvk5u82dhA767+U97pIX
         BKozEKXLRkq1KOvBj1z5TmbObPH1J4oklfcui5/Q709SfbzgdalIYhjLF/RGbsveFL9s
         NE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743111396; x=1743716196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vt+RjYIF5jBbl4jDavT5AkEfIOndEZDQELaBJfix0fM=;
        b=SeomoOvg7JDKBGOTiDRgPn3Lx5R0//yGJsF90lkolURaa4kE45G0pDOYitCE2ZJsn+
         Weo85fHKrbOUaAIKl7ESc4BlOZN+lfRb6LgWaMl/9O4nbhMFWbTkXavQCoQdlLiNB+F6
         +VQcYt8OAURyl1SY5KQ5yTIMIfWJOnsjBqANo4fgGRwxuIQVf50AOMNbWvAosbXCpr/b
         zKxhvhCCqinWFMLwdNukcL1Cbh0sNnyDJSFxjZXxAqL/3ccB9cfPb5n+3+LscqSyV8zl
         4MGhMzLBbIPk7mRFA/ZttNw3lvXsFFe/C4XsPbAjMefoh4NAicQ4n+C6mMy7uo+6gE2n
         tmcA==
X-Forwarded-Encrypted: i=1; AJvYcCWEL6ukJEVbPSYe0vLYcHyHigVhs2OfyaB69uookU9oC31Flib4gmSTapQMmnZL1JwW1x6jJva5CgSO9Bk=@vger.kernel.org, AJvYcCXWq2TEp1IV0ZRbjmPl3YtD9aJ3eKjKGyEdA2LLqibYOKzAp86HdpJfElMy9SOwZLtQILLpDoPS39S2PMM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQBscVAd1RLLIAOehAgo3FgNeak3lqpyTTzwWzHAXzDanNZj6H
	pGjwdcULFnIfU8+gvkN0l8isryYxnY8/AISwKK/mdt2DxPWg687X
X-Gm-Gg: ASbGncu93LKvqyVofEK6g0R5rs2Fb8MV4k4KFlGYGFUzTTztbBQLPhRrfMOGhoJEnRg
	5t94foHsAOj1nF6TINYRmUIrDq+apBwhgN5uC7Jyz2s4I3kOZbxL7coFEfHm1QjtMXVGv1mawkF
	a9DSdBBe4/ox9uMkXNYdXmfJ6istk02kToCmdRcyU0LJvDOliIcoQqEVI+ewGBks7ZcwsLE5oD0
	WLXX6edGNrp+1/wh12Qm4818gybK3dPh1F3ZXaVTGyO1qIQKjncTBaUdD3cPbk6Vo95Hedrnzsu
	i/ab9pNDkLlzakS27hVSE30bUmC7dLVWoFmJbcIfobJ78ObVWJlfxSmzo1cbfk9gcNgE0Q2i9th
	yQDP6cHNRkqsLo61IyCU=
X-Google-Smtp-Source: AGHT+IE/TvMoCvEldYyvJ56ojLgJ9oJM2lccu4CA0dZo8Nu6+T4LJbrERdbFlF3GeV84s+HWM5AJeQ==
X-Received: by 2002:a17:902:e745:b0:227:e980:919d with SMTP id d9443c01a7336-22804968a98mr64293775ad.47.1743111395511;
        Thu, 27 Mar 2025 14:36:35 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee0d37sm4823235ad.91.2025.03.27.14.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 14:36:34 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Rob Clark <robdclark@chromium.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
	linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v4] drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs
Date: Thu, 27 Mar 2025 14:36:31 -0700
Message-ID: <20250327213632.7903-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Add support for exporting a dma_fence fd for a specific point on a
timeline.  This is needed for vtest/vpipe[1][2] to implement timeline
syncobj support, as it needs a way to turn a point on a timeline back
into a dma_fence fd.  It also closes an odd omission from the syncobj
UAPI.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33433
[2] https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/805

v2: Add DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE
v3: Add unstaged uabi header hunk
v4: Also handle IMPORT_SYNC_FILE case

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_syncobj.c | 41 ++++++++++++++++++++++++++---------
 include/uapi/drm/drm.h        |  4 ++++
 2 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 4f2ab8a7b50f..58d8a9035f7d 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -741,7 +741,7 @@ static int drm_syncobj_fd_to_handle(struct drm_file *file_private,
 }
 
 static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
-					      int fd, int handle)
+					      int fd, int handle, u64 point)
 {
 	struct dma_fence *fence = sync_file_get_fence(fd);
 	struct drm_syncobj *syncobj;
@@ -755,14 +755,18 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
 		return -ENOENT;
 	}
 
-	drm_syncobj_replace_fence(syncobj, fence);
+	if (point) {
+		drm_syncobj_add_point(syncobj, dma_fence_chain_alloc(), fence, point);
+	} else {
+		drm_syncobj_replace_fence(syncobj, fence);
+	}
 	dma_fence_put(fence);
 	drm_syncobj_put(syncobj);
 	return 0;
 }
 
 static int drm_syncobj_export_sync_file(struct drm_file *file_private,
-					int handle, int *p_fd)
+					int handle, u64 point, int *p_fd)
 {
 	int ret;
 	struct dma_fence *fence;
@@ -772,7 +776,7 @@ static int drm_syncobj_export_sync_file(struct drm_file *file_private,
 	if (fd < 0)
 		return fd;
 
-	ret = drm_syncobj_find_fence(file_private, handle, 0, 0, &fence);
+	ret = drm_syncobj_find_fence(file_private, handle, point, 0, &fence);
 	if (ret)
 		goto err_put_fd;
 
@@ -869,6 +873,9 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
 				   struct drm_file *file_private)
 {
 	struct drm_syncobj_handle *args = data;
+	unsigned valid_flags = DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE |
+			       DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE;
+	u64 point = 0;
 
 	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
 		return -EOPNOTSUPP;
@@ -876,13 +883,18 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
 	if (args->pad)
 		return -EINVAL;
 
-	if (args->flags != 0 &&
-	    args->flags != DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE)
+	if (args->flags != 0 && (args->flags & ~valid_flags))
 		return -EINVAL;
 
+	if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE)
+		point = args->point;
+
 	if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE)
 		return drm_syncobj_export_sync_file(file_private, args->handle,
-						    &args->fd);
+						    point, &args->fd);
+
+	if (args->point)
+		return -EINVAL;
 
 	return drm_syncobj_handle_to_fd(file_private, args->handle,
 					&args->fd);
@@ -893,6 +905,9 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 				   struct drm_file *file_private)
 {
 	struct drm_syncobj_handle *args = data;
+	unsigned valid_flags = DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE |
+			       DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE;
+	u64 point = 0;
 
 	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
 		return -EOPNOTSUPP;
@@ -900,14 +915,20 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 	if (args->pad)
 		return -EINVAL;
 
-	if (args->flags != 0 &&
-	    args->flags != DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE)
+	if (args->flags != 0 && (args->flags & ~valid_flags))
 		return -EINVAL;
 
+	if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE)
+		point = args->point;
+
 	if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE)
 		return drm_syncobj_import_sync_file_fence(file_private,
 							  args->fd,
-							  args->handle);
+							  args->handle,
+							  point);
+
+	if (args->point)
+		return -EINVAL;
 
 	return drm_syncobj_fd_to_handle(file_private, args->fd,
 					&args->handle);
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 7fba37b94401..e63a71d3c607 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -905,13 +905,17 @@ struct drm_syncobj_destroy {
 };
 
 #define DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE (1 << 0)
+#define DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE         (1 << 1)
 #define DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE (1 << 0)
+#define DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE         (1 << 1)
 struct drm_syncobj_handle {
 	__u32 handle;
 	__u32 flags;
 
 	__s32 fd;
 	__u32 pad;
+
+	__u64 point;
 };
 
 struct drm_syncobj_transfer {
-- 
2.49.0


