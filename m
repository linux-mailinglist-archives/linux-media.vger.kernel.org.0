Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 649F024D38
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2019 12:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727813AbfEUKwY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 May 2019 06:52:24 -0400
Received: from mail-qk1-f202.google.com ([209.85.222.202]:41138 "EHLO
        mail-qk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727812AbfEUKwX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 May 2019 06:52:23 -0400
Received: by mail-qk1-f202.google.com with SMTP id a64so15216388qkf.8
        for <linux-media@vger.kernel.org>; Tue, 21 May 2019 03:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=vnziNS36GPHuXded3o5ldP0mZgaGiffWcQFWcT8fgmQ=;
        b=THb0GRXYeY1RT+UpnMpCpwZxORfq8jIbMKHEXExOxNfFOhvLB/t6T/lb3ZCNfhvp6o
         LrDyWbAXfjyZE+ZY7rSPeE8FMrr7zfnn94+RGElUV/aBKn/WSz41vDyDJFpqjDVDi+9v
         Lafqk/pFMPy9W4QgmQCmE0mEUKnfO+ZUqGFE/ECINA5qrSySXwcagsWZSwUwkQgNmHOm
         srTfS72r0UBm15whGZ+BPLuoMxR36EAn5F/vE/5Lbpteu9XEE5dyOoKfUX5D/LIYIjGN
         nf/atsClVdSHtJZrd+1Mndvbts+Tr1btEnxUJLFLJ35BFAZ8pgD5erOcp4z02D01wPlr
         Yv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=vnziNS36GPHuXded3o5ldP0mZgaGiffWcQFWcT8fgmQ=;
        b=KZyXJLtuPpivbETgEj+4Fy7awLia4jPL88lTY3YQiUHuoEuuShSuipNJ51SpAf4aMZ
         W+P0/sIb9XkOm+WxqbprhMhYMvXIQiqrFRxjWEJB0s5BZf+XNlQw/lsOrHxt379HGAKA
         euH6dMnm/2TaZLDflD80dRc0Tr29XaMID+JqwIU4SNeP5ZgUh3deKAWmbgyCb4w2+FKV
         P2eQ90zRXxF99nv3eWMK2AIqYPj9aOKqNN4USfOZYjPkobaCrMJjNWvMFLPDUfJQYh79
         3FbIqD9KGWU/qqWcbFoca/IwkHBD3+jZdjGns1FpHnKHxjrKdOBEZWn4WYEjb9DI8Jh5
         nqpA==
X-Gm-Message-State: APjAAAXRAxoqeKzr/TZeMFCFEDnYu19AHzfA5iX3xwwKY03t7uP04VdB
        Om2NYGejVA2LV7zyeQgCh6ejpTki+w7J95TgRe73q8LzY6KxFSPAQMempgGM0KsG+nTOb2N7KVb
        ChOE2M9zbZ5jnlYEkcfal8EQ2A1snDPUQMZySz0YmS9qMCQ41yDZNgOnKzDsHLuX1wOK7
X-Google-Smtp-Source: APXvYqxJsB9ZOPYnW/QmGoDTZ0oGUkEVnobD/A5ylJ43BOcNBDYPe0GVTLL+oLbi6tQpOBAl1tZ0gODH1vg=
X-Received: by 2002:a0c:8ae9:: with SMTP id 38mr64625877qvw.157.1558435942076;
 Tue, 21 May 2019 03:52:22 -0700 (PDT)
Date:   Tue, 21 May 2019 12:52:02 +0200
In-Reply-To: <20190521105203.154043-1-darekm@google.com>
Message-Id: <20190521105203.154043-2-darekm@google.com>
Mime-Version: 1.0
References: <20190521105203.154043-1-darekm@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v7 2/3] drm/bridge: dw-hdmi: pass connector info to the CEC adapter
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     linux-media@vger.kernel.org, hans.verkuil@cisco.com,
        hverkuil@xs4all.nl
Cc:     linux-kernel@vger.kernel.org,
        Dariusz Marcinkiewicz <darekm@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch makes dw-hdmi pass DRM connector info to a respective
CEC adapter. In order to be able to do that it delays creation of
the dw-hdmi-cec platform device until DRM connector is initialized.

Requires testing.

Changes since version v5:
- connector info is passed trough notifier, fixed CEC platform
  device initialization

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c |  13 ++-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 103 ++++++++++--------
 2 files changed, 66 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
