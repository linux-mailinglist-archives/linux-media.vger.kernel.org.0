Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 227A24C8FC2
	for <lists+linux-media@lfdr.de>; Tue,  1 Mar 2022 17:12:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236011AbiCAQNN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Mar 2022 11:13:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232018AbiCAQNM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Mar 2022 11:13:12 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACCCE13CD4
        for <linux-media@vger.kernel.org>; Tue,  1 Mar 2022 08:12:30 -0800 (PST)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EBC431AD5;
        Tue,  1 Mar 2022 17:12:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646151144;
        bh=7fR4JzssU6ZybYXSvkIfq8QlK5WtaQGH821wAcaAfzo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pTQfx6pKEGqqH0mwXtfNEzWSSMxh5aUhdDidaa+pHc9cyAn29sa9+waVpY0hxdSmR
         kf75Dy1ZlCDRZzl2G3TCBg0PRIF605V4KQ6x0kNad+++0Tn0xCE+kbJcU0AYVod8tI
         PnfEbzeXRwtMxlEal3aQupcwp1WAaU/k1X4YZk6E=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v11 04/36] media: mc: Start walk from a specific pad in use count calculation
Date:   Tue,  1 Mar 2022 18:11:24 +0200
Message-Id: <20220301161156.1119557-5-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
References: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sakari Ailus <sakari.ailus@linux.intel.com>

With the addition of the recent has_route() media entity op, the pads of a
media entity are no longer all interconnected. This has to be taken into
account in power management.

Prepare for the addition of a helper function supporting S_ROUTING.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-mc.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
index cbeb580c6754..35d18ed89fa5 100644
--- a/drivers/media/v4l2-core/v4l2-mc.c
+++ b/drivers/media/v4l2-core/v4l2-mc.c
@@ -427,17 +427,16 @@ EXPORT_SYMBOL_GPL(v4l2_create_fwnode_links);
 
 /*
  * pipeline_pm_use_count - Count the number of users of a pipeline
- * @entity: The entity
+ * @pad: Any pad along the pipeline
  *
  * Return the total number of users of all video device nodes in the pipeline.
  */
-static int pipeline_pm_use_count(struct media_entity *entity,
-	struct media_graph *graph)
+static int pipeline_pm_use_count(struct media_pad *pad,
+				 struct media_graph *graph)
 {
-	struct media_pad *pad;
 	int use = 0;
 
-	media_graph_walk_start(graph, entity->pads);
+	media_graph_walk_start(graph, pad);
 
 	while ((pad = media_graph_walk_next(graph))) {
 		if (is_media_entity_v4l2_video_device(pad->entity))
@@ -483,7 +482,7 @@ static int pipeline_pm_power_one(struct media_entity *entity, int change)
 
 /*
  * pipeline_pm_power - Apply power change to all entities in a pipeline
- * @entity: The entity
+ * @pad: Any pad along the pipeline
  * @change: Use count change
  *
  * Walk the pipeline to update the use count and the power state of all non-node
@@ -491,16 +490,16 @@ static int pipeline_pm_power_one(struct media_entity *entity, int change)
  *
  * Return 0 on success or a negative error code on failure.
  */
-static int pipeline_pm_power(struct media_entity *entity, int change,
-	struct media_graph *graph)
+static int pipeline_pm_power(struct media_pad *pad, int change,
+			     struct media_graph *graph)
 {
-	struct media_pad *tmp_pad, *pad;
+	struct media_pad *tmp_pad, *first = pad;
 	int ret = 0;
 
 	if (!change)
 		return 0;
 
-	media_graph_walk_start(graph, entity->pads);
+	media_graph_walk_start(graph, pad);
 
 	while (!ret && (pad = media_graph_walk_next(graph)))
 		if (is_media_entity_v4l2_subdev(pad->entity))
@@ -509,7 +508,7 @@ static int pipeline_pm_power(struct media_entity *entity, int change,
 	if (!ret)
 		return ret;
 
-	media_graph_walk_start(graph, entity->pads);
+	media_graph_walk_start(graph, first);
 
 	while ((tmp_pad = media_graph_walk_next(graph)) && tmp_pad != pad)
 		if (is_media_entity_v4l2_subdev(tmp_pad->entity))
@@ -531,7 +530,7 @@ static int v4l2_pipeline_pm_use(struct media_entity *entity, unsigned int use)
 	WARN_ON(entity->use_count < 0);
 
 	/* Apply power change to connected non-nodes. */
-	ret = pipeline_pm_power(entity, change, &mdev->pm_count_walk);
+	ret = pipeline_pm_power(entity->pads, change, &mdev->pm_count_walk);
 	if (ret < 0)
 		entity->use_count -= change;
 
@@ -557,8 +556,8 @@ int v4l2_pipeline_link_notify(struct media_link *link, u32 flags,
 			      unsigned int notification)
 {
 	struct media_graph *graph = &link->graph_obj.mdev->pm_count_walk;
-	struct media_entity *source = link->source->entity;
-	struct media_entity *sink = link->sink->entity;
+	struct media_pad *source = link->source;
+	struct media_pad *sink = link->sink;
 	int source_use;
 	int sink_use;
 	int ret = 0;
-- 
2.25.1

