Return-Path: <linux-media+bounces-706-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EACA7F3CE0
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 05:31:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2A52B21E33
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 04:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08EFC1642F;
	Wed, 22 Nov 2023 04:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="E9ooZnBO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFD0CD47;
	Tue, 21 Nov 2023 20:30:30 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 732491853;
	Wed, 22 Nov 2023 05:29:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700627390;
	bh=Um9aucfFNul1zpfUKLKL/cXMMvEVVYAKZLsznhoOVEU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E9ooZnBOBF/odYSd48SLdw8MJicDso8LYWkIm8vP8auDB36gG5u6sCBMwk2ULiOUS
	 aOjDqAsGTQj4k9t0EOAHBm9IrkFbDvuOp6ptyLaFOH6ffaEwX64mvWVmsk/fdm4u0d
	 nmjVngwKDbq7wCxn/lhYebiUujCeg9AX91uPOHHY=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [RFC PATCH v1 13/19] media: renesas: vsp1: Compute partitions for DRM pipelines
Date: Wed, 22 Nov 2023 06:30:03 +0200
Message-ID: <20231122043009.2741-14-laurent.pinchart+renesas@ideasonboard.com>
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

The DRM pipelines don't partition frames, as the hardware operates
synchronously with the display. The entity operations access
configuration data from the entity state in that case, instead of
accessing the partition structure. This requires special cases in
entity-specific code, increasing the driver complexity.

To prepare for simplifying the code, initialize a single partition for
the DRM pipelines, similarly to how video pipelines create one partition
spanning the full image when partitioning isn't needed. The partition is
allocated statically in the vsp1_drm_pipeline structure instead of
dynamically as for video pipelines, as DRM pipelines are guaranteed to
operate on a single partition.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_drm.c | 9 ++++++++-
 drivers/media/platform/renesas/vsp1/vsp1_drm.h | 2 ++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
index e44359b661b6..11313e26a298 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
@@ -550,6 +550,9 @@ static void vsp1_du_pipeline_configure(struct vsp1_pipeline *pipe)
 	struct vsp1_dl_body *dlb;
 	unsigned int dl_flags = 0;
 
+	vsp1_pipeline_calculate_partition(pipe, &pipe->part_table[0],
+					  drm_pipe->width, 0);
+
 	if (drm_pipe->force_brx_release)
 		dl_flags |= VSP1_DL_FRAME_END_INTERNAL;
 	if (pipe->output->writeback)
@@ -573,7 +576,8 @@ static void vsp1_du_pipeline_configure(struct vsp1_pipeline *pipe)
 		vsp1_entity_route_setup(entity, pipe, dlb);
 		vsp1_entity_configure_stream(entity, pipe, dl, dlb);
 		vsp1_entity_configure_frame(entity, pipe, dl, dlb);
-		vsp1_entity_configure_partition(entity, pipe, NULL, dl, dlb);
+		vsp1_entity_configure_partition(entity, pipe,
+						&pipe->part_table[0], dl, dlb);
 	}
 
 	vsp1_dl_list_commit(dl, dl_flags);
@@ -968,6 +972,9 @@ int vsp1_drm_init(struct vsp1_device *vsp1)
 
 		vsp1_pipeline_init(pipe);
 
+		pipe->partitions = 1;
+		pipe->part_table = &drm_pipe->partition;
+
 		pipe->frame_end = vsp1_du_pipeline_frame_end;
 
 		/*
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.h b/drivers/media/platform/renesas/vsp1/vsp1_drm.h
index ab8b7e3161a2..3fd95b53f27e 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.h
@@ -20,6 +20,7 @@
 /**
  * struct vsp1_drm_pipeline - State for the API exposed to the DRM driver
  * @pipe: the VSP1 pipeline used for display
+ * @partition: the pre-calculated partition used by the pipeline
  * @width: output display width
  * @height: output display height
  * @force_brx_release: when set, release the BRx during the next reconfiguration
@@ -31,6 +32,7 @@
  */
 struct vsp1_drm_pipeline {
 	struct vsp1_pipeline pipe;
+	struct vsp1_partition partition;
 
 	unsigned int width;
 	unsigned int height;
-- 
Regards,

Laurent Pinchart


