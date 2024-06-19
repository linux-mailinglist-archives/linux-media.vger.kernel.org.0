Return-Path: <linux-media+bounces-13632-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 646C490E09D
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 02:18:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E22F2841B3
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 00:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2976FC7;
	Wed, 19 Jun 2024 00:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XFW37RLX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB294405;
	Wed, 19 Jun 2024 00:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718756286; cv=none; b=FssIomviB3NWZnGhhnikKZn8v5owvUssjU0KOgk/2WrfC4OiQ+5sO0jwNI98V+LceXqgNdkhDByGRR9J+ejF3YPZ7t1kVDSGNzxPtLWZD7J56TxQNEz7C7/RCGRo8IUmw62wWhC17oRfYS6M/uNTZ0CIJJRJKKD9UpDt3YQCDAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718756286; c=relaxed/simple;
	bh=6CvoHvE2nLDnunH3nA7Mk6/3YgtGkl7basVXc2gquwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WUUxUO9KOvJjtd0711UaAEzeAv8DBSzT5nE6kmv98wgey6HZmiynuzF0iE5kJBL+DlQtQS111eNcI5sLj0UpFkFGuI4bvkgCDg+af2uLhHPXCMD/msbJ5AZ0Ys1PxQyKgG6F7LprNeoNhYhCY0A67HVLiQH1n0Tw0WCUyUc0Nas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XFW37RLX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 284081030;
	Wed, 19 Jun 2024 02:17:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718756260;
	bh=6CvoHvE2nLDnunH3nA7Mk6/3YgtGkl7basVXc2gquwU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XFW37RLXGJXTenwnBZf0DkCt/6Tlj9CtKz2mUuWw3PEFxU6Lt3PyRuLWzd4zKxAuz
	 LP5o1iyKcbIz1r75QbNvEjjduVDNbAtvihnkjFb7n9VvydP3zCPbh0WEDvEY1slznI
	 04Bm2Mwym9dk45cQShOHXAVb8oIgX7ze840XAbw4=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 10/19] media: renesas: vsp1: Replace vsp1_partition_window with v4l2_rect
Date: Wed, 19 Jun 2024 03:17:13 +0300
Message-ID: <20240619001722.9749-11-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240619001722.9749-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240619001722.9749-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vsp1_partition_window structure is used to store the horizontal size
of a partition window. This is all that is currently needed, as all
partitions span the whole image vertically. The horizontal window size
is retrieved in the .configure_partition() handler from the
vsp1_partition_window structure, and the vertical window size from the
subdev state.

Accessing the subdev state in the .configure_partition() handler is
problematic in the context of moving to the V4L2 subdev active state
API, as .configure_partition() is called in non-interruptable context,
and the state lock can't be taken. To avoid this, start by storing the
vertical size in the window, replacing the custom vsp1_partition_window
structure with a v4l2_rect. Retrieving the vertical size from the window
in .configure_partition() will be done in a subsequent change.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_entity.h |  3 +--
 .../media/platform/renesas/vsp1/vsp1_pipe.c   |  6 ++++--
 .../media/platform/renesas/vsp1/vsp1_pipe.h   | 21 +++++--------------
 .../media/platform/renesas/vsp1/vsp1_rpf.c    |  2 +-
 .../media/platform/renesas/vsp1/vsp1_sru.c    |  4 +++-
 .../media/platform/renesas/vsp1/vsp1_uds.c    | 10 ++++-----
 .../media/platform/renesas/vsp1/vsp1_wpf.c    |  2 +-
 7 files changed, 20 insertions(+), 28 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.h b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
index 7b86b2fef3e5..f67f60677644 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
@@ -19,7 +19,6 @@ struct vsp1_dl_body;
 struct vsp1_dl_list;
 struct vsp1_pipeline;
 struct vsp1_partition;
