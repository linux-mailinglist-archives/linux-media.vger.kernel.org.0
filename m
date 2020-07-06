Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34FF8215EA9
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729950AbgGFSi0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:26 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729944AbgGFSiZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:25 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD4EF2177;
        Mon,  6 Jul 2020 20:38:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060683;
        bh=nuHsHKZM81t1qUWbBjtQefL/QrMaG7iuSMH1akbAxsw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AmxSNa1ShZnh3AYVWd/kG0Mw8pQvm3GepaA7W7L1FpN084iCp6krJDCw98WPAN6wI
         o4T0x+nQW0elJZ0m0k5Yr4o3K5XjcNoiRAcdU22YwgN+hAbZpbDtRp4aLS2PhL2aqi
         1NR6YbNSBoAoV6Iu2tMg/Itl4wscfq+jCoSHhLcQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 057/108] media: ti-vpe: cal: Add cal_camerarx_destroy() to cleanup CAMERARX
Date:   Mon,  6 Jul 2020 21:36:18 +0300
Message-Id: <20200706183709.12238-58-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cal_camerarx_create() function allocates resources with devm_*, and
thus doesn't need any manual cleanup. Those won't hold true for long, as
we will need to store resources that have no devm_* allocation variant
in cal_camerarx. Furthermore, devm_kzalloc() is the wrong memory
allocation API for structures that can be accessed from userspace, as
device nodes can be kept open across device removal.

Add a cal_camerarx_destroy() function to destroy a CAMERARX instance
explicitly, and switch to kzalloc() for memory allocation.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Set cal->phy[i] to NULL in error path
---
 drivers/media/platform/ti-vpe/cal.c | 36 ++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 5580913a1356..492141f07d69 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -932,7 +932,7 @@ static struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 	struct cal_camerarx *phy;
 	int ret;
 
-	phy = devm_kzalloc(&pdev->dev, sizeof(*phy), GFP_KERNEL);
+	phy = kzalloc(sizeof(*phy), GFP_KERNEL);
 	if (!phy)
 		return ERR_PTR(-ENOMEM);
 
@@ -947,7 +947,8 @@ static struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 	phy->base = devm_ioremap_resource(&pdev->dev, phy->res);
 	if (IS_ERR(phy->base)) {
 		cal_err(cal, "failed to ioremap\n");
-		return ERR_CAST(phy->base);
+		ret = PTR_ERR(phy->base);
+		goto error;
 	}
 
 	cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
@@ -955,9 +956,21 @@ static struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 
 	ret = cal_camerarx_regmap_init(cal, phy);
 	if (ret)
-		return ERR_PTR(ret);
+		goto error;
 
 	return phy;
+
+error:
+	kfree(phy);
+	return ERR_PTR(ret);
+}
+
+static void cal_camerarx_destroy(struct cal_camerarx *phy)
+{
+	if (!phy)
+		return;
+
+	kfree(phy);
 }
 
 static int cal_camerarx_init_regmap(struct cal_dev *cal)
@@ -2253,15 +2266,18 @@ static int cal_probe(struct platform_device *pdev)
 	/* Create CAMERARX PHYs. */
 	for (i = 0; i < cal->data->num_csi2_phy; ++i) {
 		cal->phy[i] = cal_camerarx_create(cal, i);
-		if (IS_ERR(cal->phy[i]))
-			return PTR_ERR(cal->phy[i]);
+		if (IS_ERR(cal->phy[i])) {
+			ret = PTR_ERR(cal->phy[i]);
+			cal->phy[i] = NULL;
+			goto error_camerarx;
+		}
 	}
 
 	/* Register the V4L2 device. */
 	ret = v4l2_device_register(&pdev->dev, &cal->v4l2_dev);
 	if (ret) {
 		cal_err(cal, "Failed to register V4L2 device\n");
-		return ret;
+		goto error_camerarx;
 	}
 
 	/* Create contexts. */
@@ -2302,6 +2318,11 @@ static int cal_probe(struct platform_device *pdev)
 
 error_v4l2:
 	v4l2_device_unregister(&cal->v4l2_dev);
+
+error_camerarx:
+	for (i = 0; i < ARRAY_SIZE(cal->phy); i++)
+		cal_camerarx_destroy(cal->phy[i]);
+
 	return ret;
 }
 
@@ -2330,6 +2351,9 @@ static int cal_remove(struct platform_device *pdev)
 
 	v4l2_device_unregister(&cal->v4l2_dev);
 
+	for (i = 0; i < ARRAY_SIZE(cal->phy); i++)
+		cal_camerarx_destroy(cal->phy[i]);
+
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
-- 
Regards,

Laurent Pinchart

