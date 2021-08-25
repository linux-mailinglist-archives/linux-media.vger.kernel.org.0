Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B9A83F7327
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 12:27:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240165AbhHYK1t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 06:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240091AbhHYK1n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 06:27:43 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1499AC0613C1;
        Wed, 25 Aug 2021 03:26:58 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id b9so9678439plx.2;
        Wed, 25 Aug 2021 03:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uk23yrQj2bYGx5iUQvrvtVaf8WaEKXc6e3h1Qpr0Wxc=;
        b=BWSKA8AUjVQ50e47odJHTUdgySf+Ui5SxD63HSnvhT3Y2nW/W0LeIK7ED0XXqlgOPp
         CnsORRw46Z0JjgWe4AAS+3YKmgLO8GFneYav7pypBwEoTFNCsPlberP+D66TxmKp9zGl
         bDgTWZNHKNUbpQ/UlWFVE2rwq4pfH/42C3u/yCdpo4ffhPFp9xooRzeQTPl79EEtYNqT
         7uXvOAApPrrARRsuZmogj9TBFTMqJfZnALu0o8OujnrBJ1Eo0AOSSOadPyLqxxfhkURH
         ve+E6G3HuuqLW4pSke2ZTWl4gScZpH/UHzFkdbpvUfaykvjzBjYoXchp8pFKfaNqH21u
         wO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uk23yrQj2bYGx5iUQvrvtVaf8WaEKXc6e3h1Qpr0Wxc=;
        b=nZsSv6aJdO6/SLL6kJd91C1wKjbStCEoGot536s4qt6061DKMM2SKASkLQhyfiDayJ
         vWh5O/VDa9kS/vQBoImbHy6sqJZFmWeoh0Y8Vem2tqGKVDAnP+BppZRVW5KQHl5Alp5P
         QulSUXRy1b9WStaFS1uEUILQM3wcbyfjjk2WCsaR/2iSuNOdWRi+5uM0rOHSPkeA4onY
         Y/m5kNR/9PZMQfZc0RrhC9J2DNRSXk9RcNQKg7ZxrZEeEBQ8alaWJRzNcgFmRGR9HK7N
         nrdxj6ozLmbWFTJc7HPo3xdgN+bs3nspAjbpS2quAgAAD2kaYN93ow/FvL3bXjbjVFh0
         BabA==
X-Gm-Message-State: AOAM531uQEmq67JByBvwFr5zMejXnYQGkJ/QbL0A/ru/wLsm5g333C1B
        +BYJDkCp+qGpb4ym4ZeCb6g=
X-Google-Smtp-Source: ABdhPJytkjiDZ8qPb5DBfLVt7ff+o3cMdp+LthsSPCnnII0Plz6+Bb78f8IMUv18k6LCIVbqrGYgJA==
X-Received: by 2002:a17:90b:384a:: with SMTP id nl10mr9780352pjb.65.1629887217646;
        Wed, 25 Aug 2021 03:26:57 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id t42sm10228377pfg.30.2021.08.25.03.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 03:26:57 -0700 (PDT)
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
Subject: [PATCH v6 6/7] drm: avoid circular locks with modeset_mutex and master_rwsem
Date:   Wed, 25 Aug 2021 18:24:10 +0800
Message-Id: <20210825102411.1084220-7-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210825102411.1084220-1-desmondcheongzx@gmail.com>
References: <20210825102411.1084220-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

drm_lease_held calls drm_file_get_master. However, this function is
sometimes called while holding on to modeset_mutex. Since
drm_device.master_rwsem will replace drm_file.master_lookup_lock in
drm_file_get_master in a future patch, this inverts the master_rwsem
--> modeset_mutex lock hierarchy.

To fix this, we create a new drm_lease_held_master helper function
that enables us to avoid calling drm_file_get_master after locking
modeset_mutex.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_auth.c    |  3 +++
 drivers/gpu/drm/drm_encoder.c |  7 ++++++-
 drivers/gpu/drm/drm_lease.c   | 30 +++++++++++++++---------------
 drivers/gpu/drm/drm_plane.c   | 14 +++++++++++---
 include/drm/drm_lease.h       |  2 ++
 5 files changed, 37 insertions(+), 19 deletions(-)

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
index b5566167a798..af9f65bf74d4 100644
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
@@ -1128,7 +1136,7 @@ static int drm_mode_cursor_common(struct drm_device *dev,
 		if (ret)
 			goto out;
 
-		if (!drm_lease_held(file_priv, crtc->cursor->base.id)) {
+		if (file_priv && !drm_lease_held_master(file_priv->master, crtc->cursor->base.id)) {
 			ret = -EACCES;
 			goto out;
 		}
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