-struct vsp1_partition_window;
 
 enum vsp1_entity_type {
 	VSP1_ENTITY_BRS,
@@ -91,7 +90,7 @@ struct vsp1_entity_operations {
 	unsigned int (*max_width)(struct vsp1_entity *, struct vsp1_pipeline *);
 	void (*partition)(struct vsp1_entity *, struct vsp1_pipeline *,
 			  struct vsp1_partition *, unsigned int,
-			  struct vsp1_partition_window *);
+			  struct v4l2_rect *);
 };
 
 struct vsp1_entity {
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
index ac52ed8f65ba..f7701c5ff492 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
@@ -459,7 +459,7 @@ void vsp1_pipeline_propagate_alpha(struct vsp1_pipeline *pipe,
 static void vsp1_pipeline_propagate_partition(struct vsp1_pipeline *pipe,
 					      struct vsp1_partition *partition,
 					      unsigned int index,
-					      struct vsp1_partition_window *window)
+					      struct v4l2_rect *window)
 {
 	struct vsp1_entity *entity;
 
@@ -485,7 +485,7 @@ void vsp1_pipeline_calculate_partition(struct vsp1_pipeline *pipe,
 				       unsigned int index)
 {
 	const struct v4l2_mbus_framefmt *format;
-	struct vsp1_partition_window window;
+	struct v4l2_rect window;
 	unsigned int modulus;
 
 	/*
@@ -498,6 +498,8 @@ void vsp1_pipeline_calculate_partition(struct vsp1_pipeline *pipe,
 	/* Initialise the partition with sane starting conditions. */
 	window.left = index * div_size;
 	window.width = div_size;
+	window.top = 0;
+	window.height = format->height;
 
 	modulus = format->width % div_size;
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
index 3d2e35ac8fa0..c1f411227de7 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
@@ -53,17 +53,6 @@ enum vsp1_pipeline_state {
 	VSP1_PIPELINE_STOPPING,
 };
 
-/*
- * struct vsp1_partition_window - Partition window coordinates
- * @left: horizontal coordinate of the partition start in pixels relative to the
- *	  left edge of the image
- * @width: partition width in pixels
- */
-struct vsp1_partition_window {
-	unsigned int left;
-	unsigned int width;
-};
-
 /*
  * struct vsp1_partition - A description of a slice for the partition algorithm
  * @rpf: The RPF partition window configuration
@@ -73,11 +62,11 @@ struct vsp1_partition_window {
  * @wpf: The WPF partition window configuration
  */
 struct vsp1_partition {
-	struct vsp1_partition_window rpf[VSP1_MAX_RPF];
-	struct vsp1_partition_window uds_sink;
-	struct vsp1_partition_window uds_source;
-	struct vsp1_partition_window sru;
-	struct vsp1_partition_window wpf;
+	struct v4l2_rect rpf[VSP1_MAX_RPF];
+	struct v4l2_rect uds_sink;
+	struct v4l2_rect uds_source;
+	struct v4l2_rect sru;
+	struct v4l2_rect wpf;
 };
 
 /*
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
index 3b8a62299226..862751616646 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
@@ -366,7 +366,7 @@ static void rpf_partition(struct vsp1_entity *entity,
 			  struct vsp1_pipeline *pipe,
 			  struct vsp1_partition *partition,
 			  unsigned int partition_idx,
-			  struct vsp1_partition_window *window)
+			  struct v4l2_rect *window)
 {
 	struct vsp1_rwpf *rpf = to_rwpf(&entity->subdev);
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_sru.c b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
index 749ba7705000..8ce949de8d9a 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_sru.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
@@ -323,7 +323,7 @@ static void sru_partition(struct vsp1_entity *entity,
 			  struct vsp1_pipeline *pipe,
 			  struct vsp1_partition *partition,
 			  unsigned int partition_idx,
-			  struct vsp1_partition_window *window)
+			  struct v4l2_rect *window)
 {
 	struct vsp1_sru *sru = to_sru(&entity->subdev);
 	struct v4l2_mbus_framefmt *input;
@@ -337,6 +337,8 @@ static void sru_partition(struct vsp1_entity *entity,
 	if (input->width != output->width) {
 		window->width /= 2;
 		window->left /= 2;
+		window->height /= 2;
+		window->top /= 2;
 	}
 
 	partition->sru = *window;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_uds.c b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
index 737362ca2315..4a14fd3baac1 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_uds.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
@@ -363,16 +363,12 @@ static void uds_partition(struct vsp1_entity *entity,
 			  struct vsp1_pipeline *pipe,
 			  struct vsp1_partition *partition,
 			  unsigned int partition_idx,
-			  struct vsp1_partition_window *window)
+			  struct v4l2_rect *window)
 {
 	struct vsp1_uds *uds = to_uds(&entity->subdev);
 	const struct v4l2_mbus_framefmt *output;
 	const struct v4l2_mbus_framefmt *input;
 
-	/* Initialise the partition state. */
-	partition->uds_sink = *window;
-	partition->uds_source = *window;
-
 	input = v4l2_subdev_state_get_format(uds->entity.state, UDS_PAD_SINK);
 	output = v4l2_subdev_state_get_format(uds->entity.state,
 					      UDS_PAD_SOURCE);
@@ -381,6 +377,10 @@ static void uds_partition(struct vsp1_entity *entity,
 				  / output->width;
 	partition->uds_sink.left = window->left * input->width
 				 / output->width;
+	partition->uds_sink.height = input->height;
+	partition->uds_sink.top = 0;
+
+	partition->uds_source = *window;
 
 	*window = partition->uds_sink;
 }
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
index 80fe7571f4ff..f8d1e2f47691 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
@@ -515,7 +515,7 @@ static void wpf_partition(struct vsp1_entity *entity,
 			  struct vsp1_pipeline *pipe,
 			  struct vsp1_partition *partition,
 			  unsigned int partition_idx,
-			  struct vsp1_partition_window *window)
+			  struct v4l2_rect *window)
 {
 	partition->wpf = *window;
 }
-- 
Regards,

Laurent Pinchart


