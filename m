Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFD9C36D83E
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 15:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239812AbhD1N0h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 09:26:37 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:51467 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239802AbhD1N0g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 09:26:36 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id bkCIlVh38k1MGbkCMlOQ2G; Wed, 28 Apr 2021 15:25:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619616350; bh=I08VdfG/6TBmNGImMatlyLkYtVqeih73S7Lec4XTago=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=IfZm/3GCB5xTVBE8zF9tdw9dlc/D9PE0bUEPdZCkKgUYmf6gpXJOm8wx0wgO4UIL7
         IBCjEwTMawMKIM5aG8QnQb0p637rDevXwVB5Qq7wRwjpiocmM3ubBrfvPWkuqDrAxf
         Zo8M+IjhB+uSixeBljmyDhTnDEV0PmeLugd3xYuQRUAaDcFjSpG56NBrafw7RocLxb
         3gaO3ebYi5ghm23J9jK3LQGaj/pjYd3M0enPFlNmvic6RWdnlY/P6CO7ZjVfHUdvkF
         Gp9f10cEWJtFh/c8KsWMFFFTEMrL41unHgZ+pEiZoy9Tag5yRAz/NpTXxgk+Tflsfl
         LW/njwCaIFRhw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tony Lindgren <tony@atomide.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 2/6] drm/omapdrm/dss/hdmi4: switch to the connector bridge ops
Date:   Wed, 28 Apr 2021 15:25:41 +0200
Message-Id: <20210428132545.1205162-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210428132545.1205162-1-hverkuil-cisco@xs4all.nl>
References: <20210428132545.1205162-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfDrP3ZirMCC5KFdn7pW3xJT36GgiPiG8oeeu4v+ykvL72offX23YO3z9jC3Z5A3iJgqrCaTh5BINYHL/fl1+6UAf1q4tbQv7yIhj9XqiNc2oo44NuArH
 Qk7jEPGgOwdgTf7SXvj1thAzyMVO47e+ukXninKLi9hK1WEZZZfkFh6ZbFIgwIVyfEd7aYkmSNuFBHa+RVRKgGaW/EcwuECIPmYxUya8YrL1EZWBDPj0kwc/
 Bx4nGNi1jCHYtevo7SSe1i0AodVNrXmI8QC0rh9K6//bxK4LAiefiUoQzZ6WeXxUwZKJwKLGZ8oWBh5wYoXbZwaJvj6pFz7ERbjtOYft9pCDMMmTU23jKKQA
 TQpD6Js2iNFnXErB379sx6FxR+rMVw1saLg60AjHvr27i5dvrds8J7d40bqezwOZ8NaBhpMd
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement the new connector_attach/detach bridge ops. This makes it
possible to associate a CEC adapter with a drm connector, which helps
userspace determine which cec device node belongs to which drm connector.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/hdmi4.c     | 28 ++++++++++++++++++-------
 drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c |  9 +++++---
 drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h |  7 ++++---
 3 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index 35b750cebaeb..e29d4d186265 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -482,6 +482,23 @@ static struct edid *hdmi4_bridge_get_edid(struct drm_bridge *bridge,
 	return edid;
 }
 
