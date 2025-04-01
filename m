Return-Path: <linux-media+bounces-29167-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF03EA77FAB
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 17:58:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30BEE16D5F1
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 15:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901A120D4FA;
	Tue,  1 Apr 2025 15:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOgLhsQ8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1279620C49C;
	Tue,  1 Apr 2025 15:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523086; cv=none; b=oOER72FmLX3gjuUhnIw2Id6HZn2W9Y0+dPcrmTh64P033NgnDWcoDIcr5b1VP2t5xFCae3as7qdzjbkahvg6FLlF/tbrOEJaEohGE8Yx9Kpk8kicLTBoXxkqrg7/gbIYgOUZVXjlgqoZ6aGJcPUO15TqUWPnhbLPP70JlKtcU9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523086; c=relaxed/simple;
	bh=8YeyYoNsMHeV1jtrId98WfFjQd/HCmB2Nlk+Q5SIJJA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A2rwUGuKgqgOV45oJ+GXQkq/T1FBf31r7ErnGMgPtT/Tagi/gTGFCE1BP2aCMw+OaXCxo2tZ7K5Mx4eqlFDv0/S09biEci//QVCrN1rm8F6Y2ZUkLueaJYZlYS2huX6WUp1RbHobo924AIWBgkPU9GgEN29j9biWGE9axRw0DjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOgLhsQ8; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2295d78b433so19590475ad.2;
        Tue, 01 Apr 2025 08:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743523083; x=1744127883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fJH6ATFt5Un9kLuUVs0DY+xyNkxCSbS19/se7Ih7dOg=;
        b=TOgLhsQ8xCZiRozd3mzeLLVHKuk1clB+dCSCIses2W4n+Ok85Z2uhq5XxFSzXG6k9i
         PjZATV12YWvBgiW8Aav/CH7kdaSvMlDoqpv1xfIAovYPkY1I48xOnuCjTvRLIdJ0R52w
         o+1PdPmNabGW29nUgbEHkyfXMbUQq1KBd7BMHx5hs3ZnFmHM+Geds0yQkDRc3TKOmBDG
         clYu6UWNVHWcyjdII3hsJDLWDlkm4iofkWECcRMsX1T0FJFcsN3VYfYCFhe4TVbEB+8P
         tgiNsDi8+4752Ul0QMWuf0+ywf0ZFiIgjks91T7hMn64iNOEXeQR84fJwSLs0oqeTTif
         An9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523083; x=1744127883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJH6ATFt5Un9kLuUVs0DY+xyNkxCSbS19/se7Ih7dOg=;
        b=pOv+KoDQz3AivnUooaXOxl7LJABlMEGJnxgZGT3PA8ePBOMz60sNpGfPjOLVun5oBa
         fQw6NV3wa+yVQwdD+l8U7VDQik3Ag8P+BoDFQzHFlDGd7YEI2HYsC+rgRFep1d6pE70w
         VS9986bNAS85ee+/2AwNVX8WdvjS+Mr1iZwsgltvzkKKumnvd2EvX4YIYdkMxOuEThQ/
         KXzmjbpMN2JbZea+QLzFc3xUd1HqSndBdjmzFTHAkp5mD1M+t1k35ab3EhPd5ImMTwSx
         OBkxysS/pXXMlZNZDDHNXF0wIFFh+/4kdWXMvvtLwb6VGKfXvifizIMRVGXw8f4GcdXm
         Q8xw==
X-Forwarded-Encrypted: i=1; AJvYcCVZljuHEflcq3a0bxJjyWxTaGeR3INXwHXailiBBoGYAMRyVsgmF9mKUNSnRbPsV/iBMgKS9xz8oVj4jYg=@vger.kernel.org, AJvYcCVsZWZCuXR8mUDnK7wuSV5N/3KOGBj6/zJdC7CX38caUpRmneQ64WDTuXdJfud1gXpbkMIU1B/6/S0ODlI=@vger.kernel.org
X-Gm-Message-State: AOJu0YydZVIvA+6y5bpn5pyl2q2CtDde9SQkdj7REoqdmmOEO3xVANXY
	vJ/hEYCaGLoYOZlUGnbMWb9KdPM/9g2iwjxkvLC1xB3cN2JPR86y
