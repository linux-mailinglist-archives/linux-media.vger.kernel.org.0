Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B5321F8B94
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728141AbgFOABF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:01:05 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728131AbgFOABD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:01:03 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5239E214F;
        Mon, 15 Jun 2020 02:00:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179230;
        bh=C2MVpL2PQPFSFmlxbmwmk5nn1HWr5eMcyY2s03yz6s8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YPWvfYBmPF+AP7gf16Hc4eVRU40+qTy3p9cMf1xjcYhAtk+NqamXfcGc3wVZCrD13
         KH95dMEt62HAe6LB9u1pEOaHoXdH/aaCQa1oeDJro7RfOFYTPx3CIrwiNv13LHnKpM
         Skt7E4iq3p+A0A7OKLIh2YFzilwFLnP0+dKr1kLg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 045/107] media: ti-vpe: cal: Inline cal_get_camerarx_regmap() in caller
Date:   Mon, 15 Jun 2020 02:58:42 +0300
Message-Id: <20200614235944.17716-46-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cal_get_camerarx_regmap() function is called in a single place.
Inline it in its caller, as it results in a clear code flow.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 75 ++++++++++++-----------------
 1 file changed, 32 insertions(+), 43 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 522b2b4b76e0..c83bf261da91 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -959,20 +959,36 @@ static struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
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
@@ -983,45 +999,18 @@ static struct regmap *cal_get_camerarx_regmap(struct cal_dev *cal)
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