index 84fb7b6a0a5e0..64cc278f5a754 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
@@ -232,6 +232,7 @@ static void dw_hdmi_cec_del(void *data)
 static int dw_hdmi_cec_probe(struct platform_device *pdev)
 {
 	struct dw_hdmi_cec_data *data = dev_get_platdata(&pdev->dev);
+	const struct cec_connector_info *conn_info;
 	struct dw_hdmi_cec *cec;
 	int ret;
 
@@ -258,10 +259,16 @@ static int dw_hdmi_cec_probe(struct platform_device *pdev)
 	dw_hdmi_write(cec, ~0, HDMI_IH_MUTE_CEC_STAT0);
 	dw_hdmi_write(cec, 0, HDMI_CEC_POLARITY);
 
+	cec->notify = cec_notifier_get(pdev->dev.parent);
+	if (!cec->notify)
+		return -ENOMEM;
+
+	conn_info = cec_notifier_get_conn_info(cec->notify);
+
 	cec->adap = cec_allocate_adapter(&dw_hdmi_cec_ops, cec, "dw_hdmi",
 					 CEC_CAP_LOG_ADDRS | CEC_CAP_TRANSMIT |
 					 CEC_CAP_RC | CEC_CAP_PASSTHROUGH,
-					 CEC_MAX_LOG_ADDRS, NULL);
+					 CEC_MAX_LOG_ADDRS, conn_info);
 	if (IS_ERR(cec->adap))
 		return PTR_ERR(cec->adap);
 
@@ -281,10 +288,6 @@ static int dw_hdmi_cec_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	cec->notify = cec_notifier_get(pdev->dev.parent);
-	if (!cec->notify)
-		return -ENOMEM;
-
 	ret = cec_register_adapter(cec->adap, pdev->dev.parent);
 	if (ret < 0) {
 		cec_notifier_put(cec->notify);
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index ab7968c8f6a29..ed2f3e7e9c1cf 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -138,6 +138,8 @@ struct dw_hdmi {
 	struct drm_connector connector;
 	struct drm_bridge bridge;
 
+	int irq;
+
 	unsigned int version;
 
 	struct platform_device *audio;
@@ -189,6 +191,7 @@ struct dw_hdmi {
 	void (*enable_audio)(struct dw_hdmi *hdmi);
 	void (*disable_audio)(struct dw_hdmi *hdmi);
 
+	bool cec_configured;
 	struct cec_notifier *cec_notifier;
 };
 
@@ -2113,11 +2116,35 @@ static const struct drm_connector_helper_funcs dw_hdmi_connector_helper_funcs =
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
@@ -2129,6 +2156,34 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
 
 	drm_connector_attach_encoder(connector, encoder);
 
+	cec_fill_connector_info(&conn_info, connector);
+
+	hdmi->cec_notifier = cec_notifier_get_conn(hdmi->dev, NULL,
+						   &conn_info);
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
+
+	}
+
 	return 0;
 }
 
@@ -2398,29 +2453,6 @@ static int dw_hdmi_detect_phy(struct dw_hdmi *hdmi)
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
@@ -2443,7 +2475,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
 	struct device_node *np = dev->of_node;
 	struct platform_device_info pdevinfo;
 	struct device_node *ddc_node;
-	struct dw_hdmi_cec_data cec;
 	struct dw_hdmi *hdmi;
 	struct resource *iores = NULL;
 	int irq;
@@ -2593,6 +2624,7 @@ __dw_hdmi_probe(struct platform_device *pdev,
 		ret = irq;
 		goto err_iahb;
 	}
+	hdmi->irq = irq;
 
 	ret = devm_request_threaded_irq(dev, irq, dw_hdmi_hardirq,
 					dw_hdmi_irq, IRQF_SHARED,
@@ -2600,12 +2632,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
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
@@ -2668,18 +2694,8 @@ __dw_hdmi_probe(struct platform_device *pdev,
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
@@ -2693,9 +2709,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
 		hdmi->ddc = NULL;
 	}
 
-	if (hdmi->cec_notifier)
-		cec_notifier_put(hdmi->cec_notifier);
-
 	clk_disable_unprepare(hdmi->iahb_clk);
 	if (hdmi->cec_clk)
 		clk_disable_unprepare(hdmi->cec_clk);
-- 
2.18.1

