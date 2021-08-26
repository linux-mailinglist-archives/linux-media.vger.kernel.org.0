Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C23B3F8041
	for <lists+linux-media@lfdr.de>; Thu, 26 Aug 2021 04:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237644AbhHZCDt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 22:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236087AbhHZCDt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 22:03:49 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AECDFC061757;
        Wed, 25 Aug 2021 19:03:02 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id u6so702632pfi.0;
        Wed, 25 Aug 2021 19:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oY/pfqgu+2sRkiNqhaUG61kr6lRUaM96hJmmExn+Chg=;
        b=BWS/bwsaRBO5hhKc+Ear/9+3vkdCJybYw8oC1oGJsdz8+G7uauIoSEHXFfoXdUmCKC
         q0OrvfEGJh1eYZxq+J8CfDDt3oSSiNmKNrlyMkH0k6SN8atJIMMCul/dhW4ueS8Kyj1i
         p07B9YDdLQSX/8u/F+lp6XiF0LEPreDmkMU9tHZ1iU8zyYBDx9xPI5/iiEzCokIPiQ8P
         6PHmuLIlGC5Y90Urvl0XvK2iDsTL3qJ9bRySHYLgE1zfdJfGXavHH9UoiSrcUimIl9rO
         12qg3phBiSF5IgMdG68qJ0V4EisfErqSsMuHJXxTrnHb3L107RDnHnxxD1AJdOytzwct
         goTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oY/pfqgu+2sRkiNqhaUG61kr6lRUaM96hJmmExn+Chg=;
        b=SqK/9QcTBSWcP92PSUHIpi4aGK1RW+yKuHL03b87zDsZnfGA6grbVQtCqwd+1iQUS/
         kmmOs7XiN4JMxY7q2gnNGWGzoN613fcxNkUXIi+1MHEO9MDvIicquDW2woW0zcJMWHei
         dCWkzo6S0OPyhSnHA07hYyfJ8Lzwhuns6qlkyy21nRYHzor9G8QuoJNGOn+hBMtC+x36
         N30XNLr6+s+8vDOEGkRUSZ+X5QXHz05yhRqKv9Hzad/McaVYpBOztSXuUzsG4kLukZVU
         oE4RtOh9RZ4c4sA1M19CmpxWCBeQQ/jX16HhD4ZghlE1eBkZeD4vYPdftWk5UlQcE1+z
         QyjQ==
X-Gm-Message-State: AOAM531S8P6fkVyhEzXuGio1snsArmMwe+pdk8JZxq64MJQbl/Ye7WW3
        XZn2OVog+66qttwsB6z8L0c=
X-Google-Smtp-Source: ABdhPJy4i6C/h/AC63z3yBltjhbJId3QBvNHtVxbRazo3mXVlVYJchkt79tPHs42kELN1Aq9emx+yQ==
X-Received: by 2002:a62:1a03:0:b029:3e0:30aa:5172 with SMTP id a3-20020a621a030000b02903e030aa5172mr1227837pfa.69.1629943382239;
        Wed, 25 Aug 2021 19:03:02 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id i11sm721973pjj.19.2021.08.25.19.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 19:03:01 -0700 (PDT)
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
Subject: [PATCH v8 6/7] drm: avoid circular locks in drm_lease_held
Date:   Thu, 26 Aug 2021 10:01:21 +0800
Message-Id: <20210826020122.1488002-7-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210826020122.1488002-1-desmondcheongzx@gmail.com>
References: <20210826020122.1488002-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

drm_lease_held calls drm_file_get_master. However, this function is
sometimes called while holding on to drm_device.master_rwsem or
modeset_mutex. Since master_rwsem will replace
drm_file.master_lookup_lock in drm_file_get_master in a future patch,
this results in both recursive locking, and an inversion of the
master_rwsem --> modeset_mutex lock hierarchy.

