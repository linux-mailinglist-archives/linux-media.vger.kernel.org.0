Return-Path: <linux-media+bounces-16619-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB8F95C035
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 23:25:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0A511F24DC6
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 21:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C811D27A2;
	Thu, 22 Aug 2024 21:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="F7tx5Bkw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B67D1D2786;
	Thu, 22 Aug 2024 21:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724361897; cv=none; b=NZ+IUjsBavKAgaaGSeOwsrb773PXEfUkP90DD2+lD4N6d/ACGToOgE9/bYaNoK+DBXoaYkh4NUSNl1MXT1j6Gvw5VCOCTAd4mXO6smAKVcJQdulEjgrlUg/ncWdNCzaba+YaUn6MevZMw4kgGqqGje7TsQxVA5RKN9ScS0BDAc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724361897; c=relaxed/simple;
	bh=Fg3t36x269QHlBrOe4bqDhBNl9hAksoC9EJEki1/ZWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cmSJBJHYhz1AhRAig45Lsy2UPFyIERu6b7ovs9BKnSL4L706AUX15neAMbsyvEFUzCKBCnFXD7Rme8rPOziqQAvkRqOMpapzOEF6qoGFCmL/4vJmEy0V1hwqzVDteYKUHIT/fS9tR+6aKECMSMAp0eA/A2iEyfyHTZDOAKsWhnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=F7tx5Bkw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8826C8D0;
	Thu, 22 Aug 2024 23:23:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724361829;
	bh=Fg3t36x269QHlBrOe4bqDhBNl9hAksoC9EJEki1/ZWs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F7tx5Bkw2cqcC6VarMHQZpvBRmrH47dxm9rXHhD4TJB3jXIjZsYxTv8hge1zUxuI4
	 J4HJqFWVBn+QrakTlLOrgfkG4Vxp7+5sTjPP1psA5YuocGlo19SFGMnJFOuvrHtw5g
	 VxOQFEkKakzwoYe5ZU2kn5SoJLj0fghr740WsGYc=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 3/4] media: vsp1: Switch to the new pipeline iterators
Date: Fri, 23 Aug 2024 00:24:42 +0300
Message-ID: <20240822212445.2037-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240822212445.2037-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240822212445.2037-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the soon to be deprecated graph walk API with the more efficient
iterator over entities in the media pipeline.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_video.c    | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index f0288968bd55..0c6152f73126 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -439,21 +439,16 @@ static int vsp1_video_pipeline_build_branch(struct vsp1_pipeline *pipe,
 static int vsp1_video_pipeline_build(struct vsp1_pipeline *pipe,
 				     struct vsp1_video *video)
 {
-	struct media_graph graph;
-	struct media_entity *entity = &video->video.entity;
-	struct media_device *mdev = entity->graph_obj.mdev;
+	struct media_pipeline_entity_iter iter;
+	struct media_entity *entity;
 	struct list_head *cursor;
 	unsigned int i;
 	int ret;
 
-	/* Walk the graph to locate the entities and video nodes. */
-	ret = media_graph_walk_init(&graph, mdev);
-	if (ret)
-		return ret;
+	/* Iterate over the pipeline to locate the entities and video nodes. */
+	media_pipeline_entity_iter_init(&pipe->pipe, &iter);
 
-	media_graph_walk_start(&graph, entity);
-
-	while ((entity = media_graph_walk_next(&graph))) {
+	media_pipeline_for_each_entity(&pipe->pipe, &iter, entity) {
 		struct v4l2_subdev *subdev;
 		struct vsp1_rwpf *rwpf;
 		struct vsp1_entity *e;
@@ -501,7 +496,7 @@ static int vsp1_video_pipeline_build(struct vsp1_pipeline *pipe,
 		}
 	}
 
-	media_graph_walk_cleanup(&graph);
+	media_pipeline_entity_iter_cleanup(&iter);
 
 	/* We need one output and at least one input. */
 	if (pipe->num_inputs == 0 || !pipe->output)
-- 
Regards,

Laurent Pinchart


