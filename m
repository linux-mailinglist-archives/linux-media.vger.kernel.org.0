Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EFCC570330
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 14:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232151AbiGKMpt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 08:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231846AbiGKMpS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 08:45:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B97FB5246E
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 05:44:48 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B61A3070;
        Mon, 11 Jul 2022 14:43:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657543424;
        bh=1HAfhP33oj61ch5OfO00FZQqZOYFnGE64Hf3Et9QcEw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UIk4PNZYFtA5VCME/hGpvKQOy9VqKgA0kyHS0EvxzpzKmdErVjHxstKc8QeKN86iU
         3Mz9FTB6MV5l+jRTLSSGvnh6rNyPWjZQIll35pdDBVEFIhH/dLuZCjw7wMEhCEPr1j
         +Eb/u9t7VerUhqv+V9MbJEUrkOq3Z6UVwyPE6Eno=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v3 41/46] media: rkisp1: Use fwnode_graph_for_each_endpoint
Date:   Mon, 11 Jul 2022 15:42:43 +0300
Message-Id: <20220711124248.2683-42-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
References: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
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

From: Paul Elder <paul.elder@ideasonboard.com>

When registering the notifier, replace the manual while loop with
fwnode_graph_for_each_endpoint. This simplifies error handling.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
---
 .../platform/rockchip/rkisp1/rkisp1-dev.c     | 44 +++++++++----------
 1 file changed, 20 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index c3a7ab70bbef..0eb37ba557ce 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -168,29 +168,28 @@ static const struct v4l2_async_notifier_operations rkisp1_subdev_notifier_ops =
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
@@ -198,14 +197,15 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
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
@@ -216,27 +216,23 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
 
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
Regards,

Laurent Pinchart

