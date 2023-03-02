Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 583BA6A7FA3
	for <lists+linux-media@lfdr.de>; Thu,  2 Mar 2023 11:08:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbjCBKIU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Mar 2023 05:08:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbjCBKIG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Mar 2023 05:08:06 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 457FA10CD
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 02:08:04 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F46356A;
        Thu,  2 Mar 2023 11:08:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677751682;
        bh=HV/5POmbIYTSuu9fFAfCd74pRWqSxFhTi6J41mluWaI=;
        h=From:To:Cc:Subject:Date:From;
        b=j16qi0wP0XC3TSEdb6nMJ6AWCAzie//k6RYU9s3bPT5N4otMdLSPfC46VugjbCSl+
         6+deZOUI07MROBXm4/0wHCKkXnEdOl1jRbtgOTXAuy3LZ8T1huBy8quxeOz9ZBdAf3
         k6QTRu/4bmRMYuntLwoH/dWbmNv3ZgXCxSEy1bPQ=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>,
        Vaishnav Achath <vaishnav.a@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 0/5] media: ti: cal: Streams support
Date:   Thu,  2 Mar 2023 12:07:50 +0200
Message-Id: <20230302100755.191164-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
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

Hi,

v2 can be found from:

https://lore.kernel.org/all/20230228171620.330978-1-tomi.valkeinen@ideasonboard.com/

This series is based on Laurent's "media: Zero-initialize structures
passed to subdev pad ops" series and my two patches adding
V4L2_SUBDEV_ROUTING_* flags (v1 of that series).

Only minor changes in v3. Diff to v2 included below.

 Tomi

Tomi Valkeinen (5):
  media: ti: cal: Clean up mbus formats uses
  media: ti: cal: Fix cal_camerarx_create() error handling
  media: ti: cal: Use subdev state
  media: ti: cal: Implement get_frame_desc for camera-rx
  media: ti: cal: Add multiplexed streams support

 drivers/media/platform/ti/cal/cal-camerarx.c | 415 ++++++++++++-------
 drivers/media/platform/ti/cal/cal-video.c    | 142 +++++--
 drivers/media/platform/ti/cal/cal.c          | 109 +++--
 drivers/media/platform/ti/cal/cal.h          |  13 +-
 4 files changed, 416 insertions(+), 263 deletions(-)

Interdiff against v2:
diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
index 8e373c817cdf..957aefcacbbc 100644
--- a/drivers/media/platform/ti/cal/cal-camerarx.c
+++ b/drivers/media/platform/ti/cal/cal-camerarx.c
@@ -899,7 +899,7 @@ static int cal_camerarx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 		goto out_unlock;
 
 	if (remote_desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
-		dev_err(phy->cal->dev,
+		cal_err(phy->cal,
 			"Frame descriptor does not describe CSI-2 link");
 		ret = -EINVAL;
 		goto out_unlock;
@@ -911,6 +911,8 @@ static int cal_camerarx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 	}
 
 	if (i == remote_desc.num_entries) {
+		cal_err(phy->cal, "Stream %u not found in remote frame desc\n",
+			sink_stream);
 		ret = -EINVAL;
 		goto out_unlock;
 	}
@@ -960,7 +962,7 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 	unsigned int i;
 	int ret;
 
-	phy = kzalloc(sizeof(*phy), GFP_KERNEL);
+	phy = devm_kzalloc(cal->dev, sizeof(*phy), GFP_KERNEL);
 	if (!phy)
 		return ERR_PTR(-ENOMEM);
 
@@ -976,8 +978,7 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 	phy->base = devm_ioremap_resource(cal->dev, phy->res);
 	if (IS_ERR(phy->base)) {
 		cal_err(cal, "failed to ioremap\n");
-		ret = PTR_ERR(phy->base);
-		goto err_entity_cleanup;
+		return ERR_CAST(phy->base);
 	}
 
 	cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
@@ -985,11 +986,11 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 
 	ret = cal_camerarx_regmap_init(cal, phy);
 	if (ret)
-		goto err_entity_cleanup;
+		return ERR_PTR(ret);
 
 	ret = cal_camerarx_parse_dt(phy);
 	if (ret)
-		goto err_entity_cleanup;
+		return ERR_PTR(ret);
 
 	/* Initialize the V4L2 subdev and media entity. */
 	sd = &phy->subdev;
@@ -1006,7 +1007,7 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 	ret = media_entity_pads_init(&sd->entity, ARRAY_SIZE(phy->pads),
 				     phy->pads);
 	if (ret)
-		goto err_entity_cleanup;
+		goto err_node_put;
 
 	ret = v4l2_subdev_init_finalize(sd);
 	if (ret)
@@ -1022,7 +1023,9 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 	v4l2_subdev_cleanup(sd);
 err_entity_cleanup:
 	media_entity_cleanup(&phy->subdev.entity);
-	kfree(phy);
+err_node_put:
+	of_node_put(phy->source_ep_node);
+	of_node_put(phy->source_node);
 	return ERR_PTR(ret);
 }
 
@@ -1036,5 +1039,4 @@ void cal_camerarx_destroy(struct cal_camerarx *phy)
 	media_entity_cleanup(&phy->subdev.entity);
 	of_node_put(phy->source_ep_node);
 	of_node_put(phy->source_node);
-	kfree(phy);
 }
diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
index 983323a109ac..26ea9134f8ed 100644
--- a/drivers/media/platform/ti/cal/cal.c
+++ b/drivers/media/platform/ti/cal/cal.c
@@ -76,7 +76,7 @@ const struct cal_format_info cal_formats[] = {
 		.code		= MEDIA_BUS_FMT_VYUY8_1X16,
 		.bpp		= 16,
 	}, {
-		.fourcc		= V4L2_PIX_FMT_RGB565, /* gggbbbbb rrrrrggg */
+		.fourcc		= V4L2_PIX_FMT_RGB565,
 		.code		= MEDIA_BUS_FMT_RGB565_1X16,
 		.bpp		= 16,
 	}, {

base-commit: 83e0f265aa8d0e37cc8e15d318b64da0ec03ff41
prerequisite-patch-id: e800a6da6afee40be8a946ccf63518f6109749dd
prerequisite-patch-id: eb409cc6ffb895128d98b3fa664dcdcafd5e7dfc
prerequisite-patch-id: dedc1c09e4cff1dc58ce909e469bae30a3778a07
prerequisite-patch-id: 1e85d833252748e723b59f90788019fdeca92884
prerequisite-patch-id: bb4f7477e206ed1936e4632e7baa6514f7d957f4
-- 
2.34.1

