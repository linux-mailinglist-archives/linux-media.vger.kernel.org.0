Return-Path: <linux-media+bounces-28853-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60211A733FE
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 15:11:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 001F07A777C
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 14:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA7892185AA;
	Thu, 27 Mar 2025 14:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="TC/gfFrI"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC9621771F;
	Thu, 27 Mar 2025 14:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743084643; cv=pass; b=fkS6DiaQzyYxszmedQ8wsg32+XJtLqU+N/rOyJ7N6zCWD4iqg1XLCsdq1PWlcFkbay9MzapleqnZGK0/NrhoGFOFAR8ijcqOfQtanW54hMtHYrPqv+7bx2MuBlcXvnzPW2lPMeyDX4az3/U/44BF+Iqx7MlDWCNbt8i+gPxrZzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743084643; c=relaxed/simple;
	bh=tBtSNilaVtcYTf1qUqv4pvLw5UBotgYdQGZuPbdIzP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PAEF2C53gOvZcof+BYo0n4uRNwXtnNQ49qx28CfX9g5SUazyb3YFAQ/fJNUBAnd2MAGERYYaeyb5/g0ASp0X7iueQqq3+/QPWmBut1fQVBKnGXXOCC3aKgYmEzz0nNzpN+I0jUvXtRMgp25jlRDaHWyC9SLAuT5HVjZro5OW8Aw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=TC/gfFrI; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1743084619; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EpODsqB+uhIS3m+FtajyUBkj1eLo20uuvX7Zp5nAlPIjxZtj2n1CSEGE1wl0DxT9CkUI0chFZEZdde+NvNKuyhRz/NQjOuiJEoI69G9VfnAQiQMKbBplxJW9orET8lzsMFsSfdIsK5/D0wS3H6Wjx6b0EO0rbEXLuiJJdA0Gx9I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743084619; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nrcg46tqZM6Jsi4nqwQjxLvX1XPelYZmMEvRF3bNsc4=; 
	b=A+MdFevODd+7IDeLm+QnyM6vdcdCRUVBxa2saMkpNqkjjjAqlaogMwCevKCFGYcNQI8T5M+8vEeErUdbZzL6M2j8do69o0dSHcRgMMxXCARpKPf/LKvF6bQjNfcD0kSKNLsd4dorI4RrFoawNaynot4t6r0X9tmIF9IPjwhiU/M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743084619;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=nrcg46tqZM6Jsi4nqwQjxLvX1XPelYZmMEvRF3bNsc4=;
	b=TC/gfFrIeIv56krCY3Ax9576vs4IefUjkHuASfkv7ITRoPgMLTwCV9y/dDu3fiEA
	TZjaGkvHmH5ulb3DD7adS4V9VRdtjSOlzJGBNxwYwXFKulhriWkMAcv1/dCWXeMv9mV
	DqcDrV7ERRdjqzs6pPzu0Z9uakANYd2a7C+Bpv90=
Received: by mx.zohomail.com with SMTPS id 1743084618753168.38338198540464;
	Thu, 27 Mar 2025 07:10:18 -0700 (PDT)
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
Subject: [PATCH v3 4/4] drm/panthor: Display heap chunk entries in DebugFS GEMS file
Date: Thu, 27 Mar 2025 14:08:37 +0000
Message-ID: <20250327140845.105962-5-adrian.larumbe@collabora.com>
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

Expand the driver's DebugFS GEMS file to display entries for the heap
chunks' GEM objects, both those allocated at heap creation time through an
ioctl(), or in response to a tiler OOM event.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_gem.c  | 12 +-----------
 drivers/gpu/drm/panthor/panthor_gem.h  | 14 ++++++++++++++
 drivers/gpu/drm/panthor/panthor_heap.c |  3 +++
 3 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index fbf560920194..efc14c179680 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -22,16 +22,6 @@ static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo)
 	get_task_comm(bo->gems.creator.process_name, current->group_leader);
 }
 
-static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo)
-{
-	struct panthor_device *ptdev =  container_of(bo->base.base.dev,
-						     struct panthor_device, base);
-
-	mutex_lock(&ptdev->gems.lock);
-	list_add_tail(&bo->gems.node, &ptdev->gems.node);
-	mutex_unlock(&ptdev->gems.lock);
-}
-
 static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)
 {
 	struct panthor_device *ptdev = container_of(bo->base.base.dev,
@@ -44,9 +34,9 @@ static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)
 	list_del_init(&bo->gems.node);
 	mutex_unlock(&ptdev->gems.lock);
 }
+
 #else
 static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo) {}
-static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo) {}
 static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo) {}
 #endif
 
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 7c896ec35801..95093b98b990 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -11,6 +11,8 @@
 #include <linux/iosys-map.h>
 #include <linux/rwsem.h>
 
+#include "panthor_device.h"
+
 struct panthor_vm;
 
 /**
@@ -182,6 +184,18 @@ void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo);
 #ifdef CONFIG_DEBUG_FS
 void panthor_gem_debugfs_print_bos(struct panthor_device *pfdev,
 				   struct seq_file *m);
+
+static inline void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo)
+{
+	struct panthor_device *ptdev =  container_of(bo->base.base.dev,
+						     struct panthor_device, base);
+
+	mutex_lock(&ptdev->gems.lock);
+	list_add_tail(&bo->gems.node, &ptdev->gems.node);
+	mutex_unlock(&ptdev->gems.lock);
+}
+#elif
+static inline void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo) {}
 #endif
 
 #endif /* __PANTHOR_GEM_H__ */
diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
index db0285ce5812..30136b386869 100644
--- a/drivers/gpu/drm/panthor/panthor_heap.c
+++ b/drivers/gpu/drm/panthor/panthor_heap.c
@@ -180,6 +180,9 @@ static int panthor_alloc_heap_chunk(struct panthor_device *ptdev,
 	heap->chunk_count++;
 	mutex_unlock(&heap->lock);
 
+	panthor_gem_kernel_bo_set_label(chunk->bo, "Tiler heap chunk");
+	panthor_gem_debugfs_bo_add(to_panthor_bo(chunk->bo->obj));
+
 	return 0;
 
 err_destroy_bo:
-- 
2.48.1


