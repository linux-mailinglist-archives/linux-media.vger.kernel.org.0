Return-Path: <linux-media+bounces-28866-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2BFA736ED
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 17:36:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EF7C1899D05
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 16:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09C61A5BBC;
	Thu, 27 Mar 2025 16:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YWH/iMod"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE624165F16;
	Thu, 27 Mar 2025 16:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743093370; cv=none; b=XPOW6NLX8uzKKKlCd9e7+nMqq+pISWxAEJUqGu+DgnkRCB/GOvsKB1z7L7ZJLxxiczVjPdcejCgui3qRI3uyBgcXnHPAFR1yyLs2hPNU9WddW4ORLrmhSPC2RUUp1NZxLQVgyTNSOLeTkjEM3VSz0v8WCJhe7WJNeHLIH9JTBLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743093370; c=relaxed/simple;
	bh=0QNMDSoITWVt4lr443Z+qaQZ4/dI1HZ/52gROHScnRE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZmqSyTAM0mF89oyhyvFF3OdCMFpVIvHsk0T26BLR9aqwspkT2ElwqyGHOheEDk/ja/35R3FK3K6WAun6q5bFCm+i2I+aZkcdjxxn3quA0X3ibJ2+binE3Utz7oR30TDUeiLdhsslvsW88qSrUvXh6n6obH3eRNZQZeQgSHaK3QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YWH/iMod; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-226185948ffso27553865ad.0;
        Thu, 27 Mar 2025 09:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743093368; x=1743698168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LmxjHPEoAvJ9V++u0ZZKt2L66dWQUhIJPZo7wO/C09Q=;
        b=YWH/iMod+xSMUQ+W7n8Mczboh8onOfl5JSOV35E8WLcCALhAcAI19AKsgVHaVMc9pN
         HnsU58AwbdwnKw1EIKhfz+8xWqnjWS7jB3gGiubfAYBBuhTRbjT8eKHZWRLGYn3yL2On
         ouBX6OcyZcFXIatfQew6/Cy/ScOpWymJLKdbsWYpJgooUcxhsFgK2VcZGpNoET+2tHpb
         NXbT+njHdlOkW3h3NzVl1otCJAQamcmWNA3kT7l65gVhhvw66AjXU1hOWsBhcnMJ5Htw
         e/I/BjPyUGE+o3S68PvJF2J7mkpiZrCV5fgXza0beSJbHsUBHQYGrICLKOr0wFpwkwZs
         XUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743093368; x=1743698168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LmxjHPEoAvJ9V++u0ZZKt2L66dWQUhIJPZo7wO/C09Q=;
        b=FEIq0Ppn2jtrC5ErlQ2d3wpTZserhnXxl8wYP9iESgSssDC9hsYKjpGAzf1fR5di1M
         UbymjaS+OOkF8D+OeTVZcCZoXjAkBASxxhipxTrUe8WduUmYlaad4UCEUIP62JJJkIc5
         0NAretonL/pMRJ80hLvAHxhPP2dbARRMnl1w0cw5rMxla6e4urr1exZBW3aNOkcH3x47
         1VzmcOchSjAuvl7HtFp9yI/QXcZAAES7XuBQFJR9CHcZROi2xSZsGlSpWMZW1H+QVzLf
         h87Y2wXhQWq3yJW/nT60nDW/ND2PPAYE5d9dMno1s7b5jjg69u6XKy4jeD5kAmbtTeZk
         1xrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBC4+BrZ1Y9PoXT5uIgOLI+HW3l5EMLp24oqpyLA2HpijYkSYh6ApOLBJ19f3sy5X2Bw9monwRe9uiNHI=@vger.kernel.org, AJvYcCXnWCM24Fmhj80yQ2QQ3IzNB29/4KMsxLxEO1xOXTHW/Zfkj+lJyo1aamFS+oQc0e1EeQiwbhnasfGbSK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwGuOhhCzzbKSp1YXt0BQpPuyGEB8JryNcxiDWZVDLo1+EUVdG
	nOgio9CynZKOg+Uxh+RY3XPoXem98Ki/ozMim5GU2GaPG/QWhfX+
X-Gm-Gg: ASbGncuPSZqXpGUyQw5iYWqyHDRo+iVo/le07KVAiFxrUzv/0Y/DGnuAfJQMmD3t53r
	wpLTzYl0s6/X2rXt8ov1huuFC2NuI3yj1pO086R3VV8R7zSFWdPlB7hoZG6cwVnJQ2U26Z8CspF
	UfAWSlwFFQp3gbS7AiYQtGKxnExOXXo7UxZcHNlbx4if69c9iggjP9Xcc3igzBeTQgOSR2G/OY0
	hcQ0LdMUCKlYPFJiCPSQme13CgjxxoDvXi997Gp+o1VTPbvkDTd22NetfrTSpnJb3wHyyAUQ4JI
	DztfkMBxF92rwQdhoG+NH+lYUwLEbXVeEiBSpLYTL1MDEccfqNffw/lTvHQpTdVgTakN/Cnu/f0
	1TRU8pouRLEiqixpOYq8=
X-Google-Smtp-Source: AGHT+IHWZDl5zkqZIwHY29NR0GM8Q+CqAF9P42JqdFTTVI0DfFTzZMOYU6wY0UHJwzx2ehMvee/T6w==
X-Received: by 2002:a17:902:db0f:b0:223:525b:2a7 with SMTP id d9443c01a7336-228048b23ccmr63535595ad.15.1743093367707;
        Thu, 27 Mar 2025 09:36:07 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1dece6sm1539855ad.192.2025.03.27.09.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 09:36:07 -0700 (PDT)
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
Subject: [PATCH v3] drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs
Date: Thu, 27 Mar 2025 09:36:05 -0700
Message-ID: <20250327163605.54760-1-robdclark@gmail.com>
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

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_syncobj.c | 18 +++++++++++++-----
 include/uapi/drm/drm.h        |  3 +++
 2 files changed, 16 insertions(+), 5 deletions(-)

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
index 7fba37b94401..dd0fd13eadbd 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -906,12 +906,15 @@ struct drm_syncobj_destroy {
 
 #define DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE (1 << 0)
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


