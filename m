Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 764EE54BA50
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 21:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357798AbiFNTOn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 15:14:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345388AbiFNTOm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 15:14:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ACB9764E
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 12:14:40 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240126034.bbtec.net [36.240.126.34])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B32AD96;
        Tue, 14 Jun 2022 21:14:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655234078;
        bh=KDwDrnorXMslawjormLxIyDw9bPVJZXe9XsdxnbPr/k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PpL4s2SDYMgXlHEZ97eD37Buy9iav1AECyETYFBjKdI/RmWrZUA4WyJidJUu8L/Cn
         3C58NC+QpUeOlOvJYPQa0KwFVgrarQS5auQ5uXETjFUAZ2C+bzqYkkPMXyIA+9OSoO
         x/i2iZeKOkrO8LmeOM/flAX6xOnUyax+r/AQh9TE=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>, dafna@fastmail.com,
        heiko@sntech.de, laurent.pinchart@ideasonboard.com,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 42/55] media: rkisp1: Use fwnode_graph_for_each_endpoint
Date:   Wed, 15 Jun 2022 04:11:14 +0900
Message-Id: <20220614191127.3420492-43-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When registering the notifier, replace the manual while loop with
fwnode_graph_for_each_endpoint. This simplifies error handling.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-dev.c     | 44 +++++++++----------
 1 file changed, 20 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index a3e182c86bdd..00ace8224575 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -158,29 +158,28 @@ static const struct v4l2_async_notifier_operations rkisp1_subdev_notifier_ops =
 static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
 {
 	struct v4l2_async_notifier *ntf = &rkisp1->notifier;
-	unsigned int next_id = 0;
+	struct fwnode_handle *fwnode = dev_fwnode(rkisp1->dev);
+	struct fwnode_handle *ep;
 	unsigned int index = 0;
-	int ret;
+	int ret = 0;
 
 	v4l2_async_nf_init(ntf);
 
-	while (1) {
+	ntf->ops = &rkisp1_subdev_notifier_ops;
+
+	fwnode_graph_for_each_endpoint(fwnode, ep) {
 		struct v4l2_fwnode_endpoint vep = {
 			.bus_type = V4L2_MBUS_CSI2_DPHY
 		};
 		struct rkisp1_sensor_async *rk_asd;
-		struct fwnode_handle *source = NULL;
-		struct fwnode_handle *ep;
-
-		ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(rkisp1->dev),
-						     0, next_id,
-						     FWNODE_GRAPH_ENDPOINT_NEXT);
-		if (!ep)
-			break;
+		struct fwnode_handle *source;
 
 		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
-		if (ret)
-			goto err_parse;
+		if (ret) {
+			dev_err(rkisp1->dev, "failed to parse endpoint %pfw\n",
+				ep);
+			break;
+		}
 
 		source = fwnode_graph_get_remote_endpoint(ep);
 		if (!source) {
@@ -188,14 +187,15 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
 				"endpoint %pfw has no remote endpoint\n",
 				ep);
 			ret = -ENODEV;
-			goto err_parse;
+			break;
 		}
 
 		rk_asd = v4l2_async_nf_add_fwnode(ntf, source,
 						  struct rkisp1_sensor_async);
 		if (IS_ERR(rk_asd)) {
+			fwnode_handle_put(source);
 			ret = PTR_ERR(rk_asd);
-			goto err_parse;
+			break;
 		}
 
 		rk_asd->index = index++;
@@ -206,27 +206,23 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
 
 		dev_dbg(rkisp1->dev, "registered ep id %d with %d lanes\n",
 			vep.base.id, rk_asd->lanes);
+	}
 
-		next_id = vep.base.id + 1;
-
-		fwnode_handle_put(ep);
-
-		continue;
-err_parse:
+	if (ret) {
 		fwnode_handle_put(ep);
-		fwnode_handle_put(source);
 		v4l2_async_nf_cleanup(ntf);
 		return ret;
 	}
 
-	if (next_id == 0)
+	if (!index)
 		dev_dbg(rkisp1->dev, "no remote subdevice found\n");
-	ntf->ops = &rkisp1_subdev_notifier_ops;
+
 	ret = v4l2_async_nf_register(&rkisp1->v4l2_dev, ntf);
 	if (ret) {
 		v4l2_async_nf_cleanup(ntf);
 		return ret;
 	}
+
 	return 0;
 }
 
-- 
2.30.2

