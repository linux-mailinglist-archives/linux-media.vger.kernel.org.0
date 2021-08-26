Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DFEE3F803C
	for <lists+linux-media@lfdr.de>; Thu, 26 Aug 2021 04:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237460AbhHZCDk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 22:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236087AbhHZCDk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 22:03:40 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6850C0613C1;
        Wed, 25 Aug 2021 19:02:53 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id j187so1336647pfg.4;
        Wed, 25 Aug 2021 19:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hZLr9LvZistDWMLzycvMhZGMKX/5YYAAQhqVsLz3yFI=;
        b=YNG/B8E9HcHl1YF+ZF6sPQ4XwFCIE25MuGt+kX2uyn9pB78t2n4vNoBljb5SaU9ANj
         H55nM/nYKRJVfV8CSH+tjc+cD8cQx0V/LuYdY4xITXMcxca9IIxvonLWBUPRJy4oylrg
         2XKjCMYDNMjQ6uOlvOa0ijeK9CGdub7Q6HzdgENC/FuA/bIxX7S4SxjcJKCsmkspr7UK
         bCjVeRZs2ao4p0/luEOFtKkZXxRQSSaV2Z8AN4h2d4bXeV7fcj/A23STwkmbVM36eDhb
         Ua8ZPlP5a2vzm9Vwxh7RYYbpcqHcLtHGGyQDD/aLw1LPX63HDSq9MzrLnDAEcZdjuZ/W
         rasg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hZLr9LvZistDWMLzycvMhZGMKX/5YYAAQhqVsLz3yFI=;
        b=SGBuwWF0fuO+JSIyMid7oP7B/4HEOArphIqGjkA5kbYdupEHBoOO2dA9nEniYZWLzo
         jh1oO+ke2nO+B5OETxUkBn6/W1u5YknAnLYuNROdH3kSGFD+ZyCcfpW5jeyXqpyCtU2S
         4nboKxAmi6OyIPqSfOD75CnWTwR4RRKPTQxkeKaCo/NAkvnNSDoD1ZADCAqPktIk3WHp
         Z4uMycF6QPGbqUdT97Sw1610cpcXTQRJ6hAK0oO2SBcxpd/ZUmfXw2v+rXcF53btmCJs
         uyC0NJt510u54+gz8sZNvKzUz5UqssjjFwst8Qpr97nN2REwNLkcmCIUfcxI2bul0UvR
         UFQw==
X-Gm-Message-State: AOAM531bw7UHAwv9evnhrRCj3SVrxM7wGWmmL93P/IEhuLFsw30Fe/q9
        ufwKsX4k3CqRIjLqtJf4Qyk=
X-Google-Smtp-Source: ABdhPJw1wbAiLbHATwmcbCH9EYolbytYlTm5r/+9JoeghEsvT7oMF1YbqZPzwNL0IL0N24ViAU1yqg==
X-Received: by 2002:a63:e446:: with SMTP id i6mr1153733pgk.288.1629943373103;
        Wed, 25 Aug 2021 19:02:53 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id i11sm721973pjj.19.2021.08.25.19.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 19:02:52 -0700 (PDT)
From:   Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        rodrigo.vivi@intel.com, chris@chris-wilson.co.uk,
        ville.syrjala@linux.intel.com, matthew.auld@intel.com,
        dan.carpenter@oracle.com, tvrtko.ursulin@intel.com,
        matthew.d.roper@intel.com, lucas.demarchi@intel.com,
        karthik.b.s@intel.com, jose.souza@intel.com,
        manasi.d.navare@intel.com, airlied@redhat.com,
        aditya.swarup@intel.com, andrescj@chromium.org,
        linux-graphics-maintainer@vmware.com, zackr@vmware.com
Cc:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v8 5/7] drm: avoid circular locks in drm_mode_object_find
Date:   Thu, 26 Aug 2021 10:01:20 +0800
Message-Id: <20210826020122.1488002-6-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210826020122.1488002-1-desmondcheongzx@gmail.com>
References: <20210826020122.1488002-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

__drm_mode_object_find checks if the given drm file holds the required
lease on a object by calling _drm_lease_held. _drm_lease_held in turn
uses drm_file_get_master to access drm_file.master.

However, in a future patch, the drm_file.master_lookup_lock in
drm_file_get_master will be replaced by drm_device.master_rwsem. This
is an issue for two reasons:

1. master_rwsem is sometimes already held when __drm_mode_object_find
is called, which leads to recursive locks on master_rwsem

2. drm_mode_object_find is sometimes called with the modeset_mutex
held, which leads to an inversion of the master_rwsem -->
modeset_mutex lock hierarchy

