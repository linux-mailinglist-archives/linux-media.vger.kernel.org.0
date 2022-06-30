Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABD0D5626EB
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 01:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231404AbiF3XIl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 19:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231408AbiF3XIf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 19:08:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEC712E9DF
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 16:08:27 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE63C2589;
        Fri,  1 Jul 2022 01:07:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656630469;
        bh=NKUnmgozwQ6M2cH0sZowD8uiqmyOjqngz4xSZ1/kWVQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pgMwTRPjHOEhRoPEYIMqeScLFj+E8a7b/YCcq/YehAM0iq72AyYkl2QQR8cbiZ5PE
         zMPbMn2kydeY2I1iM5VBNWaavPor7o/TtGFlUCZQyky9lz2AXnzEuRVCFMlC1sI6i6
         GUcNrDVB+2xywZ5J9P0T7+JtBvZt4SRcCtNib3lk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v2 18/55] media: rkisp1: Fix sensor source pad retrieval at bound time
Date:   Fri,  1 Jul 2022 02:06:36 +0300
Message-Id: <20220630230713.10580-19-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
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
index b0896b508db3..f08b3dec1465 100644
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
index 2e68f35e8ea5..813c013139ea 100644
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
Regards,

Laurent Pinchart

