Return-Path: <linux-media+bounces-28788-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16595A718B1
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 15:39:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB8DC1774BF
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 14:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED4F1F1303;
	Wed, 26 Mar 2025 14:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Icnj6cfd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0485B1758B;
	Wed, 26 Mar 2025 14:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742999949; cv=none; b=ARzJZ5TI4/SGPRMTtssKyFyYnr+aidzOHlaoJ4ob04KDIkqUAoZTkzDZRHPrQybfR2MINkd/BRdEInqalaoClFafXb1pOGty3AzCCIyM5TeDjU/5IYenW8NMioRK278w8yvMxFm0ncOf/BCy8xALj21fzJD+vjDotOWov2r5pTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742999949; c=relaxed/simple;
	bh=uk2J5/c4Yu4HFsig5DEaqa3GGClXdjh7FZ6I9gY9hbM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W+h3XY4seZaLddGnIUv09dqFDkLxkk5rwcRGLnmZHKBtAym532pBwtiPH9xwb8rEdv6tCUKbrW0J5KSuUVmjHhV4Y6fQ35BBLghF9u406vvVk2KkKD2TVtit4xzCU5ACNx2PCKfTumwCDleeNEtQGDvqrOryd6y1ZXZeRm2Djuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Icnj6cfd; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22548a28d0cso158077355ad.3;
        Wed, 26 Mar 2025 07:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742999947; x=1743604747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6eqkhZ1Vwmt9gRQ04JNUAxBEvP0I4y2gPx1o8AAFWU=;
        b=Icnj6cfdcmsHrjVXydkSgJSzydZSJtd+3z0IPKQ2HUWofffcuVW4QpNJfLWIu/izgt
         t3AI/zJ7Eig0g/iGgUd35f5HfCtS6rnvGqfQsBNJ/EpEUx9J2N3yrFLfqeHKPZL0qfn2
         lea6X5uDeGL383g/8/FXSqskpwiTpB5vyPmwsUsH4TbQa9h+pLzAoxwsip9wAZjvFhXN
         S895OBL5Gb8Ud853jKzq2vS6V4yH5Lbg+1djyqns8exxPBS8YVVvM3jChu+3JFOO5S+S
         TO1/rGOfe14Od9M4CURnVQ7z3ahZCoaYOUvrDNbVacK4lSrYHcGReeY3SuFFRxQcbPQl
         ezGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742999947; x=1743604747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y6eqkhZ1Vwmt9gRQ04JNUAxBEvP0I4y2gPx1o8AAFWU=;
        b=Y8DqRpm95wH22wGScKXw3zjjTZ8XVIkWkMl6z3B42DBncIEwyxM1xhtzTDTZXvm2nK
         dI9Dc/U8JmBhLiLGhgmcwTSJeY2o5hb27x7YmfX56H2QZHiw0BGcqXZcyLXUiiMqB0wJ
         rCTYJhvuJR5r9AMnysG8DZjm2JtWX3RfYzgOSmpIxC85m2GTwGeMRhq9wthMkH+sbbyR
         JzsFIIlxniqphoVwu14i4UMvlq/oIv+tL0cpOlnfD93FqgDGPTCgxr3eVilF1qckRlKk
         BbNILIKtx8+onWlzf2dCNDvcm9Qlxdz3qZZ8Sk5UtkrtgjLJS2r+S/N1Y/1IPnvFIwSX
         O2/g==
X-Forwarded-Encrypted: i=1; AJvYcCUzrJa8E4xuSwPdmx+SggdQYGXZshaa2LpwMEMHSkg48RNX0rvdIz5AAukk7B23CLMd579aeUW5Yg2MT2U=@vger.kernel.org, AJvYcCX2YGFpqVTwTVoiUMpYBD5lK9AzEKPfD4k7kPeoY2879HZJb1fdBWOEIKSs2hpqky/KLt03IxEs3Kdjqfc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTKbfHn192fD61HhOfggmEQ/MxZmgMi41cM1TL6Divl68ZQYtm
	1TlTJM3CgWAkCRphJbaYqQWqYOaAdFwhTOqAp+Qeca7iVLefbZecEyGqNg==
X-Gm-Gg: ASbGncsuxtRLt1CWVcfVUjl671Xo3YynEXVoPwIgi/LAdtvz/VEm0k9ycP001ttTXqS
	kSkeg0G3HydShWK5d9lHvNM6ysahB2IrOGkqQmD44dfk4o2XABT3trot3ftUS5uOUFXO4SdhHMw
	yRMi2uUHtSY9AVelhcQyVwlK1WZSbngE+U5TLPea4jxaUeaH+AscMiYcjj4s+rnNM7ih32SVUgs
	rWzWtj19VsuOj6Jh3TM7F1zHPKuYk457X+wmUgADAPrBmV6lQt4jfikevvVpGMwAABfGCoRf1J1
	u68MtTsHC+VsE14zWJLbt2IK0d2mBG3pKGLKTuGc1dYDfo8v33fQlatIUWK2HDmfbFnrhmA83+5
	NUE8z6JYCb+pcHYao2Ok=
X-Google-Smtp-Source: AGHT+IEBdj4C54pk495ep9DblHTWWweUHbck96M9LKkZuKckCu/4LFHmW8yUHZCPndAEkbi38ZOc+w==
X-Received: by 2002:a17:902:db01:b0:223:5c33:56b4 with SMTP id d9443c01a7336-22780d77ee1mr278798465ad.20.1742999947013;
        Wed, 26 Mar 2025 07:39:07 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2846270sm11011904a12.36.2025.03.26.07.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:39:06 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Rob Clark <robdclark@chromium.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
	linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH] drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs
Date: Wed, 26 Mar 2025 07:39:03 -0700
Message-ID: <20250326143903.24380-1-robdclark@gmail.com>
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
timeline.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_syncobj.c | 8 ++++++--
 include/uapi/drm/drm.h        | 2 ++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 4f2ab8a7b50f..eb7a2dd2e261 100644
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
 
@@ -882,8 +882,12 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
 
 	if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE)
 		return drm_syncobj_export_sync_file(file_private, args->handle,
+						    args->point,
 						    &args->fd);
 
+	if (args->point)
+		return -EINVAL;
+
 	return drm_syncobj_handle_to_fd(file_private, args->handle,
 					&args->fd);
 }
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


