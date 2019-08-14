Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5048D118
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 12:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727793AbfHNKpk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 06:45:40 -0400
Received: from mail-qt1-f202.google.com ([209.85.160.202]:51799 "EHLO
        mail-qt1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726951AbfHNKpk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 06:45:40 -0400
Received: by mail-qt1-f202.google.com with SMTP id h15so1519640qtq.18
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2019 03:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=whkfqsEcOyHsXcg5UupuMappSEEYC3tS9spKNSQ45vY=;
        b=bFURKDlMw/AD0iK6Imh+IC0s8NWb8bXmrZPtvaG6c1bz3fBGInljs3qd9HxoF9Ladt
         JxuMf6NxMJZTqlD5i8OLK5nR+443EaeKi2N5kizixGX6djoqUzd5EpMxa5eSFPEJAe1e
         F0cYGel4XHYwVhpoZSBtSyZCirm3UOdvnH1NW3Izx//VVhd7c8msSJBhR2Yi6am9AUwW
         KrJZ/jm6UxGC++/jschouG9yFS7G2Yxx48fYdbx3i0s4RbZuKLclurLeFWA2IXLahwHt
         ht9QXRtE/SZnWYYO3verOc70cvm4BxlJoqyL8FEhJpp5uJ+vUbOJBqLgSg14IUne5hCe
         nfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=whkfqsEcOyHsXcg5UupuMappSEEYC3tS9spKNSQ45vY=;
        b=sreVJnBM3OeAPymZU4R9/D4akl/uZNnYA9fKHridPhRxuU4UcbkEqh1TsfkX1bhyw2
         PpztAT101ZJ7iUcglPtWObRNsUwWhc8UTrXfgftkcbG8c6Ic50ci86byGc/x0ePo0Krr
         68Lan9CxXGJW3is+obA0j8jIbp8+N2mxryoXGX3dBMwRzF2tWLtMPapcyDxUnyzRY86C
         +ySnHF4yLhjfCf+mc+klz9d9PTjMjw06jqTnJ8P073te/uNC5oR8RP0CA2YAzCpx+iBu
         oCLB3E2ITQXDIIbDL0RaJ5Ea1XVTlt33g2uaVEjYfWLc2Wdp9JgYfgwfqipCAdObHM+7
         xx2Q==
X-Gm-Message-State: APjAAAX02x9DYXKbWLRPh/DVpy1jf985TmhkulkxzXnknGmDbejqxv40
        v7/GuKBrrTTuszbZtsjs/9hRXIWvGJI=
X-Google-Smtp-Source: APXvYqxHlqOydou7FHll2RQCwIW2DiCralOJoGRp5boteOB7sUX3ztNjURofheCSvry1mZkjIGCRSLWNdxc=
X-Received: by 2002:a05:620a:1467:: with SMTP id j7mr31340962qkl.445.1565779538812;
 Wed, 14 Aug 2019 03:45:38 -0700 (PDT)
Date:   Wed, 14 Aug 2019 12:44:59 +0200
In-Reply-To: <20190814104520.6001-1-darekm@google.com>
Message-Id: <20190814104520.6001-2-darekm@google.com>
Mime-Version: 1.0
References: <20190814104520.6001-1-darekm@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v7 1/9] drm_dp_cec: add connector info support.
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Leo Li <sunpeng.li@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
        "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sean Paul <sean@poorly.run>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Ben Skeggs <bskeggs@redhat.com>, Lyude Paul <lyude@redhat.com>,
        "Jerry (Fangzhi) Zuo" <Jerry.Zuo@amd.com>,
        Anthony Koo <Anthony.Koo@amd.com>,
        Thomas Lim <Thomas.Lim@amd.com>,
        David Francis <David.Francis@amd.com>,
        "=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?=" 
        <ville.syrjala@linux.intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Imre Deak <imre.deak@intel.com>,
        Manasi Navare <manasi.d.navare@intel.com>,
        Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
        amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Pass the connector info to the CEC adapter. This makes it possible
