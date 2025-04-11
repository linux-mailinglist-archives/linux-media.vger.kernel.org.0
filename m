Return-Path: <linux-media+bounces-30033-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9B1A8614A
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 17:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A82ED7B976D
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 15:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59275219A6B;
	Fri, 11 Apr 2025 15:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="RYcUqqvQ"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A05215783;
	Fri, 11 Apr 2025 15:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744383910; cv=pass; b=YIImmqvjLnKatk9oKR8JGu7GnVHCqj2HLsF7L1KqJvpoMRlfiEqTJMvj+spYyHnNYpbOqt8otRr8o845pEAHJ4J/tNPjzJu49bHyeB5Rjz0KoNvXZpXnhGd25ujSMEje0RdAuDyy+NwrVdjIHxuk52DuUR2NRWlsBxlC9QW0bYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744383910; c=relaxed/simple;
	bh=68YC4WwgvizWG2K1gCGGlXfkw7uoRq2kKmdLPAA7HXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ivOME2+WJzxG1isHVhX1ly3BxpK/E/VAMfU0KAQE/cL7pymgKebNzhELNPRtMXxiKg3Zc6B3+R8Y6v6WWtZYZOkb/mBLVqggyx2bzqy57uk1HSHRDJ46uvvEq/1GrTTHgCRZZVI268I0NXDUVA3e/A2oJoVgLzucPu3Lz1Ah6os=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=RYcUqqvQ; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1744383856; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GVYb76KdkMLwyfy7vKqAdyxlpYTnoT24yH2Dd/3wp7cQdXnALGYcBNbXkxwCbZBJq+bLZN/5YAwFhCxMAnmrFzJcsqTQOBXt8F7PHVNOxh0ViQT+928p1LZgjBcnclCtL3kmu84R1EoxNw39GL9OshaB1xEDT90EIkySAsqroJE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744383856; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yPq5rlMfqv4prhYPYbwDMgzWWSIG2EEC0VgIJ0vg69U=; 
	b=i3JuHlYsm3oSf4zzKYvX0XyJKQMtNvTiokM2YqB2Mt+NbwI9efUlNmySseyV9jZAmRN052DZVnW2Onbs2FeLCH04J3l56/0QnCkUZ1RyHBeHRjMO0y1m8lKWJ192AKV0XsksnI+EvcmN2AOn8zu81aHvD4KxeHGu+kQ7Nmc+DLg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744383856;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=yPq5rlMfqv4prhYPYbwDMgzWWSIG2EEC0VgIJ0vg69U=;
	b=RYcUqqvQQQQMflvmHNTKJdKbUKH9tJhJnGL6bj+ZFh5xZZTnyCq7L9przx3ejTYp
	mTNT0SWg9h7AcAVoLsdiZy3xxGWr5wsJBb7ls6i1XEnvokugbAgIu8QRFk6CsuSLCv/
	Ir5wgl+wb6tgjKnS0W2pRBzniVWFy2X3QRDlEdZg=
Received: by mx.zohomail.com with SMTPS id 1744383855131188.2872276985496;
	Fri, 11 Apr 2025 08:04:15 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: "To : Boris Brezillon" <boris.brezillon@collabora.com>,
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
Subject: [PATCH v7 1/4] drm/panthor: Introduce BO labeling
Date: Fri, 11 Apr 2025 16:03:49 +0100
Message-ID: <20250411150357.3308921-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250411150357.3308921-1-adrian.larumbe@collabora.com>
References: <20250411150357.3308921-1-adrian.larumbe@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a new character string Panthor BO field, and a function that allows
setting it from within the driver.

Driver takes care of freeing the string when it's replaced or no longer
needed at object destruction time, but allocating it is the responsibility
of callers.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_gem.c | 39 +++++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_gem.h | 17 ++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 8244a4e6c2a2..af0ac17f357f 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -2,6 +2,7 @@
 /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
 /* Copyright 2023 Collabora ltd. */
 
+#include <linux/cleanup.h>
 #include <linux/dma-buf.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
@@ -18,6 +19,14 @@ static void panthor_gem_free_object(struct drm_gem_object *obj)
 	struct panthor_gem_object *bo = to_panthor_bo(obj);
 	struct drm_gem_object *vm_root_gem = bo->exclusive_vm_root_gem;
 
+	/*
+	 * Label might have been allocated with kstrdup_const(),
+	 * we need to take that into account when freeing the memory
+	 */
+	kfree_const(bo->label.str);
+
+	mutex_destroy(&bo->label.lock);
+
 	drm_gem_free_mmap_offset(&bo->base.base);
 	mutex_destroy(&bo->gpuva_list_lock);
 	drm_gem_shmem_free(&bo->base);
@@ -196,6 +205,7 @@ struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t
 	obj->base.map_wc = !ptdev->coherent;
 	mutex_init(&obj->gpuva_list_lock);
 	drm_gem_gpuva_set_lock(&obj->base.base, &obj->gpuva_list_lock);
+	mutex_init(&obj->label.lock);
 
 	return &obj->base.base;
 }
@@ -247,3 +257,32 @@ panthor_gem_create_with_handle(struct drm_file *file,
 
 	return ret;
 }
+
+void
+panthor_gem_bo_set_label(struct drm_gem_object *obj, const char *label)
+{
+	struct panthor_gem_object *bo = to_panthor_bo(obj);
+	const char *old_label;
+
+	scoped_guard(mutex, &bo->label.lock) {
+		old_label = bo->label.str;
+		bo->label.str = label;
+	}
+
+	kfree(old_label);
+}
+
+void
+panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label)
+{
+	const char *str;
+
+	str = kstrdup_const(label, GFP_KERNEL);
+	if (!str) {
+		/* Failing to allocate memory for a label isn't a fatal condition */
+		drm_warn(bo->obj->dev, "Not enough memory to allocate BO label");
+		return;
+	}
+
+	panthor_gem_bo_set_label(bo->obj, str);
+}
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 1a363bb814f4..af0d77338860 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -46,6 +46,20 @@ struct panthor_gem_object {
 
 	/** @flags: Combination of drm_panthor_bo_flags flags. */
 	u32 flags;
+
+	/**
+	 * @label: BO tagging fields. The label can be assigned within the
+	 * driver itself or through a specific IOCTL.
+	 */
+	struct {
+		/**
+		 * @label.str: Pointer to NULL-terminated string,
+		 */
+		const char *str;
+
+		/** @lock.str: Protects access to the @label.str field. */
+		struct mutex lock;
+	} label;
 };
 
 /**
@@ -91,6 +105,9 @@ panthor_gem_create_with_handle(struct drm_file *file,
 			       struct panthor_vm *exclusive_vm,
 			       u64 *size, u32 flags, uint32_t *handle);
 
+void panthor_gem_bo_set_label(struct drm_gem_object *obj, const char *label);
+void panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label);
+
 static inline u64
 panthor_kernel_bo_gpuva(struct panthor_kernel_bo *bo)
 {
-- 
2.48.1


