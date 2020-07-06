Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9F6A215E9D
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729927AbgGFSiO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:14 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729923AbgGFSiN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:13 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 206622157;
        Mon,  6 Jul 2020 20:37:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060678;
        bh=aDeGy8ZZHLgS5JukIH+oFOfTQKq/Y2NHqoKEyIjBvbU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=of8NuXUfxyXesdY/8dhUeCDqx55z6CYtryzVO/ZB/AwwdMYhz1ip9CZLupbUHJ716
         pkc7UdxvJDeHPmkhv1oqLKVoA+VuVYGqj7E+4RONMe7kHWQC6dHvy10tmu1paE+uN6
         9lF7YTXSiuEyQB+dbTLneUbt2q4HGoEt3ZLryiMM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 046/108] media: ti-vpe: cal: Inline cal_get_camerarx_regmap() in caller
Date:   Mon,  6 Jul 2020 21:36:07 +0300
Message-Id: <20200706183709.12238-47-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cal_get_camerarx_regmap() function is called in a single place.
Inline it in its caller, as it results in a clear code flow.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 75 ++++++++++++-----------------
 1 file changed, 32 insertions(+), 43 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index cb567d313035..aecded3cad16 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -960,20 +960,36 @@ static struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 	return phy;
 }
 
-static struct regmap *cal_get_camerarx_regmap(struct cal_dev *cal)
+static int cal_camerarx_init_regmap(struct cal_dev *cal)
 {
-	struct platform_device *pdev = cal->pdev;
+	struct device_node *np = cal->pdev->dev.of_node;
 	struct regmap_config config = { };
-	struct regmap *regmap;
-	void __iomem *base;
+	struct regmap *syscon;
 	struct resource *res;
+	unsigned int offset;
+	void __iomem *base;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+	syscon = syscon_regmap_lookup_by_phandle_args(np, "ti,camerrx-control",
+						      1, &offset);
+	if (!IS_ERR(syscon)) {
+		cal->syscon_camerrx = syscon;
+		cal->syscon_camerrx_offset = offset;
+		return 0;
+	}
+
+	dev_warn(&cal->pdev->dev, "failed to get ti,camerrx-control: %ld\n",
+		 PTR_ERR(syscon));
+
+	/*
+	 * Backward DTS compatibility. If syscon entry is not present then
+	 * check if the camerrx_control resource is present.
+	 */
+	res = platform_get_resource_byname(cal->pdev, IORESOURCE_MEM,
 					   "camerrx_control");
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_ioremap_resource(&cal->pdev->dev, res);
 	if (IS_ERR(base)) {
-		cal_err(cal, "failed to ioremap\n");
-		return ERR_CAST(base);
+		cal_err(cal, "failed to ioremap camerrx_control\n");
+		return PTR_ERR(base);
 	}
 
 	cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
@@ -984,45 +1000,18 @@ static struct regmap *cal_get_camerarx_regmap(struct cal_dev *cal)
 	config.val_bits = 32;
 	config.max_register = resource_size(res) - 4;
 
-	regmap = regmap_init_mmio(NULL, base, &config);
-	if (IS_ERR(regmap))
-		pr_err("regmap init failed\n");
-
-	return regmap;
-}
-
-static int cal_camerarx_init_regmap(struct cal_dev *cal)
-{
-	struct device_node *np = cal->pdev->dev.of_node;
-	struct regmap *syscon;
-	unsigned int offset;
-
-	syscon = syscon_regmap_lookup_by_phandle_args(np, "ti,camerrx-control",
-						      1, &offset);
+	syscon = regmap_init_mmio(NULL, base, &config);
 	if (IS_ERR(syscon)) {
-		dev_warn(&cal->pdev->dev,
-			 "failed to get ti,camerrx-control: %ld\n",
-			 PTR_ERR(syscon));
-
-		/*
-		 * Backward DTS compatibility.
-		 * If syscon entry is not present then check if the
-		 * camerrx_control resource is present.
-		 */
-		syscon = cal_get_camerarx_regmap(cal);
-		if (IS_ERR(syscon)) {
-			dev_err(&cal->pdev->dev,
-				"failed to get camerrx_control regmap\n");
-			return PTR_ERR(syscon);
-		}
-		/* In this case the base already point to the direct
-		 * CM register so no need for an offset
-		 */
-		offset = 0;
+		pr_err("regmap init failed\n");
+		return PTR_ERR(syscon);
 	}
 
+	/*
+	 * In this case the base already point to the direct CM register so no
+	 * need for an offset.
+	 */
 	cal->syscon_camerrx = syscon;
-	cal->syscon_camerrx_offset = offset;
+	cal->syscon_camerrx_offset = 0;
 
 	return 0;
 }
-- 
Regards,

Laurent Pinchart