to associate the CEC adapter with the corresponding drm connector.

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  2 +-
 drivers/gpu/drm/drm_dp_cec.c                  | 25 ++++++++++++-------
 drivers/gpu/drm/i915/display/intel_dp.c       |  4 +--
 drivers/gpu/drm/nouveau/nouveau_connector.c   |  3 +--
 include/drm/drm_dp_helper.h                   | 17 ++++++-------
 5 files changed, 27 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 16218a202b591..5ec14efd4d8cb 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -416,7 +416,7 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
 
 	drm_dp_aux_register(&aconnector->dm_dp_aux.aux);
 	drm_dp_cec_register_connector(&aconnector->dm_dp_aux.aux,
-				      aconnector->base.name, dm->adev->dev);
+				      &aconnector->base);
 	aconnector->mst_mgr.cbs = &dm_mst_cbs;
 	drm_dp_mst_topology_mgr_init(
 		&aconnector->mst_mgr,
diff --git a/drivers/gpu/drm/drm_dp_cec.c b/drivers/gpu/drm/drm_dp_cec.c
index b15cee85b702b..b457c16c3a8bb 100644
--- a/drivers/gpu/drm/drm_dp_cec.c
+++ b/drivers/gpu/drm/drm_dp_cec.c
@@ -8,7 +8,9 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <drm/drm_connector.h>
 #include <drm/drm_dp_helper.h>
+#include <drm/drmP.h>
 #include <media/cec.h>
 
 /*
@@ -295,7 +297,10 @@ static void drm_dp_cec_unregister_work(struct work_struct *work)
  */
 void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
 {
-	u32 cec_caps = CEC_CAP_DEFAULTS | CEC_CAP_NEEDS_HPD;
+	struct drm_connector *connector = aux->cec.connector;
+	u32 cec_caps = CEC_CAP_DEFAULTS | CEC_CAP_NEEDS_HPD |
+		       CEC_CAP_CONNECTOR_INFO;
+	struct cec_connector_info conn_info;
 	unsigned int num_las = 1;
 	u8 cap;
 
@@ -344,13 +349,17 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
 
 	/* Create a new adapter */
 	aux->cec.adap = cec_allocate_adapter(&drm_dp_cec_adap_ops,
-					     aux, aux->cec.name, cec_caps,
+					     aux, connector->name, cec_caps,
 					     num_las);
 	if (IS_ERR(aux->cec.adap)) {
 		aux->cec.adap = NULL;
 		goto unlock;
 	}
-	if (cec_register_adapter(aux->cec.adap, aux->cec.parent)) {
+
+	cec_fill_conn_info_from_drm(&conn_info, connector);
+	cec_s_conn_info(aux->cec.adap, &conn_info);
+
+	if (cec_register_adapter(aux->cec.adap, connector->dev->dev)) {
 		cec_delete_adapter(aux->cec.adap);
 		aux->cec.adap = NULL;
 	} else {
@@ -406,22 +415,20 @@ EXPORT_SYMBOL(drm_dp_cec_unset_edid);
 /**
  * drm_dp_cec_register_connector() - register a new connector
  * @aux: DisplayPort AUX channel
- * @name: name of the CEC device
- * @parent: parent device
+ * @connector: drm connector
  *
  * A new connector was registered with associated CEC adapter name and
  * CEC adapter parent device. After registering the name and parent
  * drm_dp_cec_set_edid() is called to check if the connector supports
  * CEC and to register a CEC adapter if that is the case.
  */
-void drm_dp_cec_register_connector(struct drm_dp_aux *aux, const char *name,
-				   struct device *parent)
+void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
+				   struct drm_connector *connector)
 {
 	WARN_ON(aux->cec.adap);
 	if (WARN_ON(!aux->transfer))
 		return;
-	aux->cec.name = name;
-	aux->cec.parent = parent;
+	aux->cec.connector = connector;
 	INIT_DELAYED_WORK(&aux->cec.unregister_work,
 			  drm_dp_cec_unregister_work);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 1092499115760..de2486fe7bf2d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5497,7 +5497,6 @@ static int
 intel_dp_connector_register(struct drm_connector *connector)
 {
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
-	struct drm_device *dev = connector->dev;
 	int ret;
 
 	ret = intel_connector_register(connector);
@@ -5512,8 +5511,7 @@ intel_dp_connector_register(struct drm_connector *connector)
 	intel_dp->aux.dev = connector->kdev;
 	ret = drm_dp_aux_register(&intel_dp->aux);
 	if (!ret)
-		drm_dp_cec_register_connector(&intel_dp->aux,
-					      connector->name, dev->dev);
+		drm_dp_cec_register_connector(&intel_dp->aux, connector);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 330d7d29a6e34..8aa703347eb54 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1416,8 +1416,7 @@ nouveau_connector_create(struct drm_device *dev,
 	switch (type) {
 	case DRM_MODE_CONNECTOR_DisplayPort:
 	case DRM_MODE_CONNECTOR_eDP:
-		drm_dp_cec_register_connector(&nv_connector->aux,
-					      connector->name, dev->dev);
+		drm_dp_cec_register_connector(&nv_connector->aux, connector);
 		break;
 	}
 
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 8364502f92cfe..7972b925a952b 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1230,20 +1230,19 @@ struct drm_dp_aux_msg {
 
 struct cec_adapter;
 struct edid;
+struct drm_connector;
 
 /**
  * struct drm_dp_aux_cec - DisplayPort CEC-Tunneling-over-AUX
  * @lock: mutex protecting this struct
  * @adap: the CEC adapter for CEC-Tunneling-over-AUX support.
- * @name: name of the CEC adapter
- * @parent: parent device of the CEC adapter
+ * @connector: the connector this CEC adapter is associated with
  * @unregister_work: unregister the CEC adapter
  */
 struct drm_dp_aux_cec {
 	struct mutex lock;
 	struct cec_adapter *adap;
-	const char *name;
-	struct device *parent;
+	struct drm_connector *connector;
 	struct delayed_work unregister_work;
 };
 
@@ -1451,8 +1450,8 @@ drm_dp_has_quirk(const struct drm_dp_desc *desc, enum drm_dp_quirk quirk)
 
 #ifdef CONFIG_DRM_DP_CEC
 void drm_dp_cec_irq(struct drm_dp_aux *aux);
-void drm_dp_cec_register_connector(struct drm_dp_aux *aux, const char *name,
-				   struct device *parent);
+void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
+				   struct drm_connector *connector);
 void drm_dp_cec_unregister_connector(struct drm_dp_aux *aux);
 void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid);
 void drm_dp_cec_unset_edid(struct drm_dp_aux *aux);
@@ -1461,9 +1460,9 @@ static inline void drm_dp_cec_irq(struct drm_dp_aux *aux)
 {
 }
 
-static inline void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
-						 const char *name,
-						 struct device *parent)
+static inline void
+drm_dp_cec_register_connector(struct drm_dp_aux *aux,
+			      struct drm_connector *connector)
 {
 }
 
-- 
2.23.0.rc1.153.gdeed80330f-goog

