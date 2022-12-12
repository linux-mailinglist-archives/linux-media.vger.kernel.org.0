Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF15664A301
	for <lists+linux-media@lfdr.de>; Mon, 12 Dec 2022 15:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232412AbiLLOQf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Dec 2022 09:16:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232348AbiLLOQd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Dec 2022 09:16:33 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C0ACDF65
        for <linux-media@vger.kernel.org>; Mon, 12 Dec 2022 06:16:32 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A5FA0FDB;
        Mon, 12 Dec 2022 15:16:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670854590;
        bh=CVN+SAjhfkESHugF2VhS5NJMBr72vznWLvxYIzY8Quk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Boa0Zt9eXzddB0O1gg/xmAT1y8y/DdaKd8nbOb6EmDYGL5yWLIyF0pkRHzM0/MZb3
         ch4buYILZHKS7V0QaZp9SPmjae+uPZhUzF/5YPWoPiD9XJjsR4EI3j37MVtQKdCgT0
         SeQcPjj50Kzd8v6kk0h+OcnNqL0XMWR+Q8XURvq0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v1 5/5] media: xilinx: dma: Use media_pipeline_for_each_pad()
Date:   Mon, 12 Dec 2022 16:16:21 +0200
Message-Id: <20221212141621.724-6-laurent.pinchart@ideasonboard.com>
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
media_pipeline_for_each_pad() macro.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/xilinx/xilinx-dma.c | 28 +++++-----------------
 1 file changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
index 0a7fd8642a65..fee02c8c85fd 100644
--- a/drivers/media/platform/xilinx/xilinx-dma.c
+++ b/drivers/media/platform/xilinx/xilinx-dma.c
@@ -173,31 +173,19 @@ static int xvip_pipeline_set_stream(struct xvip_pipeline *pipe, bool on)
 static int xvip_pipeline_validate(struct xvip_pipeline *pipe,
 				  struct xvip_dma *start)
 {
-	struct media_graph graph;
-	struct media_entity *entity = &start->video.entity;
-	struct media_device *mdev = entity->graph_obj.mdev;
+	struct media_pipeline_pad_iter iter;
 	unsigned int num_inputs = 0;
 	unsigned int num_outputs = 0;
-	int ret;
+	struct media_pad *pad;
 
-	mutex_lock(&mdev->graph_mutex);
-
-	/* Walk the graph to locate the video nodes. */
-	ret = media_graph_walk_init(&graph, mdev);
-	if (ret) {
-		mutex_unlock(&mdev->graph_mutex);
-		return ret;
-	}
-
-	media_graph_walk_start(&graph, entity);
-
-	while ((entity = media_graph_walk_next(&graph))) {
+	/* Locate the video nodes in the pipeline. */
+	media_pipeline_for_each_pad(&pipe->pipe, &iter, pad) {
 		struct xvip_dma *dma;
 
-		if (entity->function != MEDIA_ENT_F_IO_V4L)
+		if (pad->entity->function != MEDIA_ENT_F_IO_V4L)
 			continue;
 
-		dma = to_xvip_dma(media_entity_to_video_device(entity));
+		dma = to_xvip_dma(media_entity_to_video_device(pad->entity));
 
 		if (dma->pad.flags & MEDIA_PAD_FL_SINK) {
 			pipe->output = dma;
@@ -207,10 +195,6 @@ static int xvip_pipeline_validate(struct xvip_pipeline *pipe,
 		}
 	}
 
-	mutex_unlock(&mdev->graph_mutex);
-
-	media_graph_walk_cleanup(&graph);
-
 	/* We need exactly one output and zero or one input. */
 	if (num_outputs != 1 || num_inputs > 1)
 		return -EPIPE;
-- 
Regards,

Laurent Pinchart

