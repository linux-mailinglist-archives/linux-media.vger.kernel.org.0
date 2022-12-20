Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BACC6522CE
	for <lists+linux-media@lfdr.de>; Tue, 20 Dec 2022 15:37:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234085AbiLTOhH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Dec 2022 09:37:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234118AbiLTOhB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Dec 2022 09:37:01 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC460DF41
        for <linux-media@vger.kernel.org>; Tue, 20 Dec 2022 06:36:52 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5CF9C824;
        Tue, 20 Dec 2022 15:36:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671547011;
        bh=Fb7MdxaJgeTT0M/4OXoCGOHM2BX75ZiaDp5rK0PuQ3I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wozuu6LaI2dkU4a5kHB5SP2+neeeduSRNAi+C4n+BoWh3hqK1z2GCl3qPK61r02BB
         5oMMmEXmFTVZq+8OtgGFB4KTN9uc4OdHKrjJb/MiPlBPExpy2N5oR/CGpHj1jZ61nz
         uWs3fW4YJ7sRYu0YLetnpBeF9cqrcXtI3H+VRl9Q=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 3/5] media: ti: omap3isp: Use media_pipeline_for_each_entity()
Date:   Tue, 20 Dec 2022 16:36:37 +0200
Message-Id: <20221220143639.764-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20221220143639.764-1-laurent.pinchart@ideasonboard.com>
References: <20221220143639.764-1-laurent.pinchart@ideasonboard.com>
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
Changes since v1:

- Initialize and cleanup the iterator
---
 drivers/media/platform/ti/omap3isp/ispvideo.c | 20 ++++++-------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
index 3e5348c63773..f1eeca36674f 100644
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
+	media_pipeline_entity_iter_init(&iter);
 
 	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
 		pipe->input = far_end;
-- 
Regards,

Laurent Pinchart

