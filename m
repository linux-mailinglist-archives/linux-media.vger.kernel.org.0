Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6383354BA4D
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 21:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357554AbiFNTO2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 15:14:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245409AbiFNTO2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 15:14:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED8F0167E1
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 12:14:26 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240126034.bbtec.net [36.240.126.34])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 54DAA825;
        Tue, 14 Jun 2022 21:14:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655234065;
        bh=EjpFD5LtcGNQ0Nr3GRZflMgD+UClVA3ZnxbDe9i0nuk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=k4b9Tph4+C7tcUWqTlktTtm3IZDVMgLO3F+uX7CYt4uXhCBhIChHZ6hhiyKVSBJVi
         JFo19fy3fo2RO0hqOVX/kRwTAMUeDPgzyycSDKYKssNrFP0m1hfqvzckQq+q1ecpCg
         LHBO8iJyHrcrSTGRfU6uqA70fyQnpPelS0KNsUxI=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 39/55] media: rkisp1: isp: Disallow multiple active sources
Date:   Wed, 15 Jun 2022 04:11:11 +0900
Message-Id: <20220614191127.3420492-40-paul.elder@ideasonboard.com>
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

The ISP supports multiple source subdevs, but can only capture from a
single one at a time. The source is selected through link setup. The
driver finds the active source in its .s_stream() handler using the
media_entity_remote_pad() function. This fails to reject invalid
configurations with multiple active sources. Fix it by using the
media_entity_remote_source_pad() helper instead, and inline
rkisp1_isp_get_source() in rkisp1_isp_s_stream() as the function is
small and has a single caller.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 28 ++++++++-----------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 627b1ad3bf26..5afb8be311c7 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -58,20 +58,6 @@
  * Helpers
  */
 
-static struct v4l2_subdev *rkisp1_isp_get_source(struct v4l2_subdev *sd)
-{
-	struct media_pad *local, *remote;
-	struct media_entity *sensor_me;
-
-	local = &sd->entity.pads[RKISP1_ISP_PAD_SINK_VIDEO];
-	remote = media_entity_remote_pad(local);
-	if (!remote)
-		return NULL;
-
-	sensor_me = remote->entity;
-	return media_entity_to_v4l2_subdev(sensor_me);
-}
-
 static struct v4l2_mbus_framefmt *
 rkisp1_isp_get_pad_fmt(struct rkisp1_isp *isp,
 		       struct v4l2_subdev_state *sd_state,
@@ -743,6 +729,7 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 	struct rkisp1_isp *isp = to_rkisp1_isp(sd);
 	struct rkisp1_device *rkisp1 = isp->rkisp1;
 	const struct rkisp1_sensor_async *asd;
+	struct media_pad *source_pad;
 	int ret;
 
 	if (!enable) {
@@ -754,10 +741,17 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 		return 0;
 	}
 
-	rkisp1->source = rkisp1_isp_get_source(sd);
+	source_pad = media_pad_remote_pad(&isp->pads[RKISP1_ISP_PAD_SINK_VIDEO]);
+	if (IS_ERR(source_pad)) {
+		dev_dbg(rkisp1->dev, "Failed to get source for ISP: %ld\n",
+			PTR_ERR(source_pad));
+		return -EPIPE;
+	}
+
+	rkisp1->source = media_entity_to_v4l2_subdev(source_pad->entity);
 	if (!rkisp1->source) {
-		dev_warn(rkisp1->dev, "No link between isp and source\n");
-		return -ENODEV;
+		/* This should really not happen, so is not worth a message. */
+		return -EPIPE;
 	}
 
 	asd = container_of(rkisp1->source->asd, struct rkisp1_sensor_async,
-- 
2.30.2

