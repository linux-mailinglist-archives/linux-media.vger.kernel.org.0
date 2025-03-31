Return-Path: <linux-media+bounces-29091-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDF6A77011
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 23:23:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 734093AB648
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 21:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3722621C9F7;
	Mon, 31 Mar 2025 21:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KkLcBe6R"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CF518D643;
	Mon, 31 Mar 2025 21:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743456219; cv=none; b=U+gwlU/KZfmgGiD0mWETPB4aNaT7CX2u7qedzJdjmv/4WUUMKVAZQQdyN5KeUBR/nUMhbrXUrtI4HXtW15kFi4OHMlsdNAzoEUIWpdYlgvcEE/5N1DVRgcr8/eJy8V4f/es7alcG3QbQhfPvX2iX9dR3re07u6i6WK+jHHBIOnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743456219; c=relaxed/simple;
	bh=zzzoir/NKVG2Rvcc8WCrzNv1DRhYxgVfZRBrhklaH/0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d06ksY1KwvlAZU0wfaw/J+wm4PA93WDsIrV3wYvADu0rOMfZG71dwJodGnhKDtBGhJHGtFT5yTU74njkeVVI6a0JFGidDMgf/snLBo55rWD+VvFxfusIXjA4xR/mjr9OpN8MC9KVq2SWwL38c538G91c/GcgLhVwVKc6/ARfDe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KkLcBe6R; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-224019ad9edso9344765ad.1;
        Mon, 31 Mar 2025 14:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743456217; x=1744061017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oarhOv17S6NDCgmBz46l+qZChOY53z83EqBIJ4rTMrQ=;
        b=KkLcBe6R4sJKNHdj6NcGB3WuGkCgmSC0szSlI9iKdgjUDNh4h0E4wD4ZQaLYCpgBSY
         HGqGV/z9f7m95rHtM51cmovcQH6k0/JqCcZTvVCtdEfrojBcdAvCbDSO7xiUdp7bGBV2
         /MOQ7K18JDSAsWkexhNxad//WHPJu77YivbnkgpMWrSdJlJyahiYHb/Bla1VRI68gQB2
         beEZsGgBmfDX26CMYXSOExSgzRSG8KhkeSVU8QILRwaWAFjs4MgRYc3CyWa47kDondX+
         Up7b/PVqr/Smx2e7U2VASeBdLs1mCp9PYDRQuTvqSqZqsrwggmX3fyF/4zCuJRGZp7YE
         6nXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743456217; x=1744061017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oarhOv17S6NDCgmBz46l+qZChOY53z83EqBIJ4rTMrQ=;
        b=CBMh7hr9gMBqaQf+mS8GY6ItH6Fn3JPXVtshEUKwm6TOxmBf8fHdDPZUBrizCBSsd9
         RrdeZXl12wtox1y34E+LOiQzj5lzUdGaenMmQUIr0Wm4/q3eAEJcDHvnNZ8sgUVe8cKZ
         iCNBKe7h8w6NsR1XVg7Wi/Cc4XAWvj2RIRLDqoQ346ovxfn+i7SVswxjwONKNvxFY4Uj
         l0sjWMfdF8btATKirEoJJeiBVQt5UgMUty9D919/mjoPd1or/NDll0AWBIxeGYOmh1dN
         7MLdD4ZgzP0yoRL1gFr0MYp28URNJy2OsqJ9Yam8srjW45c2l9TsClMZYlnPNQqyTNmK
         +Hjg==
X-Forwarded-Encrypted: i=1; AJvYcCU2sVFAlYScWXyN8SZJjqeNY2/xMd4VYSV4N5oBOBaktckHd6zgOfz5InxdEui9uNH2j3D3oyFED+rMYZM=@vger.kernel.org, AJvYcCXXZYcXikukVzbMfbq4fU4aQqz9UBdnivjXOv2U5/4k2OY95zLLwtDxDNzmH9pPA5EM/uB0B7TXAESVLr8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEGV/+PdyGqeHYRByTXI2h4BIdPlN+ZPa2TSgk4v0CW10q8x3K
	YI2KrM6dDl0fwyIArxYetzuQJSkYR+2UTw7dZebSk09i2A7l9GLP
X-Gm-Gg: ASbGnct+W+ELY2yqnHmdPQk5pJqhlnjwOAc4YETSZCtlHpynjC7TNMePGqmMzC3PqK7
	gaGXlIxxBori44/ClLX4Z9BNJ63BkrgHbS5zR9FkiNxaYYE+2fcxZ+gk1fYL+u++bKxD+RbLSSc
	mErN/YOQ8wa74lAFCJcFfswgYCmWzufyj8gQSzRb9U/P64l8YynROBR6rLiTFtd8GfBzrYEJ8O4
	63jhnxBVfZQT232DQ9pmylbHyeoVl2Okm7EA9ORMBdfNLfiwER7RavHcc/78vHziat4iZ4qynFz
	AEYHlpWxzJEWjKYADrGwYX1/LgtmJepPeEYx315DwMBMsjZdwnxYf9qaZnXWZVhU0bSdiCXSPUO
	oZIOFMpqFXxLD3pLNEP7p21CzjRzj2w==
X-Google-Smtp-Source: AGHT+IGpFHC2qe1Je4WLPc7fUp41YqQI35b103OmAbhxl9meKcz7jNtqw9rDYNQRmlxEKTc350gKaA==
X-Received: by 2002:a05:6a21:1190:b0:1f8:d245:616d with SMTP id adf61e73a8af0-2009f645256mr16990239637.21.1743456217342;
        Mon, 31 Mar 2025 14:23:37 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93b69d996sm6839433a12.22.2025.03.31.14.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 14:23:35 -0700 (PDT)
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
Subject: [PATCH v5] drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs
Date: Mon, 31 Mar 2025 14:23:32 -0700
Message-ID: <20250331212333.16029-1-robdclark@gmail.com>
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
v5: Address comments from Dmitry

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_syncobj.c | 45 +++++++++++++++++++++++++++--------
 include/uapi/drm/drm.h        |  4 ++++
 2 files changed, 39 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 4f2ab8a7b50f..b0a4c58fe726 100644
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
@@ -755,14 +755,22 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
 		return -ENOENT;
 	}
 
-	drm_syncobj_replace_fence(syncobj, fence);
+	if (point) {
+		struct dma_fence_chain *chain = dma_fence_chain_alloc();
+		if (!chain)
+			return -ENOMEM;
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
@@ -772,7 +780,7 @@ static int drm_syncobj_export_sync_file(struct drm_file *file_private,
 	if (fd < 0)
 		return fd;
 
-	ret = drm_syncobj_find_fence(file_private, handle, 0, 0, &fence);
+	ret = drm_syncobj_find_fence(file_private, handle, point, 0, &fence);
 	if (ret)
 		goto err_put_fd;
 
@@ -869,6 +877,9 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
 				   struct drm_file *file_private)
 {
 	struct drm_syncobj_handle *args = data;
+	unsigned valid_flags = DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE |
+			       DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE;
+	u64 point = 0;
 
 	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
 		return -EOPNOTSUPP;
@@ -876,13 +887,18 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
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
@@ -893,6 +909,9 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 				   struct drm_file *file_private)
 {
 	struct drm_syncobj_handle *args = data;
+	unsigned valid_flags = DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE |
+			       DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE;
+	u64 point = 0;
 
 	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
 		return -EOPNOTSUPP;
@@ -900,14 +919,20 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
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


