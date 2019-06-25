Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2963955256
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 16:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731171AbfFYOpU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 10:45:20 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:55205 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730991AbfFYOpS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 10:45:18 -0400
Received: from cobaltpc1.rd.cisco.com ([IPv6:2001:420:44c1:2579:b032:593c:25fc:ff9b])
        by smtp-cloud9.xs4all.net with ESMTPA
        id fmh4hQwJSSfvXfmhAhHp0I; Tue, 25 Jun 2019 16:45:17 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org,
        Cheng-yi Chiang <cychiang@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv9 09/13] dw-hdmi: use cec_notifier_conn_(un)register
Date:   Tue, 25 Jun 2019 16:45:06 +0200
Message-Id: <20190625144510.122214-10-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625144510.122214-1-hverkuil-cisco@xs4all.nl>
References: <20190625144510.122214-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfIo22fLBIrqLMrXisr54Oz7ccU5U7XrkX5DqS6e4gjZCJDJZRwR7HVkEE6n7qWgdpxc4gdVprEUsxmIO7u7A4kSJm1ZMYKCM9GPw4XNwYWyQ+Yy206sO
 8UOAgAhk2FID2WCfrssWt2OuksRbq/48El4w9eIkWbzZOD5di6vBRkkL0fJAaPA6KJGO0jDFY6McPqSDGQ1vgv3TBj1bvljUvLVCq3SBaXB4pIfT7mBmBEFn
 EJsZDAkB/wkU88ekHbdFfvLcrLiVt/xlTF/6Svej/c7UAtEOmfOW9g91mLRz6JgxP90TrHaHLf/mh3cXLf/04ILJvo/77mQOiwliRa/+EKmLkuo258l2WAuP
 cQRujG7QhQEvHiym9xGYBJXIZfyp27/4N/GZpDbUdehbVYPqSmOkJB8xCaw8oEBetoqYoi0p
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dariusz Marcinkiewicz <darekm@google.com>

Use the new cec_notifier_conn_(un)register() functions to
(un)register the notifier for the HDMI connector, and fill in
the cec_connector_info.

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 104 ++++++++++++----------
 1 file changed, 58 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 045b1b13fd0e..fc4d3b5f71d0 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -133,6 +133,8 @@ struct dw_hdmi {
 	struct drm_connector connector;
 	struct drm_bridge bridge;
 
+	int irq;
+
 	unsigned int version;
 
 	struct platform_device *audio;
@@ -184,6 +186,7 @@ struct dw_hdmi {
 	void (*enable_audio)(struct dw_hdmi *hdmi);
 	void (*disable_audio)(struct dw_hdmi *hdmi);
 
+	bool cec_configured;
 	struct cec_notifier *cec_notifier;
 };
 
@@ -2108,11 +2111,35 @@ static const struct drm_connector_helper_funcs dw_hdmi_connector_helper_funcs =
 	.get_modes = dw_hdmi_connector_get_modes,
 };
 
+static void dw_hdmi_cec_enable(struct dw_hdmi *hdmi)
+{
+	mutex_lock(&hdmi->mutex);
+	hdmi->mc_clkdis &= ~HDMI_MC_CLKDIS_CECCLK_DISABLE;
+	hdmi_writeb(hdmi, hdmi->mc_clkdis, HDMI_MC_CLKDIS);
+	mutex_unlock(&hdmi->mutex);
+}
+
+static void dw_hdmi_cec_disable(struct dw_hdmi *hdmi)
+{
+	mutex_lock(&hdmi->mutex);
+	hdmi->mc_clkdis |= HDMI_MC_CLKDIS_CECCLK_DISABLE;
+	hdmi_writeb(hdmi, hdmi->mc_clkdis, HDMI_MC_CLKDIS);
+	mutex_unlock(&hdmi->mutex);
+}
+
+static const struct dw_hdmi_cec_ops dw_hdmi_cec_ops = {
+	.write = hdmi_writeb,
+	.read = hdmi_readb,
+	.enable = dw_hdmi_cec_enable,
+	.disable = dw_hdmi_cec_disable,
+};
+
 static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
 	struct drm_encoder *encoder = bridge->encoder;
 	struct drm_connector *connector = &hdmi->connector;
+	struct cec_connector_info conn_info;
 
 	connector->interlace_allowed = 1;
 	connector->polled = DRM_CONNECTOR_POLL_HPD;
@@ -2124,6 +2151,33 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
 
 	drm_connector_attach_encoder(connector, encoder);
 
