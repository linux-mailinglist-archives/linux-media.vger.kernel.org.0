Return-Path: <linux-media+bounces-28850-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9115A733FF
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 15:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E49217CEAE
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 14:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F16C217733;
	Thu, 27 Mar 2025 14:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="hjsiGm6X"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1231547C0;
	Thu, 27 Mar 2025 14:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743084641; cv=pass; b=i4U2fo2iAUqBjWtZZfVWh4BWcEIaoAgt1yMgjohYlepoQ648mBg9/MJ2nNUIkIBq9UwNZWKhMWyYuYWVIK73n1393cnRzqTegnqOY5XCt6HtpaMI0jIp9SmdyRfIV9gSc1cSuNwjqUR5sRbgQsAPGlkpbfdWr2UlbcYE+7/jiqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743084641; c=relaxed/simple;
	bh=KFOX7j6dcsCjMm3XpoQ4xj9VhLpO5r0rtI8u4eTP0eU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VbP9TMPj7r8kjL6THoH6OiXsLNboCPlX4csMWGpgdWh+3yeUU1FewDJWdplxpY2sU3v0Wc/3wEzbcbi1SBkWdaac3x5vP8Vl7uc4PwjnCTOkSqDeyXWvU4ll0305Hd8K6zlYX3CX3pWAKje1yBNiQ/Y0k9T+B/Sks0Eyqv8aJsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=hjsiGm6X; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1743084609; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VedyCbIdt4I86rjHMEhtvpNXAiFwv2UiduZ/rKWu6+orLgJ2H1hs4pci5uEODZ5GoeyPT8s9rSKJpJ0Sf+IaaQ6fsjO85MsdSpVG4gi+FFyqiT8pYjhZcIq1WMxgv2kzyvu7lU/OMpcoLuXzF3M4gFHnE9FLFlRcJvPw780I4dg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743084609; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4UyPlXIDXdLEvKXdapaXy/kcMLyCFQnzUHF9J9uf/ds=; 
	b=RMq3HnE0/m/6dcP6XbF/Mw8WAIyNPve/eQ67udLGmu8HyKrLqZ5geVc3Lu3wXWthm+TWkzcoO/E4Hd/StSqU43uewGlFIsS199Ugoma8mSwPhQfn58dvivufMtn57j2nWNj6pa097EURdb5diBzbLJO5wqyYzBxSSrKe6bn01xc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743084609;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=4UyPlXIDXdLEvKXdapaXy/kcMLyCFQnzUHF9J9uf/ds=;
	b=hjsiGm6XaxN8tvqZvruS+L+OYby5zW0dFLlk/zsIuigWiT1bcZMvu9teQSN66bR2
	rTqqe5mgPVSaJ3CcnlC3ZkGqA6P9vgNAhi3g0pMP4vvoqMje9O+Uz/iLTUh5M7fswNF
	3iL78U4iX7JSNXo0LPcvz8qqx3MhpTEEX73+A0Hw=
Received: by mx.zohomail.com with SMTPS id 1743084608283448.1115696600874;
	Thu, 27 Mar 2025 07:10:08 -0700 (PDT)
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
Subject: [PATCH v3 1/4] drm/panthor: Introduce BO labeling
Date: Thu, 27 Mar 2025 14:08:34 +0000
Message-ID: <20250327140845.105962-2-adrian.larumbe@collabora.com>
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

Add a new character string Panthor BO field, and a function that allows
setting it from within the driver.

Driver takes care of freeing the string when it's replaced or no longer
needed at object destruction time, but allocating it is the responsibility
of callers.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_gem.c | 38 +++++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_gem.h | 17 ++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 8244a4e6c2a2..7d017f9d1d52 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -18,6 +18,14 @@ static void panthor_gem_free_object(struct drm_gem_object *obj)
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
@@ -196,6 +204,7 @@ struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t
 	obj->base.map_wc = !ptdev->coherent;
 	mutex_init(&obj->gpuva_list_lock);
 	drm_gem_gpuva_set_lock(&obj->base.base, &obj->gpuva_list_lock);
+	mutex_init(&obj->label.lock);
 
 	return &obj->base.base;
 }
@@ -247,3 +256,32 @@ panthor_gem_create_with_handle(struct drm_file *file,
 
 	return ret;
 }
+
+void
+panthor_gem_bo_set_label(struct drm_gem_object *obj, const char *label)
+{
+	struct panthor_gem_object *bo = to_panthor_bo(obj);
+	const char *old_label;
+
+	mutex_lock(&bo->label.lock);
+	old_label = bo->label.str;
+	bo->label.str = label;
+	mutex_unlock(&bo->label.lock);
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
+	panthor_gem_bo_set_label(bo->obj, kstrdup_const(str, GFP_KERNEL));
+}
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 5749ef2ebe03..0582826b341a 100644
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


