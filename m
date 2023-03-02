Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7416A7FA6
	for <lists+linux-media@lfdr.de>; Thu,  2 Mar 2023 11:08:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbjCBKIV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Mar 2023 05:08:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230135AbjCBKII (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Mar 2023 05:08:08 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4395611660
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 02:08:07 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6738D9CA;
        Thu,  2 Mar 2023 11:08:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677751683;
        bh=ukmK0jrqABM6MAFSMTy30ipfSZ4hxT9gn1dbhKH2Vus=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eapCt68x6j63jRBTlq9DhSJBuiEnFXvyhgk/CKt7CL96y5A7r4NLI9t3edeLZFoS1
         CQq21+rk4+Mg0v/7mVi7ZvkMUeQgzf+UUmQ20O00udCmoq2CPRmeTo3+J3m2omyMFh
         0W3hGTtN2ji47k5zm3kMcEewKHiiiHtY0s81DFKk=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>,
        Vaishnav Achath <vaishnav.a@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 2/5] media: ti: cal: Fix cal_camerarx_create() error handling
Date:   Thu,  2 Mar 2023 12:07:52 +0200
Message-Id: <20230302100755.191164-3-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230302100755.191164-1-tomi.valkeinen@ideasonboard.com>
References: <20230302100755.191164-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We don't do a proper job at freeing resources in cal_camerarx_create's
error paths.

Fix these, and also switch the phy allcation from kzalloc to
devm_kzalloc to simplify the code further.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti/cal/cal-camerarx.c | 23 +++++++++++---------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
index 267089b0fea0..97208d542f9e 100644
--- a/drivers/media/platform/ti/cal/cal-camerarx.c
+++ b/drivers/media/platform/ti/cal/cal-camerarx.c
@@ -864,7 +864,7 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 	unsigned int i;
 	int ret;
 
-	phy = kzalloc(sizeof(*phy), GFP_KERNEL);
+	phy = devm_kzalloc(cal->dev, sizeof(*phy), GFP_KERNEL);
 	if (!phy)
 		return ERR_PTR(-ENOMEM);
 
@@ -882,7 +882,7 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 	if (IS_ERR(phy->base)) {
 		cal_err(cal, "failed to ioremap\n");
 		ret = PTR_ERR(phy->base);
-		goto error;
+		goto err_destroy_mutex;
 	}
 
 	cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
@@ -890,11 +890,11 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 
 	ret = cal_camerarx_regmap_init(cal, phy);
 	if (ret)
-		goto error;
+		goto err_destroy_mutex;
 
 	ret = cal_camerarx_parse_dt(phy);
 	if (ret)
-		goto error;
+		goto err_destroy_mutex;
 
 	/* Initialize the V4L2 subdev and media entity. */
 	sd = &phy->subdev;
@@ -911,21 +911,25 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 	ret = media_entity_pads_init(&sd->entity, ARRAY_SIZE(phy->pads),
 				     phy->pads);
 	if (ret)
-		goto error;
+		goto err_node_put;
 
 	ret = cal_camerarx_sd_init_cfg(sd, NULL);
 	if (ret)
-		goto error;
+		goto err_entity_cleanup;
 
 	ret = v4l2_device_register_subdev(&cal->v4l2_dev, sd);
 	if (ret)
-		goto error;
+		goto err_entity_cleanup;
 
 	return phy;
 
-error:
+err_entity_cleanup:
 	media_entity_cleanup(&phy->subdev.entity);
-	kfree(phy);
+err_node_put:
+	of_node_put(phy->source_ep_node);
+	of_node_put(phy->source_node);
+err_destroy_mutex:
+	mutex_destroy(&phy->mutex);
 	return ERR_PTR(ret);
 }
 
@@ -939,5 +943,4 @@ void cal_camerarx_destroy(struct cal_camerarx *phy)
 	of_node_put(phy->source_ep_node);
 	of_node_put(phy->source_node);
 	mutex_destroy(&phy->mutex);
-	kfree(phy);
 }
-- 
2.34.1

