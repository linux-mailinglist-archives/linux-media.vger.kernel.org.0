Return-Path: <linux-media+bounces-29176-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3718AA7849A
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 00:18:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E32F87A1FBC
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 22:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 393A521859F;
	Tue,  1 Apr 2025 22:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjE4k1Wo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE9821481B;
	Tue,  1 Apr 2025 22:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743545810; cv=none; b=NbLGg5yMvwNPHO1RoZIHlLLJILz7hVLK9flmYN/E9UhZCe7OZ+jdWMbhrmCfrt7eCMGmX3nv4sFFUb/NTH+CtplP1QTf1hu8Vuz3SMDf5GheAXkto5YNF/56Y7OT6SVdwA1NFgd2qBKnDSpWlA+sVKbdFnSVebacQFabCZ1KSIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743545810; c=relaxed/simple;
	bh=l/LNTnxn2pxy1dogLQehrIZ5Nft5td5AfOI07SrKY3k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=biJWPvw78K/Mxc8b+72qVM8WY1aIpFPTHDQoU/2AMie4YmG2TEB8QCgSaMFnQBGRlDleBdH6lWuE/Er3bUialfDA78NfM3lsld2lwhGGFXPehWgYfHqCrDinM2tuY7czJDT0OIii1R4a3a0ZAjigeGm39RO0T6jCXb5GS83Kyqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kjE4k1Wo; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2241053582dso102201165ad.1;
        Tue, 01 Apr 2025 15:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743545808; x=1744150608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6pjJFrDt3l5lA2Y5cy0IcLmKsiR6lTrZ7yPV2lCZbZg=;
        b=kjE4k1WoWF5W6VEZp+rFAds1iBDIeiAkKDze8kHYvj8sF26aMJNT7svKBvUPcdniOv
         xN1KfqD/HBINO9e4WaTm1+Lv0Z1goqiiAcIuYD9OYRmkIZffM69HndPMsfFphdyAjsrP
         k/gpJ8YvNQR7pc+VM8tg0Rgew6CH+wDKIwfsN2yMbhpioryPyYEC4syH4OqwVl7thqNr
         q61SiyVbX87yy4t14oFh59/A7i+oN4pttDh0J3nmA1Jrok1YUVkf4XQInqe69Z7NyW4n
         8YrexcYyyKVSmxzwjWRMRQGUuuncH0rCQ6tq20mn5qgpGJU24C51v3WZAT0X+uX0To3g
         Zz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743545808; x=1744150608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6pjJFrDt3l5lA2Y5cy0IcLmKsiR6lTrZ7yPV2lCZbZg=;
        b=o9tkaDBQvMoG3i441vvpKStmEB6R4b5hTpnt+iB06Dy/PXqM6rygTabnQjj8EVbGCM
         pFldOtSsd1yluMHyRyU/cVs4RC2+HF5QvdLjI+nvkARMPqf4o3+TcfzzHQoNjSpTmhKV
         L9rhuZ1GxYekfQvIpJ+Forhhc/WZzYY64hIF5PvD9bx4dn0KqeLa2ssDNpCx3Szoz9EH
         4qooxRWlP8ZaVBQN8dvHbJqKhQkumEcoEYrirh6kXrDE2aLUZfhyhaTYhPkyA5EVXbXR
         e90/qq4qx7Y0B6jMhkQrIIgsWfIMO70qvLTD7R/Ocp4W/D5kBQeoAV3nTs9sLFesN1Ki
         wtDA==
X-Forwarded-Encrypted: i=1; AJvYcCUXFcK/QOnDwwfhU2ybXh5kdf+IrxVF1U8lQCXQUqhOMePjq9qXd63mGp9nFLsipFjxPEa9saZLW2zKK5U=@vger.kernel.org, AJvYcCVGgtphj65Vp4ZR3qMSASW4ACFIKdiroi5GNIiy7IAMFxAd5dTJ2FSZ9hxZPEPAIozaDDslU9vQVS+TtZM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl212km67lqhALnrYDdvcZRhXW2fK/C0S+9PalWNvqKeh0IFHv
	v/L9hnfCbjzpz0HrVHKuZ7O8Xrt2ZXauNsEVRyNQbxMp7SFbE4YS
X-Gm-Gg: ASbGnctYx1W79OhByf/8zUUrROHo5AD1rLwFOvHv2Z+HJ8id3loenDrbC8x+nTdNppn
	1MKHc1kybQMsjxloY9p/kbI7ZpqorjBqnqKAa6UdfewgVoQyUfGrMmf7g4hWTQwNWiZ7nOEXzC7
	28kwqLZQSDh4WUZ1QiWSi1TUfAD1jEokH5zeHKMN+RfAYCDX+9xdC6l3t03/4GvogSW6zkFlFeV
	N60qe6BE28i5TC+yw9R2XLEDEiBKix10uxygg2m1/K83hbWTxXlrM7KXkmHpcY1H04uDiDtNCAt
	apTDqzXwHS5TsDOo0zsBMIyki5c1Sg6heJjmZAi15j/Go5aXcU8q8gNve0RTg1ZmxP6F3qrlc3u
	t1oilBQIxjiYm+Kt9324=
X-Google-Smtp-Source: AGHT+IFWsM/vg8gTEwV01NxefY3BYdtce+TTnANxhcuLyKtYcd30tGt/Vxio0MWSb+uhR603BU132w==
X-Received: by 2002:a17:903:11d2:b0:220:c86d:d7eb with SMTP id d9443c01a7336-2292f9e529dmr241352415ad.36.1743545808126;
        Tue, 01 Apr 2025 15:16:48 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cf14csm94451805ad.137.2025.04.01.15.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 15:16:47 -0700 (PDT)
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
Subject: [PATCH v7] drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs
Date: Tue,  1 Apr 2025 15:16:43 -0700
Message-ID: <20250401221643.87504-1-robdclark@gmail.com>
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
v7: Add check for DRIVER_SYNCOBJ_TIMELINE

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_syncobj.c | 53 ++++++++++++++++++++++++++++-------
 include/uapi/drm/drm.h        |  4 +++
 2 files changed, 47 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 4f2ab8a7b50f..3e41461eb9d6 100644
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
@@ -876,13 +889,21 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
 	if (args->pad)
 		return -EINVAL;
 
-	if (args->flags != 0 &&
-	    args->flags != DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE)
+	if (args->flags & ~valid_flags)
 		return -EINVAL;
 
+	if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE) {
+		if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
+			return -EOPNOTSUPP;
+		point = args->point;
+	}
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
@@ -893,6 +914,9 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 				   struct drm_file *file_private)
 {
 	struct drm_syncobj_handle *args = data;
+	unsigned int valid_flags = DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE |
+				   DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE;
+	u64 point = 0;
 
 	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
 		return -EOPNOTSUPP;
@@ -900,14 +924,23 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 	if (args->pad)
 		return -EINVAL;
 
-	if (args->flags != 0 &&
-	    args->flags != DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE)
+	if (args->flags & ~valid_flags)
 		return -EINVAL;
 
+	if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE) {
+		if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
+			return -EOPNOTSUPP;
+		point = args->point;
+	}
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