+static int hdmi4_bridge_connector_attach(struct drm_bridge *bridge,
+					 struct drm_connector *conn)
+{
+	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
+
+	hdmi4_cec_init(hdmi->pdev, &hdmi->core, &hdmi->wp, conn);
+	return 0;
+}
+
+static void hdmi4_bridge_connector_detach(struct drm_bridge *bridge,
+					  struct drm_connector *conn)
+{
+	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
+
+	hdmi4_cec_uninit(&hdmi->core);
+}
+
 static const struct drm_bridge_funcs hdmi4_bridge_funcs = {
 	.attach = hdmi4_bridge_attach,
 	.mode_set = hdmi4_bridge_mode_set,
@@ -492,6 +509,8 @@ static const struct drm_bridge_funcs hdmi4_bridge_funcs = {
 	.atomic_disable = hdmi4_bridge_disable,
 	.hpd_notify = hdmi4_bridge_hpd_notify,
 	.get_edid = hdmi4_bridge_get_edid,
+	.connector_attach = hdmi4_bridge_connector_attach,
+	.connector_detach = hdmi4_bridge_connector_detach,
 };
 
 static void hdmi4_bridge_init(struct omap_hdmi *hdmi)
@@ -647,14 +666,10 @@ static int hdmi4_bind(struct device *dev, struct device *master, void *data)
 	if (r)
 		goto err_runtime_put;
 
-	r = hdmi4_cec_init(hdmi->pdev, &hdmi->core, &hdmi->wp);
-	if (r)
-		goto err_pll_uninit;
-
 	r = hdmi_audio_register(hdmi);
 	if (r) {
 		DSSERR("Registering HDMI audio failed\n");
-		goto err_cec_uninit;
+		goto err_pll_uninit;
 	}
 
 	hdmi->debugfs = dss_debugfs_create_file(dss, "hdmi", hdmi_dump_regs,
@@ -664,8 +679,6 @@ static int hdmi4_bind(struct device *dev, struct device *master, void *data)
 
 	return 0;
 
-err_cec_uninit:
-	hdmi4_cec_uninit(&hdmi->core);
 err_pll_uninit:
 	hdmi_pll_uninit(&hdmi->pll);
 err_runtime_put:
@@ -682,7 +695,6 @@ static void hdmi4_unbind(struct device *dev, struct device *master, void *data)
 	if (hdmi->audio_pdev)
 		platform_device_unregister(hdmi->audio_pdev);
 
-	hdmi4_cec_uninit(&hdmi->core);
 	hdmi_pll_uninit(&hdmi->pll);
 }
 
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
index 43592c1cf081..80ec52c9c846 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
@@ -335,10 +335,10 @@ void hdmi4_cec_set_phys_addr(struct hdmi_core_data *core, u16 pa)
 }
 
 int hdmi4_cec_init(struct platform_device *pdev, struct hdmi_core_data *core,
-		  struct hdmi_wp_data *wp)
+		   struct hdmi_wp_data *wp, struct drm_connector *conn)
 {
-	const u32 caps = CEC_CAP_TRANSMIT | CEC_CAP_LOG_ADDRS |
-			 CEC_CAP_PASSTHROUGH | CEC_CAP_RC;
+	const u32 caps = CEC_CAP_DEFAULTS | CEC_CAP_CONNECTOR_INFO;
+	struct cec_connector_info conn_info;
 	int ret;
 
 	core->adap = cec_allocate_adapter(&hdmi_cec_adap_ops, core,
@@ -346,6 +346,8 @@ int hdmi4_cec_init(struct platform_device *pdev, struct hdmi_core_data *core,
 	ret = PTR_ERR_OR_ZERO(core->adap);
 	if (ret < 0)
 		return ret;
+	cec_fill_conn_info_from_drm(&conn_info, conn);
+	cec_s_conn_info(core->adap, &conn_info);
 	core->wp = wp;
 
 	/* Disable clock initially, hdmi_cec_adap_enable() manages it */
@@ -354,6 +356,7 @@ int hdmi4_cec_init(struct platform_device *pdev, struct hdmi_core_data *core,
 	ret = cec_register_adapter(core->adap, &pdev->dev);
 	if (ret < 0) {
 		cec_delete_adapter(core->adap);
+		core->adap = NULL;
 		return ret;
 	}
 	return 0;
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h
index 0292337c97cc..b59a54c3040e 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h
@@ -29,7 +29,7 @@ struct platform_device;
 void hdmi4_cec_set_phys_addr(struct hdmi_core_data *core, u16 pa);
 void hdmi4_cec_irq(struct hdmi_core_data *core);
 int hdmi4_cec_init(struct platform_device *pdev, struct hdmi_core_data *core,
-		  struct hdmi_wp_data *wp);
+		   struct hdmi_wp_data *wp, struct drm_connector *conn);
 void hdmi4_cec_uninit(struct hdmi_core_data *core);
 #else
 static inline void hdmi4_cec_set_phys_addr(struct hdmi_core_data *core, u16 pa)
@@ -41,8 +41,9 @@ static inline void hdmi4_cec_irq(struct hdmi_core_data *core)
 }
 
 static inline int hdmi4_cec_init(struct platform_device *pdev,
-				struct hdmi_core_data *core,
-				struct hdmi_wp_data *wp)
+				 struct hdmi_core_data *core,
+				 struct hdmi_wp_data *wp,
+				 struct drm_connector *conn)
 {
 	return 0;
 }
-- 
2.30.2

