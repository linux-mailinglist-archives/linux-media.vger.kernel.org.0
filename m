Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7CB11FCCB4
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 13:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726519AbgFQLol (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 07:44:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbgFQLol (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 07:44:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D94AEC061573
        for <linux-media@vger.kernel.org>; Wed, 17 Jun 2020 04:44:40 -0700 (PDT)
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37911F9;
        Wed, 17 Jun 2020 13:44:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592394279;
        bh=SueQJEMHkWNqTex7p/yHzCw0kqhB2vsSY0IynAzxOeE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nYfjmbQgf17JHBrYO1+Np8ClzWWvqoGhR7d0Ya2ju3sVBrZ7DWOTpSW7e/nodQNDV
         jYQkczazSalMmguNGLbvUMHBeL/+0SbXnWQzhzrEgWtjDt4n/zpYghtWzkznxxQkR8
         k/lHwyAj+FFKClg2lIDg9h9aVJrRhNmPyrPJsKQg=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] media: ti-vpe: cal: Handle multiple PHYs
Date:   Wed, 17 Jun 2020 12:44:32 +0100
Message-Id: <20200617114432.923165-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200617100240.886788-1-kieran.bingham@ideasonboard.com>
References: <20200617100240.886788-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There can be multiple PHY devices supported by the CAL, however if either
has no device connected, the current code will fail to complete probe.

Update the code paths to support a PHY with no device connected, and fix
up code loops which iterate the PHY devices to ensure they are NULL
safe.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-camerarx.c | 14 +++++++++-----
 drivers/media/platform/ti-vpe/cal.c          | 13 +++++++++++--
 2 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index 97b95973004f..14674634d882 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -526,7 +526,7 @@ static int cal_camerarx_parse_dt(struct cal_camerarx *phy)
 						phy->instance, 0);
 	if (!ep_node) {
 		phy_dbg(3, phy, "Can't get endpoint\n");
-		return -EINVAL;
+		return -ENODEV;
 	}
 
 	endpoint->bus_type = V4L2_MBUS_CSI2_DPHY;
@@ -803,6 +803,14 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 	phy->cal = cal;
 	phy->instance = instance;
 
+	ret = cal_camerarx_parse_dt(phy);
+	if (ret) {
+		if (ret == -ENODEV)
+			ret = NULL;
+
+		goto error;
+	}
+
 	phy->res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
 						(instance == 0) ?
 						"cal_rx_core0" :
@@ -821,10 +829,6 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 	if (ret)
 		goto error;
 
-	ret = cal_camerarx_parse_dt(phy);
-	if (ret)
-		goto error;
-
 	/* Initialize the V4L2 subdev and media entity. */
 	sd = &phy->subdev;
 	v4l2_subdev_init(sd, &cal_camerarx_subdev_ops);
diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 21206c3ed68e..842197f97b3b 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -275,6 +275,9 @@ void cal_quickdump_regs(struct cal_dev *cal)
 	for (i = 0; i < cal_data_get_num_csi2_phy(cal); ++i) {
 		struct cal_camerarx *phy = cal->phy[i];
 
+		if (!phy)
+			continue;
+
 		cal_info(cal, "CSI2 Core %u Registers @ %pa:\n", i,
 			 &phy->res->start);
 		print_hex_dump(KERN_INFO, "", DUMP_PREFIX_OFFSET, 16, 4,
@@ -696,6 +699,9 @@ static int cal_async_notifier_register(struct cal_dev *cal)
 		struct v4l2_async_subdev *asd;
 		struct fwnode_handle *fwnode;
 
+		if (!phy)
+			continue;
+
 		fwnode = of_fwnode_handle(phy->sensor_node);
 		asd = v4l2_async_notifier_add_fwnode_subdev(&cal->notifier,
 							    fwnode,
@@ -1033,13 +1039,15 @@ static int cal_probe(struct platform_device *pdev)
 		cal->phy[i] = cal_camerarx_create(cal, i);
 		if (IS_ERR(cal->phy[i])) {
 			ret = PTR_ERR(cal->phy[i]);
+			cal->phy[i] = NULL;
 			goto error_media;
 		}
 	}
 
 	/* Create contexts. */
 	for (i = 0; i < cal_data_get_num_csi2_phy(cal); ++i)
-		cal->ctx[i] = cal_ctx_create(cal, i);
+		if (cal->phy[i])
+			cal->ctx[i] = cal_ctx_create(cal, i);
 
 	if (!cal->ctx[0] && !cal->ctx[1]) {
 		cal_err(cal, "Neither port is configured, no point in staying up\n");
@@ -1110,7 +1118,8 @@ static int cal_runtime_resume(struct device *dev)
 		 * the clock
 		 */
 		for (i = 0; i < cal_data_get_num_csi2_phy(cal); i++)
-			cal_camerarx_i913_errata(cal->phy[i]);
+			if (cal->phy[i])
+				cal_camerarx_i913_errata(cal->phy[i]);
 	}
 
 	/*
-- 
2.25.1

