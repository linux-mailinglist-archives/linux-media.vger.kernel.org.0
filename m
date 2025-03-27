Return-Path: <linux-media+bounces-28861-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 111E9A735EE
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 16:49:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D256F1895770
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 15:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA8D819B59C;
	Thu, 27 Mar 2025 15:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EnD8f7xo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07D9155312;
	Thu, 27 Mar 2025 15:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743090544; cv=none; b=Nmtp3vLxYwC0obl2e1SCIEBn00M/HJa0YGU/V9c3TgDTli26PtbfnsKLhegQKc5NECTM7t/Iq9V6YeMHZgVv+dBT0wgvPmRGURSjfrP7iiiCKc4gZ7DJchq9rJ28PWJlGMPOQvTLw7jvQzV1FdsCfW4c25sd4NyUNaHkgqAl3HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743090544; c=relaxed/simple;
	bh=6Sw1U/81t5H2tzYbP443kQVD2Ls/gE+4Ieuwol5b9AI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mb9KkOXv7s+9YjH3g7OBGVzl2LcmKluAk1eveJOKaOFkj+MwlFo06d7JVk+K4F1FUwf8DAWI/UY2b+HdOCzz+uSm7DQhKYhjaX3JH4o+JoMmeFnL8Ym9hrdT+c19+AfvhxhDv7QpSSLKMp/mQH+Dvniqhzm5Md2fb/ORwBOx6Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EnD8f7xo; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22409077c06so38588165ad.1;
        Thu, 27 Mar 2025 08:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743090542; x=1743695342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R+WkWznMaXIwTB3ZZo2m17BC/os/l608815ZqRblsww=;
        b=EnD8f7xogjZlaqPZr7tL58uCHSkLszVzk/avMu0OY10P6TohMaD+Xb5DqvDo2GGA6J
         zz6oAovtl9XvhIajeN380iPomrZ7UWq4EBb2XhZ2lPYoEcIWW20049UNSnY64Ae7sJus
         PV+81jAHHJOcR3qs4TNdNFkvwrCKfy1tZNF7YPJgRXv8Ugp+vxdJeMpoRYffu690voBh
         tF59+Y/OMw0Df7nGauoiQFMYN0FpD5C9dd6QaphSMbMnKmGXjF+kwA+XMqfVLrwfpO/S
         zNKaiSo5/InTMMtcFDA4IKp+gGSsyeGQWfF1/7g2rRpgRqxZFJSnpZ9W7XPqTDZ9+iLV
         uzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743090542; x=1743695342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+WkWznMaXIwTB3ZZo2m17BC/os/l608815ZqRblsww=;
        b=Dlr+YEkHOjJqGmLfaMLMkaVCzz2tUbb0FmqNyKaX6wKXiKaXnKSEJRuMTm7QTxqlke
         30kl38bTpjDPt4T3PJDDJMiOppgLw9f5LDG6SJYiaGi740srvewnCFPEPmYVOD+sOlIC
         UiyVY6q0XUjS/m4BvXDCQll3p1D60K9Z/tIycjD1ioz0E4/iPsJSUetHxAGmAH3YTRQa
         H6/yA+drOWtCmgqeqZbMfhyGIc5H3umNHaKZIbgLHGHIzh+HLdBwcY4L9hqh7ZiU8WaO
         QZJa2K0o73xoa6mPxSHTA19W/L++nnypo6EiNETerUEWbpEeN6LJMUbOKdspAreUeO4u
         hwcw==
X-Forwarded-Encrypted: i=1; AJvYcCVAj3u9Kswb8QuHYU4OGBe03AUj01M6TpsVwUDv0c6QNvJI/IS0pUjmXzZnljNk4j/arlAr9bMYlJbk2r0=@vger.kernel.org, AJvYcCVd5sy/pFAa6h3cti1b8o40M1C/78QwKuc5sG99/eTSpTNV0NwzV7PgbJqOzP+KkJYaLMlcERd5UyT9M44=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrKqh8mluIIPJNR3ej/A1/4IDxumd+LiXKGcoyiHlNcp+tWHqV
	UafETEAjZvTB4iuFpe71NOQ+SllcP4iVcVDtIIt63Y9j0rE/BYWp
X-Gm-Gg: ASbGnctX3ew3AXbCuRUZIDQX8n3AAl3HX4afQ30mMuoAtsW5hHF83iXeneZ4UbmQXEU
	Qdf8x2ninWmyjzSqnotp5BJbp1PYM3y1Ow5R54LNF0RaUVfBZJZMiV3cPfnCNZZqKKdFBH8b4TN
	7Y0hgyoZfaOM3GDde9NRR3DJHLCdMfewZf87HtysHML/GrH7dSchFUPAE6lwNk2U9nUtagI0Pe1
	Fe4jhq+TW7+FpYFrfwuQCVKojjovE+GURtakHUfwGK5t3WxKMtjWXjlNVPgo/cn7oXthGvSTY0O
	HVDF2gMQIViPK212UE3Ckb1/ztSXUr2QYe8G8m+xoxY+QOFCrsNP5kpSt8n/QFNxqdaUJd3cyvu
	tr8Gr3Wx+qWVkXr/zn4U=
X-Google-Smtp-Source: AGHT+IF7lVVDeWONYnV60fwShndweA3eQmej77IbeLpBdfzNQHqiYnWKtVJhAFL9WRt9+k+RKBEwHw==
X-Received: by 2002:a17:902:d2d0:b0:224:76f:9e45 with SMTP id d9443c01a7336-22804840efdmr53269545ad.21.1743090541726;
        Thu, 27 Mar 2025 08:49:01 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1df032sm962005ad.175.2025.03.27.08.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 08:49:00 -0700 (PDT)
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
Subject: [PATCH v2] drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs
Date: Thu, 27 Mar 2025 08:48:57 -0700
Message-ID: <20250327154858.52308-1-robdclark@gmail.com>
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

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_syncobj.c | 18 +++++++++++++-----
 include/uapi/drm/drm.h        |  2 ++
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 4f2ab8a7b50f..bc57d6f1a22e 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -762,7 +762,7 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
 }
 
 static int drm_syncobj_export_sync_file(struct drm_file *file_private,
-					int handle, int *p_fd)
+					int handle, u64 point, int *p_fd)
 {
 	int ret;
 	struct dma_fence *fence;
@@ -772,7 +772,7 @@ static int drm_syncobj_export_sync_file(struct drm_file *file_private,
 	if (fd < 0)
 		return fd;
 
-	ret = drm_syncobj_find_fence(file_private, handle, 0, 0, &fence);
+	ret = drm_syncobj_find_fence(file_private, handle, point, 0, &fence);
 	if (ret)
 		goto err_put_fd;
 
@@ -869,6 +869,9 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
 				   struct drm_file *file_private)
 {
 	struct drm_syncobj_handle *args = data;
+	unsigned valid_flags = DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE |
+			       DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE;
+	u64 point = 0;
 
 	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
 		return -EOPNOTSUPP;
@@ -876,13 +879,18 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
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
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 7fba37b94401..c71a8f4439f2 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -912,6 +912,8 @@ struct drm_syncobj_handle {
 
 	__s32 fd;
 	__u32 pad;
+
+	__u64 point;
 };
 
 struct drm_syncobj_transfer {
-- 
2.49.0