X-Gm-Gg: ASbGncu5N7/QfLu7zPsh0LUQGAEVtwp2IA6WR1+I8bLGIlRUIDivOz5rQY2jC/OzrlC
	Sj9tEJ91LqhoPkklPyeI3uNKuRrKaDl5JkgZ9HcaKmwQvT4V9ZfrExmI9t3+3Qw/js9MO3E6sR4
	sgSssw6yqYJ+RHbx6lvUcByCL2FiiX8Ftjro4iEvmJ7XmEMolVHUEAmQG5gwA6twBhFsMWrX0yS
	zMLlrAyf8Jlvy0JiwS2TIqYl0fszlCoRnYYaAQSZrVPULtJESQFGJUEd89QYzLQai/3rVghmYx5
	9Q0YPY5C6X5uDUBynJGm3v6OG0tTZzpcl9fKn3VlkF0dyiNIuPCv4qAhvJak8wBD5W++FU9DZzX
	Pv9q/RsS9/9oVI3ve7Nw=
X-Google-Smtp-Source: AGHT+IEMQK5Uw8F9wEfsJTHQFcSwehiUaH4GbiWL58FJVcHeW3soaaFsqIizRSu/dHaDx3lBd1yIYQ==
X-Received: by 2002:a17:902:cec3:b0:215:b473:1dc9 with SMTP id d9443c01a7336-2292f9fc071mr220976905ad.46.1743523083175;
        Tue, 01 Apr 2025 08:58:03 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1f937bsm90014575ad.222.2025.04.01.08.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 08:58:02 -0700 (PDT)
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
Subject: [PATCH v6] drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs
Date: Tue,  1 Apr 2025 08:57:58 -0700
Message-ID: <20250401155758.48855-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
v5: Address comments from Dmitry
v6: checkpatch.pl nits

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_syncobj.c | 47 +++++++++++++++++++++++++++--------
 include/uapi/drm/drm.h        |  4 +++
 2 files changed, 41 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 4f2ab8a7b50f..636cd83ca29e 100644
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
@@ -755,14 +755,24 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
 		return -ENOENT;
 	}
 
-	drm_syncobj_replace_fence(syncobj, fence);
+	if (point) {
+		struct dma_fence_chain *chain = dma_fence_chain_alloc();
+
+		if (!chain)
+			return -ENOMEM;
+
+		drm_syncobj_add_point(syncobj, chain, fence, point);
+	} else {
+		drm_syncobj_replace_fence(syncobj, fence);
+	}
+
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
@@ -772,7 +782,7 @@ static int drm_syncobj_export_sync_file(struct drm_file *file_private,
 	if (fd < 0)
 		return fd;
 
-	ret = drm_syncobj_find_fence(file_private, handle, 0, 0, &fence);
+	ret = drm_syncobj_find_fence(file_private, handle, point, 0, &fence);
 	if (ret)
 		goto err_put_fd;
 
@@ -869,6 +879,9 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
 				   struct drm_file *file_private)
 {
 	struct drm_syncobj_handle *args = data;
+	unsigned int valid_flags = DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE |
+				   DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE;
+	u64 point = 0;
 
 	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
 		return -EOPNOTSUPP;
@@ -876,13 +889,18 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
 	if (args->pad)
 		return -EINVAL;
 
-	if (args->flags != 0 &&
-	    args->flags != DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE)
+	if (args->flags & ~valid_flags)
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
@@ -893,6 +911,9 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 				   struct drm_file *file_private)
 {
 	struct drm_syncobj_handle *args = data;
+	unsigned int valid_flags = DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE |
+				   DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE;
+	u64 point = 0;
 
 	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
 		return -EOPNOTSUPP;
@@ -900,14 +921,20 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 	if (args->pad)
 		return -EINVAL;
 
-	if (args->flags != 0 &&
-	    args->flags != DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE)
+	if (args->flags & ~valid_flags)
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