To fix this, we make __drm_mode_object_find the locked version of
drm_mode_object_find, and wrap calls to __drm_mode_object_find with
locks on master_rwsem. This allows us to safely access drm_file.master
in _drm_lease_held (__drm_mode_object_find is its only caller) without
the use of drm_file_get_master.

Functions that already lock master_rwsem are modified to call
__drm_mode_object_find, whereas functions that haven't locked
master_rwsem should call drm_mode_object_find. These two options
allow us to grab master_rwsem before modeset_mutex (such as in
drm_mode_get_obj_get_properties_ioctl).

This new rule requires more extensive changes to three functions:
drn_connector_lookup, drm_crtc_find, and drm_plane_find. These
functions are only sometimes called with master_rwsem held. Hence, we
have to further split them into locked and unlocked versions that call
__drm_mode_object_find and drm_mode_object_find respectively.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c            |  7 ++---
 drivers/gpu/drm/drm_color_mgmt.c             |  2 +-
 drivers/gpu/drm/drm_crtc.c                   |  5 ++--
 drivers/gpu/drm/drm_framebuffer.c            |  2 +-
 drivers/gpu/drm/drm_lease.c                  | 21 +++++----------
 drivers/gpu/drm/drm_mode_object.c            | 28 +++++++++++++++++---
 drivers/gpu/drm/drm_plane.c                  |  8 +++---
 drivers/gpu/drm/drm_property.c               |  6 ++---
 drivers/gpu/drm/i915/display/intel_overlay.c |  2 +-
 drivers/gpu/drm/i915/display/intel_sprite.c  |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c          |  2 +-
 include/drm/drm_connector.h                  | 23 ++++++++++++++++
 include/drm/drm_crtc.h                       | 22 +++++++++++++++
 include/drm/drm_mode_object.h                |  3 +++
 include/drm/drm_plane.h                      | 20 ++++++++++++++
 15 files changed, 118 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 909f31833181..cda9a501cf74 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -557,7 +557,7 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 			return -EINVAL;
 
 	} else if (property == config->prop_crtc_id) {
-		struct drm_crtc *crtc = drm_crtc_find(dev, file_priv, val);
+		struct drm_crtc *crtc = __drm_crtc_find(dev, file_priv, val);
 
 		if (val && !crtc)
 			return -EACCES;
@@ -709,7 +709,7 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
 	int ret;
 
 	if (property == config->prop_crtc_id) {
-		struct drm_crtc *crtc = drm_crtc_find(dev, file_priv, val);
+		struct drm_crtc *crtc = __drm_crtc_find(dev, file_priv, val);
 
 		if (val && !crtc)
 			return -EACCES;
@@ -1385,7 +1385,8 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 			goto out;
 		}
 
-		obj = drm_mode_object_find(dev, file_priv, obj_id, DRM_MODE_OBJECT_ANY);
+		obj = __drm_mode_object_find(dev, file_priv, obj_id,
+					     DRM_MODE_OBJECT_ANY);
 		if (!obj) {
 			ret = -ENOENT;
 			goto out;
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index bb14f488c8f6..9dcb2ccca3ab 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -365,7 +365,7 @@ int drm_mode_gamma_set_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
 
-	crtc = drm_crtc_find(dev, file_priv, crtc_lut->crtc_id);
+	crtc = __drm_crtc_find(dev, file_priv, crtc_lut->crtc_id);
 	if (!crtc)
 		return -ENOENT;
 
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 26a77a735905..b1279bb3fa61 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -656,7 +656,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 	if (crtc_req->x & 0xffff0000 || crtc_req->y & 0xffff0000)
 		return -ERANGE;
 
-	crtc = drm_crtc_find(dev, file_priv, crtc_req->crtc_id);
+	crtc = __drm_crtc_find(dev, file_priv, crtc_req->crtc_id);
 	if (!crtc) {
 		DRM_DEBUG_KMS("Unknown CRTC ID %d\n", crtc_req->crtc_id);
 		return -ENOENT;
@@ -787,7 +787,8 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 				goto out;
 			}
 
-			connector = drm_connector_lookup(dev, file_priv, out_id);
+			connector = __drm_connector_lookup(dev, file_priv,
+							   out_id);
 			if (!connector) {
 				DRM_DEBUG_KMS("Connector id %d unknown\n",
 						out_id);
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 07f5abc875e9..9c1db91b150d 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -887,7 +887,7 @@ struct drm_framebuffer *drm_framebuffer_lookup(struct drm_device *dev,
 	struct drm_mode_object *obj;
 	struct drm_framebuffer *fb = NULL;
 
-	obj = __drm_mode_object_find(dev, file_priv, id, DRM_MODE_OBJECT_FB);
+	obj = drm_mode_object_find(dev, file_priv, id, DRM_MODE_OBJECT_FB);
 	if (obj)
 		fb = obj_to_fb(obj);
 	return fb;
diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index bed6f7636cbe..1b156c85d1c8 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -105,22 +105,13 @@ static bool _drm_has_leased(struct drm_master *master, int id)
 	return false;
 }
 
-/* Called with idr_mutex held */
+/* Called with idr_mutex and master_rwsem held */
 bool _drm_lease_held(struct drm_file *file_priv, int id)
 {
-	bool ret;
-	struct drm_master *master;
-
-	if (!file_priv)
+	if (!file_priv || !file_priv->master)
 		return true;
 
-	master = drm_file_get_master(file_priv);
-	if (!master)
-		return true;
-	ret = _drm_lease_held_master(master, id);
-	drm_master_put(&master);
-
-	return ret;
+	return _drm_lease_held_master(file_priv->master, id);
 }
 
 bool drm_lease_held(struct drm_file *file_priv, int id)
@@ -391,9 +382,9 @@ static int fill_object_idr(struct drm_device *dev,
 	/* step one - get references to all the mode objects
 	   and check for validity. */
 	for (o = 0; o < object_count; o++) {
-		objects[o] = drm_mode_object_find(dev, lessor_priv,
-						  object_ids[o],
-						  DRM_MODE_OBJECT_ANY);
+		objects[o] = __drm_mode_object_find(dev, lessor_priv,
+						    object_ids[o],
+						    DRM_MODE_OBJECT_ANY);
 		if (!objects[o]) {
 			ret = -ENOENT;
 			goto out_free_objects;
diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
index 86d9e907c0b2..90c23997aa53 100644
--- a/drivers/gpu/drm/drm_mode_object.c
+++ b/drivers/gpu/drm/drm_mode_object.c
@@ -133,12 +133,27 @@ bool drm_mode_object_lease_required(uint32_t type)
 	}
 }
 
+/**
+ * __drm_mode_object_find - look up a drm object with static lifetime
+ * @dev: drm device
+ * @file_priv: drm file
+ * @id: id of the mode object
+ * @type: type of the mode object
+ *
+ * This function is used to look up a modeset object. It will acquire a
+ * reference for reference counted objects. This reference must be dropped
+ * again by calling drm_mode_object_put().
+ *
+ * Similar to drm_mode_object_find(), but called with &drm_device.master_rwsem
+ * held.
+ */
 struct drm_mode_object *__drm_mode_object_find(struct drm_device *dev,
 					       struct drm_file *file_priv,
-					       uint32_t id, uint32_t type)
+					       u32 id, u32 type)
 {
 	struct drm_mode_object *obj = NULL;
 
+	lockdep_assert_held_once(&dev->master_rwsem);
 	mutex_lock(&dev->mode_config.idr_mutex);
 	obj = idr_find(&dev->mode_config.object_idr, id);
 	if (obj && type != DRM_MODE_OBJECT_ANY && obj->type != type)
@@ -158,6 +173,7 @@ struct drm_mode_object *__drm_mode_object_find(struct drm_device *dev,
 
 	return obj;
 }
+EXPORT_SYMBOL(__drm_mode_object_find);
 
 /**
  * drm_mode_object_find - look up a drm object with static lifetime
@@ -176,7 +192,9 @@ struct drm_mode_object *drm_mode_object_find(struct drm_device *dev,
 {
 	struct drm_mode_object *obj = NULL;
 
+	down_read(&dev->master_rwsem);
 	obj = __drm_mode_object_find(dev, file_priv, id, type);
+	up_read(&dev->master_rwsem);
 	return obj;
 }
 EXPORT_SYMBOL(drm_mode_object_find);
@@ -408,9 +426,12 @@ int drm_mode_obj_get_properties_ioctl(struct drm_device *dev, void *data,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
 
+	down_read(&dev->master_rwsem);
 	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 
-	obj = drm_mode_object_find(dev, file_priv, arg->obj_id, arg->obj_type);
+	obj = __drm_mode_object_find(dev, file_priv, arg->obj_id,
+				     arg->obj_type);
+	up_read(&dev->master_rwsem);
 	if (!obj) {
 		ret = -ENOENT;
 		goto out;
@@ -534,7 +555,8 @@ int drm_mode_obj_set_property_ioctl(struct drm_device *dev, void *data,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
 
-	arg_obj = drm_mode_object_find(dev, file_priv, arg->obj_id, arg->obj_type);
+	arg_obj = __drm_mode_object_find(dev, file_priv, arg->obj_id,
+					 arg->obj_type);
 	if (!arg_obj)
 		return -ENOENT;
 
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 82afb854141b..b5566167a798 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -971,7 +971,7 @@ int drm_mode_setplane(struct drm_device *dev, void *data,
 	 * First, find the plane, crtc, and fb objects.  If not available,
 	 * we don't bother to call the driver.
 	 */
-	plane = drm_plane_find(dev, file_priv, plane_req->plane_id);
+	plane = __drm_plane_find(dev, file_priv, plane_req->plane_id);
 	if (!plane) {
 		DRM_DEBUG_KMS("Unknown plane ID %d\n",
 			      plane_req->plane_id);
@@ -986,7 +986,7 @@ int drm_mode_setplane(struct drm_device *dev, void *data,
 			return -ENOENT;
 		}
 
-		crtc = drm_crtc_find(dev, file_priv, plane_req->crtc_id);
+		crtc = __drm_crtc_find(dev, file_priv, plane_req->crtc_id);
 		if (!crtc) {
 			drm_framebuffer_put(fb);
 			DRM_DEBUG_KMS("Unknown crtc ID %d\n",
@@ -1108,7 +1108,7 @@ static int drm_mode_cursor_common(struct drm_device *dev,
 	if (!req->flags || (~DRM_MODE_CURSOR_FLAGS & req->flags))
 		return -EINVAL;
 
-	crtc = drm_crtc_find(dev, file_priv, req->crtc_id);
+	crtc = __drm_crtc_find(dev, file_priv, req->crtc_id);
 	if (!crtc) {
 		DRM_DEBUG_KMS("Unknown CRTC ID %d\n", req->crtc_id);
 		return -ENOENT;
@@ -1229,7 +1229,7 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
 	if ((page_flip->flags & DRM_MODE_PAGE_FLIP_ASYNC) && !dev->mode_config.async_page_flip)
 		return -EINVAL;
 
-	crtc = drm_crtc_find(dev, file_priv, page_flip->crtc_id);
+	crtc = __drm_crtc_find(dev, file_priv, page_flip->crtc_id);
 	if (!crtc)
 		return -ENOENT;
 
diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
index 6c353c9dc772..9f04dcb81d07 100644
--- a/drivers/gpu/drm/drm_property.c
+++ b/drivers/gpu/drm/drm_property.c
@@ -656,7 +656,7 @@ struct drm_property_blob *drm_property_lookup_blob(struct drm_device *dev,
 	struct drm_mode_object *obj;
 	struct drm_property_blob *blob = NULL;
 
-	obj = __drm_mode_object_find(dev, NULL, id, DRM_MODE_OBJECT_BLOB);
+	obj = drm_mode_object_find(dev, NULL, id, DRM_MODE_OBJECT_BLOB);
 	if (obj)
 		blob = obj_to_blob(obj);
 	return blob;
@@ -919,8 +919,8 @@ bool drm_property_change_valid_get(struct drm_property *property,
 		if (value == 0)
 			return true;
 
-		*ref = __drm_mode_object_find(property->dev, NULL, value,
-					      property->values[0]);
+		*ref = drm_mode_object_find(property->dev, NULL, value,
+					    property->values[0]);
 		return *ref != NULL;
 	}
 
diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index 7e3f5c6ca484..1d4af29e31c9 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -1120,7 +1120,7 @@ int intel_overlay_put_image_ioctl(struct drm_device *dev, void *data,
 		return ret;
 	}
 
-	drmmode_crtc = drm_crtc_find(dev, file_priv, params->crtc_id);
+	drmmode_crtc = __drm_crtc_find(dev, file_priv, params->crtc_id);
 	if (!drmmode_crtc)
 		return -ENOENT;
 	crtc = to_intel_crtc(drmmode_crtc);
diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index 4ae9a7455b23..e19ef2d90bac 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -1505,7 +1505,7 @@ int intel_sprite_set_colorkey_ioctl(struct drm_device *dev, void *data,
 	    set->flags & I915_SET_COLORKEY_DESTINATION)
 		return -EINVAL;
 
-	plane = drm_plane_find(dev, file_priv, set->plane_id);
+	plane = __drm_plane_find(dev, file_priv, set->plane_id);
 	if (!plane || plane->type != DRM_PLANE_TYPE_OVERLAY)
 		return -ENOENT;
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 74fa41909213..d368b2bcb1fa 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -1862,7 +1862,7 @@ int vmw_kms_cursor_bypass_ioctl(struct drm_device *dev, void *data,
 		return 0;
 	}
 
-	crtc = drm_crtc_find(dev, file_priv, arg->crtc_id);
+	crtc = __drm_crtc_find(dev, file_priv, arg->crtc_id);
 	if (!crtc) {
 		ret = -ENOENT;
 		goto out;
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 1647960c9e50..322c823583c7 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1591,6 +1591,29 @@ static inline u32 drm_connector_mask(const struct drm_connector *connector)
 	return 1 << connector->index;
 }
 
+/**
+ * __drm_connector_lookup - lookup connector object
+ * @dev: DRM device
+ * @file_priv: drm file to check for lease against.
+ * @id: connector object id
+ *
+ * This function looks up the connector object specified by id
+ * add takes a reference to it.
+ *
+ * Similar to drm_connector_lookup(), but called with &drm_device.master_rwsem
+ * held.
+ */
+static inline struct drm_connector *__drm_connector_lookup(struct drm_device *dev,
+							   struct drm_file *file_priv,
+							   uint32_t id)
+{
+	struct drm_mode_object *mo;
+
+	mo = __drm_mode_object_find(dev, file_priv, id,
+				    DRM_MODE_OBJECT_CONNECTOR);
+	return mo ? obj_to_connector(mo) : NULL;
+}
+
 /**
  * drm_connector_lookup - lookup connector object
  * @dev: DRM device
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 13eeba2a750a..69df854dd322 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -1283,6 +1283,28 @@ static inline uint32_t drm_crtc_mask(const struct drm_crtc *crtc)
 int drm_mode_set_config_internal(struct drm_mode_set *set);
 struct drm_crtc *drm_crtc_from_index(struct drm_device *dev, int idx);
 
+/**
+ * __drm_crtc_find - look up a CRTC object from its ID
+ * @dev: DRM device
+ * @file_priv: drm file to check for lease against.
+ * @id: &drm_mode_object ID
+ *
+ * This can be used to look up a CRTC from its userspace ID. Only used by
+ * drivers for legacy IOCTLs and interface, nowadays extensions to the KMS
+ * userspace interface should be done using &drm_property.
+ *
+ * Similar to drm_crtc_find(), but called with &drm_device.master_rwsem held.
+ */
+static inline struct drm_crtc *__drm_crtc_find(struct drm_device *dev,
+					       struct drm_file *file_priv,
+					       uint32_t id)
+{
+	struct drm_mode_object *mo;
+
+	mo = __drm_mode_object_find(dev, file_priv, id, DRM_MODE_OBJECT_CRTC);
+	return mo ? obj_to_crtc(mo) : NULL;
+}
+
 /**
  * drm_crtc_find - look up a CRTC object from its ID
  * @dev: DRM device
diff --git a/include/drm/drm_mode_object.h b/include/drm/drm_mode_object.h
index c34a3e8030e1..1906af9cae9b 100644
--- a/include/drm/drm_mode_object.h
+++ b/include/drm/drm_mode_object.h
@@ -114,6 +114,9 @@ struct drm_object_properties {
 		return "(unknown)";				\
 	}
 
+struct drm_mode_object *__drm_mode_object_find(struct drm_device *dev,
+					       struct drm_file *file_priv,
+					       u32 id, u32 type);
 struct drm_mode_object *drm_mode_object_find(struct drm_device *dev,
 					     struct drm_file *file_priv,
 					     uint32_t id, uint32_t type);
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index fed97e35626f..49e35d3724c9 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -842,6 +842,26 @@ int drm_mode_plane_set_obj_prop(struct drm_plane *plane,
 				       struct drm_property *property,
 				       uint64_t value);
 
+/**
+ * __drm_plane_find - find a &drm_plane
+ * @dev: DRM device
+ * @file_priv: drm file to check for lease against.
+ * @id: plane id
+ *
+ * Returns the plane with @id, NULL if it doesn't exist.
+ *
+ * Similar to drm_plane_find(), but called with &drm_device.master_rwsem held.
+ */
+static inline struct drm_plane *__drm_plane_find(struct drm_device *dev,
+						 struct drm_file *file_priv,
+						 uint32_t id)
+{
+	struct drm_mode_object *mo;
+
+	mo = __drm_mode_object_find(dev, file_priv, id, DRM_MODE_OBJECT_PLANE);
+	return mo ? obj_to_plane(mo) : NULL;
+}
+
 /**
  * drm_plane_find - find a &drm_plane
  * @dev: DRM device
-- 
2.25.1

