Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EFA936D83F
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 15:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239813AbhD1N0i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 09:26:38 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:51335 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239803AbhD1N0g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 09:26:36 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id bkCIlVh38k1MGbkCMlOQ2N; Wed, 28 Apr 2021 15:25:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619616350; bh=S36k7BzdFChgNRjL/1UA4GOTaTR66NM9oXCXF+hBeG8=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=AYlXuAjYtJaXq2Yyxi4XhR6yf9GT0z9sZ19pGdcxRTWHXojgbQAu7gWzkCnJfLAMM
         qtyif2JFX2g8VeNzhP8Tts09T3t7kvN4fVJGGFrsHolxizfHzJrOL4UHt/ySsjjlVd
         3kxWRrx8dhApn1pV1vG43fTtQDYF/g4VRKdl+nOe0PmSdS0UtXH82InziU0cPhdK+b
         wQ2G4jL27TC6TXNz8f311NmNdOijk6ZI/4eTze66Dwq+oqvKI96gn4RRMk6hG8eJca
         lajSy9xGxL5+zicEdcFIo9a2D22mJxG9xVmH91vjyt8pnKrN6TVm7ycgH5o795UoBf
         LhzKGuKM6xRYQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tony Lindgren <tony@atomide.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 3/6] drm/omapdrm/dss/hdmi4: simplify CEC Phys Addr handling
Date:   Wed, 28 Apr 2021 15:25:42 +0200
Message-Id: <20210428132545.1205162-4-hverkuil-cisco@xs4all.nl>
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

Switch to using cec_s_phys_addr_from_edid() instead of a two-step process
of calling cec_get_edid_phys_addr() followed by cec_s_phys_addr().

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/hdmi4.c     | 13 ++-----------
 drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c |  4 ++--
 drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h |  5 +++--
 3 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index e29d4d186265..40f791c668f4 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -432,7 +432,7 @@ static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
 
 	if (status == connector_status_disconnected)
-		hdmi4_cec_set_phys_addr(&hdmi->core, CEC_PHYS_ADDR_INVALID);
+		hdmi4_cec_set_phys_addr(&hdmi->core, NULL);
 }
 
 static struct edid *hdmi4_bridge_get_edid(struct drm_bridge *bridge,
@@ -440,7 +440,6 @@ static struct edid *hdmi4_bridge_get_edid(struct drm_bridge *bridge,
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
 	struct edid *edid = NULL;
-	unsigned int cec_addr;
 	bool need_enable;
 	int r;
 
@@ -466,15 +465,7 @@ static struct edid *hdmi4_bridge_get_edid(struct drm_bridge *bridge,
 	hdmi_runtime_put(hdmi);
 	mutex_unlock(&hdmi->lock);
 
-	if (edid && edid->extensions) {
-		unsigned int len = (edid->extensions + 1) * EDID_LENGTH;
-
-		cec_addr = cec_get_edid_phys_addr((u8 *)edid, len, NULL);
-	} else {
-		cec_addr = CEC_PHYS_ADDR_INVALID;
-	}
-
-	hdmi4_cec_set_phys_addr(&hdmi->core, cec_addr);
+	hdmi4_cec_set_phys_addr(&hdmi->core, edid);
 
 	if (need_enable)
 		hdmi4_core_disable(&hdmi->core);
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
index 80ec52c9c846..cf406d86c845 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
@@ -329,9 +329,9 @@ static const struct cec_adap_ops hdmi_cec_adap_ops = {
 	.adap_transmit = hdmi_cec_adap_transmit,
 };
 
-void hdmi4_cec_set_phys_addr(struct hdmi_core_data *core, u16 pa)
+void hdmi4_cec_set_phys_addr(struct hdmi_core_data *core, struct edid *edid)
 {
-	cec_s_phys_addr(core->adap, pa, false);
+	cec_s_phys_addr_from_edid(core->adap, edid);
 }
 
 int hdmi4_cec_init(struct platform_device *pdev, struct hdmi_core_data *core,
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h
index b59a54c3040e..16bf259643b7 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h
@@ -26,13 +26,14 @@ struct platform_device;
 
 /* HDMI CEC funcs */
 #ifdef CONFIG_OMAP4_DSS_HDMI_CEC
-void hdmi4_cec_set_phys_addr(struct hdmi_core_data *core, u16 pa);
+void hdmi4_cec_set_phys_addr(struct hdmi_core_data *core, struct edid *edid);
 void hdmi4_cec_irq(struct hdmi_core_data *core);
 int hdmi4_cec_init(struct platform_device *pdev, struct hdmi_core_data *core,
 		   struct hdmi_wp_data *wp, struct drm_connector *conn);
 void hdmi4_cec_uninit(struct hdmi_core_data *core);
 #else
-static inline void hdmi4_cec_set_phys_addr(struct hdmi_core_data *core, u16 pa)
+static inline void hdmi4_cec_set_phys_addr(struct hdmi_core_data *core,
+					   struct edid *edid)
 {
 }
 
-- 
2.30.2

