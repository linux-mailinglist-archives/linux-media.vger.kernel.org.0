Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EED841816B7
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 12:21:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729185AbgCKLUl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 07:20:41 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37197 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729162AbgCKLUl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 07:20:41 -0400
Received: by mail-pf1-f196.google.com with SMTP id p14so1155216pfn.4
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 04:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m4btOjpog/uQ4bY1laWTrOQ6YHEeLcDwWkTmIBHJjvI=;
        b=J7XsJoCelDGLuIQNlA6IVjvm6ghgWXxx4Ed7u0wgJp/3MUIff/waejd/kZOpNhRS84
         vMWxRf9f/WHkOhvGmws+iVQc0/dZwG0EgzgBZ9+CxMmF/0M7TCiG2KUq+Xr+DI7L+55b
         MgKaj469n3bY7238qAy0nD18hqnky6IsMfigU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m4btOjpog/uQ4bY1laWTrOQ6YHEeLcDwWkTmIBHJjvI=;
        b=YBB1zsQiIJqlzyb6uAjvxZazkY868noj/EzY3n5C43ogqDiy/RZlkEYk7nsbhfOKzx
         sp09gjLSTEZ0Fk2b3zno3QKZHyE2GNkdZgOS6B9hk46iowW81NqYoqJap1RPe3JWVrIl
         wMRuIiHhJg3HcYTyyGz0l9znhL8k0Yxdh5CtnfA7/fUhTeAk3vqzfjF1HCuzoTzaD5fc
         FJtvk801o3jmHazDBr65R1W2z/OVYVymulzv7vN/uNLUOSCs3JOc2AOyb7OioZ15UKgR
         wEcHNg9Dv3rfuFkJFUu/OZxMP9mdkBwk26I84cMcn3Shv8i4bHvr9S/Pt/xkz/fSRGIG
         Vwmw==
X-Gm-Message-State: ANhLgQ0MLF2vzMYDXz6LNOllzOvHGZcGpW7LG6iPUm/e81Jrnmjeg0Zf
        R8bWTMi1Q7fyx3PSPOsvWITKCg==
X-Google-Smtp-Source: ADFU+vuACezen4CfgtpW3WIBr9aBBH3QLeMQl8O52A3+k6HEkRDprn6i3hU6HTDtLRcSaB2cvnQkdg==
X-Received: by 2002:a63:7b18:: with SMTP id w24mr2405617pgc.22.1583925638810;
        Wed, 11 Mar 2020 04:20:38 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:30f2:7a9c:387e:6c7])
        by smtp.gmail.com with ESMTPSA id i24sm33035293pfo.92.2020.03.11.04.20.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2020 04:20:38 -0700 (PDT)
