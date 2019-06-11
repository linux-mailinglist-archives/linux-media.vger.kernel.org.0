Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E2D43D6A3
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 21:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407558AbfFKTVX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 15:21:23 -0400
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]:37398 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2407496AbfFKTVX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 15:21:23 -0400
Received: from mailhost.synopsys.com (unknown [10.225.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1031AC2895;
        Tue, 11 Jun 2019 19:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1560280882; bh=hdrs6nb8YFpjV8r455lNnFiSQ5gn2vCaQC+RI3/H4dI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Nj7pSWcfpO0RTASrcP7F9qps0UDhBDMaYwRe9i3FxBZD7cDp+XUFyacbSsQWlenyZ
         4h2tMXG7E15+A0BUwvzbNlGQYSLaRMYDiDG+DIJ5dTrST4Lhc2t/+ngTxLKpjfbu1i
         2mtHRfIEAkeyF4ckXa2epNcG1wOeE41Kh81w/wcaBlI5/gDrGhefBRliT+fcMSHFZD
         rrj4HXteWPT/fTiX7+5VxWLEwWZRxMWLAZkqbXknkkPrCKpn5ElOXRkFxZ4U1GFgE2
         9PyQhqAtMWCQ2m02IfrZNux6GKoGvQwg1RAmOM2Og4R/hNhW81bS1tE5veF3esePqO
         8+0B/NRbqBw7A==
Received: from de02.synopsys.com (germany.internal.synopsys.com [10.225.17.21])
        by mailhost.synopsys.com (Postfix) with ESMTP id BEEFCA0230;
        Tue, 11 Jun 2019 19:21:19 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com (de02dwia024.internal.synopsys.com [10.225.19.81])
        by de02.synopsys.com (Postfix) with ESMTP id AACE13F8A8;
        Tue, 11 Jun 2019 21:21:19 +0200 (CEST)
From:   Luis Oliveira <Luis.Oliveira@synopsys.com>
To:     mchehab@kernel.org, davem@davemloft.net,
        gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com,
        robh@kernel.org, nicolas.ferre@microchip.com,
        paulmck@linux.ibm.com, mark.rutland@arm.com, kishon@ti.com,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Joao.Pinto@synopsys.com, Luis Oliveira <Luis.Oliveira@synopsys.com>
Subject: [v4 6/6] media: platform: dwc: Add platform data support to D-Phy
Date:   Tue, 11 Jun 2019 21:20:55 +0200
Message-Id: <1560280855-18085-7-git-send-email-luis.oliveira@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
References: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch allows the configuration via platform data. This allows
the driver loading not devicetree dependent.

Signed-off-by: Luis Oliveira <luis.oliveira@synopsys.com>
---
Changelog
v3-v4
- This patch was not in the v3. This enables pdata to configure the driver

 drivers/media/platform/dwc/dw-dphy-plat.c | 87 ++++++++++++++++++++++---------
 drivers/media/platform/dwc/dw-dphy-rx.c   | 19 ++++---
 2 files changed, 72 insertions(+), 34 deletions(-)

diff --git a/drivers/media/platform/dwc/dw-dphy-plat.c b/drivers/media/platform/dwc/dw-dphy-plat.c
index 1f5113d..34d9caf 100644
--- a/drivers/media/platform/dwc/dw-dphy-plat.c
+++ b/drivers/media/platform/dwc/dw-dphy-plat.c
@@ -23,38 +23,50 @@ static struct phy_ops dw_dphy_ops = {
 
 static struct phy_provider *phy_provider;
 
+#if IS_ENABLED(CONFIG_DWC_MIPI_TC_DPHY_GEN3)
 static u8 get_config_8l(struct device *dev, struct dw_dphy_rx *dphy)
 {
-	dphy->config_8l = of_get_gpio(dev->of_node, 0);
-	if (!gpio_is_valid(dphy->config_8l)) {
-		dev_warn(dev,
-			 "failed to parse 8l config, default is 0\n");
-		dphy->config_8l = 0;
-	}
+	if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
+		dphy->config_8l = of_get_gpio(dev->of_node, 0);
+		if (!gpio_is_valid(dphy->config_8l)) {
+			dev_warn(dev,
+				 "failed to parse 8l config, default is 0\n");
+			dphy->config_8l = 0;
+		}
+	} else {
+		struct dw_phy_pdata *pdata = dev->platform_data;
 
+		dphy->config_8l = pdata->config_8l;
+	}
 	return dphy->config_8l;
 }
-
+#endif
 static int get_resources(struct device *dev, struct dw_dphy_rx *dphy)
 {
 	int ret = 0;
 
-	if (of_property_read_u32(dev->of_node, "snps,dphy-frequency",
-				 &dphy->dphy_freq)) {
-		dev_err(dev, "failed to find dphy frequency\n");
-		ret = -EINVAL;
-	}
-
-	if (of_property_read_u32(dev->of_node, "bus-width",
-				 &dphy->dphy_te_len)) {
-		dev_err(dev, "failed to find dphy te length\n");
-		ret = -EINVAL;
-	}
+	if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
+		if (of_property_read_u32(dev->of_node, "snps,dphy-frequency",
+					 &dphy->dphy_freq)) {
+			dev_err(dev, "failed to find dphy frequency\n");
+			ret = -EINVAL;
+		}
+		if (of_property_read_u32(dev->of_node, "bus-width",
+					 &dphy->dphy_te_len)) {
+			dev_err(dev, "failed to find dphy te length\n");
+			ret = -EINVAL;
+		}
+		if (of_property_read_u32(dev->of_node, "snps,phy_type",
+					 &dphy->phy_type)) {
+			dev_err(dev, "failed to find dphy type\n");
+			ret = -EINVAL;
+		}
+	} else {
+		struct dw_phy_pdata *pdata = dev->platform_data;
 
-	if (of_property_read_u32(dev->of_node, "snps,phy_type",
-				 &dphy->phy_type)) {
-		dev_err(dev, "failed to find dphy te length\n");
-		ret = -EINVAL;
+		dphy->dphy_freq = pdata->dphy_frequency;
+		dphy->dphy_te_len = pdata->dphy_te_len;
+		dphy->dphy_gen = pdata->dphy_gen;
 	}
 	dev_set_drvdata(dev, dphy);
 
@@ -63,20 +75,39 @@ static int get_resources(struct device *dev, struct dw_dphy_rx *dphy)
 
 static int phy_register(struct device *dev)
 {
-	if (dev->of_node) {
+	int ret = 0;
+
+	if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
 		phy_provider = devm_of_phy_provider_register(dev,
 							     dw_dphy_xlate);
 		if (IS_ERR(phy_provider)) {
 			dev_err(dev, "error getting phy provider\n");
-			return PTR_ERR(phy_provider);
+			ret = PTR_ERR(phy_provider);
 		}
+	} else {
+		struct dw_phy_pdata *pdata = dev->platform_data;
+		struct dw_dphy_rx *dphy = dev_get_drvdata(dev);
+
+		ret = phy_create_lookup(dphy->phy,
+					phys[pdata->id].name,
+					csis[pdata->id].name);
+		if (ret)
+			dev_err(dev, "Failed to create dphy lookup\n");
+		else
+			dev_warn(dev,
+				 "Created dphy lookup [%s] --> [%s]\n",
+				 phys[pdata->id].name, csis[pdata->id].name);
 	}
-	return 0;
+	return ret;
 }
 
 static void phy_unregister(struct device *dev)
 {
-	devm_of_phy_provider_unregister(dev, phy_provider);
+	if (!dev->of_node) {
+		struct dw_dphy_rx *dphy = dev_get_drvdata(dev);
+
+		phy_remove_lookup(dphy->phy, "dw-dphy", "dw-csi");
+	}
 }
 
 static int dw_dphy_rx_probe(struct platform_device *pdev)
@@ -166,18 +197,22 @@ static int dw_dphy_rx_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_OF)
 static const struct of_device_id dw_dphy_rx_of_match[] = {
 	{ .compatible = "snps,dw-dphy-rx" },
 	{},
 };
 
 MODULE_DEVICE_TABLE(of, dw_dphy_rx_of_match);
+#endif
 
 static struct platform_driver dw_dphy_rx_driver = {
 	.probe = dw_dphy_rx_probe,
 	.remove = dw_dphy_rx_remove,
 	.driver = {
+#if IS_ENABLED(CONFIG_OF)
 		.of_match_table = of_match_ptr(dw_dphy_rx_of_match),
+#endif
 		.name = "dw-dphy",
 		.owner = THIS_MODULE,
 	}
diff --git a/drivers/media/platform/dwc/dw-dphy-rx.c b/drivers/media/platform/dwc/dw-dphy-rx.c
index f57a814..a69cb3e 100644
--- a/drivers/media/platform/dwc/dw-dphy-rx.c
+++ b/drivers/media/platform/dwc/dw-dphy-rx.c
@@ -71,15 +71,18 @@ u8 dw_dphy_setup_config(struct dw_dphy_rx *dphy)
 		dev_vdbg(&dphy->phy->dev, "CONFIG 4L\n");
 		return CTRL_4_LANES;
 	}
-
-	ret = gpio_request(dphy->config_8l, "config");
-	if (ret < 0) {
-		dev_vdbg(&dphy->phy->dev,
-			 "could not acquire config gpio (err=%d)\n", ret);
-		return ret;
+	if (IS_ENABLED(CONFIG_OF)) {
+		ret = gpio_request(dphy->config_8l, "config");
+		if (ret < 0) {
+			dev_vdbg(&dphy->phy->dev,
+				 "could not acquire config (err=%d)\n", ret);
+			return ret;
+		}
+		ret = gpio_get_value(dphy->config_8l);
+		gpio_free(dphy->config_8l);
+	} else {
+		ret = dphy->config_8l;
 	}
-	ret = gpio_get_value(dphy->config_8l);
-	gpio_free(dphy->config_8l);
 
 	dev_vdbg(&dphy->phy->dev,
 		 "Booting in [%s] mode\n",
-- 
2.7.4

