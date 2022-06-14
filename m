Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9D5A54BA37
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 21:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357359AbiFNTNC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 15:13:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357107AbiFNTNB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 15:13:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10361D0
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 12:12:58 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240126034.bbtec.net [36.240.126.34])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B18579E5;
        Tue, 14 Jun 2022 21:12:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655233977;
        bh=K9npBCq+tHJrYT4GNEeLnPI3pCxXPv+JI547oDpsamY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JKDaouJbKplgOKz8/hB24IfgiSly1LULYsV3fMoFj1zA9g0yNJqudYBXHs88XBlFo
         cgo+aiyQOW38oQ8R5BLNPXI41WdZfAYwa4HvI5/ffVwmqSoO9UFg/Qv0TvznPx5YhW
         cZbFDKtW3Zx2b0lnE9GJgZEd80Ztpspgo9aoQBz4=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 17/55] media: rkisp1: Fix sensor source pad retrieval at bound time
Date:   Wed, 15 Jun 2022 04:10:49 +0900
Message-Id: <20220614191127.3420492-18-paul.elder@ideasonboard.com>
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

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

When a sensor is bound, its source pad is retrieved in the .bound()
operation with a call to media_entity_get_fwnode_pad(). The function
should be called with the source endpoint fwnode of the sensor, but is
instead called with the sensor's device fwnode.

Fix this, which involves storing a reference to the source endpoint
fwnode in the rkisp1_sensor_async structure, and thus implementing the
subdev notifier .destroy() operation to release the reference.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  2 ++
 .../platform/rockchip/rkisp1/rkisp1-dev.c     | 28 ++++++++++++++++---
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index ba11baf75fa9..60c5462e1746 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -117,6 +117,7 @@ struct rkisp1_info {
  *
  * @asd:		async_subdev variable for the sensor
  * @index:		index of the sensor (counting sensor found in DT)
+ * @source_ep:		fwnode for the sensor source endpoint
  * @lanes:		number of lanes
  * @mbus_type:		type of bus (currently only CSI2 is supported)
  * @mbus_flags:		media bus (V4L2_MBUS_*) flags
@@ -127,6 +128,7 @@ struct rkisp1_info {
 struct rkisp1_sensor_async {
 	struct v4l2_async_subdev asd;
 	unsigned int index;
+	struct fwnode_handle *source_ep;
 	unsigned int lanes;
 	enum v4l2_mbus_type mbus_type;
 	unsigned int mbus_flags;
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 386c1c17aec2..0f3e45cdbf2a 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -138,7 +138,7 @@ static int rkisp1_subdev_notifier_bound(struct v4l2_async_notifier *notifier,
 	phy_init(s_asd->dphy);
 
 	/* Create the link to the sensor. */
-	source_pad = media_entity_get_fwnode_pad(&sd->entity, sd->fwnode,
+	source_pad = media_entity_get_fwnode_pad(&sd->entity, s_asd->source_ep,
 						 MEDIA_PAD_FL_SOURCE);
 	if (source_pad < 0) {
 		dev_err(rkisp1->dev, "failed to find source pad for %s\n",
@@ -170,10 +170,19 @@ static int rkisp1_subdev_notifier_complete(struct v4l2_async_notifier *notifier)
 	return v4l2_device_register_subdev_nodes(&rkisp1->v4l2_dev);
 }
 
+static void rkisp1_subdev_notifier_destroy(struct v4l2_async_subdev *asd)
+{
+	struct rkisp1_sensor_async *rk_asd =
+		container_of(asd, struct rkisp1_sensor_async, asd);
+
+	fwnode_handle_put(rk_asd->source_ep);
+}
+
 static const struct v4l2_async_notifier_operations rkisp1_subdev_notifier_ops = {
 	.bound = rkisp1_subdev_notifier_bound,
 	.unbind = rkisp1_subdev_notifier_unbind,
 	.complete = rkisp1_subdev_notifier_complete,
+	.destroy = rkisp1_subdev_notifier_destroy,
 };
 
 static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
@@ -190,6 +199,7 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
 			.bus_type = V4L2_MBUS_CSI2_DPHY
 		};
 		struct rkisp1_sensor_async *rk_asd;
+		struct fwnode_handle *source = NULL;
 		struct fwnode_handle *ep;
 
 		ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(rkisp1->dev),
@@ -202,15 +212,24 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
 		if (ret)
 			goto err_parse;
 
-		rk_asd = v4l2_async_nf_add_fwnode_remote(ntf, ep,
-							 struct
-							 rkisp1_sensor_async);
+		source = fwnode_graph_get_remote_endpoint(ep);
+		if (!source) {
+			dev_err(rkisp1->dev,
+				"endpoint %pfw has no remote endpoint\n",
+				ep);
+			ret = -ENODEV;
+			goto err_parse;
+		}
+
+		rk_asd = v4l2_async_nf_add_fwnode(ntf, source,
+						  struct rkisp1_sensor_async);
 		if (IS_ERR(rk_asd)) {
 			ret = PTR_ERR(rk_asd);
 			goto err_parse;
 		}
 
 		rk_asd->index = index++;
+		rk_asd->source_ep = source;
 		rk_asd->mbus_type = vep.bus_type;
 		rk_asd->mbus_flags = vep.bus.mipi_csi2.flags;
 		rk_asd->lanes = vep.bus.mipi_csi2.num_data_lanes;
@@ -225,6 +244,7 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
 		continue;
 err_parse:
 		fwnode_handle_put(ep);
+		fwnode_handle_put(source);
 		v4l2_async_nf_cleanup(ntf);
 		return ret;
 	}
-- 
2.30.2

