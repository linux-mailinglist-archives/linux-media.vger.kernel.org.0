Return-Path: <linux-media+bounces-28854-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC140A73400
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 15:12:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC69E7A763F
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 14:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98C4218AC0;
	Thu, 27 Mar 2025 14:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="e8a1iX4A"
X-Original-To: linux-media@vger.kernel.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com [136.143.184.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCCC21772B;
	Thu, 27 Mar 2025 14:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743084644; cv=pass; b=MfstQEv2ALmy/hG4NPufoPDcPjNmDverOIx02OgqmlCYq+ievNqxHmFYF1q0Btz5mvubOuT5lRWHeOXVKrSuZ5d1HpG3oqXwLvHWSQw2Oakl57O0TkYB1Pdrg7lOhUE/wuB5IJJOqCowKDFY5JAzErwmDQKUuc2rE1295IpRFQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743084644; c=relaxed/simple;
	bh=+9y6/OPc4ZGSjRrAzE1pjs+sfwz3qx/bWThY2KM7f58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NGO5WiAXyFAbVsWkzmKNU0b+YaeUVoZiRBS+ExdH+rVJAcKhT4dwPnRScA3kUmulzI2JcasMyPtaGNFD5D0OJz1muDdz0ooFR9UjbCkF96FClxLocJicE8JwFcIme+OSi5AdhdhQUTgD9v2OoIoMoi+En3Jy8UzYSL3ug4TtBao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=e8a1iX4A; arc=pass smtp.client-ip=136.143.184.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1743084613; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Hn6VVoga5d6gPyo4FH4PTG3jE11pWfHHWBKkKXveRQVJDLfHQCBq/5ibKhtHyp/APZ2OlhE38yC3UFA8k4BoIx179WRJuWULCprmD2JvtVVFtoLo+eo+toqPFYabSfZCrSR9Vs7wnfxtmv/tIPg7PNJVTOOjHVaEuFfVV5wcW5E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743084613; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fTMTGn8aqBGa5RD+wIowZDsO5/4Lq3ZWH5/3uWwDQ8Y=; 
	b=K5Hqjd7SjI+061+Yl2oL58EOwI5+5TIKd5fX1fpWpI8xLjUxDm+/4+Bc3rQljhbKih5W/j5h21xYCasqKiM5/w5PzaAm0iGh0ItzkLtouSbUY9qrgOR0xLQHh7fTVSPVJmxQhuT2FA809jGMbg/ZRKFgp1NNMX7kpRX2/OvTOpw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743084613;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=fTMTGn8aqBGa5RD+wIowZDsO5/4Lq3ZWH5/3uWwDQ8Y=;
	b=e8a1iX4Am2MZu6qzts9yZ9zV96XKNKlqv1L/SucZU3QM7sZGn5q3zKFtIE9KMc7Q
	X/XMbutm37UocvLWDIRQzsWLcdz0Nt48TDfUNPGW+42EKlBTA/C/JDXg6L/qESmzNW6
	HnrFmKkcnUWhwkvDeSbGyA+EzFmUPvNzk98eu7uM=
Received: by mx.zohomail.com with SMTPS id 174308461171723.620238265796388;
	Thu, 27 Mar 2025 07:10:11 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: ?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: kernel@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH v3 2/4] drm/panthor: Add driver IOCTL for setting BO labels
Date: Thu, 27 Mar 2025 14:08:35 +0000
Message-ID: <20250327140845.105962-3-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250327140845.105962-1-adrian.larumbe@collabora.com>
References: <20250327140845.105962-1-adrian.larumbe@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Allow UM to label a BO for which it possesses a DRM handle.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 40 +++++++++++++++++++++++++++
 include/uapi/drm/panthor_drm.h        | 19 +++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 310bb44abe1a..488d17466494 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1330,6 +1330,44 @@ static int panthor_ioctl_vm_get_state(struct drm_device *ddev, void *data,
 	return 0;
 }
 
+static int panthor_ioctl_bo_set_label(struct drm_device *ddev, void *data,
+				  struct drm_file *file)
+{
+	struct drm_panthor_bo_set_label *args = data;
+	struct drm_gem_object *obj;
+	const char *label;
+	int ret = 0;
+
+	obj = drm_gem_object_lookup(file, args->handle);
+	if (!obj)
+		return -ENOENT;
+
+	if (args->size && args->label) {
+		if (args->size > PAGE_SIZE) {
+			ret = -E2BIG;
+			goto err_label;
+		}
+
+		label = strndup_user(u64_to_user_ptr(args->label), args->size);
+		if (IS_ERR(label)) {
+			ret = PTR_ERR(label);
+			goto err_label;
+		}
+	} else if (args->size && !args->label) {
+		ret = -EINVAL;
+		goto err_label;
+	} else {
+		label = NULL;
+	}
+
+	panthor_gem_bo_set_label(obj, label);
+
+err_label:
+	drm_gem_object_put(obj);
+
+	return ret;
+}
+
 static int
 panthor_open(struct drm_device *ddev, struct drm_file *file)
 {
@@ -1399,6 +1437,7 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
 	PANTHOR_IOCTL(TILER_HEAP_CREATE, tiler_heap_create, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(TILER_HEAP_DESTROY, tiler_heap_destroy, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
+	PANTHOR_IOCTL(BO_SET_LABEL, bo_set_label, DRM_RENDER_ALLOW),
 };
 
 static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
@@ -1508,6 +1547,7 @@ static void panthor_debugfs_init(struct drm_minor *minor)
  * - 1.2 - adds DEV_QUERY_GROUP_PRIORITIES_INFO query
  *       - adds PANTHOR_GROUP_PRIORITY_REALTIME priority
  * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
+ * - 1.4 - adds DRM_IOCTL_PANTHOR_BO_SET_LABEL ioctl
  */
 static const struct drm_driver panthor_drm_driver = {
 	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index 97e2c4510e69..26b52f147360 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -127,6 +127,9 @@ enum drm_panthor_ioctl_id {
 
 	/** @DRM_PANTHOR_TILER_HEAP_DESTROY: Destroy a tiler heap. */
 	DRM_PANTHOR_TILER_HEAP_DESTROY,
+
+	/** @DRM_PANTHOR_BO_SET_LABEL: Label a BO. */
+	DRM_PANTHOR_BO_SET_LABEL,
 };
 
 /**
@@ -977,6 +980,20 @@ struct drm_panthor_tiler_heap_destroy {
 	__u32 pad;
 };
 
+/**
+ * struct drm_panthor_bo_set_label - Arguments passed to DRM_IOCTL_PANTHOR_BO_SET_LABEL
+ */
+struct drm_panthor_bo_set_label {
+	/** @handle: Handle of the buffer object to label. */
+	__u32 handle;
+
+	/** @size: Length of the label, including the NULL terminator. */
+	__u32 size;
+
+	/** @label: User pointer to a NULL-terminated string */
+	__u64 label;
+};
+
 /**
  * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
  * @__access: Access type. Must be R, W or RW.
@@ -1019,6 +1036,8 @@ enum {
 		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_CREATE, tiler_heap_create),
 	DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY =
 		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_DESTROY, tiler_heap_destroy),
+	DRM_IOCTL_PANTHOR_BO_SET_LABEL =
+		DRM_IOCTL_PANTHOR(WR, BO_SET_LABEL, bo_set_label),
 };
 
 #if defined(__cplusplus)
-- 
2.48.1


