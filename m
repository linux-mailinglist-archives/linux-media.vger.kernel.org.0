Return-Path: <linux-media+bounces-29695-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5D0A8187D
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 00:27:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 653DD7A66AA
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 22:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C641258CC1;
	Tue,  8 Apr 2025 22:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Ypow1ULr"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5963625744B;
	Tue,  8 Apr 2025 22:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151122; cv=pass; b=rpfOWA91V5/KnnuU8tBrilvoi23nDU5QdClpaWrXFJETS0V/9BW9SatFUeYqqwYjfxU/t0yX+Fp3W+DRXlMS3faDOsDIjpwqUUdWOEryftSXZZBCr+4KozS3b9x3Fi/HRXG7zf/5C4jOYh0bDu1uMtE2eJF6CqeWuOLzvTzU3OM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151122; c=relaxed/simple;
	bh=NXorFdku1nQ+4VW0Nld7fvN8kKrT5XVgxBvuK7NBZ30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SV09ku1RzvTXAxh3qbo08PohvgTZzm9IsxETZhh76m+cIR/WZJYnPqeLhuPl7pVDhmj/535vViUILJQmXn8Y6owgCoXqTUN9U7ik94I4J82PrWfeYS3fjNPzh9V3C1P+m8W2cdGg1rAD9vBkjH848WL2zi5JvP6R5BmEuOVxhEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=Ypow1ULr; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1744151087; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Y6fZkFkefngyTxyJYPwZWPDEmZn25mZE5hg/DOex4EToskPNop6BrCcXaO9us011UsjxgHonaqVtdnEdfi2+GCMvf2zfegwjb296vtZBByQ2cEKnMCAFmg79N089y8ZtIj16OKOy2EKEOQ9kXITviv/25k8Gw81XYpIYobF1obU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744151087; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Z9XNzjlYm/QMwxMRqDuRFL9p/H1og29aChYstb5tJvs=; 
	b=Xr7xd8R/Db1TWESde2rhtbkbJA6Xz67eeF2aSpCWDk5wThvuwN+o4wLRSXMooSIQbcFFWbq0eR8OC9W7e45syV05PeOfEW4Vt/79mxs+CQ/YAJxhQywXjEHTNgeFKWG9/7yv8lTsh/zCMmmB8Hm1pxMtntosG+Du5kk/1FVV9UA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744151087;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Z9XNzjlYm/QMwxMRqDuRFL9p/H1og29aChYstb5tJvs=;
	b=Ypow1ULrSwryPEu1IEHCVzNBxS39o7qaLZkXFB+bF70VwlTeNRUAuIBNxlZZACRo
	oKtejvcto7xahzrEmKspp09UQDKqzHDZ/qK2I6BO/Ir/DiXRhTw6RpA6Yt3+MQrmaC2
	k/VyNuT5H6vwiP2Ifwi+25nu1USICTGqKyO9snig=
Received: by mx.zohomail.com with SMTPS id 1744151086734641.6263434830112;
	Tue, 8 Apr 2025 15:24:46 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
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
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH v5 2/4] drm/panthor: Add driver IOCTL for setting BO labels
Date: Tue,  8 Apr 2025 23:24:22 +0100
Message-ID: <20250408222427.1214330-3-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250408222427.1214330-1-adrian.larumbe@collabora.com>
References: <20250408222427.1214330-1-adrian.larumbe@collabora.com>
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
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 42 ++++++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_gem.h |  2 ++
 include/uapi/drm/panthor_drm.h        | 19 ++++++++++++
 3 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 310bb44abe1a..163c027562aa 100644
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
+		if (args->size > PANTHOR_BO_LABEL_MAXLEN) {
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
@@ -1521,7 +1561,7 @@ static const struct drm_driver panthor_drm_driver = {
 	.name = "panthor",
 	.desc = "Panthor DRM driver",
 	.major = 1,
-	.minor = 3,
+	.minor = 4,
 
 	.gem_create_object = panthor_gem_create_object,
 	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 0582826b341a..e18fbc093abd 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -13,6 +13,8 @@
 
 struct panthor_vm;
 
+#define PANTHOR_BO_LABEL_MAXLEN	PAGE_SIZE
+
 /**
  * struct panthor_gem_object - Driver specific GEM object.
  */
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


