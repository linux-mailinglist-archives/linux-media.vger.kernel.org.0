Return-Path: <linux-media+bounces-704-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E567F3CDB
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 05:31:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14249B21DAC
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 04:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B863D2E6;
	Wed, 22 Nov 2023 04:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Lf2qFaLi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB38310C;
	Tue, 21 Nov 2023 20:30:25 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F71DB90;
	Wed, 22 Nov 2023 05:29:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700627386;
	bh=C1pOZr01MdHEuta29ar0OD1R9HZAI0Zn6BbG8M4l7tU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lf2qFaLiCaz9DPmKRvyMH12RG9B+iWsTI3uzKHVJQ429bLb219u8vnWQ9+W7I7mPH
	 mcDPqmBSNQ0Czy6tdgfF5bhXwjdirb9aI8deYCc9mg+fnSgfvwhKWjtDwFFPJRfGwy
	 IWTj1jIoLxD+z7Bs9N7tWddXPyrgZS7RW1f8v0ZE=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [RFC PATCH v1 10/19] media: renesas: vsp1: Replace vsp1_partition_window with v4l2_rect
Date: Wed, 22 Nov 2023 06:30:00 +0200
Message-ID: <20231122043009.2741-11-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231122043009.2741-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20231122043009.2741-1-laurent.pinchart+renesas@ideasonboard.com>
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
index ca6817f45dd2..8eba3cda1e3d 100644
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
index 2c67aae0d5fd..f35187daa643 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_sru.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
@@ -324,7 +324,7 @@ static void sru_partition(struct vsp1_entity *entity,
 			  struct vsp1_pipeline *pipe,
 			  struct vsp1_partition *partition,
 			  unsigned int partition_idx,
-			  struct vsp1_partition_window *window)
+			  struct v4l2_rect *window)
 {
 	struct vsp1_sru *sru = to_sru(&entity->subdev);
 	struct v4l2_mbus_framefmt *input;
@@ -339,6 +339,8 @@ static void sru_partition(struct vsp1_entity *entity,
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