To fix this, we create a new drm_lease_held_master helper function
that enables us to avoid calling drm_file_get_master after locking
master_rwsem or modeset_mutex.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_auth.c    |  3 +++
 drivers/gpu/drm/drm_crtc.c    |  4 +++-
 drivers/gpu/drm/drm_encoder.c |  7 ++++++-
 drivers/gpu/drm/drm_lease.c   | 30 +++++++++++++++---------------
 drivers/gpu/drm/drm_plane.c   | 18 ++++++++++++++----
 include/drm/drm_lease.h       |  2 ++
 6 files changed, 43 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 65065f7e1499..f2b2f197052a 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -410,6 +410,9 @@ struct drm_master *drm_file_get_master(struct drm_file *file_priv)
 {
 	struct drm_master *master = NULL;
 
+	if (!file_priv)
+		return NULL;
+
 	spin_lock(&file_priv->master_lookup_lock);
 	if (!file_priv->master)
 		goto unlock;
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index b1279bb3fa61..0b1e76d2f9ff 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -665,8 +665,10 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 
 	plane = crtc->primary;
 
+	lockdep_assert_held_once(&dev->master_rwsem);
 	/* allow disabling with the primary plane leased */
-	if (crtc_req->mode_valid && !drm_lease_held(file_priv, plane->base.id))
+	if (crtc_req->mode_valid &&
+	    !drm_lease_held_master(file_priv->master, plane->base.id))
 		return -EACCES;
 
 	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx,
diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
index 72e982323a5e..bacb2f6a325c 100644
--- a/drivers/gpu/drm/drm_encoder.c
+++ b/drivers/gpu/drm/drm_encoder.c
@@ -22,6 +22,7 @@
 
 #include <linux/export.h>
 
+#include <drm/drm_auth.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
@@ -281,6 +282,7 @@ int drm_mode_getencoder(struct drm_device *dev, void *data,
 	struct drm_mode_get_encoder *enc_resp = data;
 	struct drm_encoder *encoder;
 	struct drm_crtc *crtc;
+	struct drm_master *master;
 
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
@@ -289,13 +291,16 @@ int drm_mode_getencoder(struct drm_device *dev, void *data,
 	if (!encoder)
 		return -ENOENT;
 
+	master = drm_file_get_master(file_priv);
 	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
 	crtc = drm_encoder_get_crtc(encoder);
-	if (crtc && drm_lease_held(file_priv, crtc->base.id))
+	if (crtc && drm_lease_held_master(master, crtc->base.id))
 		enc_resp->crtc_id = crtc->base.id;
 	else
 		enc_resp->crtc_id = 0;
 	drm_modeset_unlock(&dev->mode_config.connection_mutex);
+	if (master)
+		drm_master_put(&master);
 
 	enc_resp->encoder_type = encoder->encoder_type;
 	enc_resp->encoder_id = encoder->base.id;
diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index 1b156c85d1c8..15bf3a3c76d1 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -114,27 +114,30 @@ bool _drm_lease_held(struct drm_file *file_priv, int id)
 	return _drm_lease_held_master(file_priv->master, id);
 }
 
-bool drm_lease_held(struct drm_file *file_priv, int id)
+bool drm_lease_held_master(struct drm_master *master, int id)
 {
-	struct drm_master *master;
 	bool ret;
 
-	if (!file_priv)
+	if (!master || !master->lessor)
 		return true;
 
-	master = drm_file_get_master(file_priv);
-	if (!master)
-		return true;
-	if (!master->lessor) {
-		ret = true;
-		goto out;
-	}
 	mutex_lock(&master->dev->mode_config.idr_mutex);
 	ret = _drm_lease_held_master(master, id);
 	mutex_unlock(&master->dev->mode_config.idr_mutex);
 
-out:
-	drm_master_put(&master);
+	return ret;
+}
+
+bool drm_lease_held(struct drm_file *file_priv, int id)
+{
+	struct drm_master *master;
+	bool ret;
+
+	master = drm_file_get_master(file_priv);
+	ret = drm_lease_held_master(master, id);
+	if (master)
+		drm_master_put(&master);
+
 	return ret;
 }
 
@@ -150,9 +153,6 @@ uint32_t drm_lease_filter_crtcs(struct drm_file *file_priv, uint32_t crtcs_in)
 	int count_in, count_out;
 	uint32_t crtcs_out = 0;
 
-	if (!file_priv)
-		return crtcs_in;
-
 	master = drm_file_get_master(file_priv);
 	if (!master)
 		return crtcs_in;
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index b5566167a798..907b026fd916 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -23,6 +23,7 @@
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 
+#include <drm/drm_auth.h>
 #include <drm/drm_plane.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_print.h>
@@ -687,6 +688,7 @@ int drm_mode_getplane(struct drm_device *dev, void *data,
 	struct drm_mode_get_plane *plane_resp = data;
 	struct drm_plane *plane;
 	uint32_t __user *format_ptr;
+	struct drm_master *master;
 
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
@@ -695,10 +697,13 @@ int drm_mode_getplane(struct drm_device *dev, void *data,
 	if (!plane)
 		return -ENOENT;
 
+	master = drm_file_get_master(file_priv);
 	drm_modeset_lock(&plane->mutex, NULL);
-	if (plane->state && plane->state->crtc && drm_lease_held(file_priv, plane->state->crtc->base.id))
+	if (plane->state && plane->state->crtc &&
+	    drm_lease_held_master(master, plane->state->crtc->base.id))
 		plane_resp->crtc_id = plane->state->crtc->base.id;
-	else if (!plane->state && plane->crtc && drm_lease_held(file_priv, plane->crtc->base.id))
+	else if (!plane->state && plane->crtc &&
+		 drm_lease_held_master(master, plane->crtc->base.id))
 		plane_resp->crtc_id = plane->crtc->base.id;
 	else
 		plane_resp->crtc_id = 0;
@@ -710,6 +715,8 @@ int drm_mode_getplane(struct drm_device *dev, void *data,
 	else
 		plane_resp->fb_id = 0;
 	drm_modeset_unlock(&plane->mutex);
+	if (master)
+		drm_master_put(&master);
 
 	plane_resp->plane_id = plane->base.id;
 	plane_resp->possible_crtcs = drm_lease_filter_crtcs(file_priv,
@@ -1114,6 +1121,7 @@ static int drm_mode_cursor_common(struct drm_device *dev,
 		return -ENOENT;
 	}
 
+	lockdep_assert_held_once(&dev->master_rwsem);
 	drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
 retry:
 	ret = drm_modeset_lock(&crtc->mutex, &ctx);
@@ -1128,7 +1136,8 @@ static int drm_mode_cursor_common(struct drm_device *dev,
 		if (ret)
 			goto out;
 
-		if (!drm_lease_held(file_priv, crtc->cursor->base.id)) {
+		if (!drm_lease_held_master(file_priv->master,
+					   crtc->cursor->base.id)) {
 			ret = -EACCES;
 			goto out;
 		}
@@ -1235,7 +1244,8 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
 
 	plane = crtc->primary;
 
-	if (!drm_lease_held(file_priv, plane->base.id))
+	lockdep_assert_held_once(&dev->master_rwsem);
+	if (!drm_lease_held_master(file_priv->master, plane->base.id))
 		return -EACCES;
 
 	if (crtc->funcs->page_flip_target) {
diff --git a/include/drm/drm_lease.h b/include/drm/drm_lease.h
index 5c9ef6a2aeae..426ea86d3c6a 100644
--- a/include/drm/drm_lease.h
+++ b/include/drm/drm_lease.h
@@ -18,6 +18,8 @@ bool drm_lease_held(struct drm_file *file_priv, int id);
 
 bool _drm_lease_held(struct drm_file *file_priv, int id);
 
+bool drm_lease_held_master(struct drm_master *master, int id);
+
 void drm_lease_revoke(struct drm_master *master);
 
 uint32_t drm_lease_filter_crtcs(struct drm_file *file_priv, uint32_t crtcs);
-- 
2.25.1

