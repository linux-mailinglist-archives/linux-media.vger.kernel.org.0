Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08A5B1F8B93
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728156AbgFOABD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:01:03 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728139AbgFOABB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:01:01 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C1F1214D;
        Mon, 15 Jun 2020 02:00:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179229;
        bh=cl+SP7p7RblTLvDO9mktoYstoxM9Gyqq8/5yCfeYojc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NjPIuc7jbG0iiFkF4zDt1weteRxbNa/qUlKP8KHE6NL6u+cc8izJ6fiSUahVLnZ5k
         EfrHLkNXic7u1aIr2d8Nweex1BfEil56o/s2jUcB67cR9LjNJto4zXL52KbTXh/Fu6
         WXOiL/P+KWz21J+i4pSj25KoWqRYjEua2rn9P0tc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 043/107] media: ti-vpe: cal: Split CAMERARX syscon regmap retrieval to a function
Date:   Mon, 15 Jun 2020 02:58:40 +0300
Message-Id: <20200614235944.17716-44-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplify the cal_probe() function by splitting the CAMERARX syscon
regmap retrieval to a separate function. A few local variables are
renamed in the process to shorten them (syscon_camerrx_*) or to make
them more accurate (parent isn't the parent OF node but the CAL device's
own OF node).

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 73 +++++++++++++++++------------
 1 file changed, 42 insertions(+), 31 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 479ea9337f30..d7f251b8a8a3 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -990,6 +990,45 @@ static struct regmap *cal_get_camerarx_regmap(struct cal_dev *cal)
 	return regmap;
 }
 
+static int cal_camerarx_init_regmap(struct cal_dev *cal)
+{
+	struct device_node *np = cal->pdev->dev.of_node;
+	struct regmap *syscon;
+	u32 syscon_offset;
+	int ret;
+
+	syscon = syscon_regmap_lookup_by_phandle(np, "ti,camerrx-control");
+	ret = of_property_read_u32_index(np, "ti,camerrx-control", 1,
+					 &syscon_offset);
+	if (IS_ERR(syscon))
+		ret = PTR_ERR(syscon);
+	if (ret) {
+		dev_warn(&cal->pdev->dev,
+			 "failed to get ti,camerrx-control: %d\n", ret);
+
+		/*
+		 * Backward DTS compatibility.
+		 * If syscon entry is not present then check if the
+		 * camerrx_control resource is present.
+		 */
+		syscon = cal_get_camerarx_regmap(cal);
+		if (IS_ERR(syscon)) {
+			dev_err(&cal->pdev->dev,
+				"failed to get camerrx_control regmap\n");
+			return PTR_ERR(syscon);
+		}
+		/* In this case the base already point to the direct
+		 * CM register so no need for an offset
+		 */
+		syscon_offset = 0;
+	}
+
+	cal->syscon_camerrx = syscon;
+	cal->syscon_camerrx_offset = syscon_offset;
+
+	return 0;
+}
+
 /* ------------------------------------------------------------------
  *	Context Management
  * ------------------------------------------------------------------
@@ -2269,9 +2308,6 @@ static int cal_probe(struct platform_device *pdev)
 {
 	struct cal_dev *cal;
 	struct cal_ctx *ctx;
-	struct device_node *parent = pdev->dev.of_node;
-	struct regmap *syscon_camerrx;
-	u32 syscon_camerrx_offset;
 	unsigned int i;
 	int ret;
 	int irq;
@@ -2295,34 +2331,9 @@ static int cal_probe(struct platform_device *pdev)
 		return PTR_ERR(cal->fclk);
 	}
 
-	syscon_camerrx = syscon_regmap_lookup_by_phandle(parent,
-							 "ti,camerrx-control");
-	ret = of_property_read_u32_index(parent, "ti,camerrx-control", 1,
-					 &syscon_camerrx_offset);
-	if (IS_ERR(syscon_camerrx))
-		ret = PTR_ERR(syscon_camerrx);
-	if (ret) {
-		dev_warn(&pdev->dev, "failed to get ti,camerrx-control: %d\n",
-			 ret);
-
-		/*
-		 * Backward DTS compatibility.
-		 * If syscon entry is not present then check if the
-		 * camerrx_control resource is present.
-		 */
-		syscon_camerrx = cal_get_camerarx_regmap(cal);
-		if (IS_ERR(syscon_camerrx)) {
-			dev_err(&pdev->dev, "failed to get camerrx_control regmap\n");
-			return PTR_ERR(syscon_camerrx);
-		}
-		/* In this case the base already point to the direct
-		 * CM register so no need for an offset
-		 */
-		syscon_camerrx_offset = 0;
-	}
-
-	cal->syscon_camerrx = syscon_camerrx;
-	cal->syscon_camerrx_offset = syscon_camerrx_offset;
+	ret = cal_camerarx_init_regmap(cal);
+	if (ret < 0)
+		return ret;
 
 	cal->res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
 						"cal_top");
-- 
Regards,

Laurent Pinchart