+	cec_fill_conn_info_from_drm(&conn_info, connector);
+
+	hdmi->cec_notifier = cec_notifier_conn_register(hdmi->dev, NULL,
+							&conn_info);
+	if (!hdmi->cec_notifier)
+		return -ENOMEM;
+
+	if (hdmi->cec_configured) {
+		struct platform_device_info pdevinfo;
+		struct dw_hdmi_cec_data cec;
+
+		memset(&pdevinfo, 0, sizeof(pdevinfo));
+		pdevinfo.parent = hdmi->dev;
+		pdevinfo.id = PLATFORM_DEVID_AUTO;
+
+		cec.hdmi = hdmi;
+		cec.ops = &dw_hdmi_cec_ops;
+		cec.irq = hdmi->irq;
+
+		pdevinfo.name = "dw-hdmi-cec";
+		pdevinfo.data = &cec;
+		pdevinfo.size_data = sizeof(cec);
+		pdevinfo.dma_mask = 0;
+
+		hdmi->cec = platform_device_register_full(&pdevinfo);
+	}
+
 	return 0;
 }
 
@@ -2393,29 +2447,6 @@ static int dw_hdmi_detect_phy(struct dw_hdmi *hdmi)
 	return -ENODEV;
 }
 
-static void dw_hdmi_cec_enable(struct dw_hdmi *hdmi)
-{
-	mutex_lock(&hdmi->mutex);
-	hdmi->mc_clkdis &= ~HDMI_MC_CLKDIS_CECCLK_DISABLE;
-	hdmi_writeb(hdmi, hdmi->mc_clkdis, HDMI_MC_CLKDIS);
-	mutex_unlock(&hdmi->mutex);
-}
-
-static void dw_hdmi_cec_disable(struct dw_hdmi *hdmi)
-{
-	mutex_lock(&hdmi->mutex);
-	hdmi->mc_clkdis |= HDMI_MC_CLKDIS_CECCLK_DISABLE;
-	hdmi_writeb(hdmi, hdmi->mc_clkdis, HDMI_MC_CLKDIS);
-	mutex_unlock(&hdmi->mutex);
-}
-
-static const struct dw_hdmi_cec_ops dw_hdmi_cec_ops = {
-	.write = hdmi_writeb,
-	.read = hdmi_readb,
-	.enable = dw_hdmi_cec_enable,
-	.disable = dw_hdmi_cec_disable,
-};
-
 static const struct regmap_config hdmi_regmap_8bit_config = {
 	.reg_bits	= 32,
 	.val_bits	= 8,
@@ -2438,7 +2469,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
 	struct device_node *np = dev->of_node;
 	struct platform_device_info pdevinfo;
 	struct device_node *ddc_node;
-	struct dw_hdmi_cec_data cec;
 	struct dw_hdmi *hdmi;
 	struct resource *iores = NULL;
 	int irq;
@@ -2588,6 +2618,7 @@ __dw_hdmi_probe(struct platform_device *pdev,
 		ret = irq;
 		goto err_iahb;
 	}
+	hdmi->irq = irq;
 
 	ret = devm_request_threaded_irq(dev, irq, dw_hdmi_hardirq,
 					dw_hdmi_irq, IRQF_SHARED,
@@ -2595,12 +2626,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
 	if (ret)
 		goto err_iahb;
 
-	hdmi->cec_notifier = cec_notifier_get(dev);
-	if (!hdmi->cec_notifier) {
-		ret = -ENOMEM;
-		goto err_iahb;
-	}
-
 	/*
 	 * To prevent overflows in HDMI_IH_FC_STAT2, set the clk regenerator
 	 * N and cts values before enabling phy
@@ -2663,18 +2688,8 @@ __dw_hdmi_probe(struct platform_device *pdev,
 		hdmi->audio = platform_device_register_full(&pdevinfo);
 	}
 
-	if (config0 & HDMI_CONFIG0_CEC) {
-		cec.hdmi = hdmi;
-		cec.ops = &dw_hdmi_cec_ops;
-		cec.irq = irq;
-
-		pdevinfo.name = "dw-hdmi-cec";
-		pdevinfo.data = &cec;
-		pdevinfo.size_data = sizeof(cec);
-		pdevinfo.dma_mask = 0;
-
-		hdmi->cec = platform_device_register_full(&pdevinfo);
-	}
+	if (config0 & HDMI_CONFIG0_CEC)
+		hdmi->cec_configured = true;
 
 	/* Reset HDMI DDC I2C master controller and mute I2CM interrupts */
 	if (hdmi->i2c)
@@ -2688,9 +2703,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
 		hdmi->ddc = NULL;
 	}
 
-	if (hdmi->cec_notifier)
-		cec_notifier_put(hdmi->cec_notifier);
-
 	clk_disable_unprepare(hdmi->iahb_clk);
 	if (hdmi->cec_clk)
 		clk_disable_unprepare(hdmi->cec_clk);
@@ -2713,7 +2725,7 @@ static void __dw_hdmi_remove(struct dw_hdmi *hdmi)
 	hdmi_writeb(hdmi, ~0, HDMI_IH_MUTE_PHY_STAT0);
 
 	if (hdmi->cec_notifier)
-		cec_notifier_put(hdmi->cec_notifier);
+		cec_notifier_conn_unregister(hdmi->cec_notifier);
 
 	clk_disable_unprepare(hdmi->iahb_clk);
 	clk_disable_unprepare(hdmi->isfr_clk);
-- 
2.20.1