From:   David Stevens <stevensd@chromium.org>
To:     Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Stevens <stevensd@chromium.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        virtio-dev@lists.oasis-open.org
Subject: [PATCH v3 4/4] drm/virtio: Support virtgpu exported resources
Date:   Wed, 11 Mar 2020 20:20:04 +0900
Message-Id: <20200311112004.47138-5-stevensd@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200311112004.47138-1-stevensd@chromium.org>
References: <20200311112004.47138-1-stevensd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for UUID-based resource sharing mechanism to virtgpu. This
implements the new virtgpu commands and hooks them up to dma-buf's
get_uuid callback.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c   |  3 ++
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 18 +++++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c   |  4 ++
 drivers/gpu/drm/virtio/virtgpu_prime.c | 41 +++++++++++++++++--
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 55 ++++++++++++++++++++++++++
 5 files changed, 118 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index ab4bed78e656..776e6667042e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -165,6 +165,7 @@ static unsigned int features[] = {
 	VIRTIO_GPU_F_VIRGL,
 #endif
 	VIRTIO_GPU_F_EDID,
+	VIRTIO_GPU_F_RESOURCE_UUID,
 };
 static struct virtio_driver virtio_gpu_driver = {
 	.feature_table = features,
@@ -202,7 +203,9 @@ static struct drm_driver driver = {
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_mmap = drm_gem_prime_mmap,
+	.gem_prime_export = virtgpu_gem_prime_export,
 	.gem_prime_import_sg_table = virtgpu_gem_prime_import_sg_table,
+	.gem_prime_get_uuid = virtgpu_gem_prime_get_uuid,
 
 	.gem_create_object = virtio_gpu_create_object,
 	.fops = &virtio_gpu_driver_fops,
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index af9403e1cf78..fab65f0f5a4d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -49,6 +49,10 @@
 #define DRIVER_MINOR 1
 #define DRIVER_PATCHLEVEL 0
 
+#define UUID_INITIALIZING 0
+#define UUID_INITIALIZED 1
+#define UUID_INITIALIZATION_FAILED 2
+
 struct virtio_gpu_object_params {
 	uint32_t format;
 	uint32_t width;
@@ -75,6 +79,9 @@ struct virtio_gpu_object {
 
 	bool dumb;
 	bool created;
+
+	int uuid_state;
+	uuid_t uuid;
 };
 #define gem_to_virtio_gpu_obj(gobj) \
 	container_of((gobj), struct virtio_gpu_object, base.base)
@@ -196,6 +203,7 @@ struct virtio_gpu_device {
 	bool has_virgl_3d;
 	bool has_edid;
 	bool has_indirect;
+	bool has_resource_assign_uuid;
 
 	struct work_struct config_changed_work;
 
@@ -206,6 +214,8 @@ struct virtio_gpu_device {
 	struct virtio_gpu_drv_capset *capsets;
 	uint32_t num_capsets;
 	struct list_head cap_cache;
+
+	spinlock_t resource_export_lock;
 };
 
 struct virtio_gpu_fpriv {
@@ -338,6 +348,10 @@ void virtio_gpu_dequeue_fence_func(struct work_struct *work);
 void virtio_gpu_disable_notify(struct virtio_gpu_device *vgdev);
 void virtio_gpu_enable_notify(struct virtio_gpu_device *vgdev);
 
+int
+virtio_gpu_cmd_resource_assign_uuid(struct virtio_gpu_device *vgdev,
+				    struct virtio_gpu_object_array *objs);
+
 /* virtio_gpu_display.c */
 void virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
 void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev);
@@ -366,6 +380,10 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 			     struct virtio_gpu_object **bo_ptr,
 			     struct virtio_gpu_fence *fence);
 /* virtgpu_prime.c */
+struct dma_buf *virtgpu_gem_prime_export(struct drm_gem_object *obj,
+					 int flags);
+int virtgpu_gem_prime_get_uuid(struct drm_gem_object *obj,
+			       uuid_t *uuid);
 struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
 	struct drm_device *dev, struct dma_buf_attachment *attach,
 	struct sg_table *sgt);
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 4009c2f97d08..5a2aeb6d2f35 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -134,6 +134,7 @@ int virtio_gpu_init(struct drm_device *dev)
 	vgdev->dev = dev->dev;
 
 	spin_lock_init(&vgdev->display_info_lock);
+	spin_lock_init(&vgdev->resource_export_lock);
 	ida_init(&vgdev->ctx_id_ida);
 	ida_init(&vgdev->resource_ida);
 	init_waitqueue_head(&vgdev->resp_wq);
@@ -162,6 +163,9 @@ int virtio_gpu_init(struct drm_device *dev)
 	if (virtio_has_feature(vgdev->vdev, VIRTIO_RING_F_INDIRECT_DESC)) {
 		vgdev->has_indirect = true;
 	}
+	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_UUID)) {
+		vgdev->has_resource_assign_uuid = true;
+	}
 
 	DRM_INFO("features: %cvirgl %cedid\n",
 		 vgdev->has_virgl_3d ? '+' : '-',
diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index 050d24c39a8f..7c6357f59877 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -26,9 +26,44 @@
 
 #include "virtgpu_drv.h"
 
-/* Empty Implementations as there should not be any other driver for a virtual
- * device that might share buffers with virtgpu
- */
+int virtgpu_gem_prime_get_uuid(struct drm_gem_object *obj,
+			       uuid_t *uuid)
+{
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
+	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
+
+	wait_event(vgdev->resp_wq, bo->uuid_state != UUID_INITIALIZING);
+	if (bo->uuid_state != UUID_INITIALIZED)
+		return -ENODEV;
+
+	uuid_copy(uuid, &bo->uuid);
+
+	return 0;
+}
+
+struct dma_buf *virtgpu_gem_prime_export(struct drm_gem_object *obj,
+					 int flags)
+{
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
+	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
+	struct virtio_gpu_object_array *objs;
+	int ret = 0;
+
+	if (vgdev->has_resource_assign_uuid) {
+		objs = virtio_gpu_array_alloc(1);
+		if (!objs)
+			return ERR_PTR(-ENOMEM);
+		virtio_gpu_array_add_obj(objs, &bo->base.base);
+
+		ret = virtio_gpu_cmd_resource_assign_uuid(vgdev, objs);
+		if (ret)
+			return ERR_PTR(ret);
+	} else {
+		bo->uuid_state = UUID_INITIALIZATION_FAILED;
+  }
+
+	return drm_gem_prime_export(obj, flags);
+}
 
 struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
 	struct drm_device *dev, struct dma_buf_attachment *attach,
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index cfe9c54f87a3..b968eaa46bb0 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -1111,3 +1111,58 @@ void virtio_gpu_cursor_ping(struct virtio_gpu_device *vgdev,
 	memcpy(cur_p, &output->cursor, sizeof(output->cursor));
 	virtio_gpu_queue_cursor(vgdev, vbuf);
 }
+
+static void virtio_gpu_cmd_resource_uuid_cb(struct virtio_gpu_device *vgdev,
+					    struct virtio_gpu_vbuffer *vbuf)
+{
+	struct virtio_gpu_object *obj =
+		gem_to_virtio_gpu_obj(vbuf->objs->objs[0]);
+	struct virtio_gpu_resp_resource_uuid *resp =
+		(struct virtio_gpu_resp_resource_uuid *)vbuf->resp_buf;
+	uint32_t resp_type = le32_to_cpu(resp->hdr.type);
+
+	spin_lock(&vgdev->resource_export_lock);
+	WARN_ON(obj->uuid_state != UUID_INITIALIZING);
+
+	if (resp_type == VIRTIO_GPU_RESP_OK_RESOURCE_UUID &&
+			obj->uuid_state == UUID_INITIALIZING) {
+		memcpy(&obj->uuid.b, resp->uuid, sizeof(obj->uuid.b));
+		obj->uuid_state = UUID_INITIALIZED;
+	} else {
+		obj->uuid_state = UUID_INITIALIZATION_FAILED;
+	}
+	spin_unlock(&vgdev->resource_export_lock);
+
+	wake_up_all(&vgdev->resp_wq);
+}
+
+int
+virtio_gpu_cmd_resource_assign_uuid(struct virtio_gpu_device *vgdev,
+				    struct virtio_gpu_object_array *objs)
+{
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(objs->objs[0]);
+	struct virtio_gpu_resource_assign_uuid *cmd_p;
+	struct virtio_gpu_vbuffer *vbuf;
+	struct virtio_gpu_resp_resource_uuid *resp_buf;
+
+	resp_buf = kzalloc(sizeof(*resp_buf), GFP_KERNEL);
+	if (!resp_buf) {
+		spin_lock(&vgdev->resource_export_lock);
+		bo->uuid_state = UUID_INITIALIZATION_FAILED;
+		spin_unlock(&vgdev->resource_export_lock);
+		virtio_gpu_array_put_free(objs);
+		return -ENOMEM;
+	}
+
+	cmd_p = virtio_gpu_alloc_cmd_resp(vgdev,
+		virtio_gpu_cmd_resource_uuid_cb, &vbuf, sizeof(*cmd_p),
+		sizeof(struct virtio_gpu_resp_resource_uuid), resp_buf);
+	memset(cmd_p, 0, sizeof(*cmd_p));
+
+	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID);
+	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
+
+	vbuf->objs = objs;
+	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	return 0;
+}
-- 
2.25.1.481.gfbce0eb801-goog

