Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2797664A2FF
	for <lists+linux-media@lfdr.de>; Mon, 12 Dec 2022 15:16:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232339AbiLLOQc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Dec 2022 09:16:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231335AbiLLOQa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Dec 2022 09:16:30 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7128EDF65
        for <linux-media@vger.kernel.org>; Mon, 12 Dec 2022 06:16:29 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D8C658E1;
        Mon, 12 Dec 2022 15:16:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670854588;
        bh=29wFBnrdoFv18LGiDW90q1dpjhd53Z3zNgXc9O8t4Uk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D5DTgn3qsLy3pNstQtbpnfK7coz1xpv3APCHCZJ4O6pH0/HvxgWMQzhKBguiX7aNv
         B2pVt7imqCnXxQnXVjOyoZtkLZkfaxNGmuf7flPi0yQwvzyPtqA9zLoLLWMubvxCy0
         crGTpxcwqOAxxxQo6HPbkAZbe3XJpE4ME+AeYmVM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v1 3/5] media: ti: omap3isp: Use media_pipeline_for_each_entity()
Date:   Mon, 12 Dec 2022 16:16:19 +0200
Message-Id: <20221212141621.724-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221212141621.724-1-laurent.pinchart@ideasonboard.com>
References: <20221212141621.724-1-laurent.pinchart@ideasonboard.com>
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
 drivers/media/platform/ti/omap3isp/ispvideo.c | 21 +++----------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
index 3e5348c63773..aa81b5564b4f 100644
--- a/drivers/media/platform/ti/omap3isp/ispvideo.c
+++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
@@ -221,22 +221,11 @@ isp_video_remote_subdev(struct isp_video *video, u32 *pad)
 static int isp_video_get_graph_data(struct isp_video *video,
 				    struct isp_pipeline *pipe)
 {
-	struct media_graph graph;
-	struct media_entity *entity = &video->video.entity;
-	struct media_device *mdev = entity->graph_obj.mdev;
+	struct media_pipeline_entity_iter iter;
+	struct media_entity *entity;
 	struct isp_video *far_end = NULL;
-	int ret;
 
-	mutex_lock(&mdev->graph_mutex);
-	ret = media_graph_walk_init(&graph, mdev);
-	if (ret) {
-		mutex_unlock(&mdev->graph_mutex);
-		return ret;
-	}
-
-	media_graph_walk_start(&graph, entity);
-
-	while ((entity = media_graph_walk_next(&graph))) {
+	media_pipeline_for_each_entity(&pipe->pipe, &iter, entity) {
 		struct isp_video *__video;
 
 		media_entity_enum_set(&pipe->ent_enum, entity);
@@ -255,10 +244,6 @@ static int isp_video_get_graph_data(struct isp_video *video,
 			far_end = __video;
 	}
 
-	mutex_unlock(&mdev->graph_mutex);
-
-	media_graph_walk_cleanup(&graph);
-
 	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
 		pipe->input = far_end;
 		pipe->output = video;
-- 
Regards,

Laurent Pinchart

