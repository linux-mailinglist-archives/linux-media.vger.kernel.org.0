Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94B13652EA0
	for <lists+linux-media@lfdr.de>; Wed, 21 Dec 2022 10:34:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234567AbiLUJeB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Dec 2022 04:34:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234485AbiLUJdw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Dec 2022 04:33:52 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90DC5205F5
        for <linux-media@vger.kernel.org>; Wed, 21 Dec 2022 01:33:51 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1CC08505;
        Wed, 21 Dec 2022 10:33:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671615230;
        bh=5cyNXdGBU4EnrcRGBDr2Fwr5Nt2HrEiW39slSNlrkjM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BVt7XAhiIeT8xD+k9z0UZ8yZoBvkRWaNe6gGPxTHE1QijjYgK8RGSdsPEmdsEPwDw
         YY0zlFiVOWFtNzcFV1Dyc4PUteIdpXBBjiyT+WGZp+NJSB+uG05d3kI23dEEDa0E1k
         1epd69sPM/7AmWfXP0LwfvRON2RgHvxILy8fCY14=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v3 3/5] media: ti: omap3isp: Use media_pipeline_for_each_entity()
Date:   Wed, 21 Dec 2022 11:33:39 +0200
Message-Id: <20221221093341.7580-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20221221093341.7580-1-laurent.pinchart@ideasonboard.com>
References: <20221221093341.7580-1-laurent.pinchart@ideasonboard.com>
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

Replace usage of the deprecated media graph walk API with the new
media_pipeline_for_each_entity() macro.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v2:

- Fix compilation errors

Changes since v1:

- Initialize and cleanup the iterator
---
 drivers/media/platform/ti/omap3isp/ispvideo.c | 20 ++++++-------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
index 3e5348c63773..ddc7d08d4f96 100644
--- a/drivers/media/platform/ti/omap3isp/ispvideo.c
+++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
@@ -221,22 +221,16 @@ isp_video_remote_subdev(struct isp_video *video, u32 *pad)
 static int isp_video_get_graph_data(struct isp_video *video,
 				    struct isp_pipeline *pipe)
 {
-	struct media_graph graph;
-	struct media_entity *entity = &video->video.entity;
-	struct media_device *mdev = entity->graph_obj.mdev;
+	struct media_pipeline_entity_iter iter;
+	struct media_entity *entity;
 	struct isp_video *far_end = NULL;
 	int ret;
 
-	mutex_lock(&mdev->graph_mutex);
-	ret = media_graph_walk_init(&graph, mdev);
-	if (ret) {
-		mutex_unlock(&mdev->graph_mutex);
+	ret = media_pipeline_entity_iter_init(&pipe->pipe, &iter);
+	if (ret)
 		return ret;
-	}
 
-	media_graph_walk_start(&graph, entity);
-
-	while ((entity = media_graph_walk_next(&graph))) {
+	media_pipeline_for_each_entity(&pipe->pipe, &iter, entity) {
 		struct isp_video *__video;
 
 		media_entity_enum_set(&pipe->ent_enum, entity);
@@ -255,9 +249,7 @@ static int isp_video_get_graph_data(struct isp_video *video,
 			far_end = __video;
 	}
 
-	mutex_unlock(&mdev->graph_mutex);
-
-	media_graph_walk_cleanup(&graph);
+	media_pipeline_entity_iter_cleanup(&iter);
 
 	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
 		pipe->input = far_end;
-- 
Regards,

Laurent Pinchart

